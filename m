Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DA85A0AC8
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 20:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157980; cv=none; b=NhvblXGQZOEt4viAGgFmOkxceHWdVMZ8Np7aH1Egc1q13p3mHFb1qCKIZ8B9g9l18OTn4uTsPBqbQIjm0ACAJaXclhT92k8e95/6mr/tCW4M1Im9ql82ug9zELy8pJMiYaIup9yvwGWcgZreAGluc91ajSz5A0FXDSPP/MA2Ct4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157980; c=relaxed/simple;
	bh=Gca3D8hQSaGhFIRLF/kflxdrhagLAviZHfcOsHs2e9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqxJ7yW3o8qrvMEGBw/AEnzboYBkZm34jxQ0R41oaM8K6YQ1E53j3IrhlSeNfCwjDispxpKhj3N29m+g2tjZIco0EQdD2BqzKBza6R/YeHMdwRh4bia/QMMndO31ck2ayI3SXkuPmtCwx8gDln9mFVgdShMZoWUcjezQgFqjYTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3x/8zfP; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3x/8zfP"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso1108661e0c.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789157978; x=1789762778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1w8AB8ju+xRNZIlH9cljncNnhc+gQt/Y6AH8/ZH7TA=;
        b=n3x/8zfPk9E4V31PYbQ2e+Ot79uZMIs76tF7ZyWsNkWG8Ba6p+3Q3x6wgUxYWxldN1
         f2b19HxmykoHR7RK+pE9FTsCfSFzPaDjO2h4iDw+sUML3SWlJTtiCTsldbOLA6SZ8vkE
         u3aNlNfV8FZML7GQV9aNvR65K47GrRDi7M5WxQnPxwX2doTVSoVCAgicJCCEu5+MLEZf
         hiKEbJqrUlFtM+hcWJvzBFQRw09d6H68C1qf7sMJ5LLTrBCyjTMkRsRTBR4noXUU0LAy
         qTNftEMRULj2G9tu/wxB4f7SWODjFsp5U+rOJFYdMi/O6aDo5JkPanFkAwhYhMasb3s6
         GzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789157978; x=1789762778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1w8AB8ju+xRNZIlH9cljncNnhc+gQt/Y6AH8/ZH7TA=;
        b=PdwCfPkPmXWexpKZQRLEevbKpDIZbJx+XuQFmSlgAH0XVVS119RZ7IHW101FKf3qr+
         0tx5JNGUaGmN6y0An7cAK4DN731z3nur10RCroswiC7Scw461ZN9vfbalUIeClslgYo3
         IVXVONf+LOc7teeCdnLuJnutItVRBUQLEAai8O1ki7ORbqx7Wpe1ngHFkSp7Y7EZ4Thb
         VETjeSExAGTBf6RgsbU7iHp3tv9e2ZNZ1Emcb3tEHNTs0zGfVcolYQcITNK0tLQQYyW4
         oOLQXbVfr56egzSYIpqSqmJn4AbNK+mXTrEuvz9zDDc6aUKYafrHaeVufGMiL4dZi5TU
         T8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxeWZLpbVYkbX6iwUDJYopJL+noYHF/5nP8wi9AIugGk1hEUN3o1MAlnQAKwHbTMPTPV6ijvLPUm2wQ@vger.kernel.org
X-Gm-Message-State: AFuF++mBDk2fWibdIysCLRghvzpjz4XdkgckissWoPXZ6nq6gq7IE8VY
	hBN9HH3PXfeY8GAXWy2QpWP4faomJZ9rldfp7Q+aavrhUKOqRjzHMiAWys7D3Hh2AYmaTw==
X-Gm-Gg: AYBFou3p0AJbM2quvjSv7Bccf5jgzcpFWq6rP4R6Gi7KjtBsSq8Zt5qaYAICCngZxBV
	XkNBRscD/5IlxCySeumvJSNyBOQObmnJa3phBqdQI6ZhgimxG70fxhN7HFMv+W8mh/NrRCiYw+9
	wu6P588ub0QiSBc0HYG8IPT++qyu7iZ7Ysu3y6FSUSLOjTdRVtRQ/68LYUSV913akPLNM7EwRcy
	OXx8+H2D/3XGt8KV6S7NVv5YnaPN+aQ4Tp79GbDEvTvvsPvCKh9mKsg3bIePlihVkdjTFNuVRvv
	yvuekeQlDVsagB1THeDpWzcQfDoM8x+uP0MMxb9CR7clf+UrlmKVdFEDBuCoX0iTho2CwKJZ+Sp
	9mYsrgKr1Tt+rKFkEBg0j4Jn560vH7rTHMsjMDuKFCfDllv03PLvWZjofRp5SHzTOCSryH6T6xz
	F+tP3dJ34ugBGPlbit+FIi8osZaAhQkHGKvEjCDUjI4YHMMHOnUFEMjwq53EXeGX0B
X-Received: by 2002:a05:6122:c8f:b0:5c8:2852:36cc with SMTP id 71dfb90a1353d-5c846277c7dmr8968833e0c.4.1789157977995;
        Fri, 11 Sep 2026 13:19:37 -0700 (PDT)
Received: from frese.. ([189.60.169.129])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c847153919sm4031544e0c.16.2026.09.11.13.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:19:37 -0700 (PDT)
From: Enzo Frese <freseenzo@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Enzo Frese <freseenzo@gmail.com>
Subject: [PATCH] dt-bindings: display: panel: mipi-dbi-spi: add st7789v-tft28
Date: Fri, 11 Sep 2026 17:19:20 -0300
Message-ID: <20260911201920.72734-1-freseenzo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a generic 2.8" 240x320 RGB LCD panel with a MIPI DBI compatible
SPI interface, based on the Sitronix ST7789V controller. It is commonly
sold by various resellers without an identifiable original manufacturer
name printed on the PCB.

A basic mipi-dbi-cmd[1] script to get the display running looks like
this:

$ cat st7789v-tft28.txt
command 0x11
delay 120
command 0x3a 0x55
command 0xb2 0x05 0x05 0x00 0x33 0x33
command 0xb7 0x75
command 0xc2 0x01 0xff
command 0xc3 0x13
command 0xc4 0x20
command 0xbb 0x22
command 0xc5 0x20
command 0xd0 0xa4 0xa1
command 0xe0 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x44 0x45 0x0f 0x17 0x16 0x2b 0x33
command 0xe1 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x43 0x45 0x0f 0x16 0x16 0x2b 0x33
command 0x36 0x00
command 0x29
command 0x21

$ mipi-dbi-cmd st7789v-tft28.bin st7789v-tft28.txt

Tested on a Raspberry Pi 4B using the panel-mipi-dbi driver.

[1]: https://github.com/notro/panel-mipi-dbi

Signed-off-by: Enzo Frese <freseenzo@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index 6f0290c4e291..c28659bd05dc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -75,6 +75,7 @@ properties:
           - saef,sftc154b
           - sainsmart18
           - shineworld,lh133k
+          - st7789v-tft28
       - const: panel-mipi-dbi-spi
 
   reg:
-- 
2.43.0

