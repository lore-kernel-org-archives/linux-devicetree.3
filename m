Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B793A1A55
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554540; cv=none; b=RUGzS39t7PHVphnkQI5aG2HoAJJhe1y3Tz0t8w/61ll3VmymdsFRpyo3YDSeTfqj9VLqH+VEnZwK9Jtcf8QNirG8FvGsEKMcM9eat9cTfjSn0lDvoYAAwBX0dNkqCG2xPmchA8FzzWx1a/DoPc1N7f6trX1BnMay0HAVwA5eWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554540; c=relaxed/simple;
	bh=ye+VNGZrRhLHrf+yT8SMRC1yqGdDg7QfD9UlZF+Jdz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmfxt2exbdf6dCAwXgE6nIR7GUMCY4e7OGEJHbNJrdy0yUXb992DGVqEegjNUoZZP5NsKZYv9Dt6FKJwmq76e66ZFGNuKr0rXq6MpklYrzZN3Wb9DuQ/3Ao+JfZutzMyae0MoPPUnY1QjUhXgCs1qcd2w4IIpW5rM4R9d4JYV48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExLY6PBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUlS4eRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExLY6PBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUlS4eRQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9aPaW733316
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUj7K6dMrvF23BPs+rj4h3Hu1eqmvsA4UImwnVqO9s0=; b=ExLY6PBZXWQQUXW7
	co76HxNnxuPPkFz7Ppyjn4+AOYR6HIe4Syv7ut9SjVlj9kkAkX2tIsKs2SFng8hg
	Ave7A9BlGlna27+50r+9KMhTAv01MVIpQ7AVtJaC7Hr+Z88motNFwJQke/PqTrPa
	KShK5VoBbss4BaMS2qNNNQJchb5EkdSu76+oTXtLokloqD8KIMMClrSk2j0LnQtK
	iQ7m6zk5M3xW9IjqCG7wn10ey+t7xdgzMiKeBMM2BVPF/XYG9ts1X6p5K87iHGEA
	VB1NaSmS73mrdH3dHEi1ofCEjgvOkDRD6Lnk6uGqURbYojwVkT9SU9suAQQDDACH
	LIdjMw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u70kqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso2260879c88.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554537; x=1783159337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUj7K6dMrvF23BPs+rj4h3Hu1eqmvsA4UImwnVqO9s0=;
        b=XUlS4eRQYRW2lrmBgionbZRrHhhy6FwNiPjTcJAEUAwZEvlfU/lqYmrIRROGkXF4Pe
         6OB3JemX7mRto3evDSg9dZcPFNtUhdTDdMbWaD/go4gN+c6Qprfr6L2ahlNs5Hb/iKXH
         H023izXAU8I+3YCi8BtI3Z6M3x46iFpouz+J9NFqnHQP0k452frgDwvT6AqduWhviW23
         /qdIcSX7BlhS/W1oeWdqe2qxYk3M+0y4TzfVlqr6VKPQ0utPfJuf8CDVNVp3epJGnVNj
         avMJSmfOaW9Y8c3MPwTrQR8N70Q4OXfTdVhOSulCDMzJmAGxY+Ah9eB+Jm5+PrKyX1y8
         YN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554537; x=1783159337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XUj7K6dMrvF23BPs+rj4h3Hu1eqmvsA4UImwnVqO9s0=;
        b=QnkMagbB5t442f1Jy9zbzs1NKFgS400OGp0Xq2tb4jAA1Zs/7x5oVQqXyMoicWaX8L
         NEATpj9MsbZ/jT0xi1KffRcJ32gMK8RdSvKz+QHSkfH+vIxF+z51gTMKRRGarvCG23hn
         wfWObA33saZFCX2CMeZM0FgxyOI41BrW6dL16TiSLjlUeQ9ROccmLS7AxY4+IPvW8oAL
         rotnp25yTuAr7wLIoyP6fXdzgAkwsg2mDue5RpVilosdzBPr9HaqvB1mJofj4OysNxIW
         7NEGZsOZ4QZLzchSRI6QwEormEK260TkkZKKnZmljtX4dQMXWZETQkdnMdkob2TEORZJ
         b3vA==
X-Forwarded-Encrypted: i=1; AFNElJ9zO4LSNYMAM7xdtAVltWFR+DdBETq8k6+DnnjlY2AEBOciBy43F15Wab4UTqs3dUDRBTWEalXMBzd8@vger.kernel.org
X-Gm-Message-State: AOJu0YwrzRS3WY2WBUx7bROJr5mCjvKocNf2eKdzSPjdK2LFRTWlPJHn
	GubK0CYSGNSJ1ZjqVBpDKvoy7yXOohmSFlLQaTg2+IOVGWpn1g8G9aJIMeRKbHgleDIW9if6cpb
	yfpRfXQU58JOqWLPii/ezMAEgs8gR19YB10FkkOzcuGpqMI/awH3VoaNARRRraLTt
X-Gm-Gg: AfdE7cmPPfpDmIrya98pO1+CGiIIjogZlKR1o8gM2NACVzeMvDXhGUSpx1/xNchnKBK
	/XZYnx90KA+e6i0+6cs3PKQ3QGNY2dUSf9HT+wGPjvXrHDwahruSOjFpuUbfm8nbwNDNX4HJxT7
	/jrYPXDXhxZJ0U/XCwBx5e76/MsOZQlaKYel7HrgZXI5aLClZCJbOVBgNbxfTBynvKD3cFbR7lY
	91mbythUVCsva0aeG2kSRVG+0E8mHKs9YYjVZv5aNzaUYFRYcMfABaVmYLHQ5LtIekaKi/zTdDJ
	PU0aJoqXDsNBxj1XYdZTwgDDsikM7BZoA2RSnPObZgoW+eD/CDrEQUduoMxMSsxz8z8vr0ohT31
	Gku7hWjDKpuumkklAHv3L2R7G+f4x0COpBHhI4Q==
X-Received: by 2002:a05:7022:ebc5:b0:137:feeb:3fc9 with SMTP id a92af1059eb24-139dbb5b2d9mr9728337c88.18.1782554537008;
        Sat, 27 Jun 2026 03:02:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ebc5:b0:137:feeb:3fc9 with SMTP id a92af1059eb24-139dbb5b2d9mr9728310c88.18.1782554536412;
        Sat, 27 Jun 2026 03:02:16 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:15 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:38 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: shikra-cqs-evk: Enable display and
 add ili7807s panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-4-449a402673d0@oss.qualcomm.com>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=3059;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=86+3eXj8NPzawVKtOr8LhIxF7CWhGwdP0TYgQ+HH5fk=;
 b=fWO+HN8Yv3gLnum6chIiDnIRAPcXWA0J0GrIBhYZGw/QnO0BR1BN9SUoqOUvzhF1juwuJenKz
 E0HeGcq+cWmBzpVvBsrYX2SJSQSb3jkLiNBYcdrVovYwuKqT5Jh8RqM
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXxBUAnBiZIjvq
 fCJcUc96baj2kyH+eMRb+XRSAee5iWgvg/mePe53zt8/tegy/rjmBQ2MLiRqaD8l3UF6Y5AJ4y0
 986aCOd7Z4LZipytFajfzgzbUAzoEAM=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a3f9faa cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=urnI3cEPUZYGKLcoOckA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: qYkmQW-nU3Sk0y5Lp8s4rK8eesofMQfz
X-Proofpoint-ORIG-GUID: qYkmQW-nU3Sk0y5Lp8s4rK8eesofMQfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXzkbe3KTi8Wqa
 JbWKrt9mbATjCtAPb57KVz+RuwSFGRNKykJ+HyXG8NAQqwON/36B41Z6ahcA4kKYXcYtKbnUa1E
 gEKZvSQEB2ldmEXaV4na+oMn7xbJixtMbje+BEgydw/AlvBPBRm+BhZY4/agw9Q7SjZ0nAk2sDj
 CVUReC0VZNJ55uqDwNYDzFYE0de9EpEv2xCfSW+lmMZkkpwAJDDVMikCjQxARWkBe/SI3V7qcqS
 Q5ise6EHVAFzvvKqmz+3qFKtr3xq+grLJcot00fbLptt4zmubKTX3ZyMJnAw1bOEDSVau3v8Xkr
 2G2twukayUjUrOcgQxzV3JDkp/9/G38xWJxfVATSE4x4UYDNbsBbf0bzidbH35m1PhvRzwnK96L
 eqV7hsKDsBpNjwMrfE2GHNcULKtcE3lqNinHKHuaC09Fgn18PEC2n/zf9wFIv/O95QPwq2P0HUj
 O0lzCzm2jcwE5VZ8GWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..4ae47d72d4d4 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&pm4125_l17>;
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&lcd_bias>;
+		avee-supply = <&lcd_bias>;
+
+		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
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
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -116,3 +174,49 @@ &wifi {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
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
+};

-- 
2.34.1

