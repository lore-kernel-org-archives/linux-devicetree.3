Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009457;
	b=xFVN5ciiXT+eZ0VOVh7v7N6xbzaKbZ0J9FIe8TKiCU7/S/GiFS28lgrg604wMe/YdK7t
	 YdAdIsXLpPj7IQWSuePki8HmdbfvZ9Jcc6mfd/4fh+eWl+UuagK/qtSdnGgXWYdlGxXPm
	 hcnfTm7ZYsLmKO6DcZohdJqjdQnOPbvLzc19vZtA/ZGYacNlq+p0uTplWByTK1Lr4lr61
	 wOzRhTr6VoN0763JFrbC6NvKeA27trfg+IAAiEs3THTsa7a+l+79tjqApG7zulcNrSXii
	 NlFoQr1z3segbyA+wF6v5AaUWliIMvsa4fRq2z/Z5vNyrnM1wOOvjI3c+suvmEbwYAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
	b=o5MUS8doI++MPQJsg3XqjX2ov6kZuhdk5abBgMeVph8ad3v9nJC3PiGx+NZ2QmvX7Kc6
	 Y1TrfJ2ylhtKwxwZVc+wdrTb+Jv8uejA4416CqPcJa69HIdw+MSPbEOq1RmInIgsMIVr2
	 nchFycdPQ1hT2POFhw0KkRPrOJiKT3m93mLrBxRUK2wZXCUKBofZi0daX4W4PDwzGm5Yk
	 MaUYB6F/dVZ1astfvobDRdCRYXBGGE7gKUaqIvoO60ZKpkwvW/uNt5u4JxDsHHsG71kVc
	 KVqFRAauef83FBr4FFhcE8Y47kJxqD5PFi/TRw+H2Du/bBKrVylRLPTBfRSwTvvQTOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OxUnodPm;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48BB606A336
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48BB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OxUnodPm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so22175285e9.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009455; x=1793614255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
        b=OxUnodPmUTC4nxwmk8+lndH5TemiJmiV/MXQqlMZCjaKj1XrhtOrSC9MmLLlE+NNDU
         J1l5saJAI5m1GsVwLNVrCh+YcQ3kXp3supWzimXI578zbtFu4r9LyvZFwVJwzuZcI2Lv
         AP0DN0ecaNEUt+ZAxW4rlkZH/3h7YfXQNwdugf1uAO8pkCIriAEa0Vt2PxQVJRdg9T5p
         sOkMYrAQnD1pqMIevWia6fRTPaYkR1lNnNFqOjw1rtyXEXUr3PNoWSaPj8cEtD7JpTXw
         3jB3wap54H4voKpkcaLXWIw0uWY7nxruzjZOcUd5DUkg7qw7eISUg/KbSTpNMLVdCX30
         SOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009455; x=1793614255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
        b=kbBIp2QucS36YczEBJd+hnhVJTdfxv4DRsaRWqQiROTB1loq+M85zbVTt0l+8NpKwr
         fPXvF/ho8uZ0uiEle8/XZJkhYXlfS85dnrbRQAkEQDpdamJpGp3cbat+aNqzOGuUHBD5
         aeHXPPBiw96c9o57AuENOFRnmSnSkVGgW72GNNsu8ujLp3LW9FC9EcEgvq/2Xm3nBIZt
         zHnC9kxmeWjrtkj1bKxC0zMNdTK+ZlTE/5rYh5dt8v4ClA87+kJ8j49CBsw7RLjOGT20
         ywq5rockfc3BGXW+QgCWYOQF4tITG1zYkeZ6jeV8BKUUv0b/AE+hH2wszC/lKWwGVbja
         76bw==
X-Forwarded-Encrypted: i=1; AKwUvByfWAr1lTgzMHYLhjfIzmudNiG1p7EMCFd6jYmSqrAGGLPO2wkfxatFSUhL12iAVDfixY/bnT5RebrK@vger.kernel.org
X-Gm-Message-State: AFq9FYLJbKfo2runk6U8u8+CGMuiX1zEPKNXtt7KUcejlAno0CB26fWb
	Qt+2FWQ7L2zfTjJ8lpJpx+LUNVmQM5AcEs0ILjY5j5Kn6C/d64PoVgmg
X-Gm-Gg: AYBFou0KnOrxhBgwOs+Ol5Icj9KWxlmmMI1+bUoCJYQaIblw09tdUibG1zgNU1C+xUu
	WmoAZqNdP/mGcQTChubeRTLtZaBZDB8109NlXoxsG1xeJnBjbfGsz5Hjo2K5tnP38++V51N4ivS
	HumnoGLhJDJNf1FVci7nessPpKc1LmpyDXQqwFlm8TuNPuTttyYfkmFwlXrw8/bJqhBJFaBR+Nf
	xzgolNuzZZBznwvEtTexhtf8yqvs+EtMDKp12Q9/HGLf5WaRhDuO2ULsPowgTN7q9O0+wGUwmS8
	SVZcQcgYNaC/hHNNVeKq9NufjKgXdLFuL7XilSFXbh+GInnsa/Bn7F3SVZee9LPK82V3iGFsB+z
	Vk+tIiPO5KEodP++HBB1xj1ezcqwzkHsL2G4cpC2bVyOjoc5HSZSKow/I4WbHkZ8aM/YR8eZrXs
	yeN41FdmY4ATlNOCrI4yJOv+hBsgwBYHyvNUO0vePr820SF3PWda4pvMHpzlZwwQDHQUHWp7YdG
	HSZJgEiwDpnom2qreZ1HHdjlY4gVu0ZpvPRxN+XQsRE0n15qR4gJRl8yFfdP0xfpGHiGz8H0Kw+
	/aoQQ5tuXjeVR6LoBHWEOC8YBdWR/y23pBNarD5YqAdzE6SKoPiD/SRRRxa/
X-Received: by 2002:a05:600c:5253:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4a35acafddcmr120739425e9.19.1793009455114;
        Mon, 26 Oct 2026 03:10:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm15773487f8f.46.2026.10.26.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: an7581-afe: add support for reset and secondary IRQ conf
Date: Mon, 26 Oct 2026 11:10:24 +0100
Message-ID: <20261026101026.34318-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Driver got support for configuring the secondary IRQ configuration to
support full-duplex mode (playback and capture at the same time) and also
to reset via the dedicated SoC reset line.

Add the property to support it and make update the example accordingly for
a more specific register mapping.

Also add the missing #sound-dai-cells property required for the generic
sound node structure.

Previous register node definition doesn't prevent normal execution of the
AFE driver as the additional IRQ register is placed at the end of all the
previous AFE configurations.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
index 80d9e87f1470..86d006559436 100644
--- a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -14,15 +14,25 @@ properties:
     const: airoha,an7581-afe
 
   reg:
-    maxItems: 1
+    items:
+      - description: base AFE register
+      - description: secondary IRQ option register
 
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - interrupts
+  - resets
+  - '#sound-dai-cells'
 
 additionalProperties: false
 
@@ -30,12 +40,17 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
 
     afe@1fbe2200 {
         compatible = "airoha,an7581-afe";
-        reg = <0x1fbe2200 0x9000>;
+        reg = <0x1fbe2200 0x100>,
+              <0x1fbe2f00 0x100>;
 
         interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_I2S_RST>;
+
+        #sound-dai-cells = <0>;
     };
 
 ...
-- 
2.55.0

