

class CompteRepository{

    constructor(dao) {
        this.dao = dao;
    }

    async createTable(){
        const sql =`CREATE TABLE COMPTE(
                         idCompte SERIAL NOT NULL,
                         identifiant VARCHAR(50),
                         mdp VARCHAR(50),
                         mail VARCHAR(50),
                         nom VARCHAR(50),
                         role VARCHAR(50),
                         prenom VARCHAR(50),
                         PRIMARY KEY(idCompte)
                         );`;
        return this.dao.run(sql, "COMPTE tables OK");
    }


    async initTable(){

        //Scipt SQL ?


    }

    async countCompte(){
        let sql = `SELECT count(*) FROM COMPTE`;
        let rows = await this.dao.get(sql);
        return rows.count;
    }

    async getAllCompte(){
        let sql = `SELECT * FROM COMPTE`;
        return await this.dao.all(sql);
    }

    async getByIdCompte(id){
        let params = [id];
        let sql = "SELECT identifiant,mdp , mail,nom,role,prenom FROM COMPTE WHERE idCompte=$1";
        return await this.dao.get(sql, params);
    }

    async deleteCompte(id) {
        let params = [id];
        let sql = 'DELETE FROM COMPTE WHERE idCompte=$1';
        return await this.dao.delete(sql, params);
    }

    async updateCompte(id,identifiant,mdp,mail,nom,role){
        let params = [id,identifiant,mdp,mail,nom,role];
        let sql = `UPDATE COMPTE SET identifiant=$2, mdp=$3, mail=$4, nom=$5, role=$6
                        WHERE idCompte=$1`;
        return await this.dao.get(sql,params);
    }




}

module.exports = CompteRepository;

