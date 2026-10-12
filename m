Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB74476CCA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799783; cv=none; b=G5QakfurJRabaCHOKRv+593kzfpMm90S17ve8nldFM4ukEjB8VaB2WGfTldOGmNUewvfEYcegFYtNccYzYXrAIWK1OIjbCUDAQh4f3oAtixmDufs/lsLJ44pVMM2g8LTPH1m9ZpkqcEoym3vpXvtUrhMpoIXLAfJu0U7SneldP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799783; c=relaxed/simple;
	bh=KOfinKpMQsa5zSbyZ5FVh9P3doA6BZAOXn+lKRg+jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUrKkSW8QEGL7lNDmhWmbo9VbfbIfh39LOCHENcKZYJuTJ1XfI65KgW0L7aa0w1/n0s55/Dp5CDl+dO98vZJ+C6d1Yk1IPoTFUOs8ygM/cQqJQJPPQloPi4gE3GvuVwtpnArxaxW5hTpR9F6NK9BPfd3MZQT3iGarcKdPiAP2EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0I71sog; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0I71sog"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16c399641so17499195e9.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799774; x=1792404574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=n0I71soggFx87zpN+Kp7argQ60LSXxn2BUpQReOSetaejNimBO0oxnef5h9IDY9P4z
         9yphp2LSstrmvvK+XKZp2Km8n2orEZ4YwsruCT2KT0Ffqt5yV5jyd3BcWUIXPd92dKnd
         94Z0zA0w0s/NrHvCnyvk03l1jqbmMKjYNQLQFsAZfyocN374jhdoHn3upbw7h9SiEDGB
         B1cPZkHJtZJxTt97tT9KBJ5u4RZUonoIqP6CpOpPSG+KgFu3HBX/KqD7aR5s9qGO4Lv+
         vmbvf1015rfFuGn3ebpIVCMaHAr4ifkNJ08evoL3Shkbmh4+brN4/mtXrkyMT4o4r6Wa
         YlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799774; x=1792404574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=FxLNzgepuV0lVyohWPzfwGy7+oMCXt4BPMTw+erT3Zvi/+w1zdFnb0vS6k0luUivlf
         eptIGN3vBMXnH0kVccr1w86OqJOPTPIllJUxJflX6/LoDYMe4xjLByPHMc1Duxcbutj3
         L+Aid/P2Rj/9bKy4PAcPc85zwddfzi6Pvi+RZkMozMgUgTUJtN5KqjRC/qlbLmOrTQoZ
         pGSXCJA8+jplgpIZpLAb6Z5gVtVcTwKoBfyv0pewsewnhkqIWTtMixbTy7aTpHHiO1hI
         VQmoHIH+S9JLa6CU6bjZ4OU6pRp/DT7uj6EMl9ONP4sxc4F0a7q12Nm/THvKj5OUaNKM
         7ZUg==
X-Forwarded-Encrypted: i=1; AKwUvBy/oIj7gYpP5EdgpotxuC2baLUmMxDMN2Tagsq0mZ9GSz8tSSkOD2KgMPNmydloEiawrDyhbvQmMRDQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLXfj+lLBntWw2xem/8pQ0yvPwcqsf1obQD37SEEXWP7FOl8Keh
	/VjUzqOyH6nsXXQcVy4C67NOf0j+HLbGaFVlfD3K6QnwQXxb/acAgx0s
X-Gm-Gg: AYBFou0rKX3bJjWxyp790PHxJHu8k/TINqeJl9GGmXA1RiX591+QhVTjwFNW7yynSAp
	ffjQHO7XLb/3JoashwQc9HXkAcGhEDlqeVhJBjl4kRZ4eNmJS69JMEj9jARJEEB5fwvswpUNWAG
	aCUzjXaJkvNN53RDZDA//1/FJSHLZ0XMbFyuwsS8/xlzkvLPkMvXFxZA04V8lerRl9xVCxk1J2h
	4l2O8BA5lUspG6YKPRURWQneBvJ5vjq29RJsAoqckhZeyAmLpxtJV2TIcjNsgW0EIHEo4UcIDlJ
	8LZki909YzjKez1Frt3d0oe2Cwx5Joj7pfZbO0Ycj5tlFD8AI/3WzAUadVQPGWG4J7w0h5Mu3Jc
	ELmy0BzXD4VSY1xXdigDvwmziQusp9fVcKZxwzqsyn1B6pbeptArOZztW++7Dv34VkkyQKEBczQ
	1kcH7xNVvZeOWLFNZ3DhIGqOIvn/X8Cs0imsQLuyxK6TloA8n2V5nwWAO5is2J6wnvn1ZcmhXzd
	cQy0P3JInwPu2M0SWOCS18V2p+xNWC8
X-Received: by 2002:a05:600c:5397:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a18e4a7cacmr168741805e9.25.1791799773645;
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:08 +0100
Message-ID: <20261012100816.331033-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0

