import DataType from "sequelize";
export const Billet = (sequelize) => {
    return sequelize.define('billet', {
        id_billet:{
            field:'id_billet',
            type: DataType.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        dateBillet: {
            field: 'dateBillet',
            type: DataType.DATEONLY
        },
        prix: {
            field: 'prix',
            type: DataType.SMALLINT
        }
    }, {
        tableName: 'billet',
        timestamps: false
    })
}