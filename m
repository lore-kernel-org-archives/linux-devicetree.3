Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49769397E89
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150777; cv=none; b=q1xNDNpe8yQ0qoZv024CUiGk1Rlp8kRnyWonhQSlqkfpCLp5x7u5NrtKOObHfwjpk7z1+6+9fbiiuYcjv1D+IrWrV8/BTBuVt+ScnNhuVa63YNZT2qap5fUK7Lbf8JnAioa8OgokEImQ0SYkzBlB1bNDEXyLoprwk9I9qpR560s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150777; c=relaxed/simple;
	bh=p0nFlcc0G71zRK9tMWoufvLKeY4JW3NRg9nSuniWkNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=scIiYBpoPqFWqw2Z2BzDxIKbIsUpL8GEDqutENWBeAshFDpWut3JVNyEBPfHSF/71I/2aKYtbTs8jXfgz59ORZi6oomJszVOs+64WN1+LYhHFLqKLxRTbM2kBT/YJtvegI+3vCsYU9w3WGdiU0nlymIkAnYQpTHBp4z24HqOGfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCFz9/1A; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCFz9/1A"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c59f740cso8613235e9.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783150760; x=1783755560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ujun7RB7FUF9dZLPZwQwz/fZN6r2PvMJI73ZhiW7os=;
        b=GCFz9/1AVAEbAgluk2yKp9vZrPjb9yAg2b200Fg6rEGXLy0/PhKUaphFocoHbZvJfO
         XYJ0Jazq/YnytfwelmGG3snlwIuiHtHLeHUOJUO+eDbZQquzKT48aqK7itkj+UUW4lXJ
         c1oDJEucmQ0GtlCQnfx+dM+CrphtsOJBy3Q5m+OYComWZoFd96nArcYEgIK5QQ3QJr3y
         2PKHLl5HB9Tnt2Ypuxu1msWKfS5w9islgTZKiEOdWfY9TvoCebThXme6ISbRBMkHwyLI
         Jgs7bBRxHhklFUPLScaSwJ6sCASXDE6uwOI+iJcFfewXX8t+EWobAfV2GzHBYFhXbz4C
         E/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150760; x=1783755560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Ujun7RB7FUF9dZLPZwQwz/fZN6r2PvMJI73ZhiW7os=;
        b=HspFEnitnTma0F8pz5FifcanTH9gYZXq5N4KCdRxFjT4RkM6Z2XICmcYsJPDl0oLbx
         kiwxaOGCA2eOMmNAByo27Ug0L1lk8mSD0z/mnIpfVkJm1FP2FOuahoOOJ5Qvb/0YpR3Y
         A+yuJmL2FgufihlGrd1D0hjElaRoFamtBI2+EDjrcHAr/UZyVXkZBXQG2yt3zhFymFIH
         cXDhJR65RhSiIW0cqxYLt9VJNREnjiM8GsMTNZ3/VyNIdt3bDQ3dNWdnZhbG2IgkoDb6
         sNWAPjwz9IeQQVUbTEoEkZGV4VNpx+woUoB2CnSqM11Fxa03w1AGGvR6DB6zVCJM5PhS
         tFyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9v7i1FNSMbB+xa1L1oq+scDVi17Su/NvUloj6ucXYqqbhJQTaGBsiGKjuZUIWKGVDjYZ/OQ8az43Js@vger.kernel.org
X-Gm-Message-State: AOJu0YyzTve2jxUUhcGcL1GskyTuW8varlo/SD7xMQvg1mtMvkZLExtw
	cYU3CPfGz2f+d/mDqsGYgMJ9May3on3p0oG3asF81YKGfraxeF7yCk4y
X-Gm-Gg: AfdE7cmTM8YePINyLmPAAXlxG1PRuDg7TID0Hy4XPTEuqSvreJKmC1T+pXXSABdta5S
	Zk4vLCBSwAlkhq2GmOmMJkOP4jhJ4QgCPm9A0nQcSTSNXOEWhhd5PjVFSv1bTKrzBQieBicjj/E
	oxbUCF05ionpsReB8LzBzRzGn+swgTZmKymBMk9mj3JGQExU869Nidy4ybhLQ9dTo0gFAEpM/pU
	BsSQdXR1xDTZzv+VHtLoqONehRMrq8SmcjMMb6cgklRP1XbSF9ZiV3vtE5lZJJvXbPs68RXxUmw
	LH1pBziI+ZVQjAH0xhk9js1YGT/bgpaiyiF0bRB6YyGAGryGAN2FAN5tGp5cZXs749pOe7PlWpk
	islK6d5bZBK/W/PA6MMRoKUeWnEMC/9aQF89cUL5qV3JVOaq4a9vuzyQvyJj+NcstlXCDF/O1wC
	CU+EaUoS6QDzHeaooLVW0I7mH9KU1ONQHER7/32Lfhh1hP
X-Received: by 2002:a05:600c:a00c:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-493d11d26d5mr25933205e9.3.1783150759893;
        Sat, 04 Jul 2026 00:39:19 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm6565488f8f.7.2026.07.04.00.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:39:19 -0700 (PDT)
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
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 3/5] dt-bindings: phy: motorola,cpcap-usb: replace se1 interrupt with chrg_det
Date: Sat,  4 Jul 2026 10:38:41 +0300
Message-Id: <20260704073843.1750458-4-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPCAP USB PHY driver uses the CPCAP charger detection interrupt
for DCP detection rather than the SE1 interrupt.

Update the binding and example DTS to use the corresponding
"chrg_det" interrupt name.arch: arm: dts: cpcap-mapphone: xxx

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
index 0febd04a61f4..81c5f3b5997b 100644
--- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
@@ -27,7 +27,7 @@ properties:
       - description: vbusvld interrupt
       - description: sessvld interrupt
       - description: sessend interrupt
-      - description: se1 interrupt
+      - description: charger detection interrupt
       - description: dm interrupt
       - description: dp interrupt
 
@@ -40,7 +40,7 @@ properties:
       - const: vbusvld
       - const: sessvld
       - const: sessend
-      - const: se1
+      - const: chrg_det
       - const: dm
       - const: dp
 
@@ -90,11 +90,11 @@ examples:
         #phy-cells = <0>;
         interrupts-extended = <
             &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
-            &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
+            &cpcap 18 0 &cpcap 17 0 &cpcap 13 0 &cpcap 49 0
             &cpcap 48 1
         >;
         interrupt-names = "id_ground", "id_float", "se0conn", "vbusvld",
-                          "sessvld", "sessend", "se1", "dm", "dp";
+                          "sessvld", "sessend", "chrg_det", "dm", "dp";
         io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
         io-channel-names = "vbus", "id";
         vusb-supply = <&vusb>;
-- 
2.25.1

