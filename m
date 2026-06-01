Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60F3A6B8A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320360; cv=none; b=mDtUU4okrlgX4PKOsOc6lBJoB/WrLI3SAv/yL3dOSp6w+niuxfJcPmOjKZBTOomMgRXx6AZnaTk+ieBxiEblbDdnK6iZN7S4rkgsjwlDqts9NiBlhsPngXGTkIBiASBesiNx3bCvu06dZJ0twzTbvPWjNsW6dl/pVGcux1KI9N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320360; c=relaxed/simple;
	bh=W7ouUHz9IVr0JFGqEPpKS2xQqbGfVocZJh0B4xlOlaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvGXT9mcGxEZnIgmNgLpiskJVDXBqEh7ZXnCcOLl2TGktd+oy1aATmKO8lQza9bb2FlVyC8TlzPTXYcl/43fiQio8ZBQc6xzbf0FjvYVruLGaB+3BSNGcMSiz92nsWit5P+5DjAFw/RshPN6mN2IAq/Xaq8WFcEWRSX8saT8kq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAVt4TuB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAVt4TuB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b900f350fso3633396a91.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320358; x=1780925158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsawg+8GATdikrrlq0osBdEKvt3vbI0cHqtdo1QmEeU=;
        b=SAVt4TuBUhcPKIzxW+Y7U4nVhlGH7OHQeKDT00sJxthzXUT/0TWbwFNO8rsGv5D1Hr
         BS7qQKabIlHAHJWADlRwwVzhBlRjOPRxAI5xhTMbMg3SqI+W7mZZ8Q4zoqut/p+C7Uxx
         qe1ajEA+Y59P/eHBAc59CQYKINOx7jIR670LSvIgqXUhW9Bhe00SGyhBEo7kIEnjRb4d
         EhsFMAU540uEdpuAxGvGjPVpNwt/lqEbLS0XANbWBkKpx9ubnSJEkEBtXNswhEaxx1FQ
         7kGtzdKJpWGTM6eCfvt89g0nGVpYoWwAm2QMACR6IswqtbU9nZBv9wREW+McAuAO0ZcT
         rF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320358; x=1780925158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dsawg+8GATdikrrlq0osBdEKvt3vbI0cHqtdo1QmEeU=;
        b=fgut/jGlxz3hdCmDnkM5fvwUOMeIa+q4KR8IlfQF03Sl/fe4Lrv9uKTAv/Vlxs0ZX6
         GGuvsKJcKA01JvqSFpiTnoyHftkAr9CHXQpjZd8x24LfIaxyAFtTBGw6kcgqrLfSEqOH
         WeapNH7KxhKbUCF4UpnjubaFcpAib63s+SyrjSvr+Qwead0XUmmGx9dqk+czLOunidvt
         eqRjrWG7DJDFhodOrugBfai+Jreq9ueE1rZp98cLt4efr4pvhnEwJVnJp1r1xSxXDN95
         GPm/TSBHvgQdZ/9shO6xdyztraLrW7xHjoCUGrcLJIkiHWNEsGZifrBfKiOOSQ/EiHiH
         tF2w==
X-Forwarded-Encrypted: i=1; AFNElJ8I9PGoMm2xkBsuZk3HjCAFAlJVuVRUoC/eAbK9Z/s3r7Ekg4FXVfus97eq1kYm8776CNhQOEfqmsCG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl26lm/swmQHEMzP4ozVjughCK2RDjsF+ouhlowLPqduaQRAvG
	k+qcCp5gD8BYo1jqWKA1XLlI+b3mJ6F47NwgkchBwamW1jOoDjMPpZoS
X-Gm-Gg: Acq92OHak+ehkHDoR+SZlCF7s9v6kKL+WHQwkI8YIKmCIUEY3cKVbM5SAuteaTvtrEI
	dqJ2rjsnzAUvvJyLOToV8IIKFQyaVgT/zsjY/g//WTfD+qLuUKXAvLG2KviIxT9Osf6iU7NHsJi
	AE3Wnn4Ij+cQKulhdhHqx1QAfXN3xKQN+UxLzBU+Yq+xlbokluR5+o0m7BtxRAF8SSZPZ2wOgls
	9yr/quVrXB1QCXqQmY4qY3OwYRBlhSaPNVyDVRpa1MwDb0zfdDJsjy8WgCgrjZ6y0DH96B5YfHC
	OcgnOTf4yeqJv9gwBgex6epiEBWKbnNfyKTwEZ3NdwRIaxyz4YjBmLs/BqZTv6S7CBxr8zqNRNb
	HDYm+LKHXZ+J5d/8PyOzPyptx87Jgi7bHnbvIXPxgd01ntx4VbcYZ7l1ViSStF1oNwvvIgdGnTK
	uWnOAmAXf1IKRog/T34uT3K3vkRonJuQ8EIcaol1zH
X-Received: by 2002:a17:90b:3c0e:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-36c4feec3b3mr10341353a91.6.1780320358238;
        Mon, 01 Jun 2026 06:25:58 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02d0a22sm11444234a91.8.2026.06.01.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:25:57 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 18:55:29 +0530
Message-ID: <20260601132529.139172-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601132529.139172-1-hrushirajg23@gmail.com>
References: <20260601132529.139172-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC, and add the vicharak
vendor prefix to the vendor-prefixes list.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml    | 5 +++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3

