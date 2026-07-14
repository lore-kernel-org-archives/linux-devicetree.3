Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7B2E62A9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784003377; cv=none; b=RjHoJxpDSyv2MsbvbEM3NLXn/uo8uWhSNpINP6rlpkhM9bg08cAaJhwM+LqWsIQsxgyj4W7Mut7kcKkGYZkANNFAIKAht/GhnnEXRXqLGBeBg5cWpNAAZjIwx6i/b0MgYxBJLLPuacfEo/BCMqrbu2wQ2EW0UE5fExidX6u129I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784003377; c=relaxed/simple;
	bh=qBTxNgqvPXIhkW/VgKh1ctAkKcEl9+hhc1jEUBkOmZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdi7+11ybbSQaJB3uZLwZHYvvv2DX2ZIZ4qriNTSf+uWrRAKrRiYsnihIfj4jxyL4kAiYej1CQqwm/oRRVvjGtl8fZRWP+dsYXSiZjbgXAebyA7Xz80UVzsGhRbeytj1VMp/a1+nheGJ6eSB6gDWI8KOEQ+qeJitG+wjvIz/gls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6uGb7Ky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WX9Hnxk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6uGb7Ky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WX9Hnxk/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E3errW3365313
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HFnEH3JcQpHJy4B87D/E5Q6yMrGEkNdhe+JaWg186Oo=; b=N6uGb7KyhCn+X7As
	R5JokltnNDz+LC/dysV7Ptbz0AM/B4Hlqur7AeyciBN8ClF3Q6nT+9L4YXAWz77A
	9MDPs1WDw+TeRSLu7WgP8V+nd3+SrUJbH9tM5kZqgm316q1I3rrrBkSk/y9INjrk
	pmZodUaeB1asd1Wq32fpUCTncXaJxvCtJAYp/lJVog4L8ivgzvaH/PauqgYwr8jk
	D9LAEiy0i3XbK30wlhkMse7cFOom2ReBPQcr+pcGtU9PQzI5QwfwLMsoyR07ZdbF
	scWKB3Pp3HnApOgSGAJwRyXDFj2gr7GNmL1Y8mxq7d74G7pSulHzfk2RsBCnGXAb
	gneDPg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde084v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:29:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so4135319a12.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784003373; x=1784608173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFnEH3JcQpHJy4B87D/E5Q6yMrGEkNdhe+JaWg186Oo=;
        b=WX9Hnxk/kgJJpLY4fahoNsF7oKk8Uw1ayPp0X7mnhv/HCOzvUpDpjxFtJO776dAEBa
         TB4aIhlbsdX6IlHiLL3vdpM1b2qgiHap5vGRb3YLCrMrokgK4zVqBlgimiCc9SNnM1C1
         4GxVNx2YYmpkBYGrXOIPckr6ozrxj3+fJ4PxVdbM0T5g81ilIhyKpfp50Zbrpo/kudMI
         ZzGeu6ZpktFYYBwFo/nzdEwHQsQDlOeYP9GFLnu5+pK0TjVU+HC0cxx+bnuO2unu7rxm
         2IrGHhImG2yrYdlBY1zEZpmyvF8tGFenm8QtdxQomB2y52eOgR9SMCWrYAZ1Tv80HbT2
         kAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784003373; x=1784608173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFnEH3JcQpHJy4B87D/E5Q6yMrGEkNdhe+JaWg186Oo=;
        b=lMjFNMp+6mx6uj+hLfNrfdt239ilKJjjk0VuwHF1btQgOyuhXBmI2sTk9W/+aRfQKd
         qpvvyDgybyDFQbs5piDv0p98d9Qy81Y70cjYRBOET+Spt5cbY+N9AXfRhIK9/vag17X5
         BH+XelHeVgZBD3V1UrzwAklrRSONP74vlyJDmwwmZ/KQ6gd5xRy24YLZbUmcK1xZSVuB
         ZleZdS8Ps1R5gcFgpYxKyfa5l5G51/6+aTR0Z4EEajDQYscMYSTDNI74mN0HVeRSP+JG
         DVYgC3fYWwwqYhCLa6scP7MXP6ugxSsqMCNYCp/xzIm8DE8R03zYGfiSdTx4M3Rkvlxe
         1C6g==
X-Forwarded-Encrypted: i=1; AHgh+RpgcykRwFhhczTbJuCQl4fctyBaPPsUzbyy1VS67KqC/4hj0cQYAyOZ3rNBVX7FBR9d/tJV1yUqn48y@vger.kernel.org
X-Gm-Message-State: AOJu0YztAv0inE79DYTycLJGCDbpfdT7MVOLW0LXIp6A09ITHv8sUuVo
	MJ8PyX8sjvjxp4ISDstk/rE0p9We0Z4YRAVRBPdpoGceIz2SMkp9/Nzk+uCCz6qspw5ZJelEh5d
	SFk/zQeKCgWisxE3asoUeltroYPsjjzglxjZn946+1hp1wQFZPeUAZotxm0kHcj/B
X-Gm-Gg: AfdE7cnrt4rI7qrCAxXzM3JErLWMlt+URFbEZNH7OvRM4jdsjLM2Tqfl0OlZYr7pJwd
	0NX6n+6EnHSB5b4lwotnqdqtaHfB95un7OK5TBCCApj59N33mxwzIi6SscTmYRXobN/CBCijr2t
	lJV/lMY5M1kPD/u7bwHFVwc4BuS1w8PwBnGNjiVeAg26dR8a4YsRVL6Eev4xFqSAc5MILBv2aNz
	/mlQzT0Kb9k/ni8d/tZetaFSJngdfEVLGGq9h5UvmHqp2CwUivpZmFOBHslsMv+UcvWvFq7SKRz
	So6RLP7P61jfTavq/50eUllEYUO59mRZQgC7JiL4RKFcspiXG8mN2w60OAehTpQ2JyoZj3aBYcj
	zOXNqPTjkGj5eEl4/I48kImKNY7QaMEyHotBYtWhvOGn7GlzSuJHMaaUO8TgCO2lEq7IfSQ+Xkq
	WzgZoebBzrSwz0sNXFapw1pm794NTHnnj4qdwUb4XMJFgkpg==
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr12883749637.50.1784003373508;
        Mon, 13 Jul 2026 21:29:33 -0700 (PDT)
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr12883721637.50.1784003373086;
        Mon, 13 Jul 2026 21:29:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm64388999eec.6.2026.07.13.21.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:29:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:59:17 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq9650-rdp488: enable PCIe support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-ipq9650_pcie-v1-2-4197749d06bd@oss.qualcomm.com>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
In-Reply-To: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0MyBTYWx0ZWRfX3itN76o3HjaZ
 OdFMoaQnFPVms3AAUKnMeZvMs/kSdZbpX7sUPW7n4HFgp7fxFWbj59J40qFBbwyfQzhUn2/3GM7
 Xb/DxzSEkKlF2S/ihJo/c9wF18X2Lec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0MyBTYWx0ZWRfXwABvb3Ff2XCm
 sX18DbGolK3nW8uPIHOuaDclkv/wEIXq7NyIdnFW+gHcDOlq5fCPxCf15CidNUK3iliLnEnxnxI
 XTaUFhABDPDuDgNjT/6mrjGmmM39SokToNiopotbVknN0Gr3/S9GBESri5r943OpH34qpu0BFyr
 v97mhIfa9lMlYccyidFwcVpRk/AYBoLZxq8rmN4mD0XzeNycwhH6gUSVGYAQ20PTU22bXWlnAhZ
 y6eOK7kSFap7Xr8i6aMZPMLrxzvp6H8bubaRgg1yYmcsGt1yZViuRpzlr47HcycVcHMs/a0gZ1I
 UHAW5UvH+AzS+8PbVP7NoC3+r5grMRHPLJUu8mjL9wl9osajvKbAAedMwOh71Ti25hiJy5IZ12g
 Ntq5U9xOLM+c2MgnSGl8JSJSSlDGxP9cdYiZw91abUwL0tfRQKahHjMK2o0qGKt02w/zG2vjDUj
 PvfLfSLyeggojo0fpOw==
X-Proofpoint-ORIG-GUID: enjePUYLi3j6gA3lxDShxnej5SEQD017
X-Proofpoint-GUID: enjePUYLi3j6gA3lxDShxnej5SEQD017
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a55bb2e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_o-QRdEJ9KkZi4z5cN8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140043

Enable the three dual-lane PCIe controllers supported on RDP488.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts | 119 ++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
index 6871f3dc4eaf..f6411a55c81e 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "ipq9650.dtsi"
 
 / {
@@ -20,6 +22,54 @@ chosen {
 	};
 };
 
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	pinctrl-0 = <&pcie3_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+};
+
 &sdhc {
 	max-frequency = <192000000>;
 	bus-width = <4>;
@@ -36,6 +86,75 @@ &sleep_clk {
 };
 
 &tlmm {
+	pcie1_default_state: pcie1-default-state {
+		clkreq-n-pins {
+			pins = "gpio27";
+			function = "pcie1_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio28";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio29";
+			function = "pcie1_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default_state: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio51";
+			function = "pcie2_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio52";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio53";
+			function = "pcie2_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3_default_state: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio40";
+			function = "pcie3_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio41";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio42";
+			function = "pcie3_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio43", "gpio44";
 		function = "qup_se6";

-- 
2.34.1

