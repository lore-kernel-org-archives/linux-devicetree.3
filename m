Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E333E36A
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348643; cv=none; b=WP3VRD1mspQWqRxKRONHXLiUC5l3BKpPHy3rMv+bOS7vCaxl3EN9AQpVORhnZOg87uh9TuxqWFff1dvBDfPASgjoyfaQ9bQysJNxOEHZWrkd83Sm2Umzy24vqVd+jYV3V1kyjj7/Z5Ra9/tpJNvC6yC+2Ep5ukQRvkf3oVuLwFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348643; c=relaxed/simple;
	bh=AXNNMUqpUBkT37jqrWXRRraxt0+yVQz0nuc5i48FDy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S16f+H0EDkkfOl2hd+jSjZmhQDdZWiYRDbWkL+SAFozXbpmDvPQc1ysQq6xzUkbHkoZwFN2l6oG2xYYDbtvDQGfg+T+aAiwswUyY5gYZQUrEz7rs/ebrj4xVtkmc+8RZQrp+W0wY3kPJnHOzISdPoglVcueGDybrV1BPvv21F+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YA/bPEqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APSC8ApT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YA/bPEqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APSC8ApT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RNl2sN3760591
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=; b=YA/bPEqTPpaqy6z+
	L/onEJNoGCRkZAY2mJtVMUPZScgQGh7S9TriNAYK5BnzSn6Lv67oc1gJcVAWAbO5
	njI0X09HDSZ8uMSrVYUgV10xsF9kJAoQjntHGi5xKeVd9Zb9UbIOP/q4PD91pxOr
	I8IkPnUt0PFCS93kc6IY8M5JxCXjkdnndMFSDXJvt11ngNEsjsq8F3B2yJNOo6dA
	/QbzGH1ux/XkSS9SrcZOsqhZAHrM0gAokerNkQm2eesRkStzusC14BmH8G9YCb/F
	eCCJIXnA7aUl3q02PgvcIKZhO71QJo+uBLGPnU6KPnvBlOcIdb0+quynKtbJmpX7
	C3kvJA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacdtgjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:57:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so11856576a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348640; x=1777953440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=;
        b=APSC8ApT/WxGYaM41KJj+2rNHLys6aH13mwL2EugL5IpeloKsSk9yaB4c+Eo2Q5AQL
         K7TnIcNxdkLcF4kUbg7gWSm6Wu96vRIdQokVG715OubdYdwzDRg339vVpNK8DKipkor5
         SoGHGvbeZLnRUi1atcWrRzxYcCSEX1NJp+4fVHlzDywA35hovwkzTElMsTL6ji48EvNU
         EA9HM+HTPObMFbbfhBSD+buvp4o5k6Gu2Ai0+9bJnsRQsR2fC3Kf3oKsXMFqFLxx/b69
         37K3omAbMpNk8Q3SLnqwAk4dJ2og7FrvApBq4ZQWLpaJi7+1jKpLEKsiNKlB8GTyMyAR
         hNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348640; x=1777953440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=;
        b=nS5cef6ooxBHB0hCFycF01snpEDfS06fqP773HmBLDjaJIsa1kn6jQBKu4v7Qqne0N
         JbafCxrYhJXdz0wjR3Uc3WYUPakzeE5Gci83k3itiEwVb51oAJvgSaTQaXYhjtwWV0Wz
         kwxac8kG4vlXyVHA+2t51W/1hEiShzSt7VXZ7mFLbmh/U7lQJRXc+l267HhUVzHucTJt
         DPHf/aqoWYXkO0C3Ki3lwoTyKv4iz9xsFHrvqtf/Dw+7LCeOBsrZzPjsDRW2BJqBhBye
         Wk+eOhy66wMIQ/20qkKPYHb4KjAKQgNQTz0yJJE9UZXKdNKiN+4opn18GXZd6ak/jLl2
         /RrA==
X-Forwarded-Encrypted: i=1; AFNElJ/uRDRImVh/tWK826bOKTM/hlAExA3ai9V+XUTJyXh3opOVwJwzAw/77/utTfIrT83BRV8ag1YwKDwj@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxitAiYzXSrL8ytMmhRBy7oc3P9hMmz1RmdQMjmnPmoV06Xvl
	LDclHuJImvkMlQ7yARozsWUq4uWo71e66DjB8+JNM5eh22sB//NgLnvA69k8hWaRXk8efSCax9J
	aybpCWqGLiHkrc50YB9HJWuRatTo3/42tfv3S4VImZ93yHSYl2WtJ1R0lprq5urOq
X-Gm-Gg: AeBDietZ21f7DBaSFcUYY9RxWW9TTUe+AMztcyasapdCma4nRHjkEgm1LFiyFtxTz1t
	UXKVWl1BGaD510pFw+WhRt7UihXTdxbBit0cbUAArrVuMi3+Pw201g3GfsU5NTj8ZDdR4J2UqsI
	YjeIsGwbahMJEeSk5ptO9AryHEIQHkcMDX7b0C6F8LPhIonjy6XdCaZKFBE0lME3AHLwe00n9sq
	NSfH+uOzAZhU+AmFCnBQ4F7kddAq7qDOBp9WRX4V/Mdbd4NGxJ899NLMkfrjalY65QuGm7xpXmy
	NOeOi4xUs1zujFn1bi3JPr83h33O4vJfjgnpxvWCRyCjrjfFTOzQSQe+0v/yL1EinJKWgQTCtaS
	X+q+VscQelD4H/gg97XFxg/58E9jCwSuN52mq1kVULYDLubMZsEy/l7fM9reSz1z9cQ==
X-Received: by 2002:a17:90b:2fc8:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36491c9acd5mr1465241a91.0.1777348640522;
        Mon, 27 Apr 2026 20:57:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2fc8:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36491c9acd5mr1465203a91.0.1777348640047;
        Mon, 27 Apr 2026 20:57:20 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:57:19 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:18 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-12-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=5015;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=AXNNMUqpUBkT37jqrWXRRraxt0+yVQz0nuc5i48FDy0=;
 b=jCv+PEapELXi7ne+BCnuDA2WWT9hw+wlEpU7KBCcLutA434msVkBuNG4JIiYmwnRaklsyFYiH
 7yEBqBuPVHSDxOIWwnORTxSU3ljylISTZPXCnybuoM0HVCf/yxNAOyb
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX8sh+E/2wgJaD
 Ep57bUoAm7YT7NUP1aKT6A4pJwuqQEZyOau7Q+t8fju/OFF6PSI7Bz74GlCITleTeJSQrBk1zBV
 RUbdy9NmiHjJdLpa2BWfakRubJhM2fOTUNCtudickTW6GJjN0qhuc3KqZENMAXxvkebIIPo9qQP
 JfuKCkyhKxdQoPBP/qFU1wedWTEtGBtSE/ziPnggXaHAs9E5TlQvmBHoah8/6BjgNyrVu7uE+ar
 aBYEVHjA7W4ZN7UFVNSDMRJ/wFKLT7IXNAG5NeoiZyM5Sv/5Wu29nhlxTGKrZRDb0DcJQYnmEeu
 MKtihh+GIy7vJ2MelDJcL3A4VdCtv/X0OzLu0NDSy0oiJ3MQYWXW9qXUtd6IT42mAYI9LIWY9nf
 HOVVKTYq7D7LxBFNaMb7fSF79TurTL7B4dgfYTvmF1iRledPLYcoTWBrPMRsXY0iNa807ejxd66
 emQloq25OBzqzsRl2Dg==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69f03021 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VYrRtalYO0MCCBblpesA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vwhz2dUa1LAovWwaQgmur4J2knYXngZ3
X-Proofpoint-ORIG-GUID: vwhz2dUa1LAovWwaQgmur4J2knYXngZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts |   4 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 118 ++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..cbc9856956ff 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -255,6 +255,10 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pmh0110_f_e0_gpios {
 	misc_3p3_reg_en: misc-3p3-reg-en-state {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..c47443174f97 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/media/qcom,glymur-iris.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0xaa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "iface2",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&apps_smmu 0x1940 0x0>,
+				 <&apps_smmu 0x1943 0x0>,
+				 <&apps_smmu 0x1944 0x0>,
+				 <&apps_smmu 0x19e0 0x0>;
+
+			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core",
+				      "bus2",
+				      "vcodec1_core";
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

