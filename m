Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013073.outbound.protection.outlook.com [52.103.43.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8164A3F412C;
	Mon, 24 Aug 2026 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564761; cv=fail; b=KKD0wWum3Jcv23PnfQnkzeYaJTCt5CP6lP8aCQvigtOouve6lxtn2GbFxSzz3yx6wGpATTpLQgwo1BZTU3aQCbqyCJNmAX9N5yHvNWSRtjDO+f8OuRh3VUd6x+MLFvKwT2BhVtcuS/CtUJMSj5ePJP7px7dxUJrW8UOupGWK6/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564761; c=relaxed/simple;
	bh=mifcOZXENQe3zHDM9NrdWFN04AWD8A+OjbY7iwuNiF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OWq8SurHDQ2vc/pTwM2ElzscmeSvzwJ7r7k+1Jih5jXaFuXlBllIIOCQwAblDgMP8Gt+5/IGnqr1qSXSJosQmmFqVn99f3P/mvGPgqsTPeHHMR1YcIxLhtZwmkypm3mo0rZQGHTGO+0vZ9PeJJsCYR8hqFEjqW/af52yHomK2mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=hKkG7Mqb; arc=fail smtp.client-ip=52.103.43.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="hKkG7Mqb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wD7+rm6CB8/ekQ64xZzXaNnFI3yhPDI7TiLkX0DnGe6u1+d7n/nVCzqekzHjJe2N2C7jEnryPT2NRemlN2Q8RnLt8x9KeT087VKUJtg8wJye8shG0jP786/MnINnmNAjpwvmP1HHpPOxqa3YvssY+4TLWz++piD9HdA/vs24PSrcIMpNNJkFdiXqqJjf4xjM+LQR4BshW1vTBFxLgh4PsGeaPSLhWZMf4Y5kqRfIQv/IJcHkKmu0kU1wgNRYtolsWeOPBU96RRdEmfu8CPDqatV+4llDD25QVEDlKOb51H40ILrJF9IN3wYbECYfyUDcymL+Eon4r6trqsc4uYULyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuqHkuMmnAgZI9qOBBs/Tb6tLDrh4E1v6zy5fmFI+w4=;
 b=jzIQKSRnau8BS+lhn6I9Hy5CQMfepYGkRpU0hQYNncrAFFn3tCvOi9GLEgI4GPqgFXvVLQjxRIBbO0sD8ZhipfeeJG0izKYdnEKu5AKjcpZdSHjmGVgHWeE7XN6zE295zZ6hXnvzQDn0YOoute3eX79JnUsRFigshCU4hFK9nCw1tTk2rwHiWaIUsExUPudiaOKRrBT45xfWAmFKn+o7kaIz2n55VhKDQfht3WLwUyDSg2yybjJpWVpF1jVb4zyQILANcOVxUX0fr0zmBIjf1LCW7vaqr4U7zQ96iz3d9KcvWQx/0N6Yso8mt/TkKHDLU1mONIFVSUU0+Cqne7FpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuqHkuMmnAgZI9qOBBs/Tb6tLDrh4E1v6zy5fmFI+w4=;
 b=hKkG7Mqbc3gw8awxiitG2awxIdG3Qe2HoqEBMR+ZfMg753Dtvgn7ol+5Q0OTEMsY0rC9zysbzuP6piFxyNRnnkYfmdmhNra0ebGmlR6pD0Vp8JE3q8NtiF4j0DjRvwtAs5sMG146/r5W58cwhq2vS4hzsYxY9094+IdFirnxS7zZ1j1aQo7GEKXyBh0gW4CzWgYeVlX4bOTR8osQZUzUmPPHIV1z9ximi945KDAwDIvb4Divx9natefwXkwxQanV0kfXWq+rfbRz9FpFS7pujVOfp1KxdPvHTJtoFWvW7OisLcfvu0x4YxQ5aacHCEWhAv+Z6yLfSBbruuZF0cd/gg==
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8) by SEYPR01MB4487.apcprd01.prod.exchangelabs.com
 (2603:1096:101:8a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:45:49 +0000
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83]) by PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:45:49 +0000
From: Shujath Mohd <shujath@outlook.in>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	shujath@outlook.in
Subject: [PATCH] arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth UART pinctrl
Date: Mon, 24 Aug 2026 15:15:07 +0530
Message-ID:
 <PUZPR01MB51413F6FF89A8FA82A9B2755C3A02@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <7334c260-0130-453f-8169-c07a3145aa19@oss.qualcomm.com>
References: <7334c260-0130-453f-8169-c07a3145aa19@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0319.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::18) To PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8)
X-Microsoft-Original-Message-ID: <20260824094507.10571-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5141:EE_|SEYPR01MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af4b01f-5713-4087-caf2-08df01c47a73
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|24021099003|51005399006|8060799015|15080799012|5072599009|23021999003|25010399006|40105399003|2607281247196008|440099028|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ET7PlCmR4qU7TZEIVVrZN/M2jetc/aVUCDauyINHEqXN3gfhmSK1DL0IQDAI?=
 =?us-ascii?Q?+dO459AiIv3p94kz4BnlHrrlmcawjmXcrn80NOSs2vz2lamNRt+etSVC/597?=
 =?us-ascii?Q?lEGhsBBkvR81I6wLdoZkGoeaDvI6gQTSrSx1JYDx0kbLNkd6zT22gnQh6wuC?=
 =?us-ascii?Q?p1dtaDg8x7j2halx16wdRVqVAp7ba2mooaOc3eDjdBQm1VpzQqGlNdiI47e7?=
 =?us-ascii?Q?yeyCDfZZxK0wPfdgNOoLewcVzUJAgW25Ks+B444ZHCZTkIk9ePLV8enEzaT9?=
 =?us-ascii?Q?VnmLiTfHwunZeybRuNiZuRK6Warfd+vjk4YUFQi2i6w6ByBxlbNZn3lYyVzg?=
 =?us-ascii?Q?Q09TA4y3jAL5dZ9e1ALpyfp3nmgl87aOAAQBzE1EDQ349Mxcn8m6Qai0+mel?=
 =?us-ascii?Q?ylpnmRpkIPDRu0r+ZrJym7f6aS21zP5O4z/un2Xa8nuhPFsO4cGjedwa7Zv8?=
 =?us-ascii?Q?bIKHhhY8NkVhVHXL/g7L3RqfVdbJYzfhy4zFW5yklYILbzy25aFhcguI7gS9?=
 =?us-ascii?Q?Leg4yxQdYtW0oDTipKJNpFJovCd/quseud6GVUt3vfBmSwb2MI1jeolckvTP?=
 =?us-ascii?Q?LXW5cJlOXCpkUJH1p8/23ae4EcYOpOsNsJ3yudkeF2ocB9iCfiRsDt5CbZt1?=
 =?us-ascii?Q?3g/xUb/mrfNegQ70KB8wIw9LQ7lsp5XNlNjoOTJg/rdtjVv9JgJe2DN29wpM?=
 =?us-ascii?Q?4XdI/KGV0y/wsEk+ojdrNvMqMrY3J3GYjVQKk5B9o3GKFT7rUcW1hsKiAgZb?=
 =?us-ascii?Q?j+jN/dwbb7amxuhDK3F1ZoTRIFrYxfByDh23RZo9Pj6fJ35VSlXBwx80+/Y9?=
 =?us-ascii?Q?EtkT7DdXvBdAeRiG0WNoCMs/q+QPjD62U7Uw4IorGaa2zR/UcHcFTkJ0ueUO?=
 =?us-ascii?Q?bOcaVeL8uwGgFHnijhgMrpoM673uCsVbRnLNDPDPNSxrr56NLZycU/0wIcHo?=
 =?us-ascii?Q?4YSoKY7xc7EZ2bhqgJNHkg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jX0BkXXtxQBQCb2+GcFRtHLqoOtYS7pET+27N0m0MgubP5H8Qrc2sox9x/DU?=
 =?us-ascii?Q?qyDwcD8YxF7OWHtflag2ZD1pY0DonFFb/osY7U83AMZ2qs2YDDSmpon88zmW?=
 =?us-ascii?Q?YDWoj0/2CNBTIhxx31eqwVcJYzI8fiaVTlMFaUXkwysl4utkIQZn/WLTj8pD?=
 =?us-ascii?Q?/lT74xPKy+dIEmG/J4EfurW1zL9em2B3qibTYb8MszjCpYB1yi5Mb/2cG59X?=
 =?us-ascii?Q?9ClnH78o7q3KobdRNfWbO3dc+oa9ZcISJpdSua+MITbeWb7TxDI6vQE4a/CO?=
 =?us-ascii?Q?FrXE4d2w7WIGU6qj+VTQDyM6/j107STvqryHvPXV9I9aMSUBEeBYqlXmWZ1A?=
 =?us-ascii?Q?jSsB1TO4XFrVXszzuR6HATiYsUe79tIeOfUy9RQpQigwj+oRVDp3nyPaZm4y?=
 =?us-ascii?Q?7L+IicKXOokd/0hYPkbi98LM5r/r8+OjA3loh2dpN4IzJNOpMnJk28Bcpo3E?=
 =?us-ascii?Q?sTaBvLGIz09IfnHcRQQ79KNfH0Dq8GcZau5PzzOuzH6/95GZiZ9GMznA5Nr/?=
 =?us-ascii?Q?v680lr2Txtm1dz1Omtm1eMFRMvrzOuZ2hwuxKIUYqeNHVwCLvQS0iaI5uGX+?=
 =?us-ascii?Q?QZd65WKhTI4upL2kyJ84Qtqy41G8dfak3Pd57aRVdiSiprCwVP9Z3G6Lf5n1?=
 =?us-ascii?Q?lb3B7ALhTFBH3jjIdDsTwGe/5LHNXM5LZ8aDmuepwZ/Qb6qFR9O9Hu5C0GkF?=
 =?us-ascii?Q?QqHFE8EI8zWBwVLvpxvs6Jb/GKwmGtwa8GTrJXjih+5yHK9VIA6CoiUWpv/A?=
 =?us-ascii?Q?VuD+22k0HYKPpoYlEnVD60Dv1+hHf44DbkzrCTZLLDDkD8PNH7YFB+d+39uf?=
 =?us-ascii?Q?MQKkJKs4dj5nllw4inIL+mwaAh4plWKI11VJlqtmT6837wH6MBftj0mE9GJa?=
 =?us-ascii?Q?PPzK8d7OrynBXpFWLD+AqJr76VpDzKUlD8UUsGuv2mrxeoPREmRwrBmqpZS7?=
 =?us-ascii?Q?qrEBq7CQTSH6u1Ytb08Qf6fW7u5t0KpO/COKUcMLGqTI+jKzrGsd0Onu62Sp?=
 =?us-ascii?Q?GYeu4gSFgWcHYW3H39MuIaat+rrr7Uv5WZSy57L58R9yfecRdCwNgukhODnl?=
 =?us-ascii?Q?wWkd2hMfYLoS7Fdof16+9VLB90eLQQ0T00jfmD4+gYTY60baVUHbX8ZgOn40?=
 =?us-ascii?Q?wam+HhRSkhcwpPQtYqT0r3ckK3uGF/wsgQGRi/WjCDeQzN/kwRDzHnar89SS?=
 =?us-ascii?Q?ZGAdu5chuYbL5WzmLzPYYcoHAn6Aee+KC4ti0XPKut8hauDP+N7NFN/pglCD?=
 =?us-ascii?Q?uK2prP8v5zJzWWRWHeIy349LPXFLBeg8CcxW7Dhdy4autyKk0kzOiYSHh7jz?=
 =?us-ascii?Q?TrI6vbjHiH8764dKip0osbQZDF6S2DD81XAuqndhbtTLChOzPhwWDipYI+Wl?=
 =?us-ascii?Q?2TlT8yjK+G2Aq6DMnpKTgAdV5wP2?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af4b01f-5713-4087-caf2-08df01c47a73
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5141.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:45:49.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB4487

Use the 4-pin UART6 pinctrl configuration for the WCN3990 Bluetooth
controller on Sony Xperia Tama devices.

This enables the UART hardware flow control required for reliable
Bluetooth communication at higher baud rates.

Fixes: d54331131cde ("arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth")
Fixes: 30a7f99befc6 ("arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)")

Signed-off-by: Shujath Mohd <shujath@outlook.in>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 14663948d4c8..4a6e944a7e73 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -774,6 +774,8 @@ int-pins {
 };
 
 &uart6 {
+	pinctrl-0 = <&qup_uart6_4pin>;
+
 	status = "okay";
 
 	bluetooth {
-- 
2.55.0

