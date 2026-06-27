Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CA93A1D14
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554544; cv=none; b=OwGuPz479hh7H50GZpppoeXilzOh4GLxChmgwQ+E3sQUKH80ettvyd4cUX+NYm/q0ko+I+jduLEUBsUXAAQRVdadloZXbbRSbiO/BY3hDILivnMaFwPKjVlHD3r3LjgUdfej7V+kyCgbJHUG+uYGnyPQBr03BO7HLSHe6Jv0qs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554544; c=relaxed/simple;
	bh=UeK4KDV2zCJzlI5/32AXknd3k1RL9pZDuToVAxaLaNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joXexcUftptKfBJJGZR+BWGZ+e0l+iUJGf0SR2qjZOueiT0FWLWKIr9U4hVTIT4YAJWjlfQaQYq+6YVm2SA42dgqjChadJ2fjadu35GN9ATsL31LZh9+xqeW6qKJYqt0GfoiMd4RCVFnXv8Y6wY2U0S5OuVSlMxqH2KIE5sHRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOpN5XtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFyZ0xgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOpN5XtI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFyZ0xgi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9Zbqo724992
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtYVUAEPVR9ahjS/rrbW/Zs8Qq1WbmZx0IgRc0p0CZY=; b=jOpN5XtI8GITkjB3
	ef69bG+iVRTgSMT4Wv4EscjoOhBlFsaedZebEN8dF2MfGpXiUQuDch0QtwAWAD7K
	fPN5jriLRvRajI/yQoYlpUTl9zxQPpIBTjHGoXcg4DnZwPlVKxkB1c5XH5Hf3sxx
	VhiRqUGXmOASPuLhRYqNpdfeglwCcHp5LNEk4Pr1emU0B81cVCfcvwoPYxx3XkHH
	xvWGTllXcJmURQaPIco84xezyQVy1AS4kqzUaGs2anA0ECZqpBotWtm/GmKF7HIm
	qbyE7FaaA+6X1dkqlN1aDU9rnXaRnWO8R9+1eV/9T9+/s8lod0FB2faA/sMoXkKo
	e+QqTw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6gjtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:02:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139f2c46ef1so226487c88.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554541; x=1783159341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtYVUAEPVR9ahjS/rrbW/Zs8Qq1WbmZx0IgRc0p0CZY=;
        b=KFyZ0xgif8CuW/M86jSQ1LDmcmQgIy7nqLEa+NoCYOrOPjexgr/gO9sr3FNO55R7z6
         AoNzPjUdS9z9nll/cUlKs227JyrwaBcw0BhDmGFatE+w+ovveBgTg6QIIpLHXx5capjV
         JRP7Mhn1gOTYiYDBfpxExbmFo9mZgCqXkwtBNkB/573O/geZmAfutFbfcvYudgYluIxu
         t7OxoVFUlJ3jesEDyw4EknGJwuqM7HyadTXqz/quL86AfiD8dI58544wh0+weAdj3lom
         FKNdP5ed3XHe83wkUpXcok/jvm+S46z4FojuZ98QRb3BM8ZncBCehKZuL7K4qGGCl12j
         BHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554541; x=1783159341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wtYVUAEPVR9ahjS/rrbW/Zs8Qq1WbmZx0IgRc0p0CZY=;
        b=Dfc0KdoC4RP73w/+xl79YfXNIZy0XCq3T3f3YlkEr4nhBYkipryZA2/qD3mhnJVoZh
         qvD9A5EmImumWxtClvA2G3jHQKqR61IoNeVkssXbusKjx9lyMLyB/KogMVKr4bCxqT3X
         ZTGFcVlVsRAt6haJJaedhx5CZ1Z2NWhUTXprROt+dM7kGkG5vOohMoCYLe2HySiGn5fN
         qhFfCuKlBHuQXTj2iwfuUrLSmVrcU2GAmBYra93VFeSVG9gcnDNqgVlU34EsfuNMaIB3
         vWXHkLPRrk3PDrw7YSYjtzAKuUAn8/FlT6efihhMRRa/Ac5zYNxNfpMMRM5G1i1SaudT
         6kzg==
X-Forwarded-Encrypted: i=1; AFNElJ9vcdw337dndUyrMKCql0+x133s5YuEUXosuNDEFRqgwMeIGgYMY6FiIgE86fGfaw0/MF2FckqHat4q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36YRmxFPo+aMZBbl7mXl4k9rXhKN4S5sDJWilU4trj32bJ2bH
	DGmUm8/F+yolkAMJPncBfDT1rbuvBOcKuHxCVnrSN7P/gmJOw6Sb9IjMn0p0Q1vuyiSk6ntbh/N
	wnYAZYu6VaCbgG1hgfY3sW+kQfZ4CioZ3cSCcCdVdqzRUmlYyC8TE1AuPwY/cZjF9
X-Gm-Gg: AfdE7cnoQk0ZjY60OzT7lDENBtDy8HTx3CDu9/FW72R6oEJIwFbS7SxiBvYgCfdr6Tb
	Y769BdRiVg+ryN25IJ/1t2aueu2V9UnX7nKL5afVcwXozqBGSxJzLVBhn0PXWFJo2JRUIm964H9
	fsYCF8i0uEfhcFJIGXT02OKSI3yTd3wzmugZlOyAPkD89qJMnxOIwvxWxijtC9BEgCkJuRt/yaF
	KDlBvYCVNO1Pt6nq0FU7r47uFUSX60zlHMJtiofIRDIp3kxZbvTl3n6foDBqofmAgPGMAKJR3cH
	KZuE38oQ18V2fc8xfJlfSDocFOqPqoQcRI3cqhH5g0ccutsKevp6/qJMJFpSzIFDCfetG9goBmN
	YkbQra+R69r7VYRSThE6WaAan2gZgHB2Scaf74w==
X-Received: by 2002:a05:7022:5f08:b0:139:dfe0:bc03 with SMTP id a92af1059eb24-139dfe0bcadmr4906443c88.18.1782554541350;
        Sat, 27 Jun 2026 03:02:21 -0700 (PDT)
X-Received: by 2002:a05:7022:5f08:b0:139:dfe0:bc03 with SMTP id a92af1059eb24-139dfe0bcadmr4906421c88.18.1782554540716;
        Sat, 27 Jun 2026 03:02:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:39 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: Shikra LT9611UXD support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=3322;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=PGNaUF4uPiP0kFTxpYA7DYuBi0F9EtUmDruUpYdKV8Q=;
 b=Hkgcgfdmf4agREu0MI+plJmhiT08tG6hvbN6NKGFQTG/u/S6uUa2Sp4UXCuozCPQHtG9tZGAW
 GDFWjfZLEKSAJh4aWf6iUi4mQjbi/gnC4MwCrv+pB1I2J0QbLB3+3wv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: 8J8C429Y2ghsrO1-7ccrySMHiKqumHqM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX0Rrb8QiBbQYX
 qKUIkJfrMpLbSmwJX4Vx5OBbMkAOt0f2NTVpH6tvAzt/259Lob41l+HxtCWU2ytQSMtBsyS3sMx
 A2oe+VrY6bNWgDkZ1FeLSxpuaxN7exU=
X-Proofpoint-GUID: 8J8C429Y2ghsrO1-7ccrySMHiKqumHqM
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a3f9fae cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oLo0L6-00J8s2reelZIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXy4uAxKgkVDbR
 Qf6nY2M/ipMQPZTydFCXsWuf/XZuYPDBkQmkifrH2QxpB9JHiFkUo+dc2iXlzI8yK0qM/ouEyFG
 Pj+Z0kt4z6fzRlZwL3HElSZhBhKiAZ18vXjT7w6mbKaiHySaxN4iVGSB0of8lcLblednzQXVS0+
 DXWTU21N/QkzXeVC3OP9zRBsEof6+IlQPGRsVINgsyzz/Q2Iv5/UkCy5htHv8R7Xfn9UuXOSP5z
 +kVC8m9RtkIxKj51dhQxj3jXpm7JPys6vgAWE9DDuMQApew3pS7fCYTUy8TLREuo3PKD+eR/kZj
 RcC1kTboXcQOd0opqpkbzTiSulHZdxjiUw7q8TbyAoQz+nAsL6kr1cEtilnUlNqxmFr9hoHDNU9
 PyIx6Bei/UzasNyQkyUYNVRYzc0wzwWQ4SZIlDGmIXK0or3F1RhASAn64K/5aO2yj+D2Tslb5Ps
 0xS71h7vjx0reIKdOzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Device tree changes to support lt9611uxd hdmi-dsi driver.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 ++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..9cc4a1c6e4ed 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,36 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	vreg_lt9611_vcc: regulator-lt9611-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_reg_en>;
+	};
+
+	vreg_lt9611_vdd: regulator-lt9611-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "wcn_3p3";
@@ -68,6 +98,78 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&i2c4 {
+	status = "okay";
+
+	lt9611uxd: lt9611uxd@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vreg_lt9611_vcc>;
+		vdd-supply = <&vreg_lt9611_vdd>;
+		lontium,port-select = <1>; /* PORT_SELECT_B */
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+	status = "okay";
+
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	hdmi_reg_en: hdmi-reg-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -103,6 +205,26 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		output-high;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1

