Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279777;
	b=UZS6b48Vv+qA2YGNOoiVPgAq9A7jEGvCSa13bgrmCCf9PIT0s2Sl5Jwg7sxQIVb7VdpG
	 wkV31TK5lKqLRK98Mc0PxJj2sA5G69Mz8lB4xBqsbyzay0/LWLrFjPnJOmcXzI3nxdcM3
	 h7FnxjDjU0EqmrNnR3ZJ8T4HsD6z62jEzrQZwWs65dwFBJoyqbhw0BK4eXaFaffyuh2kc
	 JwuMvcRMB3sajee2Z2Boy0eyJ6utsScv2inUg4ulF/EWlZ8qLYC6KBv7UmPHdgOUSK7Vn
	 UHnYaM1Ze5ElgkAUtW0H81h7+bpJfL39zEDkuXwMg7PwIO5ayEwm4n9Gb1nKWIEDQCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
	b=K+zAmE437crs0oZgi2WG1w01+/MoTYY0JfIVu35e2x/i2i9kcWkJGi0jBJNg7rdDnxa1
	 Qrlk1QGnbSSxjCOrWRQPgrA2JWtLxPk3R8nDo1OwK8cJnD17tmTdd/IeJBIhpffAaFd8a
	 x0PBD8lC+vNBUh1HXbzaF2LrmJxBdRbIr+Z2ibMsnS67AblMpxyn0Hj5rQhJUnaWCzvyn
	 9YoWzYqSEFQ/Keu9pGdGmpbkzRZeUa1fbrd/YY4lkrUGFHfrc7p1FalgEr3S0PQ2AN+BE
	 oWPk3701V01uW/TrRMw7n9ob82wwQv1ajoXJouYD7eg6Vs/8LzUceL3m3nUsZ8zx6tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NccJw0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90503606A68C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 16:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90503606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NccJw0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso22097805e9.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279776; x=1795884576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
        b=S1NccJw0Ms+NHuzySD+H8dg4z2d7XLQp651/mphadfSwCAJxOZksz4J6/G7lFu4C83
         wgvpoYo8mezwD2HykkrtAatmVDpTlUPXyfM1Yk47PAkddq4KmODejoLVmjmCXBghfPcz
         G7pJ2/mggW/ix9QBknkTXUrLaGIYZLl/RPYuF+Y/e/rpjiiTKMMkAQRBWKKGcm9vw7of
         IGzhEjSSAM/t8gK86Bjv4faIaACHEsW9crqzr5bYd7Osv/lYXikDK0+kwJ1gZrJMCLWm
         4mkUzKSqchtA5U96FxEN+CPjRFoJOlv6McHzoNFHIx6SWGeuYuE0DygUOYEwmwMAKTwH
         LY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279776; x=1795884576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
        b=ExXXv31KXLWUpiRpN782skvkBqU+Uw8MVRM/EREGs0uGiFHiFl37tGGNYQtgmgbSce
         aL5LddxaJ4xl7G8znH5VEXSnjQ9x16Wj2erAq3Kp4F5y1d8vuGqYkn7qCbCU6dz08CIO
         aGMjC1Mhqx7kFdesHcUm6w6+ydVJBcbVU1R09vEnQAXRDeRjxeEQ9Yg2CJpiXNZkuYu7
         +e7y7252hkehopntnv1P6o288RZZQsxtVl/ZQ6nfmjyTSVKyD27SboCZb3Or2HY5dBJX
         W/eIL/Ut7FljyLqbi5Gb4Ul4Fqo7c6uKIasQoxZQxVk87HaLwDktqJEfT2oXGBS3dr40
         /pLA==
X-Forwarded-Encrypted: i=1; AL+hErEzH5huwC3ATb2/BNHbWY8TdNO0uLC2AXRORU8RrfYDHKhET9qaUX//IDJfLddfnjLFsjeSVSKrXBdx@vger.kernel.org
X-Gm-Message-State: APuU4Z9LKTWEMN/n6Oo2F+yGWGp8KgtJ3cNyhaENmyaMWnZZX4RB+Xxh
	QDAWmK7J38uuCG/+um4coi5MVAcyvbvxBY/0fzcz9tGwbWmY7CIPws6Q5A0Xrawj
X-Gm-Gg: AZFdTZfnGIjOWDRnD8QgVYp4w1xnHQUOpp//OsEL4dp/ewSvl6DWSF0b9Wv40iRidT9
	mR9+iZo2g9OvIbTKQE5oVVvbOGloF0hf2mNVMtNDslWHixAK6KRi3M3+TirbijI1+IZXrUjaJSh
	iBbJLTLZMEctTMkBt4g6uycUhNYyn8MwZLEYtxvH9Sf07EoRhVHBp6Qef+pNnj2VNRZUgGNBgyE
	sDCZ0QQ5rdqqKV4dBJNpmgTnvTR7sWMThQo251UTrazbxmlpSJF42QV/LOyjYjpE9MWSchaGCox
	0FMcYeCtrw3SESj9Rib6euhfwdhNniRA3d//oQ2miemdggaSgW7F0TXThbflDMk5kYSkGXX2ndy
	1HXcv3wECwK9xRd6513meW5f9kKNvr3yXpsz5XPxTlXsahr4XYvxJ9k/NRsNBpXLbyJgZaDbgRe
	7yAIOGj3XRg18ZdI0AgqPHg3xRS5pgK2lPCSJyaAeUTn87eyhGV8VyleVpU0a5G99GhFSZUTDrP
	VAJvhnrlAxTj0FFzm+ki1jXQD1qlXLVJQJ5RL9UFmlPJVx1FiKpaG8VtekdlthMyvWMeV8Tw7B0
	1ah8SEO3qaAEy57bj0ZjQ0HCLhRJDos=
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr139557955e9.2.1795279775875;
        Sat, 21 Nov 2026 08:49:35 -0800 (PST)
Received: from unknown.local ([2a02:b027:11:696f:25b0:e663:79f5:e891])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm9761749f8f.35.2026.11.21.08.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:49:35 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Sat, 21 Nov 2026 17:49:05 +0100
Subject: [PATCH] dt-bindings: media: i2c: dongwoon,dw9768: add DW9763
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
Message-Id: <20261121-dw9763-v1-1-f215290602f0@gmail.com>
References: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
In-Reply-To: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795279770; l=1908;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=qLwwZ3rP/fjc2JAHuzzvcKw4S3Ep+DNYoDcVGI1KFc8=;
 b=FXcyCoVTdSrnvMx/FpFgdpHcR6SnrRAqBrBe9xrqyPsXhxCW27B742B0YYg0QtpySDp8a7kv9
 f7/o4C3koqzC44B2qlmfzILBcVcnnUlw6PFbYxtNUCsJZL6+gjJSXlJ
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The Dongwoon DW9763 is a 10-bit VCM driver with 8 KiB of embedded
eFlash. No public register map exists, but the Rockchip and MediaTek
vendor drivers program it exactly like the DW9768: control at 0x02,
10-bit DAC at 0x03/0x04, status at 0x05, mode/prescaler at 0x06 and
resonance timing at 0x07. The chip ID reads 0xf9 and DAC writes read
back as expected.

The only register-level difference is the naming of the 0x06[7:5]
mode field: the DW9763 calls the values SAC1/2/2.5/3/4 (0/1/2/3/5),
the DW9768 AAC2/3/4/8 (1/2/3/5). The encodings match, so the existing
dongwoon,aac-mode and dongwoon,aac-timing properties apply unchanged.
The dw9768 driver's settle-delay estimate assumes the AAC4 multiplier
for mode 3, which may be slightly off for SAC3; this only affects the
wait after a move, not the lens position. The eFlash is not covered by
this binding.

Document dongwoon,dw9763 with dongwoon,dw9768 as fallback. No driver
change is needed.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
index a0855d3b7..386352f62 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -20,9 +20,13 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - dongwoon,dw9768 # for DW9768 VCM
-      - giantec,gt9769  # for GT9769 VCM
+    oneOf:
+      - enum:
+          - dongwoon,dw9768 # for DW9768 VCM
+          - giantec,gt9769  # for GT9769 VCM
+      - items:
+          - const: dongwoon,dw9763
+          - const: dongwoon,dw9768
 
   reg:
     maxItems: 1

-- 
2.56.1

