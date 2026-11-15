Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723089;
	b=xx+xwylL3I1Gb9SpbgOc8WMZzddoFAN7rDQjW0iMYqONV+8gQHsTmzXIX/pdHYc49wf8
	 LR+WVhfq3PuUG1Qub8bi2rGGINj5vooq5wUf+YdCyBSCHsREqzLvK8pxVhS6ZLGy2pLSy
	 1UoSw7wmT/DzNd6lHHfeVQ0pxKTEkvnGJW48ldFp5jWJpApQ46Zj5nzemdkkejEn4jc2d
	 fCBkFj3RXT0Y/UDRO8k3JS/ef7NDOSABSWHrDqZdYaPx89le/3G+QQ+pFWmlbLfs6T9ew
	 XPzqQuj4KNOYhWV2zUMTm/PszYDJFW7Rpr9tBZnr93BR1T8ZooGX1VGsI8EN5frKLAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
	b=hNpUIMOcfw7A9j+pzAkRl/P2OP+8i22oTqXXP5QF12k0256SCPlPdcqbsMhTJtG/L1xi
	 xvjQtGkc1B8WpSC+QMot42Fs3hQ4yJpmiRfs/KBtwh9AKY0PAHJHDdnGZarERDJMwOCun
	 vyO5Ab+7HAyaJiw45rGYj5FsPlbYWga1hUfw3Ug49cIrdt2Z6HdAe8/lMGFFIJAuAjqjm
	 S4i5fnlwtE8AQxKaKNJeXEQe8QtoFvHCSuD7Z1kt8q4ZaTnlliO8eBJrwr3vZCUKsywKB
	 91uZdYtpZrBh58cDFM5TFO/yL3FpZvFDGpzGe6aFCsvlWfYnRIi/u9vKcUWP+1CgekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+gyXwI8;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208C60A260D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8208C60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+gyXwI8
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so1247955e9.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723088; x=1795327888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=Q+gyXwI8LIx7puLPN65lju54JGjmdSj9JiMh/HocFFarinZH4LA1OHXXAQEUVDkCmZ
         RDS8ZdDg00H0s9mcDoeYA/+f+x6lmRW6XxL52XpRXJrcq4cTaEFYT5s9uNDFmuSiF2m0
         UPn/OQs0MwB2BrJfpQ04fCK2Q87z6/N4RPTOmQ80ZoKpxKpios4af4eHOG69lVSXy0as
         VLo1+HMYqJADHUd8Hroxrhf5TmgDAn+Nb7DONC6xq7bMAtPkbfn5i6ykyu0FsvSS6hXg
         4ZAmST2jIYGXN2ROt77w82kJPbly6gEWRGMUQjv5oUKq2tuWlEvOtHs/l/m2JRY8RNr2
         8JQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723088; x=1795327888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=iXJ/EtKm9Q1mRp3NZN+FWwqnxaRwsiERSUpzRzJbjHCQrykHX+LzRHenA2RjTffM4x
         dlIBlsuJj0c5h6sJK/uVGf9fc6GPFkE5SHzlCmI1yffaQq1a75ARXdJmePKQXoU5Xcc4
         EptsCGnHrljrI0x+6cKwBr+DAWP/BEEP86le5akRPQCOjpNT12gQe+K/gGJyxjgaZix+
         Ajxgc+czS1lqnvVFgw59GajkwIzRlFj3Y8+ZhJ+XOmJuPuaS6FhCXVUMojtLrgdHXkOM
         GBRywEhl9oJ31SQ59IBwprCABZJkyYuVEuBcPfqL+cAVqYpFnEIWqaiTq3C2U8MgFsa9
         Rntw==
X-Forwarded-Encrypted: i=1; AL+hErHdUv2Lb30YlsHos5Jp4XS7vxtA1aUyX0wn27YN+vBVo7OIlTjefU8DbU+8zjPYVelpfPrIr0jmxoWO@vger.kernel.org
X-Gm-Message-State: APuU4Z/MtHTqqt9S4puBVtt+9xGUFYME2VQ9h46FcVx7e+keZOi0jw4V
	TeCiqTt8ic8/eonGdmeV/YPyoR2ypIonFt80tLiYrcTFPUFXEnPLiWaD
X-Gm-Gg: AYBFou2YQnA1xcTLAQTzzmP+hi9Xz/AUVgd03nIpvM3laajta/pPGdhd2rwLmjKr7jy
	lZFn5/VEBlJKonPryvxeh7Qb2OdpU7DifwC+PWNk+/2kcJvZslCTy6WC3XLa29Yeu4vLdUyA6mq
	P7yY98f+j8DtxlAc+4QvmzwNpEnQVk5UcO9hS4SCXbwXImVox6paE0QaUKYFgZD0ICaXjfxkCCk
	PqS4T0tA2OokgZqyR2eZ95lMdCM8WlKEGacXypc9QKL4hHQP9XxiGYn2vHESG5yy+Bi9M/6wCpc
	4U5pUrfAwWa6evvPWO41pNh0F+eGSTcZwbsdT6L6SKFTFWbRhsYm32dT+JoLHcmbShKqhsdphaS
	ZbuFSJ0DrZOwgYwaFCXn1YkwCZI5z5dZasIz1Q5ydv0HuTCXhnZqHP5ncqQrFF6E8hIMDsNwgML
	1GqxRzKwvKkhO6yLHb0gyDXvEr2lFpT9m7YDaZC35pt3zvrzLbMJ7WARubCOEU09ELSZGCWPyKN
	iRjXGxsbLQ47bm1zAM6U7B/BJ4sS/iqB7iwNzA9j7/24o01U6yCUEApX06o/ypzruUc3tREo436
	dHomGPgj7vvJkBSa7OcVJmYI+ZMFAQStSnX70zRmCJ4quXE7iJwtLfTPxgxceajQdoYDvWWlpeD
	M3acJeccLp+EUVKPrboVXA5f6KID6XfrgjMOQ/SiLF7qhkzzkWO8my0EP1phVvv0gcqRg90e9vY
	dGNNcxUTMVsmxHOHUKBeQ2IF+6NnoQRTt993upvHaDWdggwAr1oVSuaROd1YzlXF9DDTAsYyg9K
	dEVBAWJX480Pg==
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr135894335e9.3.1794723087765;
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
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
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 15 Nov 2026 07:10:59 +0100
Message-ID: <20261115061102.229680-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

