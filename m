Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=aEtq2p/VYiq0mycFncri4064AmWfaCmQrVqDaHyu+mlQWNkrF5ymMF7WFW5xuFXRFoTU
	 rQvJWr/j+hs7p3hbWtRlhqEqnKGk9oOrKOhvGkrCLJcs2nkyrGt2xaLvGCS/hTGKj9Vik
	 ITmc58r0PBJBVlV7VdGXg/Ck0Uk/75BH8/amiYse4Y5JtfU+vdDPDeCLyalHX4ytoNjXW
	 g8bneh3mI0dYgKbfoS17uwe1i84k5YjsG5tdPzxctoBbpOkIjTkcrkHnDyUUSUgCKntfK
	 wiFXvznAIO0uxQkdAbUQaybUSR8gD76qo5Wnp7r/ocyTmR9c5tM114soDdVHphpHb3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
	b=rfTaip2jYUgqxWC6pbxLA01dXE2GNjA5zI775XN+V9uOEfBUcmaIj4UziA7hzBWOB/gN
	 p6cR6ejkbQu+xkOBVVfJDAyQW8dJYtfRbKHq8f6R4VJBpKd0dQtCHN7FY2FxBTD+KWOll
	 Ukwk9TT4if7y9HQHt27td8Dh4kWbJ/lMj5wFSOkh8aW4pb9Bj9+Mave5u83wq4XKJwT7J
	 iE16Gwyj/VJNxjpEuh9N2si/H7l4KuMhd4P+ffnTHqBad0ceePb0/ZaeVu7bt13l498gi
	 +jbOcimfa5k7hutXKuoYScZqhP75dmPWF9OTzRcuwsNgwZumvPm9IQKZpoKEUSYj3og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nGXC2mr8;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AF6077DB6
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389AF6077DB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nGXC2mr8
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so701129f8f.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595142; x=1795199942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
        b=nGXC2mr8jDEFHh8X7rT1WEuyQyAOtyoVaJp5hD24VULt5Dm7tn5F4rQogcz1AKkt8B
         GbsQRDgwSeNRHydCV8O1Hf2dk9YPkq8TTOacvrvqNUcKJhd0pmpYNxAhee9OAn3Q3CBb
         ZrLDMEXjtXAByco6PMvyEc4Xctx+kkdofg5qfcfru3MRhroRs5e8pFa7aQn0UfFZsG5M
         IawcxBBflPCVPeX9BBMQ76gpLVA7LVYCgcNqtEAO7pfK5UbS4qgGZFXxWtBsDRRjMzcE
         xmBeK91uK9gZwr+1rZrafLNgqEXXbHruS92N+aVKjk5Mm+T2BzzvS4ELissMU9eRY1Yp
         90Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595142; x=1795199942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
        b=Rit6RRomMl9s24VXn8ik5tda1AXtbnplIKFJ8RaAdnx3p0lToao0Bc5YeJo7NsW4yO
         ML4EXSm7u2B4jHA9phu7Fg8KysN4ILNe7UM92sc9du1ky/t/sJZqd7smdJTmTV51Yi76
         zzhPmmXBs5ar+R1K+hNi4oNXqBSmTKpOdaiEG1fpGLyxI5LttRLJrc7K3LtUSNn3Iy45
         kqyyohf2bRPhPn+82HvR9ozBjxa7R165I+5iywxL38fbVLdR8GwsS1wYWyUsZ3+ipIHZ
         BgOj7ahzCe+zjY5QhPXwvmDomc6D4Ed0xYUL9k5Dj2Mapy8+FK0lWNsq32mMwaNuv9ki
         9DRw==
X-Forwarded-Encrypted: i=1; AL+hErEhSNNVDUtzc95ev1kcPheb0KhHKzQG6nOOFMZjW9LsioLYHggQUQVZ1aG2nEeZMrX6jNmBf9hgXmYt@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y8STkzwicYc0EyiRpZnViXKWhAcYNrp0fH1CYHpdwlKRH3J3+
	6bzWH/lYT1xhc4KAECruFf6z8yjF/d5rAkbzzF8wSQY++ViZtLvb1CIvsTYBGOGgLsk=
X-Gm-Gg: AYBFou0+uxQjSneRbYm08rjPhk82vD9Ini+IWFYLn2AyngiES5EYkUXkTpPw+4RCs3C
	K7W7OV9kviPbbs3cgAGk9swcbT4+NXb4D6EhR/LahSeFjdro075WbsGfDKbpzmcvUccrUNQUimr
	BMpIbLh8x9RxRwv30IQs0+NrW0fMHBR5lNNCUwOWaw/+ja/mTFZuT7TlgdOjRNDI1/P6wCY3pq4
	0JqBgZhpVyUjlLjPyw3dF9ZIrJ47NtG/hX+RcsQIluL4XvcByNMh/fbfKtWZMUTq7Ay31Tns7dN
	KLK8NfwdSdxq16FJ2VHGszsUO9L+kgkBRJvsa+9+QOcs5l1Hqre+gAlBQbGYHY8sqlog9/6TlPY
	erxY/Mp+3pZbmaQiInB4xli3EHuAEaCwHz9qHLzfxXym74Rnou/En1KQswC3YhwG31ESGgKUN/G
	UCzRTU1SzShlJ+0pWfPA9vKgzRjiH8YBSgxVVHYviFk8p/dIvZu20kp5KmWpTEgQoQiplpplB3r
	IV6gBBvPYgENVq6LnPLnlx8Okx2m7SXCy0UIdv7t+ZN5NoxUekTL94OcP0d7N+mQwaulZcxI8J1
	38bpthKradimwsjctSzhaSKpGr4JsVdmZmmyv237pb0=
X-Received: by 2002:a05:6000:4697:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-49c7458620emr5628794f8f.49.1794595141531;
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:36 +0100
Subject: [PATCH RFC 22/23] arm64: dts: qcom: sm8650-valve-deckard: enable
 audio
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V5W1xkU5JSLg+slKk1AfIWeDvtlCZVv2u4mE0vZ1GEw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91koLJdzmuJYexHUXqCwf/rguGD0uVlz2GY/nKi3
 xzdtgDCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKAAKCRB33NvayMhJ0bV8EA
 CP6h7TdIv30wzog9Ph/7TaDUOU9Q0KoVpgAYqjAzcf+icYGmJ2kONvsVh8/7PH4note+jLzG4tDvTg
 nzrwuAj4KUDPAlz6PsQ0XHZ29zJ75rEWfDIcEdF7vdhPYIovfSgs6QqLDpS1desaMEODAJoS795EuR
 iEfrJWyLP5ef/bcOxxWzXNzoSsZ8A/Bt5LvYXk1HHAUA+tFPJhz/gcwCBydcEOTB1yo4qRJayeiKVJ
 Rcu1DJoYfimFMS66fRmnsNY6R5eAQZ1B8TESR7wnoyE+HFaY7XEe2rWXyhtMp9D39ig0ofzVxfvBfX
 xClL2KpG9LTBkZ+JVJyZ0ZGlzjrbxZ57KV9KGfbgr/ifMSJ/eBIUb8zKdUnuqKwQG/0xmOgGYXvoaQ
 oUkbQeo4YfP7z7bTQ/6Nx7byp2lGcbrehRCaO08sxRUtNvRMx0txP92TmhKIVG0+kRyH056YcHvSfl
 uFXPOGWBL0r5Hbvb0nq80KI4A0cCyrHZ5L7hEzBaIZY0mL/EEWfx31q7RHb8acgQTvlh+WLJBIuuKi
 SHdv3y0nTLm8aCpLij24hLvJwvowGkLPsz0Nqz3L7r9XD7eBVkTeWrfOzngpRAPTHBq7P3NEAWHkft
 L83kztdj+ctg8j8LHeuyGltN3XftbP1L7HKNTQojJmNX5Zlac2vC7lPbC0rg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Deckard boots Linux at EL2 without the ADSP audio firmware, its speakers
and DMICs need to be driven through lpass-cpu.

Include sm8650-lpass-cpu.dtsi and add the SM8650 sound card with the
speakers amplifiers on Senary MI2S and the DMICs on the VA macro.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a365caa28cee..723f7911fc54 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -16,6 +16,7 @@
 #include "pm8550ve.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
+#include "sm8650-lpass-cpu.dtsi"
 
 / {
 	model = "Valve Deckard";
@@ -160,6 +161,37 @@ framebuffer_mem: framebuffer-region@af400000 {
 		};
 	};
 
+	sound: sound {
+		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		model = "VALVE-DECKARD";
+
+		audio-routing = "VA DMIC0", "vdd-micb";
+
+		speaker-dai-link {
+			link-name = "SPKR Playback";
+
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_SENARY>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr_i2s>, <&right_spkr_i2s>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -776,6 +808,38 @@ eeprom@50 {
 	};
 };
 
+&lpass_cpu {
+	status = "okay";
+
+	pinctrl-0 = <&i2s2_active>;
+	pinctrl-names = "default";
+
+	dai-link@22 {
+		reg = <MI2S_SENARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+
+	dai-link@19 {
+		reg = <LPASS_CDC_DMA_VA_TX0>;
+	};
+
+};
+
+&lpass_rxmacro {
+	status = "okay";
+};
+
+&lpass_txmacro {
+	status = "okay";
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <2400000>;
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;

-- 
2.34.1

