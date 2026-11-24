Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517737;
	b=udmWnKvjg0FsOTf49Bs5Ttewn+djGHaBMDfDsmbACqXXx5nuOgRZX4sqqNauJ27Ah3sE
	 fHmuKsT2ZuMM7MSw8dE3hY8lcuIeBaIUohyp5hPz5t1Y3GQ8xPJ6OedRtKfd/LrrGbagR
	 t9twpqw+o5Cmvnrr7I+12/q9yZ5G6ObJBNnwT13fSWQk9c9P4j78muLscDUjxb6z/iYyJ
	 Rj7qx6V44hvvcKSixKIKzkonTzobzgHvBNsTvBfH6g39GahxUKW5FW+N+5Oqzmxf3s/7g
	 G3PMCVIFYXna6p+YOxbd0ZSCxMEQRBvANxSUlYLBehfDkZLIlfLqRwE30fs+VSHTD7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YDVj1mB5+lS7Brj30hdX4xtAkU8QxVEf/KLYzhzDrfU=;
	b=wwb9p4GcbdtXvTuMIytvR+tdR0C2tLQhKpMdA1SqpIAVLD8TAoAKreV6ZDKWOIPjf8qq
	 l4a7028s1H1R/RoINqDg+G9SIOcf04T0L2c1saV8bK7zyFiyreC86DFvCcDoD2nAVygJS
	 o/oLqZztN9gXzwXm4FArg8dbmbjS/VpP5ATjByF9giBJ5zCgcqBxYBWgICHSFA/DusbLF
	 R2W6HVFIA+KbGAE7eQzHbHhTj+Wj2SVHj2tMeVHXrStxU+1WwRK2Z4TYXFJw+ec0d3Q8H
	 MaIN0F5Shq4blPh78FsihB/48WLpQVFXfrz76JwGJwvCkOcCZZ41Iw3iIVWJO56ypKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GpgH/O23";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZVFvB3C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44A0606A331
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B44A0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GpgH/O23;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZVFvB3C
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8WYjQ2209288
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YDVj1mB5+lS
	7Brj30hdX4xtAkU8QxVEf/KLYzhzDrfU=; b=GpgH/O23zz6jGIWYaXPLgN/fSIZ
	4RoV8oB5igZSpxajJPA1rAdLKg2HIs+v/+Mdb7gRjlciWLkveCOvHBY4NC/XHbDT
	jqrkJ3au09zckx7wZx5q6CK5UB4mvT8M6loYYbDrE/txiJ6TKcxNDTX4l3BZewt1
	CSel86d+DUXkYIezTR7SwZ3zEFLhKYRLx0tQ8N3N0HSa7+ZugDisqG9ylMIOhcLz
	7ITof7PVhoNB44J7HPK/HGkBrnWAJzuirUI2NuEuV3UHwx4ajHk/uBXzhJ6pQbbT
	bO6hbAyFFCfxTEQvmIBxAmnCVUMdZPoFEcKwf9J8Yi4JUOPt7nWLCDA7xeg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy12bvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3ae17c536so4360711c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517733; x=1796122533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDVj1mB5+lS7Brj30hdX4xtAkU8QxVEf/KLYzhzDrfU=;
        b=AZVFvB3C0pBFF7gqp9BZkhf0FwVJPLq6ijRHuAfprXePUJUWzCpaIgUi2nsjnv+aP6
         E9txAsy2M8HAr4ynugzA5eDFu/90v/YRowRGswDa8YoNg/C0UUZ5QfqG/A24YKF1bmjx
         l3XY5yflTEXar+Ebviy9VRl5YVSxJ+2Mmb3ZFpbpT+FgRJ7CW5SmO/B0ptM120YhCP6V
         5fxIayOmExkvuUp3byV0LBln6NHF8Mh1xFJ3LgWUsZAZ/loY74cnwp9faJi42jLHxmbB
         lDH+6EggpB1RG6q6uVNzDjP2isjJJ+0bZeB7PvNx5NwFuJr40RCTBMmtbM3PeUs13gR5
         QHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517733; x=1796122533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDVj1mB5+lS7Brj30hdX4xtAkU8QxVEf/KLYzhzDrfU=;
        b=eGVWh3hyEb78CPfaFb+Lxc2U+xpyZ3LXtivBn5LSINSPIrJrBYq9Hr9rCGsi5ZSJ7J
         7G/gIKlXGgbuTUGFuLB+zSqmNg7ROV2V+HMgOJ2pYxeQi4bLe6r25lZA76AYFOAp/IXE
         /TwI3iWHSfrcvK9LNp4x32uF7069CqGChQizkshd7TLtLRotfb5i6CjlVq6Lx23R26nx
         eIMDxOBKJOFMlXgm3OH56QI8hB8xnEPAcOWdlc51dM8aRc+VgTV2uVJlRz6067mw+b8v
         mVeMaqHxw/vVGhrWuKWxqy01Yco0druESr8D2Nik7Xy27Hgamd1NE3x48kWKZY3MFYho
         criQ==
X-Forwarded-Encrypted: i=1; AL+hErHDwHc1Hi9ycbKm+qf51lmFYGFO5qr8A9yDLopRzcoDftVgXyXV8J6z07Exu5xsNZ4Dlix6ZqSeHlp3@vger.kernel.org
X-Gm-Message-State: APuU4Z/AH3FTZpXrenrUNtsIG0F3XS+XvzhPCeXum8zq46Y3I32WEL9+
	tzrkXdqZXd3pQwxoD53F2r2s0ZS7A6/4HWeUGoH8Pv0rSIfOkEW1/GaI/u0XAW95f+zL9DoDRxD
	vyB7FAWFasatIoTwptO4V9QHFFkzPGcvpFyLxSIGt/lgQKRG4LiDMuaxb22R1K7V4xGTBaVHe
X-Gm-Gg: AZFdTZe8wi196CxiB+Qh6gIuNpDnunOb8XtzP8kAgVFczrVYxoV58kdg1RRncIBlWKU
	nk6s4wmx2A75gsaEhW469dvfbiQPaJvkSOUbGioqsvz7gGtURW5YEMi3CPkgCMTODMTLkU0rx0T
	AatwuYgG8IHNDiDF4OY1qUE0NOevn0hOhWsrtw4P8yuQ60bASbUVANCkvG+h9Wufep22Djz4esM
	45kJuJbJTt/I81/1G/liA/NmgMJb6NAQe1XZLvUYnxxGS4zc7pfLjqg41wJCoEuqR5VyaD+WwUa
	OJtWlRFVPJLYrnxHmze2zRKR+1GkLUjImbcVzPFNJ7+xC0tqh6gBGuvDbrrvJMINGDbaP/jxey3
	UkdrDk1Jkr5SBxbq7/nIW7UQTM8nhX8zoy5gIkqcJanqYAdB17lGdzHCHe4+W3mI0xC4yhPjTYb
	b4ALTtcpD4Rl0mjDipWL+QOBAehfZPk4RbjhImAu4wsyWah8E760TqcWZx
X-Received: by 2002:a05:701a:8457:20b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b55689edb4mr13607475c88.12.1795517732630;
        Tue, 24 Nov 2026 02:55:32 -0800 (PST)
X-Received: by 2002:a05:701a:8457:20b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b55689edb4mr13607447c88.12.1795517731691;
        Tue, 24 Nov 2026 02:55:31 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm22616418c88.4.2026.11.24.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:31 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: seca: Enable Seca Ride board support
Date: Tue, 24 Nov 2026 16:25:11 +0530
Message-ID: <73f8ad18d65b6a6c5ad22d8a9730d7213f03627d.1795517711.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 4TQ9CNGOzb7xvVJO4-aRXZsMzP70JIs8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX192mTKURrfvG
 fxi8Jlfx2bDw8AxibnAiqTZ1KOs1WwmTYNjwP9xKVGHMzPgeFyw818ZWsDOUgxtnjhegmAwWvcO
 hFkEoRT/ULrItpDhNtKU4oy27lQfGfA=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b056d26 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3m44IQcfwlaWQfV1PCsA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX92+/2oZOoLJl
 d0pYGTLS9eHO8a59lz4oE1EEVnFZQAnf9vHh73uGTsdDdpGjPjKHjJxc+FEPAcGIyiv3ryqOK9E
 Zmd1HvwhxjXW/9cgfqJN3QoqyUntfZqnBWCDZdWTWatMwlXV0tcQ5y71AsJDQ9fLsnl8+0ep83b
 g+ogGXEGEnVEuGvRtQII0MWyT88yhmpDJoJmJOGiceP2rzU7C3A8e3HaexRJJtOQVMHKgrCfNTy
 i01IHNL5BQywklr9t9I3MjTf2/+5k3IMrwHh0YgtJsPAI1EatVslPR/Yp+KrVYriADiZ55K9NZ1
 jq6vamYUr0fhSIfx/qnkJLyRItak3dMQZ5QjClTVwMo1B3pmg5hKSq/4F20ZaZF0v0+JYZYO7iG
 iBKhg0T0Vmih/h3pxtvkkfdepUCryvUg9AKplriVyroIiaQwgzNzMj/jQt6xZkrZJ8dsvy7rGMc
 jYzdfcRWRGeGuLS1How==
X-Proofpoint-GUID: 4TQ9CNGOzb7xvVJO4-aRXZsMzP70JIs8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add SoC-level device tree include (seca-gearvm.dtsi) for the Seca
GearVM variant, where a VM controls platform resources (clocks,
regulators, power domains, etc.) as SCMI server. Each client gets a
dedicated SCMI channel and Tx/Rx doorbell, so resource requests can be
issued in parallel and aggregated by the SCMI server. Communication
uses the Qualcomm SMC/HVC SCMI transport. It currently covers:

 - 64 SCMI channels using power domain, performance and reset
   protocols, backed by 64 shared memory regions reserved at
   0xd7600000-0xd763f000
 - Four QUPv3 GENI SE QUP blocks (qupv3_0/1/2/3) with I2C, SPI and
   UART controllers using SCMI power and performance domains via
   scmi9 (I2C), scmi10 (SPI) and scmi11 (UART)
 - UFS host controller with SCMI power domain via scmi3

Add initial device tree for the Seca Ride board, built on the Seca
GearVM variant, to boot to shell:

 - Configure UART15 as the primary console
 - Enable I2C18, SPI16 and UFS storage

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |    1 +
 arch/arm64/boot/dts/qcom/seca-gearvm.dtsi | 2862 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/seca-ride.dts    |   81 +
 3 files changed, 2944 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/seca-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/seca-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..d8b990daf73a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -415,6 +415,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= seca-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/seca-gearvm.dtsi b/arch/arm64/boot/dts/qcom/seca-gearvm.dtsi
new file mode 100644
index 000000000000..68cffd920afa
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/seca-gearvm.dtsi
@@ -0,0 +1,2862 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "seca.dtsi"
+
+&firmware {
+	scmi0: scmi-0 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem0>;
+		/* We expect the bootloader to update the IRQ numbers */
+		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-1 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem1>;
+		interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-2 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem2>;
+		interrupts = <GIC_SPI 965 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi3: scmi-3 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem3>;
+		interrupts = <GIC_SPI 966 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi3_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-4 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem4>;
+		interrupts = <GIC_SPI 967 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-5 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem5>;
+		interrupts = <GIC_SPI 968 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-6 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem6>;
+		interrupts = <GIC_SPI 969 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-7 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem7>;
+		interrupts = <GIC_SPI 970 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-8 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem8>;
+		interrupts = <GIC_SPI 971 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi9: scmi-9 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem9>;
+		interrupts = <GIC_SPI 972 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi9_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi10: scmi-10 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem10>;
+		interrupts = <GIC_SPI 973 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi10_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi11: scmi-11 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem11>;
+		interrupts = <GIC_SPI 974 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi11_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-12 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem12>;
+		interrupts = <GIC_SPI 975 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-13 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem13>;
+		interrupts = <GIC_SPI 976 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-14 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem14>;
+		interrupts = <GIC_SPI 977 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-15 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem15>;
+		interrupts = <GIC_SPI 978 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-16 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem16>;
+		interrupts = <GIC_SPI 979 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-17 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem17>;
+		interrupts = <GIC_SPI 980 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-18 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem18>;
+		interrupts = <GIC_SPI 981 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-19 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem19>;
+		interrupts = <GIC_SPI 982 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-20 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem20>;
+		interrupts = <GIC_SPI 983 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-21 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem21>;
+		interrupts = <GIC_SPI 984 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-22 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem22>;
+		interrupts = <GIC_SPI 985 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-23 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem23>;
+		interrupts = <GIC_SPI 986 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@15 {
+			reg = <0x15>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	scmi-24 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem24>;
+		interrupts = <GIC_SPI 987 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-25 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem25>;
+		interrupts = <GIC_ESPI 0 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-26 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem26>;
+		interrupts = <GIC_ESPI 1 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-27 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem27>;
+		interrupts = <GIC_ESPI 2 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-28 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem28>;
+		interrupts = <GIC_ESPI 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-29 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem29>;
+		interrupts = <GIC_ESPI 4 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-30 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem30>;
+		interrupts = <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-31 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem31>;
+		interrupts = <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-32 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem32>;
+		interrupts = <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-33 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem33>;
+		interrupts = <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-34 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem34>;
+		interrupts = <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-35 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem35>;
+		interrupts = <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-36 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem36>;
+		interrupts = <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-37 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem37>;
+		interrupts = <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-38 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem38>;
+		interrupts = <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-39 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem39>;
+		interrupts = <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-40 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem40>;
+		interrupts = <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-41 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem41>;
+		interrupts = <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-42 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem42>;
+		interrupts = <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-43 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem43>;
+		interrupts = <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-44 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem44>;
+		interrupts = <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-45 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem45>;
+		interrupts = <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-46 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem46>;
+		interrupts = <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-47 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem47>;
+		interrupts = <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-48 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem48>;
+		interrupts = <GIC_ESPI 23 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-49 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem49>;
+		interrupts = <GIC_ESPI 24 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-50 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem50>;
+		interrupts = <GIC_ESPI 25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-51 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem51>;
+		interrupts = <GIC_ESPI 26 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-52 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem52>;
+		interrupts = <GIC_ESPI 27 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-53 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem53>;
+		interrupts = <GIC_ESPI 28 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-54 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem54>;
+		interrupts = <GIC_ESPI 29 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-55 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem55>;
+		interrupts = <GIC_ESPI 30 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-56 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem56>;
+		interrupts = <GIC_ESPI 31 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-57 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem57>;
+		interrupts = <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-58 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem58>;
+		interrupts = <GIC_ESPI 33 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-59 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem59>;
+		interrupts = <GIC_ESPI 34 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-60 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem60>;
+		interrupts = <GIC_ESPI 35 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-61 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem61>;
+		interrupts = <GIC_ESPI 36 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-62 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem62>;
+		interrupts = <GIC_ESPI 37 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi-63 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem63>;
+		interrupts = <GIC_ESPI 38 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+};
+
+&reserved_memory {
+	shmem0: scmi-shmem@d7600000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7600000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem1: scmi-shmem@d7601000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7601000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem2: scmi-shmem@d7602000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7602000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem3: scmi-shmem@d7603000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7603000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem4: scmi-shmem@d7604000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7604000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem5: scmi-shmem@d7605000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7605000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem6: scmi-shmem@d7606000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7606000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem7: scmi-shmem@d7607000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7607000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem8: scmi-shmem@d7608000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7608000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem9: scmi-shmem@d7609000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7609000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem10: scmi-shmem@d760a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem11: scmi-shmem@d760b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem12: scmi-shmem@d760c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem13: scmi-shmem@d760d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem14: scmi-shmem@d760e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem15: scmi-shmem@d760f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem16: scmi-shmem@d7610000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7610000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem17: scmi-shmem@d7611000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7611000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem18: scmi-shmem@d7612000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7612000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem19: scmi-shmem@d7613000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7613000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem20: scmi-shmem@d7614000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7614000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem21: scmi-shmem@d7615000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7615000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem22: scmi-shmem@d7616000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7616000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem23: scmi-shmem@d7617000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7617000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem24: scmi-shmem@d7618000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7618000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem25: scmi-shmem@d7619000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7619000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem26: scmi-shmem@d761a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem27: scmi-shmem@d761b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem28: scmi-shmem@d761c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem29: scmi-shmem@d761d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem30: scmi-shmem@d761e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem31: scmi-shmem@d761f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem32: scmi-shmem@d7620000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7620000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem33: scmi-shmem@d7621000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7621000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem34: scmi-shmem@d7622000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7622000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem35: scmi-shmem@d7623000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7623000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem36: scmi-shmem@d7624000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7624000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem37: scmi-shmem@d7625000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7625000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem38: scmi-shmem@d7626000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7626000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem39: scmi-shmem@d7627000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7627000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem40: scmi-shmem@d7628000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7628000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem41: scmi-shmem@d7629000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7629000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem42: scmi-shmem@d762a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem43: scmi-shmem@d762b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem44: scmi-shmem@d762c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem45: scmi-shmem@d762d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem46: scmi-shmem@d762e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem47: scmi-shmem@d762f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem48: scmi-shmem@d7630000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7630000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem49: scmi-shmem@d7631000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7631000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem50: scmi-shmem@d7632000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7632000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem51: scmi-shmem@d7633000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7633000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem52: scmi-shmem@d7634000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7634000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem53: scmi-shmem@d7635000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7635000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem54: scmi-shmem@d7636000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7636000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem55: scmi-shmem@d7637000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7637000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem56: scmi-shmem@d7638000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7638000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem57: scmi-shmem@d7639000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7639000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem58: scmi-shmem@d763a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem59: scmi-shmem@d763b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem60: scmi-shmem@d763c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem61: scmi-shmem@d763d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem62: scmi-shmem@d763e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem63: scmi-shmem@d763f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763f000 0x0 0x1000>;
+		no-map;
+	};
+};
+
+&i2c0 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 0>,
+			<&scmi9_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c1 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 1>,
+			<&scmi9_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c2 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 2>,
+			<&scmi9_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c3 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 3>,
+			<&scmi9_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c4 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 4>,
+			<&scmi9_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c5 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 5>,
+			<&scmi9_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c7 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 7>,
+			<&scmi9_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c8 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 8>,
+			<&scmi9_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c9 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 9>,
+			<&scmi9_dvfs 9>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c10 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 10>,
+			<&scmi9_dvfs 10>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c11 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 11>,
+			<&scmi9_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c12 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 12>,
+			<&scmi9_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c13 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 13>,
+			<&scmi9_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c14 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 14>,
+			<&scmi9_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c16 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 16>,
+			<&scmi9_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c17 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 17>,
+			<&scmi9_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c18 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 18>,
+			<&scmi9_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c19 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 19>,
+			<&scmi9_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c20 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 20>,
+			<&scmi9_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c21 {
+	compatible = "qcom,secaau-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 21>,
+			<&scmi9_dvfs 21>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&qupv3_0 {
+	compatible = "qcom,secaau-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_1 {
+	compatible = "qcom,secaau-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_2 {
+	compatible = "qcom,secaau-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_3 {
+	compatible = "qcom,secaau-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&spi0 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 0>,
+			<&scmi10_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi1 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 1>,
+			<&scmi10_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi2 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 2>,
+			<&scmi10_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi3 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 3>,
+			<&scmi10_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi4 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 4>,
+			<&scmi10_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi5 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 5>,
+			<&scmi10_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi7 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 7>,
+			<&scmi10_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi8 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 8>,
+			<&scmi10_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi11 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 11>,
+			<&scmi10_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi12 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 12>,
+			<&scmi10_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi13 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 13>,
+			<&scmi10_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi14 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 14>,
+			<&scmi10_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi16 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 16>,
+			<&scmi10_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi17 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 17>,
+			<&scmi10_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi18 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 18>,
+			<&scmi10_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi19 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 19>,
+			<&scmi10_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi20 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 20>,
+			<&scmi10_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi21 {
+	compatible = "qcom,secaau-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 21>,
+			<&scmi10_dvfs 21>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart0 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 0>,
+			<&scmi11_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart1 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 1>,
+			<&scmi11_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart2 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 2>,
+			<&scmi11_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart3 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 3>,
+			<&scmi11_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart4 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 4>,
+			<&scmi11_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart5 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 5>,
+			<&scmi11_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart7 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 7>,
+			<&scmi11_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart8 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 8>,
+			<&scmi11_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart9 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 9>,
+			<&scmi11_dvfs 9>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart10 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 10>,
+			<&scmi11_dvfs 10>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart11 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 11>,
+			<&scmi11_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart12 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 12>,
+			<&scmi11_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart13 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 13>,
+			<&scmi11_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart14 {
+	compatible = "qcom,secaau-geni-debug-uart",
+		     "qcom,sa8255p-geni-debug-uart";
+	power-domains = <&scmi11_pd 14>,
+			<&scmi11_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart15 {
+	compatible = "qcom,secaau-geni-debug-uart",
+		     "qcom,sa8255p-geni-debug-uart";
+	power-domains = <&scmi11_pd 15>,
+			<&scmi11_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart16 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 16>,
+			<&scmi11_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart17 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 17>,
+			<&scmi11_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart18 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 18>,
+			<&scmi11_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart19 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 19>,
+			<&scmi11_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart20 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 20>,
+			<&scmi11_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart21 {
+	compatible = "qcom,secaau-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 21>,
+			<&scmi11_dvfs 21>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&ufs_mem_hc {
+	compatible = "qcom,secaau-ufshc",
+		     "qcom,sa8255p-ufshc";
+	power-domains = <&scmi3_pd 0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/seca-ride.dts b/arch/arm64/boot/dts/qcom/seca-ride.dts
new file mode 100644
index 000000000000..ddcdc3bb6197
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/seca-ride.dts
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "seca-gearvm.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SECA RIDE";
+	compatible = "qcom,secaau-ride", "qcom,seca";
+
+	aliases {
+		i2c18 = &i2c18;
+		serial0 = &uart15;
+		spi16 = &spi16;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&i2c18 {
+	status = "okay";
+};
+
+&pdp_scmi {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&scmi0 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi9 {
+	status = "okay";
+};
+
+&scmi10 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&spi16 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
-- 
2.43.0

