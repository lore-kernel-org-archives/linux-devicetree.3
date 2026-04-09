Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD433C1BE
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765934; cv=none; b=UYz6nxeFkxtkN4ln0Nrwk4T0GLq5hyoa4c6rpIO6iU+notKT7+TcVKBG7oz/wBV7oZDcimTqzqNcy3RkPVNwSDGdJzu6tlOyrRqiUhdE7GD27NKIC6ufA0YxyEhDOXHwOTS2SuNli/MKf7f9IX4OjjbAMoN2KINZgCFnudGMlrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765934; c=relaxed/simple;
	bh=CEMFdCdV787AMyGI8dxLrCBGALoi2KygjN6kKW1f9PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8X7MFycBk0VUr/twO/p1qoYRlBOK55+rrM6zlQqaz1m4CZ2LdnsgpwSdO08lRLGaUfdvHE4htkzQnaJFBbFgq8zt3Yuba83iQ4moKL+5Q7jORhmkrnibe8PByhb3BbcmlVetW3Lp5qKhJsRd9pbMnVn+V2nn1ytFiLdYXhMVYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQxcPmoB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQxcPmoB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b2589c26e3so11990215ad.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765932; x=1776370732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wsop0ED0cxBTgOqfG4UjnGPiOWr01DVPoMWtUinONWQ=;
        b=qQxcPmoBABwfSz5RgHZpW9kh2PM0/SxfV5/sQzv3xuc2HW5GN6Vz6mb6dIZkyTw0ss
         n42HvXZ749d8yLV82mcjKxlcF+HT4DuDpr+Z1zQQQWP42l9xau3ZNxio9A2AvO01jrIY
         HYTL2VkgcGY3G8deTRriHJ4JsDsvGeZQLupOLVQ9kQVnhrOVFPnjzC9Q+RcEnINSCva7
         vYkqOOEc+qVBouLEM8v7gWWtejY50H0sPSg4XOS3MfH4LcgECJWS/CKEl0tv6FGIaS9F
         H870qpVPfhiak3UWjV1Uc4u8//KKlAgfUpfIUKFQRWoJA0bxzA3OwgfaI5iS4rAgo79W
         vQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765932; x=1776370732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wsop0ED0cxBTgOqfG4UjnGPiOWr01DVPoMWtUinONWQ=;
        b=e4Efr9SjjZLLmFF8f6dXHXvjP1DUZpGMg+1Tigs3M/0ZqwulyGyp1zBOYNBHrgvZi0
         FTelSrWEJm4xADfcMesHfmrFU7LouewsP0OU9V/FJ8IpzYgPDt/o+g37sZgduI/jMJyg
         R1ak2TB/AJe19gyDCGmchQ397qftl4uNM92pGhdZbnryCXKCjq8O3fzZx2U16VaZ9g24
         92ss+WLkiogK69kFSekKlaxWGnzMT7RnlnRZzk4HnmExivUvGYPvUJYjHSoZcgcHZLMy
         SKIzQoUZUxkU1Z49XRWH7ni+zXpwzj19rpuAQMnt63VOJF03agSM/VIYJqdWMtrEJIFN
         b3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWLn5u5axXPM+nYJBVcHBWXUbzIKMzVWjl5VJ/Qnk1+9RLJoqofxUvU07hHkxqv7E7GcAcxxop+naiZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ElKXeiQd3SjHNdZZy3pDBRRBoX9FgLFvtb1UU9NBhjCmeSL4
	aT8Kt+YiqA9I9YhQqTPJtV4UmeWu+tyNS5rEglsrTX24l2Be4C5WM0wR
X-Gm-Gg: AeBDievbBkInQUibapZ0d8vcpNcv+lyovJ8wgxASMRI/LITxvqpw10027Y9/TKsEbvN
	IaN0j2zFOFNeKgxNEsDuXjgjMGejIGfzJm96+PA6BeuRnqPyEmilY2s+GJiJhPR7cQ32n1tQNTS
	M0CfG+InAF5RlKiiyy0Zuid7yrMPPPwR/cCnP+1rLv1ptpPivda5jBrVw0O9WklIFzAhuik1w4a
	THrG2qwiWCTpUQKcCyldd8npYptxadnUvOAajfqx/AbFHOTApSXdRnV/fTLy3qqeUukTKZnrK7h
	KaHz6h/pVSh4cWYXNyX8gWwImpQlsbDQAkXiKwIG+OJKlqSP3r8pMqr6SmDYx8HY0q7/g9iVWna
	o+ghgyZ3905X6W53AKOJ4rENAp7KnHjUSGbIsWTh3JYPh155m9yyJ/KkjvbZRQm+90wAQoZ50gU
	whwo6UAnj+NRG59y4zf3LhIYDksHAqy6flYkFJlfinerj2ExnZ3y+qtJZy1P0=
X-Received: by 2002:a17:902:db0c:b0:2b0:5cee:c421 with SMTP id d9443c01a7336-2b2d595b645mr3329935ad.4.1775765931621;
        Thu, 09 Apr 2026 13:18:51 -0700 (PDT)
Received: from tomriddle ([131.203.184.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48cfdsm3895425ad.82.2026.04.09.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:18:51 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bod@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1e80100-microsoft-romulus: enable OV02C10 MIPI CSI-2 camera
Date: Fri, 10 Apr 2026 08:17:17 +1200
Message-ID: <20260409201717.108169-3-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260409201717.108169-1-oliverjwhite07@gmail.com>
References: <20260409083609.75341-1-oliverjwhite07@gmail.com>
 <20260409201717.108169-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the front-facing OV02C10 MIPI CSI-2 camera on Microsoft Romulus
by enabling CAMSS, CCI1 and CSIPHY4, adding the sensor node and its
endpoint, and defining the pinctrl state used by the camera clock and
reset lines.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 4427ecae423f..9e910813fa48 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -918,6 +918,65 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l5m_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
 
 &i2c0 {
 	clock-frequency = <100000>;
@@ -1493,6 +1552,22 @@ wcn_sw_en: wcn-sw-en-state {
 		bias-disable;
 	};
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio225";
 		function = "gpio";
-- 
2.51.0
