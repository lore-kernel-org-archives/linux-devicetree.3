Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012048.outbound.protection.outlook.com [52.103.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA862AD2C;
	Sun,  9 Aug 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281821; cv=fail; b=L3UQUKwi1egwjuk2mSK9wIkQzJnVPpucbBd7Js4xbbvHeYByD5BPrhmNpiim+YZKHMLPLrRpcetz1ykcrZdu3mqLs7QzgzZA5JFA+ZTOCk3PKTB3CszW22s5XUu3JFq1H8Dus1//L6Ie3uwQCXqj5QkYGZHxYf7i+wR2xt5e16c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281821; c=relaxed/simple;
	bh=jTF52VjHYFUtZLh4bIYSAG5wh95A+onOEc2jvEKOC1w=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KPWt80y6CIPsnjTBUYDZZyj0G3OSlUmSwctut/cXcubvzhoM7p/9yegQU/4jxBBlska6AslWzCMrYQig5DEZvMXfV3I1pnyViqWDtJo+V4+ozzOYLq0zEcE9GmsdD9pTIliMMwXc6CsSUOCrkPDLX3QcqEmHPJ7/2NFC/bKUyi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=qgg3/m9A; arc=fail smtp.client-ip=52.103.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="qgg3/m9A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/P879w1sgUqN7P6RLzXFhUT7PnACKmKSFAX/AHKfqom2nU/S0trCrxL8IuZY7o2g75cuKsEntZWSst+hGbtMPibRxFtoO/yAgIdPZmluYFtdVg3aoMbGLwuXb9+vEm4vKF9vfPTl6Kyjrax/3SKIGXSN7EclPzPYnAH5SvWwZ5Zo8huOOLGkk6Vv34asj/itZuFuUWWLHxlWoEm78QD+Yu0btrX8wQnk+0P8fiXGVavSmG1ZF95+hrz6FpHA+B75znlzSzHrBQ/T8N8DXPxv0Gy6RmXQrbl8S5+Zlc7lbEepuGgbh9PY9oTOI+NHNpSh+k3g3ym5SDWgK7WftpCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1TbBt8Ai+5NX229n/JIG8VFGLlbHAs1nDV9q8hjiR8=;
 b=cxS/ONjQ0ypUl9Zp8kzwFSk5MYhYY15+B+5qFzE6GijZF3uf7v0LKEtV834BoufMIB91T9h7nIsViyrGX/3GH1wSq1Jh3S9CehkYz/NTUsDfBmqcidNeZnxYnylL0TtUurHvJsyH775xu4onsoN+OvZNaz24L0FMKeToMqv2L328n8hlQqzXlFk3WGVoc8fRuWRVWfeh+KYH6GoDSczB73p5fOycR6k+hCkPzW60Q04oR/mr/YsETeg0mBrnJOqsvej1kEpkCenD/hbq7ER78GRVTO4oSZyxXlWVKGqzOJG7URFIi0OYEGbSAFK/jY9K+FPvbqllr0DKBfvssLMJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1TbBt8Ai+5NX229n/JIG8VFGLlbHAs1nDV9q8hjiR8=;
 b=qgg3/m9A9eSZQOuayOQYAVy2+Mby654O7YCD2p8u6DLIZ8qMSMGR2WlJmm6E62FQqHFL0AqI8blLUEhcKy9KP6cFQwTN93ldugIr2e0cUGiw87iBXQCVkp89bt1q60wc4Y8SUX1RKRm4+0QeSepTTnOXkt/70JXbkTY8DAA/oCFiPYwEeAlOapZXfePLb+8O9e+l1opGhm5oZqxdqloIcDX7tziswW0nfxRv21peLDqSg9f0DRRTecDPyGbQ2BPXI6tWwhjKR9SEd50dVRnfVCTU3NA2xrGLrG8fjmLLPuZHCQBIObYldI0ZRGx4Ns+JJ4V3Yb7JGZ3GAPtIoFh8Hg==
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8) by TYNPR01MB8293.apcprd01.prod.exchangelabs.com
 (2603:1096:405:3c5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 13:23:36 +0000
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83]) by PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83%4]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 13:23:36 +0000
From: Shujath Mohd <shujath@outlook.in>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Shujath Mohd <shujath@outlook.in>
Subject: [PATCH] arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth UART pinctrl
Date: Sun,  9 Aug 2026 18:53:23 +0530
Message-ID:
 <PUZPR01MB514105672CE6BD050485EEA2C3DF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:260::7) To PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8)
X-Microsoft-Original-Message-ID: <20260809132323.363411-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5141:EE_|TYNPR01MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bf3aab-939f-48e0-21f2-08def6196a58
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|20031999006|19110799012|24021099003|15080799012|5062599005|23021999003|5072599009|4140399003|39105399006|25010399006|40105399003|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wdbv5lOO5xH72BdVfkrI+S5CiDqgUPXxdLyNjJbSRnlTNdsvdsUSIkLO+QjP?=
 =?us-ascii?Q?ITnq4LUY9EtywEAUe656zlYIYpMrBPJpS9FB9U+eWb04/D+MXWXuiSl5nDu4?=
 =?us-ascii?Q?pIcQ/ZAQlUmvQ3pkwbNiHqik/hhPNVs4+RiykO0qhBW8exJIA9hrSDvFy304?=
 =?us-ascii?Q?/YiYT3SFFjnN+3FSbAkvzx2UYlu2shvo63wrXFEV1fRvLBPR0uCrU7EXIltE?=
 =?us-ascii?Q?i5usLBBC5Ocx6TgcJ5nW89bx9qJNgRfH8MNmXmXjNQ2KL2o09eELVXIsn/I7?=
 =?us-ascii?Q?/b/XgLLGXuNST88xmGyHXNcgkoNujsJVleqry3ygJF0NhlExArvN5AZ4919m?=
 =?us-ascii?Q?m20h3kSIbtRLnpAsBBXp4re95EDPFJ41HBf8px/z3SR2vS3nvhtBqfYjpeVx?=
 =?us-ascii?Q?hJA/jgrC4LZvkAa3DI7/iyT6+iR9Q4Zvufao1vlSzHSNlnzZEuxvEJ8s4a/D?=
 =?us-ascii?Q?a14M+5diNQI5wWL6VQNYOC68gmZY+6PO5iIGLa2xgtQ5nFVjTn+i63RAwAPj?=
 =?us-ascii?Q?c9yxLJzdSyLFaY4C7lLGT+3YLxcxyYucNkFZRSPQ5c0A4txbapziQjWW6p3w?=
 =?us-ascii?Q?oxoIv+/KhVpktL/bt5Y5hd9VBObQqqNGugkCESKiXK6Y7JhB9XLZgkNMDwFB?=
 =?us-ascii?Q?SOTy72kvzBxN+Y3gvYehaa2omzOxwXCIRSEuNBaU5VhurVz+2rnWuabSFJEW?=
 =?us-ascii?Q?owbyJ3Q1hIXoMnntcwD6lPJWX37gR8rYHIKae3feSrnoEroYOCWdiy1mR0Yu?=
 =?us-ascii?Q?lDWsdcM37B+DrNm8ji3RM/i1Vu8mWY7N0LCSjmhudJLv+7x+WC3E/CJ5EerV?=
 =?us-ascii?Q?oIDMqgHKsCU3/0P5O3dbLFs5vH4QBEa0OgT15e4kq1Flqap/mccTUDyrk0GW?=
 =?us-ascii?Q?qj8V50iJ5HvEBguAgBHcm+Tgz56GGsL8a8xf1YuszHG2RZSd8Gtzf7rLQ+Vc?=
 =?us-ascii?Q?scCh9gbfs48EMnJgpl+nMujKURuAj5z6ExAzoqi2vh/khvJaXRewbobzOUZt?=
 =?us-ascii?Q?6EwnQ3ySuAz245wpnfCXAqyrAg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bcm64FP208BfTIZs5A00F4laA68kOMOc5FEuvy12FETgwRgGJ+bshUI1AUlv?=
 =?us-ascii?Q?SRvojNpwP5CqqAMlp4Sz+fP1Dt/IdyAbVS87n/bs7OkjCUPwBRGinITNU3aI?=
 =?us-ascii?Q?EaAu1aZ31/0DM+Ad1qmI6zfKv8JBeDPIhSbEjq/4gLQlNiOLblCWh1qm2fLD?=
 =?us-ascii?Q?bvB60jxFMOOyfDhGb5ysQ1LLYYeuASHyl3ViOvp2BFn/DYyLcnHA8EV0QEws?=
 =?us-ascii?Q?R2K35iBh+NxYhEvwEGIyoZSdw/xYw8SQi+znAxJ2Ad4+1f3RuxhAHvpy2Mu2?=
 =?us-ascii?Q?9z9ISWA6mRQwpA/FLcNBOYkCrtODSQN+65EQ1psDjDhsBNDKNkD30LcbeOi9?=
 =?us-ascii?Q?wb6p080BHOX0xNwKKYrDuTEp9GUzm4UuVRws9E4X0e1YlpAGnSIrXLCgE80d?=
 =?us-ascii?Q?A/ElTNYQZKCjCjiHY4e08UXkrXBoiA1xZyCa8sknOFJc3Lg6+g6yyJ02UlVA?=
 =?us-ascii?Q?dEu0AikKFZywwVM5AZEdeAntWZsW59SBtyFoqatZzDWI9lsFu6P5MXye74r1?=
 =?us-ascii?Q?bjZGmenZaWiOn1EsM64q4iulkx7QrcZKHmlu8LiPIXOag83oJ/N09hDhGJGx?=
 =?us-ascii?Q?JRjwHdOYbSoX7BasN+r/NjqM7VkQXSpd6wVNjVmWTIKcHdx2LgY0INs/UNkb?=
 =?us-ascii?Q?MAo0CKH/0DuO5r6oalUkBnuydhBjfIwiGQuQT3P8h8myfKzsGJQNbmMaTAyJ?=
 =?us-ascii?Q?d8euDPRm0bHyWcwZRT/dsWwx+AOoRL9BhPuhNXERGdB+Q2z5g6kJPcxD8nwF?=
 =?us-ascii?Q?Uy0ty/kWaqsJYgLluFNoa02w/2OIB5yM7n697pz1Q9IPbuLYz3opDKtUCozA?=
 =?us-ascii?Q?5oPS0PtGP04fjotQzg64rts/OiGDays/gxKPyGB+RW1mPgOQ27WII1n68oNY?=
 =?us-ascii?Q?Ln0xJg5CjnhZRXH2muG6t51f4UtRr0RdVVv8Mh2p7Rh5iXYrDB4HARn4IvH5?=
 =?us-ascii?Q?PAwhJ9ScfZSIxutsxZU13K5tFOMjYgkhnrRqJRQfAH5Aq3bd4BAtXnfrOmxV?=
 =?us-ascii?Q?EiL9EOjRX1bwY/8APHGiqSgg/Gii1Wd7XEP8ruGh+4LIOB9oK1Y2oftbHM4q?=
 =?us-ascii?Q?+/n08sEUSqUTae/LdUSbT7qfSwBp2J9vPi4UkHqPt6DE8j1PNKQxWZDkHZ9k?=
 =?us-ascii?Q?kTNQuZtzOrQ8+NX5qHTDYPb5wTU1ZTG3nqtuj49VaQCjt75CT/ZVE0LCAdP5?=
 =?us-ascii?Q?qlYybJY9P93Ib/5lU1xzMHQMzQJp2U2D+WcZSKTuem35KlZoPenC1BUgvWFB?=
 =?us-ascii?Q?UdX0YO4lP5H0gMgPz92N8PcxH+kqFYObaCR0g3u3VKe/8YLqCnh7FITO5UQI?=
 =?us-ascii?Q?gDGhdkNu4vzukEcOC2v2G6AQBsSrd5Bw9UXMTph7LM0x8tSnra/bQ2Rrn8b5?=
 =?us-ascii?Q?3GDW818QunRDoGtP6ipaQyLpfo/o?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bf3aab-939f-48e0-21f2-08def6196a58
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5141.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 13:23:35.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR01MB8293

Use the 4-pin UART6 pinctrl configuration for the WCN3990 Bluetooth
controller on Sony Xperia Tama devices.

This enables the UART hardware flow control required for reliable
Bluetooth communication at higher baud rates.

Signed-off-by: Shujath Mohd <shujath@outlook.in>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 14663948d4c8..395e8f1141e3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -775,6 +775,7 @@ int-pins {
 
 &uart6 {
 	status = "okay";
+	pinctrl-0 = <&qup_uart6_4pin>;
 
 	bluetooth {
 		compatible = "qcom,wcn3990-bt";
-- 
2.55.0

