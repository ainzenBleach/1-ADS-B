var express = require("express");
var router = express.Router();

var apiarioSetorController = require("../controllers/apiarioSetorController");

router.get("/carregarApiarioSetor/:idUsuario", function (req, res) {

    apiarioSetorController.carregarApiario(req, res);
})

router.get("/carregarApiarioTemperatura/:idUsuario", function (req, res) {
    apiarioSetorController.carregarApiarioTemp(req, res);
})

router.get("/carregarSetorAlerta/:idUsuario", function (req, res) {
    apiarioSetorController.carregarSetorAlerta(req, res);
}
)
router.get("/carregarAlertas/:idUsuario", function (req, res) {
    apiarioSetorController.carregarAlerta15dias(req, res);
})

router.get("/carregarKPIMensal/:idUsuario", function (req, res) {
    apiarioSetorController.carregarAlertaMensal(req, res);
})
router.get("/puxarHistorico/:apiario", function (req, res) {
    apiarioSetorController.puxarHistorico(req, res);
})

router.get("/apiarioAtivos/:idUsuario", function (req, res) {
    apiarioSetorController.apiarioAtivos(req, res);
})

router.get("/TemperturaAtualApiario/:idApiario/:idUsuario", function (req, res) {
    apiarioSetorController.TemperturaAtualApiario(req, res);
})

router.get("/TemperturaMediaApiario/:idApiario/:idUsuario", function (req, res) {
    apiarioSetorController.TemperturaMediaApiario(req, res);
})

router.get("/TotalAlertas/:idApiario", function (req, res) {
    apiarioSetorController.TotalAlertas(req, res);
})
router.get("/HistoricoTemperatura/:idApiario/:idUsuario", function (req, res) {
    apiarioSetorController.HistoricoTemperatura(req, res);
})



module.exports = router;