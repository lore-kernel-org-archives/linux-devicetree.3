Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81EF3C8184
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788514; cv=none; b=QWSFM4XF8sI44ry3rkSyRgr4ypRgITD8MEFJTtQqyhwjZZYfD7cstqvQthfbEhlFstTTHnSOvs9S/3NNCfBIdLFsiAaz9V8zhcCD+FrV/9+c5O7SPEB45AXLIt39guRmwvNMbA5mRcBYiwVUMJ9kMJ+64haJJp0YzSsjdNn6MJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788514; c=relaxed/simple;
	bh=vctX9KwwqmloP7foTyQPo3feQK/oPWLbCvXEnlHxCHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eVKyNk+ODEDGrryimb60QvPnvNHHD0PafBEdoDfE9niFMHdb9ra6w3hYsr3Jz6hqVRUmyiLx8qIY9VCn82S1QNzM0PXnLzXuTAzH90aLlk2ZJJGq4YiRJrxGA9al6Qrkk3qR8pKcq/YGhrQkR09Rg5507hfr/P97x1Is3NkSYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gp2nSyaK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gp2nSyaK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-476d8e647e9so2020642f8f.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783788509; x=1784393309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtuIacplhejTVgASevQDxobm7194RuV+jAzjBsHtT/s=;
        b=gp2nSyaK1Urp4iPvXDIhcr5FQouJFhgmM70xr/TgmRoQlcrJcsMekjFWtoBJgr/ZVq
         NwYM1oDBna6q9xR49ld2PZPMkdQLYfZHl4pnnTPP46PNY4Wft/yq6BJCC0fUj+sPrEdU
         co/yRYCPezsk6xUE6Kk+U7T9YVE0vT5PZvzK50CbR2nur+qUZB3tCPlf6ZKUf43wTUQG
         HYj6HfohoCQ98lz4KAddssPDJYMlYjhb2BmbOaj/ceMnkAZPxY0jkIVhaS0tBXpy2QHQ
         UWzqllmjtc6OTWHML4KOqNdatmhzdRWAe7ovt24Gc0Wf/M4+AKF2k3CDCLEm265L/Zgt
         GsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788509; x=1784393309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtuIacplhejTVgASevQDxobm7194RuV+jAzjBsHtT/s=;
        b=rbeMCvvSH0AgkeQsmhIPNYV0xaX7Ow8MiCT7WmYLx/qvFvjqEbqiK3oFqkrxzsKOFq
         o9yN68jXChLfwwz619w5TrxykUaLYpmq+9D2zf85sRjhNYmdvtbFY1vyH/OGkfDeZ9qS
         r7h7rpZtoZbxPR/JDUrGFk5I0rKfjUeHLWOQeX+jrogI2aDh4P6Ec2rm/oVSdGsKzO4I
         0k9skhes/MxOq3LQuN9VyNewGe/r+mDskmJRyZebSHXwvhiy1cpWn5bf1xuY6vNFEw7B
         2f/G3oUwZMeHExExzmfQ+x0PkMas21vxrI3TrFpWCWvEPiswFuRTInVIinY1Udp/VNuO
         sc/g==
X-Forwarded-Encrypted: i=1; AHgh+Rogiuibn+hvp9AFTrFh/YWHSPnt7+ZPoyBSwGFlPk3z/zdOM/cjdXLGVqXiIfzBI8CUWn81dV1qoe1k@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzAd/tBub2m3mUa/4wXuTf8Wz213AXybc7X6XbdtZl617ng2u
	sQaPPJQM4smikP7OTIee8ATCNOWZCDFR/7FEkyjE1L9QfGI4+RNJGq/v
X-Gm-Gg: AfdE7cnoD0e63/j6VBjWwwFpRYK7vuKYm/4F1e8vz2PomWD1ssL2nR3aQIKbd8FjjDq
	i/W1G//RA8hkozOZg3pQ1U6bb2Km7ki8FydiKSy288/kzzt098XFc+KEXBMjC7GGFsSTUPpVU3d
	YAxry+kGjVbDjg9tgJYha0l8+d7UD1THVnQIsc+4Zovo3lF7QZ5j6tNFKe89wzubtsVUa6jstut
	AtQmDjJXbfccYfa4hm7Y9x1HIyyfbdcTcl66dphiDFlNkEbZT6GMfx3hWFCsOupLM+9GgrjO3hN
	JuI2blSFkSjFnCIYYS9NZ/JrYR0f1Qef62GIAV0U+0npI29e8sz81Jwz5ogzEW1p1STQZ+6/kVu
	zAQxn0rNfREdkf+rTCSsxIx845W2p93k3NOgg9+zlOTRLO4Zx1WdCo+/8nQGouQH7ftjGJ3rUaX
	WR1TlSlBITLFzOqpWYA3PKUXK0kjnqQ5k1Kw==
X-Received: by 2002:a5d:5c84:0:b0:478:65a8:6305 with SMTP id ffacd0b85a97d-47f2dcebd30mr3684315f8f.49.1783788509108;
        Sat, 11 Jul 2026 09:48:29 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm69152875f8f.13.2026.07.11.09.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:48:28 -0700 (PDT)
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
Subject: [PATCH v4 2/6] dt-bindings: phy: motorola,cpcap-usb-phy: add optional safe pinctrl state
Date: Sat, 11 Jul 2026 19:47:50 +0300
Message-Id: <20260711164754.185565-3-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional "safe" pinctrl state used by the CPCAP USB PHY
driver.

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

