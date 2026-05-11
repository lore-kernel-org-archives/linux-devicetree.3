Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911F3BA220;
	Mon, 11 May 2026 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487339; cv=fail; b=KpRNPXtgAiVadiplPxfx06Vi3qAiH9MDSLszmGcmEr39ij8ZP30qFn2v73HOmZuy+SMLnsnN7CxhkAQgTNkGKUMhjpQKK9M4vaJuwP4Hfq7S0l0OKR1iR/37dM9NGG7Ib+WEPMdQLhyhymUelTm/OD/z17JdpqWK8mxorbfFwg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487339; c=relaxed/simple;
	bh=LtFMeL/T2etMi25RJ2vmeqN283cuox5H0q+s5CnCssg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KBqPJBLG2HDWylBD1PiI/Ry4TA9eV+Fjid7TAtYO64e5IAMgC3y+Ez8EfzKE4qaSdTdCq6U3J4aE/v+X2i7btCL8vuvAs+8Vf20dhRDFacKLseglkor8gRUGw0mTezu0OPFxouFg6JALaHt0r8OyGZirSKl6FZm6JK2Ry5uWd6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=rXDY+VK7; arc=fail smtp.client-ip=40.93.198.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="rXDY+VK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sq8tuTdTQ95PSwgczcUowhNAaW0ohKWHhiPE8cbKDwO7Q7tCx8YNlmTPTz87QCp4frjiTbLqn6BucSvXYcA4GIYQ+koCJ+1C+oI2OOYTsUpqCAdR5AyPAYReh7CggN/QUbfyHgi9bpNfSrXpNnozVmX2nD+oSXP3PTT7b7hQU7v+6PS+jCWq0FG8+CS7vFBknF3PAnaTPGiDHP2Fh0Mry9Msd1a6h6y1ncWQ+xiYZQPO4G3u/yjDyhTqEoFgLTgC+6vJymbHJ2NaZ0ad7FtuTG7L7ZI6lfNMTUhAFbst7u10fHJjIr/uNHFhZfF/ArQM3Mri6lgj2nQcRhMIxdHH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eqq/UtuM1FXxwCNIKab2GAR5FnHQAqDXK4GEMF/9WcY=;
 b=ZKvt0IGhhYDRxfUrd3jHINK7YyB9CzvnNKQnewmtWfJYZnBrBg7MfzKJRxeQvrDDWsPhVdFmXeXL6vJSqj5smHXgqZJRwNe6HnCSKBy8NYYW/qoGvQkHRBiUksTXSk1f6tBuCBZKSzJJPhGH7XXEe6DRSaypxwYjanH3oI7hjqaWaRKt/Ub5gwOHaxeDXPckkl7Daxa84PFeBERbnM8FpjhDoh0L01TFYuWdGHOhIsxkJ9f6cZA3qDKeAfSeeQ3Ajjurgn+AoPTQBt4VnSQwfmURTnZlMQx2u6PVyAtBu+7QVYe2d5HJAxdP6vZi7CPNvAsbTi/x3xG/0JJSDmrIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eqq/UtuM1FXxwCNIKab2GAR5FnHQAqDXK4GEMF/9WcY=;
 b=rXDY+VK7eoXt955Gs9dvD7LkxbjoNBH5G7QaGJab5+RAOQQUgItWaiekyckG/k1GtnLWbYQB+afO/A35B0FhXYvpt7gd/xlAKv2/4UbHhOc68y7Mkmzh99eNg1+wNEqGVsZoZ7Pg5PUzwIWPTd8ljCG0hp/4sp53zR4Oq+HWa+AlorPwh3MmCq6rHtUW9fT1wDQwf0wGmMQhcq5io56IpFQf29V4UfN2cUcDyF2VONKvPWmrGuPDlchpJzVLkmsGAHMpCLvFb7nX9zdApSLDFtuV8uiGZdHbDdIRRH4ZPzpzxqjZZ/C4HMl/bXxz25mZEff+wJ1d9+ZSVnOD8pvPBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BY5PR03MB4949.namprd03.prod.outlook.com (2603:10b6:a03:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Mon, 11 May
 2026 08:15:21 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 08:15:21 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: socfpga: arria10: Increase JFFS2 rootfs partition size
Date: Mon, 11 May 2026 01:15:19 -0700
Message-ID: <20260511081520.20247-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|BY5PR03MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: b94e5c54-f505-4ad0-772f-08deaf357203
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	yC5p+QTIpcJfRZpIWUcwmlcCzovzczrdJaVzg0XfqtGGMWOWptbj6IyBltYAS9qNsKXlhaIZtdW4MmvaJZHxDxtNGwaQGNPpYysGDlKM0AfUZCRtJXjjNh1rHWrdyQxXca5jsCn/z0DV3mqan7F3jFcsp3zI9i2Kr792nOkDRT4t3pWjLoOrZprBPadWPaJJSCI5hLA9bnjYjCu58Br5C7pyUfkqdvUTtIxccUqeffeXuwNhISQY50xV2J8VDHhW16WnqCWAaJelkAPMDBwV/F/RQIsW81m5fgQuVY2XSTxM1j38WeaOIg1FfxiR0d4T5fBtAMxskW/JQnmxh2CibCBGJIdPK6ZetVD3Ta1pxFSBFgSk5Nyq0SSSfofL8gRrtxWScY6NEsEhJ9CLCC4uA7fMbOydiK2v2FdqGofeFMU5bfliLqA7mMcAhgH2EVZ2/2Lv8se6p9g4fy+QlPBKzAejQcIfYW5jJUtubnESAI8TDm4Yiz0/KECBjztzFwUbDGc4I5XSLUN/kanP/cSPqEic09dQBB2CkdR4l/VNZQP35n2Aqsj4ziPOaO2OnwXpjvieVHeMMSzOIZDktw2jEQfIhzBsYMD05DvFzzzyrOpEVPhOE2Z+95jl1bJJFxf8hL6aGBgwJ8agNB13/GRlaWYO3d9LaWp/u/TTCHbGq1CShrna5kLsMj34EPtdIRvs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZaiZs0G8XUrBD/WDnFrLK7NK82IVwyu98gQbOfkPvIQXDL39tGN3qQec0w3F?=
 =?us-ascii?Q?ktlpGun3ru+9eyuunCqQ+gidzNRjsP6o5MjXUXeEjPUG57bBHtO0V/XlylzF?=
 =?us-ascii?Q?1a/8WRzvH7uwIpmkc01SxQQ28X/oU4hwUUYnji41wUG1BvPftQQ9m3ueZPa0?=
 =?us-ascii?Q?NbRRiHBmFve78FIYS1po1PAAYSXi9abePBktuLr/Oifmh9i0m4V+OJYs087/?=
 =?us-ascii?Q?QpVLu5tijQPNvRrOp4Pg1qc7RN1wppoyN2H0Hajkp4hQ00wsmEhuqQaGPrQF?=
 =?us-ascii?Q?1Y0EYQTUemHSi5g7CJIPQwHwaYlU8HZR7eCLrMhV9sCoglpn79vuCaQiB6sK?=
 =?us-ascii?Q?2dU2iWBE3FNozTfcQ8EUBKyO8Y99+fWE5uLsVb2J07ToCaJy4QDxtUcAmkEM?=
 =?us-ascii?Q?Fo+SZlqVKR2TJngVvOVSarc2LCrloank79Szuu7mCa90L9ZWwjVfW6h5sp2A?=
 =?us-ascii?Q?bKCd4oQI4lCADOwZcjC0NxfFZslP+AdnYzPf5ChY5j1QO2GdaEBjHQmkwT5/?=
 =?us-ascii?Q?GfPLnqGQtJ8S7eFIH/RMOYZZmvuF3MqhVfE5qUtAz2Plv+Nj1GRtBB3aW/bX?=
 =?us-ascii?Q?JEesqzRU0AWbFSZECtc9NCmnT2Rj+WSq4SeMzGBP/2EubaUH013O+jySOQZv?=
 =?us-ascii?Q?bnkOTKxMt5D4YET3COYRKekEn54N7GwmfeFOKGPjIA2Fa3rR51wGvIYybd7H?=
 =?us-ascii?Q?g6v8MUys7z97HOrA83fvKcJeU0nWYXZg+zy8nggcxhwdAkOuEMeWabZrGSwX?=
 =?us-ascii?Q?JZlmlY3jZ+itR/CbtIBwwJZWJH7OIGAKJw9+6yd8XGPVkzGx1SjWTMhw/lNN?=
 =?us-ascii?Q?gBm2nUsBozOgBOels2zxPmlO581s5bdwCHeMkROlXyWmQVPGaiImVzwaF+4t?=
 =?us-ascii?Q?qIgt5fNL8RWF01LUZZSFu+fLJ8cCi+TM/7CaL3TkW/vZn6YCcigR71xUtUQJ?=
 =?us-ascii?Q?C1vSeiIV5FkI02F7GcaTUNeVFV8B6Tmwf26W10aipm+04lki3vTWu6r8gi3n?=
 =?us-ascii?Q?9nCpwhSOu4VsFi2rcqradqFNoISzCBZExNfBu/Vu+8h6Q84OlaqCNKzc7PdM?=
 =?us-ascii?Q?kHlwTHZrIMt2TXQQvohk4sawnWUJKdXQjrq3NBs4ceKlMWQ/wvaQwB0kYGam?=
 =?us-ascii?Q?jgaHCzFGY2U4Ajgv2vPYcvL+0Qwl6s2zogbofoUMaj+CDutpoBDP7K4SL/wB?=
 =?us-ascii?Q?64MTHp56v2nNa9Pd+00ni0wribUh+60DXcoZQlEd9PqjS67O/CzFkqQ/TV4r?=
 =?us-ascii?Q?5n9679pVDSWeXOvLk0g5FVBPUJykl0GZiai21NkOmV5uYqzfJx3fu7D+vJwB?=
 =?us-ascii?Q?PdQR7hJOkkvOwFlNWfEzdL4gptMWqihuOmNTf/ION76mbQvP2DtEwhj9CgqF?=
 =?us-ascii?Q?af+9pEIPMFKsOleG1ceNnrv0X9s4Jzi4xuVh3RomU63Rm2/E8JOA1PDLZcTO?=
 =?us-ascii?Q?hFEMu2dLMYEfmFLwHRCVV2B9eKm1bRhgiO+c3+6kxXgvM3t2ai1nGTFKrr7g?=
 =?us-ascii?Q?qfWE2xxwX67C78cJS78F6Pd28fJHhqfOq90RE13saV42hDyFvu1UmQTLt6I3?=
 =?us-ascii?Q?DPnmH8vMI+hDBShaghiaMccNrRd+3PoWCBlwIiJe1I74Q9PqSoNJ/syMfM+K?=
 =?us-ascii?Q?a56mibeWzcjQlogW9wZd8T6w3kQvE4NiZjYkbXa5WYCHjLrk3Ix4hQUmo5uL?=
 =?us-ascii?Q?LART3cgE4mnTm2V33qIyQCdofNen6J2d6Jy/AAjxYqZ44UjsuNJ51Kc3Wp90?=
 =?us-ascii?Q?KDu0O8ipKwcgbtSJrElxisxJAp0SIeiwJx3jeTSDEWFGdHSU224gajbyyUFA?=
X-MS-Exchange-AntiSpam-MessageData-1: yLfdnTbkCFCCsw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94e5c54-f505-4ad0-772f-08deaf357203
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 08:15:21.6396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCsZDBLWIeAebudhgEAgH48NXiam9te9l+bolTJlESaouU4K+XMxTeHKcBcm9cQ+mBDSD9oBn0bdAIXL0IImoFbfeAhFUUPjwvmUzv/z167kVtVQw6HHxOtA9wRGznUFXoFPlqUh39FL4mO6XqpUmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4949

From: Niravkumar L Rabara <niravkumar.l.rabara@altera.com>

Increase the JFFS2 partition size to support larger root filesystem.
Also fix the partition label to match the actual start address.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 .../arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
index a662df319a84..5f9b98b0b393 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
@@ -18,9 +18,9 @@ partition@0 {
 			label = "Boot and fpga data";
 			reg = <0x0 0x02500000>;
 		};
-		partition@1c00000 {
+		partition@2500000 {
 			label = "Root Filesystem - JFFS2";
-			reg = <0x02500000 0x05500000>;
+			reg = <0x02500000 0x3db00000>;
 		};
 	};
 };
-- 
2.43.7

