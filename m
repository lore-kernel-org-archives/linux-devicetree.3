Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF1D43786C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330539; cv=none; b=g83sC2VQ5HT3gjRn+SoonymE4rZN+Q2k3BwuEt95Osl0+BaduWLqdYFNEFJ/RNOzox2lxvrcauMuzyqk7dTY5/+/VsCd6liXS0SGLEHR6Dha5jo7ZbSQry2u6pFSxsPvRtX+C0nVuhBCkBHWH5HQX/f/pSi89wwNy9uMLchUYio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330539; c=relaxed/simple;
	bh=42Kj3VAyHdKAb4Mujj+SNBJjepZpYO0t8Hxlz5eSYok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGbtWVVhHszYPFeiH44ZnsfW3Tnhu85JKrf74fpCQF3mVtNlk116MLGLDy0Efz76bVGZ4hjlfWTPHn+Z27QEuKiAYWGEFfLR0C5hEbx0V2YXZ+z42XPHY6F5ooR/9T7u5/2uRN8RzXyQFj2BhfbRcPXVXbEoJaY1lhAmIRJo/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkaf0IXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLo5kcQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkaf0IXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLo5kcQU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694KS6142839
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x4hNt3rfNhUiPXOePYpG8Tjf20b4cSynXFo
	kVgMJOC4=; b=hkaf0IXL4USdEe3sk0UKsslLAhxribsbMOq4P5NJ+pZlGwyjVlN
	uNEa75X596G0RL4wNsJZGlRgf6SoaNrXLTNx6Q4uN5E6knM76KANsP2fviOsaVfI
	i2yn79rpzofaLkK5jExvWEA1U5LHU00cHqgXz05asUzOuaIz5SET6w3IThDN9uPH
	IkNCGnNbTj6HTzTBGI0e0pCJp3vP+HN5UGLrVz90lqJVN41bHds/+xijrmlctRkP
	L6yEUdH/41PmtxQTWdVLRP9JDOGrgn8HDiknXlvHF3XbeHIPMExD57joolQWzUOJ
	mEfcU6Vvkx32kVMsSLjQKKHeVMe/mww1Upg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swpbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:35:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so370094285a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330530; x=1783935330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4hNt3rfNhUiPXOePYpG8Tjf20b4cSynXFokVgMJOC4=;
        b=hLo5kcQUH/ZEoNTg9xQ55bRyXfHmQBLWEGRVS1P2KLG7HOOjBF69yzBI4IbfZOF9fF
         VveAq0e9ryyR3/vfbMK53uRi18vlyWNvekEcj5645fWJRwZAXU75sZSQW8UlOL/hdzFx
         SrkLAoNSeNGCA7/EPYHM/L4MVOoPAN2GoQu2+vaqhSFwTb+bputtY1SX+TS2AAheewYs
         nLjjtSTV1NuARvyQ0sVdjoKlThCMg5NC14o9OhQ5muMIO/VPuL3DIcKsqJfUglsuTqr5
         kDXJvhWqMg/YZkgzEKa//A2tP+qRahLvanlRi+nbQVstd4m0fzI6UyVtICyHD5grqO/G
         Ej4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330530; x=1783935330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4hNt3rfNhUiPXOePYpG8Tjf20b4cSynXFokVgMJOC4=;
        b=iRLV2pZKayW1DCZUSFbQHtiWh3QlcK3JC5J0aP4comn85OdZkHIEdSxE3SJe20RBob
         EuWy7zZtt10+eVUDHH6eSJj60Q4Hy6JRV9PKCRt+8hy0EqZC4tt7VJcykqeSxT2earKq
         Y/zJ7tjWUsuejYvqG8JEubYIo7xM7ZrF04D8w7++t+gFw4Ojt7adqipQzOXC7c9aOzfk
         +GsEoWZWGjeYu0iPwL5us8TUorQNQP3k6bAM6kebd6Sx2l1KbtGJ2+ppFeE5+ejdPYqW
         2vdAFOEonyn5/A5FEZrdM75VHj2n09ZE0ZlLnWHQj1nV/GebkmnBTftOMpGX7N8nJSTF
         1xUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1pmRyMTJT0qDnlGBNP8P07M8XJl3Dq7lwfti0bs6c4pk37G2UpnI35v7mFjJv9QKh8nIARC/ibqAT@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFqfNNI9NkkS2c2trC3pdOlkGsiD6GbXyA149W3wUt4yTSCL9
	+kHGXGNPuEYj2G8/XOdBuAQdn88TzJ5VsmkBp1emWGYBFgm2ZLwdHiyXhZJe8dfuneNCQQUWAnK
	hNm0+FqkoGXIrRoHwP4LhVAWKyDUk2Svf44Te0SSNDwHrHIqyJ2Wh76VbalcHPlB3
X-Gm-Gg: AfdE7cn2EXclfQGcMAU5yTFVY5gD7lYqn7chsOEH+qREHMgGTDJGc83Ub0ROMjb5GMN
	p00NIBxUNNKeKIMoKAerINX7PjF90FAEcAvt56dwVLHm5t67NfC9nhz2b0m7bjVh/79aPlLKejY
	oAFwRU1zsJ18no7HA0+UizE0FAEzAUzmaXUBVFIjEf5bNCr+Q1Fzx+7o7kymOBu5UB+CS4drs7Q
	64Q6FORjsAaOhAWUdDOuj6tT1Y3E1BjDNwz5XrihPy0NbQj+1B9j0HSkVrAWa0LS8k0XJQj/U0f
	QB3EpkgF2saJc2Du307YknoN4O3LrAKvE5A2XEDJMZo/x4Y8QcZa4+UQhOWsp8vb/8dRQqHwlRo
	5Ri+NqSGHpkQdXZ1wgf5ogjUVLRs=
X-Received: by 2002:a05:620a:6082:b0:92e:61f7:5687 with SMTP id af79cd13be357-92e8b539407mr1666943385a.29.1783330530188;
        Mon, 06 Jul 2026 02:35:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:92e:61f7:5687 with SMTP id af79cd13be357-92e8b539407mr1666940885a.29.1783330529728;
        Mon, 06 Jul 2026 02:35:29 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce11497sm290925905e9.12.2026.07.06.02.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raju Rangoju <Raju.Rangoju@amd.com>,
        Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
        Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: amd: seattle: Remove useless clocks DTSI include
Date: Mon,  6 Jul 2026 11:35:24 +0200
Message-ID: <20260706093523.274093-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3395; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=42Kj3VAyHdKAb4Mujj+SNBJjepZpYO0t8Hxlz5eSYok=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bcQfZBrCmFoiQLVudR7CeFVhhcE1ScGZ28e
 W0f9Y+B2S6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt23AAKCRDBN2bmhouD
 17p9D/0TBfp+/n2xq15jwV+novyrQONMFBQzxVcD3OoZwwPOU8qtkM9NzipW4MzH4KE3E+woz0X
 BU3efE1WpDvV4kqwdfL5mTgRlDfRZ0jNG1m/bz5ZqetiEUr51n0mungnDcyOSfNOb95R+grGE2f
 Tbx1WrcD4Hoy3y6lU9xmTFjTutHdyXUeb7u1J5dx+5IjpkoVAl0mFikumq79U2QnCo9dxNObBI6
 7hVzSYtFoddGkC62brq4MvQXVKAokCabbsE8GIzZaSuGu/wRGNIjt3yLgZEFj9Jzm6KTqO3pQGh
 JVs9jJZ+Mnhs3+fTQzyrihS67Hhh6mCb9rv91uq4iqDhRw/k9RkjuBQUmy/rPD7aASx08TUy3DO
 N+KPQeIUtXJbf9lNoBQHLxJiAViV/kiG4kWPnpNZt5B0PYDOdNqoA+p+kr/jHMGEFRRTlFEbxFT
 eLjyb0YOwtrZpzTeNOFzvufkfSbHnKF2c4q48bBypqqu+jFpeP4xAz59ybY2MGHO5AtxuuTcG4F
 a7XA6BhG7383HWfezFLWMODQrIoSJpOKKnJmRNPKkzg1pniDbm+fkCEtafw/GlRgostlu4NZibQ
 y+BqC8WAblUCBOnSSHruMRldGpogIuQsdR5m5VoV54tTZBceYVURjWpV+CY3wfBE7me9Mise0Th Hd8KadIKhcCuXOQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXyQQSN04tjS2C
 9bM+8JItJPtP3gHYRp+L6+eFV0KEvsijQxwxmNwWSLWerOhP3xRozUlPcLz5OmcD4TFu+Q++66q
 Ag2TF6LDPbC+7lbVlz/MtS6NdOrbsRg=
X-Proofpoint-ORIG-GUID: WIlwFXxNiYScLViOyHMWJnr3vjl3o7fg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX+fc87xccl3Fv
 Z5T4DPlJ32zt6/njwe+nGnB3VTJa9Z6s2vpsshO6mwmnfnM5TToysXHsMHD8N3f2afJ/tMfZXTz
 40GkpKCD9Jt40nife9CrMPtYuA5o4SvnxJpHD4FrvJAQpyJSjx2NnQOP0Dr1x7kCoKjXQH7kriA
 96pTwIw4lEeEzeGdZqOK2TtDo1p25qlvXb1Pm5u0sHycsd+NrsRuyQYeVQQv9e3uRPzhwQd2oaf
 88Z5QJKF0Yq+UjL+8BR65vuR04jqRitXKE3YHPF4OrWQNxM70W3X5xpcviSJBYRsGm+ecUkrMJ6
 IJysaMr63UqAACf3xstL0g14nsWmLPZQ1HM0rRzFLdPYPmq8xsKXntrSpa6elcb+yXr66XZzl+5
 0/HSz3+7BBOuWO9D1wrv9saexekJ81vphWegm80wGstrIL18d4y6nlMXCN6s28D3QOP7OOhdXRM
 Sc4LL1cMFFi1sN4p6wA==
X-Proofpoint-GUID: WIlwFXxNiYScLViOyHMWJnr3vjl3o7fg
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b76e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LplHZR8TypZ71DMuxxAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

The "amd-seattle-clks.dtsi" file is included exactly once, so paste the
contents directly in proper DTSI.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi | 43 -------------------
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi  | 36 +++++++++++++++-
 2 files changed, 35 insertions(+), 44 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi
deleted file mode 100644
index 73f687773ce6..000000000000
--- a/arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi
+++ /dev/null
@@ -1,43 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * DTS file for AMD Seattle Clocks
- *
- * Copyright (C) 2014 Advanced Micro Devices, Inc.
- */
-
-	adl3clk_100mhz: uartspiclk_100mhz: clock-100000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <100000000>;
-		clock-output-names = "adl3clk_100mhz";
-	};
-
-	ccpclk_375mhz: clock-375000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <375000000>;
-		clock-output-names = "ccpclk_375mhz";
-	};
-
-	sataclk_333mhz: clock-333000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <333000000>;
-		clock-output-names = "sataclk_333mhz";
-	};
-
-	dmaclk_500mhz: pcieclk_500mhz: clock-500000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <500000000>;
-		clock-output-names = "pcieclk_500mhz";
-	};
-
-	xgmacclk0_dma_250mhz: xgmacclk0_ptp_250mhz: xgmacclk1_dma_250mhz: xgmacclk1_ptp_250mhz:
-	miscclk_250mhz: clock-250000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <250000000>;
-		clock-output-names = "miscclk_250mhz";
-	};
-
diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index a611f8288b3e..c5b9dbfdf014 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -11,7 +11,41 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	/include/ "amd-seattle-clks.dtsi"
+	adl3clk_100mhz: uartspiclk_100mhz: clock-100000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "adl3clk_100mhz";
+	};
+
+	ccpclk_375mhz: clock-375000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <375000000>;
+		clock-output-names = "ccpclk_375mhz";
+	};
+
+	sataclk_333mhz: clock-333000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <333000000>;
+		clock-output-names = "sataclk_333mhz";
+	};
+
+	dmaclk_500mhz: pcieclk_500mhz: clock-500000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <500000000>;
+		clock-output-names = "pcieclk_500mhz";
+	};
+
+	xgmacclk0_dma_250mhz: xgmacclk0_ptp_250mhz: xgmacclk1_dma_250mhz: xgmacclk1_ptp_250mhz:
+	miscclk_250mhz: clock-250000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <250000000>;
+		clock-output-names = "miscclk_250mhz";
+	};
 
 	gic0: interrupt-controller@e1101000 {
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
-- 
2.53.0

