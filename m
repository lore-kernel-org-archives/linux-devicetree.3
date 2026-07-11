Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05E3161BF
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802565; cv=none; b=GkH7RdW572o6koaQoOqMN6sHa0iRl4fgWTMUgbsVTjFMK+BUkBSsGX/dYuTZoi+coQG+KsLKezQz6aA5P3budjVBkkZkWO1s3hCHsHpNVt6Q+647P/KDiwvmVug5zKXEdAyI0efgdORr/60UUZgnTm9XlMNuA8YFQ636p4y+4AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802565; c=relaxed/simple;
	bh=2WBH7acSpS1buhG5UF6DDL20aRHFmpdt5Bv97S7dCpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JF79cW3cPCfEzaN5AHoGea5CkLEJF0KQLGHvt42C9IwUyuOdqVNJGw5rEDweDaC8NkCkAm4z8SAnqWBHNkXlFftKVgV0YPHdcId7BxWD+o0lz4oCniQ6sZ6yY1DyV5I2xf0OfeD4OkvynXzh2tWjbA5LUSSKRW0rC+pk0r/mE78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lg2Cs4z+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lg2Cs4z+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c733f15aso19644445e9.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783802562; x=1784407362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4Wlb7YHseLBpG9ALxYAV8hvXubKFh0TjzQy9FHDQQY=;
        b=lg2Cs4z+D2eL+7PH0ehzPge8Gbz45/Kw5NYgNhr9JVOAqHsWqHbkCBATieYNOYceOL
         2obR1dpz0WwZvfMKelubluBULLbqbW9vePBrPOYnBOA0QvWZu0hMlUKFqrk5nixDed7+
         MUNK86vH6r2JOnvPSJ+6D4u773Yml/LBuqaUXnV/hyIE7NIWJVtj/HqaZfZzYsZrtmqF
         /DQZQTXlELRzp0sm+VVjMVCixkuaqiZWvZbcAFiaspUZaflbNIgmmxi3wqW3E0+q5bSZ
         xxM2K8WFwGvBqCFCLYp7bwS6qgl0McO2TdC/iQGp+A0zfw8zJoZwf+zxlYYKzHP/cz8d
         pZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802562; x=1784407362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D4Wlb7YHseLBpG9ALxYAV8hvXubKFh0TjzQy9FHDQQY=;
        b=VPc+JXaE8Z3aA62anmZfObZfFLJlDOipKdnXWpBbDktvSaUiHiW8MfV64APk2QLIXM
         Pltq5RMgWTYWD7vpv/2eDymvZrrKplM+UAfLjtrOpJqEOfxmfVYGkfnXWnfohTjfsGU5
         j4vhQ9FWSyIf/7kngOfIv9pfAELq7DQN5ScdhQ8geIaMgAt70I8P32GjkJAeDl5l7J4B
         YO3Iq2rpWVKYEKrCJgfTv/cytRp1v6u46e9TruiWKAGfkGFjCZrRSlWkY3J1Cgm9ytUN
         P6WwK7fIs8SZGkW9oku7unIhHj5eRAlfHUItjik6bfhspVjvb7Yp2R3OwokvzQEbALg4
         l7jg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/PV09NTYG9LkrXqlNYnrO+Zjl1EXsIxisCzkUGh5Z130V+fF/lybsN/yS5NEoA+ywU2hP3soSPGa3@vger.kernel.org
X-Gm-Message-State: AOJu0YzUxd59ufQRLwzJIcYVHo0Odn2S11hQbpGRpFzPFm5qVi59kWwG
	uX5NFKGGnpIrbg8EQ2rWTjaXSXwGIr2sBSo2n9y6ayIcbW4lk0Zr3O8J
X-Gm-Gg: AfdE7ckedKgSdexR6yZ4BNqdP8hqOZCMrpPesru7nxDIIyTmR4b8/pQ5AqBQRYPYuwQ
	0LyhIT1JIL7BVH+ZU0Bgr/I8RWf1Kk5Mf91ogtrW4ZHdNkfXYrQLvAjOQP4CpDFVZTKFVog+S5s
	K8nuEZVv4Zzmmkz6VImMceJN80L0DI84ARj8kNuEC/Td0X1JNsjxkpQepQdM/XT8Ax7oQmz+wkk
	W/w6k7uFWhChpPrTqRUQHGJpqyCnb7N7ho/jm5qHdswhH4UiOUyZqYfM2VX4Pk7QtyGxkD+UHYa
	5e9Ls+KwaJD7lQUedEm+U2f93D/acLQ2aPP09asD/J4P9wKx3WAVro2kQbTYdqOqk01vJffRrNt
	woqrS4giPQXLHlRSezg9DCXgDtkt/4E6uScI8v0GI18IPS1mAUBQSVDGi58HZjut6kGcFOTky7b
	mehQGdd8MvcomBBRwDtIF/9j/5z3oDDd+XrQ==
X-Received: by 2002:a05:600c:6d48:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-493f88389c0mr25978355e9.33.1783802561934;
        Sat, 11 Jul 2026 13:42:41 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm172704725e9.2.2026.07.11.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:42:41 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v5 2/7] dt-bindings: phy: motorola,cpcap-usb-phy: add optional safe pinctrl state
Date: Sat, 11 Jul 2026 23:42:05 +0300
Message-Id: <20260711204210.197144-3-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional "safe" pinctrl state for the CPCAP USB PHY.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
index d6d52d21280c..25c36138bf66 100644
--- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
@@ -62,11 +62,13 @@ properties:
   vusb-supply: true
 
   pinctrl-names:
+    minItems: 4
     items:
       - const: default
       - const: ulpi
       - const: utmi
       - const: uart
+      - const: safe
 
   mode-gpios:
     description: Optional GPIOs for configuring alternate modes
@@ -106,6 +108,7 @@ examples:
         pinctrl-1 = <&usb_ulpi_pins>;
         pinctrl-2 = <&usb_utmi_pins>;
         pinctrl-3 = <&uart3_pins>;
-        pinctrl-names = "default", "ulpi", "utmi", "uart";
+        pinctrl-4 = <&usb_safe_pins>;
+        pinctrl-names = "default", "ulpi", "utmi", "uart", "safe";
         mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>, <&gpio1 0 GPIO_ACTIVE_HIGH>;
     };
-- 
2.39.5

