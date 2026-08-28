Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435F471CE8
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925967; cv=none; b=ePIYWk8z1zDihlaz0L1t5TQzEzBlAT/8/eL0U7aVWHhTIH3QtjvNNUN7o3tN3cC6ACVkGmDrZv5Yr7YZPEgoZgjdxKtevEaq9JClKj7m3CwH/PoBfWEF7mILAtWUNYzWiOJ7oESkyr7Swpa6rd7xf14kgIAU9tgjACSbbkPO3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925967; c=relaxed/simple;
	bh=u1bSkl1k9t9/uMluWadh6rXCGD8ZdDQlv9GwIeJhvIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsCdGJbA8ACyBvB1bTRPE+wzGIWgUBUFCjAbj7W9HKM745ut3YXLvTZK6eLM5fZAyG5SI52JCvKYh+aXwW4TEjmAhvAXa4Op+EX3LeIclEZnqobLqMJp0uqKrLXyDHGcbUDSRhmEy2mFaWcT5UsCxPxN5kYaETKOR1gt4uGanWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KG8n+NSb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bp/rUh0e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KG8n+NSb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bp/rUh0e"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkpZX3545702
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBqLcLJpcQf9IwGh9XzxarcrFL0njgSazFzqQcBJXIY=; b=KG8n+NSbm3/ekFTi
	XjDzSOSlIkJrCWMl4mnUnpeFcYwMi9lljyPaxuXBPdfvTGHagV0RJ+DcuIVX0k/7
	EqTykGQaBvFXlz5uTR8Cq7vNrgoulzie1AD66XMgTvs7qesn1fj2FIYya8QOrk4X
	Cl3yJJoRPl+JYHi67Mg24kJCOC2djAZ4JeedpPIdRcv3yZH+tiY6sBCHNSPpRc1t
	ERQGva2lUPer40/Nvn+BXaXRwCGMwaZwufXGUh4bWwLrilGPAdK05V3ogGS40c3h
	6UQi3C9tvuP8IagEKMnm8vaU4JzLVtQLosZOp7lf4T6CplXlX/Z0+2Uh564K5xeC
	FDxVAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n1xrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:06:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fc16ac179so9089261cf.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925961; x=1788530761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBqLcLJpcQf9IwGh9XzxarcrFL0njgSazFzqQcBJXIY=;
        b=bp/rUh0eGs2o8EH83t1hi+mQ4c1la8ePFXvYCwQKTzfZNO9zn7pasmFicZRZdwbeCE
         OMa5LuvrCy1ifFlPXBvMm3HjCjfMj2wr5ong9xXYzFPdYPyPSRlun0NC216e/KPXObwE
         Li7IyquH6MnwxR/qecpoDtlB3NpP6KdCOOAbmwBY3sSRbQz7I2ndMkQAHt/41XZ4AFh8
         9rxy8QFLsdp9ZAEveklkHh2LcPqtq2NNeUryHSuESsVa4rpWKYnafz3nB5Lm/iVS+a4w
         FqLV0gIrAC9Tr1cgGODgqJfb31YQ/4D/SRqA3+qWsodaZ99jeTKONTcJS5B/6U9ZAZsK
         g+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925961; x=1788530761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBqLcLJpcQf9IwGh9XzxarcrFL0njgSazFzqQcBJXIY=;
        b=W5cy/fJwBClp5F2aWBsKZEj3qP/7ZbdlNQLtma4iCbhu7tW/vX9N/Q+cZXNJjP4cyV
         kW/qtVnteyT0N+KNcoLWfo7l7akc/IyYM3yOCQwwahzq88MAEqUsfBEp7+t8ojAYwsgf
         1GvJstNTsgNe7RueiCVXPWZx9iLqgznMEjNoD9Hx+6JsSijZ/HyplYhgWi6XBYp4nFyL
         rFuqnCwJNr6DMmLj5wbvxfivAfrwa+PxUDiMMdEu+Ykzh9Lp3lpti4Y8fu/Tgv3wDmEx
         wXGI5Bi7w8IXgVCATWJjc9RnKs28e7Uoc0EsywM6F9O8Gce23F7QdMKxSuapSjfC0ukt
         qD6g==
X-Forwarded-Encrypted: i=1; AHgh+RoClD3rQMergnukYCj+OpYe48aGKR+oDyEC8HrsSWZaF8mV0DnSVITUcJyjnq7HVKqpTvoZNKodziKK@vger.kernel.org
X-Gm-Message-State: AFuF++keGrxsO4qcKa2vZT9dBBKebyfk+VF0uoTdr1Wn4T1fTiTkIZS/
	DuWQsKLwy9Rwr9HJrrITINS3eWdjOAIGGDCDdK7x9q8vBKgCWwMWYHSH94LRjldAQBt1ZvH0V60
	4WogCLqCq+ZBkisTgBDqAXarjARILsQCiSyvRrYIY0awFI6cRCgwCijC8L0SIGfhC
X-Gm-Gg: AR+sD13p1Usv50O4iGTfZppRBxgkFyUcdgUvZO2WBjWhPeo2o01Sgu864zhevjPZQ9t
	dRW9wnDm8vBIkTQ1ncChwm+tkMD28MxTFYehM85W7chjg6wZjdsrWmT8IjjEj4l9qD1tfsK3Sl1
	7WcKbEQESxNLQboHviUqD1VVx0VmA4HXKNAYCBsArceMGAIjOFkFaxc4qT5gAB6UqLYDV0CP50p
	HTqo6+JJTA61v5wYYNikSEZt6dl2rqSjGEC+PHt3TykwQOCO45iVw1QfDeX4i/rIefiuhfzAO0a
	Nphy8J3DGl1juVDf4mrtBiR+4SjLbPAslDca6grlK3sJ9x79mbUC46SoFQpcAriTxupnXwz0lIA
	YIexO8D9NeGi3EboNq/8ZbNE=
X-Received: by 2002:a05:622a:93:b0:52e:125b:9444 with SMTP id d75a77b69052e-52fa1d2d479mr171378511cf.17.1787925961201;
        Fri, 28 Aug 2026 07:06:01 -0700 (PDT)
X-Received: by 2002:a05:622a:93:b0:52e:125b:9444 with SMTP id d75a77b69052e-52fa1d2d479mr171377151cf.17.1787925960540;
        Fri, 28 Aug 2026 07:06:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:10 +0200
Subject: [PATCH RFC/DO NOT MERGE 12/12] arm64: dts: qcom: eliza-evk: Add
 native HDMI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-12-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3179;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u1bSkl1k9t9/uMluWadh6rXCGD8ZdDQlv9GwIeJhvIs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWiqk9i/2WoIbJ17LnGMdKK+fQvUgAh6sj06
 ktkn1cAIaSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVogAKCRDBN2bmhouD
 12rLD/9OWEuFU/08pzSSIz37CyxP2BNBpkm6TcXV3cyOKweH89yiNHt116VRkSOjcw7v6UYh9ge
 cIPuWlOkOey4qczsNFyZW96/Q3hmWjYG52AW79+69OjEazJ3KQXtBNBtaUxquA82mw5LZGyQZB0
 JDbVhW+qarI504Ybb1+kk/ufWZzN893ewD8PxoGemngHPkAMjhydTGm/GNnODoWjZGIs3WqhM+W
 U2o6NgIbPMw6kA0eRQ3/Mb/XQCcCUlnf9nSefmCke2zFMg0UThx8vUG7t9zoWQOBVGSKnl3pS6G
 SFSZzA9bEk1iZtugWsZusVkFuanC7YhEYVaY8kCWBEiZtqekfqeIFiZs10dlcZUPuJOqP+ERJWc
 QheXQpG56d6fIQ6LaYUppo/CcQlNf4L61F7dOIdC6ZylIyPvEImq/lk0bhJujYonMoaLcxWfzNU
 ZA8Yje2oSnGX7CdedakIVS85i1CgqGggN7MpT6Eg/W0FY7vee3RtasdYwRhhTEVNlIpftZL6x80
 TovlB4MP7qb4+Eba8s5YD7gVF9KzuQRUCJjxLlgrzCzvraDnolpGoU5NzsXq51TRve80I/RksMz
 BvqG2ORce0tgbblhAsvS1yTYIcu9JnNiVdMjuwlcSYbVFGbTLeG70Kvt0rpzneMYErx+PnntueH
 BfCH6tgo8jqWA3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a9195ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=O_mqdUvEFfx1mi-XM6MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: f8LfmOEDZZN5pykpCNPoFzylg-_oGl6F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX/6DDs5Hw46Ps
 YRZgsYWoBTW6vKdXRpXFFvsh588NSYREWBb373MLTbHNmS2PGPqCLa6fFX+9SHTNSvq/NBAtnOt
 ZIpOJJ9XcZ+N2l+6mBSsi/wcNXQiVTs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX7nkkQK6sF6xs
 EHh+4zUrT2WVcRu5wqriowCyF8NHWxfMyT1mhJzZtxAMFLXgvEaZmaG94uFTW3YGh3qV5xf5CCr
 5A5B6/ZLnjd8eD9Lq5GgFQ6XouIAJd0sX3fZphwEDySPmeGWY5RSmcOIgoFSpo9WAzU9uk9pT/Q
 l20PoCbQ9aNnULZKtJ3B/QJIjgu8encOE1+N1LErXQYapcgwGXsQLH85Q7FFZSkvs3cp4iBYEAQ
 Y8OPxpQ4mGN9lqLpqIujEDrrAxFOWnVHli5VRyCcBTFxG8vOkjyeXe5oqhezXJUdxCtuj3VYI5I
 dColBP/RMWpyOLZnikGuXrbtCeb1jO4bWsGAihn3eLmrgcmnykFGU59IkiE+iK/IkV59K6uJS1O
 brPae+6T8QxNO2FQOEntj5ARZSuICEWpeMiUtwINx/47W/02NDfvMEzS2zNYY+uDPMWhHe/u+G5
 UtMxJJEoJUiuTqGzqbg==
X-Proofpoint-GUID: f8LfmOEDZZN5pykpCNPoFzylg-_oGl6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Eliza EVK comes with two HDMI outputs: native eARC and via Lontium
DSI2HDMI converter.  Add the first one, with the 5V power supply.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 103 ++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 2fc945658300..533d52ecaacb 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -12,6 +12,29 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi_5p0_reg: regulator-hdmi-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "hdmi_5p0";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 184 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&hdmi_5p0_state>;
+		pinctrl-names = "default";
+	};
+
+	hdmi-0-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_0_connector_in: endpoint {
+				remote-endpoint = <&mdss_hdmi_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,eliza-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -51,6 +74,34 @@ pmic_glink_ss_in: endpoint {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_hdmi {
+	pinctrl-0 = <&hdmi_ddc_default>,
+		    <&hdmi_cec_active>,
+		    <&hdmi_hpd_active>;
+	pinctrl-1 = <&hdmi_ddc_default>,
+		    <&hdmi_cec_sleep>,
+		    <&hdmi_hpd_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	core-vcc-supply = <&vreg_l2b>;
+	core-vdda-supply = <&vreg_l4b>;
+	vddio-supply = <&hdmi_5p0_reg>;
+
+	status = "okay";
+};
+
+&mdss_hdmi_out {
+	remote-endpoint = <&hdmi_0_connector_in>;
+};
+
+&mdss_hdmi_phy {
+	status = "okay";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;
@@ -70,11 +121,63 @@ &sdhc_2 {
 };
 
 &tlmm {
+	hdmi_ddc_default: hdmi-ddc-state {
+		hdmi-ddc-scl-pins {
+			pins = "gpio6";
+			function = "hdmi_ddc_scl";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		hdmi-ddc-sda-pins {
+			pins = "gpio7";
+			function = "hdmi_ddc_sda";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	hdmi_cec_active: hdmi-cec-active-state {
+		pins = "gpio46";
+		function = "hdmi_tx_cec";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
+
+	hdmi_cec_sleep: hdmi-cec-sleep-state {
+		pins = "gpio46";
+		function = "hdmi_tx_cec";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	hdmi_hpd_active: hdmi-hpd-active-state {
+		pins = "gpio47";
+		function = "hdmi_hot_plug";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
+	hdmi_hpd_sleep: hdmi-hpd-sleep-state {
+		pins = "gpio47";
+		function = "hdmi_hot_plug";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sd_cd: sd-cd-state {
 		pins = "gpio58";
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	hdmi_5p0_state: hdmi-5p0-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart13 {

-- 
2.53.0

