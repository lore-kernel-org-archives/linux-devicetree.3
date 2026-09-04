Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F894A0910
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519426; cv=none; b=u1eYXzKIRm0UmfLeIIQMsvkhRU28pkSpcrNIPoFWO4rwylYDTZJNyrvBxDXhI2JizoiVUkh7KdzF0NjnmY8cpvBgKdLvlr435k+Q1a3dbhb7XWOKj//J+zO3H91eEf6RNe8kh+LiUJIGmlFrBp2gYAm+TvdgMg5Yw97BF8lNyoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519426; c=relaxed/simple;
	bh=MZqF3MAw9J/pRIuej0UBOLmjYc68H0MFiS7705adBrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8stAm3lSI6BijLQrleTtirOfOAMBu6kKcYOr5z0oaHoGw2IQrjmQP75DEtw66nwR+/iV7vz5ELl3URHIuEbSj2jAS3d0Q6UuKkXl/ObmPItIbIXin4c/8Jh5In6qJRnjjlNZLa1sggbso6N5gF/dYn9mE2MiXObWS4Hre+hd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U30NTcSs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U30NTcSs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso8430555e9.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519420; x=1789124220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDck5dyPbEcs8AIq1PZOLCdZDLOrQ/aMw2N6w24E794=;
        b=U30NTcSsbPTWMwmOs2cNU/F+t8XBLqfTuBV8cloafWyUy+p+v8aSKza/EIhIEFK/29
         6DL/ax/6HzOLe4I0+Ff38Jy+KITkaJKoxbhI6xhSC9avmPMQ0TYC5bsHkG0B2gRW2l2e
         yQtNUAJzLnlCK8PwlwQYP7wf5FazI8/Sn9ZBiac7lf+GCpMDwC6jP+jS54OPN76gZkoK
         LEv0ftnr2dRcPLSX8RHTJ3OVs2vOxbELuOIJQYnwOGQqRKlnACmVa1ESyZZXaNDwoBLT
         Ggby6Tk2c0nbt0Nm2vbRvP/6ocFsb45gPxi+h/imsFlo0ZN4XvdMqGKXSAGZskoMJY2Z
         fZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519420; x=1789124220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDck5dyPbEcs8AIq1PZOLCdZDLOrQ/aMw2N6w24E794=;
        b=duQwx/MpnaH9s9sNRG8ZsMfIe1LFxBc137DHFa9O8gfDiZNXtabIlU4UrADqVC+sMV
         9Nn+kMxuJxJaIb5SxBDGYRLbcIYRaaTqzsBZKOPPaQPUlflUgM48qAbVcQr0tZk9LPJK
         hNUxj3urNN11u4r5yuGfRtvh83FiIcrrfMsqcrLGm6V5TC3Uo2onyGUfkZC/Y+7oeEP3
         zAs5pCRw17TyD+OBbTd6bo7x/7PngZP5AYir0r5jAlf+Ct4+NR7QZz4M3wFwYAqu/+TG
         GICo1mXE9fJsapD4idHhvnpE52EgbubFU+W7zl7N11+9yMx/neSHdRCtIWrJqA/jb3mv
         Iy1g==
X-Forwarded-Encrypted: i=1; AKwUvBz972gzJL3rzWg4t4OFVBHqyD7BGLsH6UqiappVQ9xNfhzlntE+uYHBwnCRbxN26L/BeFrHB5u3A4MA@vger.kernel.org
X-Gm-Message-State: AFuF++mXTJ3s7TL3AEpuyoyxAantJx5t9B3EMB+5L4InVsujyzo8CWzS
	GAXNJHV+mke5Xk0Ys35Tgay7Wwk82jZuKT09p1pvwYfzUdGcFRNQF7CxFoNGgjLJcn4=
X-Gm-Gg: AYBFou3Iwp7hmqBH8qGBzmceAnxlvNx/1GQhLzuPtL6zq1w1eUgFfTzpoZwiY2o4Emj
	eWKWm5mJO1FC+RQEHJM/6LkCnzS5Dm38cIdvcK06s+1CAF6Njc2Y441IlqRzduMRYbdYSoY1vhE
	jkgD+bfrZxs4ejXk9kQhKOw+GmNOQ+HZkTPbbuFXeUG/3fAzw5kamN72Sndod1r+kfWEiP/freb
	sSR/hDWp6bK61SpQZfUC7J8gm8EhcxYrMkX5rNKjFKrKIlATm9jQuWKvybOpZfo41QPg7/K/vMD
	mFNnoGSo1Ppxifd1/1GJZ+haIvk1Jtygn6kTbKlKoTxwWBiDL7jNse4hFx/zKodoPMlfRpXpOas
	F5CCNG8obR4CKE2aN6wzSl0jlqYdFMGDNkx8clThNWOivHKHYWcxsqiM/RteiVIV9A6pSEr3lHi
	amXDAEUL3yH1KTA8hO5YqmiHxVEk4UhUSDg5XJnhTDPQEAAG2ksS4Zpzt5D2KL8Sw9Mm4gGVch
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr90766245e9.16.1788519419688;
        Fri, 04 Sep 2026 03:56:59 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:44 +0100
Subject: [PATCH v5 12/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-12-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=MZqF3MAw9J/pRIuej0UBOLmjYc68H0MFiS7705adBrA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPpAJUpSSoa2NoNWmj3rVgiVkX8YWtSSRIQs
 /ghhTjN7P2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj6QAKCRAicTuzoY3I
 OiO4EACnn8WyfGijHpEl6C2JKTfh6pCAt/uEXG5K04p4GTF5r0T19zw17XrZDo49M+blZSfEp2g
 UXJyHEbaJ61eBltwdYzDVZIFb0zUthY61mVkOGC3bf6Vrs44VS7wvV4LmVD6kryR38M6RV6J9Tv
 gOGHd2vQCJlPeV5Mvsie5kjpoawANKomVqNFcBoCn3pBp3bKDRJLzQNF9eycbcjYegsBZ3L8w49
 /ZpPq3T6iLLmOv3Wb+qIdh/0TEUQdLnJ0Wz4tkgyohT1cLe59qgVZjUX+CdgtuHl320i9yV3ilS
 S5GUEJS0bijigo4K4iuOg7tiCMsxGnCYnntJGeClnYuZpnBU92mLBL3kFO/C0rM/QhicIKCpchF
 cJHOGP8sAe7P9j86WikWFJ4eW6f50N/uspXxutc8cwXa4BxdCAOa0pcgfbeRiKoy1mfNwG2v8rO
 vTks1I3T3wOG5KwItTI/ozaocc0bAFC9eLSnTi6t8LG+N+r60rw7nL7K18vpQkuhLkfHT07y/RF
 93oy8piU655iOxdkv1sasg/dpaufeGd6684S9ic7UP1yd0V7qS2uLXTi9sZnKH2Pss8cbXcaxYi
 yZIe53kfZl+hdrN518DJ+pOKm7iibbRT2s6sI8Lua+mHVLNWreM36cMeo48jz0ISN5C2lv57sdD
 Xt6BzSrxFh6GEpw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index bcf3e2f610e66..216068cbfc909 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +864,89 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
+				data-lanes = <0 1>;
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
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
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
+
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1410,6 +1494,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
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
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.55.0

