Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B9D3F4138
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743951; cv=none; b=As14GdVDYRIPlA48AhZh398eb6jDZEOIy0DJnttKk5tX6ed7umVQIvZRQh95DKJIlc74JpRelWP5Q4FEFv15w6AbjUlrohRl1dUSeyLDmd6pZf6/tmaf595WMHUce6JKODW1mJyd/uoKluvvNNgaqWABMT+n2BS9HaTiINsVPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743951; c=relaxed/simple;
	bh=6fZMUqee2aB+Vo0b0fpaMbB3v1+SLirfRFRS3G5lKL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KmdyOdRbYDZtUnkydAdt+5Z9UrzGugDdZldi+1C7ULtboM6qqBHyIIqX5x/u5M0iYnliz7h01v1XikwQa9I0nThK0Y/qrbfnzQIKVv7neeF3Dkn4ecotxiCeFUaLuqA4b+jIbltjEEThJ7khLO8Ht2seVPBqJwWDLWQQ1GjPn+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+LpHC6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgOeCkLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+LpHC6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgOeCkLg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH3M5518240
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aT5qAljuV0+
	+vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=; b=k+LpHC6gezEQ+W1F7sHPLMI+S57
	fFyCl/hLL0vcjw8XdrdIAjLegHdN/0t6iWndSzoETpIsEsLnkTsYZrvnMF5Q08sw
	9Xnwnn3ECowMWAAoVG2DkO3E4Biq1efOTI1/JnFylUjGpFh9ZW5NUDDFDbwbKyfM
	Mekl4+2FkT2cv1dcxKoM4RL6516bowTXjEmUZjQHegVa9uT0SwfEchxhP5nRqCFf
	s3cfWpmU6rk6BCaftkvj28rY7swdRhHflVAjhks+Cx4l7WauNNaWeJBWrVPU50sA
	aqAbQTTugu1BCZP+jENHRhzE0s2/Uk6rCRoAOGiYV0mAULFw+pMf+ezF2Aw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0a3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:32:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1656395a91.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743948; x=1788348748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aT5qAljuV0++vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=;
        b=FgOeCkLgA9mhfyAXJ155WzR2jyeOvI5Ci926qhlHgTI2GoB7N06Yq66E+vswe8Nvhf
         uCJou4hqJvMYrUl1cvwo1piRPhuhuDF1pHrSs2Bhrk8yApblAMDNSBU69pTXxl1h7DAe
         Gk8W66C8W8aMPgY8iYY+XYZFb/ymM7LjnCli31/2YqrL5kCEc+KglgIvGmJfMnVROZyL
         oFzoNuhd4xl/VbCpVWec3SSderROjV/w7Jh4hH1x1ZNLFKueIfia1t/+bkN8rI1diUpk
         ae546nU8MNruiV9WuEFVcddw8jLBayD2mYTvYHbq49DFbyc0I7vtovfXXsjbxH+E61HK
         6gHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743948; x=1788348748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aT5qAljuV0++vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=;
        b=gAB4NAuKGYUhmOCOIeJLRoU/K8ldmCrLhin/34JPlSnnpWKmTJcl1BN/jryha1umHn
         kMQkr/f5vY2+aMGsHZVZH/MWYEFvUum/dK2h/LNKBRGM2aBqHXqXcUtCw3YwsogsEHwn
         mlcHbhWHeKa9IywO9fGEnWcYzXjqhjHtZcRN48CdCW6cYZTZjdGXQJHT1qcALJCsDRnV
         EAGKB0EauftjHImz6mOQEySGpVLWF7KKxKdtacDwgMLhcSAOqyNENX8gf9uVGvvXHN4u
         WPMIITeBAip0YxfiqSaf3f0jZvDIP0NgwZ+pi52XQ7MgwIZknhBIaDpECJ6+NiqkJZoQ
         rfNg==
X-Forwarded-Encrypted: i=1; AHgh+RpBUNzTs/XIQ7I7Agvd6CHZBTgs1cVaGIwWg7bGUtq1amXENcE+3qT+Zhjx8x9po4pjMkH/JQ5rRqWf@vger.kernel.org
X-Gm-Message-State: AFuF++nM/DELeFGh+cHUAWuni8Gst2TFraDuDA9Fobykc9aDBwzqvr4Q
	SsAfd23TVjRsX6uk6vSKENrZEbA2Z0IRpkF9PNNm8BTgPnBgNCajsO6rKuLiHGkpuecCYjSxLLM
	9dGURrqVO93o4G60CabyaQBnsIYESB/5msqiaoRXiSHMqnqSqgY0mNOFeu427s6Zd
X-Gm-Gg: AR+sD10gwNkTcR0QMegjxTW/dDgR/1aRFrO1pwEwguA4LKWghdFrG44Ika0CgD2AaJr
	Pbjhalcy0rYYIwKn1eqSAYT084ZG3PiQPRdk22nOpnbsuQ48ppg75P6APhMfRnsw+m1DSCjCwfk
	iDiJ+UZz1W62TpVNbXDBFTjds6nxUeFerhu1pVM3GbHm3BTEieqQInqAoKPE+ydy6DMYHvKippz
	yl0Lb4qW377IO1k7qCrdzvtWo3ph4VTZ/8aSetUYeK28Fw8VbSBUjY1g15+cDFzoRJVOIYBgqYx
	Zzgsc2kk4XMsu1tGlepXZay7UG4vVa5+jTWJ4QN6GuxHEx1nUc3dLF+sbkNfgYUyHDdDPNXQHMU
	QJsG6jzVwzENeZPJ0FJQLGPtP2KFz9ffwBrM=
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14541174a91.7.1787743947698;
        Wed, 26 Aug 2026 04:32:27 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14541058a91.7.1787743947177;
        Wed, 26 Aug 2026 04:32:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b3a49bsm7748929a91.6.2026.08.26.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:32:26 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH RESEND v1 2/2] arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
Date: Wed, 26 Aug 2026 17:02:06 +0530
Message-Id: <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MVTA9AsDJ8VUYSnNwfAwElVTyPmRb3_k
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX8PLg0R7gCfI0
 h5AoDfmCwKrt58qB1d3FZXC3Hxkx/kqd5LO0zyLWy+hXDTVzJI4LeqKL/kzkIqBwrZP+mYJ9/kR
 ahEmnNQWHzuUPdZS7vMUnII9vj6mHB0=
X-Proofpoint-GUID: MVTA9AsDJ8VUYSnNwfAwElVTyPmRb3_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX4ThyezoED6iB
 ksXwivVXMi5s6FwvZbxrR+y0418QizQEL8x5lHAxK3ZQbl6VjcI//Ztzbt9IaEeUmSVIRLyRBZw
 u3BObcPQU38E5bnvhbQ+z1Pu1nBRgRwhWrVWzSFMSeR2Tffx8dylRuym5Xb6xAuaQAWJfuTDF8C
 3b5FR3ySd3hAcJRNPdHlbEhGIqJOz5f5/9hEsiIQrFqhgrgTh9UYy8UnySYIKyYkZ5ar38swp/4
 MFRRKUkF7HcZMGY+UU1Zehtv9XMO+/jQpqKM6pT/iDLOc0aTknx0SlRpSD6l2vGZ6YHSGmIqyMb
 h79t6MMcyaW9V0W2aQ2Wp++A3UQAUu9fuJrQnLTo46lYb3ppVUmy15ce+eVRmTRQvUxZcV6BN86
 loN3JsCc/4LtmrqwCsUuIgzxVLgZpeJlCol4lMyJmuw/seBv+3AO2x3wucp95WrTqL2ykdzgQ90
 eqsiv+sEvYx1jpWKGkA==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ececc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=m25OAOzQKwXoSehIqtIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260096

Enable the SDHCI controller for eMMC functionality on the lemans EVK
using a device tree overlay. Configure the corresponding addresse space
and resources for eMMC.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
 3 files changed, 74 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 67b768fa8063..2250e16e9366 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -46,6 +46,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-emmc-dtbs := lemans-evk.dtb lemans-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-emmc.dtb
+
 lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
new file mode 100644
index 000000000000..52739d39a1ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+/ {
+	vmmc_sdc1: regulator-l8c {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-sdc1";
+
+		regulator-min-microvolt = <2960000>;
+		regulator-max-microvolt = <2960000>;
+	};
+
+	vqmmc_sdc1: regulator-s4a {
+		compatible = "regulator-fixed";
+		regulator-name = "vqmmc-sdc1";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc1>;
+	vqmmc-supply = <&vqmmc_sdc1>;
+
+	pinctrl-0 = <&sdc_default>, <&sdc_rclk>;
+	pinctrl-1 = <&sdc_sleep>, <&sdc_rclk_sleep>;
+
+	pinctrl-names = "default", "sleep";
+
+	supports-cqe;
+	non-removable;
+
+	qcom,dll-config = <0x000F64EC>;
+	max-frequency = <50000000>;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&tlmm {
+        sdc_rclk: sdc1-rclk-state {
+                pins = "sdc1_rclk";
+                bias-pull-down;
+        };
+
+        sdc_rclk_sleep: sdc1-rclk-sleep-state {
+                pins = "sdc1_rclk";
+                drive-strength = <2>;
+                bias-bus-hold;
+        };
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..99d21e3d7ab8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4300,7 +4300,9 @@ apss_tpdm2_out: endpoint {
 
 		sdhc: mmc@87c4000 {
 			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x0 0x087c4000 0x0 0x1000>;
+			reg = <0x0 0x87C4000 0x0 0x1000>,
+			      <0x0 0x87C5000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
@@ -4308,9 +4310,11 @@ sdhc: mmc@87c4000 {
 					  "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-				 <&gcc GCC_SDCC1_APPS_CLK>;
+				<&gcc GCC_SDCC1_APPS_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface",
-				      "core";
+				      "core",
+				      "xo";
 
 			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-- 
2.34.1

