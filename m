Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23173DCD8F
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487258; cv=none; b=K9CqTCTwqGnq1AwEt0z5RxijpdonQI6ed1R6IObLu0p21Q2WlK8/EhGLiyiz4qEU2kmWu5glKWY0J6gpVyvK2gXfDLvs/JZpFpzhhD4xiP9fO/Pt8Ld+gny9QfSxnnl1GyOI/M8o8eZcP8wuqZr1G1ojz+RSbIunBhDuamQUWKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487258; c=relaxed/simple;
	bh=BeRWBwNsZ0erjwYvIcybUeLPptfHeh2qDU8hSSAUtVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XbA5fOQ52ZRUotoGWoeCkW6tIS0FU2KzRAwzBFSoFGext6aIIRnJzz7I8XR4x7SFIywKk/Gf0Wl9DP2oDETnlmBlHZH9/DQTsz8hN3bLViYWkeLF8QnymAitp92ijLH3t9XD6nz3XLqKGkATryCxrsWhC1zgITeRM7xN43iXVak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+ZspRNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMij2F90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+ZspRNC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMij2F90"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8bZZM3389828
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0U2nCxgbMct
	nKi5mp0+yIBlpib88JoU1QRmkuOouBak=; b=c+ZspRNCR52S07M0kzSBQHxFHzi
	ibbXIhhOVVu16iKrD//CItMCYKgsmoJYU5kb8s7FwwXhGemvz31HeTJuUevuDIEL
	EnCd6mVBUnN2jHRcAabRDQPE3AZtUzWJ1qqkWTzpAMRx7/6qxcfrwT0ha6ZRRA66
	BVNVGB+X1P8uY0IaC+ExUihQ0YppXuJl5gPtBaQcMPP1Cxj4MYjUi0mBftCMTpQF
	riXagSykBazzDKeV2SST2s2W7V6ptbWK8mWNG29UhSXLzW46M4/le4gUfKJgsu6R
	ts7mdQs0eyKDkHbVWVAl3GKq/UzQjQY7X9JeqTKoWLHE2MYy+6uvegMCPnQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc2g0cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:40:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so676466b3a.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487254; x=1786092054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0U2nCxgbMctnKi5mp0+yIBlpib88JoU1QRmkuOouBak=;
        b=CMij2F90+8JS1Cm5cP1flBaf9bwA7JpjjjHUyi8o3CGgDXEMqfX1DD/cjXC2o+Tbv+
         bFjxcF2bPS2mISXIzr/3BhZ3bRuw0xw8T7l3PH4A8ViKxBlo3VVSTgtqoGKD4yN6oXyK
         M00dTFpjpfrSGxj3tV3+gltctH7JLZNGuZ2/FNqbs9sHeBiK0hhJplLu5XDGV1mY4c5g
         4OKf1A81GEgtP/cGjtVqJXMoScVCEZWsl5L21B6rueGWhjLBq7fJrKZIsxNjUbbzACEq
         sdtqxyx7tRsO7vorlQRMJF3Zi1OOh5u827c9MW8DKTrQof3imN3ENYWkLgW5RPteYKIU
         cEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487254; x=1786092054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0U2nCxgbMctnKi5mp0+yIBlpib88JoU1QRmkuOouBak=;
        b=JQavJAqIp8JS04vWGDUKlOVfszgrdDBxvjf9WUwTDY3LEHSipZi4ndlqfVTZTx/EFX
         5qOueReCP6PxeI5bri+Gw7FJOFtjlDyRja7eDW2G+wOQEfXHpZPp5Y3tuRu4M/40w7mP
         LHEfCE/y+HNJtA1Qb8I13bgB2HIz0i07tHCVSwgrkv34QvELkvl2HlOkRZtR3S38JOv8
         0tBq8c/wgs3JZd/wtb7o7O16x5WeCQ/cbiNIHnMrtEizAPJLjqRWQ9iNjRsfvtFbeKPj
         mDboLO2gb9sMd7hJmc91BcSaui1YWa2jF6v94j5xCzroOhWAa5WT12Lstg0ybOWterUL
         IU8w==
X-Forwarded-Encrypted: i=1; AHgh+Rpj1TcyMw8Ce/NsHU9eU3bwdYs7XY9kbwX7XQboIm40iN2QzaYD3+c8fr9fnRdqkoCxsiJOjYtfScg3@vger.kernel.org
X-Gm-Message-State: AOJu0YzcCXp5bMbUJcMqlzSB6uoT7nVdJASR3hgtTjPnhF+anwv36k1h
	sy+lNnbitNESGLBhcBWSQh11lMk3lG7O1oOT2tv4Ah160KsjSDxYdo/OCc/fY2XSLEOUJ09WgoB
	3FZwpakxjfTMJ4tWZIm0TWWhFuagdrwO4FPxn95L8mPyyPdB8V5wgBwax4HcdWbG6
X-Gm-Gg: AR+sD13dBXVBsj8r582R3YvU2dTQ+h1jWpFLVvY6PDZkDkHc59AQYdqB6mrYOHb5Vev
	IFHJ/zcKvHnsuTH6H7fdZbGdL5ued1rS4ZMEHK/F6MTJZV7W3f/HO9jQU2uVTFMvi65mdRtZYJm
	sb2SYBeRRFoWuxU/YTagU9WJ96lPKlFQhJEfHN531+4zOzPlY87enf6/5hnjADlKvsM2BrS3Cre
	z20UpWLrt+ITmbPVpWpNrvvjdQZ4Tqpvv6AqVGhfwncnLtk/ddQmCwOr+V7MaQ68N/Z2xN3uvFU
	7FOPqDTSvoE+bp9YJSzV/wRiCfSfS9QV1Gvga4RMlJq2ioY2TEQqPr3tjcWpUqVIJXlRCBoA+17
	7+hVQ07vZpzk6UwIrSfZvk6WGxm4oTg==
X-Received: by 2002:a05:6a00:27aa:b0:84c:2d22:7307 with SMTP id d2e1a72fcca58-84ed7b7a703mr881030b3a.13.1785487254006;
        Fri, 31 Jul 2026 01:40:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:27aa:b0:84c:2d22:7307 with SMTP id d2e1a72fcca58-84ed7b7a703mr880998b3a.13.1785487253595;
        Fri, 31 Jul 2026 01:40:53 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm147552b3a.40.2026.07.31.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:40:53 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WSA8845 and DMIC
Date: Fri, 31 Jul 2026 14:10:32 +0530
Message-Id: <20260731084032.3106477-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
References: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zdst8MVA c=1 sm=1 tr=0 ts=6a6c5f96 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RpnahtGIwcQnnQdoyywA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: MMSXPNzWXuuhHsHkHZ4nbMHuWc54byK6
X-Proofpoint-GUID: MMSXPNzWXuuhHsHkHZ4nbMHuWc54byK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MiBTYWx0ZWRfX72lSnnHe7lQJ
 3icpR1aWGZYTNQOQaxG4cGr+DjvBuc+suGJ0BZnjudqTPLeSJP+uA2iIj52gZ7LRfuaNrcWobIU
 0nsvnQRb22ps3oGpYXlrl1Ry2EK2qomKrSppYyq6m2nFl6GHxJ5RYX+5IPCl/GmTvYtHJpWl0rA
 B/ZqO+ND0EP9RXSWXl8Wban1u/nPXySWTww+OZ23w4RXTowXQdT4dgGayAK5N/Luw5CEf6jxQcY
 ypuJAbIEzO6UjXNXlmOEJRlDYkgjx5DoFxB+lTgvk/FnwwnTgOyRjGG+TOqr6/fz/78Aq3jf863
 cxD1wKwP+P5kmPXpsgz64fQAXhzYzzKPeBhRrLdUmBNX2jiaYOw9IB9vCGZhKdId9MuzrPchSP6
 3WFd9ULJSYdDuLAz8zp+Jh9yMj/koeFfOT2Kei76Xqb9xD9us63TMJUWtA+aMXkrg7SKNZddIMz
 ccCrHevRbvDHaH8NxJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MiBTYWx0ZWRfXwU0eVhP3Wpkt
 2qPK33HL7TpHW+2E4XYUmlFdYZhwCMKCBwc2mf51URl6DDWgevUs2eEfjFf/98e0bWk9RwQWV+b
 cyQyK49rkIpjho6hUe1HwMIfH8vcQe4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310062

Enable the sound card on the Eliza CQS EVK platform, including the
WSA8845 external speaker path and DMIC microphone capture via VA macro.

Enable the required LPASS WSA macro, VA macro and SoundWire controller
along with the necessary pinctrl configurations for DMIC and WSA
SoundWire interfaces.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 141 +++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 43d428a4ed2d..5e4175291f05 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,10 +5,151 @@
 
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
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
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
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
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
+		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
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
+&tlmm {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
-- 
2.34.1

