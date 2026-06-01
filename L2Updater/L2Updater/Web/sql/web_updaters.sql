SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `web_updaters`
-- ----------------------------
CREATE TABLE `web_updaters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` text CHARACTER SET utf8 NOT NULL,
  `texto` text CHARACTER SET utf8 NOT NULL,
  `data` text CHARACTER SET utf8 NOT NULL,
  `administrador` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of web_updaters
-- ----------------------------
INSERT INTO `web_updaters` VALUES ('1', 'Teste', 'texto AQUI', '31/07/2016 - 00:19:29 amm', '[ADM] - Brasil');
INSERT INTO `web_updaters` VALUES ('2', 'texte2', 'texto AQUI 2 ', '29/07/2016 - 00:19:29 am', '[ADM] - Brasil');
