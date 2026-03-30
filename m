Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731E3ACEE3
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859907; cv=none; b=Sswy/FQaPxvSQL7JagsT5vy8t1+90PoiHlo5KvarIg7vAPX4XJ5Ybl/GHYQ5PkeqfC6BdA9TDDNexGdU6LGuGPpIiFVDehCXt3a5X+t59SSBYMx7ESopbErMwQr1lZJd0RdqsUv9UEjmwj+EqMY5ig6UxM8maq5PL4SKa97zHYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859907; c=relaxed/simple;
	bh=ukJEaVdX4VDSTNRrPu2xDDLoME5kyYmNbMApJbbiz48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbC7TlLW5WPWysN3Xu4jxxiANUY/qxt7Y+MGf7QHdP/R84++6wTN6KEaRWa9VJXNyTrgxG4z9hhUip4O8wR6sUj9+Y7xfEHRQNyYcFrFmLOjtTXe34RiXZmljohjA+eiHoZmrk+Yriz2HGmgVeEQfVp64t/XK/esv2tgPQ4XDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9jnTNVe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9jnTNVe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so40992285e9.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859905; x=1775464705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk1htAS4wrCqLvV0lbmjJX9VFRd6P5+nEK7bdtMsxTU=;
        b=C9jnTNVe+Lg+UKddtyIKxQuamj6gb1InuX2HHDWv/3auu5iEWXxqoAsCz0GwWG2Z2F
         WQmdxhRdOD1lj4IuHoz+5y0O4ZR/iG3S2NKq3vBSMFuZUcR50QLvpoEEGmdeamjK5E89
         KsL69CDNl4lISxWNLDm3fRRh4He/QLJJs+XWnR5BaH8Sl07d8zhH/wEeQjCeekTjsI22
         zhcU5kBt1g6bpoxCPz7rHqKuMZ7umg1adcDniBZa8iKPWp7HdtDTkg3zOyhmQUCn9uLS
         eRhxfwkO/O7sQyYyVvhq3sAYLdntTMGhHlt0vjgWY7JdXvWw2JVvjSCuvV4HkSETxA5L
         US7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859905; x=1775464705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bk1htAS4wrCqLvV0lbmjJX9VFRd6P5+nEK7bdtMsxTU=;
        b=VkLidlUkOUdfPfxiONI8Z5IAKQWUx5STF0iEVBlbN//rEakZFWX2w4tG2l4uYDkNdD
         BAOXkH3ypqdR0M+YXh2H12rmhgtlmVl/JdwHOq8WUpFSazyDpkvYc0FLP47JsIupmgFw
         1qamUqVjnXu0CeSgusw/ibyBOGAmVQM+EU4JM7sBPDmNjsPR7269g462pKMmjjSqHiul
         cthXFyWCp9udb6l18VqWAYnT/8UoUUlTRZ/ZPD74ruDVVlK0e3ILRP9X8yheaGk2YBny
         4vuEKHodg8l2iKJqT0OJhymxUEisgTIM3sfuLZ8q6MPU2EBOBEscROIy0KxL//VsF0ws
         iI0g==
X-Forwarded-Encrypted: i=1; AJvYcCUoqWsx/AOK/iHljH/DKoIwxAEroZemw3e6JcNfAr7sNBPWTu4WYtEv9Ga3aIEXPxDV0ZCNHViQyxX+@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMJNdTKWmomPN7JIwEwDYwIj8py4+RI07Wgd9TSdFBQpq2qPY
	BileLbrTHpMtgkgOMA8uBeXELzT5uSk4jc7/W3vD+BH3N9Po/1fMd2uLZt2uaA==
X-Gm-Gg: ATEYQzx10+S9CyBl1DQjPSsIeN5NNyEN3zu5zmVlkyy5VQD2AHeD+6rZqLeBQ1inHBK
	9MAhnNgU7LbzzsfEKPMtKoAovo7uh9a2pX7/XU+RcwjZfCPd+ZOnqxk87XjiMDRm25aXTym7WFS
	jKNzPNGkad4e55mfFw/RpUj1K0wHiGLK7Qpy10WJ2l0jmizAe0jgc4iNQRlakNBmmwWvLPALDxX
	bO7wFF0RBYR6vFncr3FZ8opwLt8nUlGgiX+B6qXbtaImb8h4ricmcuzHEcI2Lg7ZqK09w0WlOj+
	ZnX/L5jcqNRAUEvb087v+068VAXIftz3G6WBImH4iFYfOjHwQTk7G3EzBSr5++X6510fyKkTTuC
	99t8TCqAGxoQDHAZJiz36EWkL5Z1vXFbUH45QnhEw8TD4EVb+irwQN9McslZqwyjVvnCFZZPZUk
	we8P0tc9QkpRhdvz5pfSTaMlZaT4ptGlp4TMDi5zaeJ4WIeodOb8K4PywavjcJd7YD
X-Received: by 2002:a05:600c:46c5:b0:485:39d1:b4dd with SMTP id 5b1f17b1804b1-48727ef0bcemr204913105e9.10.1774859904599;
        Mon, 30 Mar 2026 01:38:24 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:02 +0200
Subject: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Document pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

Add optional pinctrl-names property with two states:
- "default": For 3.3V operation with standard drive strength
- "state_uhs": For 1.8V operation with optimized drive strength

These pinctrl states allow the SDHCI driver to coordinate voltage
switching with pin configuration changes, ensuring proper signal
integrity during UHS-I mode transitions.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../devicetree/bindings/mmc/spacemit,sdhci.yaml         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..201ab97f0e88376a4680dcca7917e8b3172bd84a 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -44,6 +44,20 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - default
+        - state_uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation
+
 required:
   - compatible
   - reg
@@ -62,4 +76,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "state_uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0

