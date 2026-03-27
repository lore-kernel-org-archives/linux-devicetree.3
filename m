Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E62A3CFF5E;
	Fri, 27 Mar 2026 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603841; cv=fail; b=ixNEWQfQeCRR2gI17fsJw/OiFuXV6V/OQOJ6VSKSPf7lo3yAMcZs45EmU/0ZvZDLlGG93qgbKYQZikZgGuBaiB3Gaa/pWnT5olrdbDtL8/FHGLnrvbdIkU8bp0FYJaeIpjmL4VwdLNHgOI9EORbuiIJ+1Rk1pSAJTExoP4ZJ3O4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603841; c=relaxed/simple;
	bh=Gm1ciOex5dEDIpOmZmfdb3McvTirKpNrJsl/C2RCa64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j6L8sy8GkHH0TiEzZ/kvXWwa+AACYGRT0fAkQSREo6Dou8zZ0jRSVpPu0VCqRNoRnGfjzwXo3TY2EZAYYkza01Ku81i2NHX81JiTEhK17Ku1pnkhPWeNHyneUTjdh136Q0pbSGsSqG/b8hD8oJKQ6Lu0ff6TVBG5dc4mRZSRlUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com; spf=pass smtp.mailfrom=khadas.com; arc=fail smtp.client-ip=40.107.75.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=khadas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khadas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jm0qawkx/pWyZOcsPADhBwaD07epW2IqQkgUGpIwv9YI5zZpeJ1WrwDtSJeygeKCOf99iUzwnzu2UHtS8gOVQJmZU8DJqMmRn/9wRziQBxGxeZzyQI8G9DMzdGIHkKSo190r5kCk8j/X4dssYUhcbPZz34TiMjZ4UOYY+SlbClkv+lbr0VsNRWgNjqMWEgyS7uBDhcHXMyNtL0q/Ji4NgCGEMNC2GDcOGBQ1EnYlsWuPttrGNYMyB6P8mupbvOnYIORzSdeW614RRco+uHYJZhK0ZML7IAsvd+cWTZyyJYcJ7xtLFywQi15g+tZg+F8R8ShIFMfQQ+j3J0okRS8khg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxg+n3+SEeSGuIV0fwOG1+XLqlkgb9wMmeYUHxSspTA=;
 b=EoMWBBRziX5CYj4MZwUbY5wGcLIz9A8diHQQQyO9Self7sbsaq53cS0aF5DUe2M/n0g86aMoo69U/A59Wd58ay5WgG+jmWTXBWG1zMlRAsml63U8UqsKdhVyg2VEgXlxC7RKHHQBfwKdiuzt5Z37XIWm8oxuXqumyQhzLm7FY9uHigb23hqsVUmeAbjyyBZjKUGJhwqcf0jWdspBA1+1x7v3EbAMSH2BktqGpKzeRy8Zr8VdhYutYp8cXwglGY2KklX3htsJgEyPYHI+bmXi8eJ0m1//r5la5HEF0tnyfIJMvmPDiaFnAZTJQTZ2jdHYzk3PpCs8HmKugagZ1bTvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SE1PPFE32D229A3.apcprd03.prod.outlook.com (2603:1096:108:1::86d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 09:30:31 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 09:30:31 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v1 1/3] arm64: dts: amlogic: meson-s4: add VRTC node
Date: Fri, 27 Mar 2026 17:30:14 +0800
Message-Id: <20260327093016.722095-2-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327093016.722095-1-nick@khadas.com>
References: <20260327093016.722095-1-nick@khadas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SE1PPFE32D229A3:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f610b6-2427-4e74-42d5-08de8be37d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	a42PFSpxFrc9Snxx5NkKLtLDnSb+FVcB66KMlUQXrbubWfE8U8P3z1keMXq4xxeyBqWrgBo3nyLcP972oq2fN1BEI2JI8zvG+TlJpfUAeQG5mOLcj8WSvAynae8J6SDCMR984pdSLpyIkTG3kHDfOoFeIrvXKnSilv/bWE8JnX0TfsAw7wwATVAKO0UO2QtacLWLy/1vVrjNQmDwfwdC/NV2uGuxQKtpkBXyDRexiS2lSnQXppX6u+MLwjIU9jxqJysJRmGMZr0r0EEpHU4rMcx3Vbi9s53DDjFaWavqDr4h3/4btNN3/wKSsBeJnV6iuY1gBuhfeH44RjVbIr/nx1v/V1HuSNjx2HlzFJlvkukWpj+8M8F2ZafGvSD5Ec1TxUZZSm4uuqzcd+IesoR6q6EU1Km2Yvb5dpVpI9DqVYErAk/xC3WutYzVw61eoarfmhpJWBRdBzTttITu37R9/EYFp8swDJ3EF6wojQ1pZriutkVJPhBinTKz/MgWqUpOtC4zBqtAKg4KWoafOgLdNW8tQOH6GEMmD9MFIobPpHCg4ZbhUQSbH4YxRk8KHlxA42FZHWCG/UF9E0kkh8JSqrsIGlBPuLI0DrbXixCCozdDYU/MHQSVYK+/m7EcUonhqV4ForA51g0j0cmgsCgi4y9R+zegyFIdVrm//+Y6Arh48mBiMljTmHu7BZaKhHWUZ99bD3pkuNzTXVhZIwCVjkXyK6MeJhlsc/fuOocym2JAUfk63OuEOKMS2UGVNvHJVu8xm+06W15B4eWxQFv63Le8xaJvYNbNjzYxCKSbN9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DWwyeu6xLcRW2ouQRhrLmPQRFPjC4qu8m03wNxBuB+LWr5AfzyqggIAmSo3Q?=
 =?us-ascii?Q?Cub4PqrYZ/UmPfgtimVjRWh/r9Fnanr1REAvQUtWpUmKLelsScqJ2maOwOev?=
 =?us-ascii?Q?vqt7s2WmKYA5TKES0QkT4DZxoCbPk87EFaPm5kXDZclfuoBq+LIWnkhghXGn?=
 =?us-ascii?Q?X9MQa8bfckZD3bDtI82E1BUs6j8urN4KRyY4eQJxue07+FteEBaroRvCRS6S?=
 =?us-ascii?Q?vX9JMi7LAV3QMDvSAjY8G4OO7rkMWgYN7kmkVdBORM/qmHwTH6PnTeJcxp1x?=
 =?us-ascii?Q?jGvd0ig634qPRhetAInM/JrF6FrbXbDcQlVzvlzt5DikIBKsxQdxQ1xRtycP?=
 =?us-ascii?Q?zMA5Xbx335jyG2ix7nv9YOh7AiHeJiWt3+02ybrVIb1msbie3hKRwLEcGjGc?=
 =?us-ascii?Q?wCBYdRa+rQEGYlRF/bLWULgGYGD1IvQxKaXjmIocTpJ3HCh9RrJiAMvKJaRR?=
 =?us-ascii?Q?D2KSL8fZ7G7Pek8dT/fi4AHkqca3r3Jof+8btFZu8cDchumdab4P/sTywyKA?=
 =?us-ascii?Q?b+yY6kJpB/fIf5BO1h8Yfad5l6EiNjMCCvHcIs40fKE/dLmAo40H8Su5N7BI?=
 =?us-ascii?Q?f1NsFlrQ94usyMPQ79iCEi+YGWzdlQqooxahl+zlYm5R4O2oqiXiziHkGk/6?=
 =?us-ascii?Q?8wIS6+nbEgGqncK9PVUxcNReHxVZj1o+K9h8GK2A1ZUJ7UaEiCZUDLprJkeU?=
 =?us-ascii?Q?DF1zzyKuxBUgZRpDTZhp7nQ2kItBy9LnEB381oKst4VQoyVYOM1TT6B6QVNN?=
 =?us-ascii?Q?Jp70adgKwoqYm9s1/ebHZ+tmCY5p+n78gQsN5XbB/HT03OMZwP/vhoTVISkO?=
 =?us-ascii?Q?f+sOgy99vMTu1hLnxjcZYPkWr6j/xSW0A63UiwJh3z00FhdLJBpZqpxiqFYR?=
 =?us-ascii?Q?iDE2wS2lZw6+mtGM/4xVS2VOZuhKSW/mtJZP8UuQIBMh304EHWsMbVwfw+wd?=
 =?us-ascii?Q?yzChHGUqSoPzFqIMWc73GPA7jb1N0c6w4Kj5iahsQlTszX4+aSdaioD8QC58?=
 =?us-ascii?Q?GbW+MJBAxhdpdOw6nI+1R1SI2hPZdUSwW6YGnQLGsENs74MWVOlmm4r+D5vh?=
 =?us-ascii?Q?6SiofBsGwbVKUtku3gktoOZ9la2VxmzxlzjeLHZGyiPoGcMK/fVtX/HFKwXJ?=
 =?us-ascii?Q?0LpoLkxP5eVjQNJSVQl8ogwQ28zB+GjOcfYK7aMQgMPcfGyI7aUo0vL+tTmm?=
 =?us-ascii?Q?uhjkcSAX8z7BgcVjnZgFuROe3aWdzOBvRLP4h3r9lidr5ZUHd+VuTZNibSaP?=
 =?us-ascii?Q?0M3UfSWkuGqPoicE7eHRzqpMA4x+tEvSMcDCYJOFKdh96KbQcibkDJCBKzZK?=
 =?us-ascii?Q?zu1A+GjcF28NCgZaoZD+gTx50gIv6ViLxwiP1PF+IYrGBBLohfe6abWh2EA8?=
 =?us-ascii?Q?YuGijle07gt11639YGmDpxRL3pfXWouTkfQkhnwRjXfmy+0cb6hAE3c+eRVf?=
 =?us-ascii?Q?pLeN5nZml9a0oMhg7U4tkEFbedB3DOHMsoc23E7J1eAkzxa2waZyLmFdPIYU?=
 =?us-ascii?Q?KECukbxbynAKXrudD8NOyDtYx21YIHrUPqWz1doq7b27z4UHN3EDwGCJm2mL?=
 =?us-ascii?Q?7p7WdbqqtfH47mZH/9avKGxdVUIFKsDrA7ANPdXd70wH4h3DTaaGMJ+Gk9Du?=
 =?us-ascii?Q?CZZIVYvdxiUwu1e0yiX6+jK5V63gQrN31GtHSdJh/9IXMhkzMoAGhlAfO4r/?=
 =?us-ascii?Q?zNer/ozOU4AtPlFD3H+YvXZgIPKlGzDeH2ZjEOAbv01HlgBk?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f610b6-2427-4e74-42d5-08de8be37d9d
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:30:31.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlUxgMR3GV+hK5GCz0s0xbK/K74mq3FajJdU+7VNYa3hvA30NCO0/6TPcDu+75uT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFE32D229A3

Add the Virtual RTC (VRTC) controller node to the Meson S4 SoC dtsi.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 936a5c1353d15..2a6fbd5308362 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -59,6 +59,11 @@ psci {
 		method = "smc";
 	};
 
+	vrtc: rtc@fe010288 {
+		compatible = "amlogic,meson-vrtc";
+		reg = <0x0 0xfe010288 0x0 0x4>;
+	};
+
 	xtal: xtal-clk {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
-- 
2.34.1

