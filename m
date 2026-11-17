Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940320;
	b=s2lWXqUv/U5kyHzSggA15ficpHj8+p2PAEb1L4sP87qTyl5rJCLtravPZ9rHAqRf2xlc
	 ukbnYdEFsDJBhNHvO1gPqdToFl98gP53dZtTkxBTmKKE4ksAF0YkAvy6ph47kyA/z7bLz
	 E8DTKYHgJh84Mh1CpIIe2SBlT90tnvxU68pvAfA28OGFRyvhQEldgepeHV2jrvpQ+vtWy
	 tEpUXcw77uxV989xY1CbCOGLXyW10Zhg7dSGPqWRN5yzdvNqeQjYa2jaqez2L3E0DgznC
	 fRBwZ366gw4ISHoiBuhwY31NHXEBmyHDnYy7g7GoYiruiQNA5s2CKpPmJjS7jhZb7/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940320;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vTj/Q6hE4aF3VMfJuX2ZcVUYtl9jjFf38wwDv3jeX6k=;
	b=xMoNYwCHLNXNMDowaeDAqjt/STK4+wDcagJyamYJiWBqPM8smtNGqKwJdQMAwoC8erPL
	 gYqamMQopiQzozNAapTfX6pOZbr3HslmWKIQMvlLDe1gDWrPeuVMPKNJVz1IFKh27GYCw
	 sJMuWjxGA/9qu1G1qXRr0t+RK/ffexiaNhXeWfxhYR1Ik9IDlViKQkflmipuP+c3xGd6A
	 z7tsXdyaLjP/xzdQ5MUTgiCgRN3NwQvZlHIozsRkPwZMxuxjTWdrm1IlLF3SySvB81lRj
	 5PrYlicJSlCYio3dImlMkP44aOcFFC6g/iKwTzw7/Q9GY0QS4c1fseP3AGQylgRSVKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=jPO8Mh8O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45E5606A88D;
	Tue, 17 Nov 2026 18:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D45E5606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=jPO8Mh8O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+TW8Q8QzhgG0t0dUuAlfJd4EKk7dtT2zsKRhuH6IbRBH1hR4qDGfA2eCkwUVJlk5LaqPqPQOoC4rJST9RcgGS/wTz938ma0bUajm9Mk4+AnntkvZQwT9Egs4nkxWTZu3d8VtKDp5neI/zE/oZ3vARELEd7zquV/tNNCArnMMJInU5dj4MnEYTq56/DGv1L4iTTs6ezfYgv10fp4i4Guw+rwPNRczUVAFFFMkW4M+hCSRGMsMaddCQ7ce/x8qdi7JTuAynRrLxeHUrHmFZvkD/gQ7SDqf7nBCjbG3DyKnMB/86Vm+i5LJ0xRc+PJp4UUaXW0Pg+fzco8lVU+ENxMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTj/Q6hE4aF3VMfJuX2ZcVUYtl9jjFf38wwDv3jeX6k=;
 b=wguFTNhZVDT3A2x7zEILpHIItTAGtElcWXe+kCjocpQHaIRZazyJRz8ZTN4qAepJ17z5YW2jrlv1aYIHh0gtVv8PpskV7jfGgezZRRBFx+zfLjna60ni36hICnffGAsBb3ezKzFMkVsX9YShTXdRS6IaTLymqJ0FVOrmK8+pNA7lfGLjvRnB3BZJueXTyAp9S98LJ9iVFo65iultFkk6G8zHDD48KIR+9I1vH4dP2BFIXi07aKcYTgcpQIyOInkice6tbUQ0osK+hiAtvd7OB99itkik3N/syyH8BkDJ+K8N8GedwMEB9Xfmwi3SA92n0xDE26Ocp/mdTfopUltSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTj/Q6hE4aF3VMfJuX2ZcVUYtl9jjFf38wwDv3jeX6k=;
 b=jPO8Mh8OUEZeAoyGVYFC10oL7Iz8Rq0Wlp9O021vHvHR4rgRn1esgvziHd7lStyrMwdCsfLqNUz+Iu35K+JaaSPeju8weGvOYogV+f/m1dzE0swvD458BeeOYWEmhMPq2jcxLEgQkS9qPACRgmlCG2WaGylcdkkjPRAAOyHqtaMJqaxKHhiNUEcwMLdHfw3fLCbiD8gc4s7r6OSaDCzV19dXb5VsfwXWvlu+CnKDGSB79tPA4pRyHfVnJnkIOFQRg+bJON5Q0DHSwZwaWkkd5iwHfPFidhfhwzOZsrReCteApskyLnvNudRu2q8LNRhvhIqVJ69dfqnL1vZ2WdtsZA==
Received: from DU6P191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::8) by
 VI1PR10MB3245.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:133::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Tue, 17 Nov
 2026 18:31:53 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::1f) by DU6P191CA0033.outlook.office365.com
 (2603:10a6:10:53f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 18:31:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 18:31:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 19:32:37 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 17 Nov
 2026 19:31:52 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 2/2] arm64: dts: st: add SCMI regulators for stm32mp215f-dk board
Date: Tue, 17 Nov 2026 19:28:46 +0100
Message-ID: <20261117192843.v2.2.I2f210226b26e3b5a80ad5207860a15fa657b55de@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117183121.654286-1-patrick.delaunay@foss.st.com>
References: <20261117183121.654286-1-patrick.delaunay@foss.st.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|VI1PR10MB3245:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8efb1d-5be8-4149-8d2a-08df44d90d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007|44046007;
X-Microsoft-Antispam-Message-Info:
	ACRhQhH1N+UcnCJkL8yC2uK8/D1V8ddsvw8RRpBSPG11wYmvXN3ELjp4g97VNYGsDerFiCDNws5B5B6uUchG9Wcy251BubottW66OCp9KSKwxaw479y+iCeZapIViZN0oUIbJViBVcfJax8SgBv5HizLazuK41dnWeVzvBM285Lfyicrqj4HS6w/44O0tbw3BeOQbLcNg/VjVaye4fHG7WfLSxlmdX/oW4/e1Wm9dvWAnGvmfdSNX/VPxnmIVEJ0l8uzoCNw+hr5g/BJpx0KVG5WgNfOJxQLX/CGP2C6xNy3dS8BbnLffXOLI17U4SzwyxXNYpL9qCQkE8/qV7l9MP9XnqzgolhKg6jHweFF8VtHMaNBfBuK1KSwHXaEUf+bcWQ4+ffOlt2WvSwu77Q7VS1/rfQUbncI7248PRDtm47DUk+yLfRuzfWUdxblWcGhke8gAy8hDBHw7EaaXAoKlglhi2ynQGDcuCM11RoP8dGVj+qvrMsZ7JXyhpEmLSEiSciatp36W28Cnvgy0ciWukILkO5AjvsX5RP6ukwrAasdD6HUJ8/pJ1gPBy5s0EqAT82TvwGnNSj5hnTaQkPbVtFo+EonHphEdKnMA1eb37xvDoIzEeo8SE15QVdsqORJMAF1RS8/uYFRmCScat7pjiC/tGLYHKpUKcN3Z8dOtmPvBtuuOGfX7YkOCr/OR4JbxKMRjXKGdZsiK1hssNbuCEm2SglCsWpU+YV23SkVuaINYtGd6G9Wc3l+UvYSoYHD
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007)(44046007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vnmgy90GjijZ3OusIDw7tiUO+vQ5fRFIWGTm1KEpRJPy0W3yyTxsA8bF3wiBJf4nRI0hlXlRJBUddS93fMRZqbCSQCiSh5qXOz9m0K3mPLnQU9gUGgnPKQ4UWhRF3v1Ko7lxkJiBoPp+PTtOqpvTlX5uWk6mBhsqjuGoldabXPQNb9Y9DLEXzZASU6xnnBCfw53h9QFbed/gnrjbRgRtMrHlsU8nm+FDLOuhY1UfgmfKWYf3oAexZlH1JE55EXrx+pAutMnIay1Ommqx4oktEKY8048rHcLeM/sZlHFrHiaHhzEra8h484UGbmcfew0uUL4e0y96QDjhBrc7b40A35nhyIrocm+1K1M5tv+Y59J4YlQwYHRxi0NEhF4wLO0lg9iFnL3WRW53NfXE8tznOSvV6Z9/2oaijpiahA+QObWvX9z9vwXmkGaVctgYmfKs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:31:53.3641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8efb1d-5be8-4149-8d2a-08df44d90d7c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3245

Add SCMI-based regulator nodes:
- vddcore (BUCK1)
- vdd3v3_usb (LDO4)
- vdd_flash (LDO5)
- vdda_1v8 (LDO6)
- v3v3 (GPO1)

These regulators are provided through the SCMI voltage protocol
and will be used by on-board peripherals.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp215f-dk.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
index a1285abc80ca..fc7010bf8d88 100644
--- a/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp215f-dk.dts
@@ -48,6 +48,29 @@ &bsec {
 	bootph-all;
 };
 
+&scmi_regu {
+	scmi_vddcore: regulator@5 {
+		reg = <VOLTD_SCMI_STPMIC_BUCK1>;
+		regulator-name = "vddcore";
+	};
+	scmi_vdd3v3_usb: regulator@f {
+		reg = <VOLTD_SCMI_STPMIC_LDO4>;
+		regulator-name = "vdd3v3_usb";
+	};
+	scmi_vdd_flash: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC_LDO5>;
+		regulator-name = "vdd_flash";
+	};
+	scmi_vdda_1v8: regulator@11 {
+		reg = <VOLTD_SCMI_STPMIC_LDO6>;
+		regulator-name = "vdda_1v8";
+	};
+	scmi_v3v3: regulator@15 {
+		reg = <VOLTD_SCMI_STPMIC_GPO1>;
+		regulator-name = "v3v3";
+	};
+};
+
 &usart2 {
 	status = "okay";
 };
-- 
2.43.0

