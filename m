Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DF83D5235
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540447; cv=none; b=sQZGtKMQI93SSVOklwY+PI05DCldikKAa20W+92WaH2qqgqJQ7HhqGsfMRXe4YcVG1c/PBs4sQRxc/5Q/IotGAm1Azujy/Mk7elTVr9094ceabrTbz6mMsqJ3D4khBpp3UiQ9fG/HvAtKjrKPzUtqBbbpa2141XZnXB1eXb+rjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540447; c=relaxed/simple;
	bh=YW9uoiEy5CuC0sIxOCa9X8yJ3i0+Ho0/5+EeRbYnQYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YHPihHSB3XZHJmtsbr/aG5ehg06jcUocoSnWDeKK+pw9TFBAZW8QrUnzoL6ZChXOxtFPeAqtiQsZHgH4CU77uiLONb+E/3ldz1zd2q+9YizWflYFNlcWsntFId27OLyHWqVQFOA4etSzIesl63Uv7bH3fUWezBbBeXgFtZAw0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GKUXo+Oy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GKUXo+Oy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so12198235e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784540444; x=1785145244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3KtQbiImBVgvP9LE+N4FWws0mqbw5SWS+roXC5ImXQ=;
        b=GKUXo+Oywzc3Jh8vgZQ+TKHChDwNR/Y4E8rCgcS/TPBhi8fO6WSdWomkmvCzt8eWsN
         gC77yMVcD87UGm3WVfqhB6Fay+da/XZM52UEQ3+IngRv1vl9ooFb6FSaZQe6W7VQQ4BO
         +Hw5Bp832+UKbmXhLZjrNC8x6wjYt/ThnS/oBmkdKfqDh99JwWCOJVXRLB0lgk34GgNu
         kxbrl+izt8dXJ3u4+nguJOO0fdDLDKtotA+K0RhVeEOX8LOUHk4cU1r8sdKj9vZ/l0T3
         FSJHCJz/IQ4ideYLvaNPamhG0OL4OAgyI6n31Se9YMED1rySObjvIio5NZ6vdrzEsSUE
         /lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540444; x=1785145244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x3KtQbiImBVgvP9LE+N4FWws0mqbw5SWS+roXC5ImXQ=;
        b=qoLi51l180UxkLjwS4KU3db8PQYCzbLn8HLytSHaQ1bnQ/SEindcauKU+jUVJHkTDd
         9fy8DPlxv2Z59W9oh4fmVN3BG+thFiiTe43mpV3uVtFN8hx4fuLLX9TGtmgXYhlKYmC1
         uBO04WkKleuZS0MRJv5BiKlbZ1RhRYumdoxvbWD7x6BKR0OjBbhJUNvj9fwTqYxfMe/o
         BMaVnmbX7d058d3V7UlLrm46u5zal168Qh0gza8T0OOtNMfBfQa7xl+a7syfPEZkWDM4
         bp8CT01Nghrfw8SKmqcaP2Oo1rPU2FSwyvIdJnjNUOYmzuJ5iDWjUJa1Qb8Mp2P1TSoW
         t+Hg==
X-Forwarded-Encrypted: i=1; AHgh+RqVviQDDjmqJxrAyUYf9qx4wQYEKheZc1fOQKIu3xoGdEvp94H9U4HBkZNuz+tNuFZl+k0Qulj6YiE1@vger.kernel.org
X-Gm-Message-State: AOJu0YyG2Kx0mI+i74mOTMqFxAImNBAo83AfZlOl/hydEx/Nx/ymuzBY
	26YtiSZT6ygtaAL/aITsEKI/XpPOK/66Ri7m3JCge7Z72JgC00DB+eN0xaNH3JWLHXY=
X-Gm-Gg: AfdE7ckp30P3roS8QDZtsU3ItbigtEckwwhSshkkRP5IilDhTTFHAd8RArWDAEMhVYe
	Gaw/xoX3401twN1bs/IS+Grk1fSKkX2ldtz4iDBLS30EVXVGBvB+TBmOXkcYgMTVtRKVVGcvwbg
	x+/6upzujukINVuYOUFhGX06EZusEFzOd4MS2mFVTC+3+V0x+t5CO0Lj4f0mudIT7ZZkUC2YbK2
	qVGvYQPQFm62362E4eL7dZMZT9y/LDOpLr4hLuRe6KlrJEzM6Bahc+7Gvm7MCCr7k4ND5DyhdR6
	Ae2bUNmIhWwfQwi6frKJa88Hc4Gn4sjVoBcaCKYNMu60XGCK2tzy86W5FSXEvMNX0p2aDbdZ3QG
	eBinK3X5+qcP5XVO/wg7+iEBcs1Yzjk978IuvMhNkHPnClnDUIsCa624rgM8wHfp52xfEfThUOx
	XW
X-Received: by 2002:a05:600c:1d15:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-4954a3f4901mr160702855e9.9.1784540444224;
        Mon, 20 Jul 2026 02:40:44 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a47e64sm281394125e9.8.2026.07.20.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:40:43 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Mon, 20 Jul 2026 11:44:05 +0200
Message-ID: <67d51a7210f0d7410dbe34e3d93813db1fecd622.1784539788.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1784539788.git.andrea.porta@suse.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..970d0f3b33bbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan using shared registers (syscon).
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3

