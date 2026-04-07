Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93363A3E7B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550365; cv=none; b=YmKfVtBoNnUCCEwo0zyVLXS5wOCYmsfZfGlMVs+n5MV6M8BaYbvOjA/XkPZLmZIBTlw5v1VxW992fBGZFQ3Rkhk/jhZ/EV4HbZp/O215xgbybgFmRBGxCWcyh7AJ9RtA6OQIj6EsfyQV6749ukwf6P+JyE+6qypO7JCP6nxsd0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550365; c=relaxed/simple;
	bh=Qk/MRdECLsEU42cJzI1xmlh9FrTNHcLigqTFDzeobEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9v4/lglrThQoq2anmEFXF0z/FSRexl+ZF6tFRUDNDA1ZfPCLCoyWtfX+LK91+VXZOuJqOqaC3g4NdjRdXeOlgDzBem1RBFF3E3uZ4XoFX6QMRPGgWMB8OUNd6jYBxvM5eanYl+zln5GQR5eo4Prz10EJXvj0o8aLgvpP+a1skk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWbsiufC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWbsiufC"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso4110958f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550362; x=1776155162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpUyjvSyTbzy5QP1Zl/gUHmx4JmgzxN5EinAbVZD5Nw=;
        b=DWbsiufCJ5FY+lyfZO8kGLNIRjrc0p0zAI+BGoNDfc/UYembE7tArTUvJgzaLZSe8q
         FUVkWFiRiaHoF5gyCBKx/3sZaS4c7b66F/nDBX+XV/9rBmnNS1bdO5eAvpM6bmDNpi3a
         m4aYX22BXa8s0JxsNczEaFt0HJclqZu6hATUuCng902Qn3Dxs4BqNGSYB8XHkittFXnV
         EEEnSbINxp8B7NkqlPRhgsCCCydOs9SuSLjww2uiz5c2H7cWWMRoeIsjj4LnfZLV0gx3
         sknfqNyoL3yc59nlTjM955QFg2m+Ft7H3XQuNTrERKinbcjEfHzfcZOQwhGE3ZH5QdNr
         Hc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550362; x=1776155162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpUyjvSyTbzy5QP1Zl/gUHmx4JmgzxN5EinAbVZD5Nw=;
        b=DejMYQOkj4g5tr0NZkLOpygQDY43a2F4UOX7IrpJ+yjV+woaSGnAr32/Aly4QyamJ0
         ssr+YR9jva6RkPLSMiXS/Gn06tqJk2EF4Qk7M09VTVpYEJvd4ilLV0gBJnIheOrqhWJu
         knamKc5O5cyxmGZBs02c+KWyQ9TudmpS8ry7zOirsnF2dM3/CMLmLWNElMx8/d78WWbg
         GuqK3kAJnRedux3MLNNQOgBE9U0O6bjfrupYLVyQD9Wuep2IIeDmSuUEw9ZID2qbNdFM
         qa6+RIblErzc5HNE/PbFZGt0zcbYiZMrom6Dm4tXlxjZF4mRSzlommlXtrm3uFlSBHqO
         WqlA==
X-Forwarded-Encrypted: i=1; AJvYcCUnKfabohroanzCEsKht3CiJnyMyRSuTJnczzSoedTi/cUv9MIzIpC0kbXz6Sr9W21u1ZgHsttymc2N@vger.kernel.org
X-Gm-Message-State: AOJu0YzjutfzNBq0GWjO2EQY2z58At5/iOdncvnF5W8DTExpO1Z4mULj
	uLUp5cWbodIJ13zcdHuxtG5e1QybIHJtDmho5Ht4g/zyL4zfmRLFpR7GJhvaLg==
X-Gm-Gg: AeBDieuYXFEA29kbjIOrlljgOXgEwpAOYFe67zuVwFuEl5IKlB3okPQes52WCHPKurH
	6EK66coOPF+rwzfqf/JHDpSZyGZQ/Vz87e/nP0Ud+AeaFmp8bUv/7c7zed1C725WJ59pKgA/s0v
	74sElAqi9fumjOFHkbhMyo4vXMFq/FhnOM2NEUQ0H0M8FAl+Pf87RYalGMQP+e8csN8rgH6Wa0c
	OVN6QlbvlHYWXp0beFIbSk543xVLJ2CLxux1OCLdfCdW52f0e24NBGml9Raq7MhMGLrNRJtA76t
	lw4ia2Yg8MNt891vRTmTwXX+K0pEusT7KoVXLEtyowglEcqHRAtqLelCAVT93H+drf0ABMMaoST
	ORT09bqf94oF5bqPxkg0G45UFrfEUPga/GsbjrgY9VFfRa7kvSPGHMpP40BYWZEyp1v1RBD5jmk
	2hiA+4wCCQNy4FVFlJUtOJYtQ7Ijl3GTYquimSTTT+ZxhCai1R4BhiMn4lSmoztlhl
X-Received: by 2002:a05:6000:61e:b0:43d:1bf6:927 with SMTP id ffacd0b85a97d-43d29295ffdmr22629143f8f.14.1775550362070;
        Tue, 07 Apr 2026 01:26:02 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:01 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:21 +0200
Subject: [PATCH v6 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-1-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
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
 .../devicetree/bindings/mmc/spacemit,sdhci.yaml          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..932fccc609bf8dbaf3ecfe09d9e610852ac7afa0 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: mmc-controller.yaml#
+  - $ref: sdhci-common.yaml#
 
 properties:
   compatible:
@@ -44,6 +45,18 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
+
 required:
   - compatible
   - reg
@@ -62,4 +75,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0

