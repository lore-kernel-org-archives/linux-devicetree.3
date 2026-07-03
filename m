Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3B3403E7
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067693; cv=none; b=CW72tIb4MTbhipghEltywM63JuZWQU2iNuMdO1Y1idUFBBcVNi0GikfnG7iUYJyvugCXv1DHXAWXBAB/M7gpqyGOtlS0HTbqILMIY2L+BNSLVJK6YI4msMcPbNobXTd7ZsY8I8tFoBzePqAvqG/W1mbCpbrQy8j5tT6oft3iWok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067693; c=relaxed/simple;
	bh=Emw89YyS7aMC2iiPdIgXR+7AqyMkbd8l52QT0jFD60Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nkom3+xVw85hJ4PeDt84Cn4GctNfADO8oyFXzIBwytpub85YzYkO0NfLApAWeHhsB/hLa9js8mVArGy9n0PYpJ7GV4/kLBLmEVc20wdObieUjPUEhCsCya3wA8KIqpWUszG+j8vjO7GLBuPR2YwOiCNMbZDJN+veEmecsZ59YrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=id9BZsjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSyG3U+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="id9BZsjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSyG3U+r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637Zv943410421
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=14V1rnmhnaJ
	ZRipsOmqxV3ozYp1JadJvjsb1iPS/Wa8=; b=id9BZsjmQP9FVdzB3Z1fckaiOUB
	Qpl4O3c2jdywxHJ+YDpZDoFD0E2oPszl+/Lnfdb6JhM4MlxC1MInWcTtW8imzjP5
	hWGKqbw1TVTv1UZLZRXwJOjRozlOhOyCEQRWCEbFnrBTmHXYItrlRDheA1Fi1xfy
	EZ1hUEI3UpxOuXiCUfTvvSX2ddCN95tzgIbjqoQ+Yh8IZw+9FaxxwHX8kTXy/udW
	V3ATopwwuq2RqIIQ05zVEdr+nbrGdfCmGh2yIjNLjI58/aVmRRMiOLrY6D/i6+jo
	FyoYG4KuW6pwim4EaeNx1rBg5WTLbMiBT64GwsqAX0/ZNYzpg9W1pDBPdGQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u306xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:34:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9a700dc0eso3220055ad.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067690; x=1783672490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14V1rnmhnaJZRipsOmqxV3ozYp1JadJvjsb1iPS/Wa8=;
        b=bSyG3U+rJmhIDaoaaf4sfD3vmFm3+8nxqIap19YXn/YtSRxUJO16obmEu5C/EuzbPQ
         A4mYYrqr52oFTKhce5Dln2byROIjQ9EyXhaR91DakvRWRGnmnUIHFuKKofCiGjFjUR3V
         BXsNH46wUseW50Z1WtIbdMYQLEc13b+JVVnI1ZUxpCzZ6BrLh6zOa3WNtbH354vcMdrp
         XwJVyMco2s7+2/D9SOz/gqSzC/fbhhyxwJp4H1wgCJzXnfeq9FogK57Ji9nQIUvtxQBp
         1h+GynKABCPhpgPNxkCLM/SjNqCCvQo0E36TNPaE6LmKTAFNnu5ctamM16nE/lPJe5Db
         9LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067690; x=1783672490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14V1rnmhnaJZRipsOmqxV3ozYp1JadJvjsb1iPS/Wa8=;
        b=EC/qw4p/FAyNzDqzgV70fpvm6SMHBuELZwpUxFD8d0602bvspWhmNbq+vegPNtZE6n
         voSL1klh4bXGjL1PEbtsa4AxEMnol4k1dsOu1tqmrTX6TS36CCFhy9BQBu4jLQdAk6I6
         XS3ADSgqnaysqnxRYRorQ313p1X57FsRy3cFWNqeLzQRYj995W9d3OfslJtqHTxJOwHW
         o1U0SGtjuNQiT3JsTa48MqMsAT4nzary4Glkz9xABznQpMozKejdQ0JIw4RTnbR1wSn6
         dSARXGlnSxhUxB4uI9VB4IhK6+Bd0/E2dayPjONV9qhvQgfrS4tYS9bFHM2DS5FyJ4ek
         4WRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCEcsdghyV4o3rUTTBvCVDEyA2EBI9PsVB7oc1VYVFd9zviMtP6IKiosGariyv83SFf8wpUiHdqc7r@vger.kernel.org
X-Gm-Message-State: AOJu0YxBxZWJVRierbh8Fq46Gy4tZRvugLeZpGdq+o1XYqjPPxjE6yvk
	fpViKIu/Kv0r90s9tQ3Mu/fqrhZrTuhjwky0miVGRTabIZz+jCn8R5RBZBAO1tm7dQTcIYNQdOU
	4xVxyirhb2Y8IVhcf8tjsYhiNWdNb0mvioDvE+FGAVGLNKCFtGeYu3396NpljwMG+
X-Gm-Gg: AfdE7clpBYn6WOKmLpXMqJFhIhHp0pu6GoHOiNqCc61mT2fyyLoZjTWQX4Pu4yEAJtI
	axsAmv2+nPvnpPTp7eAO8mTJ/LnftfGD03wuLIBu4DAhV3F70PrZTQx7lLnU5FymuLjJA5EnMDt
	VdKF7seU6N01SpPjFshugqWSKS3JEQbMvEibQjjD0SuE7Br63Ood6sNSiaN632FzZYR5RKA9GjF
	awBIIm5OXXo9wH//+OppDSVauCzwP8yBMcSHRp4yCiaOrMr7GLwmaLWy2wpYoWH5eq07DGZ7Z9Q
	8PcxVFHfPZZFqRmPAzE60Tt7k77b8VbbAtDP+G66JWOB2fjwTCV1n3nXGD8/blKlCkZ/RjqVfoW
	XbAEDIJ3uzhuWG8yAS8R6WTV7ksIXpJRS+SKaajcU
X-Received: by 2002:a17:90a:c10e:b0:380:83fc:431b with SMTP id 98e67ed59e1d1-380aa20457dmr10145901a91.27.1783067690464;
        Fri, 03 Jul 2026 01:34:50 -0700 (PDT)
X-Received: by 2002:a17:90a:c10e:b0:380:83fc:431b with SMTP id 98e67ed59e1d1-380aa20457dmr10145871a91.27.1783067689920;
        Fri, 03 Jul 2026 01:34:49 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm18797839eec.2.2026.07.03.01.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:34:49 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WSA8845 and DMIC
Date: Fri,  3 Jul 2026 14:04:21 +0530
Message-Id: <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Kk67epxnBFrx-e5aUZUsED0IliFfTpuH
X-Proofpoint-ORIG-GUID: Kk67epxnBFrx-e5aUZUsED0IliFfTpuH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX8PE+ncnkfQ+V
 t4ZaChJl3Wa2sGKtqM5gTUNai/EmaOaKShaiLJq0sLZTh1Su/yHxzXKFJe+05E0OH/zsszleD4s
 a5bRhvKsGLjFk+9SjVaJOOntB5XtQR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX4UkI+O1NkKl0
 ZaHIGMzi+UPh6guEzfKtQAbM8BfqdyjrooxhBDB/axXfSRIOP9V73rBmDGwWMA/pHPEAd2QML5q
 c+h5xdQkBGmV7gMVNKe8NFH2MKhwj+r4ZQ+RPwMYmyf4UtudkYI7kJGjh8j8RZqBdUZ0Uc4t89v
 FKH+UXCQwl4GoLquLABvH17/meULBOJ3tGtUx4gexI9pBCyrIklw/iMQj9OGXtIt4xkJ//U2E7w
 +L6unOo/J26s/srxvmhoSvuX7AtDxyBYZsqmC6nYbygb4BzPE4hf8FblZpgbekWvvxDs9ccb5VP
 Xl80Nq8vyfNTVB+m6MgEH/mrhi8t5SU4vEiS3ZMWIVinMeFrsLhuqjurAf5nfIvhosaFNnOh71Y
 YQxjJrLqfrFr2TioQHJ3R1rwRp2RZTsV5gTDlHmKbJKddkZMN7huE1q1LSPrhTP/641yqX1Ys0j
 RxtZGUXuNiGoToJUYew==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47742b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RpnahtGIwcQnnQdoyywA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030081

Enable the sound card on the Eliza CQS EVK platform, including the
WSA8845 external speaker path and DMIC microphone capture via VA macro.

Enable the required LPASS WSA macro, VA macro and SoundWire controller
along with the necessary pinctrl configurations for DMIC and WSA
SoundWire interfaces.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 43d428a4ed2d..e06b0b79e950 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,10 +5,166 @@
 
 /dts-v1/;
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vreg_bob>;
+	};
+};
+
+&tlmm {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	status = "okay";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&lpass_wsamacro {
+	status = "okay";
+};
+
+&swr0 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&pm7550_gpios {
+	dmic-eldo-en-hog {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "dmic-eldo-en";
+	};
 };
-- 
2.34.1

