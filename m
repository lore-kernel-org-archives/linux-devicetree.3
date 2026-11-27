Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745300;
	b=MOcw7N/omLlL0AOEkVrW/GoQ1/4kdqLqa2biGOIUHnmrnFR5VvWEFf26tZParTjt+H7+
	 78WrXknW1vQdDF++u11r6sYscGzz305TxAA4pIwsSqaGpEs3iTVCIykdf7J3c95AgvHZo
	 lRJPSantuR6+/irzKKqlCk5pI8jJHUKAzoK1t1f7eW1BsDGSeScJJPvaJOaLi5YFfZtIK
	 YHVEZypU1gEmmKwWfdsL2QXo5HSpaueD3jEvJI8raGPxoT9jmBph4ZE80XmYE2h2/ifNQ
	 1fjBEiirUaKDI8DxqnW1epzHVxGEdK2mn4e1oslZmzXiNzszgnFh6v362nBoz0i2Xng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
	b=CAWC2TzUDgOBhTZSEA6qFleUaTDsS03X3bGS03AdMdFcaXRme2pwuQ2cb5pmO8bHE249
	 BCW0R3ehB0SzQ+0TPMyo8nkfr2HBikttcISF1UtCyBXB4EvQfgkL3Ugl3W2JV9BjFGs1O
	 dJAPMPiDQd95KczV0cAO346h7VDMRpWjFvF3chjuw+pYJkgb+63h+Z96Ph+dsgRuZbzFP
	 euT5UUbYTEdmZK1WvMxPyyDe5mdJ54eD608/HgwK7EDhkDVFZ+29k4iVuUbnnu/snMtzH
	 zz6BaUalnyBIMEMBum6vZahAGzkuZFEqizqQOYyPTB0MwBoqHRFi/T0hIb8hseYClHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N9C3/FNF";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C3606A32E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F13C3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9C3/FNF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4442039f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745298; x=1796350098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
        b=N9C3/FNFP3MR8xmkielU+FgyHHqBrpcO5Lg2JkYiZe8pVA8Szc0gi9vCv8uDi1/mbx
         6S3fq+4PiRYNNMeCOoPLck6OzsWCK4Jy5tYTuJy6ji7X3/U2MmFidXynqUwkI1qBbDFx
         VDClOsAq235UPJPRlj/By2pnoLAoBygVTC7PnpDej/dwhP/L26KDg1UKkrMpvCUxuZlA
         Ft6vo5HlqBNg8C771CGsA9sJzIYomtTYZlvG2SZaKmAXI9pe0R1+g6giJycubhX7o3nW
         hgvsoKrntYy2gptYNMOjJ/oX6MGoJSn9pLLg+OUrIm1TIimdUVlGvDqr3k8C9XXvwrl0
         fP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745298; x=1796350098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
        b=1w0+sddP/3Hd6Q8FrjGy8Iplg8eWMltQbKzBH2ZFgLtwz2wHgbjaTdCAt+Rk9Bxe0g
         54KmZg4p8U2fuRp9UgyWnhVZOSz26IZn/K4feBq3pM6OrjmGMozbeuSXxk9iJlBBVkdy
         pQ6yLCZV5z5jdEOEaEdEjbfm+LOsyOazAmoI2vR+KBeOSm70CZ2DpXMuhL7TYwrg8tVl
         F85skfaC40QTMvJgdZZY1VbK+0ZSS281yrzuk9yVdMXmIR7ofqxyUrk/bcf+YXwRvMCx
         pn741ws/0joGjzpGJxDo1gPQ8TouNWLevvIBbobC5Bk2uzgOv0OOMYYsZZXBZLpxm5XU
         oQeg==
X-Forwarded-Encrypted: i=1; AL+hErGah3feMnloYt1MzA0XGFl0QenSLJZNqazdG5dwj3So2mzLq5XwJrk+NmnujfVNcwYE+4c7SfpI5+IC@vger.kernel.org
X-Gm-Message-State: APuU4Z8eYlfh4F1rzEk87MVpJjFRqkWK3Q3fL4/lmQjYp69ndlD5iQqv
	qdZtpaRonHDJibpNWQgbrDDB06y8BafrseByoIdiRXUDrslUD6RVdbIZQb62eEJjGhA=
X-Gm-Gg: AZFdTZedmF8cLd+UPpyJeGWUiYG03aJUFgJjMoZ9qBXE9yeUSPmfqPe8ZrN2mwd9OuF
	bbTh63yqTNMsKtdLhVO7F/ct7APbIky6G1UiadRc9ubIpEgKHFVZh/X9Ip4D/z1bAIRKXEXwZRy
	rJ3K1iYcjK0dsaPhcMyV/upkFC1lgEMwK6N8oJ8Ez/aVNqqyvyqUh4G5jNtsZN4DIb/VYVKxR9W
	+LSoe/cdxQPUc9jksWqxsq66yg1r2ap6CCX5xX5gwa3bRhHR50ytix+/adWD1SZCN7ScSQc+krC
	+0jZUMJhMRiDNwGWk1B6BkbzfuLcvZS4VoSg7LtnhppNBm0TsYIQRsI/zrCyLUIICuIaPO9ipch
	rRUdc0uAQt23tkhTP/7xcBJjxrg9PPI7yvJF+Pc3k2TOVF6lfI9kN6a8Z2tRMW1AekcVpUS4nLZ
	YjLs7na4UKZXCZUjQnIQPhNM/4CpdhO2Yf9eclIzNfJxwyQb9MIWbZdlB9CA3dSB4pdjqgfb7L8
	M01o9b2Wm6NzChq4cGxzSHOwR77+J7r1/b5daVZPVCtQ81xkA0yQScKA0p4PCTh82uILZSUuh25
	CAfDM7RMgfYYaAoeHdRV0VP9mOgJhQjjh43VYHQutYJEicSE8LnYaskBM3vmUyi7UJrjiG6BlZM
	zPucTUUX94mHijKRWkM0Q9FqvGd+Oz86VIdaydK8pcHtY2A==
X-Received: by 2002:a05:6000:2482:b0:4bf:2f54:9818 with SMTP id ffacd0b85a97d-4bf2f5498f1mr939131f8f.34.1795745298260;
        Thu, 26 Nov 2026 18:08:18 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:17 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 1/4] dt-bindings: display: panel: sitronix,st7701: make the port optional for DSI
Date: Fri, 27 Nov 2026 03:08:12 +0100
Message-ID: <20261127020815.1621790-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020815.1621790-1-romain.tisserand@gmail.com>
References: <20261127020815.1621790-1-romain.tisserand@gmail.com>
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

A MIPI-DSI panel is a child node of its DSI host and the driver does not
use a graph port for it. Commit 2f50e0a0f9d3 ("dt-bindings: display:
panel: Make DSI panels port optional") made the port optional in the DSI
panel bindings for that reason. sitronix,st7701 was not part of it, as
the binding also covers panels with an RGB input set up over SPI, which
do need the port to the display controller output.

Make the port optional, and keep it required for the SPI-controlled RGB
panel (anbernic,rg28xx-panel) only, as that commit does for
ilitek,ili9806e.

The Allwinner sun6i-a31-mipi-dsi host links its panel through the child
node and has no output port, so the Miyoo A30 panel added next needs
this.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../bindings/display/panel/sitronix,st7701.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 044b84d8638d..3ca9aa215b7f 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -54,7 +54,6 @@ required:
   - reg
   - VCC-supply
   - IOVCC-supply
-  - port
   - reset-gpios
 
 allOf:
@@ -69,6 +68,16 @@ allOf:
     then:
       $ref: /schemas/spi/spi-peripheral-props.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            # RGB input, controlled over SPI
+            const: anbernic,rg28xx-panel
+    then:
+      required:
+        - port
+
   - if:
       properties:
         compatible:
-- 
2.43.0

