Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547675;
	b=pFI1kz8YBgX/tVL3f5yPTZKCRuQdP1TorzVyBYO0j9Xk9tzOPnAXLoCVMXohqcmnPkYt
	 o/Oyl6Mk/s7RSS396qSY7SJs8SwXXwA6mbf+m5F0aN/246Hn/WwCin8OLFvg2zCsUX+OS
	 3gq25BJJkTfQKE4Ey243q0H66BaVW371dExebdVqZNiZKXs6NK6p0AtZV6LMEb11zL9Oh
	 uV1Mz7IqgoBas8v0MAcGMGh5LWqcsNYzsSUL78nW3XFX+aSFr4sGw1oHXYewTJBIMOo9s
	 G+95Wn2OIWk80WuCu5WuZoHLM8ZWBxQYkt9TJ4I5PlCY+z+k1tDgYQG6l4CumdC8wtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
	b=Bte/6wj0tUb8JSrBHIZdY7gH7FlQPdgWY2LhzXUGMhXqXMZhaqesl83AWs+gZgZBlCd0
	 IFRbAzZdSScVsFPEvxX5miixYN4MYKCpwmWI/xk8OtDCFV7fvjJ7O6LLkaOyrZ4taUOE5
	 MaAiR1HFGKdEanY1ibKnYBe/NN2VrHz67Zxsdyn6wuWMitevKpzHMmi2pXwr4cagX7rLv
	 v85tccIAjyoK3ARsjOmPmiI6qKA1Bu+QeZcy3vwa250GZWSIdvtK82lioc+eZ8XyMl5ab
	 Xv22vYlqgMwGoWzKe5Eiv7n6Jf0ujyIwr1waZp3kVQY69gqYIehnT5D9SH8XqH/srPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8qCQHxs;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE731606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 15:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE731606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8qCQHxs
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so967333a91.3
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 07:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547674; x=1794152474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
        b=F8qCQHxsnJUexYLUijluUTj0ujitt9XSRYWb9YYBlHV75TG1jKhiZb+1DLKn/sd5Qz
         YKFPGKeUa9q0sCYuG3C45tAijz6AGntbYXiHbr/+b4AV85iTas9pxyPYpbCPYl/5wkPz
         QLQk39ItxLRkWS2C30gz2KFiQ/hKfSsEnAXVUT21I1B/u5Pw1bM6/stlffbUJTbvjMu4
         VGNTKpjJtvNZnTclpi05ulPX2nNA0nLTyZnpbIqwh9nucI5uT3ga/dZaui+Vdrb6ecNv
         qQNqcekTjOBgfFO9GF3MdCisbAaOsHWOmiMBaPG3HmrDtHn+xY6trCZnDrNw2kryvsAx
         Fj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547674; x=1794152474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
        b=H4HMDWKCZ1v+GBYCaUJezbPEcFDDwbOGm+wpvhUoKXdGbBXJwRL196DA/wivkzBWgc
         p+ksS3q/iQz7X3JRxwMqkb9WISpR0ebRVIW3oag1YrmNC3iWUEWtAtV32T+w37enLnvS
         Emx/2JBJlfGdwJ7GZAoe46n4DgzH3G4tilzB6YrgTrVOirD2XkrzKbl+2o7nu3C+pOel
         eM9dmMJDj0qVL08L1FWcH9SrDE2+ijxmiJNdG5tEmkoc4oVs8QSUhpnnzYc5xi6qL95a
         0g45/IlmcboZ2XxJA2En5kIkzEbRnWqilhMg8Bzm3cxhZItbFxJgnPOQDpCfapOYXIm4
         srzw==
X-Forwarded-Encrypted: i=1; AKwUvBwPGP4NSkdhMhibiPXQ7x2pKfev1M8e82SUX+m9yuKVzUdjth/5So51I9q1eHqyOTjorciSx4l228r/@vger.kernel.org
X-Gm-Message-State: APuU4Z++K67Dtfob1/OV6/ILgiaHjsjA4ljiaf7wq969NxBJdni3cHk8
	mrBbFYKE3DJKY4KyyI7Ig0R1vmnPWydexx2xsWm76btnrVpKcI0BU0cU
X-Gm-Gg: AYBFou03IfnM8cVukcPYPHsw6kR1SAN4fQoCcGIvHSbGbss/xrJ/uKpCzgButjnpFrp
	PqIOQdIwZ4bSuP3PbNa/EUN55F/U1K06x4v9JUXaNmTZklctR4cwHgjCwzBLYKS4iHRmn9XOxUk
	7lgypD9p/ILo/TCjhdSFbbQsVYtNWKSvFLhGBMWjn+HY4ikQ0di/KFZbspSHos59sgvSttpehgA
	aHn5FT9QbSN0ItXUcq8HpFRf/EPt+OLaFrV/0GDv0UGf5yfC+bdb6uzZYMl7cjhDhEpy4rX/ggl
	xrikPeupc0Jv+Nn84azocWnLJsldke7X4rx1w6j+FY37JQ74pIf6vryvZwGwMY3NEjdvHJmh5Kv
	cpqCwMaJ7A8tLwMeS8XbLP8G+nN4wL8MPLmWlZqPI7Az7xSSQWi78elhhTUDCvFemp/uCay9mVZ
	AK19YMD6K0MrVIoBB8umbvE+9ECbIv6We6elv8f9OxET1g4aigs7aGUzNvg/aeMOy+Se6PmQca6
	ZKCUHtPfNP6L9PDxMygvKWHTvUjOGe5+aOPcriPb//nJN1HaOXGLqBB2hm/dbg5kEtMHsDzTlyM
	eYQDJ5yGqUAbRkaK2ae4TYFf6ci6F9D5ShsO9e3zzw==
X-Received: by 2002:a17:90b:4c08:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3ae8957cb02mr6684585a91.8.1793547673934;
        Sun, 01 Nov 2026 07:41:13 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:13 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Sun,  1 Nov 2026 23:40:50 +0800
Message-ID: <20261101154053.3874-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
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

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time. The driver reads them for every RK8xx variant that is
the system power controller, so define them once, in a schema shared by
the seven RK8xx bindings, and reference it from each. The bindings
switch to unevaluatedProperties: false so that the shared properties are
allowed, except rk817, which keeps additionalProperties: false and lists
the two properties: it also references dai-common, of which it only
allows a subset.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them, with an RK808 and with an RK818.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that.
A board adding these lines is expected to switch to the generic
system-power-controller property at the same time, so the deprecated
rockchip,system-power-controller spelling is not accepted here.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk805.yaml          |  3 +-
 .../bindings/mfd/rockchip,rk806.yaml          |  1 +
 .../bindings/mfd/rockchip,rk808.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk816.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk817.yaml          |  4 ++
 .../bindings/mfd/rockchip,rk818.yaml          |  5 ++-
 .../mfd/rockchip,rk8xx-power-hold.yaml        | 42 +++++++++++++++++++
 8 files changed, 65 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..38108fe 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -76,7 +76,10 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..ddf2b2f 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -87,6 +87,7 @@ properties:
     unevaluatedProperties: false
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - if:
       properties:
         '#clock-cells':
@@ -108,7 +109,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..5ca76dd 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -136,6 +136,7 @@ patternProperties:
         enum: [gpio_pwrctrl1, gpio_pwrctrl2, gpio_pwrctrl3]
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
 required:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..d51f815 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -119,7 +119,10 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..c0c8dec 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -107,7 +107,10 @@ required:
   - interrupts
   - '#clock-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..6207c42 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,9 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios: true
+  power-hold-delay-ms: true
+
   wakeup-source:
     type: boolean
     description:
@@ -157,6 +160,7 @@ properties:
     additionalProperties: false
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - $ref: /schemas/sound/dai-common.yaml#
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..c9b863a 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -111,7 +111,10 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
new file mode 100644
index 0000000..6be3e1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rockchip,rk8xx-power-hold.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK8xx PMIC board level power hold GPIOs
+
+maintainers:
+  - Yaozhong Li <yaozhonguwl@gmail.com>
+
+description:
+  Properties shared by the RK8xx PMIC bindings for boards that route power
+  hold lines from the SoC into the board's power circuitry, which have to
+  be released before the PMIC is asked to power the system off.
+
+properties:
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+additionalProperties: true
-- 
2.55.0.windows.3

