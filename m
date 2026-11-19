Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795067070;
	b=twiTvnm3zB+h3miQLtq3gx5s0vsJUIaLTsCEF48tQF9cqhiBBQiZKlMDqy71viRri1lR
	 Cl0YilhFE8bHR+zOSJsqB5i1iBEWAacCVUzRJEFzllZ6PRvPxwn1LZp2MN49+jmW++n6s
	 nwyp+oufDb3ioEO6ei0FZHkbUAH/wp9pNl+xOcgScqAOAaISBGQktXOay7KzJvqySAOh/
	 MMMyxTULm9AQqyKGQWDlgpRjCVTzVRTV/8F4sT4o8rnc3MJodH6i1Lnlyse5OnQGeoQFh
	 YrJuFKz/guKFdBs8Be9eNQRHW85MlEl5/sD6Tr4lYO+d9eSCi/hZWKroSwR+K18ioyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067070;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gIpm5b69SXnoYlgJ/Q1AQIZEgsYclfbcWKuRM/5sVI4=;
	b=cnUm345rQaAxzgI90B2t4CI280107Cd2S9pK4Wmc4WzzQyddgKI1P8oDHqMU5AYMUbCF
	 uTbv7NjeRdaVxGl9QUjMKnKjJERqkJIRZ20N2nZUFc0gYQFhQhXi+y4elJttIL5w0hOiY
	 a9hqF0+191H8X74IZV0bdE1zKIrVbkvVadhA97Ve9fGNE8t50WVUhcZhCanVZVIerWg8b
	 g5G9aiz8/o9+TiiTVik61CwRVQAzAmCVqBPKEqc6/rGvswUSDiXpEOA2stzcvI05kG8bo
	 JpG8kEginWNcdfJAcZ5nxbkQzUY6l1ivoSyFilkrdja9mdZ2AcfSsRLCO0IYyLNzuCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=T2bh1TRo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.65
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012065.outbound.protection.outlook.com [40.93.195.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029B7606A320;
	Thu, 19 Nov 2026 05:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 029B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=T2bh1TRo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwbWgDLAqaz5Mfm2y9rqoK+IO08WPXFYvv3Cc9Sl8Ml6FYdqFBiNr8PcytrSS++TSWKAxTdNrT3/4VWnaQdGPCCbLF6QUcvDqxU8iOSZDSSFc+YtZ5JMyBFb/gfHlneDOM2RG/hHoau34tpAFZUJg1Auy2BN/nX/YJ4DXyrEpbP+9DppScieCSRH+Tvy6ytr9P8kx3lorfZMwAx1qGrB8Jx4woPmageyyoQjBwVmfWfiqC14qIWVhf7Loi8nnQMLCIYgcCN2bWzRH2cvFFIVCV/iy6dqU71WLCpAkl+KNu+xzQFXbVLyTGunYXBmddx/q4intprOVFB7VKWgDOaB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIpm5b69SXnoYlgJ/Q1AQIZEgsYclfbcWKuRM/5sVI4=;
 b=HtOetB08MVLVPgB5dlpjz/oZwMJWETtEXG65/7R4v1k5zQ7WFsXD9Ei0Hmq+hRlSinVqa5rOslMYwEvZSR/fa/9tG3NtYvqPGW9077LOtmeuvHs3hU697bLV80b+IlkH+74GnXMTidon68kz8d2hDsVTVNWEEvLJZyGEUGrEuzYHCXfm9dTERlr4rNfRIqyCKEHAu4JhgrPbKJQoOKTqMVCKiIs95YAVPe7Wq1/yR1hk1PGaRSxk8wXXjnRW6zRy35ClRzyGWM5Lfw/EMqOWZaDk7NoEHsUlWY58v2lvHkvKzHKnefOxx/UWJWB9tOG7CqL89KnfycDt0J6CHL+qzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIpm5b69SXnoYlgJ/Q1AQIZEgsYclfbcWKuRM/5sVI4=;
 b=T2bh1TRoJg9o7+G2HdUPkmb7F6mJA2oKKi209Wdgd5b6aMzLM4Vk3by0WScEnO0k5UFQDKj8HsMrDpKnKGYm8xT/tbAanNt14sP85+XKygVURLGiNN4K2HDAfZ9QcAH446TX/77Ljfo/1h1xrLUXWq6GU1qq+oqYBUXUp9ZGoxU=
Received: from BN9PR03CA0310.namprd03.prod.outlook.com (2603:10b6:408:112::15)
 by SJ0PR12MB8090.namprd12.prod.outlook.com (2603:10b6:a03:4ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 05:44:26 +0000
Received: from BN2PEPF0000A895.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::21) by BN9PR03CA0310.outlook.office365.com
 (2603:10b6:408:112::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 05:44:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A895.mail.protection.outlook.com (10.167.248.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 05:44:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 23:44:24 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 23:44:23 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 23:44:20 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, <amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v2] arm64: versal-net: Add SysMon and thermal zone
Date: Thu, 19 Nov 2026 11:14:18 +0530
Message-ID: <20261119054418.3740755-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.44.4
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A895:EE_|SJ0PR12MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 33063ad7-73d7-4923-275b-08df46002bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|261009223027099003|6133799003|18002099003|13003099007|56012099006|11063799006|261026140227099003|261102123227099003|261022075727099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8UreLJJa4c5ZkPqbMafqLBUG5XrL4k3js2+XYkwx26YTV2bYtlaTLcnb+I++0AWkbU6JcMiR2NpF2q0Q1wBOZRH5sWszslkxRk1WwkUqTggV79O4pOed4/OfbINZSCBZo5EE5khs3w3kt31/zVE59Av8TS3R9eMIP9V3Icc9PolXDkkM4kOGXzvFgl3Hpnj3rPFjp0Jt8uH0BAD/iTmbAhKql3wnXWY6xtBhDp7K5Yz8loLQ60ppVsB3C0Q6hF51P6HXcGXEMK9FP+olFdzZ5VUD2G7JNk7Z4SJihcewOLBtiSskb7RjtHgFd9/LweFQf/cD/XgLWy1+d8FMhoaRKZHDC70lgRXQ/YVVIS6Lo+LumSp5FhafgYzrfmB/Ruf6MQA5BB9/2RReVmVO3FUMjwXJbzhQeyeGOgvpy/g7kz2UzGo9IGXo5VaINPpZMs5ohhPOg1sHyRrWT/r0DnqHy7gQhK0VKOBRqTnMDHEny+dMoMJFBa/jhpsdvhacNn9JSUXzUP+ukQ98LOszamMDq6qNQqh57bwVU14O4abGTVPIGT2UlhdisqbUK0vZh9r+yveRu6tcEUM0+ZYk483KIP6w5XPFq4TFz6m87uOzyahCAocb2mP67A/mtvF+LCtcM3QrLGC4zduzjGwxExEFFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(261009223027099003)(6133799003)(18002099003)(13003099007)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261022075727099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N7VuWH47JM9WjnHRI02Osn3WFb7TKAfdi5iXxeVQcZ3lqxXfn1yq06Otcdbzfa1jSnG9SwqLY737O2rntZyksTztOAnE0YugwgVu4fkP9jeOdmvafQywinDqywA1xkHZvl6DWPUjnR3lw12OslMo/wP0GPcW3njzcUpwKV7rzISnYwdgFZuIWog9Y9ohawLpbvwNVFmv9amy03iVxF4bEUVCijskO25Yk+k+XjRL/v/TcUEw90wNGlCuaTmlPtaFKCaT3rFnBEB+tzzHd5CqqqG/TqMJ7IPL3y1AbTtzOFfhF2LahJtj46D/E5b6kkGI0YtkaQmeWc9fV8t3LaVDaHHtVztme5emRXwTevUVc1RbW2hB/jQ3WPG8cArbByH0ViUlmCgjleJCi6zA6LYdAKTBwdFESW6X2kAxRwc4E3TeGHCimY8ZwOmJgbNen/7o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 05:44:25.8216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33063ad7-73d7-4923-275b-08df46002bcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A895.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8090

Describe the System Monitor (SysMon) block in the PMC, which provides
on-chip voltage and temperature monitoring, and use its device
temperature channel as the sensor for a thermal zone.

SysMon channel 0 is the current maximum temperature across all active
satellites.

The thermal zone has a critical trip at 125C. Passive trips and cooling
maps, voltage channels and per-satellite temperature channels depend on
the design and are left to board files.

SysMon availability depends on the design configuration, and it may not
be accessible over MMIO, so the SysMon node is disabled by default.
Boards that use it enable it.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
Changes in v2:
- Split out of the versal-sysmon series and sent separately, as there
  is no dependency on it (Michal).
- Add status = "disabled" to the sysmon0 node (Michal).

v1: https://lore.kernel.org/all/20261102122112.1723130-6-amit.kumar-mahapatra@amd.com/

 arch/arm64/boot/dts/xilinx/versal-net.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index 9b74e59fd64a..fd976a577b18 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -706,6 +706,28 @@ versal_fpga: versal-fpga {
 		compatible = "xlnx,versal-fpga";
 	};
 
+	sysmon_temp: thermal-sensor {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&sysmon0 0>;
+		io-channel-names = "sensor-channel";
+	};
+
+	thermal-zones {
+		versal_thermal: versal-thermal {
+			polling-delay = <1000>; /* milliseconds */
+			thermal-sensors = <&sysmon_temp>;
+
+			trips {
+				ot_crit: ot-crit {
+					temperature = <125000>; /* millicelsius */
+					hysteresis = <0>; /* millicelsius */
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	amba: axi {
 		compatible = "simple-bus";
 		bootph-all;
@@ -1004,6 +1026,14 @@ spi1: spi@f1970000 {
 			clock-names = "ref_clk", "pclk";
 		};
 
+		sysmon0: sysmon@f1270000 {
+			compatible = "xlnx,versal-sysmon";
+			status = "disabled";
+			reg = <0 0xf1270000 0 0x4000>;
+			interrupts = <0 202 4>;
+			#io-channel-cells = <1>;
+		};
+
 		ttc0: timer@f1dc0000 {
 			compatible = "cdns,ttc";
 			status = "disabled";
-- 
2.44.4

