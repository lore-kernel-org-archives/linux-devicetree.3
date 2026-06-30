Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68940BCD8;
	Tue, 30 Jun 2026 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817528; cv=fail; b=fA6lB2fBopAyUK8b7SwLeVTwDUshwBcb66CjK2SlDT2d0BdT+pHioCT7anFr0dytjRpr3YvWYfM9LxN9h32cQNOtywsFycHh4f+4jP4+nzla70ve+3asNvlS8RJ8ImkgKFBLYlzHkhjB61/PbVxD6ww7xHqT6Z3MLuklV8qPRRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817528; c=relaxed/simple;
	bh=Yn+Iz4w7MbLfq8wisf1z49Zov+RuBBerSEgSp6sXHr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WALNWbVpdirTp2Yk+qdxgBy/6uvxDwnMbWsGnMZD3JK2uwiQoDcMUPV9xaz4fxkOdUIsPLFRr9KoQlRDaSk5kKvoi65X0otmP6PMgGMXRq9+YkRI0Dosdr0x/Qg5dpGpsiqSnnDxIUQJhlHdUTdcC4wBKRbTXGSpIJQRG3GrpMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hAeHB9AA; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hAeHB9AA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD2eOm2+4/z9XiP7SKBmMsjuS85W4RAt3qn2VL/7A8wZJ5OnEy+fuVKV6ie5IFJko8teCpcKGSvbtDdmGv96bpU29VspbQ3Is4o9lgcDIOqLWF57wlXOZMktvDvVYn7E/43Ocq9zxDnplnV5GZRhYxvTzzzaKiaoLPL2ruIbCNM6oc2IZRDjzBUgXWX/YupkkY/lZ+YjL8CFcKyTwpDHfAKU9ITyFc+Hy9WZtOgUPuUbFZvCLxG/eLgtqyj8IA3wHri9oOA3Rvpw0oPCqGS08JEKhmNK3YDseaBM3TYvierqfgH1w/dVD3ZLLGMN2Z0iSUy48+g7kqLv5BYXupb2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F34xujeJRcJvATqkaEbegD5OuAr1dSO4o0K6LsGVomc=;
 b=UEHCA8kCNTs6ZugaEB4J2gkh7J2hp4VcRRhb7mdft2Qw+0GJZhdg8oACaLrUc2U2HZRhmXjBbKZMS/VObSrNJEDnea7wsDlcM7CLodwrrARW5jNOA9R/TwwLZTTckg+F/N1wzmUGFyLXRbYonfX5FJwO2rQRSbHuCkmL9+ZD5fuRouAdcNhsFaQCZ71QkhORbkyL8mfsn/BaciIkgo3jLCXvhM3vy7wUMZjcN9BGjvx8rjj/i9vm21+wu48SgbG/Kp7lsGuR+dbAofvb/XnH/78tzC1mwh1IO5T6aHYvuyFFG4oDq8WaHIbOkTWxjq62lNTx0BZb9YOc8sUZlhbQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F34xujeJRcJvATqkaEbegD5OuAr1dSO4o0K6LsGVomc=;
 b=hAeHB9AAySIMKgCy+egJuE0vt9dwtphUX1HhPcp7+eAFHXfeJG72qqCPezkim4RBHgcXwD34S1kyQDD3avUDiiL6pJ2IkJMNrISYsXd2H322FDiqwpfNvnMx/j79uun86H7fsQCADqbokwzH1ZZaTm2W6OEcIhDHJz/eK8K5NugjJwRRpczXw7UGVK9BbdpNPbA/xpSzurSR6KF62XjeUwRtYR+IzzRh35bN6zMY3XGiNpIW5y0U5SsG31nmbPvD1POFWz7Mc4w5xxh9ioaoTCxKDiCAOiEuA2PZ4S6MmvPpUm3MpuUCVOxaI4KJH7824tErg/jelYyEuP89/MxFbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DB9PR04MB9675.eurprd04.prod.outlook.com
 (2603:10a6:10:307::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:05:24 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:05:24 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
Date: Tue, 30 Jun 2026 14:04:57 +0300
Message-Id: <20260630110459.516364-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630110459.516364-1-ioana.ciornei@nxp.com>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0341.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::16) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 734a779b-e764-4fff-8241-08ded6977c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Fro7iZtHJ6Hgu1nGacTbx/tW3FieLUC20FHqp3fnkkvcQwfu3QGY/a/urmSE9tge//QTd6Pbhk4j+fiEfM6FiY0wj0imf/sQT5JmInao3iLxv9bj6Mvbv3niPxdCfquX59lB//7TTVqnn1BiuO8AQ1ERiQPrEFldxegaw+49kbIcc0GkkhYUvlIEfWGi72zJd4c4WccbezXBm9Vf3Dc5bs9gHl3jRt5DWrxL5aBkK1ts+4gkFHcxs+SU1vCiKdwKMHHp4vsJkIz0sOxJAnpHjOShuO3SPKqy8rjwioBl4vUZtkOGPfl01HuiGUIMcx+0vzy0Fom050iTE6Rakgg+k6j2WqLC5Y8/rafCrvK5TZgsSIlFQyWJCSzUqcNKRd62gUWDwH/baoeTSzE1fz0CyagRskbfbsfsFy0SMsqlfpzgtgHSq844nYs3cWztirHwYJEWc3v96DkZkszKBRTKDbOf1uMdVK530pbJJ4ddikMyIA8kcW3GJJo2jN6ygSTsxJTFjCXOpHx0isa0Af3T7Fy7ganjH5X9PM7q0NfDHNUSV7SZ61T6ScSXRH8suc4L26IX1EuV63pHDZdy9JTYbWF7myj0+DgJKUnLskix2QuT1zLih5tMZVJAMlKth5FJVv76O2zAPvWwrgavNgzHznZCf65ZImEOF2Yn8pQilXA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jt2hyEeg9Y05N+ZYaLFj6MV5HwwGRipE4aI5P9b9bFzxwRFQidwcfliiaL/Y?=
 =?us-ascii?Q?0Hj/Ulkh6CERNkSQrug3HbrypKQhvhNGYgfdWltWkFmPqnaySIBJ0CDQoWRl?=
 =?us-ascii?Q?v4IvOSRF6gIDBkXAnNhsD175ndtKNFjsRwKgxlLAhuZPMjbRKJJiipp/5vrn?=
 =?us-ascii?Q?+lLDCqI4oqtU4jL7SOfmDvAwFW5LDZOqfYtM/kpbbUOVoiftx++cDTt+XCH+?=
 =?us-ascii?Q?/D1SxEIsMB1tS6Pp6VgB20rW7eRf2CG3rleuFCsf9SX6mPakp0CLh6ph88js?=
 =?us-ascii?Q?kTpndhGSgS54c1brehrII6LgO98beVRVeB9/WFRpZSiD9Opv6KUp+l3GLwQZ?=
 =?us-ascii?Q?9YdW2tWLN82+4E92pqENnhM7w+B7HleX74JUj+xi7BGPbSDxRoJC88icPf2c?=
 =?us-ascii?Q?gH1G6+N2UtYspL4ZBkXnImczjCSViKY23jTpPwK5Az/c3nA+WARDMpO5CNgL?=
 =?us-ascii?Q?dd8Q47x1r/86aEPke1ZtVltAPPesUViCIHbk6csMY1xujjcUkaITvA76F/iO?=
 =?us-ascii?Q?xRElUPyMb/87Her3XNkPbln27DeZaN7rBSVHcJP5f+v5H2wkOZe0czQXlN7Z?=
 =?us-ascii?Q?YZVeLFWkiI1IMkJNHPqzPevnxyzpJZKm2REFk3cyE1V/okFkS4UQyyc9vgcc?=
 =?us-ascii?Q?/bs1H/Ph+hLLp9SlaVcUjnQP03j715GAQWdcY68Ut3yVfR5yZSQpjSi6Wrzl?=
 =?us-ascii?Q?wMshivq/m40KF13E77KrlBODvzaNJG5/5skEExc5NTVhUueHdGfWOBeieR6S?=
 =?us-ascii?Q?j3GXWGDU+dFcQ+JN5rBUJb/ANnCZ4WE5F0esKObCOe0yXG2hV8YgBv8l/a+O?=
 =?us-ascii?Q?kmFybbFC8PJ85wEmkU6oq+YvXmPS1Ic+VvwTqRv/cctGNxBsJP/GZWaHWR6j?=
 =?us-ascii?Q?5/vLFQhkjyFJtirrNkX7wUQ6AMzckCVRC4Xsr08lrU6+TItboAhujc+RraIT?=
 =?us-ascii?Q?pnnmOa6hM9cHOyfDC0+42JrkM6pgWAgvFnsQDRHUyu/dC7i+0fARrvjJ3As5?=
 =?us-ascii?Q?e2tTFPmpDsIJ90Apb5taDTPBsvTBVlloXoJEs1i9qSZxf2TNS4mfthHKqlQA?=
 =?us-ascii?Q?/PhMDP57IxZ7X0hunRJgBTAEMaahHcTFvPrbCTQz3hfD5eLmTI4ylZz75mYC?=
 =?us-ascii?Q?W/iFiUwEwjvtpH7loOywcmNp3CQ0qzubimCQi2rO3WvLzas8Ydl5O1jRr2+C?=
 =?us-ascii?Q?1Kr+YM8yrUNs0wLOyEPfY0cp8NKP5qYN37oLVPAfGAdpHdvpToWaL1U78g7o?=
 =?us-ascii?Q?QSvhzN8nchpG6+LSQyco+4wuvoPjQF6icLaTcUigGsFBYTGj3LnSxKCCohmk?=
 =?us-ascii?Q?YVDbqJb8gqLZRwEcy3WaiGG5ly+0ZLt28szRkBWFwUy2FEHgBJsVXUjoerOo?=
 =?us-ascii?Q?CNykIkgr2szMirjQiicqsveZ9GzLi4JKoLYInCiQWB44zmtTFJrh4UmEEPSF?=
 =?us-ascii?Q?T/LzY22EnhioaURIK8Z8kAxn36wH61np0NfzoZEwqJOTBovqaeLhtzll367R?=
 =?us-ascii?Q?t4gKgogOoDIpzp2wJ/EDXXhHJheBZn3doaeZ+aTz6pIpMId9BQZT0n54wqKy?=
 =?us-ascii?Q?h4t9hfXlxO8xCWLlWUt1Lc8+e4LBJC2uGdMaL7MUKnbaMuGjExeXY4tFFkfU?=
 =?us-ascii?Q?ki5h9pNI3gaCLMpwOoNhNbXFaO/vj7skyzqp2KfEnSOudgETVWJadCfM6WN5?=
 =?us-ascii?Q?2LxwCkukfklBhsO0cW6AeJQ7XPVoWBWJTjdSICdNmYZAyhFylpv/LeYkqDm5?=
 =?us-ascii?Q?y06aKJmqqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734a779b-e764-4fff-8241-08ded6977c38
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:05:24.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS2p/W43OXrVDI59ZOkn7EqdZJCLzwCU8Q3I+WMkoqShg52sieP4WPzm2OT5c99YWWviV38D67H4rdmEM8wuWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS1046A SoC. The nodes are left disabled at the SoC level; board
DTs will be expected to enable them once the consumer Ethernet nodes
appear.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 6fefe837f434..db935805c379 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -424,6 +424,66 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1046a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0xffff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls1046a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0xffff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.25.1

