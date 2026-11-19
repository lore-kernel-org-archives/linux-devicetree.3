Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110888;
	b=JRdLIoUKJZO9QDT9TAa9r3kxgFtdyPfnGyxEiy6HP9FWdmRcKhY5zPQZqMX0t/ChWfbT
	 d4OVNCKvzuj/TESzACNktN8K4Ya5F/rGU7BtVaguO6uzPa7tE2Uifx7NAGNlM39knYd5w
	 hujP5mH380nqzCb+aHyAA4z/drwjqM+5MrqBeIZ2LU/4b/4d2GX1Vaia9oaXTYYdFKDda
	 IBnivaJ4bU2SjcIWmEnlFzYdkj2FlCSdUgKxMXZlR0cDRb3CVhepikg9gYzhmVTQtLdmN
	 Wz/oA3LfDxJ1zDIKdpAk/H3YqxgrbGLfi1d28yE2FOJMcJin27y3tBLbVlIEW5uhnlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
	b=49RqRlL+qA4oi0ZZVIO3ojqTWBKlyplc+nOctranM00THTVDpTs7dcQjU1sCTfTZvqS6
	 gqvH1VDDNGoLqZtLQHVextqf/QGblJRHJox323cW7i2XqZ6LBHcsI9N6N1OqGHRX38M1B
	 GHQBcs3+a40S+yHQFaca/YSVgLVtD3DpAvu0k/lxxyVvgq6F983PH/Xr1C8GRPDDK76jA
	 ySNzteiiwDd7kyygBCoZ/0uyxye+wQeNhUeBJlhj4ljSP3xj0beXvmrYjELmRXcJrtbzZ
	 ZfIV7elDs994nCGoxuqElqs80qw1YF1aVwE/0bzWaHDB8KeA9dN2HI2cpwCoWATppVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLJKvOTE;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4360A2610
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B4360A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLJKvOTE
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1698855f8f.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110886; x=1795715686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=BLJKvOTEDXNRK+uNanov6SAE0KTMeYRZ+p8fRUvQRH0CAcv7TkgBqfSPizxGvjeqCI
         OoUYAE8HDYeUpWb+Bq4f7ryj/JodSV9iXr8KekXf4cB/bSHHs0uuhgjlrkL8sRJ0t7kp
         7fWyUU2yzGsUuP1XQUKR9dHrLZtW8azradpbwErmoFbC03hSkJPBvswb81TaNbv5BKy6
         mkdEP7M7Hu+2mGJViErOdxzq1TrJD5qQRKy1mebdsnxCHY7jeNZH8nbyujn7tmuoLxc9
         2Pfvs2ly3xX3wUUTYJMBYdMe3yNaWv8bkNNhfe5kBRHg6/Cq7QBfXQCAGFRWQMZfFwq8
         rjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110886; x=1795715686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=ljdkAySL+YBUqZBzDxbSefBIBMn4oqr05/rpzuWd1LKmAD3ooFasC4xoVld2IpE6lY
         fuAC0Dagv4ZR8hkzf5o2lZINB4UJFeuExPVI6ixsJSHIeSNVHxfS11J2cUKLhUhbhqDJ
         EHjFu1HMG/3qW7P4rm9d1yo9756rPVTF+qb/5/IBJcbV79UvapvG1jdQJfkrHDs979nM
         1iv5AVMMO0g5+5LjMayTGCLxN98limy8WxsysE7Nc5r+fYCUwXYFp/TjvMc5nwYL0vQ5
         K+0lb8uFp4TnEHrzmvvdv7zc1nMpQXKvoHHN3qgQEbrhpUATPEMf6eilZNiL06Ct/0j/
         N45A==
X-Forwarded-Encrypted: i=1; AL+hErHcPhgv5zXkD0Oxk+qeQx7Gqjooz54PhbkVF4Mj4OuB+Fqpd9pgQbrOLpPquvjkOTDRaVePojeNOnCL@vger.kernel.org
X-Gm-Message-State: APuU4Z/gzvZzrqio7tnt4EA59GKzG77qEVEbr+4HyHCXl67mvI4oJNh1
	6BkhZDs4v9DIfai7nRC8Jj/R4UcXZIxH9jzo+5EkSc+6g5zQY2UKjkX5
X-Gm-Gg: AYBFou08EozWxGEpJprLrtPEoWxmhe3jarKr7pJJ876eGu+M1VfY6uE/eGPkwrNlpKh
	2UllHbsEAAlPdSENvXabfGv6R5dmS0IdJFAEW/nOs/Lpug/OVePpXF9v/xZS06J+sEVf8RDW3IK
	2CMadFErcLG2fXKT6A1NeMw7dZn5fDQpBzr0AiXtKZ8gC1PDWDuv17BBg7Z4nAlYM5CW9dw+6+X
	8WxahybwvpYpCrbPJZjaCPgpmWHa6JVx9Mqj9wz5CVymCuye+Gt0/9k7myRbI/EcMhqJng6Bvkg
	RQyqmb6AHkqVOAJhmrz+PPYIdeEHf9HxMoQQAwTz4NVPKh/bTzI1BXN0nnLWX/Zx2ZR+0HuUW9e
	YE5w0XtybRx2Vx7IUm0bfcYL0TZE9pWp8ELc3o/SbfdbRFtmOWrI1F3rRzK0FFgVS17G2QmZVP0
	rSnYzN1r9w5hFpI74Sbt49OTxIh4a7B0ctDtA4bSTXe39HxJHoANG3s3TvG0x47PZ6dg1Rw3f0/
	v4ubA9iwUjX9RH3Bom6jlQilbVYWuGvNDKZSl/RSnqVC35NgwTWscQ/HDkEM0bde/CW6K08KyfG
	O/2+kyDpJkvJjtuIDGf2K5TXg55ncr9W/f9wa1Zw/4TNPLmDMn7+QcUZBTBnconIovQ4fbqJ29S
	3Wkz4kKzjxlggvxugKH+krvF5obwh3kTFS53apR7EOEzmOJkIv1/kCTBkKl0pnZZIF0DXOu1DmM
	ggbJIOGILGHFokX+pWXBAmB8VrQabjDZPhWryHAgNOsx4VMYQdDd5DVRdHHyN2+9Y84rMzPynQ2
	vcsquPoEs9lyGn07ZTKLeRoOPfd9aT85DDLM9O/7v9f96LUOrQVm1JG
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr6257205e9.30.1795110886049;
        Thu, 19 Nov 2026 09:54:46 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:44 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/5] dt-bindings: display: allwinner: Add DE33 planes
Date: Thu, 19 Nov 2026 18:54:34 +0100
Message-ID: <20261119175437.2520400-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.43.0

