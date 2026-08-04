Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120384334AC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876991; cv=none; b=DFJejBsIM/5/wGZ3LGXzFfybxJlRo++6mneOdJUZVdjrrVHHnD8cn3yIuWH9DSwjp8RbC1zJtOGJciVZGQ1KuILp7MVQaBfxaxg5vz/VI6DhPKtFa5os0eGSfGa6h6pB/jYBZxhr38dPjusxggGUYXHrOa4/VMvBmDS9cnnjwdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876991; c=relaxed/simple;
	bh=yu7fTJEvu/WM6iPEXNZYvP9LNyFeTGKqeWmRli0lQx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iDvAshsK3qRppd3/pESLQG6Owcm7qXB8bvTLYEC4OkspdFfhuwmTpQwvC1Ni9UkKD/dxyy+3xfHgKTietalPoNzYK/TSj52JmvdtcIAzNxbKkv+uEFxuPUOVqCT4hzU+oLlTxB5jwyrZwfeXz5poKN2JZZpyt0F1xYGjBqTFW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mo0GdF3Q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mo0GdF3Q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso1508115e9.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785876988; x=1786481788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHxdaaypANO4SJdv7vjmn9Syq8V3Ebhk1vARZd9Mr0s=;
        b=Mo0GdF3QcDQm4YHlRyfbx+lTUWgf6Mv/BK4DFeijlJ6PeSeIi31Yt1F+mT0KjBi4YC
         tB5oMX0imr0pKiZF8qhRSNGcd4QymbE7OqPrh0UycDm5FP40Jwkoyv0m30w1yTCZ/Y+B
         7skLtt45Ap5j3WPY3LqjcsxdbY2k78Nje4RFrdLK89axRUFc4T9Jr3jePGNl1Vn+8KUU
         UJ/+BVdy7rrqRWpgUFewEMkNX55cb3eN8VRphrDHd92vYjChl3/jdYGJQwJL+kG76Ehf
         x/lZAicCg06959pEV87iqdit8ut1qps6yXaba5+9h+DOQvTwhbpPaGoqVWBDsXD+vi4B
         W0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785876988; x=1786481788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHxdaaypANO4SJdv7vjmn9Syq8V3Ebhk1vARZd9Mr0s=;
        b=RI73pFLGGr5H4bd21YrALSELf9GqZjGSprU4txCl63d7mVAnpGRNaLGQ/vSrBH88ce
         JGARazm2n1PcVUpk9aPILD1LSYOIkbP/dlZmqYj7kfXHDQGmQnEMH7Myu86s+YDLwD8R
         cAvdUoM9zJvs5tCwzw2jpkV/2GvOCt+QGy21ASxt48TXydCx3dAdFIOWJayHCQUgigUp
         lI4nlhp2zIIqzO6w8OBlXeBwQf9Q0tTjx4/aiHRuvvnEKdMJDVwbOeP4TgpdvzlVzTzp
         wu5J4/NxcIR0oDQ3miqs8sMoHAVzcbnbCeCJXJDwkVPV+BeOA05rZ6c4MqYhT/3toWDR
         3/Kw==
X-Forwarded-Encrypted: i=1; AHgh+Ro15ID3bBLlvXNGayH+uLk8ENBqZov74vscmU94Xuh7Yfvt8PINEPnMZCqbsvg7myWUHt6KaYAEcQpo@vger.kernel.org
X-Gm-Message-State: AOJu0YxnxT6BZmGU18xVShcCc7yET868dNSYzsbQ28KCMttwlQHWQJQy
	ZIaVcQ6Bm21ZMwaouZUVNg+za24he1CkowxCsjoWgb7q8gNYAExUo3KP
X-Gm-Gg: AR+sD10IBHLcAVKxm3PA4j1gz6HHI27b+B96f1NCZSgbkYi6FgI6Z0Dh6RG/HWZqCX3
	iUAmLpnvNpCOX8HyptDWvkfOjCb7CAHj4m84FgarVDc0FmITcKdqRgaJmA86unJk44vJUVYkB0U
	52l2hKFRvRn+kZsUz3RiY27EkjcA1+54KqvU/Ry8fsuHwJirt5+Bf3/o4iJJHztvc6P6yA0/1Wi
	9kZR+V75MzyB3A0lwmg3UGfmuo3SzLlDqFRcBHcgV8AAFfzrU49oPxGC+qjpoRhC2CRO5xiEE6D
	LlQYZRGWeVfknaKNkebAQKh/eZbw4U06Z4tfKRdf721t6qM+YoRPERTRLyzjT6JO+DnVMLFKs5V
	DTVE9b4PQO56rOjiMtODmKhE4MG/wEObKvP2hotHthnlPnluIw6d2esTG1/Ig8WpRGMsl+5d6ar
	VQ+yRdnzO1DHJuc8H4tiCNlgVIsIU7IBh2WpgNwS9lPgJyXha0rPdAIupAj6UJPdJl4zA58pj+5
	teUXTS54oUKPQk=
X-Received: by 2002:a05:600c:1d22:b0:495:6338:1453 with SMTP id 5b1f17b1804b1-4994e7cfdcfmr12133965e9.16.1785876988197;
        Tue, 04 Aug 2026 13:56:28 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.116.176.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf820sm12070645e9.0.2026.08.04.13.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:56:27 -0700 (PDT)
From: Max Pedraza <maximpedraza@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Max Pedraza <maximpedraza@gmail.com>
Subject: [PATCH v2 4/6] dt-bindings: display: allow the boot logo in a reserved memory region
Date: Wed,  5 Aug 2026 00:56:15 +0200
Message-Id: <20260804225617.264861-5-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260804225617.264861-1-maximpedraza@gmail.com>
References: <20260804225617.264861-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Carrying the image in the device tree ties it to the device tree, but the
image and where it goes on screen are independent axes of variation. One
board sold to several customers wants several device trees that differ in
the logo; one customer with several products built on that board wants the
same logo placed differently on each panel. The second case would otherwise
mean duplicating the same image into every device tree.

Let the node point at a reserved memory region filled in by the bootloader
instead, so one image can be shared by device trees that differ only in
placement. The region starts with a small header carrying a magic number
and the geometry, so the kernel can tell a logo from an empty or stale
region and bounds check everything against the reservation.

A phandle to a declared region is used rather than a bare address: the
reservation is what makes the memory safe to read and what gives the kernel
a size to validate against. The two ways of supplying the image are
mutually exclusive.

Signed-off-by: Max Pedraza <maximpedraza@gmail.com>
---
 .../display/linux,boot-logo-clut224.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml b/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml
index a6a206964..7aec0cc2d 100644
--- a/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml
+++ b/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml
@@ -59,6 +59,23 @@ properties:
       index into the colour lookup table. The property length must be equal to
       width multiplied by height.
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved memory region holding the logo, as an alternative to carrying
+      it in the width, height, clut and data properties. The bootloader is
+      expected to have placed the image there before starting the kernel.
+
+      This lets one image be shared by several device trees that differ only
+      in where the logo goes, which is what a family of products built on the
+      same board but with different panels needs.
+
+      The region starts with a header of four little endian 32 bit words:
+      the magic number 0x4f474f4c ("LOGO"), the width, the height and the
+      number of palette entries. The palette follows, as consecutive red,
+      green and blue bytes per entry, and then one byte per pixel, each an
+      index into that palette.
+
   logo-position:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description:
-- 
2.39.5

