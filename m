Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF1B3DD512
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500284; cv=none; b=gCehJm/rLfT7kE2fwCBDpZEa56ytiTnOhRhIH2j9t/rs30W9vFYDcJ/Y+hQ5KhntfnRuNgqUgh6YAGIUiOMXFqlPmjmC6wjZumfES8APmuZyfpC0WKE3X0sVlPKwLH22wK59aoKCpuCZHZbT/3er0ogwlJD2keuRxiqtIKG8N2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500284; c=relaxed/simple;
	bh=/n5mWPN8vWhXXjUOkrU+2eDOzhbedPgQCrOxoHmhzaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4yde40AaFQ5a0yUR6nArADM8Bxn5Ob0pKAbJQf4boOTVNU3NWIn4pAF7iJuIHUfHD36uc1wV5NkIwfMx/GoBGWhahlLwu00102wqLExtpCp6x7lNTKnkSB3+z/rj/r0WClMmPvAtXgrSTPP3p/eTjTVzUUTkJFgshjzv48/0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xpihmlj0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xpihmlj0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490ac357c55so36116115e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780500282; x=1781105082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlJLsFGfJfKvxb8nj21NQln9bu8CETkKM8eqefnewUk=;
        b=Xpihmlj0Scg/9jD55nnSA4Pr9hQvcLdoIel3m6ppVQL9Pw3vVMoQ+H96QkOfrkCryX
         OsatOw7SaRQul0qIPB3IxoQ5aghyRGPzIoWgY+HFTthE9uUZfSNTdXxGY+Bch3yCUgCa
         p8OZagBh5VgG8FlSfqFN1Evq2pzd3F+9ZCUsbyiBDByvvPnK39eHSAQZeangpJH3BMTd
         EaDZQwgrRq7y4bDliHn5csh8ptXYna8t7f2DR32t/Mg5PVdRpRTZwNWlAe69UUj9l4ug
         wAZXJq3o4C1zufeybXgP/9lmS4PuJs1ROKoP2e8Yt5D8fK3CL8Bn3a4rot/smsv2JG4x
         Czqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500282; x=1781105082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KlJLsFGfJfKvxb8nj21NQln9bu8CETkKM8eqefnewUk=;
        b=K6/+wO21eQaaV9pAxLx6vuopANQhM3U49IrXFVe/JjfswgMtzoCLGfiPX70gE2Cz2R
         tZsbzRsWlQ0Ow01vCuS5Wyv7HfHlZ5TaEUrnAQRJY6s/UICcnnENNxnQwoXlD3SWWr/o
         bdmqrjTE9IzRTrbJEvvTnywQ9cHVyXiV+Lc7RmF9byuhk+MIGjjrllfNWDieJ5J2DoHo
         GKLgB85lFdIQJMSim341Jkao8Oiwm2A6Fz/5BQXmsNIU8Wt5XCSLCWIOj/2Px36ajcmB
         tOXROttlmdeafSatZZqzj1G4ZbR41fn3/vq8inl3bPFaR6/H2JHtEFbYbmnQOfNj+xKs
         DFbw==
X-Forwarded-Encrypted: i=1; AFNElJ/WEGQNAl1B5UEt/Vr7geFI8n6sT0fqjmX7cdjBJ8SiV+kMt93dzQzkgI1vBdiWZQk/OSG/waLIsH8O@vger.kernel.org
X-Gm-Message-State: AOJu0YxptHOygwwJ1t6MrGbGO5SR4Jt9U9CC/70WAjkpT1T+L6eLjnGw
	Qr7yW2hRsFQ5KSPHEFItwvWhwLg8ErvPBhfb3l/DPa/WIQ+Tu5Cka+xEMjlNKfRFHqY=
X-Gm-Gg: Acq92OEPrpcG7zGBOVw8VtWBOB8byMn2hAZ5+9aaU6NvfgGwha1jGvMgp45cms+DqN9
	tMvEock+ahi5tMyrKn5iznGXhSg16uixXTt7fP0iUqe1t7axiz82aVid5EtuKUuqKQ861P3H8Yd
	dn43JLX4lQM5KdDL3joRuC1zsDmW2tu0Gd4DhXbLo3WG74skzxoSHmgFfSVWDAMx7QbTRswX3qs
	UAaNuCKOCl7LJFhOvKCHVzmoArbAfZ/wF+kXBW+aUwYUafUHYCHZ9a+zR/GpmJ62+XXJ/EnCXNo
	1YX3PAsHVY8ymnWTodRXHdc/1XcUi3Xhc/trXmDF8LcXV+dnLus3pmtLC4Aof2P4xtoTRyb3Z8s
	gFg/+f2et7CcBb174wMVKjcjNez8kE52nZ7HR6HjlG2KZcMH+VZFf0V7Vl9eUOQtTW6CnhZvzam
	XW68weGFH6sE8M+Rbcg7dqgix+YW50S/aB3yKpdYgEx3o=
X-Received: by 2002:a05:600c:810c:b0:490:a646:9d77 with SMTP id 5b1f17b1804b1-490b5e94d2cmr73159965e9.6.1780500281611;
        Wed, 03 Jun 2026 08:24:41 -0700 (PDT)
Received: from localhost ([82.192.120.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm8487897f8f.19.2026.06.03.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:24:40 -0700 (PDT)
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
	mbrugger@suse.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Wed,  3 Jun 2026 17:27:44 +0200
Message-ID: <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780498640.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1780498640.git.andrea.porta@suse.com>
References: <cover.1780498640.git.andrea.porta@suse.com>
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
Referring to the first comment from:
https://sashiko.dev/#/patchset/cover.1776932336.git.andrea.porta%40suse.com
regarding the DT-bindings, #pwm-cells is not required here because
that requirement is inherited from the referenced pwm.yaml
---

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..6f8461d0454f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,54 @@
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

