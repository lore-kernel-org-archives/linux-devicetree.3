Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2A144239F
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704486; cv=none; b=JyhfPEnpH7OznO7Rr0YzXiKeLR/H7mCWyK72gTU438Ju2DygLwiF/DIJWDFxYt8o2f1mCDiOQrkbo7/C1py6R7B/PcC2to5ZTfz1d6bjDU73HGFXLqsgyM95R8wFTPZY0Q+u0TpQ5fjN68PZzRQKnoOBVkiAA210M1Jh/lyjRMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704486; c=relaxed/simple;
	bh=1VRTsFTC60/G1pwCAiarEZqnPYpc9Gu4FPipcpcq8v4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gi1asdVqQ/NGdMN2pVegoMWMVp0QWAzttt3QG9LqabMV2XzaaXYAITvv5A1AnWTiqEKqiVsuSFR1DBbH4vc6yqr3m4l8BAxLu+lCTMKPNX8nBpvE35yPR9Y7jdZO3uz/FvdJJIIkmc9a012/zE1W7H3CHYVNmgJN+WyRAMPgwfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x3/CLJac; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x3/CLJac"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48436251906so2952016f8f.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704470; x=1789309270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Jtqyzfy2nqRK3ZFnq8BXudptOX0yjTYtKuuyiqQoCU=;
        b=x3/CLJacPauYW6dnnY8iQgLhgUA6vSE5LPBbhMnz/SasnCGUl/Q0Pa12nwG+s6IAKn
         1IQA1nciSlfWK/5/E94V415sEQYhQ+NgbFU/d9l+LW9hgNAHie7Ux/VDaWHLrdCYFK2/
         m86bsCKhTK7MLFajkfECWs41Yth87rhyXhwJ23z+QSNa4Z4NV0SmE6e0e8F/V+sIBALz
         ApaK2lVKqivwWrOWF3Agw6Mohcw45L+B1oNrY3oHgiLgOUBEX5AMOYQLW5GRYwSx1KMh
         UzWupipxeAR/vwuwNMZumqBSwZUFYzOjmJJsjNsI2jHPsXnPOeN8Q6RwPJ0Uo0wpndEe
         /u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704470; x=1789309270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Jtqyzfy2nqRK3ZFnq8BXudptOX0yjTYtKuuyiqQoCU=;
        b=HR9/2y7xgQNjr/ywgROJQN9kuAFor1OBtvTcA/l90guFFLgGrg8Fi9eXg9OFGUXkxF
         Hawstg8uqju7vjruVbSPqOnv4WYEArX9qxaaZcxXWE4gUDOrWiC8ndOp9NdEyZkxeTpK
         RGnP6HrzPoR71EHAVXgZ5waS+DW3B6uay6u2In14tBZBmUWFLAN0LtZ4PB7WJgCjcJ8B
         sD+kpz4Xs3C1qDmfte9lz6sKSgGlvAxOUh8qXHL05dAThoebG48XkjuN87sSC4p1Zc//
         rjJRwY9QgbIiw/I0NZjRs/cEUSRGtIvu14MDxTk6rs2aGs6SPq3fPJoEoATE0To+KgsQ
         aqpA==
X-Forwarded-Encrypted: i=1; AKwUvBzruYkqJViI3I5xASge1fYA/ulSO3icoAHQ+OhdgEiaCzQU/LaWHSO5YUz0EVSOyQbJImNVu2z6eNa4@vger.kernel.org
X-Gm-Message-State: AFuF++nuEiz7vb0eRyCgd7J833/itM8GgPeTFZILHDdc+qlp+GT/ufu9
	nI0DyUSNPGoiLj6a+7x2WU6rNaF+DMwBSCqYDxMpSjEAD8dkpTT/a2rHjL7xf0uPblo=
X-Gm-Gg: AYBFou3NaQfoSbiTXysCFpviF62VQUpzditCukq/l69Ispp3rMJ8zAFQD9X82jDwyxm
	YOkBIkbA/e1p6Noem3wJyfphUOWwy1Bj9WLVcb+5CyYSPrJAY1gZ64CvVbHILk2aRJ0GEWZLJEX
	RFijUL7Tq6iiNuLAY1QHsiazbzWYswJFaeTpJpue9ZedmbNY5J/1B9qhSSv8qlXLYol+H0ADQoj
	AKPZv/LTjYwUN4C+5mVmwlRYjwglw0yKTpKtTcgWed82IgRl4Lx7e2YaI4hoEkhhTj4CqDy/HPK
	K3QwQxaaw8bhbtejfC9WvGSIdjMnf8vnw0Luc6Xa22zFlk9k9HllBXWDiGXsOx/9RZn9I7Tq0vw
	XQRWt+7XAWEIqAWn6q1Bv82vqQfhwrOM2BNuWDWpuV3qCMHd+Ewq38NK7w1IyCUylC+3ydNJgGc
	avH3v1kaXPlyb2U6PKzQsswMqspc39NWgtus0SFo98FFoFXRGCeTC5J2n7wxRIHe1+x7n4NkjJ
X-Received: by 2002:a05:6000:4302:b0:485:96ac:5a96 with SMTP id ffacd0b85a97d-48596ac5acbmr10210170f8f.16.1788704469823;
        Sun, 06 Sep 2026 07:21:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:58 +0100
Subject: [PATCH v6 13/13] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-13-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=1VRTsFTC60/G1pwCAiarEZqnPYpc9Gu4FPipcpcq8v4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbE/ag/k7Plj+bNQrX/aZahvQSGYmI8kklHl
 NJnogpbC2CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12xAAKCRAicTuzoY3I
 OrhJEAC9Zza/Aa00r5tDYO/v5c+fo21iPnR/SFt1M+b3HqeHiP1Owvg7UH8gis8bzXwnJ22GRk4
 Oxddw0cnEx4OeHSGUEq8HTXIPQSW/hBZLD9qhR4ZrkS3MZMUA6VNoPo1H6COBLAD5G13Mvm+clY
 hvCh0HPtbdL3RpKZQW7br0LM7+864HzCgX5aGtfJZgmhFlEBE64LmBDkMQWqigBlIvepIEsqGZl
 UbD2ldCrF3a8/2W9f1J4XvyNd5YyGkhSMqwEKAv5zzZFOMBm/KIMjYxMrGhztkvr7M1SW6Zk6d6
 7uI9kXbtuTZcK4QIxSfczEdYfdnNfO35d2ISiCiZ+PpmlYL6f4/h7zNVJKNY+8U4WEYbTV6GZPu
 71gEQR5ACxtf3FdhgnqP7UDf7X6Q3DhNQYynTvzxpqcw7+8Nqsk2T0DVfSTXFkmzs3aRvhLzom/
 TzXAvGMfanHYNiEceb3Yp5/USeyKi9807rB1qMe1k8ICxJ6lHhIComylsr0KAI3lDvHXnBhacJz
 4rNWnoI6RXxgU46KgpbPBa7/BMM4zDwoT8/BsFme7WrP5J1jLwNOJ4oegEEzEuU+/BApTmeNalQ
 DHYH1/Ax7sTBg4Rrwmyks+T+JSb0p5QIy5W4Mj8W+GvRivSd4aciWiQLs0ZeMneSTSQy3sZoiDK
 7EJIJ2BLelXjNPQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c7..ef20a999cb6f2 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,87 @@ vreg_l3j_0p8: ldo3 {
 	};
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
+			camss_csiphy4_inep: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy4_out_ep>;
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
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
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
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

