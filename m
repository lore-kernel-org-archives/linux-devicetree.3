Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100739;
	b=nUWPN8aNe5xndxq9WQRGRbdRZWGBybpTVD4S5MH4B6+Vi0izBairEIZ+U2430pvO7RNv
	 KiCh5robp9iUTLEiImGY5784uJW1RjOlRqHHz9PqDcVotBvlWNUVw6XWwiyefUCgf2VIj
	 KovnBfEcp2Bk+rI8w1VSm0jSda8sa2ixbU1cfSm30Px2y2z8eshqBUlvfHU1HPXUKBz/l
	 jFoDJ/XXcPf8G1QB0gTO1dhwgH9Tdwehp5Arm+mPqHNJh28DsvumtxmYZm8R/o7QdfSI5
	 WH+L11XzhgeBK/7hyhQk39vQlSP9aLYWBf9cgxKyIiyk9ipMw0CEFweRenzhmjDtuLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oMONoXfaSSQfMUnHoFC6kxsPf6RvJpcNVKypalH/Ysk=;
	b=rZswo8LNnz2pD9E5ZJnY0LX5yrFitbW1B96yaDAIn65UvLltiJ7704fmw8XJmVgktJOG
	 fMlBKqwTEjw8z7CLB0e4j0lJVecPmhr6F8ltsUfd3lp9u4wVQPNNFrxEi2HJTmkUnLpiw
	 MmFTmCTmde35ltMHBQudwLtg1RYUJKGWmBoAz9Kdge2of5uJAt6QtqEe/oOZ5iBVz86gq
	 55zgtI85OA1E7QJEpMlXusXot9R97fOEJEbHxgP8v3wZrruxCky0xTODE8r8XJJlfbDvs
	 VRuShSQ2bF3i02AhmvUvK0ig4s+pjTAIWr4FbDMMcVvTmuQRaxpWj5c0KAK6Och6a0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iomVvhQg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJ86Ntib;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFD606A333
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAFD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iomVvhQg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJ86Ntib
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeQad3013052
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMONoXfaSSQfMUnHoFC6kxsPf6RvJpcNVKypalH/Ysk=; b=iomVvhQgT8kt/dMU
	sdhsRBwwb7dgwri6KAKISsyebCjyTSzVQtdxCXvyk+6ZD3btwNa7IWCFB+59ptvg
	uOtF7kMQC3U7IaQ60y4oVk11wA+xwalsn/FBBAg0BLeI/3EhWfDo2PaU6fTn+/jx
	9QafIlycX4YsOQgcZ4rnZJucCy6J7IggEh/K6DZ0Bsmw1lBSNopYhXDPB/S8R+nK
	55V3+ToEnqyki2jaqmk1PLyTO+iZ8cDlfXc5Ilvu5c2trB00s5IS2xeDQIDdhXpg
	k6d0S2oCsifQq2IHGv8PYcTzr5odONcoUKcKYyKIB2mZz2QC0a6sJs3mhbd3pQpM
	2Li6yw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dasfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0589ff620so2827167b3a.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100737; x=1793705537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMONoXfaSSQfMUnHoFC6kxsPf6RvJpcNVKypalH/Ysk=;
        b=QJ86NtibTXiZuaIn/N4jP4pa9rz6zcDrN1JXUkVm9p72bPhrDMGoAgFEiCC+5mKzf9
         2tpOuiZHtDDW/ntZ2FgcoMUhnTLVhjZ7Sjj77HFyP4KyP40yuawrzJRztbJFZjc7Ah65
         BJJrzZTzPn+rUbpdZgvT8upvZjMbKhDqfcoSpxIZn25Dtg/wAVd74xRIxzZ8h3NlD+tF
         oU4yn1v9EOlIK6jKI6wrVlS5dAIWIJHJxp/DXo24O7PbzFwdq6G57YoSmk7mpHZ1Yqj8
         FAaNEM75s6vA2pyfS2/B7W+NwNLo4yFohisezxKGRUAoFkApyjxgbN4klcDbTxoziYte
         ZkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100737; x=1793705537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMONoXfaSSQfMUnHoFC6kxsPf6RvJpcNVKypalH/Ysk=;
        b=ep0wJukMn9KnG/LicV6V8ou/xxjtU0GsN6t7NdsXTX1uBulZp5P5wbK4xqadlTjsB3
         lQawirtB/MClg9muaTiIcXb8wvbTU2vW7vwuD0VNTEjLMFA8tiHxcosk3xljycdwjxwO
         VVMO+yWf1AcnwjjdEZDq2YnQocpavrC4jiZNXLoNHZk3kNqcMD2ARHzfmTrflqz+aWIy
         iERX3/GV57FWMxJzkcg0f9ywngBts6L6tvtm5wJjKjh5sOUQ200qPJan7qXajZg57Q3M
         cVVGwyIZkwC8Y9KzTThTPPIyMW/G4gcHDllYL+U/0VpsECdSKQtlhikKO/wQED5UNjIw
         8LIA==
X-Forwarded-Encrypted: i=1; AKwUvByJ2t4w4X252fcNSH++V0r6z1pPVhlYcEBLqGjbGrcs0tQxM8LiAy4nU9EifOiOFwY5+IDQyqcCcapX@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6jS6X4Adnys6XLlGPhCfoo0Eii6Z7sLrrbO4Cx/5mPje98fh2
	azrtmKSKQ//9xHOSL4+HI1c193pF5wOZZLPj6cUZVa2pNk/foD9SpQDPPbeimXrQrqdRuEOmbPF
	zD5xuw3MqW6fv4Pew5BReHFQgKIH2cKmjLjKnZvne/BoBj4EL40gUkMxCnzKx24SI
X-Gm-Gg: AYBFou10NMw3Vpivr3CNjXFGjYeAqUdsYTqM+DlTS7FSaL034RexoQnXN2BsofVL7kp
	ABVxVzL8KzkmKI+su2Sl4+icnMsmLXyOS71ujhFlQj+SaZCfOYyFfDXpYj5aTVaRIPsfIAs1ZN5
	mKGXYCacI2Cwqj9tq6yMFpvVvgkwDjpOa159wjdjieMoLrRqlc3PXtH+MBXkCNMALhULU1qXTU2
	WvwXxCXaeq5p4e+Rxr41DW3aviB9BiItnOYjKTi2GXBu5uXDygfJoNvZwP//wcRS6IsAcKRBA4M
	LtmQUKe0tQ1SclvIg6lt6EiG+ZaeihR2hHqEjtQcfzxwNefasxYDM27SGHawmqccqW86njfYnxp
	7k4qWQQG/74Nfv6Z4JUnl
X-Received: by 2002:a05:6a00:1898:b0:8a0:6905:248 with SMTP id d2e1a72fcca58-8a364f5a322mr8507390b3a.3.1793100737160;
        Tue, 27 Oct 2026 04:32:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1898:b0:8a0:6905:248 with SMTP id d2e1a72fcca58-8a364f5a322mr8507370b3a.3.1793100736643;
        Tue, 27 Oct 2026 04:32:16 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm2143836b3a.51.2026.10.27.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:16 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:01:57 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: talos: Add Talos Lyra EVK board
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-talos-lyra-evk-v2-v3-3-658fd5a7ec99@oss.qualcomm.com>
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
In-Reply-To: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX4wc6su92iMct
 1XD90uWMysPkn+OWf7ikhiDYgft/WLKqcvlSwGh4qB+a8DpUTFOPkG8sWnJMaMfA7rEWvZ9waXx
 pEkEf0n6dEP92p5UwRTTUHUoz7+O6io=
X-Proofpoint-GUID: azZfyXUQ_M_QFindynEOWtG4Jp5YCzui
X-Proofpoint-ORIG-GUID: azZfyXUQ_M_QFindynEOWtG4Jp5YCzui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX+gQPnUHHCh4z
 zBAfdZa0QJmY+S/CHmCtPZn+swjJeVR++2yzknYRgvWpgNKCYpt11hdNRF1nT8D1z4sIYu/r0Au
 zFDmaJgmNac8DcFkcNYzmhsDFqrkKn3MXfxb7VPX0RIVpPUAjl3udDpztSoteG4Y/u9ow+1cCAA
 /GZ54Jy74kzYOvzHImUpb4XcY9mlmCIog+E7dq6yD8uEtjrN76l7Uuc8Mr0cWdCchCplk06LBN8
 h7kprZbgJ5LHtfLJ6J3wVYRQvBBhApddgxg2A4uV+O81CoM30n96z5jWUXVWUWzca/FjwsR90r9
 /vbRgeLtj1ZNHuF2RgKEcWyyWfRuhIE4cMBSwKk51QH+4RSNeLCqnCrIBPsAywPAKXQgHqiOOCY
 oXmifK+NOqzE2RzDiSBAhPagM2/9N4ZXuvr+xUyjsMZm9s9AhNT/EJYSl9LQQTWQJ3pX9V8pY+L
 znrHDHJfOXoFqOqBvrA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08bc1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=X4tYYTE4NjiRS8MdoAwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the device tree for the Talos Lyra EVK platform which combines
the Talos Lyra EVK SoM and Lyra carrier board.

This device tree adds board-specific peripheral configuration on top
of the SoM, including:

- Native DisplayPort output
- GPIO expanders on i2c5
- SPI-attached TPM (ST33)
- USB host and peripheral controllers
- Power and reset keys

Also adds a talos-lyra-evk-el2 composite DTB combining
talos-lyra-evk.dtb with the talos-el2 overlay for hypervisor-enabled
configurations.

Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   5 ++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 115 ++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..243231692866 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -471,6 +471,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
+
+talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
new file mode 100644
index 000000000000..d4468e609911
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-lyra-evk-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS615 Talos Lyra EVK";
+	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&spi6 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio104";
+		function = "dp_hot";
+		bias-disable;
+	};
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};

-- 
2.43.0

