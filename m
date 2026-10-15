Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A1519928
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061586; cv=none; b=ETcVDP7n2ic3iz7fW89OiXuOnkuyHx0CXcLLygE7MBrEXMxFnqYxdUZg9EpVHiubUt9XKpWjmMtK3Zu1ydMJ3U4SrIJOhN9yWxkgyeb9GX60q4XBMYMmnWmBc3rzGDmXje/NFXmV5OQ9YveN6yXwWC+QElrt6/h6pxKmh1J6mCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061586; c=relaxed/simple;
	bh=PRXZhZhetP11AR/VKn5pVd09u4QzQ1Ak9Le9/TdMQw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJvZp/AdGxSAugxQ5of6swSUPnvsMxNkn5boS8wc9d5LW4oQi9GJTlJC0nWU3uMpGHE/SYZ6THjP12XH1V6iOWZQw9OrUL4cGmphKuxvCHWo5HUgjpjTEFg8l2cfghiSpt/B/2DFWaGJMZ1VcLHqjqgK0hvn5DNt7afxXOgYGWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohYyVbJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR+MQUl3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohYyVbJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gR+MQUl3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jV4L2416909
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=; b=ohYyVbJMmdJ1ND2B
	f5+K8ZnTqKDoJ1oEfvBQXCpDz2ZQk5+wLEAd2ya02S8E9Jt6d8rZ1+5KmE/A30Xo
	ALH/tyyh97U2ivrrxOh5xzakLObaAbiGTs8EppvWyT2zGvBnCajwrRJOMmA2qIuZ
	jXvTRg7qIaAK007qK5mpk1ACRrmsPZXaSBcyNXzO6H0JKG2QvWv/Y+77sXhKa5d1
	utU4jDt6i1pWInrBSrpO+G+BdOXvHsACbl9251UvC0g04L/GiDTOQWfC2dt/pUP/
	0JJy7hwPxgjohXyM568T37v17/8vVYWtbs17Ojro7ClEqeP5Rk/M+l4WGSR3adlp
	Vs+Fgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhpxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:53:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e83df1d54dso24573925ad.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061579; x=1792666379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=;
        b=gR+MQUl3i8aK09CSJQIBt+XkwK69R5lurb29a/7bKFxyrydBNR1AxXq83uu8TFHAl7
         Z0TrQhIfVio4gllLTJVz9YJIy0xXLsROFIMe2t8FhzgIE0LuyMzooayIVWdyIq+xthm6
         eyEQz3OsELiZCWJb/pUbHt7Yio7kGi6znhF0zYTbTqPTZF3CHQcQEoUnMUQJmwTVnZzZ
         R1Xlu57gSIa8HYUzyafmDynBEjBsKGytu/TZETyMv+xKUkEIPeLxsxwH3t9JIUmqLf9W
         KXL+sEiFPHnKLc1oIhgj8fYcu1MqRaMik1GaAfQiOsH/ay7zbvkr5J2y0OKc1Hro95fD
         oQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061579; x=1792666379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=;
        b=QGHgJ3kd5R1gvlHzxjl0RooEiDWRrzXNPA6DPfOhhUW/3Dj2UNPsWemxymEs4iz5sO
         vsiBeuNzkWmNK685WC1PIYmrcn1nDzcalUNxiyjvUiuAFBJn36QehIHvXVR1S946EjSl
         j1UqWIHKIky20lrh38Al6Q2DScqI0kZ7wggtYro6p0YmzlBCTapHlqio6uDs1WCTqzh8
         K4Bxq/Z3ZdmZaUR8FR6Rk0LfVIUIhvuLUQRxsubMmd2eO+W0L6knCvGe368ZU//f7Bbl
         V8WJrLNReuZF/nrgC4D48Yekq4smMnsg4sFvUQRRJxZlRTl+bCcK8nP7tkSJNFmG97VB
         QxnA==
X-Forwarded-Encrypted: i=1; AKwUvBwG45GvMM2tpopkM6kYYWH2gPaDXbO8g7impPv1w9XARkVUOe8eZqyzm9p1UhdHHlH1LYwB974qTP07@vger.kernel.org
X-Gm-Message-State: AFq9FYLM+NU5nLt0wwNZ1s4OcAIVYyPtWTrhLD7KiYj0cjOGKHS044vJ
	/7scL1Xz55TNalixjV6Vqa1ouOD7UjJ/LxStqdDyoSqIqQMPUaZTTmtJ3+u4C3f8kc00R8xcKi3
	O47oWRbGUE9MdAmvmr0BHC0C432ZyIUnxNrw6+g8I5nJRXpLLhq0yd+TpjXsdChT5
X-Gm-Gg: AYBFou0dB5PYzCmREvSbuCRLn8aYyazyITQBN0mfpvocaVwSg1lJO5gOh0IttXwQKBX
	22KGAqfKkmUkKYFX3Mr9fWYY2tGWdxhLRRr3asPZA0qLrMFE4RrqYECpVxepochLLFlcm0Q2RON
	0upyAHUXinKTZOpWyytL7JL5rhWdVtf2xsO6xpxOIWPD4pYyBRec5dBuIe2ghUJcQ++yZU8MPxP
	3yskJ2RZ5x1CEviUzmYFzt9KKf2uC/HN3p6+RsXpj1u2e0yLinr/gYGvrLmwp3y9RxgCG8v9Rw9
	1LERuPYHySP67fH5WK03zkhZHE2LYEAqPuRGg3CX2rbGXtR0XGl5j8lWKF/ji5gosP/tueabsxp
	JmQ2Yn9+6bzDs7Z+Af8FVslDWHrbDaQ==
X-Received: by 2002:a17:903:234c:b0:2e9:3f6b:346 with SMTP id d9443c01a7336-2e93f6b06femr35906885ad.41.1792061579228;
        Thu, 15 Oct 2026 03:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:234c:b0:2e9:3f6b:346 with SMTP id d9443c01a7336-2e93f6b06femr35906765ad.41.1792061578744;
        Thu, 15 Oct 2026 03:52:58 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:58 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:29 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061551; l=2747;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=SCwcqJ++OalJ7mck/seksWRQmzlUuQbt81toEFYLzQ0=;
 b=VtEo7dDNimRS4Im3wrw/lKJ4xYDiSnlGr6RdJ/s83yrgXlphCYjWpCY4wbznDb0PmmZNPKm/8
 P7JGyuvNuHzDPMwIh7T13GaEr+ZfIWyNIzxc6yrx8Kj8pmOLCzzJOAY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX/Gwxa1tn+0ZX
 rY8KIFkbUlwSqJ6pOp5ynkfzcLsYQTezU9GAc+EC/VbDvI7Ht4nV+r3ztFpyeys7A3ZO15IDLC7
 UeQquvFcqbjcAYyZ7Y/zpR4nv1tIbvKleoi7daFeK4umnHjnXNrIWUNpOohzU2KmfbEYUfm5EiM
 FdobCcezzWed4SwENVNE+3crvHI3UV8IzAFThsr6qNljaY/yrNQx3MDL6EcoCeMna8Hctry7BrM
 iG/fTGgV4fExQdCEzs5VP/d1Hc6gNE/6yWDEF7+1ApOd8PHH6BFTpwM8HQfhREKG47IRRAmlqHO
 foR3E4FuSROvS/mN2pTwpt1vL0NP0SGc/RcnDOwa/5cVVfX45+W7dmGaiMLu3x/KQ2TEsEE/yUU
 ap9W7WAVRB/60WJgvFkg+oABk/pWXqT5sqYPGay0LiXseKEriZ9Hz5/xl58nZS/Pwdvu2jif+VA
 72GoX3nGTeEmVbHS29g==
X-Proofpoint-GUID: gelTxMn9IM26g5c-a9e_-uiUchrd-lj8
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0b08c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R0PpLEuAhYnv2Y3507gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX8zUyznDjHagJ
 iQl3YV7Zjt0Nu38SxxbeDyHmOnyem78dv4bCh3gZXU7YgxsSgT3Akv68TTeypnZpRBzaQkejAeY
 HzQFI7D0iPECZRNGS1fzDchqjWTjfwc=
X-Proofpoint-ORIG-GUID: gelTxMn9IM26g5c-a9e_-uiUchrd-lj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add the PM8010 PMIC node with seven LDO regulators and pinctrl
configuration for reset pin. The LDOs are needed to power the
camera sensors and associated hardware.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 75 ++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe295fd111f3a3d7778ca531467e900a..ebc8da58a79ed6a77916c70c7fd93ab06e185644 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -671,6 +671,72 @@ ptn3222_1: redriver@47 {
 
 		#phy-cells = <0>;
 	};
+
+	pm8010: pmic@8 {
+		compatible = "qcom,pm8010-i2c";
+		reg = <0x8>;
+
+		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_l6p>;
+		vdd-l3-l4-supply = <&vreg_bob1_e0>;
+		vdd-l5-supply = <&vreg_bob1_e0>;
+		vdd-l6-supply = <&vreg_bob1_e0>;
+		vdd-l7-supply = <&vreg_bob1_e0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8010_default>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8010 0 0 2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
 };
 
 &i2c8 {
@@ -1106,6 +1172,15 @@ wake-n-pins {
 		};
 	};
 
+	pm8010_default: pm8010-default-state {
+		reset-n-pins {
+			pins = "gpio106";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio221";
 		function = "gpio";

-- 
2.34.1

