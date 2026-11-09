Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243336;
	b=oY2ynUS6HtemOVpn3DVaYs7tYXz1lkHKnyq/aoYOPugW4GBjKfAxL8cjsGc9HXLzaSTt
	 pCXF81MBxvZj/y8Oc+XdEJ1R11+UQCCrC0XhZzq01c/eyZIfgNt4T3OzXfwM9Qya5S7nn
	 +aUHvY3NfR1V9PUDL90dHJ7n0neUu1urotA/R+DN+Wqm+gEIYIOEaaF002IEnbtPab0yS
	 t8/ljvf+HQOKJOKyPlF0XimrkbxkSWQ9o0cE63i55QkoMU+GV/WWHFaIs+/HLsuY6hMi3
	 6vlu/EQb/okfSQqBjyS0jnBaL8O656v41C3Vi0s87DXjlt0ZfIzm3o+huPF4b9ioasA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
	b=WgVjPr97OnO3UfADzZxfEMt0lFffAbS5h72DDtgi9FaieMwK0qrv0WvDM459N5Hlu0UO
	 2nFXIFRUGSlCQhyRWK3qopOA0546yIXLix4/55IZjpo4D/qFKdNkkBVSVTXOT7BVbnbVC
	 fnfIUmY5pg61VCHcjWA8fmjhFZjY+LwZz9fzuXrKekpfqXgUUY2SCfEw4CxMiT/uc/+4o
	 2moz9XngEnQFNDsJ9lSWGQ9WF1JrQdTrQNa19lES1+vh2f/IWvVYrOPxd/G14oRR/O6Zg
	 UKlU4cYalzNbZnodKZblncAjnhBsFcAoIl42DtgJBUGUDtjLvKcZcIyGzvLRZ/RFVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOrfwyWE;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5B606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3A5B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOrfwyWE
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso576189f8f.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243334; x=1794848134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
        b=JOrfwyWEu5DGKVu2Z+gm6dYF7VYMJiVUjHqNcpHtdO8J2Bmk1rRkyS7bJCL7lKZxiq
         kKWJ2Y0dOHi9hkTY3KptK5DxDpOosKjfwtc7sIA2CgP9g2/w4CJHDHMkVuVkO6HidWxo
         snX9gLVAowCKgxeotSrD3DwuTJ2153gsKhC9x8+nYWrR0oO0tsEwoFgwzqU7pKOOQAwT
         1JUM2AmU5FEMGftwvolqCZbdEte17vMkgqxBW+QpXe0Zbjj12YCv4bZTxalBIVLrICcL
         iGwQS0AHXoTcT3ge6QlIzJsntavOA4lMUXJPaCAuTMvXufp+J9FZ6FNawH6vJWPMnsf5
         2KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243334; x=1794848134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
        b=erueeKd/te+VXCqSBpBxKaRNIb53FftfdfWTsqrUhh7tIY408e/j3pWUwwuV9YjucG
         cDHOgFNzYg104qGor+yQDIyQqhDHf6jrlfcJEiBecStmG3tgsaB6nN/7aFuIxN2zfxcy
         B2sXT2wr+MPnbDwLPfLn8gkmpjXSOCr89WS24YxFRB+LHOmKqjgg75EXaqoPUEJ0rtev
         wnI/BMDkoqgls/utClejsy15TBHhtq367kGRPaH8Ck+4e4ixkgi+xbdfzwXmKR5KDNPb
         3+STO80mvbjaLLzK0Nz1yP2f7jRNJ/GkC6/9JuI8e4C4UP//onOIW5Z3o4yoBufOCViR
         BjWQ==
X-Forwarded-Encrypted: i=1; AL+hErG5myAdamYfl9S7FQaMSawdVDsxaBLaoUUgFLwaaE7CF52FY8Ci7epztqOy3htwl5bdHp/W2lq9VK0n@vger.kernel.org
X-Gm-Message-State: APuU4Z+r/5KZ8NGr0VVxASeww11hMqrDVJR0X41KrzH7ImoaRribA3Tb
	BsWCeV6pxtJoGojpEAUXkjUES2bhoZ3xrvobG4QEopYNJR0HvRhFSxc6
X-Gm-Gg: AYBFou2wusfthFuSAd+RHbHiT1SYNKCIZKIVJpDOIFPQ4ekvb5vSXKHcnRWN8EzqSee
	f+I6jnflkLVJugvduHAmA3ycXBgJcgdN0kV/D12YOqBazhWLJHttJCVrdMzPT4KgHUZkwYf6oJh
	YD7ZP29DCQ4xWSAXPPoz36NSOGzmU308vqH5twtf+jluoUrXlBHVU9/MXzLJ3oYXvNmB1u6Jcgp
	2ncbKEz5ZT8bt4Phg2yyU2iBeL8Sz8Bgdf3RpR5VV9CLLjU3Htm90xYDCt8bxxVYV2QPx43pBn7
	iVOUSgj1m7fM0BCdDit07GDAD0Tiyjf/gqyo4u/DQNRcrg59sLrnI9z5zxaSY2Qzy1MaiUxjOFY
	OrsPGHK9zG2ahzIWUJAhwQ44vtrRkZdkK4bC+jUPe8Ncit05VqI1h1u9ueLyT/DtABht19BgpZJ
	rCRyey/W9xlVqq65/yJ9ndavVaciliTBebQQ7saZsT2X+ndO71zp6IE8pNOtaRj8yP2SbQe8rUO
	8QfvXxL8LIkcBa5utuYn9zz6q6JwIf4QkpGCtCXJIuHjp3kGT/TR248ICBZy/DgJehDfR5dLjCM
	efNd+EbS57MSTjns8CVsg6M1RiPuHxUjeWzUA6R+ouLgv2R68g==
X-Received: by 2002:a05:6000:41dc:b0:491:d3b4:4e42 with SMTP id ffacd0b85a97d-498319f20camr30918f8f.52.1794243333939;
        Mon, 09 Nov 2026 08:55:33 -0800 (PST)
Received: from salem.wifi-guest.upb.ro ([141.85.150.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660cfsm11492234f8f.38.2026.11.09.08.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:55:33 -0800 (PST)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorena Tanase <tanaselorena3@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: wm8741: Convert to DT schema
Date: Mon,  9 Nov 2026 18:55:22 +0200
Message-ID: <20261109165522.6663-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Convert the WM8741 audio CODEC bindings to DT schema.

Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8741.yaml | 40 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8741.txt      | 29 --------------
 2 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8741.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
new file mode 100644
index 000000000000..a9a7fc2414bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8741.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8741 audio codec
+
+description: |
+  Wolfson Microelectronics WM8741 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  compatible:
+    const: wlf,wm8741
+
+  reg:
+    maxItems: 1
+
+diff-mode:
+  description: diferential output mode
+  $ref: /schemas/types.yaml#/definitions/uint32
+  enum: [0, 1, 2, 3]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    wm8903: codec@1a {
+      compatible = "wlf,wm8741";
+      reg = <0x1a>;
+
+      diff-mode = <3>;    
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8741.txt b/Documentation/devicetree/bindings/sound/wm8741.txt
deleted file mode 100644
index b69e196c741c..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8741.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-WM8741 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8741"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Optional properties:
-
-  - diff-mode: Differential output mode configuration. Default value for field
-    DIFF in register R8 (MODE_CONTROL_2). If absent, the default is 0, shall be:
-    0 = stereo
-    1 = mono left
-    2 = stereo reversed
-    3 = mono right
-
-Example:
-
-wm8741: codec@1a {
-	compatible = "wlf,wm8741";
-	reg = <0x1a>;
-
-	diff-mode = <3>;
-};
-- 
2.43.0

