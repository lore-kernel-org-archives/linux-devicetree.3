Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4F83B0AC8;
	Wed, 13 May 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698279; cv=fail; b=EM9Cz8NlkiHCOcoawGhKQkny39JuavGN5w6PHZUW3nbf9dDj6PkL+xC0Bzxdevc1UCBTr89X1f1HI6Bj+NFZymmmA+QxCiGxDhUbTk4nRrQMW4bKPlKNQasmLMKauD7QOq5DRifkGvps6vORdzx9NNn2fD1YCw4MzUr2WdUWsiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698279; c=relaxed/simple;
	bh=kPvX7e+qI/ENtRlxiJ1e7ofiQp8Iy6mQd0Cl5cFK1YE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o28SWq/ouxEngUf10pgL/lCD8/6Ivq6KJ4wArkqVA15xY7wh5ij7O3uH+RZCO/dFdjqeB6VtLkjjbA7XsWadzxlEAZZkcxCELMfocQUzyksMm+LBJyflUy0yq9V154XocePfB5K/Dgy2VwE4lsGWreRA6WGM/HZq8b00VFUgIyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ibt+32KC; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ibt+32KC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkXqqUY999Q4yCalLhtzLWt+z7xGGO+zq1MDD2gsbrRD7tK8UCeNSfxM4CYoVLprBqjv+UTnsqKS+ZbaaOFZtiwl9dnGkhpVoVJNcvAr55AFne67IoHWjzj2/5x4zpMW278Bgg/nez0Xg5dnAIxIA+UA5Lwz7KeZ7VPeA3S0OrZ2x9AB5RilaFCOElPfnXKaaqQ+K92YEbMuFI8Thhzi2OKT8P7eMacobt5mhQCNXN7C0+fUTTaQn5veeDF2M+/vDaH/08f4Cy7kDANq3G0NFzdmGoYmigmgsLh40bAeNK7lS5X6ZstGN4TBpmtmKZ6kKpQJdRFuv/o7VTxZIm9u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DP1DsNPhJZ88G6wPELe7YuVp3E6t9abnh53YolyAu/8=;
 b=xzFm6nLvNrAnWX3hOslHLB9uwl1t9yRvxx4GHID+XQ9RC9Vmkz2htGsaZfwCAKP3uKobiw83CxFgpXwiNtuAFQ1byyboWlaLteQiiqON5zP41RaWJKMLny35pvoTULD5mdeRWFTJv+9aHY95Et0BXj+OY2mCNiXOxWqiLr8QLjwb3OsKMhwW6wsxOWQfj7or5qpiIURAC9ehU9ukfMv53C7Tk56FlOzm9WuHALF+wtO8DZmFOrNbHlj6xlVRqyYsQ+dIkjp1sod0CMHRBVOMphT14r2bYoqp/EUcsFXLjECKczFxOEusyxXhzTam2gM7z74f8efVtMNU3rDWAe2SjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP1DsNPhJZ88G6wPELe7YuVp3E6t9abnh53YolyAu/8=;
 b=ibt+32KCWlOVEtNVPcsKGa4cuWoaJjC4Q/ZtcILYAHXAl86AOunGiDraeFx+pkuWpGzFHXg12vehdbVurMAsv5L072JjoWrqqYdEEqoitsIjU7W8/DGJM188SfJtYDTLlzt7qkyxlkuI8VoCE2qJsLA76K4GPZ3Lo+H6t9r9TtC81zrUN/AXmKDNfhirQoprrwmwyTpsiNGXfLyaCnF1NuPto/7UVxqPzmXz3+R/nq/OqG0TfTE5RmOPO+VpF9jGwqQyb10ReLTSDApxCWBSRZueoy8fADwD6kxFlWTd/xB6oInwThRgpuHHCW6qB/VBtx0OF9cuYf8RkqYhCF3ONA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 by PR3PR04MB7337.eurprd04.prod.outlook.com (2603:10a6:102:81::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 13 May
 2026 18:51:15 +0000
Received: from PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d]) by PR3PR04MB7402.eurprd04.prod.outlook.com
 ([fe80::4129:7aed:b5cb:b13d%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 18:51:15 +0000
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
Subject: [PATCH phy-next 1/2] dt-bindings: phy: add PHY bindings for the TI DS125DF111 Retimer PHY
Date: Wed, 13 May 2026 21:51:02 +0300
Message-Id: <20260513185103.1371809-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513185103.1371809-1-ioana.ciornei@nxp.com>
References: <20260513185103.1371809-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0017.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::22) To PR3PR04MB7402.eurprd04.prod.outlook.com
 (2603:10a6:102:89::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7402:EE_|PR3PR04MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c29640-ebeb-4c45-7f4c-08deb1209c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|18002099003|11063799003|56012099003|3023799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Tt0lE2YrH1N+Vs923QMROXRfj8+YfT969+qq2/jvbEGQ4tn3oWPwK9TJsWf0ttbAuSoOAhdBH+LO5KaVZfOK++dIAln2FVqY/8EJkHWcSMazhM4vMulZ8Clmi11Qb6g6Zj9AD0zAfJPD3nbZJfBgh1Oe+XNbQtvUjzbThaoY184snykThjDMUjj2tL1zNh1+mRcsP73OZqqBBnQHGkQyZaa+Koc2XPAb5DXRx5pakGHm9a68gGjs0uw5GkQ5ZCOnOKBq93o2h+Fz9fpwIyf40ozXV+o/1eaMAtzkf5xzRuR/Y3zmPZ6Tal3ezojbWbgxToBmjG8jEcW7b/OYfjmSJoi0JtNv/68Y8T67LgZvWtKBnWXisRMd6Y4N3h3BWsbH6J7W257CDrdR4eS0jOqB3roKJaTqY6lSKF59BWIYBYgH6h6kVdTieCsDuksdJDgbeZDFJdqbXJ3PtR/a5uqtw/zThcAZmKkVfGddoVNy4SLAYEub0BdWjxC2B4/hpiuvlypf2wZqlk/eRHiFuwWNfO6k2xFT2UkS/FTVSYjDLH02mkPLVu+yJ1d6JAwR6e0uYxJLeGQCnaIV0M61Pl327ACF0hpPoU/EjzljAzPZa+D8T3tbZ2K056ZTjnUTkIWGU/flG5D8K5qjZF9GjYW1HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7402.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(18002099003)(11063799003)(56012099003)(3023799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lF6ArOls5MIeChG9Fky4KlQRGq9GvHj3hgdcSZNYeS7mxj7qjDaCOR7TXXn1?=
 =?us-ascii?Q?0g5fnK81qZzyfhlgN99snBUxXW0rekRdYoQj9oyyN6TCgCqQS5TeV/hu8w/C?=
 =?us-ascii?Q?KAHdQB5DzbX29rN9kizunr7GCmDxUX8iq7staNhlDpPsuO2MFSGHXDkfRln9?=
 =?us-ascii?Q?nUzmK88zm+Bo5ZnS0zreHMdeczL1qm8vBq7BKeFCdpwg4Isf9KSnX6fZsBZr?=
 =?us-ascii?Q?3p8wWImS+5STiaeCsNPbUs7KD2389mpwND7VEPtpZ4xwkyPtxzqlZO5DJEAz?=
 =?us-ascii?Q?X7pw6SXGFzrnV4xGcf69m8HUXJy/PhWD0yEHnpWCiniihqMwmlEsBkPmud+a?=
 =?us-ascii?Q?mtBBzQV607YpC4r1oWG+AqraiT+6sX8qEWpr5pngP6Oue23SF4Hri3scnsr9?=
 =?us-ascii?Q?v+ahkhQGo/BCMtQLTOxXE+qq9bN3j3j19L0Du9OqyUoSBi80PM7TqLPc+909?=
 =?us-ascii?Q?FyBWxauHMjKShsg0PhtQKc3ADNoIdIROHHe8Y7jTWnAbh9ZGa0a/gUsxY/ze?=
 =?us-ascii?Q?uz4RV8DBYJM75JLgbFjHI1GfEhFwiFbYr/tnyBVXgofPWkYCDcMFTkuVKAWL?=
 =?us-ascii?Q?K1zU1j/CaQ14wV+II8Xp53qxkOtim63JohcdT0uFNqy8A1AHthresfNSaE0Y?=
 =?us-ascii?Q?0zwinzE/F7hTS4VFoRJUzJMxZU0mLkKAHHbz75+0WXKsQ3v6CDsFwiHnnRxK?=
 =?us-ascii?Q?SjiapYFPH+WKTQCez80hoVeLsMPCtysuweXbE5Q1ZkppFqwmzYdrDvge8gMz?=
 =?us-ascii?Q?CC6gA3OSbhXH/q3D3nbZPG90x/qhEPRtJ5jh4YoqnaJKH/glxfT/9muWVEnU?=
 =?us-ascii?Q?M1G9RUwunxh8WYrFs6yTHhTtp4zGc9nLZvCFF1N/ZFwn0chCSs7A4BXm+9GV?=
 =?us-ascii?Q?Hi+Kstmdb7Q0kCR0/ELY3a6oWlTsv9sEQTuyHTPkyOJnkcX787o2loX/gCwF?=
 =?us-ascii?Q?eut8BYXrBu4JdcJvU9q8n2dw+eM7HZiddEkVwpuJLGOwZxmkq50EcEHLPnkg?=
 =?us-ascii?Q?a0AG6+d6IPkZ7puKgkkxy6sW3AU3bNw41Pr/MuFdQ6kQA73Z4ICfykZZn6Iw?=
 =?us-ascii?Q?cKg0v19g3JqTYPCyuVRIAwfu6+Pw9Ha9Y2AB0AxYIvljVJgQlIjpTM6Y7S3k?=
 =?us-ascii?Q?UwhHu3w6HsqGABa0caXh92iQ9Tw2vP0xzkLlfn9wC3uJ9KVtFpUoP/1wBvGY?=
 =?us-ascii?Q?5XRMX9WAyV9rmX2CJ4AqCObU61dgnxPU4RG92LYFXJhmQJbb2vJbMp/rYMvI?=
 =?us-ascii?Q?rUmmJFCHDAyRt7hgM6s5NWdn7FYyK8BNmPn/1SZuM53oFBXKP+I1nP8CpHUa?=
 =?us-ascii?Q?3Mrm5vjosjES5aDJS/HTrGumh4nNRbgW2OyYLkfWHxjnAz2Z/RjUXd9y2laM?=
 =?us-ascii?Q?98XY3mSdVPzCT7YCgL4xRi7s+LVEEhTW1iVTwDWjvvLsYSLmMobjiglvNEJC?=
 =?us-ascii?Q?CEGhuD1DT6zBfXgeWmq3ix/ckWUfqvZnasoKIkG+RvZxBvVm0OTtJLv5ERlk?=
 =?us-ascii?Q?l96fT44ytq87ZashFj8WFfBUjdC/PCyAcWOLj5x+iA1B2HUQ6oQNfvDbiIIp?=
 =?us-ascii?Q?gvFob4U7gmS1cljtFYCm3Kb/VRmWEiOglenxqMMp/TpjWlLYhmbi9yrg+OQn?=
 =?us-ascii?Q?W7+kDegxiKU3GaPEhoR+1sbHSonoefpfcGJXaBAcDgB2bZ+BHdkBnkVoFyVs?=
 =?us-ascii?Q?GLNlFjBsQRrKrqwG74fTWbE9WocXBX4w7fdZPSicyJyuuoACdZK9YlsFc6em?=
 =?us-ascii?Q?cYeLNdO7Ww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c29640-ebeb-4c45-7f4c-08deb1209c1e
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7402.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 18:51:15.1661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZgiSpN1BH/P3BEnjEv4iEr0QmHo6DSu/t+bstlKGX76pUsk2OC/cmwujpIyMXe4CZ27bzk38FzF5rosRm800g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7337

Add device tree binding for the TI DS125DF111 Retimer PHY.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../bindings/phy/ti,ds125df111.yaml           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,ds125df111.yaml

diff --git a/Documentation/devicetree/bindings/phy/ti,ds125df111.yaml b/Documentation/devicetree/bindings/phy/ti,ds125df111.yaml
new file mode 100644
index 000000000000..47e9ba2a8990
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
+      ti_retimer: retimer@18 {
+        compatible = "ti,ds125df111";
+        reg = <0x18>;
+        #phy-cells = <1>;
+      };
+    };
-- 
2.25.1

