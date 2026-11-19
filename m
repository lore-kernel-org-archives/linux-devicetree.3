Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107274;
	b=Zw4PilVQvJ5OPsnjz7Pu3SZwNyZzbqUMk8dyl1dYVZOarmrPCV3/7FewxZLAo5muKuRZ
	 vgv+h8XZQk75jpI7EzjO2pYZ294fdKFx/+DWhcpvlLwJXk3Fly+4IXGEoh+IQzO09NkRy
	 kN/Y+UJWUj03yqKXImPJ9y0IN8rUekPrSbA0a5VacK1AsyeXH0dLocf8Z6m1j7f+DnEsl
	 7blUMDG3cECt48H7VAFShH7bwdZSTOJIPqyGubWA1Koq/+EMBafeQMhA0ADYw/t+iFvX+
	 wre3ZPrDmcq7JvVSz/N7/0OFQozwikLUvoRgrCJd/KdugGwZgAyQcftR0GrVFhi0iSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
	b=gZtP33tJ9RWGGtENQBQL3FEYmHp51USxceH9st/TeocwjKj+Mk06mYdet46maYKeDwdV
	 O3Gfg1jrcRRtsYeTtCZHqum236Rf1JZNiIS5JI9UXM+Vv9Z0RkdZ4CDiPFPRT93OObUcd
	 BCYCJmOFCx8cEa3W/n3kq4u3CYhDWqTh4dOFGZXCBz3FAlz0eH+6MymCfRjsYnwaLD/sN
	 gwWf6f78LClFOGXm68VM7QplOOJSkeFrx2jweYOBrKte1t6Ptbt/ek6Xj0G4cZDY7PXlU
	 dVDnsnFyL0fQs6OZEz40eTQwNsvIw9y4nuJymT8B886mfJOLBPCg+ZiDyZ/9YGD/Lvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juhEOwGF;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45760A5BFC
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A45760A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juhEOwGF
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1512399f8f.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107272; x=1795712072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
        b=juhEOwGF2GOjxoXtmjs2wXb9+vc1RddKdvLf/LxnA0U+tZF2dd0cGF0s07L5ffEOWJ
         h4LKn62uiKSoqVEeqMnvaD+aMjk40J3zn0ctuFQISREnxJV0NphasYOXXvBl35yMvtey
         mwHSYKhcUkiHIIGinJfvjQuMHKufDYa8tpA/QGGslQhw/IaeX+ZzQUTPn9ICizxOENbf
         oPA8kDxf0gZqOt0n18v8pvMKVxK7TpJKlFNPOYjOfxWlrp0ngsZCoYs/cdgXK7uKEklF
         WiflhUjEAc83kAny5N5Y9O5ZfB1i5Z9B1GgXYh5RP0Ho9VQpIi7+POg/jvs3ZMpdWNfI
         49Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107272; x=1795712072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
        b=gefdnDLsDVHFot/qt6ZtTCgDuHHYIWkL90jm5lGICZCXC4A99YJM1hHJw9fmIpn54q
         oZe1gcci5rAg48tBDIMmZpgV3msmDGsEROsuDY7tm8mMECWmo9y1dI1SZudySg0BOiYB
         B9l9k50Kc88Y9aiIz6OKwF7AJqju7b5lClKcFmn5qQSxKZ9kN7uBRAg558OxaXXcAi9y
         XUAZ2qK0u8F5VaLpY4Mo5fCqsRHXisK7X/KRhDPAKSKb2Ope+qsUH67ZBZzN8m2u8pWB
         PgcDB5QHd2/DSSMATjg7hDSnnkmMnJCXaD/hCdT0WSN7yKLca2KPojOGQSxCQa7JY9RK
         7vdw==
X-Gm-Message-State: APuU4Z9w3OBOIF+oncI4MTPQmLw34Py2dKZWYFAnNAQhxuuBcwUpbqba
	gASf++zprM805daYA7toAKGQU/VGRvrNzF+GD0zGe7j8zv+YwIyrVAOz
X-Gm-Gg: AYBFou1jA3Bu5VTLwNGzb1u++28oEH7URMG0UCJBkbWQ6mVuVDk1WnltZXetlUkNJ5/
	nUo0m9BFFW4+Wevbw6UeH43tppqGDpMPyPv70M71n48nbVKiV0ru2eRyZvEA+0xQEWSlxRQglNO
	LTSEEkZoAlrU03hey3vtpuI0Dbk4mhMgjETX3QDY0ad3IkrwIYGZYSFULYjPGSeRF8zg0SD8nCN
	IaZZr/rYMjwH6BsiOl1N+1fG3Kke152oRYJA5HNoVwS4MA/0i1GQzZenIPtAENMiRN+Z/QxHPUY
	PvalaC9JGxobft2QV92TqnyDF8rwXUggXKFU6fg4bJaMgRxEim2DQzc+F0e6+xd/QrREROGxZJw
	5MYfQhrRE3VMiHTCBqz/exbAry0XA9loqy173NZamRioCuuuGgkmRGhbqXyne9p5F27SGD6C3sH
	55FlSkm56kjYWTyVLULd4oH/oOK4ZBasVl/z5cMAes816TSAHthSmILM2IhBzRir9sq964JEOCv
	UePbToWq6LkwUannxKW5OG+dKAk9UmCJiKeY0f70WS+tQGAY++ylnEyo6n3ROxFax5zVBHZ2/Fl
	FCfvxAB6pR9V0SkMnydYfymdGcVNgMZ9MPvRDAUemrEe15CrggnAqGYPvkX9Dv38Mf4Uh2k+9qA
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb8880767amr1755525e9.9.1795107271789;
        Thu, 19 Nov 2026 08:54:31 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:31 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Thu, 19 Nov 2026 17:54:18 +0100
Message-Id: <20261119165420.24466-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

Describe the SW42902 touchscreen on GENI I2C13 with its interrupt,
reset, regulator supplies, pinctrl, and native 1080x2460 touch area.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 59d6c1518a469..160b6f4c98b17 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -107,6 +107,24 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reg_ts_vcl: regulator-ts-vcl {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vcl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ts_vdd: regulator-ts-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm8150_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +479,29 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@48 {
+		compatible = "lg,sw42902";
+		reg = <0x48>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-supply = <&reg_ts_vcl>;
+		vdd-supply = <&reg_ts_vdd>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -580,6 +621,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart12 {
-- 
2.39.5

