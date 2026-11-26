Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710821;
	b=K9R4Do8og26m3MCP94NDcEY3Rn798Cae2Y8L+IrH0rBU1Y69BmlJLX9wNZb/3MYJ61xq
	 t8XydCO/tzRqMhcyvSeNYAqI9aFXj10jzVl+DEpLcEeXlFVG90DtyozmaojUigiezGD2v
	 0WnCkaSh8q01CIXbJlGSYUjnv9tmi2PUWo0VQw1Rzycnj62fPl3qSk4kfejPHgGMwxymW
	 Y7bdtgqe9wlLeOSev4kcDeD7xkVMq8LUTmrN5ClVkD+a75bPWP4b25Qbfsuse8fYadwo/
	 /7MbXgnfLJrTwFKnhvauNCAuk0JzIcPcJKtUP9OvqA5ejmDzGnwTm6LoibsPWzigNqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710821;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
	b=Me5XvsyouLTWSQMN5nDDBFUVGfzQbagJoleDDKDnZRpe7yPldOnyEbLWh9/4xHsowmf4
	 kIjEvTj080yS9gwkmVosImG8neDmv9US37lftHYbVLgG7Wlm7w1ntQI/0jqVM45xqV339
	 ODq4COm6G6X25ljjgvrH5Ca3jobxAzioh2+S/pkL4R00/GAN7RmUSvDfBxjbuWri7G08b
	 hW/5JcYcNKwuy7X2FoJQT7aU+bs14dW0h4OyECgYcu8+n8yi80bnnk1XBVCTcWPJovOxX
	 AnIaIGRDj9VJSQpVU8MQKEneXDG+i9M33Z2VxlQGT8nA5N5GAIBGbtEOFYGmd0GA4OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="kvzGya/S";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.65
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013065.outbound.protection.outlook.com [52.101.83.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10716606A32C;
	Thu, 26 Nov 2026 16:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10716606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kvzGya/S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INS02Ie7g55EMxYdAw95e7ObPlNIWZWKZetg7a3bsm+pDKCR1yxE/185aM4F4CEpjW64qv5DQy/bSDGCd3aiQPIi9xaVQaDg5SaleouwyD3M5AC0kFPy8RmN6gmqhIoWQtIBtXWuU/IsQ8JKor4m6XBGtXfs3r7W4faRUL2iq3JwIi9/2mjDvC8bxNjEraHHtpsuVc/Wdepe7t1Y+Wp6sljUlnBl4gDCCInYhjQYJpSI30RYzwDRoqdqWnvgbuwzV6ZYIgiTsWM5q6eQKxNoDlbCjFwe9M5kZvG7gkJZz/1LbCOR4RUQPAOuOVK+SLUDXBM03jAe1ZsajQZ5GfIzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
 b=k1XxXAr4o4WbzY9GMnMEx9T/Zvb6pvRbeV3mjRU2ZYI6dkpVvzE47wuJt97n4KGO5kJOcPF5tZOniSVzMJQc7ogdwir0W3IiB8Sc5A0DS9nx6624qus/YGXmi+axcNNuqCClLjHSeNCPhR311dve43lwwKcDRwMYpy+Y2Ycy1ofx+559yUa0bE94pFKNudqItklZF7DmmfbqrFeOXIEM7scHpXny+ekKbpPGp8hyO/i7y1q5EaHKw2T5HTX2zDTG8Lu0ppTarYjylelXqGtSN1VYBDgwAKSKJydxEGO/hBIBhxAch5Esl9FtSem3y88n0BE5pZZLsuTlt7+dowIYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
 b=kvzGya/SYoRcPeYwTibnHEzV0DPzm98lv1NUqGJ1KC09FBs5BEALaTK1SZDkjDOxHPWXkt/MQtWpSRiM+uLMqxwaeJEoJYQz6/QWHXeq/YJXqqng5hcEXh/dKqlQxbLMnqkDIc90kCVS0UpDJDHWERUAK1v1STsDkZdUy8hO0GlSxQLyShCL/hxtp1ZbrHeY+amRzkxvt3JwRyMaoTtq312Kdozt27EbhI6cytnXFiHGKapszeL7/J5Ff3nBQv/ZDC9UVabV2umc2Xk84rGZDPOKDoAT1zSdANuhD5TFhbNpK+nZVKS+Qwd6vVBHJ3zuiyKlBkON8tYooKcUBEawkw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:33:37 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:33:36 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH v2 8/8] riscv: defconfig: enable OpenHW Group CVA6 APU support
Date: Thu, 26 Nov 2026 17:46:32 +0100
Message-Id: <20261126164632.978624-9-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:510:339::24) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 063e69e3-ae44-4af7-ae6f-08df4bdb04f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|10067099003|56012099006|11063799006|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	o6McgzDB7OD/1ykkx7/GDeM34Ui7c1kZcODTJ4nxdrNltqVaiD2adqEhXGdWTdf0CMkGruOlF3V1FI6HkQfaLokRU+Qj8I/bQvE8B0/9dzVaTYJItMd/eKbj0aiPRSIVSYHX7M1GCB7EkmUUbezID2dfWkm2JmMMT5DLVVQ0JEaG30nJDg9CQgZVwR3psO9vA0tF6mrRN6RsWkIlulE9ZA8KTWgUzDhPHhMgYdq5SLSRy6VVgM9px5dziDt0uYKq+BpHW9SuF5f7yPFUAxim8jSqp/fEhk2o0GCE1CkZSoOXiE/zETD8SHBcvgnrmIhfvBsQHfLnuk8gYFe7srCUf7cMHkODY/K7By46e9Fx1bVz56GR8DEErzuAiH0BeyV6g5uPn7VuWpGv/HE9SVRBl/zXUzX5rtsqgVo1NiuKTjIl3ASdHmvSzTJx5I5eacRYXCu6FiqfhBb9DYwcs6o1UsaCIHRibkDfkP2YU/EO6ktisA77e66Na7eC11SwqG16TAc3SMh/a8/B2PoGnFKvd7FQbgE3iZojsoXbYJyujmYQluVLZeHtj9SwZg5rmI8l9iLXo2HY8UiR75W7H38SYyrbu8WtRpvEtAkH1DoHCzhAZdvDpsMeY8cJYv6IvycBO71do38/DZ2TAMGgfzm5553G9L6D0GiEdACsCaMWx9M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U62xplFZjnwIGVTibgfNvuYGoxZkOWGhi/eptGnXhFcTiUNXO8OL9lUYr0kj?=
 =?us-ascii?Q?UHE5lErVKTcGXyk+07nBlcgM16OIoSFITnxMByYscrNmkkbQ8K27bh0yjwJQ?=
 =?us-ascii?Q?pJcRbavRl49roDp8yM6NvClEs6h5Jht8w2wyjvV/fVFwJ9KKtfD4huDWWiNJ?=
 =?us-ascii?Q?HVLi6HYadkrLchx4vIyltzehqMMbvltTF8kZPnqZMKjwwKKwJcqJlU4QhAY5?=
 =?us-ascii?Q?HJv9oQ4TITpXnybvNnlHOVh+l0h7QCZXLOR6+XtEUldm7EtVMUrOPmmAROvN?=
 =?us-ascii?Q?8MVkPQLeAlVQAEddqWPt2jeUFJgfCjNCPLOMVbnhe6oMpm1Dsbf55kJWqyyl?=
 =?us-ascii?Q?ix91ildugBnRdbGm1IKgdRaYjrlIJjgCh6FfNFcg3OkYr/QmeSc5Q8gPGuPr?=
 =?us-ascii?Q?Xu0/h4nzMpXPqn5E1oQY+qy+lXphE+nrsCl1AIpioVg32IQqnd1BGrOJyDos?=
 =?us-ascii?Q?FN9tJbWvZKdT7bNOb3CxyQHHLNfq+Np8uS16UMwOjhV3c5S2cbzbcl0MXxl+?=
 =?us-ascii?Q?0XlC4mwx/PviFSt6t3wBOLYrGJOs0CHPOeck+FL7VmQivj/gl1h7B+fS+g7o?=
 =?us-ascii?Q?jVQSXjd3eDq1pBBrmPGqVK1nSoVhaqK7NO3UQtWmHfBxj0lTXvMgxH3Y8LhM?=
 =?us-ascii?Q?38whjzG20g5BHG8F7oJYQbSwfdXVVgFnnD2Bq7asclNL1BzZD7tUY2byrFv5?=
 =?us-ascii?Q?xIYoT7TnC0KGt7/PBpymzGnqiLQSNPOS+CemWz0jg4ggOUwOTDi6unDgNMkY?=
 =?us-ascii?Q?Ry1ycO81Bxta+mvz4MqLx25UkbfDZI7ECN1obWvYe4KNOaQwUZsLn92s/KN4?=
 =?us-ascii?Q?bSs5nNOAxRgZaqMuhE5cyJLOj9wSfAfiLQkOa7z/oKk+LNZL1FqDGMq/14KS?=
 =?us-ascii?Q?dWbaqSUv9EKwWdO7aVjVFjpp/buyxnvvvfaUVtlPebhsQOr1MHVSqem8gFAg?=
 =?us-ascii?Q?jvai1MBQT5rlOVLHYkh9ZEPOZ2RS+YKmTjeJOibCzjr89FWnZRPkMT5ixZ3x?=
 =?us-ascii?Q?Z1pAnrpj1qAKPQcM2snxLdgPBX5hNY0pYjZa8wadzEaB3rtbQiCHmUGz8QQq?=
 =?us-ascii?Q?sK1LkY16kdJAeSBE8UQsIOEYHdKBuvxY5SYM+CkTexh4r469hymIqL0/363c?=
 =?us-ascii?Q?OhSy3cxTImio659SNOzCWr9f7daKZSDIwYOFiV+EanAjGq6rWWaGlLU0OWfA?=
 =?us-ascii?Q?qM/KN5Dk3LzEOYAgtnc2xIhTEyQCNI5TfbixtvIjptgTJ03XG2lMqkrnB+T2?=
 =?us-ascii?Q?k8oWmlaFl4wGpoapcQ+DlLbuIeaDbCcEfn/f7za5Au2NeMTlpRV4dQ4PtWSy?=
 =?us-ascii?Q?m3xpXxwyg81Q3M2Fuy0BinK5lUrCwCjG2pRG4jKzF19Bzzhqe9t/n87sUFOc?=
 =?us-ascii?Q?0IItzOwlOF3//acu49GcpCuq9E/2pRXRqx69r2+G2OL8sjaOnGhFVLNBXLQ8?=
 =?us-ascii?Q?Eeyxs3b0MwYrqVEukXH7t6cG8ARAIw6+VwIQTRxb1SpqPzkvzREwjqRgrFAT?=
 =?us-ascii?Q?Cb5kFaryk2FAV6EGXN1wTFREvy9cZIOJvFSAdOm+QlldAB0P6biUoAbVRcUN?=
 =?us-ascii?Q?F+vnSDzQnSB1p5ywLidQyD7vo7LFmT8L440SQ3jLE8k+5v+Tl8xCQqg1Ow/s?=
 =?us-ascii?Q?WGAOSKSDxC2YD1cjCCyr+lRAOV8q41TW+pAYITK+6lf2yIK1k9nGnXwGXQMd?=
 =?us-ascii?Q?e9F+GHiqp75QCEDt2Y2QpYe46YiBR1iWSMxObx5SNjVlXloBHlKbAiqB+tsE?=
 =?us-ascii?Q?Zin8T4DdOTw2zjV58mZ5jtvycZ8tdq86bgJU06G2WzMLvnxVlOywGl8RXb2j?=
X-MS-Exchange-AntiSpam-MessageData-1: Rlg8dOJFfKVn6Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063e69e3-ae44-4af7-ae6f-08df4bdb04f8
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:33:36.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eHH1ZrrcpCcZr3ck1pi22BPVx1mDunm1fM9WwMgN1sDnG4DrgKKA0OEn/x43LGyVhRzOzL2l/uRjjZAnVMqFwC3ym8j/gBWIAhX9iGv2Q0XNduDsz0t78FOzLE0RK3L07bTe4UX/HPFhsexAXQ6Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Enable ARCH_OPENHWGROUP so the CVA6 APU device trees are built, and the
Xilinx SPI and GPIO drivers used by the SD card slot and the LEDs on the
Digilent Genesys 2.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d55..ed495eb8ad 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
+CONFIG_ARCH_OPENHWGROUP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y
@@ -166,6 +167,7 @@ CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
+CONFIG_SPI_XILINX=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_PINCTRL_TH1520=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
@@ -175,6 +177,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_GPIO_SPACEMIT_K1=y
+CONFIG_GPIO_XILINX=y
 CONFIG_GPIO_PCA953X=m
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
-- 
2.43.0

