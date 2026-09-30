Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5619C4BF923
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766956; cv=none; b=sbCAu8bpzyL+VRkiz1mspO2kRFB6zCMGFYm+4IMOQWG30Dk10sW38JS4WXYe2XGtu7svNxvgBmrL6waUcSNHOQQsUyfv8HE9z6HzRtDtM0zH1215JEWDRiqRCyP/3tU49kRHykAf6zrSmy9uxtF5ck4xWNRWFuQc7ecyaNUnj7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766956; c=relaxed/simple;
	bh=x8IEnQl485EogjcmyDG7U6n+sy9pYcoHothjXs4F5Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOXrCKh7kTqe4GJIhGxBP1AInPimzlRR/zXkxe9/NADU5ImJyxdpnhFNOnUNv9mZq8KV5cVVcEU9Y54aErifUkdnRFVzYnGWYn9wx9XcXTHZlx1OdrEhfj21ieYIlT+s4AGKhgzuWEtHkITdsTedNKV45++JznEGzxXWbaWa6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmPRiNWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgmkb55X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmPRiNWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgmkb55X"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7hRf2678390
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=; b=LmPRiNWZ5aURHu+R
	i1cpDcKs8Y+rPMuRU9eLC56fU0u4AsnK05M5oY5YdB2bYz9u7XZk6AmdgcwHbR5j
	pjcFhrKfXQUkb1wT7kAbG9R4XHMwzmy8sxkW1e1rDtu7MshI+Cn2vn5xjDg/yp/p
	kTb9RyYQhfnJ/4gDSsUeobTmpLw1FIGQ1crsLAABRnSWEh3ggCD9nl0/LHUBenSx
	2Rr73SY7+LjRbPIu84ZSltcjXQWGwuNMyTn9m6GtgL5vt9L1gAof/STx1YAT7feU
	5iwXlvAnUwb99TQNVRtLyfKMjfmvrmO0+N6X8Lh30hokh94OLiPK7DJm/hj7cwix
	bum+5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjj5yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:15:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dfb24dfedfso33649515ad.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766954; x=1791371754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=;
        b=jgmkb55XPv97BQAzeKm2FadOuiojBrwKIWXmjrBEaYcppuG5l3SZIPt30cs+1jkRDW
         hhSK9VYCTfDSHDVo7vm9EpYRgVXuE54YeINNo57V3rgj80jcTvKZM0dRX9S2dAIdjtNq
         qCILGujPx0zzqRaofmeORCoScXH6fLqFlVwJ0K74UlR+/gKfNkmo7wRKdjx4n3/ROE65
         VT0sq5rdXUE4GQ4qOhkGx98Ia9TrAcrAyTgEidEGoWf4AIhk0KVM3cbLdchBnvJb8cdH
         LCkmm6tl0ozrYdLOTQN8EP8CKL0HA6XCqM8FzfIrJ+5a38txvWx0/HdZJRPjFW9wt/+L
         ZYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766954; x=1791371754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=;
        b=qq3rWj/NWf/jZGFq9WpZdt/ARAd67KDqWjk+L/V8O9KzMMXeOuKUbCXGRzCkaa6eo2
         erSS7P4ArEZTNap6wuEWL46txfKEuIjx11dZOy5ZG3Lt58m9Vcy5lrXXLptE3QDaDTtd
         S/OtUgO2Uy7Zl8Cd3IWUH6At+ofmWlabt1q1dvfju26xAG5xgCyqFbmVj0axGEFgMZWe
         a1GaEHafvBr3zjWVZ/USXfEpkifJFobYE0UI8oVTpkzVEYEsWAvnl3diRgk3T+MiOjgJ
         xJAv1Eid3s2wkCbfSuMgeoh8X6JL13b3z9+6dgHv9nssTFa9tf3Zg4EZBeyYfvtulwme
         mHzA==
X-Forwarded-Encrypted: i=1; AKwUvBxXUD4d4sB1eqf8sMToisHUPKoMVxQoLGmKjM5WxJfPKIpBibBAk3CB4rbhyEp89Cq2en2nBYy61q6K@vger.kernel.org
X-Gm-Message-State: AFq9FYL4pc2kcUGZsUES29iLcdM3ozRuDD3J0GSuwt76FFQsqPURhwdW
	rXol3YVIjC0VzzB9CvcxMPJCI66YqG6YuC1askq4pKLbQgcPUTFNX/Mfe/NiQAWiWIa12p5Rj/S
	pLcuz2Qs3iOSdYgClgm87B9J6CWClAjYirWFMRHUJqu6LFPLhfGyXuUufHGfBfa23
X-Gm-Gg: AYBFou0ZXdoB7lhRQ0C/ehKyLpOyCEdA3UgtmY6QjbZFdfJll+RZ/tYyFtfetShqi9D
	iwZfcaJv4n80Ji//z+ok51TLKzK/3LQClMf2jq3XW5UxVf6JARNOprCZkHcuwZIOJY1zgNTPN5C
	BIyu7eWwy+D53yiC6wbFhZ74RT3xMs+7X8OLKNCNWY4tuezu1icd+S/NGKg9mAdyYXqnbjvJKA0
	8lxK4nSWjDKbDQW1M0P7sn72YYUhFWB/z9rXkuxWB0TqM5VHejdf3+jSuxIA3rowyy+BTBMEGGX
	Xjs9DXrCgJtRzcPvjdu4ryX/FiFZumrNAkTlV4riwcD/S7oLbhCp1JTxCODX06Bwawaf3Ea9/yy
	xPXEUqoucIyvaHn9LrX2nNFo8bHE=
X-Received: by 2002:a17:903:2b04:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e2e49962aemr9452505ad.6.1790766953424;
        Wed, 30 Sep 2026 04:15:53 -0700 (PDT)
X-Received: by 2002:a17:903:2b04:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e2e49962aemr9452315ad.6.1790766952973;
        Wed, 30 Sep 2026 04:15:52 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b136sm5505465ad.71.2026.09.30.04.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:45 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:45:12 +0530
Subject: [PATCH v5 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-dt-changes-v5-2-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790766920; l=3209;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=bbXmK13aKPaq6iFS3DzUTlaOBfnJxVDmlcIoL7Ekra8=;
 b=O9+WOcdWLRVX4XZodTNdSVJ0xgBEm8CTVEHlv/tRw1G3Qd9S3hP6LUVU/m278zH9nRtImnPIz
 SutKLpfLqdGC0msbLDQ8npgqEnkCNvPNZNY7duowYbge5ot8MeH65nE
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXxwbEXRcD/8Uy
 Fdoj9trWCov+SCnmP/DTMuzSOWs5wnsfGREVE78UawHL6j2E4961uD19QPmlBnDCZULvWEDRx1D
 gFJi8ZD+AmBOrDn2FPdTuSIgKPw5nf4=
X-Proofpoint-GUID: DZfo2LgE2KMnWjMdHwyJgZckMZHf1UJ1
X-Proofpoint-ORIG-GUID: DZfo2LgE2KMnWjMdHwyJgZckMZHf1UJ1
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcef6a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yejcvWCcBpXp99Qhm6kA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX4gBa12qDZoLk
 IbZWRtt1vUKOfiAnzXxBKLDcc097HlphvyezJfi4rwAqoarLHY8AtS2zvtTjy+NqnnxaA1TMYF+
 Bh80DcuFZCkAuQbYejnJXeYSfvkEuMCk2+L3wJBAwJEylvVneAfzVCyvEUSFNBImA7R44t//vdd
 oko0Qta93dZkPuf9LOu0IOpq83e2YZNmIDZIoxssxCoMvu1inMVAikhp9FxdrkbkXPhcmLMJiCV
 xCim74KqNj2yLzN4V1uZBe3NcfPoPPpqD2MvrD9dK84oz2PpuxIftTvFaEBlPRxO+YEknxneSob
 G3Mfy6Atp4Ce6TrWBebCso40Rw5NP1BelFryDQ07uRkasfSohBD431yqekePwD/v/KMWogG3JPP
 IE1vAzwc+CMTYBH34ijr+g9PkOX+alzfd2+RIJo0rhxvccyiFGktwZkHd7ycFXF7rQ/DoJDPXAE
 5WauBvbQtzKeC7fCoTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 110 ++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 7a2f3e1518fd..5e49a5c71a77 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,86 @@ aliases {
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
+
+	vreg_wled: regulator-wled {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wled";
+		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
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
+		wled-supply = <&vreg_wled>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
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
@@ -89,3 +169,33 @@ &usb_2_hsphy {
 
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
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

