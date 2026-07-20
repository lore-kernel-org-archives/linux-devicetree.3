Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E05C429CC9;
	Mon, 20 Jul 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554628; cv=fail; b=gI5k23yGo5QyEdMAoDXCMX9q5Meqgcu+eP3ZrG66xfr+3SMZG4LKO4o85m942YfWN7yIpEKCZZKGXBsekpKnmIXn8eZdHWoZEquROadyQBsBfs0eUk+zmAjdGUoNaqgMAb6J04kGXzuM5GQj45IdMWV2mcBCviaLNPWzzJ9HZzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554628; c=relaxed/simple;
	bh=cHn9hrVVUPLtfrTI53TLKrOdU2QlfmNg86OGTqQf1kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lbbQa2bxFhJgxGXRuUUzV9U3wBrNE3zYlqpenRZmeT8s5qs79Ge1ZUOuGjPQ751fjI7lKQIZ5ZbMUtBvrUkOs1n5bsEpBX3g88KxDMC0cOQOl2xbbvpt2deOyE6wGMOEEp70zz3vrM+cdZ2veT2IwEIN+UpoXd/4PTFxBhfpvIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jILkBl7Y; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jILkBl7Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swz6cHeH5hM8sSuzn81YoSlWHsLVGEcZPgxEYSZmIj2IawMDjaFwkP20Egv/h1R37HIUPH0UeSUystkvvUGWNBS6TDOrcf7augilSeyijWXmL7NvWsDKRuLLTL/lnGKPhzhypXqn4snH4cABvA1OwsmZ1Orx0FDNCWHoCDZTaJrgqs22gQo9A6BOLQZeclP9OGIXufsH1cLcbR09SL4WfQC1HPJT3+vB2uk8fmlAS5GlRRsdj5p8OR9sHZPoyuQPm34kEdYLC3RHN6Or95PLZoA77CUGAVn6cFrgt7KTzdGHOAXDuLiQ/KqziinWQRBqEvNUSEOrLzSrlQC2AN+aog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JMDgNBI7b696XJL8xSeBFjF60/yKWE2k7dnvfk4lZk=;
 b=qLz9XrnQcJXKAMJ6FsyK0lS5NhJLfC6QCwhRTj6Ot2G29w6MAD2G+oAnHufAIHIC/Sl3Ewk6I9+o1JlpMP46GrDVFBdRgj5Os5PRKabR5xpPWHGpxUCbBOUT4HW/PUzY6ToKhbTFAPb9CStsjl+Cwj1HYN1RlPSZS0CgxU+nce5zYAVRRDkfhr/ANpd7VH69jOZjV3tTgb67Mdc6Lfe6+fufAKeWmXiI/SmLLtCbuu/LXVblRZoESNtTGz18NJpHAcOja3xNZ5Vyz1z+CJ1iZV+0C06z2gAK847uRct4N3u8hpZ11UEQ5xtkLJ+bNxIgyBPc0M6Owv1TcHuYpZ8MQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JMDgNBI7b696XJL8xSeBFjF60/yKWE2k7dnvfk4lZk=;
 b=jILkBl7YoXHZ4QX/f/C2u3ht/a+MZUchesn8CDMHei53FZaVTWNkrwSTv7F1gsvcAyqxGlcbUBcad/M7/5GwGnhKWPrp9LNKnFUj2O6UWRj1m4CgGACkjeBdS5g9CYq1r9wXKEbnW+uNdtjFB0Fq3QShSfU+KJ4zmnbEKJimiADunHu3CukXxZTtUNKDmCrScIHdxD4zVAZDWX9ahFQl0oClqcl9z0bOgQ/FZjiPyzRxHFYo7gQgv367UJIWVz8ZAMnzxps+dSWzw49EvG5XLxwcU2M8KLIZDZzb+sogklUjbJekcOG0BtUcEuoj/MZ9i9JIqprDk87gewY4LN1w7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by PR3PR04MB7259.eurprd04.prod.outlook.com (2603:10a6:102:8a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:37:03 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:37:03 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 phy-next 6/8] dt-bindings: fsl: layerscape-dcfg: define DCFG_DCSR region
Date: Mon, 20 Jul 2026 16:36:40 +0300
Message-Id: <20260720133642.136324-7-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720133642.136324-1-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::13) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|PR3PR04MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d02c92-86fa-4e62-7f56-08dee663fbff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|3023799007|56012099006|5023799004|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ru9U42Nb8QoFgvNJPa2gXWbOd387WUxCOwJOJHyWj345gxy7B4mfJeJ/6w0aJlKwJHZhgF4G8KsF6MiWNwAt6/jrBYkPaOf+9Gh3UTasLFpoyw1H11zr7FbLtvAyWV419QU7E7lb2YUH7hPllSixr+dA7t+9OIUsb0fV5bUKMZXPOqOQkwSPEcijfFcYr+yme/UtJ9HS1yZB66cmxGAjyLwLgRHklsC5muhuZinMHCLTlec/jvsNBRt9s0O5cAB1aiAH5EZWmVlRaLkSdnD3gtYJKkONuALcZQYqyijJ7Su2QhxutEIwCpr5xlUl7VNYhIIbtFxMC0dK45UWrHHxb97EwIjPm+AfMkSk8Yr9nhCeIo6cUkqsePZlOWMTAdUsFapYowh0pIYrEW16LO6Uwvnr5PlRhW3JObwY250xbJzvzdUoZanzpVN+5KC17DdGzN1EQHQcUNHIQ2D17M9e/Xx0EOAu2rStjAAvVF3hpMGXfI+HV9O0wwHCJuVO6dvXjyAXjoIk3bSoBH1L5hXsTxLvi7e6hVZhI4eI5UgP05WZqAzQLeK5GlINJ8pRekaiTBJmdbBeabgiSlxIypyXbjwM27vRwisTk7bQpNQb7ZhCMQIzrv98tkfjNgIPxvbCGkUKwWMf4wZ7MTYKcxo15ssBnexBWpbLLVqpy5FUjik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MgQYzMEWB87dVWaliCWK+AI/SsG8QrLVQi9oy171HYUYR/P4UoKeeZeZ0fMb?=
 =?us-ascii?Q?4vkl73x3bq1ZZFUFhGHRrsRCciVjjXhuksitUL7omsomQ1nEwxwB5GDOPQm/?=
 =?us-ascii?Q?EDlSZ8nuRZ1mVjxyxDCT+XubzAqQHhlQicXMxU+IhPM6XRZR2axTtC40Qsbo?=
 =?us-ascii?Q?UARPRwQLPAT2QM5UCzVwvtqTIgpgFCsfMVqzmJlgAqAhMifC2OxdqqlbvVP2?=
 =?us-ascii?Q?hHbwl8pioObVp0o0ggBEHXD35tHAwtC+yZsyRfxXRogHBBD2Fs+XBJnzMOTP?=
 =?us-ascii?Q?dbvUnbwVTlpSfaFerOakoPBZVuqdXGvj7rmw8MZTsMkiiU0ovrRJEUWd+6WS?=
 =?us-ascii?Q?60fjz6INpgOTJGeusrfB0EHC9K0vCMHAO29ZkA+JWTY5WNdCLAUnOUR3IfUr?=
 =?us-ascii?Q?j99ea9wZFQuS/oM5AqdgtUbw1ZlDDBNIbGOLWC1jIZ426kLVMCMB0oAE3dzl?=
 =?us-ascii?Q?WCRiTGrMN8l/ft613+UOjNGVWMtdbqYVbUFmea/3ax1qXb71tuGAJELfHVpu?=
 =?us-ascii?Q?e/9y2an0IpeD/miMj66dMhVtBy/P0+SIOq+zTSWGozaaR4twrpYFZqk6l80o?=
 =?us-ascii?Q?IgqR9SRCq6sILapTkLa5B7qdo3qWrywhkix8P/yBEsbV/ZHwBU30VnUJRwV+?=
 =?us-ascii?Q?YXulFxzReekLbXWFIXJbJQrpwqB2m1XeRXQwwaBIxALFwbjjruOzU9PH86gz?=
 =?us-ascii?Q?SsnFyT8np+Og7QHuZsJNjnltAFJriXF00JO+D4vtNto8l1XPRjkZoXPiDZD3?=
 =?us-ascii?Q?dTHY4Vn3/VUT6fULgg/T/YF9KUWA4RTx8Dey3rWBldsHnygCZJXVbDSJyX2o?=
 =?us-ascii?Q?e+R03zwWlN/rbuS+paQVap3c6oRgwmn94uO5z0ZhkC6I4qtBkwlm3FudUy+q?=
 =?us-ascii?Q?zkLvmT1yVJKfY6u+/AAduFRGz4mdMS2YMoU1QLzvLl1OLXj0nhCvLOpt/h7t?=
 =?us-ascii?Q?Jr4hUr5jFYG/Vus7XaAEtlWQZJ36+xzW4/AyYbmVZ2Tvuxmrz17y1G8cAEKy?=
 =?us-ascii?Q?y27LQ4vXpLCLDLVOsnFiOJMsv702weasS6bCSygHwfhwB+8HYUCqH+5EyoCJ?=
 =?us-ascii?Q?2YZnS085jFB3svsWuZOxy9e7iBH5WgxeAt7D705A4Y2JRJl2I/X73QP3M6fQ?=
 =?us-ascii?Q?H6uKUCABpslTwqWQhHcCNbdWKjR83RVrH9J1rEecSetj5eAWH7+IVZzULxu9?=
 =?us-ascii?Q?7CxpUqnjMx+Ez011xGasR8mDFGlBZgDUCXgM1+40fBpMezjq3IoNdcUnVvtP?=
 =?us-ascii?Q?b5OQ1atNvpXFWtEuYdSIYMiN72XpfBLYcOmGPzgNfHhImJEP+oFgSWldW6e9?=
 =?us-ascii?Q?62x95FsDxfYbzJAZtkryymKadKD7rhTiV+c+ORbOcNXH3vclqIMJ4VP62Soc?=
 =?us-ascii?Q?OsWoxG/HxjGdGPWi7pwbE6IMF8nMfkXpKj/JftiY9VdZqy4eRTmooFgHZOOR?=
 =?us-ascii?Q?sYWmC+idAi1iYXBKYBVdMkRMr8gHyqAtBMckjyG1JVT5eTyckdN0kcDsB8Lu?=
 =?us-ascii?Q?snFECKgQ6ls/y4WNbMS265ludpU2CkZIezTrylWUcIkitq71lwHdteRavnez?=
 =?us-ascii?Q?e0wroOxFQi67oGJaIqpThmF6jeyHQGzD/vcy/PyRWRzAIKlwpVui+vJmfJJM?=
 =?us-ascii?Q?f6oav2zsoRFF0Zg+bx27rkj7601XGJiS1Aqvem0rHR3+kw7bTD5Az/y1Z8HS?=
 =?us-ascii?Q?m4i7nwqcp1oW3pPwNqb4YLfQ0aOAV/3rE4M1OYmaeiW4yCluFdVhRdEbaurd?=
 =?us-ascii?Q?H6mSUhAU+w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d02c92-86fa-4e62-7f56-08dee663fbff
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 13:37:03.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeJjwPSw8mQuWNmIShKb4eyWj7wQh0H0nI795gkoyXmh9ovtNx6SZ/RUeGGEQTaOk4H0S2S+L2dOR+KSCpwYNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7259

In Layerscape (Arm) and QorIQ (PowerPC) devices, hardware peripherals
are accessed by the CPU through a portion of the SoC address space
called CCSR ("Configuration, Control, and Status Registers"). All
hardware IP blocks have their registers mapped here, and the Device
Configuration block makes no exception.

However, there exists a secondary range of the address space named DCSR
("Debug Control and Status Registers") which, like CCSR, also holds
registers of hardware IP blocks, except the DCSR contents is hidden in
all public reference manuals.

The intention of the CCSR/DCSR split, to the best of my knowledge, was
to place the functionality that is too low level for normal use, and
which is necessary only for debug, in a completely separate address
space which can be hidden.

A use case has appeared where networking SerDes lanes need to be
reconfigured at runtime for a different protocol (example: 10GBase-R to
SGMII), and the architecture of the SoCs does not normally permit that.
The Reset Configuration Word (RCW) is a data structure read by the SoC
preboot loader (PBL) which contains stuff like pinmuxing and SerDes
protocol mapping for each lane.

The RCW that the PBL has loaded is visible in the DCFG block's normal
status registers (from CCSR), as read only. Turns out, the RCW is also
mapped in the DCFG's shadow register map (in DCSR), in a write-only
form. Writing to the RCW registers from the DCFG's DCSR space to change
what the PBL has loaded is called "RCW override".

It has been validated that the RCW override procedure is necessary to
reconfigure the networking data path when a SerDes lane performs a major
protocol change. It changes some internal muxes which connect the PCS to
either the 10G MAC or to the 1G MAC.

Defining the DCSR area of the DCFG as a secondary 'reg' array element
allows operating systems to perform RCW overrides. Since it is
introduced late in the binding's lifetime, it is optional. It can be
identified by name, but also by index (first 'reg' is CCSR).

Note that while all SoCs should have a DCFG register block in DCSR, we
only need to expose it for the SoCs where the RCW override procedure is
known to be needed and has been validated.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>

v2->v3: none
v1->v2:
- add Conor's review tag
- update email addresses of DT maintainers
---
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
index 3fb0534ea597..fc14fd0bf84b 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
@@ -36,7 +36,20 @@ properties:
           - const: simple-mfd
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description:
+          Customer-visible DCFG register map from CCSR address space
+          (Configuration, Control and Status Registers)
+      - description:
+          Customer-hidden DCFG register map from DCSR address space
+          (Debug Control and Status Registers)
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: dcfg_ccsr
+      - const: dcfg_dcsr
 
   little-endian: true
   big-endian: true
-- 
2.34.1

