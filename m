Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413611;
	b=3tRLGWTnH1E0ardBSEB4L54Sljss87gEw8F7l4pxrsbhO0pPBuN1mTjpmN9q2Yb2tyDn
	 x5wMbrnoD2f2MZxXbW9gUKnuf7jswkQEwa2O5AK9RNeAOAZuQvU748FNmnktSG4hPDRaA
	 wee12GwrRoy6+wk3o8arbcjEXuAzpBdxUJNj7x/jkaIDyWh6Ydc/3Re5+y1y4a0FamZVc
	 n6+7G77fY8RGECGE1MxpSyZdeHPuDoWT7caVQ6MRFyAtZaBeWIUXTfXdqb0vmjhGhNmpU
	 zmthnrEBpz8jYJ7N7L+/rEppf93btPfHOMrbvzuhN3wCBLBsftPWUK13GqOGQE0cHkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=;
	b=RmKnvzzWWBt1r3hanZp8l+NkGjF6nwt2W1dyDsdoMb4a0yeMs7E9oRTd0u5356KiYnWQ
	 zt04nS9Z0BC9/UpynYls96272rIVo3Eztf38BFYSIenLd2psFyeXCGwhfLsihuT+2tAVj
	 jMJIpeAFnKQyGcub54liQH4y+cGI8lk8G3TdaDiZRQnh8wAAK+9ARMKt/AnsldECE2tYq
	 PHsUtSjZVq+dqazqbWc1ex4BRD7KityuLVhbZ6OH9tu40g73Q+pzeWSC34Cu/frelFq6Y
	 X0mXsnLyXaTEzN0rCS+00nLm0lA/EF2YVXZg8y7ZqQUrPiEcGQPSOKibTb6/dnSTQkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glUCXoFL;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F92606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 02:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F92606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glUCXoFL
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702dedeb70dso909509eaf.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413610; x=1794018410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=;
        b=glUCXoFLqm7/xMKQrZuJ4D9rfNxN0e9bXiDZ/X9dcYrcrKb6856ArrDVOPzh4wMx0t
         VATTbSUi/nQfD94AGMtGnqPJ8aMXjm/Bqtok6hKk3Jj8GuXe9GZxGlV7qQ7W+uBylAnE
         zVF/zU5pBDEROvoiLxlHfUje4TJFdS8VbhShtH18wN0iXBFBdoFfUXr1iMQaKku9TXDv
         u/3IxmnWLP98Rz51etX1EQpD6HDNDbPrIF/XvVnRWlVLRAYLbBYeTQDKZAgHw2ZpKA5X
         WXhsBkuk5x/vQjVURclhedubGkSEwxFa0nv/ysCoqnq1X7vZN6jHIALq7PEWp3oiQP3k
         EyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413610; x=1794018410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=;
        b=qlwsK8ceWqxry36un0NGpMkC4rvhQFQk371ibvOosF+iGqQqktDwMnMdsKMHfTS7/F
         3TokP3XiB1qVpT+QsgIfXLaMZdlQ7dghL1r9B47KukkgKIZ/EjXcwoEYCxSYWcoxREqe
         ETQ9v/NmbUvWNgwnGknGsFv5ONQwSqZCtS6CQiX0les+dq07XnhAJAIY1pMl8IUKVOfF
         mCCimUglmrk8/D3JcNR44m6/oIBqOyDxoMpCxjR/3e7Ao+YJ56Zp59I0Uh5LHWYBpXp2
         tJkX6GjF/PkXUbl7+Y0GelXf0BDP1epmOVGSofFYkKedRxuiTL3MLHckmuLlqxYIiFAr
         hYSA==
X-Forwarded-Encrypted: i=1; AKwUvBx5QITNq7PyuhXAQY7Wsue31bcY1Lw8a6Q5Lu843E0iKy71Zt7a7z+fUQkNXY3Tg/iXnOROva6X9MeW@vger.kernel.org
X-Gm-Message-State: AFq9FYKa1gIQi61DSzGFJaD5UJyxaQkd6gyqGm+r/x5DtieKEnePfX98
	zk3vFSohPTGtvj5Dc8sNmWG96sBBbua0D9zwec2BaTC2lIzpJsjZgV8/
X-Gm-Gg: AYBFou2VmLmEf3jL3CjrvAdDHd9ayu1m1gHHEssygHf25DEO3r7/avSKZkhuVLgKUz7
	gEAjCW+bVtXWNjwiCq+axGOgaAHEYROFGbuXKMbEB/fk+E72yj/95kBYUqY9GAHbHA6bUw10Ip0
	hyTKIsey+6WC+ELIPpx5c6HTfIHS+iDslHEtzToExbxHmyHugTmJh3PyzY4srx6SRbt7ySX806B
	lgU5K0ziUBv6214ZnlV0p1oSFFs8i8cPtvHi+bR0W27m9N9Whnd1otpmVJA5omgpdUotso+kmt9
	XTyHfd9zyQ1lpazwrRRZXp5CL/xJtbD0uGv40hMlRpToRAeddGzeDYCDiB5iFcaDvyf7YdJ/Q8T
	ygprqdtYd0C0i3tFdndQDXscaic8pT4iDBpDHypESfN2TpooQBktDgNgn4uDY2iQLgrRKlvUeik
	u9VDbImS/0Jf2VFdAM5Qa9FwJIyDR7jooSnwW8n6H/WV6R+3Jcle+Lk1gWwzlZ/CJHq/NLISA/6
	86vokaS4se/1/khTqDI/SDy2H8uWFyrdfqpQGJe3dbg4wR3rReUMA5xT8D5CbXpvQWKqy82VIT6
	d0fnfiABKcrJ/zv3WWuscmWE8+Ailw1//9IW4gKFYENZJ0PFMVK4ypf+EerTHSA6ceMQwbym0UB
	0jVjf1w==
X-Received: by 2002:a05:6820:7082:10b0:70d:9d05:dbf with SMTP id 006d021491bc7-714f27fe3cemr1676288eaf.90.1793413609920;
        Fri, 30 Oct 2026 19:26:49 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2e500d0sm3126067eaf.10.2026.10.30.19.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:49 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH] dt-bindings: mmc: describe the Allwinner A733 eMMC controller
Date: Fri, 30 Oct 2026 22:26:47 -0400
Message-ID: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

SMHC3 uses a different DMA descriptor format from SMHC0/2: the length
field is 12 bits and the ownership/control word carries different
control and high-address fields. An older A100/D1 fallback would claim
unsupported programming compatibility with the existing sunxi-mmc
descriptor builder.

Give SMHC3 a distinct compatible and describe its register range,
interrupt, bus/module/storage-MBUS/MSI-Lite1 clocks and bus reset. This
binding permits an accurate disabled hardware description; no
operational driver match or eMMC functionality is claimed here.

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This binding is a separate prerequisite for the disabled MMC3 node in
the A733 DT v2. It does not add a sunxi-mmc driver match or claim an
operational eMMC path.

The original A733 manual and public vendor implementation distinguish
SMHC3's descriptor control/high-address fields and 12-bit buffer
length from SMHC0-2. Its resources are the 0x04023000/0x1000 register
window, SPI 164, AHB/module/storage-MBUS/MSI-Lite1 clocks and AHB reset.
The generic A733/D1 MMC0-2 compatible already in the base is unchanged.

The example uses the public A733 CCU header IDs. The tested standalone
base is official commit d89e1d186ec9271bf78e62771779e9fc03bf0fc3 plus
the clock helpers and CCU v6:
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech

The binding example passes dt_binding_check, and its disabled DTS
user passes W=2 CHECK_DTBS=y. MMC0 runtime tests exercise the existing
controller driver; they are not MMC3 hardware validation.

 .../mmc/allwinner,sun60i-a733-emmc.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..07dc6759b937c8998c4ca72cae027f9444a0793c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/allwinner,sun60i-a733-emmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 eMMC controller
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description:
+  The SMHC3 controller has a different DMA descriptor format from SMHC0-2,
+  with 12-bit buffer lengths and high address bits in the descriptor control
+  word. It is not compatible with the earlier Allwinner MMC controllers.
+
+allOf:
+  - $ref: mmc-controller.yaml
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-emmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AHB interface clock
+      - description: Module clock
+      - description: Storage MBUS clock
+      - description: MSI-Lite1 interface clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: mmc
+      - const: mbus
+      - const: msi
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: ahb
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+
+    mmc@4023000 {
+        compatible = "allwinner,sun60i-a733-emmc";
+        reg = <0x04023000 0x1000>;
+        interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_MMC3>, <&ccu CLK_MMC3>,
+                 <&ccu CLK_MBUS_STORE>, <&ccu CLK_BUS_MSI_LITE1>;
+        clock-names = "ahb", "mmc", "mbus", "msi";
+        resets = <&ccu RST_BUS_MMC3>;
+        reset-names = "ahb";
+    };

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
-- 
2.53.0

