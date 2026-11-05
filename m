Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873008;
	b=3pg9pTT3UShalZfenH20oaujlE2PUKAs6zEcbB54S09nmuv7Nts6Y4eWZM/zWa2rnqE9
	 6qo/KzTco9KV4Exv9B3sbrdJkXKBeFjJLvAmt35efdT+g4kNp29C0iLH7igqPODvQ5NvF
	 bWN1pXq7QLgHOvImot27YDL/iEMxRpJjaWL3TuZTKtbp4gSHu567XxE2SA5Ff28P0ugVa
	 yGk/qSby0jInLCSDhV6bhoHdNc+8n+h+NblaVGRb50+4VgmPcak14TcQ8Ow35HdHRneDr
	 8QotRUoU2rbsQgSq+ZppBbK5HoAUbVg6JycxvfuqPHdxm03bMFWTYnyXsy2KIyE8i4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873008;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
	b=a6R1wPdmzif58c12a482zgre5IAGBbBBRPjDYlEqjPXGpyA9aAOy4oEfKKSMbuIIPSKC
	 8lv1b1Pph0gBJvR5O3dDnbnoMfGLXyOn3KGnZ1uqbZby5bIXVgLBGRKOwhCRiemwvhHT2
	 ehUknztv+Dq2FBxtF7rAAeyM3UCjU1I/RhWf9J0vV6fojg2LTQ3RGJ5kdr/ETGzP7U36M
	 2DVntUOg0gLw7Efn8vJvB3CgHK3SrxVkpGC2rBopMOBEB+jJuqUOGCK3oCGEi6EMpkE9W
	 atB1n0FyA7spvrg8BVCeb1VaxCiE99xuqkbX7WnrIsBTHLPSP+BPgmpyLhbrqBiug3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07530606A33E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07530606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4947415e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873006; x=1794477806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
        b=YAOM4mO5nnX8QBmI4L6jo/p3qyPMVvx2ZLr5PGPfyltuqZTAS0yaOx7mT/gbJfn+jl
         oQIcaIeohaY80tq6PDK0ZwarQ7+sDNUhR3uORePhQg+gbzXVNmPqwZN/UgY915GhH92S
         hYH/NFbmmQqZMxy0gcewWsZz2tIsincvU2eyHxmYYzzoHqUx/t7HhHmjcXIAPavq+58T
         1S7J5jGq46KjA3AuavdqJ+GIWplra9pQUZPkd1ki0EJzwpqScX3ErEHgYz2xVVY3VWyb
         Cju38ggW1JUAG1Gz9Uf/CXeE+D/24jJDB7oQu3ADIyZB8KcJQgkPC09ycf7uzI5VRIcG
         6afQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEeJmHUtHZcXkjT8iePHIPLEWnj55Twua971d9V5ODyh/COQzxqAqzFv2O515xYurubejHQZb2IgNo@vger.kernel.org
X-Gm-Message-State: APuU4Z9syoc4WoPA3BEDZgJ+sxRbYa009sfwxRDZ8HowQ3MKUNtpm59n
	5UwGCwQRbriwlCUvrHFyhuq/JHQaBwcuiCnL9PMAp43pgdZ6VU2FCwbG
X-Gm-Gg: AYBFou17+VfTAQwLLtJz4OMNxCcBO6eJWALaM917huzOI8Fk3cJvoRwUR14UC5+NSwL
	acLZWmdwOpHHaFI7V9ddA20SjVdaG/USORZ72557gXHjirZysEHNHD4fLP8AHQ/n9XOtY7X5n3f
	hbnYGorO3leNgKy2Ra54SyAkPW0JugPIuUFmQ70jJvweGK73mHdrUVyVsaj4NfVyfxyTO9oM3Sq
	eDxoh8VNDOgDg5zXwUthkf0YlbKhQB2aXSwt84z1lBSv3ch2vB3ZjYJ50zTFlTY1Q9iurU2EX/D
	B1D6/M6A2+fLm+UwhTI8tzEsvIJNSMhARH+SV7DyozAZOBVKpwSs/4V2J0eaz9ijOL3DQ4mX3X/
	Rdecp+2S5wqD0MENtsYa4rUShJU8oNyy+Y4CS9mQWJUA7Y+aQeLzUYUymz+ysBvuTKkgJct3hJz
	MQoGVELk1LbPz4rWi7ahvHn3ZwKvhNLjBK755sgi6PYLgH/lNx5Glc1nSQ+ALr/bxvu79zMfhVW
	ZpKxy2X1LXYt0JaCmFfwSA6QH1GSULAWI4CuA0U2ygXz8pUNYXQy9qPYAaSBd1PvyM2v9kYeN96
	cRqSv7ITAwJcfAmoOGADOy0TUq1V/Papu/eLzELRd3TOtm0+UoCN8XZgQpR0rnlcvyk/axMUPes
	TkrMW4Mw3B+4qzb4Axzvd3fJZzQ==
X-Received: by 2002:a05:600c:45d4:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4b55de92333mr36628635e9.14.1793873006268;
        Thu, 05 Nov 2026 02:03:26 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:25 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Thu,  5 Nov 2026 10:03:16 +0000
Message-ID: <20261105100322.37816-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 9c9cc3ef384d..e769c9bb70d8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -175,7 +174,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0

