Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160051;
	b=TuC7vbTGS3asgGITO2HzfewGYcXJrvRapMfL5r8WD+F8zHhLvAKad8QwYNUBbG0X1tSv
	 /R9kSsnYdb0DChzxSGBKQFON3UZ+33xfwautwlVgcminDeHgzzdaZpuGUd4cBjMjyDJ0G
	 KJjMFOe7eu2Izq8k+keRUh7tov01CQv2Fagj1VLkegCgbwyxurPGpOv15KGGvC/Q2lGtN
	 a5lgvO0inT4z5PvlKqnXgVbqD/yv4pCleFBt5dyX9XtMJePRxysA8u79Ct+ORJjmHFPn7
	 lSfbnP9rbKgjXwYo6tgJb2MAdKuCHDT7zBM1sGARPZT6M/rI18MLD8+2VCtoXvRGzSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
	b=osGHwBS74L9nTGLGgUCi6MFHjtYKWI2Kgk2nSMpmrssAo5tbFPzT9+7dzkBtqFSkcUME
	 m1EDJNXfqwP1wqPNK6hqV+OrGeppRbSZFQHZym1YRx/bTri55x+X0s6kq09JEIcqsPmJN
	 LeC96MrL+lahQO3tQwQc67LHS9TiN6SvpOzyTIxxIKG70ko91/ClBohGvtzueGwOf4cYM
	 Q8jNHtMLQ9KgfgUqUkSZcK2eE5VsiBbARAFBQDYgGTqJh0UkfBmxs+mVhfEKQF3ljG7gB
	 eKjU8AwSs7VgQ8On2JOpe6DkUnLF51v1+khRjpbIPkcX6rfIddR7Y723733HAYeUrYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM4EwaUG;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB060A3803
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCB060A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM4EwaUG
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb606491faso2555125e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160049; x=1795764849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
        b=uM4EwaUGJ3db/pFbwtIa1AwHXGzh7FRaXsI3Exn9B+X7Y+75sVIT5aImQsYlqQAktP
         DgaBTApC542QL9npLpxxeTVf74R7zjkF0/m3xwM7xwescjyqHBWPycRakWxowLsZb6pX
         cGrY63UXSZ2H2NfsxAY4yq/X+S/iYRF3tiEce/necRond/IuTh8tOFzJDbtLj6fzPK1U
         MAKzBfqdFT2WqL8jMV4JsznILSHyDzkawPS8nssGskfTjuT9GGB1tNE4y1fIaSqBcyk9
         SX9S2XOPB7yHp8jDZF2G4cOaKS8o12dwoejRkN2VyyrPktVoqeYV8KlFIkSASm0WmVT6
         aKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160049; x=1795764849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
        b=HTIx43YowG5gG8pePIe4AtMs9mRhIeAcAmPYUenayu2W1z9iia86w/kaNcdSSA3qIK
         Nxzme6guDYa7cuZBI/1MZF07o2kACD9//kF8mascPwYGzxmyGMjdjh36cjf5AhEVLBE3
         qO25HAK81P7IuhqkxJDJYNqCfXDJFg/pYW0pkVpun+3mD/b5YZPwD1dcrWWI8pMweNx1
         X9RTeZlOirjHUZin6WZTZbiCszB1RgkvVAD9dpgfiDrKArJlSuVE5MBGwHxlJbMYfZ/Q
         ARnFlTP5jFkH0p/sO/9VV5w8/3pmk3UwFhVnz2VuexNjpRq0Rmb9p0M7UvdvJNzxV1AP
         VvJw==
X-Gm-Message-State: APuU4Z8EEm/2aYULlRPFFBheI/DH4eA75aFaLRHcVU7u1SanPLpq2C5Q
	Is5f6GTUump7CrLgCSnguHm6hEB5KHujdNpnWXIKtSXDeZy8al/+3zrt
X-Gm-Gg: AYBFou2feEZkg9gBvo1UIo1LZDui2X4X6Wljmy37Y9Uwyafqoy4l/Irc1G7kLjz5Uwc
	/hgc06wGBJ7up7wA2+oZ/s4rWRCgoBcz0/nUH3JU5CybnGqFivD3Thesw1fmcrnmtHIac4TTt2+
	9/31YxOHIBeB4nM7mWAW4ynmvcgEu5Rc1Z2EHserYwt9X7IOALhF0vuhyYPEv6wgCS/1O8vbfqe
	6t8jt+tsVw85LeiKcEA4z+LsPr+IjTzM1Yp7nYGUlWZWqTt2JsBom9eDDvaVtIFSModRaEUtZ5p
	+dFG0oTSbPu9UFBayCPKJaIZ8WDq32X1yWJPMsLtk3MMsgbBMEHZcIiyOCzqA/EsiPEz4e/401z
	IVEbfNFeXwdylLwjrCEqKXRLatb7N/xV2ouVeZ9C5si06eioisDtmyeWonAW5ZuPmDGrnwYn4FF
	geLGRIeAGGf3DrgW5TZg4CNZ+ZjjEqbIiyCAQ2Xe1jR76wmKD2tAeg4unOvYHG68rKYaPmegVyy
	dOrMTZcd/OQZx7cvv3qkHW7q53LqJ3LfJPSFpTfb/Hm8/sWICr91SngHapGIMJ9o+TS5OT1nQUG
	aY5S7fWKgyrmGJLiDB9EG3xFA51CUcAqN1SWeQVNIaZeZIv9S2qoG0rI05HIQXes5QxwG9d7Xkg
	=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr44615435e9.12.1795160049029;
        Thu, 19 Nov 2026 23:34:09 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:08 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Fri, 20 Nov 2026 08:33:56 +0100
Message-Id: <20261120073358.10267-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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
index 709cf9674e2d4..16014df9c087a 100644
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

