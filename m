Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003646;
	b=nyPLRNtvEK/SvOV36msexCVUDUYnqPLw+aJr/n10I0sKuiNWnukeaOtqE9SGnVJIOGxC
	 jPywB7JLTHKzKZXrWnJezrY+59F2D/RRyZqeC2EGK/pDz+rDS3zJ3udOw6y0ywA9ERJxV
	 7yqfCEArwr6qJXlHQ3mzo2e0cK55eIGk+0jS1BgIDC3nvfZzGnLG8cr2YEHNdGlyyAxlt
	 Wogg1iMn2qxhaMeWVqf7JfFVGzHJDwM47H0ZkMbZuKC1yGCBQhGGGVJwA4ULwlNtCnR7d
	 oDJb8kitxUK2UIaqZeINkUwBWoCtIi0GunIUwOA1m8WcsWv0UCPNjuOWaUTNlevkENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
	b=MRT73wZerR3E5aAOhTziGum8wosT5BnWiHYHA24xmJhHNxsT9UCozoNlJ7mmNAIlBA16
	 M7wgxl5f12AcZB0fvxSLRh+OA/s0j5UqYTvPqR4eJrw68ijVIE+8XfvDUdb5jGqro6jHY
	 7OtLOf1S30eVaKsw3wvaIdVb3Tr9cUBVfE2a/FeaimzoCTtjsk3e5ntHEkwAiq+Ay8xBz
	 wQWwUh/rmeIHQS/KmCwYjv9z9KfJOIdY3METDGDTtW94LCbNKTHh6KQazrdoBA0oKdKAa
	 PNl2u5GqEuyGkGbuoFaJRAGxbG4+IrurmaDu3a4P8nB0zlQRWgkGkyegw52sslj6+bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fjBWl/Oi";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA960A5BDA
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCA960A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjBWl/Oi
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb606491faso4780215e9.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003644; x=1795608444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
        b=fjBWl/Oi0VKXCaXt0gJoCoC+8oLAfwByWw3J4b/IF0xfbjhWrRnVrP9YO7cQFxn6Zx
         /O9tL82nFc7U70oE0uGKHUk0JZKSwaBoGthVZp2RSXE/iNvC7I+9gZ6mp4Rn6bKtAJ2M
         LEp6AFxdYoxF7BYKrjrYj3pRmjemV+DeeLgAbTFuH/zymhi7LYt3zXc2AhS1ZNuz4kBM
         T8wQhx5EhhECRFJpshxJyI/oLbyGX4CK4kr2hjy9UrUGbjgF1KUTR7faAvbwLMcYdBQC
         I4Qvzoyy/jgnIjrFw9gI36mbD8ooCFPOIKJ+0J2CrCWDUEWXzJpLPe8bQKNu6piLEFF4
         bjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003644; x=1795608444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
        b=s+wh+A2GLzU0bVtPbRmC3+2iey+U9x3SvY9+BWPf+q1qXk6hZ5H9Yqa/7xkrlRtCaz
         cmwR84Fi0jSVxg8xb960A1ZtuTB7MI7ixIscvTGsTSO9vnlCPFTHik6BRH8yXz3U8p//
         U+i4XID9AbImwZxpawiZEPbZrAkblZld3dx89V2fZxZVQN//IPQb2bJT6xhhj6MvNlCW
         OlkhEZvt8AkcGvZQBFGeuF/cbCVArhExv43kbucxuPLXIbLG61YwwdsdH/wxE3aWrlqw
         mzDUrrVwI7RbEAzT6i2xwyeUBElM3fyLtq1N2eyvfe26JM5vk+5Gv5JWsp1srP6jnR1o
         KriA==
X-Gm-Message-State: APuU4Z+zvUO/78eaoIeqm4IcEm8BaCz2f8f7/EWoEPNk8In5hkiCjULP
	FhlZKNeC9qyvZ16vlcJKb8yh/QLOX1fQ3YIW9cv3OorJM06549rc5yaE
X-Gm-Gg: AYBFou1AOHncY4sElDVYgP/yghcZ/E55L1wkUEWoec/ROMelPx5303r/EJMeO+g1hYD
	jSnhYk4KTU/hiWuP5rp8+5RsB9mYJXOlo2eZb9uXldodDGaVMS5QYso1VL3ElP0wfY0uk4SdVL8
	IhgUfEKQNHbfvbbdOca3qPOU6tiwnCem6aAmMG7KbZl/kMaqCWEhyq6aE5Mhx3H748lHS47wy1+
	OoCoGPJ/+0e6LI7xckhJc48yTGDvwx2duydl0OyR94OYzmXPTo/R2bielmClUE5p1ZAO12DZWcA
	/rNnNCItY/Z4bzqHab3JgtX5/sGR8ifEzNczub3oxcQcMOjIsC3LCfQNE3DsX6qt3wHBL6mOqvN
	lQmNXZji+Hwz/oyKr5uCP+9hcW5rSirORZLvFvyqgMXsjFKvJso7Z6QmdaG0ObHxLVI6EUrM3s0
	MM9AAzDWjUXPktHyOI2g18x1Jxn9aIyCmUGT0+5EbnvooGpnwwq5p3yvvzeG9QQETx0azp205J3
	5HSuJ9suXWNX5qA7ZDc/tUiZSsf02CjSMBAkHbk5t7af+t6RaC/jKNQnQil/izNTQWR0WOPnLSZ
	i9weSRbg6bgmwPfx7JpVe5hJxfJUyJeEm9N8FyQaiVl0zcudN4iKoEYk/7FlsDNjyOQ3Q5eF0ds
	=
X-Received: by 2002:a05:600c:1911:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb7d57bc33mr43616545e9.0.1795003644117;
        Wed, 18 Nov 2026 04:07:24 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:23 -0800 (PST)
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
Subject: [PATCH v2 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Wed, 18 Nov 2026 13:07:11 +0100
Message-Id: <20261118120714.31505-8-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 1b2b67486fee7..d307a52cd0e62 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
@@ -460,6 +461,42 @@ zap-shader {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
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
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	google_assist_state: google-assist-state {
 		pins = "gpio1";
-- 
2.39.5

