Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609997;
	b=r+Gz7pv4xT/mmY0ZevdIdzF1rdRVkXtZtOs4X7/vjSQC3Xgr6tNI+AqARTiaRlP6aIU4
	 q0NMtPuRyuKVCXmU4Rf4GLluLSg8dkYM8DcxR4PTU7oSZiy2n5kU4fxMm3vwkcGPjRCkh
	 V/Di6DWxEkmrOjf+/Wps6JGj1KhMd1QR38KWdw+8jFl4xLZOxrzVKY/Sj4bocM1LVKZwY
	 Cp8Y1mihcO07x15Ef9prDKZwPO1vnfuvtJTaXKX0MO8Tq7X+nPDHp914tw9GDp7SStdyt
	 laURrDhHm06z7gsbmNxiOWyjDq0toW3XxGr1s2loWhyLq7t8CYwbKsnKj0shPv2RIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
	b=ztlPNT9/Lr1Bx3IeLZLie2H78hkfK3on3XU8InLZwiysaPfp9Hqat6XDRCNYCTZXNoH5
	 9SABCs5LkjWTX0v3h07iIz9s81eaOmBkCSgvyYPsjG1MGMOTwYIWlN/4pwI2mXKGpkp9B
	 o2yFgV4+Tp3uVfIHB155R4zxpMrmcipIaT18IVDTJAM5F16JoAj5/nDwoxOWpL4KAu+l9
	 52SAtSq/i+sfEea4lbTKOVtgSuZC2ApBVKVt1SrYJiYUgbVi2Jj4tOvF/sRyGUGah0d2X
	 NHMNweRqYwyUAgmTXvYOJ/xX0GZ6HjnLzGFl9G0T40oLLCiOhsH+ruDZHF1QeQ7U78w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qgf/rxEJ";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF9606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DEF9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qgf/rxEJ
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso3468882a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609996; x=1796214796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=qgf/rxEJbxbQk0k4cDRQ2CUScsPmBOb32E8eV7SSGbTmDRbgYCKL+rs+qu6txu3x7S
         cjI9087SNrGDsqNfxE7Tww5wmtC89VG8WHBtct8fjTrDhGiSrgUzWq92HybFy66Q7+Mh
         7sLaY0t19HW9EWdOuhDlzCjKhu7VJeJZlX19RhOvEmTfIxy0YdZ0cg4oZddsm0G0wbyl
         I8wjsPiXsqdS4IV5HSPD2d9HiAm/91i+D31wPtwHpvD+wyjmVk5TOzZTRcB2sCf1BHI+
         IvmHh7ZTosiAVRfVsx+BQrfehi6Ert+W6ekLsS8rYMVaFjKWiLOh0/4JqEmJZn84vZy0
         5WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609996; x=1796214796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=22j272wx5RBFbrk19N4tWIqrj68xMvf9SwBPiktsQ97m8LeOLLiPpjRasYt75p8Os8
         scYRG9qXpWqq8wzCCqB5S7CoYY5UBUOmsvzFgrabPOiyjZ/TRz/6VZDX0zwc8wSmHjH8
         exL0a8SCER3dt0QJN8th6za6ILVBQ8Edd/SK3a35AVSGGar8bE7Yb9OivULiUUtJyP+5
         dMhcn69LJjh3lBfz2PFRINN0CBYKxXXQJ1A/2976eqdCbQMTexGpjqWf7OVfngC1vx/0
         ISN1efegNfLNs9ymq+ZnCXUGTJ0ASkRUNbFBo++mc7MBFDBo7yLM4KUuoWHJ8b9SOYbx
         6f3Q==
X-Forwarded-Encrypted: i=1; AL+hErG1n19G4nHAa75Y4t5XUqbrM3OIe+Cwo06FSasqWGiwAazXAxnQtYf13tTcvBfCX31HQqeC1WTDtZuA@vger.kernel.org
X-Gm-Message-State: APuU4Z9WApHBdr3var5tsvYfZcJrMw4EI6PjalYpMgoy0bUhcGD5CS+6
	68GLaPUiKMvmFfpoPyRIk24IXP7HigrJB5FTUVE2ZiV9VL8NDSSek7w/
X-Gm-Gg: AZFdTZeqPnkep2xkUbADNZIUeYDXCw01YxhqkF76gkSH4zuqF9d5eyoaw6/z+TEqI3Q
	+2jqp2fmszMlD7tAGk4AVCzZlKs44/zUxahuVNehX12VyaxjnhUAYyTtzhcMe7ZzogpUMioWjwI
	wb60uEX/MouqVrJQbleejLkIqnWnuFSQIqSFU62y0FnNvIaCKW+JlI5D7Qhqy7aWpv+Oy6WzgcB
	oxEyCZecP1DZjsJaqqUkEfUnq+xRd9RG/1F3uTuFoQjAjeqDV37ylhN3aDHFJ/d+VcXPQUTFUfB
	vUC3eC/e6xzmIqSK0x8TZk0A2YQpea/VcshnYNknL8H1caUSwO2+DyO+d+VPubSGQg50twy5iqf
	R1yGTMh4nLsMyu+5txyuT992s3v6UtdOaoK0nVqvSarcs8lVSTr5Fb0zidfaVkq6MzRXbJ2kcLz
	5wNsyKq/74/l9kOShlQlqiP4//NOw7Q4yJbJHKm9M+3W1VCa8VDUor6DaRgDl3U7F8RqPHHZxWn
	rM/Sk6+F9sVm2rtIm5aFjaaggQceYspfqxugXSgcDAMJTSZ2cs8AzEJ8eT9FZBx/rqdKWr5xHfP
	bAzGW58bAl2W7Cda7HFKgr3y+b8OPD2aOg4nif7E4i5Rinp7cUFJGOquA3wdpzi88KrU
X-Received: by 2002:a17:90a:e7d0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b41cb3276cmr17251989a91.60.1795609995742;
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:46 +0700
Message-ID: <20261125123146.379057-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10

rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..87db6b18d191 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+	vreg_cam_avdd: regulator-cam-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam_avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&cam_vreg_avdd_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&camss {
+	vdda-supply = <&pm8953_s3>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&front_cam_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_rear_default &camss_mclk0_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_cam_avdd>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <216000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_front_default &camss_mclk1_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <90>;
+		orientation = <0>;
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <418000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
 };
 
 &hsusb_phy {
@@ -154,6 +256,7 @@ &pmi8950_wled {
 };
 
 &rpm_requests {
+	vdd_l23-supply = <&pm8953_s3>;
 	regulators {
 		compatible = "qcom,rpm-pm8953-regulators";
 
@@ -302,6 +405,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
 		bias-pull-up;
 	};
 
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_vreg_avdd_default: cam-vreg-avdd-default-state {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ts_int_default: ts-int-default-state {
 		pins = "gpio65";
 		function = "gpio";
-- 
2.47.3

