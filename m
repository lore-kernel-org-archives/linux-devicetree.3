Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9D204C3B;
	Sat, 16 May 2026 06:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911398; cv=fail; b=cPaAOg5aQM6/GOGSU4uihBtlSC5/rMf4S12JQ+HgGEE17Zlp8W9vBg1cZcLu3H3thtf17OfzLUN3VeVTx3iN+zg9pqyTuX404ekmEBmJY7zyzYi0Jyv1rY79EIUAtZjVFvL/ZrPU4RQY8QDhf7UgZci9mBt53HIgTKOTfQ3FBnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911398; c=relaxed/simple;
	bh=kOqV+Nk/QhXrVzQpLhk8p0A08y/iHieX0I9j9JRQpms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PSpqVLNcjhhs/YXWObRnzYrRGIVISmSKq5LmcK53Ld0TSA0WKxINeI5JlB+U1j3IRxZgMWkCNo0jKpfBIdHlGrJ8UrjLCY9DNurDIlEmfqnBgorjPLJzv3GI9Mfd6EgimyvU9egfbts2jAowmWcRksDGE9sgflj+lYsEYphtcZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VXY6LYjt; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VXY6LYjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMtLc5/lXHt8NvjW5gwmrvVjunnEQKPXvdfOiJVS3m3S5cEVRrXQrYU7omvpuRSA1S88rHF3hSBcb3WRa+ZCcUWuJLJoLX3HTF7FE6iI1Jwsm5mgisbF4IjAJ1N38GECCri9ftgtQY2La4kdrtzg5QVHKQ7O9Xq3Sw15f6sVYtNgasW8Obk43gVAQMhY10umtxYIYDGfqsza9frmLRTgRJApvA0MtkHDaEUEExTF7BX2rnyhQbxHXF2K4mkejwECe0mNXriTxrr4RtM7OqLPoMOw4XM/dk4ScrqmFrB8bOv8Yl3M/i8+h6Ka8G1FpRTJKrznKu/Rd5VDpxRcU+AzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GMSpAABKAeKwKSi+dp4RKlan50R58q/COgUKHRloek=;
 b=dgmG74MyvtLUDZYcya7kzDxIgVvhURKnWbZUCbtiVGNDqsGaNZczQOwYLeeg3jJuGXCeJ++fvO9WZeIt+L01jvRUkwFnp7kOa4TDGgKO2Jmuzt7cx4ouvy0xbMRPEGbUbtVb3tmLDAHbmY/+zX4a4XArDYbssmSLoDDQRMK3RwO/Oo4cwsGOzRI+Ca9Ebj4ZLFAuhatHkMR2DujCv+Xu8z7azrX5KFZZQRWy/IGyKKl+e8zntGWwKAhJG7odwup51gwS5mMS1s5J0XGbnDEUHLv1Y4OtEnG5cpEliytW5UPb45rNxXxjnRCA/Y6TBE6AlHN3jPz3rpBgI5MrXB4LnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GMSpAABKAeKwKSi+dp4RKlan50R58q/COgUKHRloek=;
 b=VXY6LYjtpPh9jtrZIzyrNyHf29MPnME4qbbLYKd1qYYtCeJMTmTvWpsnE2uFgdjU7dCVvyIJ5Wk2sSjc8912ZVmglsnC7w+Gd3K+WkYcTP6ltHYeS64pWDlyiMwhgGFqeqoqK2K7l+rJ+kTNbQcAGqBL+U86MFLy2NUfpvxqBayEQXWo5XzXo1oTL7cKvAfcQe9sh1160qNN2pEe7QMRLlmFW1mrCN+75zUJE4beKG2tAmTrqr4kvFqfTtiBVM4MxugxkMwjiEbeg4HB/8tFpeEC5jMQVqNUhMjLB6k6iBYTGScK/dZzzG+gysS8Imj3I3Pt+7sSZfPMpB+zMFyt/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by DU4PR04MB12347.eurprd04.prod.outlook.com (2603:10a6:10:62e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Sat, 16 May
 2026 06:03:15 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Sat, 16 May 2026
 06:03:15 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 phy-next 1/2] dt-bindings: phy: add PHY bindings for the TI DS125DF111 Retimer PHY
Date: Sat, 16 May 2026 09:03:08 +0300
Message-Id: <20260516060309.2282592-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260516060309.2282592-1-ioana.ciornei@nxp.com>
References: <20260516060309.2282592-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0337.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::14) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|DU4PR04MB12347:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c7787d-dde9-4de7-2c28-08deb310d1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|18002099003|11063799003|3023799003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ddXSvgJ5MiUHH0k/9OcyaHSa4V6Ka8w8wu7HZVMCKDxQ23P4y7StKe6z3IPgvmiQ5XRG95tj/PqD9ntgvmeyEekSSGbly7mTCVR9wBevnxQ+lulBoAcdHBl0QcW3cBBKoHMua9OecQd1glwGGTkaMiKHR9idz/09kx9Bh+vmZihznU+mWiICy/qbFy2RgETwmiXKmWOWVK5TAoEWr6oIaEzGwRTAR9U19NXGTBdxhHhPvAL0QEhKP6tIKF4ppURqfQcXVksUUfBNBGL7LX3jPgEOnua7N87rTLZQovDqMoXiOJ1xqWjoNFKIVcVZH9lYLYPS/yG0ywl5vN9G3JvCqZvuPpsg3b7XoDUnr0FA/yEpc4WwskWtH8W4KHtoIZS8vEcesLkJ0DpmT774IlYe2a1C9e8MpKaZgl8tmJPyt2Wtsu9BvkBDLePiksNKpaCzZgjVGT48uuVEXgINss+6gXnTvRIDWC86Q2VYQcvqkhQgA8tC8To0JE/N6qTNstbBN0ZPWGS2ETiXOkcio1t5ZgHjpCVYWBdR9x0jYmclNF4477DreKVR9rSae5v0J7DklgYBdvqjjbMLCar5/RwmxD3u9MB7lAorSb7V5FvYKHrh3c7djV7nioxMBFG3sDvdDO+a1XlMOAE32Yjrn1gFbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(18002099003)(11063799003)(3023799003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J3933F3KDxxZS4cR+wTVBH2aBu4Kczw9uLgqN5+3TuAayIFeIeRAwl8yprtd?=
 =?us-ascii?Q?c6yDELlth5OwqigmSx9EOl+JkfmuLPShZB3kBjXRVOIwG4sZvDWLyihg4GOQ?=
 =?us-ascii?Q?k1ZjFEQN8XEWEZyFwEd8IyZOBr8/Mm3kcjB7PDw0MUmiZSE3TvDhn/KGQ042?=
 =?us-ascii?Q?K6CObuAxBEEzYsMu+PWVLCw7it8M3QaIEzgn8n+7hR+F2vHZxZsdeNiAl0Bd?=
 =?us-ascii?Q?XU4N+EfO+rJvCdnUXk3+HXYhMvZw+wE6856ZCVIaSzIQMJt9OtZlscdBLk1v?=
 =?us-ascii?Q?1d7yQE83ZMofe7DER1/LPHfAR5ptRDkhq5+Gi4alJxI6TgX6eW/0Zie6clK0?=
 =?us-ascii?Q?FGOUv63WBNzc2oNuo2JRbI+JhYOEuBRD+eI3HPLTDHugrm+X98cXxcGo6bf6?=
 =?us-ascii?Q?Yo521UqTO8ICwBHzmVzmTR/rX95Pm4Vh1nX+5vGlYOMhV6aHst1XqObOwzYL?=
 =?us-ascii?Q?GTz3f//AlWv/lL8OLXlhvMcp57HdpA6qnkZWrmlhJdgehcyY4WSySGSKHGoB?=
 =?us-ascii?Q?uvuAchpcgCRBauDa4qo03j3uBQ6XZe+yxJ8B7fpaOEERGlTK5eHTfmd6SpCV?=
 =?us-ascii?Q?UmvQFrxNgjrB9Qme+xSbxiAkZwl5M81VqBx6lgzzI6WIdXk+mLsesdO34WYp?=
 =?us-ascii?Q?yYA1FvPXOxOl0dxyoDsCt9lLe1Tuef6GkPNP+20CXXUr3+mG+4vdt68ugp2r?=
 =?us-ascii?Q?j4ODB9hIwXip9wyWuxPqUO0RLK7u1mtCC1YeHhEvp9mWpSiUYzrNTbizxC//?=
 =?us-ascii?Q?6tRwDAHjf3oJb6YuIkKYQEmbbRPmMDKX9SVJrtGuH8ppcYjysxxYBpVf2DVb?=
 =?us-ascii?Q?5SKO9jpXhVwvDzG4UtPYXFLP5PWankKLCHV0/UFXiY8+b+oRBqOVYEjqdLbP?=
 =?us-ascii?Q?JNSU6ZjyMXEg3I97zjON3NHD6agzyoOaJE66mzw+eoELHSqcztSXUtVxLyj6?=
 =?us-ascii?Q?UPXSruAzyD3qv2OxXell3VK6NOEoile06gppPq6JT5YZifbe4ft2B9O9Jahs?=
 =?us-ascii?Q?KntVaR897Pvvez9YoTMzIpN/bHijrrrZFmHBGJJBcJxAvU+ankqb5QX/xPxD?=
 =?us-ascii?Q?FUuMoOw9z+S1mZhEexEOxeewXomz4g17DiNwIoJmonQIOPr5YfSxWqHSiv1V?=
 =?us-ascii?Q?WmYh+Qm4JzkfgFF6mg54b12K6/KoQqqQ2CCzLclogItCRvDja123r9FkUNh/?=
 =?us-ascii?Q?uSZOqVsa/wSmiquPwaejUEIt50Y3Zyugw7HUBEvZ/hwMQoTSIQvkBLKwybe9?=
 =?us-ascii?Q?cctbAjPBi1XflkAI70r5aQcP4pPMKfC9FI/AB61LSN0Kmno2G/+oidiTGc+P?=
 =?us-ascii?Q?jdBE31LoynY139LNc/XD3nJRKLdx3e3GRf+knH1/Qt/aOSRB5ZpxTLO3nuF/?=
 =?us-ascii?Q?ERROVkCRnX9fnIYn1QOOo0mCdo+KGJCVgb+0uNaQ1EI4kxAzgrie3PoT6ppr?=
 =?us-ascii?Q?YuhahC2nVVNhJM4cXzXxnqQMPNwi491nzkhOLVWDj0E2J4OosSa5Gs5Whlba?=
 =?us-ascii?Q?fq8e7qFHY9cKdKrr5JmApwhKGJwTN4R04geYsm057299RBop44RhACfxMq8S?=
 =?us-ascii?Q?SaRKW6fTNWcT5yGMEAtK3LgIMJxzx2TeHPhAJoxsDXfKV5T3OBsMekoaeTHo?=
 =?us-ascii?Q?YP2pFFL7Dewae+CfYdY7fdh+g+AyI8vLmksH4EZr437eAuQdwfRW5oyMRcK2?=
 =?us-ascii?Q?d0zoZK9nRQJpsFlNZeAn9DFXPlrprL7PdhZDw74aBLGoUOFhwmqGiCjE7QTH?=
 =?us-ascii?Q?uB4P2XmtAA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c7787d-dde9-4de7-2c28-08deb310d1a2
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 06:03:15.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2RS7jxWsYYL+Sbjh3dYF9678/NSWOgR7DYuHf553MReS5ixw9rYM457rzNCNsAHKCCr2x1kAbdY2Wf9koFmJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12347

Add device tree binding for the TI DS125DF111 Retimer PHY.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
- none
Changes in v2:
- Remove the label from the example
- Rename the node from 'retimer' to 'phy'
---
 .../bindings/phy/ti,ds125df111.yaml           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,ds125df111.yaml

diff --git a/Documentation/devicetree/bindings/phy/ti,ds125df111.yaml b/Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
new file mode 100644
index 000000000000..ca4605f1d664
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,ds125df111.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DS125DF111 Retimer PHY
+
+description:
+  This binding describes the TI DS125DF111 multi-protocol Retimer PHY.
+
+maintainers:
+  - Ioana Ciornei <ioana.ciornei@nxp.com>
+
+properties:
+  compatible:
+    const: ti,ds125df111
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description: |
+      The phandle's argument in the PHY specifier selects one of the two
+      channels of the retimer
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      phy@18 {
+        compatible = "ti,ds125df111";
+        reg = <0x18>;
+        #phy-cells = <1>;
+      };
+    };
-- 
2.25.1

