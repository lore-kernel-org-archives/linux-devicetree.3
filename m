Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6224D2EC4
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061577; cv=none; b=ORt9wj4eBqHOJ4kTPTzLBnBsm/0uANC5s7ODIAsg0RXAtu+U41qM+MANGqtXrp/YHH7RrXFr8wJ6WeGTsfvauvx/w2m21nJMWuIvzkkbsIvc/Ksqpv8ocqujNKG3jAD+8D2kXzfmNrBWNBAjv/JxG2kKM6CKAD10xFf4wJeCh64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061577; c=relaxed/simple;
	bh=IFYJFv/BVGKeNkstw3qZT7Nr2PwNdhpO42sK5UPt5u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q3PweHAqLDKboIPAp9JpG8TWwAjYcFBr8qcvedJ9ZiUoaNEikHwTB9G1KtR1JQXowLHlL54VkaOu3jMs+/w3iSjcbOfWfcmZnvnCvw22Cp1j0jzQ3Hm2kmnTZiXi6kWafnMf8aCaWMsgov61d4YW+NQA3v0Aa0fDqHyWORv/mJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUZX+ulH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAZFK2gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUZX+ulH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAZFK2gz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOwj2114137
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=; b=OUZX+ulHRo+3a9SE
	a0OVkHRMKs/wVVuYbWpTV1MxXv/gJzeNOag1y01ZltPz+ht9qR30iLSBH8iezLpz
	Gqy5KkdOgfRMRbTbAjaY1nBQRxZeUqPknardRBpkF8GSlJ91kfMWyq5m8b4muVzk
	Dzuj354/yOF90Na01sSRtlDk30HR5Lp7affnhH0QW72VBJDomNn7KPtx+BKriOkA
	nJQEHlOaGry7TDgHH8G3Y3qs3Mfk7Vs7+fnZMMz9Y9rclS1CoSmDNjSlaK/MBjlB
	+/NXx/4yj9L5iQ8ihM90afkz1xYXzc5PdYxQRd+N3/ZqIfy7qyVUr9zD64kAftVV
	X34EFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyanh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:52:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9501034c4so19414895ad.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061569; x=1792666369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=;
        b=AAZFK2gzpnav4X58RZmePcBreM7LIoSbrlqxziDUkspMkoEvOzw5NtK0/30kbPUpMI
         J7k5ksXwDtx1o88NLFjSoQN03Hsm8PU5LBUTZGsoYOzEh4EQw3EgjEIXbrd7WvvZyH4E
         U1UNAZKW7ArMWM3VaPz1HUrLoDE4Xz+W1FURjMsujnT77GHXZ2dJHLeJRPciQkFaukVa
         V8ToFcGeqh3fDhLUrqYgD72znaLc6/jVwmrdULj5mCC/gUsiqTiPbH0FyKXXDoTIL2zA
         Z5Vi3u6evn3kDZ7MoyfiITs3aE1SgTbfjUeHonjUyVzbVW7d4MtkSZooSwwAULNPRKMo
         jxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061569; x=1792666369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=;
        b=LV2xM1n6gPns/2sqTid3NOJUNB13pXPAnH1PD+AHyEv/Im+5OOxKZfWSQh0JSnMouf
         J280pSk/o1k7a3YzjDzZDKGie5oJxl5c0KuM4FKqn3gejEr6YpeSpEeGqOkFiKJPtH6o
         Xl/qiWT0bPciA881qgpaiKNvRcKM0bSlgQAmqOSzehJ5Bltrkh0cxeueKWAdRW/g6fCP
         Hs9Ac6vfM5FKzgSJuNMAAhrf0k2/SEc1BmH/ciGJ+ABuAO9IjUspUOg1dYhL0jHVyDCe
         pbSHlkEYqdbI5ML1iNQrXQd2Jv8AcXlkZsC4G4ygPiEm7XmT9yWcUGmjsgdiK23+FccS
         L9ag==
X-Forwarded-Encrypted: i=1; AKwUvByyh0dsFaxjUCKdUPPz2Txf4YjgiMGaOD9Ox5eTxpZ2LuDXUtBeIi/+eYCBr7Aln65sxneZAdk+UYZ5@vger.kernel.org
X-Gm-Message-State: AFq9FYI000g6kYp98WX3+9kJ5rbt8cAjxcknHuc0ZiNAc7Og1+HtNgYc
	fo/HP8ivIvr9xqnpdZuzYbCJjdBVxuqHovgSlaSpw8y/hAG9sPRGCbHo5rhJDIpTWpY6zVibEOD
	rnrGg2lTI9n+SWnIIQBlKoZZexnSF8+l7V780GYWrNt2ZNNXQ00wPWtuZFtQ6iuuy
X-Gm-Gg: AYBFou3AVqYAQYQI9y/mX6UQGXuBfH0LLVrWk7tnQGymezPh9xGafgRFZ9ZbXjoj00T
	2rWwXltlnbxk6H46OGj0Pqk1kfKHG+9x/uC61yzkJ54aqySeTSRWcXv0pBMASv7cKFolSIfwn1A
	IbXN2JgVoLZZBBY7MUrKTAej3yqpDz5Altm9Hqd4NIQhwDR8z7RdtjZQEGq3rP0tf7IPh/oKdno
	K/jJyBz9KLtvFBxUSK6Bf0mknKXL7fK/BjzyqKptjW6Bjrav1igJ0i+Bdpm5pXeGOEbS5Wsx8Pm
	epWh2b79twsAN8VSJ8cYVPBUicRgLq8kSXXU1jtJiTIwH3uKEBXBg+pjRqbbAPXwHH2FXMP06xL
	KMMVZ4M4+dJWXT5GqeqRCFLbDbQwglA==
X-Received: by 2002:a17:903:1205:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2e95b4ed9acmr15403235ad.51.1792061568931;
        Thu, 15 Oct 2026 03:52:48 -0700 (PDT)
X-Received: by 2002:a17:903:1205:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2e95b4ed9acmr15402975ad.51.1792061568456;
        Thu, 15 Oct 2026 03:52:48 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:46 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:27 +0530
Subject: [PATCH v2 2/6] arm64: dts: qcom: glymur: Add CCI definitions for
 Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-2-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=5464;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=IFYJFv/BVGKeNkstw3qZT7Nr2PwNdhpO42sK5UPt5u4=;
 b=zX/3bBWSdGzEYnyf620J3D78ZxK0L8RtCzil7OAEL8wMFJboP8r5kcjgBaiC8MkbO2qodRs0R
 81vzB1xTRi5BxR/c+xMfgwiOehxslQ79I56+k1B8Fa/ylmfzhxcwemf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: EPLrzSvPPS4TboYCzUxQ5ccsIJ2f8U3Z
X-Proofpoint-ORIG-GUID: EPLrzSvPPS4TboYCzUxQ5ccsIJ2f8U3Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXwd/YEMp+1wQc
 XC3zDfaCgxxXlEtD0Z/6eqy4U9GE/Y10ivF0Jpa9P3H35oaLvmemgizI9MelHK/5r5fAm+7uKfm
 bkV5p/U39IEEpoNxmVL1XpJhGq1cJ0E=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0b081 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IhPOVdJj7MU1JEBa9wsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXxsP/54zEjSof
 iyyxqxeJOuCPoMq3uGu3vbUokiNCdVAgQS22r9/j0WfBixY3Pncz8qsielvXluBrypo9ujWwEpS
 EedqEHnxtuVjdExXSaBQtD2MtZR9rhbtm/wRf4pFEDexRBfaFDaWNPVbOgIFEgCuk8U7zdT5BWE
 aK62oOtmL22bIep9lb2nGO16kCVizYMlqmo9YO7YmJYgF75jUvb6DuFp9VHEq2/UgKUS2U5eLTT
 H5zFpBZ3x5yWUtJ21j7hWLky8fKV2L/Ent66RAOarH4jAeyonDKIWLt9BkOOHUVsjTH/UQ2gXzW
 1VrV4RN1ykpd0w52n0R8MwF0EBtKKX8YcgtjRleaz642eF6pQ/adM5AAUMs7/anqKKWJRrALJIj
 FIbzuGLaouPAanhe0mrj/bTHZyaA5VVeoDFehsU/XuOY/EOzRWPp8woPDB8Ke/MpQLmAEWQ+sT1
 r/3REZ75I9Q8BRnqN/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Qualcomm Glymur SoC has two Camera Control Interface (CCI)
controllers. Each controller contains two I2C hosts.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 202 +++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 7609c15ba8a51b8c9b6e06a48410df1128316358..fce3651c47f403e01ffc2a44d6d04a4abba1f310 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5408,6 +5408,80 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			status = "disabled";
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,glymur-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_0_default>, <&cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep>, <&cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,glymur-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 859 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_0_default>, <&cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep>, <&cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb6000 {
 			compatible = "qcom,glymur-camss";
 
@@ -7074,6 +7148,134 @@ rx-pins {
 				};
 			};
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio101";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio102";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio101";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio102";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio103";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio104";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio103";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio104";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio105";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio106";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio105";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio106";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio235";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio236";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio235";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio236";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			sdc2_default_state: sdc2-default-state {
 				clk-pins {
 					pins = "sdc2_clk";

-- 
2.34.1

