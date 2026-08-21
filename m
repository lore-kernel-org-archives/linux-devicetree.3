Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCACD3A9DA9;
	Fri, 21 Aug 2026 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324270; cv=fail; b=RIFgThGI0AMEUkJqt60Dkz3fSybNiWLQ9EyF1Y8ARa168i0ed1E6Np9TN9BXwnCsdJ5S0xTNsTLNIGW4H8rcsWUf9sbr6SyMYD32Qv/ioYEl5EllBYZSItVvjyp0Bmq1NjX4xQd1xUpiIig2JSd4ZSMU1hzlvi/pWHnEv7ZP6hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324270; c=relaxed/simple;
	bh=0OpA37Kl2CivBofGeNGUb6QG9WNRRP0uH5E752H16Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qJKvAbmqUU7hUwy+VvHQpPczLRRCACzq1+9WSEjMUsF42QrenFjK9/IcM/UZbO54TihYPE2yeIHWuNlqY/mdUx3tjShm69anfLzCR4A5+PJPeIf+v0iab7dBhqIzvcj/eSaB9bTUkrxEiX93WXL52Nf/+KyTYFqwrLKNbm2OKcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BO6MvwXX; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BO6MvwXX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhZhd4Mwd/+m4X85F4g7as+WiU5YgaWEV8wUyFWsseL1ILdASA7DE+pTRrnAvT5616ARIZayppwoj9Esi2axm8AH0TYJE5NXKLjW/XGceGl8bDVoYd+IF7ufmkJcYdFD3pO30LyCmZCoH01KrEglv0qrAkAKt1y0U3NVA2+D3LKwKetvDhn9uae1S25P7QEJh0J9uYJrS9H3/Wph7Frwpw1+MlC0LTBuVkbuItdsRq53QyakkUnN6qSwRUT8WDooSYpH1vAFmyH6Ei+cYVU8C5gXnh3dNF4ors9K9O7JidUCSh3OUEiT66ggm62nl7ePjw5I4BQ/DvNIi5ufTla7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcDUuHIzpA5LChowCsRJya3d7qQYR4H5AYNdkyfZwIU=;
 b=P5IMZN8H35Xlq6QqJwwZRJimVmFHpeUe7AKCuHmIHWEJTAY/Fw1tBiXSi3gOSq3qHsiaLEZl5ZefQhkkjxq+Egxr36I/D6bRB2G3nflDO0KVBnAaTevvEE0rjDXl9jm1MJ6JVnaa6ybORv7MKRZrWqi9V/j10SUMktmj+WxWnCvwvmadE3lE+AjL58mQbGEhFb1HusQAEPy8zkyZskEmdoZR9HAUEbPJ9Ua1ZuFy8MKnwLJd5Zm+xqxvp/zaue1lC+Mvvu6dq43KyTYEWJmS1vA0OdOiAkvs0R899wRIQEAa3EcR9kscDn+kCfv2ceml/FjGKwbKH4uysy267la9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcDUuHIzpA5LChowCsRJya3d7qQYR4H5AYNdkyfZwIU=;
 b=BO6MvwXXS8FVfeRRsY19csrjktZT3ujp/s4zIZ+XqMmSIA6SOU9QVZQ7Q/3z4QlAn9C81viLZjqs86BWmsPp59z3AO99NULqueeJqYJT9tjDm2gKchVXbz3HXH2RPmCmvi2eNwtpu78oMIbvgmt41AlgFwUYCfdJ8hW7iiFcVdiUBAKMFYn7i41sfQtQVlHobiXbRpfJeoSkLtTelsSX/CkjfFmDZ8NyX/pXV4HdP9y4PZKfQIlG25IkEmFdeE/L6uGvBvs8PDvtW1vKeRZsxnTzGb/64ymhnHjuqNPKy4iYLl+1YxN1L+zacBN1sJBMKzx/kQRxcZxhwcGjUNU10w==
Received: from DU2PR04CA0253.eurprd04.prod.outlook.com (2603:10a6:10:28e::18)
 by AM9PR10MB4006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 14:57:44 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::a5) by DU2PR04CA0253.outlook.office365.com
 (2603:10a6:10:28e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 14:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:57:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 17:02:43 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:57:43 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 16:57:40 +0200
Subject: [PATCH v2 3/3] ARM: dts: stm32: fix vdda supply for onboard hub on
 stm32mp135f-dk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-usb_fixes_vdda-v1-v2-3-23cc919b59fb@foss.st.com>
References: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
In-Reply-To: <20260821-usb_fixes_vdda-v1-v2-0-23cc919b59fb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Popescu
	<catalin.popescu@leica-geosystems.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E4:EE_|AM9PR10MB4006:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6a9095-acd9-47f6-bee7-08deff948e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|7416014|376014|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	AY8oXhrtczfC4Tis5TK/ayY31cn+NGD+rkBVIifnLMjim94CEPu1P64pOJvdBAlA0iv/7n7WE+b3Y/LMLcMv3jlcb5M69qGXGa9EXprEC9b5l0JUutkJq24XEpI0nro+XV4QJeeCiJzpmTSYOiSxyTTh+fouliXizuDAm92POx/S1S/eHJVYi4lTWTpvjNq9OhtH4+N4hq/iPhrDIH0aOnHUrxrBtHDq1Q8E83VLjDNgPke/2TCiaHVcb/vF7ky80cg+gj5qpBKj61f9ZcJu36CCQVJ2lGyg2iRwpvF13QI38lyImAXmmBwbTFc+UHk4TUPwGUx7X6G5Ch06AxR2tF9IZfVPYlgg9DrEpwfXS35QY+R0B+Irg/bzKcCHBRFdTpW4uEKP5dAgaapqy14jPrCfJyBI303NdmOBmCtc0fuPf+Ln5TUgPF/2EqUVj5N54mzwKrY6nACs+6i0ag42oMSPTYOlR1BtSycltk4UIloP1m56Ot8PdDOOL9u+fhde7IUaPoGh/msZcStX6fgxByT6uZnow59D96up64Gb1AQZsgBDmTnWJojbP0NMsEW1Xl+ydC8W57EGe0fs8mse3rDQqQy9QoJ8KZPoubNh56VNwjNLgVNNsxkyt3pckKCyoGelqypU9gpbpcIV6LnF3DcNp7oGU2yiwoc6nm8rVOkAiPR2y3Zu2miOkXnS8tU2p7EyWvg/WM0+dqelxuxyjw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(7416014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5bce5E4tNo1EG5z30gQfemE2a6axnNX1Dj6GtFdGO1NW5UZDK+1YPKDDu2HuGoGZVhaBqkChm8bXWOdnMF6qo5AVITPaVw9VAiFU2vbfBhhF8BDqvaSWTPcyd+6w9jCTj1uTUwRnCr59F/b+46DQHCwyo4TFLBE/GiuQliPvI9RplD0wfmoXQ9vrZVfH5enIigUSXGMKnMpDD2nEsaQG/HGbn4I4g8R8gR9BNQH1VYIiMwlJkbM5NwyY77RJRLOocHF2IqlSukIjOykbjeS7+dz2vCSoZF04otvgYbD2GG1twZWUTgd471fZTxj/DG74W9TAZgY/8mBfskqVcKSRoQoEGKr0XqUJUioWXwyNkYKHWnw9fuVYTgSzfukw/OQc2M0CovBwQ9JDIF+Fo0EDdJcnjWgxYesByqurdVh/Zq4MAFnpudFEMl0ijfBkASMX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:57:44.3470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6a9095-acd9-47f6-bee7-08deff948e86
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4006

stm32mp135f-dk uses Microchip USB2514 HUB. Since vdda supply has been
added, the regulator framework wrongly associates the 'vdda' supply
dedicated to ADC, so the wrong regulator is referenced.
Only the 3v3 regulator is used to supply both the digital and the analog
part of the HUB.

Fixes: 673655f7944f ("usb: misc: onboard_dev: add vdda support for Microchip USB2514")
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..5528b99ecf50 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -628,6 +628,7 @@ hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
 		vdd-supply = <&scmi_v3v3_sw>;
+		vdda-supply = <&scmi_v3v3_sw>;
 	};
 };
 

-- 
2.43.0

