Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936819;
	b=jLKZBXWIZOUEn3szpVvnl1lAd5b61wSOjGQqIcJH9WJaT7aBJXopoQRlO2aTR5Mbh/fd
	 fQ5GQEjCR3oTdsu84Or7MDGmkCsSUlFfsFmHojxJMSB+KLD9UzjxzpkbnhVdmewqc29S9
	 77QYZKIlNgrKruQ8NXDzXvHmvYoKB58dmvaYCSb8zdqR4tR5WliWsXptz3MGxaFi2ho43
	 KqEnfbPQT0thSTOdR2Iv6AiWkQmpYwBMbC35ueYuLUaKodrx1z2WF8yT+yC5byM1zf55w
	 A52KCEPVhixqrjkJcWh6eXVBldk/u2QvAZFb/5BgzmIBBTwYhJ7WmT7meRLCSM/V1uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2jL5YnKAVfbEeVw+3LXIU76AD7FXA69elwf9ngK60tI=;
	b=RRHAVokiRr12MPfHgB9IM6zjKIOB+SXA2OQI2Vbs5wGuOJybvV7geqwqo9GZZw4jVSye
	 lT04PpRK37g8BypijVs8bjPwbL+y6EQGZRJgpQtmuOqDyyZ2IM4CkCtvE9/V6O3ZAGNe/
	 fjrZZOLcaq7zB/fgGM9UYwBUTxMUW5v5+sQWjf/HXIA4GUtEso5N9iBH46+wzkC0ImcW8
	 TLHbB6ZRl7hSBwLKqFgD9wGPCHQpeyiT7TtDyVb0qddFfZaRTWhJXuo9WVNYytw/UDdPT
	 +6OWFFzJeDiLC/VP1RwfMPVlJDfupnodHjChU2xoaLbQM2gk5OBIn1LqJwuxqP/59Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmkcjQUf;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A64606A336
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A64606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmkcjQUf
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so1696695e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936817; x=1795541617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jL5YnKAVfbEeVw+3LXIU76AD7FXA69elwf9ngK60tI=;
        b=LmkcjQUfAHAMAiD+xUKnR0eQqfUvZabFBG1Enc9Hbz40FA0mImCIjOxNXlMesC6lpU
         9obmFyCzDpMFN7kBkkuFXfsRT15Ooch6Ay9fROWpQJfd+mmd1+Ff2PAsVUuVYZV6cdNW
         jdwuN8Ci5t1QwsTOoz5TtsvxVMsbCMUe6SIRQQZZaWPcH5aOxMw4Jy3Mdhoo6pgQdI/i
         tGYnmIig3iN7ZtSqUohNc6T6OMtxcwVz7cFY8pDJVZ2kLe69L2qDyWqzKMQgLAGB2+Ul
         PLJ2IbljOqXG2XF87Xj7a0dRGBFTWHaSRsA4EeLAu8M6mDnq5H0ODMx2IMAviQDJ50Ri
         UXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936817; x=1795541617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jL5YnKAVfbEeVw+3LXIU76AD7FXA69elwf9ngK60tI=;
        b=pDvo1pChGYATmWZlewWdb1pj3FMTpeeQjqj848wzek0aNC4msvQdrYJM56N+uH1mrF
         RFJj1Ad6831n3cK2NcDwo+KHLRrDh1pMZjEf+Reyx0Wt66ApY1Q0XevgADFl9BwMg1Of
         gcgVrtTCUkL5vMqekSQ32WYcfZREf8Epy2rwtop5yZOsIKy1WXuUuXW89hUXN38UYBh3
         UO1Kyr/9DG+1Lab1XJP6JHiqHHzm/jLC/13bsfq0S2RN3n/sjyArKmKURM56dxMlMSYY
         zPduk3S1u4asTFBH4b2TAzqtLeVDTPNFz/K7nxMmqOyKcIAI+orkaECdCl1khA+dRU8D
         gl8w==
X-Forwarded-Encrypted: i=1; AL+hErH5bcaRRoYox4WjydQ/VNf70Ju9c3vH1PBWIUcNLzTJWw35P6/nJc/1MPQryY/zAURskhbISssNtG8a@vger.kernel.org
X-Gm-Message-State: APuU4Z/f2+87DEFQMT27q+K8Q5aP3GLJzR135fPSm0CC/Tzwmoq5iX9R
	f+35lCkjLRLg0tGoKuGBmQ7Y0HBZeH0zuHPkrS6RKpqnv3QXAZS8Wzyw
X-Gm-Gg: AYBFou1LxrdAVNFdNL3JO+v3F3G72FAyaU+Cy12g6TFWLqhI2mhx/9X4Hj0TiNbY8Va
	dmk2Yrnc060j9LdGg1xuMFIYuxz2C3RkGpDrPq6jQg4Zp4AqydGfjT++R/UQjrBxeIaS8+m8nWM
	SunsElEY1nwgpZehMh47+Hs4g7WTbqyjGHrHcEyqrTrKpugsUTPAerrgRfBSrnptu3uJhqTxAgH
	cntdJJdiSX6rtPKc3Z6KDF5YhXugW9xU1OOflgMHPQIcjMS1djaZLDkDQBMgKGuM5789NIf7b4G
	FiS6lNi1qv6XdDm56FidvE0DE14rhX9mO2nhDb+jt0ekPfltvG8vf4oCQMYXbS/HZgP54dD2WuW
	GYb0881vf1RD6xf3WTWInHhrh873KQPRZTpLB2ncLbKEyB4qp9XyFz7+yMLPcgZpERl3I3UI36r
	7NfO3feBhDdODvJNP7Vh4FMkZaxaRPObRpV69HknUG4X1Z1bClVuP5kzfi7Dcvz1cLf2k5kCRpy
	02GMqV2bj34AynceDZxYbMLxCKyNHfLeAO6Qxtdv3Mjx9ZM0PRPpdvZAmdasrK93hbQasNloKfW
	Lgyx7yZZceMyac+6GbHOICRMCqjGoQDsvA==
X-Received: by 2002:a05:600c:638e:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb5bf390e3mr287460505e9.31.1794936816714;
        Tue, 17 Nov 2026 09:33:36 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2e6c765dfsm8165024f8f.33.2026.11.17.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:36 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Date: Tue, 17 Nov 2026 20:33:32 +0300
Message-ID: <20261117173333.1853986-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117173333.1853986-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
 <20261117173333.1853986-1-tadilhusrev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a binding for the Imagis ISG5320A capacitive SAR/grip proximity
sensor (I2C), as fitted on the Samsung Galaxy XCover5.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
v2 -> v3 (addressing Sashiko AI's review of v2,
https://sashiko.dev/#/patchset/20261117104414.1182364-1-tadilhusrev@gmail.com?part=1):
- Drop int-gpios entirely instead of just documenting it. The pin is
  already described by the required "interrupts" property; polling it
  as a second GPIO duplicates that and risks pinmux/GPIO-IRQ lock
  conflicts on platforms where the interrupt parent is a GPIO
  controller (such as Exynos pinctrl), and a binding should describe
  hardware, not a driver's internal reset-polling implementation. The
  driver's matching change is in "iio: proximity: add Imagis ISG5320A
  SAR sensor driver".
- Move this changelog below the "---" line instead of leaving it in
  the commit message body (also flagged by Sashiko AI on v2).

v1 -> v2 (addressing Sashiko AI's review of v1,
https://sashiko.dev/#/patchset/20261116074013.355363-1-tadilhusrev@gmail.com?part=1):
- Document int-gpios: the driver optionally reads it during the reset
  sequence; it was undocumented in v1.
- Reword the description to the chip's own characteristics instead of
  how the Linux IIO channel is exposed.
- Simplify vdd-supply to "vdd-supply: true" (left optional: the
  XCover5's own grip sensor has no vdd-supply node at all, an
  always-on LDO not modeled in DT, which the driver's
  devm_regulator_get_enable_optional() already tolerates).
- Rename the example node to "proximity@28", drop the unused gpio.h
  include, and add the blank line dt-check-style wants before the
  child node.
---
 .../iio/proximity/imagis,isg5320a.yaml        | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
new file mode 100644
index 000000000..22259e341
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/imagis,isg5320a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagis ISG5320A SAR proximity (grip) sensor
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  Imagis ISG5320A capacitive SAR/grip proximity sensor, connected over I2C.
+  As fitted on the Samsung Galaxy XCover5.
+
+properties:
+  compatible:
+    const: imagis,isg5320a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: active-low data-ready / proximity interrupt
+
+  vdd-supply: true
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        proximity@28 {
+            compatible = "imagis,isg5320a";
+            reg = <0x28>;
+            interrupt-parent = <&gpa2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&grip_vdd>;
+            wakeup-source;
+        };
+    };
+...
--
2.53.0
