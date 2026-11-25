Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623658;
	b=WCdJ8Sg1wd36q6LIHjkUMlUvvjMQGyJR//m+3bTwE6fz++BM1x6miApw3+Ceh58CQPnM
	 aIsz4kmrjzQEiHH+J7tw1lgrxvqKghCde+SsTyS9B0H2WP/IKOlfihEjaJ5FV2xUDsSyq
	 HBu3Z6MdQocG3dDAdrZjXDV9P9nl+iSGLQXhr1izntaMtCE30FCDPOJ+5oQBJEGrX0bCx
	 IuIobsiFf4bacI+kTLP6/SPKw82m8nsENFcUxW8WQfq9s0xrJ22mFqBgf+Hp+6SM766S6
	 mlnk0M3cmRGe75tPhxmAB1Bq0pt9fXie8yfCC7eyOnBhgPeMiWC8xdF8n0ZrzSxWIzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
	b=yPd6tGLrIigPa+pmNqSMsoIUNHdqX0WmMAjGjw71Y+4aIAchUQtkYxubp7qFjEeY/oOJ
	 ikCGj2IwWP0eHUP3d0iXt1i+ucfrCeK0YxmfAIheQWoZeb/dkJTqRpZ23pxESeMl8RKXd
	 Jf6105DYI0KV2pvodaOCJOEEwgjS76w6asM2LmToqj2svXR0ecU3TlmyBBY3tjYyhTygi
	 ckT2KhNBWfrGmbz/UBUuU9/Uow9+2UB6ijsiQ0vWGMQl/AImD/5V/7IX3vTzZYLc/YMUJ
	 A2sEbn0DzZ47ramGptabFqI8nMRMEu1KEEWY2cVdq6qAdzoI1NtnfFw0ik7kvOmlA1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OBXIaj7E;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B060606A6AB
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B060606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OBXIaj7E
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4891796f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795623656; x=1796228456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=OBXIaj7E1HmGWo9JqM9tqua3DNXDb8TFTkplpSggBDuhUhjA3PjuQqAh3VS9LOr/V7
         6soddrf7dewKxXTzQGhzqshKPUfy0pCHiYnR9hQRMNFFXJA+WQtkId771Bj8BT7vmh7L
         CdMqnmCJ/KTXoCYC4v0nGDUUeVRLyW/a9jIRAcLwHKJjS0uHVeg21VOqrbQ+RnkJvNiy
         U7o6ebtUYeNot2iP143VpKd9aFrme9o+rpvSqeuk1DnoEr/fQum299YO//4YxxLlvgFl
         IfFgz5WArV2/xWf/P+mGycorCWHhayDZCEK9AfEw3doma3Xoh8RAFTE+ttKGc9To5Wrf
         7xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623656; x=1796228456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH2MTB0Ze17g97ePs4wlPxbOQN12XIysjRotJSq3KWU=;
        b=fTkA7Hsb9Dlr5+a81UY44l0x7R3v+01b58oK/3PRuiobiTGtbSjysHm7x45HoQeXLm
         mAmt8eoxvu+7O6v0LKrgs0Ua8rau+6E2KwBsuCFfT5Jz0HsPH4l3SN3KLiFSevz4lHr9
         YNh/vkaahu7Jwipue0doJLWtkJDRVK4uP9x8/LDLU2pK17IzhHa5dS1R1LHvUaBYBpgM
         Rtnakyy/P17TfNHh0c5r5SM62Ns9PyMVc/s2Y34y838+MojC4wl1X98z4YPafxyiYt8Y
         XgRbAKQqmAZd/nTYshYWZmifRWvu5IjyjeujGG4KEk8nzSIPxq2jTsnQhyVIaQq174Yc
         Lkjg==
X-Forwarded-Encrypted: i=1; AL+hErHu0F3kwhUMk4/0zON9GjZZmH4haQIQYNWkRmgRCqGKKahArLMtcOArfnN3/zdnxnS6/XedJJf20/R0@vger.kernel.org
X-Gm-Message-State: APuU4Z/73UHb2rR2AVYEB+vXADZ5QigX9rBQ+m3walo3ry3v6HLBLPRp
	EzdxX1XCZNNL7P1CGtIIczfKvSaXe8Eql8W8kiSMW7NtB+azyb5x+PrF3zh6g6GcOx4=
X-Gm-Gg: AZFdTZcC/68WRb5LEZ3XXcodlkjn57hdn6vDpja1vcMedRuftTg2R/j/b+Or1Q9PL30
	+KX5Nymg6txt6kBCuxv8jPIUpHAD1sVABfC8WsxCwhpSPRJBLgx+YATa3IuAw7JUno913iJvOBr
	BVk7Z1Who+yArvZcORBqIEw+cUpPczGcDMB++kBmMFZgx3AKQH/HHeEI5wtQCIw6IJk8OMR8Orv
	N7icf969P+tqiZ/ZH9ZZGwVkc1x+qTzyLKLoN+ErIrUP2w+ZrPp/fUONhN2+rpC26M5lIkmt+iP
	Qd2PxxlbJf9GgEXYKoCrbAN4Dz0pdeGNRX7xr8ws6pnhC8M7916Au6fKpaZ6XADOT8ilAs56lBk
	1tmSy6XNbiMnlwrlQ9GqCP2guIgudSyJqjEScMGXBOl03Uz3tK5JCWnpUix0/dnjZsMX1fRQjfi
	B4q9jMlFnMLD0sLJ8i5cU5zmD9IANpQpHifH5+Da6tGJsL7HIJm3aa+OD8nwl5ASrhYRanCw8Nz
	yOoe0olb04PrFSL8atk/+3l4SyF+7ME8iZC9Fz8Qu7AWsnXexr47F1PleK4hWKxQwnzJs3AB6XB
	+e4sX/kp+wEksL1IGh+JJfOF9YTHoyaT0aDiQQhW86QB/GiufA==
X-Received: by 2002:a05:6000:2b8e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-4abb3f158c5mr24317570f8f.44.1795623656351;
        Wed, 25 Nov 2026 08:20:56 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm40286290f8f.24.2026.11.25.08.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:20:56 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v14 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Wed, 25 Nov 2026 17:24:50 +0100
Message-ID: <20261125162453.23573-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125162453.23573-1-andrea.porta@suse.com>
References: <20261125162453.23573-1-andrea.porta@suse.com>
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
The DT binding has been applied by Rob (see [1]) for consistency tov7.4
and is part of v7.4-rc2: as a consequence, this patch is included only to
make this series apply 'logically' on top of v7.4-rc1 and can be dropped
when rebasing.

[1] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 000000000000..be020583fd0b
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
+  fan.
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
2.51.0

