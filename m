Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870EF345EA3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534654; cv=none; b=bnG8KJcwJ/4rEK4R6ITqpveoE40dOVexPQOQQp6vWzByDTcp5GamBbzJjlc1g8WRStd6xjipEwpWq8JCfOd5FnUFFji9czzQJp8QbTV1dmNE4Ov9/JOGWtQmzIS1yNvJRMe97jB8dok4osjSl0Kb3G0ztif+/uBWTbJ3WHaLxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534654; c=relaxed/simple;
	bh=iFSPgHBWWRh4oFZA9jZRHcfuqAwXJJvxV1p63pLcggg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gf0jS+78W4CWhPnJTz4IzTXAc/BkI213Gzj/ZkFUS/BG/6v9lLkZbC7flueoCbC9VfZgGasJ2A1Dj3vPMdrIrL3Pb772pPDQxe9K64kl/NmeGhW67Ba68ftTHBeaHV0HDsDH1yhK9YjGG7X7bKjsF/8w3L2EbQkZpwodU5ZD1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bld6LTxu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bld6LTxu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so958441f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785534651; x=1786139451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luqMKmTQhbao04KxZsM9dM3mm5nhaixuuCx8YNHFEpY=;
        b=Bld6LTxuYETiqgbm+TlKIv38xWmnlqfLU6oSnXQoHG8DAFFsy4qNoS5j4FJhYjb5fy
         LtZ92wvNax2mvOQjL615Vj1CV/KccHpmyoGGYT2YrHy72A+XzqkgQYVJXUhCn6bLiPVd
         veKB+AaCuqr3grLB7VCDST5TYDEOn5ET5ne4BolJm6O4V3ZX+bp5tnx84pYZ7wv5ahVI
         g3UfZCCSk9Sk1r3GnwM3wHHQMi//OOowmq/zYHYu3Vuwecv3QAQ3VYSsRJVLOTXp0KfZ
         eoPHvil+OKn5CNGwqCOdaIcvdc0WlZkIpYErP2SL3Im0I3wORYF5TxPyjK/AJ8VPZdHD
         41+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534651; x=1786139451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=luqMKmTQhbao04KxZsM9dM3mm5nhaixuuCx8YNHFEpY=;
        b=e4kLSHx9XfVOSoYQAYSiLGJer6IjWPoiJFTMtOQaxKsQ8wHepMHDbWskjdyQx68qfM
         KM5Qp2JXRsiU4oLJDrGIiWLwZ+RzRTUY5GBieyIN7ie77KbDOHtG6jmOmhPf43gLOkgW
         HtflZKufo7wq0t76Xzd1UkUOYB99ub/+N0Qu1MX06sJkhaAtPszfyzgGvXRzB65NCMIe
         Ep8Gdy8gsWYJGHd1zCb/erprxrympbvtUYjE3ULMCPFTtx1AEbHmKhlN2JDyYRjz8cxh
         wOiRiZOEVYeSSyl5LR5O/lyA6DZjVYMNsEUmqYLRMkhKFS+G3yNIvaLAdWNWhPpO4Jj9
         0orw==
X-Forwarded-Encrypted: i=1; AHgh+Rrh70wNZcsWXvgeurqLbctSNgw04gZ0b20KN+3b2JoY5Ux46tuLUcM/HS2wcgGZafFlV6zg9qxIVlOG@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOqjlI/OryUrbcu/yceb3jWscQOpsviefX0S+qjQY8kf5upJj
	xQvzcOmlPTolK1RbOydwVrnbu+Iz/nNOCkgLL+lMJZP0zNnHhkcXUp2Y
X-Gm-Gg: AR+sD13XMVAQAcpAFDSZbadIJf3md5iJJvCPMHzzzBHeS5qOKwXCuoT4lgvLa0DzFOE
	KBSik2eEYRcwdlhGv4HmXFrpCqnPS/w1nyhv9hIy9BWFWLKlbxbJ6EKcfg/Y5gpBtrl8Q8xsC1U
	jUX4NzkWvqNT0LDgjhXR2xBH/o/9KzqYxgacRaIX/IL30V+X7bG4N9oQ5GAkjGHN+cCST3iqInr
	R/cF4jd387Ml09Ibrn+ga5LJrx5H5HfXVFr7H++MzHaOuhClSOL3Efywtg4jExkq6uKMM+UVqTV
	jRAPbWRV/Y3sHS+658Vddy+1lo7EcdPc2PdLnL2BjN1lwUI2VQQzMMXDCU7aOw6Slf/Cl8zbgvo
	44KOAL5Z+s1ujijjPDT2gcccv0BIm6NSwwovxP4f9K1J/HwZYYkN4yDw6pmt3rdwtS1QCwakJGB
	sq2ghlmHObHdfZ4OghtaqSXc6f53rs5lbWTvTPVl/TTM40Tt/CCVyFxbId7Xm3+k4qk3O4nwfSi
	NLaN/qcfBcUBQEh1yvTIM39
X-Received: by 2002:a05:6000:2404:b0:47f:9557:8daf with SMTP id ffacd0b85a97d-47fd7329f01mr2280434f8f.61.1785534650742;
        Fri, 31 Jul 2026 14:50:50 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.116.62.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2484sm10186342f8f.11.2026.07.31.14.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:50:50 -0700 (PDT)
From: Max Pedraza <maximpedraza@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Max Pedraza <maximpedraza@gmail.com>
Subject: [RFC PATCH 4/6] dt-bindings: display: allow the boot logo in a reserved memory region
Date: Fri, 31 Jul 2026 23:50:41 +0200
Message-Id: <20260731215043.30392-5-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260731215043.30392-1-maximpedraza@gmail.com>
References: <20260731215043.30392-1-maximpedraza@gmail.com>
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
 .../display/linux,boot-logo-clut224.yaml      | 52 +++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml b/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml
index 10845378d..c40683f3a 100644
--- a/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml
+++ b/Documentation/devicetree/bindings/display/linux,boot-logo-clut224.yaml
@@ -54,6 +54,23 @@ properties:
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
@@ -85,10 +102,17 @@ properties:
 
 required:
   - compatible
-  - width
-  - height
-  - clut
-  - data
+
+# The image either lives in the device tree or in a reserved memory region,
+# never both.
+oneOf:
+  - required:
+      - width
+      - height
+      - clut
+      - data
+  - required:
+      - memory-region
 
 additionalProperties: false
 
@@ -106,3 +130,23 @@ examples:
                          0x02 0x00 0x00 0x02>;
         logo-centered;
     };
+  - |
+    // The same logo taken from a region the bootloader filled in, centred on
+    // a panel whose usable area is not the centre of the mode.
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        logo_mem: logo@9c000000 {
+            reg = <0x9c000000 0x100000>;
+            no-map;
+        };
+    };
+
+    logo {
+        compatible = "linux,boot-logo-clut224";
+        memory-region = <&logo_mem>;
+        logo-centered;
+        logo-offset = <0 120>;
+    };
-- 
2.39.5

