Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464AE4E3776
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985912; cv=none; b=pIex4mmeawmfK2hApAsrab17uMzuKPuM2w7Uj1hrvoSmtHEQg8BzZPnj85Pl+BHta6tBDGp/RLIlPoffyhKTFlfARBUmVRc4dx3uVSlN0j47NQgJZ44hDgTcCEbOnn8aow3eLI7CcRvio/QeuhSKwp7o9AXYbtEO8RXf8SloPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985912; c=relaxed/simple;
	bh=CyJKamB558EN+4VM+bOlyULyCfzVWe4aNjOJYGteZtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgCARvBZ2iBhn9G98zN905gewdjfpBdmmFZV9SlNnTozvSxltcnPK2baAicYjEG6mAWWuBcyPAl8YmVi+qyYydrRr9/96NOdSdbX6Bpz+WesRMYKCZgAjQJVeeOUVU9cDiRxua9yQnqSkH1OJ2ilOjNNb3EQ82UAzso8JfPSIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5OXtGkc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6g2xbeD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5OXtGkc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6g2xbeD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nXB74139672
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FECmNJCRt1DheqIEn29c8riI+k7ZRW03OOEFpW2dpNQ=; b=U5OXtGkcVGNLo89c
	bqh4Mx30G5nlbCp0f/2sRE8A33UU3KLZf7eXbF2gBe2HzqmzZll7PRRexDEFsy53
	6f+MsD9u9vMXhjlJY5Ec5vWbFWcak3NLGKIPs+tm/txV/0eDEz+jiv8qK6k1rlbd
	K7yusvnK3umSg/J03TxG208erDW3y+f44o4knPrPnARZchUFGHi3kXjzeOcWQsUb
	pmWaS1lH882PuQIcXFw4EpNMv1k1qOS4gkyEFBsWe5uabMS0K/UGTexQUmNz+/E9
	XpdX/lnCOEiZA13xid0aiHqQRqlDOEWobPz2J74GfEwjj8N/UwEQBDHNdP8dZnjH
	AF2avw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr80dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:51:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478a1ec69fso2238530b3a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985910; x=1783590710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FECmNJCRt1DheqIEn29c8riI+k7ZRW03OOEFpW2dpNQ=;
        b=f6g2xbeDoiemPo2lKPuDAOKzuDsiIKQrbU5045MnZyvOm32VEnnFPcQVp/qXnp/T+j
         91+zdFMeBDkPD6qh3+gnach6ibwJlHL1J5WWrJj8V3Malbkf74+NrXvr+ar9XTeVmFdD
         rnktmFUp5yjI3jIeVJ6aQ1fDvef/FC8n+C6HtJ/mCDK9Raz6ph+u1qqonf2CElPmKutO
         Rm0rQuw0mpDiZ+79WvBvDL96SSwGQgeqbfxpv+YRD/5q7KkNrhv5Bhj/iveLV1HzVxZT
         VUZM9giXfpG1YmHlxrw4W2RSr5B01JCNe989AjYdUNLkXdXvNBVu96TzmHR6hDYtsxkt
         ghIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985910; x=1783590710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FECmNJCRt1DheqIEn29c8riI+k7ZRW03OOEFpW2dpNQ=;
        b=Ubmt6/QFo4zMmVPvfmpaQIsgegQQgg+kbOXvOWnjueAeOcc2jux6clFW0eY1gygfEe
         CgMXVJJlfq0ZhI+R4SIT7kPQ3SKuA6b/LLqICkos/c/FBkJlQlU8qW/NiRQC8b5jQfCT
         nWIsCRMq8CJHkm6dvb8/oEoPWDtzd8Tyw4I6kBXXTI/a43HeZkKPyH2DMukO0zn5+vBN
         wjo3IhcXcCFZIOJHiL7BKnqFZ4D+iePO88wNFnO8JQ5CRxJqt2yuAW9ulDDXRZkmTkDK
         jkwdWMxl+tnq72F6xNtIyGx5RSewvdUf/ECcGwdnB2mimEOxkoBZVQUVXzU7sj4lXrUQ
         QHig==
X-Forwarded-Encrypted: i=1; AHgh+RoBTf3C7THV8hA1l5jnd+hH7S22sgr9CPVVV/4ubqygP6ttFeyCCrCqUOTWvgYeEsLxMYkdayTzwAFy@vger.kernel.org
X-Gm-Message-State: AOJu0YyjisHf86/7PK3AnMyCUu7YJ/gStcPMVK7pIe5lLYrx0dgHSRsa
	yEFwGrZ0LMbKL8YgHqLHEtzgqalwXkkQx43eCxk0JQKJrAPLwx5laSjkJn4ANmXLgbcWccUs8Ya
	zriGdj0QMspxqa8hU6zJWxdfRZjgxvyDqy4Z9gCHI/Fw7Dad9V8OEYTQ8J6Hpv0I6
X-Gm-Gg: AfdE7cn5aYCMUJ3p73Jz1LTM9TLv98yJpC8jEml8qioEn7yJcUJibh5NdQMfDrnHhdo
	IX5fSM2yCa/+PmCMvhyxESQf+FX9nYMjkMR3RGgXfdGHxe9uWS+u/O4n7xoys6c3JcIji8tovqn
	+13bGK6XlqBt3vXagdSwVwdoqZ2ZHDbQE38Rzc4T7EznvwHPZTNDMbXd0HaIYT9p5SeMSKrDy36
	xPJlDoKIhJQj587FqcIOEunsTe0qiuuEB8eG20oMC7BFpOnjvZBt8XeQmvscgtQd0pDflGWYtKV
	yHZsko699UW/mg2vtlCSfta8MzCt770EhtkgFitzsRPu9jsudwYelC0aW8Co2POyMRccUkClejA
	Mo3I77bWuh1hYtBfIN9ENpJDUQQ==
X-Received: by 2002:a05:6a00:e8a:b0:842:5ea5:5fdd with SMTP id d2e1a72fcca58-847c0854e2emr5136371b3a.40.1782985909433;
        Thu, 02 Jul 2026 02:51:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:e8a:b0:842:5ea5:5fdd with SMTP id d2e1a72fcca58-847c0854e2emr5136337b3a.40.1782985908956;
        Thu, 02 Jul 2026 02:51:48 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:48 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:52 +0530
Subject: [PATCH v5 10/11] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-10-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=5287;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=CyJKamB558EN+4VM+bOlyULyCfzVWe4aNjOJYGteZtk=;
 b=U9PotUnqaj9hqeUNC2+yfRb0b0mVqhgYiMSkEzdxBlm5MYZ9HQtJi3QN5cq6/qmurMNbl4rrh
 F+K6IRIRM42CuYEmj2GVNjtd4Pu8QppSfHnUpE7n91o798xjfIrub3V
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: RtCpqw979QoZmPJGA0BBFEuzeyhoOIXd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX1AR/8VZAWcML
 NKkaKDh1kSp3BHFeoUAnZVfSZC5B740pgowcMXK6C6gvh/LdTJrA5k7KxdP3DGm3Y0YWBFJNn++
 kJzZtDr2a+KNBhsaD+19AADoHhkR1Hg=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a4634b6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MqoitpKFJgFuN5IqptcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: RtCpqw979QoZmPJGA0BBFEuzeyhoOIXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX5KKEEKp3oFUc
 HdNmnwe09FncFlW7H4ecSBCkx8JsnI7x64iHGjqLqNMz5lBYqNW6oPkTzBWA2QYwBg42WypJ4Bf
 SmXZLKrqhu7tS8oAbl9DK/kicNG7/qQpsnopJEnPLA57kmEM8tts7Wf0M4Hq8/lZVzqmBrl4v1I
 qQwuc1xUFmfOtYxfaPtYmSo/TfNh5ScMO4Tx6uvH7d69ljFMjLNUroHOtbJs5Npi6R5dNrSiMqr
 9kT2haZsDh0t1v1bxq9+EI20FJmgIs2zQaweO88QawLu6u+Xry7azzwKA8jx6JdvszO6pD0wWHz
 qEf5z7PJ+2EfqQWo+2nv7VZdtA43UhIhBDp3JNZ/L5bN+mpOPlr3kArdYYi8CAjaj1JjxaVCS0/
 67RVJzfeWkS9Ce7aSYhHuL+5Qa+YXUAtuSMHyRQRB1RXq/LD3Fp8tL439kNmdB7KHizXlKwJGMX
 k6TYGhCp6KB/Gddq37A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101

Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
EVK boards using the WCN3988 combo chip.

For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
board-specific regulator supplies across CQM, CQS and IQS Shikra
EVK boards.

For WiFi, enable per-board with the appropriate PMIC supply
connections and calibration variant selection.

Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 +++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 +++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 61 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 26 ++++++++++++
 4 files changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..c9409ab0a3f1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -16,11 +16,19 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	wcn3988-pmu {
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +65,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..58fed6cc5925 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -16,11 +16,19 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	wcn3988-pmu {
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +65,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index d0c48bad704c..4b7be09eb5a5 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,13 +3,74 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+/ {
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 
 	status = "okay";
 };
 
+&tlmm {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio88";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
 
+&uart8 {
+	bluetooth {
+		compatible = "qcom,wcn3988-bt";
+		max-speed = <3200000>;
+
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&wifi {
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "shikra";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..864c0d2636e6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -16,11 +16,27 @@ / {
 	aliases {
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
+		serial1 = &uart8;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wcn3988-pmu {
+		vddio-supply = <&pm8150_s4>;
+		vddxo-supply = <&pm8150_l12>;
+		vddrf-supply = <&pm8150_l8>;
+		vddch0-supply = <&vreg_wcn_3p3>;
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +73,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&uart8 {
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
+
+	status = "okay";
+};

-- 
2.34.1

