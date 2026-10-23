Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750342;
	b=ar9eD8t/K8AGnDg8Az/G6hDpIIW0qW4rDSGdjbwFKAw53p/WA+yarA9Kes8I8k817Tns
	 dHLpfgnzryW6+FZm/ZgQ2YJn6Iw/d8vlN79Hg0g0W12BuWh2WN3aV0CW3gTXJskqFjmSk
	 sU3xg7ffLdxtZfC5f9ZvhD6RoZY08G5G/fBN4Awuq1A8IzUVPRDt9r+Mz3nRX07v73Eno
	 4Xt8FO/OosucGCXZ1f1GkrmnCYm+YJ3MKl96zkFbNDOv+yRmD6EqfKRCQQa6h1ONQEOC4
	 weaghy8NJTC8nek2ITeRuSSEyHDOcPclR6F2qaRXEwZMtFVDpj6YuT2YkpO66OmgK8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=;
	b=noAd4+DSXRnF8DsKsQv0JT9yvmDohku39IhD3XDCCVaSoF+JMZILMz5KnFE/j8Uf2jwh
	 DJmiSFUWBdoQudAzDKY2gGYVQgDyD1wU6Ex2en6idGsloInhFfWpB9ezpeg6EIkDJTgGc
	 /mbVKp6UosL666HmDPFRlJO4ny9HNy7Ke9O073g+nzRHihffuS3pYhOj87vOjjnqBue79
	 ZNRUIRIc7SayDS/1cJs0UQXgC/h1jj3QKhvloCSYW3lWnl3GzV3TcWbaXkhOwRC+1YrAX
	 mQbWioucqFxQfroC9xLprb4rGuc/TDDSFfurx53M+nFLys1yX7s0SK1RLmniA/5WVkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IWpQ4mhj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0D60A260A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B0D60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IWpQ4mhj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8059995e9.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750335; x=1793355135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=;
        b=IWpQ4mhj/pj4bJh7MP/vuwmzTylNCkSm5qEGtWhOQtmmvPT5IVx9weMxPItekIw2dE
         UIuPuYiLLCs+z2+QbEPtwC739zCnY0WJBZ+1kn++bUAIqd/ljke5fS8Y9y9JS65pAUlR
         U+y3VP2jNC4yavrsbZNGYxuAZc81aXSZRRfUaj147D/RORJhI+T/G1Nz3lGvWO76/xaH
         cSUQZNVtXSQmq6ru9hXj4O3FyfGAnuTKlYWZ8IIXaFBlrVMfGUSHqGJOSkUUa2KkGS4/
         Q2DcRr90fnljjn+r1qN/pyNqmhEQ76pH1fLTCKe7Tes2yWkPX/J0Kd3prY9jBSOLwEjq
         8XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750335; x=1793355135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=;
        b=KXThydxhN5mzo7LIvHZAMIgcruQOau9oaux2eklybED/cbN5TDY9faTRigiqXiQaUK
         18YLXW3dd8pj4n25MBCbznkVflmgcjrRlwsa5WvEXp6IyRPuVC1gevEPNgF1678iAYBv
         Q7h98CWmm4vSuarYd0kHhv02copoXy9BOs/za4xMfAQcBgBmhLLxQf8ujP05jeejhEGe
         9PmaaSBhI9YPcEVlDs7pu9vgacKnFxe6WfrpF+CAa4pLK88l1+v4Luba9h+xLfEoTQnJ
         wfHy0FHkGprxBIw6rQZwYAJ7yo9psXHEmHT0SNIEbboVTvZ/au2rDVEsCXTDBKJdlbG0
         fKxg==
X-Forwarded-Encrypted: i=1; AKwUvBy/RhVjhparbsnk60vgNwg5SVfbplo+UT6zBtU9qSL/cXVeXA3NXMb/+e0FdWAhqncBuD/mBWy/HlHN@vger.kernel.org
X-Gm-Message-State: AFq9FYLCNqKz1Wn8U4GGh+80WtBOFkd6OL+wFwqzgkUExU0ZspbnLvg+
	gPsioTSK1laYZoMlFNHnUGlHlcNTuXcRptbeldQn0ucEYaE8IR9MYx0FYHP55hG7h0g=
X-Gm-Gg: AYBFou3hiaBxhoBlDTk9tT8BDOidTbQybFu1im10yBs05IcJDzM0EgsCNrOZLo+wEFD
	/Myo3Ae1bxVe25zKQugJq3tCz/4f7KgdyTb7az11/1PRy7Upz11T0wB8DO12LBq7uZ3rQmWQtJu
	ylUDQnLl9sxSNf+bgza4p8x5C2qY1G0LC1iPOxEj7rrbbEu516pS0xqo66rMyR7E8k30eOZ84LA
	luOpwlO6hxkR0PONkPorMKI8Jx5Z2kFnmxClnXGTTln4mip4h+8qeBky18y2zAGIX9kfELKNEyx
	M/ISbXlYgbGOLdIcLkTKkLMU+bVB9cB9EuiqS/BVaJTOCmNu9v589oHhgdjYBpHl2uTIcYhpGrW
	yN7cQ0d8yFAS/gA5x9aIeeAVHzWFp+FGmefBPEDKO3x1thvK5QDbWhdaQ6biuH4TMAxP0WAAgRw
	wDxzW/W34T3uloEtDzzAw4z/wvoqFekJZsA7Sljz/7N0oU6IwssC5bGwr90ACOrSHCbLTYbG6te
	y3LTB0RYBGS8mmKmVBIes02VKMEFcsaDco1BrC7CKN18hpNkFiWWKA=
X-Received: by 2002:a05:600c:4fd4:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a211f3a5f5mr23914985e9.35.1792750333373;
        Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b898d2sm50139165e9.4.2026.10.23.03.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 2/4] dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
Date: Fri, 23 Oct 2026 12:15:55 +0200
Message-ID: <0a9a27c58336449e5a2e243b987a8bc85b05aaf8.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
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

The Raspberry Pi RP1 is a multi-function southbridge used on the
Raspberry Pi 5. Its internal PWM controller block includes a built-in
hardware tachometer logic, which calculates the fan RPM by measuring the
tachometer pulses. The computed RPM is updated by the internal Cortex-M
firmware into specific MMIO registers within the PWM block.

Currently, the Linux PWM subsystem lacks a standard API to report
hardware-calculated tachometer values back to consumer drivers.
To avoid abusing the standard 'pwms' property, this binding introduces
a custom property, 'raspberrypi,pwm-tachometer', to link the standalone
hwmon fan driver to the RP1 PWM controller node. This enables reading
the tachometer MMIO registers and exposing the RPM via sysfs.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
For the rationale behind this design, please see the cover letter

 .../bindings/hwmon/raspberrypi,rp1-fan.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
new file mode 100644
index 0000000000000..53e5b67fa856b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 fan tachometer
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description: |
+  Hardware monitoring driver for the fan connected to the Raspberry Pi RP1
+  southbridge. The RP1 PWM controller hardware contains a built-in tachometer
+  logic that calculates the fan RPM. This binding links the fan to the PWM
+  controller to read the tachometer values.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-fan
+
+  raspberrypi,pwm-tachometer:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the RP1 PWM controller node that contains the tachometer
+      registers for this fan.
+
+required:
+  - compatible
+  - raspberrypi,pwm-tachometer
+
+additionalProperties: false
+
+examples:
+  - |
+    fan {
+        compatible = "raspberrypi,rp1-fan";
+        raspberrypi,pwm-tachometer = <&rp1_pwm1>;
+    };
-- 
2.35.3

