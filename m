Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98874B1B41
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444477; cv=none; b=ekDwSJFFpFoITtdZiiuqLaYI8ZxOV3b9q9xjhr+Cp3yv3EdoCRD3EIaCRo/40Me1y5UNH1OQ+2CAgTfyYy++EU1ybehZYYd1JNr3J8UX6xdpxWiLe2Dpqsv2OsjqHZno/LnTEMMZe/NCX6HwK6bUEfqmgwtV9nl5CP4AXRIHSMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444477; c=relaxed/simple;
	bh=T7O6lWalj+va9qpA7dMF0Q6gAhCbv6X5eCxp24xWTI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSWAt8oMeMrs4KWwVQAgJkf+8e2jCfw7fhHTcg+3lhBTUzL6AoVMDLGPwGphcmZ4A8ShCFFjqeTqh2AMg1IhS1j6SW2qx4iIICGv7RzrtRzTyiWmpHI03f239Hx5miZTZ75taP0LaOKjy6kZXjcymeEKVzVkzEb8Vd2TzYxIru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUPiU23O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmVA8UbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUPiU23O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmVA8UbF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DANLe588303
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 14:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/bcyhSVUxb1
	z7Kx/Bh6dfuK/wNwgd4ynGbtp/yocQ0Q=; b=EUPiU23O3QqN/+916OY49HMgKJP
	TMBO6fEcYFVK4PIgX0Aq5tNU0eWAxm6dmjAtiWSQjpGveHjlVgNPEDIBp/gtRA87
	dU9ljpEByAizvtx2kc/SoV5mOSRnM9xN8ojMpNmdXrUhghapjm68duwQn8iXvBVB
	TkhvxrrhFmJ7AkUitMBrJQgXjRi64d6VZQ/eW+5WVKUS2akwYMZW+2PMLKUxcn4C
	5tfagEEfvYRHIDOw8JJpde8VMPaNq8stvPKSF7G1FDLrlsJ514U1U9NaVszyWKCH
	rirqM6et8cS48F9fC+BnxxgtNdGu+wzGbovO0QFuhf6Xo6vC4+MfFGsfg6g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyj933-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 14:07:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3390040a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788444459; x=1789049259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bcyhSVUxb1z7Kx/Bh6dfuK/wNwgd4ynGbtp/yocQ0Q=;
        b=cmVA8UbFcVQ3ldmG0HJSn1/b8vQVdQakGldl5riGhMMoqJvarnhIP/6JIXMqXA9uOu
         MY6HGoG+iXxterPQFmFssC3zvvu/0DFG95DQMOR09s4Wa5AczkSlGK9nEnTWusPdWzqZ
         7/U5DUv0QhGs30GiduCCCrLZgtUS1otgjPAb+4tul518rtVkpHi1Wj9Jcff+2Dye5bY+
         It0PPuFuG44C8G3j6eHYSiHjTuGA0ZBbxm54ZZz3/8eMz6K1FFY3wfiuPCi+17byaLlQ
         DYL/IxdrxbZNJdlFMXJVk3LXfcDPyh6ApyORV1Cc6CRjRWWy6c8gDVbSp1Lnuj48RPTP
         H2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444459; x=1789049259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/bcyhSVUxb1z7Kx/Bh6dfuK/wNwgd4ynGbtp/yocQ0Q=;
        b=bm+2HxCG9TiWlOjJophT8rPdIuHFmLE2/jweA176ubaj0RN/ogShR5eZV8rTFtNc+H
         jJT3/IRrJiJpJhr1bPkpaJy34SN26iF1RbKQh4fvxPQYrwNLEYngGlA33As7Esi7O+ql
         J1Z60JdMVBBOt6XDx3QojE2bWxTlXhgaoSOAyswACVboT9ZD7wEGuZ4OCfJrxn2UoCx0
         wyctIOUs9lo02JtQl0wh4YeL5t8vdl+x9tR7nIfW733Gc3jC2DlTGuohX4azbvaXfX7J
         Qb5ZQTfmPN3wnYlmwOpfmaoeK3rvrD3i/zePqbbyqSSJszXdEb+ZuryFNLDFT3RbVHJc
         RTCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwltvAkf1qX6NfCIlHv2EbFgiuh1XZSkY2uU8jhvKSkmt/i+NP0fFodgZvKY5uTUqwZKjDgdNXVMQDq@vger.kernel.org
X-Gm-Message-State: AFuF++kCqkA57nEfccCrj1z7inlaEaz843Fsb1ElL66vYu8tv8/+F8gX
	lfWZxg0Lbxezaunr8pYOVUwdEjZGp9gpSSA0gYZFzta+2RvRkfeBt+R1Vcg+jdLs2W3LI16QXr8
	XkT/xwNA+AXmm5cPG0U2HP+4A2KM5b1DOGvzj+tute+UJ/OqsrHSXdn33Z7ks3521
X-Gm-Gg: AYBFou1LrAItU9TU+EFpRKGXrN/h5RCIJfRV3qixWNhTHnkiS9Pp9HAIrs6gFQjpOA1
	dh4IVf8mCmBhU18SiNQtmBlz6T7LWCus76hl1Hj7Si4c59CMAwUgFZycgScMCxRVPqRyvVkJp94
	9pvpF3HjP8So0tG07xAHLZ2fDTDn7bJWeTLhSxR2PTfc+eFiTPHVjGicDT4L/Jl4461sSAyBbL0
	OXWBI3/uISfOhg0B9s3v6YrAU18OapdSudYUQcPxvrW5dweh4QIgsWZXWvA8lAPnMG6lcd2DhYz
	suZBmmGOaWXuMbYmpRHMSyKNo+iy17NKaRru052/GWeg1UfMl9GU+XoaMvRROiZ3lE81Ccvpcpu
	Am9HC4RPB6L1tYA0U+dA2y15TCPZtd8Gk0+GLT8uWGM7aWdQimcziDgCbTUAN
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr19871557a91.14.1788444458884;
        Thu, 03 Sep 2026 07:07:38 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr19871368a91.14.1788444458210;
        Thu, 03 Sep 2026 07:07:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994fdd7sm6809098c88.10.2026.09.03.07.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:07:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v14 6/6] arm64: dts: qcom: Add device tree for Nord RRD board
Date: Thu,  3 Sep 2026 22:06:17 +0800
Message-ID: <20260903140617.441111-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
References: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfX4EYQaTQ7A/vw
 4FucVUqJ/9YZYOo76FizRbDbw797HkokEGmiaqm3ZhlQXpWaZBnz6HbIetb4Fx0N0yQNBy5aXvX
 7g3yCxhxukFH4Wlr07KLf/+DYCbMEt8/aZB41vOg6R6oEtlBh8IKOyOAKqIgOrDgZY4XTmilMs0
 mbcKv1WqfHGCr/JJzl7/jugxOQTfoVjbI48gjTYF1YhtzJX2NqHF4BWWFkCQxIVf4ccDu0mmjho
 cGLuzdXQSEpCizswqsjx1MVwhStrfQGjY305Nndw4L3CqnhiGx8vQjicyX5hJ19/1Hh3By5MHEm
 wUOjdCi2vYBk97KFEAJ8/2QcNCnXpkrRcNGhk0nzhgGIijeFT91cKs29GhPkWynRVHZpWpBg0kB
 /xjbQ007KDnNrA52rgMsGbdxh1lBOztT2I6mF9DGdWXg5m5N2xlw6Sn6qrEKo/yq5wxHlhG19Nx
 /YAz+XdZCW+hDQoROEw==
X-Proofpoint-ORIG-GUID: _UYrSOpx80Z1n5emhK7qjwV27y10hYtl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfX39px3ueu7l32
 CFjBGUYFOT9c/h7WOfGPKIspQ+G1jCNrC4So/OFxMMe/TBy25U9eMO4hta24gqIjc192peLqRDj
 ehOKzGknrWn6/4Lb5XtbRTE7HuQKkjU=
X-Proofpoint-GUID: _UYrSOpx80Z1n5emhK7qjwV27y10hYtl
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a997f2b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5sLx7e1TBNyWi_Ja1bEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030123

Add initial device tree for the Qualcomm Dragonwing IQ10 RRD (Robotics
Reference Design) board, which is built on Nord Embedded variant. Enable
the debug UART, UFS storage, PMICs, I2C and SPI.

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile     |   1 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 424 ++++++++++++++++++++++++++
 2 files changed, 425 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d05920a0d5eb..38d326644146 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -161,6 +161,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
new file mode 100644
index 000000000000..3673003c8b21
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "nord-embedded.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IQ10 RRD";
+	compatible = "qcom,iq10-rrd", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+};
+
+&apps_rsc {
+	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "A_E0";
+
+		vreg_l4a_1p2: ldo4 {
+			regulator-name = "vreg_l4a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p2: ldo7 {
+			regulator-name = "vreg_l7a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_1p8: ldo8 {
+			regulator-name = "vreg_l8a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s1a_vdd2h_l: smps1 {
+			regulator-name = "vreg_s1a_vdd2h_l";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s3a_1p8: smps3 {
+			regulator-name = "vreg_s3a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s5a_mv: smps5 {
+			regulator-name = "vreg_s5a_mv";
+			regulator-min-microvolt = <1328000>;
+			regulator-max-microvolt = <1370000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s6a_vddq_l: smps6 {
+			regulator-name = "vreg_s6a_vddq_l";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC E - Kai_MV - SID 0x4, Bus E0 */
+	regulators-1 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "E_E0";
+
+		vreg_l1e_0p9: ldo1 {
+			regulator-name = "vreg_l1e_0p9";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e_0p9: ldo2 {
+			regulator-name = "vreg_l2e_0p9";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p8: ldo3 {
+			regulator-name = "vreg_l3e_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC F - Kai_MV - SID 0x5, Bus E0 */
+	regulators-2 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l1f_vdd2l: ldo1 {
+			regulator-name = "vreg_l1f_vdd2l";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_vdd1: ldo3 {
+			regulator-name = "vreg_l3f_vdd1";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7f_lv_sub: smps7 {
+			regulator-name = "vreg_s7f_lv_sub";
+			regulator-min-microvolt = <1036000>;
+			regulator-max-microvolt = <1136000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s8f_vddq_h: smps8 {
+			regulator-name = "vreg_s8f_vddq_h";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC G - Kai_MV - SID 0x6, Bus E0 */
+	regulators-3 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "G_E0";
+
+		vreg_l2g_0p7: ldo2 {
+			regulator-name = "vreg_l2g_0p7";
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5g_vdd2h_h: smps5 {
+			regulator-name = "vreg_s5g_vdd2h_h";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1150000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	/* PMIC H - Kai_MV - SID 0x7, Bus E0 */
+	regulators-4 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h_0p9: ldo1 {
+			regulator-name = "vreg_l1h_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_1p2: ldo2 {
+			regulator-name = "vreg_l2h_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC I - Kai_MV - SID 0x8, Bus E0 */
+	regulators-5 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		vreg_l1i_0p9: ldo1 {
+			regulator-name = "vreg_l1i_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_2p5: ldo3 {
+			regulator-name = "vreg_l3i_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC K - Kai_MV - SID 0xA, Bus E0 */
+	regulators-6 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "K_E0";
+
+		vreg_l1k_vdd2l: ldo1 {
+			regulator-name = "vreg_l1k_vdd2l";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k_0p9: ldo2 {
+			regulator-name = "vreg_l2k_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k_vdd1: ldo3 {
+			regulator-name = "vreg_l3k_vdd1";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC L - Kai_MV - SID 0xB, Bus E0 */
+	regulators-7 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "L_E0";
+
+		vreg_l3l_1p8: ldo3 {
+			regulator-name = "vreg_l3l_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c7 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	rtc@32 {
+		compatible = "epson,rx8900";
+		reg = <0x32>;
+	};
+};
+
+&qupv3_0 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_1 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_2 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&spi16 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l3i_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1i_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
-- 
2.43.0

