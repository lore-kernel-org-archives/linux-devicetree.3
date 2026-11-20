Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190102;
	b=oTgfaZOKWDhskUN/+KiZ7CBVZMe1euoIaQ83gmzYMlBDdQD3Nx28KPRV4eSSZMfL4guj
	 l1xBPyBpuB9giLOf1rSsN5FdRn7wiMLGZsJ3Er2u3PjsqWP+DlhrD013bISPSy7lUTBha
	 yqEHYxjJFcxFdGen95YvdnNm/PnvoVy2eAsz0AqQiGcXsiOmTCe2MyhV3fyENsbrlw2Xv
	 WfoIdT5v3rP4lwFYtLv1ILXXrZoXvsJJbefTRLiDEO+2TplX/BsJxGv0uj5aS+ca9jMoq
	 Gaid1K6+g14qGskpGmqFFg6Qjbwc9IIPPXRt70Vo0nqxOBtYYHu2/ozG3iR/NcA9/7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
	b=UDKgo4c5Suj3bRRi1Jgrl77ejs++yFNwiI0v11/ynv7Ri2n0YpGQVj2YxAHpovuek/A+
	 QGS15HRbhSZ9JlMkKfBS7UBGnQ+FzJjGJsFjvg/rvff+77i96gp1ew4V/38qhzHlEwbQO
	 4CK4maDHBYGHZ1TXypxZQdRI/1jQWSrKhbe/FEjJEHaX7VGktxWy5up/m0BhfauEXZ1Yb
	 llrulN9E1iMxX7PD5Ff1pzzycMJLoEvxSaiQ6Fn6ppJLzP0l8oFEkec4InoZF2/bXY4Is
	 +gNDGFGcf9V9H4pSU2DHorSbuHYMGFQl/Ary4WQQOjy/ZL+DOYEOxiobzz+UZTlLXIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ou3nVCNG;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0040060A5BD7
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0040060A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ou3nVCNG
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so928341f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190100; x=1795794900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
        b=Ou3nVCNGovNAGTLI5Nwsug7qGSZlbrE3hryXPA5GJ7IjDhlmZA49AZ3mAguJfyvnGE
         pjwKv4VoLuClOdAK76Ne2G6bhvUBXCmjbFmcR5AuU2pn6clNQJZOgF3UpbAqTyjUNMlB
         0PMZLtl9PpGLlDm36Maj3BdsWrNtw/LDg02+xMKorgNhrJMZ7p6ul2xFpXHjzf4UaB46
         +SffsUD9OLtVLXzvmDOAzoTjiLmvxKJjJnlCJCOyVEqz4EfRCeaqx6T2mhAz07jkMKTm
         10oD/FKG2vB02TnSqqU6AkMc+pcZt++wgsvV0MARfIAxwAGBKccB7E3tjMgVQFDz/bPt
         F+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190100; x=1795794900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
        b=Ul5vP1VTX/VdVupM4mH6xshuX5GLE0oLJTQbZ68zDrSkA1LmqZRE+k0CsluE9spImm
         mvd3ylxfhBUUqtZAFrHKrvHgLf3dgKwi6263y8h50nTOomLOekP+z7id++zmlMEyVnWT
         dic9Uuvv0EKv6gpzmdjt4Nlk6BAUNNUf74OA0ccLev+9p2R3IG1Wqjo3aF35nPbMUPA/
         RLTo5dyZ/+ngHHVK/yIpt32WUuQa1JPnhdxbKVO4Jfa/nPSJVR6pCcpWQDA/0+Vg8ZBH
         W7uhs6Yngdkca6EpqQfMrd4MSwzB+U6TXqDLBEoDhEwb1Q5yPoWwFrJBB1GafM0wAJWe
         R4PQ==
X-Gm-Message-State: APuU4Z98Eb645zOL0983mwDTFJGwpGfl01kiWgC378IajScZy5F/kI8r
	nABrsnHudumGHm/r/b2gQXN9LPSdkCtjwG1x6QXdTnTaKIHHjwbPa5QX
X-Gm-Gg: AYBFou1zzQ7URwXLR2+KSeBiVsrRJnoYgoLinB+1ondC/zHNCzeWd+mqFexVr+iTDAC
	TpXijBxfa4j/xicliGANvfAt/Gq3Q1nIvUkg4pVr5/+uxbPDMh/o5VheXF559ZGnxqtRXkEakfi
	k8M4yCYmvCLGXc8OmK6MgevWo2s7cTkHqblqN1YvZAqJqP7zlWYUxn0FccSwvJPhgPR+dYZA7jQ
	6gS8+zbbLYv0uGLFwc8owZwKevrL+hm9JChNVh6uizDNN6Hxi7JJgnxBOMJ+kFEPoOZUwkxVKcq
	2KPJF8wltSA37jhc5U9Zuh4XexoW9olGQsann+4F9Zk/+RlAQi7Pg+CMppuEqq0RjblEOcpu4dS
	yhYGs8sR56S/rif7a0/yalo95ddtznlnbieAQpqui5yeBsVvzJi+VOQ9qz9QY3hvVGAA1133FDX
	K4yGaqnynVSBPm68/na1e8+dd2U0Nzr68591nmFmX5KIiC6PigTAqKejTOOlm+FN7VskvCTOElz
	RmDn7eWeDeXEvDs54LrgSjpI8Wz0UxDcOm5jKrGbIHiS5de9cy2Ul0aJ+BlSOxLBMa/zSfqI8iC
	4c3tKk05iW301PdPlo4KBlO9y4qX2Emgw+oFcB30ewD5r45JY0pPkUiy1SCMA7PPiY4yX8q6FAQ
	=
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb88811c75mr88092485e9.19.1795190100244;
        Fri, 20 Nov 2026 07:55:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
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
Subject: [PATCH v5 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Fri, 20 Nov 2026 16:54:47 +0100
Message-Id: <20261120155450.7719-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 709cf9674e2d4..6f00495d42467 100644
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
@@ -461,6 +479,28 @@ &gpu_zap_shader {
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
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
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
@@ -580,6 +620,13 @@ sdc2_card_det_n: sd-card-det-n-state {
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

