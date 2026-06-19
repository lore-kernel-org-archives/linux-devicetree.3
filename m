Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6149A38D3FC
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874904; cv=none; b=heQ/maXdcb5N73iMXKpfrWwPJ9zAMwiwf9LsuKkcGBlwMK2u491fgbjrm+l/6pYjJgN3ACJ1HGHK4WYcgX4tunw5bxO8ZQjgzNLrycld3JVtOJKU8us7wuDbmBEq9CMmjwIBp2ocyMJyAzNzvg7lO3hIU9qBV/g2mjjzUJA+sGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874904; c=relaxed/simple;
	bh=YxxIEXLgsvv+EqfOcA0oFTALaJVb8BnU/3lRQtpSp6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zij0v1Aw66/uiY7V3Xk3a/fiqXrhTWp5LD7xuFj1devOGpj3Ubgx6k4NGDWn2hL1hJ+tWNqm1Nz/14LKr6hHIfwKAw9FpAVxLynkmLlTGbI/3PxlWCVAh9nDbCfCqaAqf9jkJILuJ6qZuOCg+GCKKOTUH8P3o9k8aBT4ojDUVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDG+jnlI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDG+jnlI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so15853075e9.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781874901; x=1782479701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z+LDNrobHjhIpFDTmopTHlm5zucU3ud66EkKOrBbKU=;
        b=iDG+jnlI40nmnmWC6MOaNFP/Swl87hlvFZdE9Rj1tmHJy0FW+gYlQt0pgLAhLf4lRi
         JoFVHkmfLhYqRbzx+xgbcppuAhh5vTWupgPwlnhwAZGGvdXzPKzpKb4o6WaLduqMbzY6
         TmkoY2iVWAel53UATefIVtgFMwo8a4rfYPpBl2wQIh0EoFjzp6W1RgWDs8WY5kcVbzId
         gVs8XAqxNeO0b4jANeONQoUFR0uXqgxJGj8XJRdRe6Dq0M+wJWzqY4SGGPbuUD0a03Gz
         A5zSRz2ZKFcifgmZ4OtbhmAMUzqA6VwqsEbuZ9CTqy6Qr9Zh4XhXj6yER3BO7zVRlaT8
         96kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874901; x=1782479701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Z+LDNrobHjhIpFDTmopTHlm5zucU3ud66EkKOrBbKU=;
        b=R2Fz/F6X13TZDIMwD/z+jhn8ubFcxfMB2PKCDqYNUis8yN6NYxdwPvpRJ+OLL02Jg7
         6SoJ7OItsaHtVCHORd0XjtEnKUR68PXpCV4XbBYFtPeTbdtZ6fVRv5D1oAPpoo+A3Nhm
         LZFSCcMzZNSM2VT5a2+YV10SDvJDCfCvVtWdP2Jz2hKO/KY6BbcXFAXZ8QNYWVwTnCmC
         3e1gh/Sdaupi3nUJAG+Hul0ZNZHcUJAryRIg8nGEdm6flqccCgzkqqmPiMUztF66NPfn
         NWlimQEhtXo2tTItfXUmMr+TLLeoc2OuucoejBu0TiWJdV9YNJNOv4ZVEtBtcUk8ZDD9
         jt5Q==
X-Forwarded-Encrypted: i=1; AFNElJ86amkzdNcro2nItpebnBbYiPaXNQN+BTxcAyZx56QZd2N4cdfhKyIhWEr7Qc+i514E83Wln0H92wL/@vger.kernel.org
X-Gm-Message-State: AOJu0YzSEyZu/oEEHnrdGHcqOHCKvw9BVg8Zgdy+0OkocRXEYAMHr9uY
	iXGO4W0lwT9t0Jmgq3y+o7Yj+J7vpLHkfuG2Ji/wTV2HpXc2sr0p3g1A
X-Gm-Gg: AfdE7cm1DZ8tlGkjtZn0ZfeMrBwkH0Rn3tVb0nair/KYMu8TtUREc+aLie8R9DXj9Jj
	CfVrXdIiZZIB1JjChX/V8iIycIept49v4jQuwkJTn1OnnHnof/89hV6HUY9oIj3K7+ntbrNYwXf
	FhbsR3q43L/eqH/DCaejA2N4yTTnlDHrReOA/uXbXxBPSpNEpM3xrnDs2XQQ2kATIlhRDSebwdv
	L34dgwNjaTOcx01Qnv20gztZKKyov+GbEkN6mId8J+ZSSrINkB6XvX/fhMXkXFGQDWFI5gzZwhV
	y3hxCsCic9ERYLB8vhkvVbu2NReT0UFxMaHf81Vw5n4zN1z1bNkTQsQViC0fpnMvtuw26v4/gNY
	sQ5AEK3I6Pg2x94iA1Unh0b7lTfViuHNGpPDqwn/8vKC4flI5MaVVOY1KxDFiDgiwo1k3EX3dUW
	hUur6dUqWafeYZ0/t9Ad5Ycn25OmvgYYAGR0+N6k5RUbnJjVbqRNw83ScC/+3YOQECl6g=
X-Received: by 2002:a05:600c:3e86:b0:492:10e8:3f92 with SMTP id 5b1f17b1804b1-4923f56c1d3mr62148475e9.17.1781874900421;
        Fri, 19 Jun 2026 06:15:00 -0700 (PDT)
Received: from fedora ([196.112.134.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcd7027sm71551925e9.1.2026.06.19.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:15:00 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Eric Piel <eric.piel@tremplin-utc.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v6] dt-bindings: misc: convert lis302.txt to YAML
Date: Fri, 19 Jun 2026 14:14:48 +0100
Message-ID: <20260619131448.906433-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the old lis302.txt with a YAML binding covering all four
compatibles (st,lis3lv02d, st,lis302dl-spi, st,lis331dlh,
st,lis33de) and their ~35 DT properties.

The old txt documented st,click-thresh-* and st,click-click-time-limit
but the code reads st,click-threshold-* and st,click-time-limit.
Keep the old names as deprecated so existing DTBs don't break.

Tested: dt_binding_check. dtbs_check against 7 omap/am335x DTBs
(am335x-evm, am335x-evmsk, am335x-pepper, am437x-sk-evm, omap3-n900,
omap3-n950, omap3-gta04a3) — no misc schema errors. Pre-existing
IIO schema errors on paired compatible nodes unchanged.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---

v6:
  - ACTUALLY commit the changes this time (git add before git commit --amend)
  - Remove redundant select block
  - Remove Vdd-supply/Vdd_IO-supply: false from SPI branch
  - Split allOf into two independent if/then branches
 .../devicetree/bindings/iio/accel/lis302.txt  | 119 ------
 .../bindings/misc/st,lis3lv02d.yaml           | 381 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 382 insertions(+), 119 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/accel/lis302.txt
 create mode 100644 Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml

diff --git a/Documentation/devicetree/bindings/iio/accel/lis302.txt b/Documentation/devicetree/bindings/iio/accel/lis302.txt
deleted file mode 100644
index 457539647f36..000000000000
--- a/Documentation/devicetree/bindings/iio/accel/lis302.txt
+++ /dev/null
@@ -1,119 +0,0 @@
-LIS302 accelerometer devicetree bindings
-
-This device is matched via its bus drivers, and has a number of properties
-that apply in on the generic device (independent from the bus).
-
-
-Required properties for the SPI bindings:
- - compatible: 		should be set to "st,lis3lv02d-spi"
- - reg:			the chipselect index
- - spi-max-frequency:	maximal bus speed, should be set to 1000000 unless
-			constrained by external circuitry
- - interrupts:		the interrupt generated by the device
-
-Required properties for the I2C bindings:
- - compatible:		should be set to "st,lis3lv02d"
- - reg:			i2c slave address
- - Vdd-supply:		The input supply for Vdd
- - Vdd_IO-supply:	The input supply for Vdd_IO
-
-
-Optional properties for all bus drivers:
-
- - st,click-single-{x,y,z}:	if present, tells the device to issue an
-				interrupt on single click events on the
-				x/y/z axis.
- - st,click-double-{x,y,z}:	if present, tells the device to issue an
-				interrupt on double click events on the
-				x/y/z axis.
- - st,click-thresh-{x,y,z}:	set the x/y/z axis threshold
- - st,click-click-time-limit:	click time limit, from 0 to 127.5msec
-				with step of 0.5 msec
- - st,click-latency:		click latency, from 0 to 255 msec with
-				step of 1 msec.
- - st,click-window:		click window, from 0 to 255 msec with
-				step of 1 msec.
- - st,irq{1,2}-disable:		disable IRQ 1/2
- - st,irq{1,2}-ff-wu-1:		raise IRQ 1/2 on FF_WU_1 condition
- - st,irq{1,2}-ff-wu-2:		raise IRQ 1/2 on FF_WU_2 condition
- - st,irq{1,2}-data-ready:	raise IRQ 1/2 on data ready condition
- - st,irq{1,2}-click:		raise IRQ 1/2 on click condition
- - st,irq-open-drain:		consider IRQ lines open-drain
- - st,irq-active-low:		make IRQ lines active low
- - st,wu-duration-1:		duration register for Free-Fall/Wake-Up
-				interrupt 1
- - st,wu-duration-2:		duration register for Free-Fall/Wake-Up
-				interrupt 2
- - st,wakeup-{x,y,z}-{lo,hi}:	set wakeup condition on x/y/z axis for
-				upper/lower limit
- - st,wakeup-threshold:		set wakeup threshold
- - st,wakeup2-{x,y,z}-{lo,hi}:	set wakeup condition on x/y/z axis for
-				upper/lower limit for second wakeup
-				engine.
- - st,wakeup2-threshold:	set wakeup threshold for second wakeup
-				engine.
- - st,highpass-cutoff-hz=:	1, 2, 4 or 8 for 1Hz, 2Hz, 4Hz or 8Hz of
-				highpass cut-off frequency
- - st,hipass{1,2}-disable:	disable highpass 1/2.
- - st,default-rate=:		set the default rate
- - st,axis-{x,y,z}=:		set the axis to map to the three coordinates.
-				Negative values can be used for inverted axis.
- - st,{min,max}-limit-{x,y,z}	set the min/max limits for x/y/z axis
-				(used by self-test)
-
-
-Example for a SPI device node:
-
-	accelerometer@0 {
-		compatible = "st,lis302dl-spi";
-		reg = <0>;
-		spi-max-frequency = <1000000>;
-		interrupt-parent = <&gpio>;
-		interrupts = <104 0>;
-
-		st,click-single-x;
-		st,click-single-y;
-		st,click-single-z;
-		st,click-thresh-x = <10>;
-		st,click-thresh-y = <10>;
-		st,click-thresh-z = <10>;
-		st,irq1-click;
-		st,irq2-click;
-		st,wakeup-x-lo;
-		st,wakeup-x-hi;
-		st,wakeup-y-lo;
-		st,wakeup-y-hi;
-		st,wakeup-z-lo;
-		st,wakeup-z-hi;
-	};
-
-Example for a I2C device node:
-
-	lis331dlh: accelerometer@18 {
-		compatible = "st,lis331dlh", "st,lis3lv02d";
-		reg = <0x18>;
-		Vdd-supply = <&lis3_reg>;
-		Vdd_IO-supply = <&lis3_reg>;
-
-		st,click-single-x;
-		st,click-single-y;
-		st,click-single-z;
-		st,click-thresh-x = <10>;
-		st,click-thresh-y = <10>;
-		st,click-thresh-z = <10>;
-		st,irq1-click;
-		st,irq2-click;
-		st,wakeup-x-lo;
-		st,wakeup-x-hi;
-		st,wakeup-y-lo;
-		st,wakeup-y-hi;
-		st,wakeup-z-lo;
-		st,wakeup-z-hi;
-		st,min-limit-x = <120>;
-		st,min-limit-y = <120>;
-		st,min-limit-z = <140>;
-		st,max-limit-x = <550>;
-		st,max-limit-y = <550>;
-		st,max-limit-z = <750>;
-	};
-
diff --git a/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml b/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml
new file mode 100644
index 000000000000..9c9280ec074e
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml
@@ -0,0 +1,381 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/st,lis3lv02d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics LIS3LV02D and similar accelerometers (misc driver)
+
+maintainers:
+  - Eric Piel <eric.piel@tremplin-utc.net>
+
+description:
+  This binding describes the STMicroelectronics accelerometers supported by
+  the misc/lis3lv02d driver. This driver provides input (joystick) and
+  hardware monitoring support, in contrast to the IIO st-accel driver which
+  also supports some of these devices.
+  Refer to Documentation/devicetree/bindings/iio/st,st-sensors.yaml for the
+  IIO binding.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - st,lis331dlh
+              - st,lis33de
+          - const: st,lis3lv02d
+      - const: st,lis331dlh
+      - const: st,lis3lv02d
+      - const: st,lis302dl-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  spi-max-frequency:
+    description: SPI bus frequency; should be set to 1000000 unless
+      constrained by external circuitry.
+    maximum: 1000000
+
+  Vdd-supply:
+    description: The input supply for Vdd.
+
+  Vdd_IO-supply:
+    description: The input supply for Vdd_IO.
+
+  st,click-single-x:
+    description: Issue an interrupt on single click events on the X axis.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,click-double-x:
+    description: Issue an interrupt on double click events on the X axis.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,click-single-y:
+    description: Issue an interrupt on single click events on the Y axis.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,click-double-y:
+    description: Issue an interrupt on double click events on the Y axis.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,click-single-z:
+    description: Issue an interrupt on single click events on the Z axis.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,click-double-z:
+    description: Issue an interrupt on double click events on the Z axis.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,click-thresh-x:
+    description: X axis click threshold (deprecated spelling, use st,click-threshold-x).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+
+  st,click-thresh-y:
+    description: Y axis click threshold (deprecated spelling, use st,click-threshold-y).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+
+  st,click-thresh-z:
+    description: Z axis click threshold (deprecated spelling, use st,click-threshold-z).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
+
+  st,click-threshold-x:
+    description: X axis click threshold.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st,click-threshold-y:
+    description: Y axis click threshold.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st,click-threshold-z:
+    description: Z axis click threshold.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st,click-click-time-limit:
+    description: Click time limit (deprecated spelling, use st,click-time-limit).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    deprecated: true
+
+  st,click-time-limit:
+    description: Click time limit, from 0 to 127.5 msec with step of 0.5 msec.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+
+  st,click-latency:
+    description: Click latency, from 0 to 255 msec with step of 1 msec.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+
+  st,click-window:
+    description: Click window, from 0 to 255 msec with step of 1 msec.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+
+  st,irq1-disable:
+    description: Disable IRQ 1.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq1-ff-wu-1:
+    description: Raise IRQ 1 on FF_WU_1 condition.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq1-ff-wu-2:
+    description: Raise IRQ 1 on FF_WU_2 condition.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq1-data-ready:
+    description: Raise IRQ 1 on data ready condition.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq1-click:
+    description: Raise IRQ 1 on click condition.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq2-disable:
+    description: Disable IRQ 2.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq2-ff-wu-1:
+    description: Raise IRQ 2 on FF_WU_1 condition.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq2-ff-wu-2:
+    description: Raise IRQ 2 on FF_WU_2 condition.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq2-data-ready:
+    description: Raise IRQ 2 on data ready condition.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq2-click:
+    description: Raise IRQ 2 on click condition.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq-open-drain:
+    description: Consider IRQ lines open-drain.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,irq-active-low:
+    description: Make IRQ lines active low.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wu-duration-1:
+    description: Duration register for Free-Fall/Wake-Up interrupt 1.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+
+  st,wu-duration-2:
+    description: Duration register for Free-Fall/Wake-Up interrupt 2.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+
+  st,wakeup-x-lo:
+    description: Set wakeup condition on X axis for lower limit.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup-x-hi:
+    description: Set wakeup condition on X axis for upper limit.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup-y-lo:
+    description: Set wakeup condition on Y axis for lower limit.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup-y-hi:
+    description: Set wakeup condition on Y axis for upper limit.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup-z-lo:
+    description: Set wakeup condition on Z axis for lower limit.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup-z-hi:
+    description: Set wakeup condition on Z axis for upper limit.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup-threshold:
+    description: Set wakeup threshold.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+
+  st,wakeup2-x-lo:
+    description: Set wakeup condition on X axis for lower limit for second wakeup engine.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup2-x-hi:
+    description: Set wakeup condition on X axis for upper limit for second wakeup engine.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup2-y-lo:
+    description: Set wakeup condition on Y axis for lower limit for second wakeup engine.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup2-y-hi:
+    description: Set wakeup condition on Y axis for upper limit for second wakeup engine.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup2-z-lo:
+    description: Set wakeup condition on Z axis for lower limit for second wakeup engine.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup2-z-hi:
+    description: Set wakeup condition on Z axis for upper limit for second wakeup engine.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,wakeup2-threshold:
+    description: Set wakeup threshold for second wakeup engine.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+
+  st,highpass-cutoff-hz:
+    description: Highpass cut-off frequency. Valid values are 1, 2, 4 or 8.
+    enum: [1, 2, 4, 8]
+
+  st,hipass1-disable:
+    description: Disable highpass filter 1.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,hipass2-disable:
+    description: Disable highpass filter 2.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,default-rate:
+    description: Set the default output data rate.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  st,axis-x:
+    description: Set the X axis mapping. Negative values can be used for inverted axis.
+    $ref: /schemas/types.yaml#/definitions/int32
+
+  st,axis-y:
+    description: Set the Y axis mapping. Negative values can be used for inverted axis.
+    $ref: /schemas/types.yaml#/definitions/int32
+
+  st,axis-z:
+    description: Set the Z axis mapping. Negative values can be used for inverted axis.
+    $ref: /schemas/types.yaml#/definitions/int32
+
+  st,min-limit-x:
+    description: Minimum limit for X axis (used by self-test).
+    $ref: /schemas/types.yaml#/definitions/int32
+
+  st,min-limit-y:
+    description: Minimum limit for Y axis (used by self-test).
+    $ref: /schemas/types.yaml#/definitions/int32
+
+  st,min-limit-z:
+    description: Minimum limit for Z axis (used by self-test).
+    $ref: /schemas/types.yaml#/definitions/int32
+
+  st,max-limit-x:
+    description: Maximum limit for X axis (used by self-test).
+    $ref: /schemas/types.yaml#/definitions/int32
+
+  st,max-limit-y:
+    description: Maximum limit for Y axis (used by self-test).
+    $ref: /schemas/types.yaml#/definitions/int32
+
+  st,max-limit-z:
+    description: Maximum limit for Z axis (used by self-test).
+    $ref: /schemas/types.yaml#/definitions/int32
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,lis302dl-spi
+    then:
+      required:
+        - spi-max-frequency
+        - interrupts
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: st,lis302dl-spi
+    then:
+      required:
+        - Vdd-supply
+        - Vdd_IO-supply
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        accelerometer@18 {
+            compatible = "st,lis331dlh", "st,lis3lv02d";
+            reg = <0x18>;
+            Vdd-supply = <&lis3_reg>;
+            Vdd_IO-supply = <&lis3_reg>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <18 0>;
+
+            st,click-single-x;
+            st,click-single-y;
+            st,click-single-z;
+            st,click-threshold-x = <10>;
+            st,click-threshold-y = <10>;
+            st,click-threshold-z = <10>;
+            st,irq1-click;
+            st,irq2-click;
+            st,wakeup-x-lo;
+            st,wakeup-x-hi;
+            st,wakeup-y-lo;
+            st,wakeup-y-hi;
+            st,wakeup-z-lo;
+            st,wakeup-z-hi;
+            st,min-limit-x = <120>;
+            st,min-limit-y = <120>;
+            st,min-limit-z = <140>;
+            st,max-limit-x = <550>;
+            st,max-limit-y = <550>;
+            st,max-limit-z = <750>;
+        };
+    };
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        accelerometer@0 {
+            compatible = "st,lis302dl-spi";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            interrupt-parent = <&gpio>;
+            interrupts = <104 0>;
+
+            st,click-single-x;
+            st,click-single-y;
+            st,click-single-z;
+            st,click-threshold-x = <10>;
+            st,click-threshold-y = <10>;
+            st,click-threshold-z = <10>;
+            st,irq1-click;
+            st,irq2-click;
+            st,wakeup-x-lo;
+            st,wakeup-x-hi;
+            st,wakeup-y-lo;
+            st,wakeup-y-hi;
+            st,wakeup-z-lo;
+            st,wakeup-z-hi;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44..4cffabbabf0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14858,6 +14858,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
 LIS3LV02D ACCELEROMETER DRIVER
 M:	Eric Piel <eric.piel@tremplin-utc.net>
 S:	Maintained
+F:	Documentation/devicetree/bindings/misc/st,lis3lv02d.yaml
 F:	Documentation/misc-devices/lis3lv02d.rst
 F:	drivers/misc/lis3lv02d/
 F:	drivers/platform/x86/hp/hp_accel.c
-- 
2.54.0

