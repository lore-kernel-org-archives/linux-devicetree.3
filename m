Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC049F10E
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549915; cv=none; b=IW+tYmXfOq3buRtKjVyBEw+zz6ipqSF6jvCecQYfx+osGQP6Vs17tdi0MXZ9+yiximo4O/8e4mZLdoI2p4k/7UYllFlS8Vfd8EYIY8hrAKakK2HPWKzKcDMnvMfLlz1iBioc1N342JNO2ESHpFmzGhcKZ1g0vwhtZstrfGnAaUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549915; c=relaxed/simple;
	bh=ALrRuZDDpwCzwcagXTaukDr+HDrgl7+P6tkOTlDyBuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1MOKIJyRADkV1TdF/OMPI4h+3Eu5ZI+FQUa4Uz5OMy8DhuvvqDK3BWSA4o6YCsHxcIVPTm8f4/2qK5swxTrXxSiVHvMegaNFsBmAbio+SDUT2YFESHbv73GibUSfyy2qLCDw+YBWMsKz3PUWLTsVdYjir8/BN2vKEH8ORNfbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9lSFM0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSazAt1q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9lSFM0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSazAt1q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92weY978461
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pM5734dXlM5CqB9dDjz+qvpUih4UdES4eeishXP82+Q=; b=M9lSFM0vLVoV4I77
	2gNQd6dZ/ocSmsSWFYn55AD/4mI0Cf+/2kIO430zWzMCUvPSPY0qauWxFM3Cre9m
	7NEXrbF+EJbGHkcyKEuHcHZucvM1HpAmVW4DQQpgNa2I4lA+ZgaxQcMmN/RHzDT5
	8+EBWfjyRxsjKh38HFfZxCQtTFwo2VIaWN1cXcH9/sbe6B4byD8maPSieDFgOyw7
	sN7WZWaMCOaf4+nRNe9cFazX+Fflo1Kp/V0pjRfNFomGoeIiBOd0EuLW9VBBqXlx
	wi2fmYqHwkPV+ILTTjmpSsFO5WbgbwNngIMAmcIlV4S6cUPpSc5ZZBIjuE45nKRR
	iBx7ow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3r5a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so3974943a91.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549895; x=1790154695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pM5734dXlM5CqB9dDjz+qvpUih4UdES4eeishXP82+Q=;
        b=XSazAt1q8QKzTpMQ+72gJZ9vdMLPOWljXFZJ0eyquv48WuvR2gug8lGwVoBrVKSjqD
         qOtKLwi6G6JUjxyGJfyfVR9AnIESwAmGyhhIKXg7shxBasE+ntfwDf53JH6uJhf6JM2o
         QnKvHuXZDjMepziu/ScvO9Bau21NfWmhme2vjjGp9sq9U96yI6t7LKqAlrU+CzIBJLpC
         voFvBWxZI7LBaoflE/gunm3VPXxHQGe+fZWdZy34rQT3NqaEeR8mxPCSpdiue1hXXpIE
         rr/zJ1X6QQ4BuYNr88hw/ykJgv/uJgU9mwmrWTO4JFQNOWWGvx4F8h2viBjEoWc7dciN
         Eo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549895; x=1790154695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM5734dXlM5CqB9dDjz+qvpUih4UdES4eeishXP82+Q=;
        b=lgh+XgmZ2T2XQiaRWrdinABczMF0XXxU/KR4Hv5npoTrd7kjDS4d5QrHamQSWn9775
         BRNs4D37OQ8tHxwGBqr2/QphfMd/jccOz1B9bGF+vhTS7ZFB+DllpJmGyzY/d05WoOdY
         fteI6XK6VqC/hVdxQ+zK5kJIzD5daC35XjjhK1ktF4KsNNtB5SJN8K2G3FKAlcIxFRmm
         5pDvUpVRcb5lhjtmSgfLg9fCs2DSHwI11ByeJmv7OdsylCDWuVoKdRhpN/ZjpVC/VRlt
         gWnvmEVZ2FiJp9oRShoswE6MQGapEpyik7VDmWr5LjUY32xMsBBDmKCdrRSyd05e+qB0
         aRfA==
X-Forwarded-Encrypted: i=1; AKwUvByFOwAInh+wgEQPWcvGVz7lEvs6p/hbqGZBV2CW7QnuYSA0Deww0LExOgdhDOM2fiVzxoGjNtvL5ZTn@vger.kernel.org
X-Gm-Message-State: AFuF++l6wN+SRrTTBxCVUoVPUI6Blr3baxVlO7NZ6SWM7tJo2y91cHZl
	tJ3nJxlPbmG3YOsKjInNU/PIiopxDURvHgqKka17t6VoiBI/e61tc+gqt3JYBiD9+Sdh7kKsJUs
	MeopUXlxUJ65kHmnvIGNIxLdKHA1MKuNFoOna+5skmjQnrU20QpxTOA1fkdaDEY+a
X-Gm-Gg: AYBFou33TC/71aPwPH4+dLBGjXwOB5M6Et6QixHQ6TfiZ86i7RIKzfQgEFBLGcYB3zz
	hdkIbMRiJk2+4ypTVn4i2IUwcP00x48+9HQgjsRdzpKu3/hxiOL41kkqsmzPyY6slDmRvUHCK7Z
	Dg2WZIJoiT8GjEcLEFXx/HaDmIUFw5JRnE+q8mMlsFBfUWnzlAAzHqXP7bafj9c6TkSX+6TFbf+
	0E0jguZ5Yr6lZZsuzFhlfqFQ+iEIGfbAfpxB+AyBmn6wg54IK+sFJVNJQ4YoAEqEwbx5LPZL9vi
	zLMcOwq/HxqIGyQfvbvrdJX27Om03KbzlmfWJ9sdvLKNLbCzIpnUyUSQIHVmetfqQpxCBexJ7MY
	JvLhZkzGf6DTO510gyBGdhPJkfIo=
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr4112785a91.15.1789549894867;
        Wed, 16 Sep 2026 02:11:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr4112744a91.15.1789549894427;
        Wed, 16 Sep 2026 02:11:34 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:34 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:41:19 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
In-Reply-To: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=3349;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=wt3Zyiq02vRNq4N1d4uIoj8xYdjOU5QkSNX7spz+uVk=;
 b=BtvwYx4GPk9NxVEvosTBLTouuINHozjuTU4DbZ/NpwWnjK0iBp2dY5UVAx0njToAxx6WxQ84j
 fUa4wP+VDuODHUtz9bLtz+W8xqfCCNi5L30NDJUsvGqO8wMG42YHhtf
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX1yDqciQhu3mb
 com5zgb8Zykq74m91jEUzUc6AN9+iC2WVAtOp+cJJ/f1xCukzuKUPxnkq7a/vLWuwflnbgolaQI
 qF/AazBC7VSnfXXRKa/HnXo6NSWITPcTQIWnnB0I3jb3CcprwA+BTRazKQ6YnwEWvXcv9gjuiOQ
 fyVSc2qgbm7XE0Wwe1noBMmsnHiAwCg6sZLqwkU2wJVdVj+X0os3IoUOQnOpUgSo+estIkUi6yQ
 zIfiYAXT1oiOvnne8qVT5/uyfkDTGHvdE8t2lgXHB9eCvnsO7zrewyrCyppnEMvEC35EYGKnimY
 xBt+mjdSF5gMRstbjJX17Tavlw2JgwCYq8P9xJbT+u/p2YeDnbAmzRNhZg+EFjCn/6Xez86Nz/9
 +JqLWLzwcjD3XePnuyM5nrOLuJSlWyVOKksGE8I8xreJl78/DqWzcUeGH7gjl9p4NdHBIGS25ua
 KyB44Fc4hrtgdCotYoA==
X-Proofpoint-GUID: QTJ9y1JItA0-0VZj7RwrFPruZBsb6BTe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXxYfAQl+DOUVU
 QBcluRAE8IfE8flVUk0djolS+uMAwbAXDTsKuOvwM4iHXuucy6pkLJLr1XMXKcAJ4qJMKOdeQL4
 i36UE5gd83dhAWm36CHA5NdAgS/1KKI=
X-Proofpoint-ORIG-GUID: QTJ9y1JItA0-0VZj7RwrFPruZBsb6BTe
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa5d47 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..a9067b710a22 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -21,6 +21,78 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
+		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -57,3 +129,49 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

