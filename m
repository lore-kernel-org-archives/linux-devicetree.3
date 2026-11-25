Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649522;
	b=bttGUGnN6Gn5dG+Vzj249U1h2xBNpYQ6pzRyb2vE/GFHrKdVLmgSfXbwzY6DzZQ1hj5C
	 5aXgqfaTFfhzmIWP9VX53Z85CBXpLSavVI3esMkEw1ui+KUdSwiQ05scC6Dn1/EskXs3R
	 niz4zvD5oUH7x3Q0jv1MMsheJ++I9oz8AG0abfsQ9Dyk58H3rDVqrBtSy+yC576AxxMSV
	 XNzH4F6oz3p4MCvRYJqVVahgCBQ2J0j9XbYFVwU0e7odFDh8iKL+rt8nba9Qf8+ypHY1L
	 JnYxH47GBGUG/mhnSWI7uTH3oczUQoKZitE0ccfABU8IjMtnwIZDUJ/ql2KWrTlneoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Gv33X/GQQiaxvlqfntYXWiFthGTmVov+9S67EUxnpPc=;
	b=yPwgLB4cqF955g6P0MIwBuVbT5FFopXd5fM1+9ikjFoHZquKxEJYN9yS8EyVQzc1WqWi
	 Zb3sKfuWhdZI+KGeDPuVwimqJ3lXL0Ce4SgRvGoTBJPfmjMSvHrJg/So8bYUUUst0fW0x
	 3nQgkyvJ+LLJ2b7VbjHLn+FchjR76Qs7d3blLX3MbwMmglJcBsR/JgfjgJuO6t4iFFEbi
	 2I0TijM9EWNPYb/m6q/Y2GTNjQPOLTxncO91CErC9YP6hagQqms8LllfcRDIoLJgw4+bh
	 5dD37gf4P+ItpM4hTHOa1ECkO+iH51PVgXioGnNenrcYzOYK0oJuPUCgW4xoHYT6wmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJpDOTpg;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77702606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77702606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJpDOTpg
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so5927392f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649521; x=1796254321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv33X/GQQiaxvlqfntYXWiFthGTmVov+9S67EUxnpPc=;
        b=EJpDOTpg6Ba40JeiYt1NMv/2u1fweVsOcZJXt0/CUm7jpnOrrlMPG6acC30+UHtg5p
         /LZjCvhXfXbFfsza58/dUVwkPBEtVR8mGrErAO+xHmp3gDaw4r7Bpl28uOZfwPnLvV6K
         w06hkkhssrVCXsdv6D3GvpwWH61PqPii4fDrBQTKXRcbao2LlUaP2sFfA+oR/WTgDH35
         gc0aQt/fxSS6TNEP0BKxOyFsj376FmqKKCh6XXYs8QbUP3ZP90Izouha6IQpHNj4JiQF
         lp77EkjSt+8fbDsOoYiCaFoznJKV/ZADU3F84iPN3he0HBQVaSpHMecwnA2z4BKiv95F
         BO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649521; x=1796254321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv33X/GQQiaxvlqfntYXWiFthGTmVov+9S67EUxnpPc=;
        b=tQkVGJv+EDERCrkf8sTY/lbXG2QchHMoGdwo+lfM4R1Hih8j1EUN0sVtGLFj3euDyg
         CBwlh/xvlBrGsvnqfzxNaw6Ss6xOFJgbnOc36hpfqMO7ltluZwjDa2naen+lsHoId1Cb
         +ljFHHzPXWkzy/G78kPJcBgK1WDldt3m65b8wYOzZQbPiNZGc65hanKkHoZF7DFvw//s
         A1d0S80oXSNioHb0pF3haAqCueT9RxIWiO16pDIAmFzYehXH9F/C7LhWKXs9wqNoEHo8
         GzWhHgMm/XkU0mR8NRMnEWznl2lrZ0XcEirNXtBxH1ZpQZrgJVexP+YCOqRS+P3Jcr+N
         KSDg==
X-Gm-Message-State: APuU4Z+NnEYUHlPm4DNVi7YM13i4NuSf6eg2tftZve1asPH77t1Y9bMj
	N4AS1ooIG0IMePMzQujJpiknirCdNB1SMDalalSOMo6HVcvcwpUx7zIt
X-Gm-Gg: AZFdTZcBiWKccfS/6MwWQdE29l9543XJF7F1GGcyBUapGgcUetlgKF/ENUhc0PDzLYO
	ld/ibH/HNGksur+c2+BBHkiLYYrD4lFeCgRmlsApcpg+sGX2nJfdk59dve2KrA0Lv2f5CG9D6cK
	GFI1C2uikDAzPxL5JiRgI+uEn8dFP6NKMtLqFSXEAUhV/NRkRZxqi+Sgak36iaRHG/HsM04KWdM
	3mvitbbaslt84sRHX/etqq10UbBk5Z3zxaKJ5UnnlePUGEVEyXYBE4EbdiSZst20u/zmXNYYoXm
	ak7HqRYBk7NX2m3BkmKxmYaGDnPiV/zFP1RiSOwH+u5EFTt3w7vvIPYtQQ7o2iyTgP3+TOl7UvM
	oAt3drr5bUKLXdmg9xNnOxmp5bbb55IRhAZgEPobCIkXom0ukHOeK2dg40IMJ00DL+sN5KEfc6b
	TLFIg2/duAz5as0T7mHK1Qc5CdkoEvhViZvpxLiCTt+rPX47gBzgA2n6oBcGlvYofBPhdHHm0VN
	TpETC7POT+EN9RMQ8/ell/WGEw1k3byXSUwDNsgS7rz9DjsPSYZsMTJpDHNUUTJxXNFO4rUaEWi
	k9SdvDZOzs8jfX0POMdZPpfspZu7PtM1gaz8hvORs5ytYaZK75t6yyQjihGUIR1DG/kzD21p+D9
	miehOWNiI7MtOTyBsu/VFENZV6ACfjhg=
X-Received: by 2002:a05:6000:184b:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-4abb42e9099mr37347042f8f.42.1795649520809;
        Wed, 25 Nov 2026 15:32:00 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm36903059f8f.5.2026.11.25.15.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:32:00 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 17/19] dt-bindings: riscv: cpus: Document Espressif ESP32-P4 HP harts
Date: Wed, 25 Nov 2026 23:30:18 +0000
Message-ID: <20261125233020.1380594-18-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add esp,esp32p4-hp as a compatible for the ESP32-P4 high-performance
harts, with riscv as the fallback.

These harts receive interrupts through the memory-mapped CLIC, which
has its own binding and node. Disallow the CSR-based interrupt
controller child for ESP32-P4 HP harts and keep requiring it for
other RISC-V CPUs.

AI assisted with writing and validating the schema change.

Link: https://documentation.espressif.com/esp32-p4_technical_reference_manual_en.pdf
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../devicetree/bindings/riscv/cpus.yaml         | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..17fef52aede1 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -38,6 +38,19 @@ allOf:
     then:
       properties:
         thead,vlenb: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: esp,esp32p4-hp
+      required:
+        - compatible
+    then:
+      properties:
+        interrupt-controller: false
+    else:
+      required:
+        - interrupt-controller
 
 properties:
   compatible:
@@ -48,6 +61,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - esp,esp32p4-hp
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5
@@ -154,9 +168,6 @@ dependencies:
   riscv,isa-base: ["riscv,isa-extensions"]
   riscv,isa-extensions: ["riscv,isa-base"]
 
-required:
-  - interrupt-controller
-
 unevaluatedProperties: false
 
 examples:
-- 
2.56.1

