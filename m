Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5382882C5;
	Thu,  7 May 2026 03:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124730; cv=fail; b=NFwKUQq/Q+Dlwz0FDcyMWtOJSAwpLUMQo+od9YcV7YwA0eT8RIjJ8JNpHtKsDWYVVWyziL9zBRX9YIYCii+oPVHN4ijuyl6y4jWoWaAnc7tYql9Qsx2QXmKlMCMdV9WNsIpEAa2oCYmWtJkuH0wcJVQQSrJfu3IZxvrgG2F8Cu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124730; c=relaxed/simple;
	bh=N8Y1wTKEosJYBGYyNdxRQougBCYs+tKwqjyMhvFGhYk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PHscgLn1H7yfFdQb4+c9dNnGvQynoqDTs18fqWDvMQ8NmP9LGxFOaAlT2MjSa0Hx2vlP0JV+xhuYCWVU7dMH8sJyVbw5T2im5n7CWyTbVblI0Oks7BBvXjw/FPX8DWDTcAdScvhbyhZgX2Luraw/CJuRCglEmt5prDvA9jE216U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Ue2dv1Lp; arc=fail smtp.client-ip=52.101.43.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Ue2dv1Lp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB7OkU9CLhZRLrqF7+GFR9Ouyi/ydOeb7GcOvb5LSmGDFEXk522HPS1P/4sXUPl9lvaW7zCNxSxhXL9bxiy75keaMLO5L++MiZZAZkm/JlXGimqcfi8E6LRheBcqwncUa2IwMBekJf/99yvImnUiV1+3DiF0qA60MfBht93tfjL65UrKcVvy+KTfmP3kCRLpc1z2NDYF+7UHn2hOzVxi7ykYEV2kg0hsbNOKyWeSKZIxnvbgOPKzkUP85k9LZolBGTSbyfQ05vUx113moAdtdSYqkjnG1469aUzsI0uWdm9PsaC5BKcWn5Orfsu7G64I2n0Wsz86pDLZSwdBmPupyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOXwkUvUqLyNTU9r6lIJj10THJUc5XKWZQERRlBTc2E=;
 b=QnEBPfm9GaWlXBJ28Yk7aHgxMTQwwdiKOTanrYre4isIr5/M8QMAzQNE95lfWFVN+yf1m/JK6wZnBRRUqyU0kwmhGzLsxhcWGgm8wa+yen+U6WVaGq9lcCn4bSUzW8cgRQQpX7CLuX09KS8MtA54b9y8F8bcH3+v6d4646ew9atIto/jSC2scE5gxKAEKgYb87J9WEcqIoBFJE3Pv8+CT2FHfIS0CsST25IsfgacWnHYSUNc3Ao5T5WIRoZ55jr9K87SCthNTsXCh1yoDhBnDuF9kQwdK+LXe5u4UsABx/Rmn5/nCN23GxQZnMcUfpIzBaWKjpoDKMmui3cTNJ57ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOXwkUvUqLyNTU9r6lIJj10THJUc5XKWZQERRlBTc2E=;
 b=Ue2dv1Lp+yfRHNQIKk3QpVeIsurhyP8WqPuqO9ZqOBj1A4LyzRGqhQ03QREGohfirVkeoZ8f++oimcDt1qmy+W8Vy46SwKaX50AmZexYZhDsFMXvyMEXMi4wXZfmfdPbJP7B4ImRhCCEtW0vPuLbsQEokvehjzwDNduQUvGH4Th+48vpj7x5gK8fp4HR6G/4AJCTxvm4Neh4qmdBpn9LsN3JNBuzs5l6ZZ5Lh0NZJcuSMhBncbVVvGBMdPmhxPqsit8gK2ryoYOpefi3j/JGKnLFFX3K0WPdIAMo9TcBKusbwL328AJsyudrPl87L8+5/gVXim22zAwq8Lr9S61/hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CH2PR03MB5192.namprd03.prod.outlook.com (2603:10b6:610:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 7 May
 2026 03:32:05 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 03:32:03 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	adrian.ho.yin.ng@altera.com,
	tze.yee.ng@altera.com
Subject: [PATCH] arm64: dts: socfpga: agilex5: Fix phy-mode to rgmii as HW provides clock delay
Date: Wed,  6 May 2026 20:32:02 -0700
Message-ID: <20260507033202.26363-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0038.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|CH2PR03MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eaaa3da-bd14-4980-c6c9-08deabe934e4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	KO88h70xLEPqhwOVljpsFv1dkK4T2GgRgzk18M7QyB6AMYh3g4QFSrPQ+P1rFtj9htqUGQlgjPCzafrjyMEIN0jcbmoMv5aBGtS6Fw7FzftLW71ERYqeSCCnLOEjdWS2tFs5hfPjAf7ZLjeW6aRCy3iAr+vsrhz9vHz0jCfS9PnyVB/UbYfxVTH+aTQ2dgKbQT031jBBVqz3s3C2e6BhmpjWM877CNIOEAF/JFxoX1188scy4QgK9PpIP8p2ddl8sI/KCVFoba/OA8MP83/FYpP3Lkm903K19Ncg6kFBlJ0BqrMeN8BYnEZ1G4beEH4F7mrw72b8MP2bh1dgZ7iulnWYkC4M2Du9ABhTiGiHzoQDOPN1GlLkacPy/q4joZE9ajTZcZNBK1miBAnqTKaXo8p9IV9hXN6qTZLUthuLnSQfVxDM2S2TVonrN8jrOg+jTob6sg75Y527FcYPP6f+ujEs3SUaZjBrhcrA844dDr2xImZoqkGTniDYPkgJTgKzZhGhwZEv1ebPZ2rfvSW8z2G04QFd4nt1fUVgyctIAfFsn4XE1VP7dzcxzXxhSU4jxmjjfAtcuWjT7YgrBdKMo9s0Ee0o9vwlyhHnpCIwd5okEHnB00QkCoDN2GbEEMl04URVHPOIoPPTBYwzrdQ7xoU4ULww8qCE/VJ3bJKrZeXg4eIDkZzdoDliK+cz1hw9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V6IhU+cZx8GsU/M5mqYtoHBABBgAVukIPFA/11yCxocXpTsaNPXmcnmFlC6I?=
 =?us-ascii?Q?Y9ayaWNJtseworhR3vEBJUJfA2PXa5a6UsPHNWJQlMRajgvFEPGHuyR2mbMj?=
 =?us-ascii?Q?5s62ROoA+EsvoVJ4cSQlt6pJPKrT7QlmAL1ggw13NOqkoOPOGUSDHlIeYWA+?=
 =?us-ascii?Q?Ic7sco06FlL4lolwSS5Oad/psUgR2MZn183grs6N1c5btAsXTlSe1YR118TL?=
 =?us-ascii?Q?LkyXBRmbv94sEQJFck9MLivobaEc7m39KK1GQ+Yppzwqay0HbACWhyVFxf2c?=
 =?us-ascii?Q?Vt/O9LaNshn4VmMkXIxBwXMOc+xLd8TBbh3yAazr9pvsL/EqMS8/2DmGWNgH?=
 =?us-ascii?Q?8531v6NKJ0OafDCvFiCpVmsAnYC5ZsiOST6LqiPqZBmeUYGcVZrx6V/sdcNh?=
 =?us-ascii?Q?vxOZrZQIYrOt60GgHWnULYoBIc/9CbmI1j5RNRZsdkCeOYAuppS+hpldPXfo?=
 =?us-ascii?Q?mo0pPvg7yF0DgPKw0OutfLK0W7UilH9lno7AcX6stv0RFwAiRNs6z53jUH06?=
 =?us-ascii?Q?JmAp/RqSMBbeuOxwZDWpcubhijNiVWXL7WdHgAdfFaP5zfsB3WnUejux5BWT?=
 =?us-ascii?Q?q6N+BytpbwezsMtwwpnMhm7pdOj+uVo8kolAxXHbWX85lTO+rXzB61bHkgGc?=
 =?us-ascii?Q?0RSkP2O6W230DgfvsyQNt9U/m8l5/7XW5lL5pnboIjfWqUanSXMFuPPoVqsj?=
 =?us-ascii?Q?HzgGo0Jz/x+FnvjgryOYITy/0nT9Y44K1hpzreCD6ACwkhnyjJ+jqq4y+gyo?=
 =?us-ascii?Q?8vIMx+kqHMzh8PLY+jH8G1i8ge92gi5YyGmc1jdc7Edf5wxC3TvPDPVXbknl?=
 =?us-ascii?Q?4IoFXo2VmoNQNf+zozgcMWArQOPYKfBfC4Pm6vYjE/+UFuog2cmZ9sOeIkQZ?=
 =?us-ascii?Q?8UrQfFUWDvCbfWMNXVI7LhkI0LbBlEVxMlOMwS0Fi8Lwjw+W6lrGoqBobZu1?=
 =?us-ascii?Q?h3WVtV67n67DekalFGmxk1R2idoKJ/oKJAb0e5Bh2Dt8bY9cTQUyUT7NYONy?=
 =?us-ascii?Q?Q63cvs56YIQcjG34Yz1DtUvRFZAdj46zUkdKcrIRJqyxf6+VKQY4+48C8e6g?=
 =?us-ascii?Q?PMqUJ3SF1w62cpaBqOY0zpIBk/M3oirjiVx53OdVa81DqOxtu4GzhYOw4/UD?=
 =?us-ascii?Q?JEw4mwd4hPS0RBs/EEbMQPVIJSSCVBY7GwWCp030OmKXlmGlArFkJZeULctz?=
 =?us-ascii?Q?/oYBHQoR9SBojuiUflkM9o31PGOkISY9mC+DfbBbvp8dLku/7ougXiF9j12+?=
 =?us-ascii?Q?syAuLF0zBqEYEiXJhKwKuXPiAe6a/VLQwsV6mH9kcwtD3QbJ2YcxFiHVt6Cw?=
 =?us-ascii?Q?mCe0zBSWPJjpnRG14RCn5SdRcXBQc0Gud0pnF+2b2FZNBlVbrXvDFjLz1aaW?=
 =?us-ascii?Q?s/2GMJOn911XlEan6FLaszKUB5EExfluqbTxAx9v8DhmwgF+FZkxwYdkPcXb?=
 =?us-ascii?Q?5KMYqIfnPHOLKu7Ke1UW4nlnMqUOfyXSQVtDtG6yn4+DUiTwJ6T7LmsX+JZu?=
 =?us-ascii?Q?ou+zIeVsdrhqduBDbiqP2ISo++DzMkZi15JOPUr+F7KkFihP+1wiE5qhuXnZ?=
 =?us-ascii?Q?6jGRnFcFKMh3fFS2v0H7FlBaClFHFf8WEE+AvG1xtOE8jCi4LZHRNZXa/JhD?=
 =?us-ascii?Q?jYz+5QvNIMs8wZ64MEHJdUpJA1qdULsQdF6lvY7NstmgKMbAhuzp81W058TK?=
 =?us-ascii?Q?JpBSJlXEIIsQR737SUNgjsTQjHtCt8gD00M5lxmdFNP+071bW/2sroBl/N0h?=
 =?us-ascii?Q?Iw0prlutI9A5vtUpxM+VmtK8bkyBHHf2cFS0I0zR6XuOdAeZd7NYG2FCg7VH?=
X-MS-Exchange-AntiSpam-MessageData-1: 9chThh4T3ptpeg==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eaaa3da-bd14-4980-c6c9-08deabe934e4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:32:03.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2brNUbu2I2rtVuPuOP30ADfSsE3qpQmARBA5ZifO+QpKZsP6/vEIvxXwvHLmueC6IOkbupouyjMr4v4St7hnTXnimEkDAXAgWFAfUSDCwGTUz1BOaOeXXnVO/72ZIBqPeG/GdW2kBwUChHi1iaCEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5192

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The Agilex5 SoC provides RGMII TX/RX clock delay compensation through
its integrated I/O hardware. Using phy-mode = "rgmii-id" instructs the
MAC driver to additionally insert internal TX/RX delays, resulting in
double delay being applied and causing Ethernet link timing issues.

Change phy-mode to "rgmii" across all Agilex5 device tree files to
reflect that the clock delay is already handled by the hardware and
no additional software-inserted delay is required. Add an inline comment
to satisfy checkpatch and document the hardware-provided delay.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 262bb3e8e5c7..bf0dbcd89f72 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -42,7 +42,7 @@ &gpio0 {
 
 &gmac2 {
 	status = "okay";
-	phy-mode = "rgmii-id";
+	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
 	phy-handle = <&emac2_phy0>;
 	max-frame-size = <9000>;
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
index f71e1280c778..cd1e545403e7 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
@@ -41,7 +41,7 @@ memory@80000000 {
 
 &gmac2 {
 	status = "okay";
-	phy-mode = "rgmii-id";
+	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
 	phy-handle = <&emac2_phy0>;
 	max-frame-size = <9000>;
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
index 1831402d8808..3a54fb14910d 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
@@ -44,7 +44,7 @@ &gpio1 {
 
 &gmac2 {
 	status = "okay";
-	phy-mode = "rgmii-id";
+	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
 	phy-handle = <&emac2_phy0>;
 	max-frame-size = <9000>;
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
index ec4541d44c9b..877e0090cf9b 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
@@ -39,7 +39,7 @@ memory@80000000 {
 
 &gmac0 {
 	status = "okay";
-	phy-mode = "rgmii-id";
+	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
 	phy-handle = <&emac0_phy0>;
 	max-frame-size = <9000>;
 
-- 
2.43.7

