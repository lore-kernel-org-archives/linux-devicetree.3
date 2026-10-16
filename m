Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C64C7557
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168171; cv=none; b=dGLlgFhKeEKPo3GNZBL0dWxCFfGusvBy6F2VMeq3hLGvPrJX2bC5l3iEORlnUrBKFYVBadU7vELTlvGWM7nK905Zi2tRYfZv10CZVDrS9f8RY2mult+yJkDNi9aCWR2GUAYkh7ArbBZdIjwOVEZjDiboeHuEOy/ywdk0EZXgQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168171; c=relaxed/simple;
	bh=OxV1RuzyJ3U0pIeECN5+q2tSH4wIzfJ7OS3s+Ly4mTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rr58xmWdKvCIStEDgrmD+qG6johwZ8p1mDh5IxldSRdZP+Dgs0BuOOBJenubyMhZZ1M4V76tkiBI3f2ARYHg9ysIHkJ1kkpCR0hC7MaZKlWtHJ1sxv99CRU27AEXaqSVs0pRl01ThcYPJY3QOZtDlV1rz53vO/8cr+d8xqzFKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMUCZWZw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMUCZWZw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso31890f8f.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168161; x=1792772961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/XhYMGu1EQRHViVghAn6A1D98GsvwIcwrZbeCelmr8=;
        b=EMUCZWZw6yshhCZS3dhk5lGJ8xENGATXGOjfW35kGRHN2uJ38jOmIE0zFAhTk0l1u2
         BygMTOXTB0zDEb37zp/qF+BCtau9lEfaVTkiHAKXSEmqq252HEdpOd6II4JQWd6IJ4wW
         GY1WrVAD7dIcAkBxrPvT0979McL3MEaDoLcpDw2SMFBJzzH9oOuBJEyRO9cVQefUbXxE
         Czh2/DQjFW0KYc0iExBcQsHr1vBUUg5J8gmvq9Ne8Z8S2GrMXPX+ybJ6k+Ss6O8iGMP2
         SPdp5AZCMVtJMbtNpoIUAefmHtToMBYdJZIwkynAOmVBFZC3AbyIw3UWa9a5tWmgIDam
         kOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168161; x=1792772961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/XhYMGu1EQRHViVghAn6A1D98GsvwIcwrZbeCelmr8=;
        b=esUEq+LOuK/0eLuoCnCo/hJZTrJJ54dHn5hcXMIdTAobvoy/9XCgT0GnE6zVhkehnK
         y5l+7Ub+eG5rJVoQZ0OE7mcedVHU0ZBQ2tmI98o/hqeavad/bkBJQ6Z33vuJi8C+oEEO
         jTQKsN4En8DMzcK6OR5tUQrRSt1GeSCcXKV0TF72ofLaWYBxcqG5Ce/jIuRyLQJlp0yK
         0iNMUDISJY2+M9VkDCsntwelBMZeH3NVrrhMsUOqtMJm5hN5Xlx+XZIlPYYrdpCML5Bk
         OBNWuChkH1kDiBInGzReiv1kPsFAA42nkdgmrIU8vVA7TfTOiQWBPrJbWCDjOrwQCAaV
         lxWw==
X-Forwarded-Encrypted: i=1; AKwUvBztgwy6BDaeJmZx4zao15ezCRQVSIm/oEBHgnEiy7CJ5MvmDwfAVEaEtOhri4ulwZGVNLUm4CewM2hj@vger.kernel.org
X-Gm-Message-State: AFq9FYIdajKmFnWwTCzdN9BlaXhMwsDUkACB9autGPuGKtshgmXOjUfc
	Bgwo44CY0Giri2IpI70pKzRROS6k6pqIC3x4Tj89Cn+gOGYlziSYliAd
X-Gm-Gg: AYBFou0vUJ8pQbAdhEeZ/cWVGB3DAG13xggpn2f88rQI8wjFYZK3aKzi7yMYUHd5kQH
	+qhXQxOrNi+Tdnv1wC1QQREcRWcXhRYUzqT9MFy+i154lFhC7K1by1kiJrimGahhRET//DGEdos
	T/oY008P57h/cDzbtvaliEmIWTXaIfIf22xqqTWNAkMFzZ7zhKtN+d0IrjYlDQHEUhxSi/irast
	nTI8Fy/KSwFJDJ71saxcDmSJXedKvujny71GZFfQCzvnLJcPkPzJvgh1mcxR8REL9JMyqFnZRzA
	Jo5lIHGjC33xTXGZ3cdOqd+6hF5IQdu/Se+AhChmtD3PaHsSD7nYgpm2Bc9nNicFzJGr+jqLy6J
	VvTnG5nRNuJ2fku+CCEvUfla49CQ3gz3AkfF7deo3phBAkv9KjLOhNQLIMGjg6yX/SeZiBBbBme
	214yOxG9LSBohV9Q0SszLDGKbwwFNo2QGnIZnqg/8IenrIgsxEZWzDqP41Rayu2MarBflhMXSCk
	ACaLNjSqlRzptGm0pqrFhWPpg6nLEiI0GpgZFA3TkhIwxsWFupQYp82O/1eLuqfSpn7aKpkwtE2
	Xg==
X-Received: by 2002:a05:6000:4a0a:b0:48d:f14a:9183 with SMTP id ffacd0b85a97d-48e07bbc619mr219403f8f.15.1792168160937;
        Fri, 16 Oct 2026 09:29:20 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::103c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm9404317f8f.16.2026.10.16.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:29:20 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99703 backlight
Date: Fri, 16 Oct 2026 18:29:11 +0200
Message-ID: <20261016162912.64581-2-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016162912.64581-1-lukapanio@gmail.com>
References: <20261016162912.64581-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Awinic AW99703 is a 3-string WLED driver converter with an
integrated boost converter and 11-bit brightness control over I2C,
optionally combined with a PWM input.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 .../leds/backlight/awinic,aw99703.yaml        | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml
new file mode 100644
index 000000000000..62e8cc3118f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/awinic,aw99703.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW99703 WLED Backlight Driver
+
+maintainers:
+  - Luka Panio <lukapanio@gmail.com>
+
+description:
+  The AW99703 is a 3-string WLED driver with an integrated boost converter
+  and 11-bit I2C (optionally PWM) brightness control.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw99703
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to the HWEN pin.
+    maxItems: 1
+
+  awinic,led-strings:
+    description: Number of enabled LED strings, starting with CH1.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 3
+    default: 3
+
+  awinic,iled-max-microamp:
+    description:
+      Full-scale current of each LED string, reached at the maximum
+      brightness code (and 100% PWM duty cycle if PWM dimming is used).
+    minimum: 4800
+    maximum: 29600
+    multipleOf: 800
+    default: 20000
+
+  awinic,ramp-on-time-us:
+    description: Current sink ramp-up time when leaving standby.
+    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
+           256000, 512000, 1024000, 2048000, 4096000, 8192000, 16384000]
+    default: 8000
+
+  awinic,ramp-off-time-us:
+    description: Current sink ramp-down time when entering standby.
+    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
+           256000, 512000, 1024000, 2048000, 4096000, 8192000, 16384000]
+    default: 8000
+
+  awinic,pwm-trans-time-ms:
+    description:
+      Transition time between brightness levels set by the PWM input,
+      for a change over the full duty cycle range.
+    enum: [2, 4, 8, 16, 32, 64, 128, 256]
+    default: 2
+
+  awinic,i2c-trans-time-ms:
+    description:
+      Fixed transition time between brightness levels set over I2C,
+      independent of the size of the change. When absent the brightness
+      ramps with a fixed slope of 1 us per brightness code instead.
+    enum: [128, 192, 256, 320, 384, 448, 512, 576, 640, 768, 1024, 1280,
+           1536, 2560, 4096]
+
+  awinic,ovp-microvolt:
+    description: Boost over-voltage protection threshold.
+    enum: [17500000, 24000000, 31000000, 38000000, 41500000]
+    default: 38000000
+
+  awinic,ocp-microamp:
+    description: Boost over-current protection threshold.
+    enum: [900000, 1800000, 2700000, 3400000]
+    default: 2700000
+
+  awinic,sw-freq-hz:
+    description: Boost switching frequency.
+    enum: [500000, 1000000]
+    default: 1000000
+
+  awinic,inductor-nanohenry:
+    description: Boost inductor value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [4700, 10000]
+    default: 4700
+
+  awinic,pwm-input:
+    description: Combine the PWM input pin with the I2C brightness.
+    type: boolean
+
+  awinic,exponential-map:
+    description: Use the exponential brightness curve instead of linear.
+    type: boolean
+
+  default-brightness:
+    maximum: 2047
+
+  max-brightness:
+    maximum: 2047
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@36 {
+            compatible = "awinic,aw99703";
+            reg = <0x36>;
+            enable-gpios = <&gpio 7 GPIO_ACTIVE_HIGH>;
+            awinic,led-strings = <2>;
+            awinic,iled-max-microamp = <20000>;
+            awinic,ocp-microamp = <3400000>;
+            awinic,inductor-nanohenry = <10000>;
+        };
+    };
-- 
2.55.0

