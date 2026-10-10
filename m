Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63F93CFF72
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643135; cv=none; b=C5YZNqAsG9GIe82MCNikJu++Bh1UZQmXTQIyelKs4yiN0F9FGqymCdnvaLxjJRueziDvYuEIWlCPyeSko7uUkCq3frQelCP14dtFd/i2rVq+a9RwrvEE5+M4t1oJIEWsjuclcnIxFuAbkHZZB4n2deY+/cAIDdgWm+TQsUsG3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643135; c=relaxed/simple;
	bh=uAxyCYziBc7ECXg17HgMb5or0IgwW9xJeT069BBS2RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnOT0z9FtgvH3D2896LPkOUDYOJDeiwePG9c+VMTpQnr8O2MVXIT0Ld1c6JOwX+1C8oYMB85gOdjKBj/M1AEzIewdgxM7T4sscU+Q458lbcIes39a0BglE+zNQD6j4BR5zN911rgt/4I586nyxcK+aVW8vV3ArsbNs4NZBk0tLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jjznh8tv; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jjznh8tv"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so586806a91.3
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643133; x=1792247933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+JT4xkL/rjUHrLyDkr60TIJnL3a1LtABNKb99HH/9k=;
        b=Jjznh8tvf1fZstHheamKFB2a2G1j+4mWqjw8F3wCG1HB6HtoqXS6aofrw3HLWBrwtr
         Rdd8RPTeEHgaQkmONEjv2PW8VmBfUtNGI+SIxLav9Oh/lGUPEANXHugF8yyq6BA+tNKB
         pjPQKMOoYSeVzFHZhGCt7whLJnuXKsHIJ/aKawEir8LrGdU9gX6uOIVbBck6F1PutwgZ
         JKRytEbzzchf0LGD5ZwtXiVzqrFsUVERByKuLu5aq69lCRw81bVLjSFZqaBOD0Ppvgfw
         Ed7xyoBiyydgrTU8CULq62G3/MZUK9rA8CoYw70m6qAhk6E11sUXZGCTS86u1Jng7fmb
         yZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643133; x=1792247933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+JT4xkL/rjUHrLyDkr60TIJnL3a1LtABNKb99HH/9k=;
        b=Bw9un3h3prZmDy0xm6wo44IECsyKPYra1atjL4qFZEKJxGopdOQpF4FAIcyiSlEgpM
         euiRrCIT8kBh27cyjeY70WXBDXw9P1CXDV8sh4ktsRic/3SRfgCvzUmRMVJNpmnDys/d
         sAQXGNUhw5zaRFXNFSfwBvwWDj5h+E2sWQnUb40StccxoWfItaHqz0Go9BvY+UmJCN5c
         NJRFye4HqmOUMlcDjoRI3jI8nCodaKoJiPSXR3i0/S5LJBf2ijYdEZTePJ5YXN5DMbPi
         lis4izelsugwPBCNdofnK8/4Ow3ILbspUJZRV9xXSoFqzwKOgRniBvaOh7s5bigGU8pq
         eTRQ==
X-Forwarded-Encrypted: i=1; AKwUvBztQdMSJZhkQwu9utxXMbC5bVofjQ550VvflZJHmaD46LpRZ1vkCQpO01JA46NZPT8e7jIRxcjp0qE8@vger.kernel.org
X-Gm-Message-State: AFq9FYJhzfFwPSd/Jrb5L0s6Iwd3Fn5mkHjklDBOYn+sIOlaVgugwLwu
	rj7kIe/jx5FjjDAjHy32ZpM5qP192U3kYh5JMv0LLYB5XnQad9N8KKxC
X-Gm-Gg: AYBFou1bGRjxtuPSJoEMqJuMVnkDSYaRM9ulCsV1YdqSOmPrvgvy5Z6UVCtuLUL11pv
	HlYvnPFpiYDye8JKh+8rS4pa4Til4OeMHBxvBQqYbGjE6vRe/ooHH9a3dXkP6dcPYmPv1TAR+iM
	nEKdvq+m7WJXFjPbHRySMpqP359/vjdYvKOOC72OGZpku5wSIKM2Lv4Uh/3Keot/aU3oP6Vdsdq
	evYCnV7RDHPVUaSWnsiwuaeP4PDWRE+v7dzbau6Qllcd7dN/oNfBUPYGCRpJwfLX6lKrhcLbmJL
	hxrB1+TmHKvO3+WpXLqzczJIIsqqEDt5aPj+JbQv56Lb6caLOL4ll2qjiUU0CRZhL8b56A0Cpkq
	lSrIsYbDbqEnZI150U7FCpz+thQzlH6ktRYwMxw0IiF34GJQMjSA9ALIDiIR6R7UJPQB9tBITWm
	bDhqxKhaJFehTnFl3gh0ultrs4uEhv6epl+IopY4gjHoi+JQIbtDpow3TP4J9BMTW3k8E=
X-Received: by 2002:a17:90b:1dd0:b0:3ab:1ad0:db41 with SMTP id 98e67ed59e1d1-3ab3a9a4f3bmr4425257a91.62.1791643133000;
        Sat, 10 Oct 2026 07:38:53 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f2f866sm10821859a91.10.2026.10.10.07.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:38:52 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Sat, 10 Oct 2026 09:38:35 -0500
Message-ID: <20261010143836.173883-2-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010143836.173883-1-wyibo6109@gmail.com>
References: <20261009122046.551915-1-wyibo6109@gmail.com>
 <20261010143836.173883-1-wyibo6109@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Binding for the Tinno keyboard MCU used by the OnePlus Pad 3 Pro /
Pad 4 and OPPO Pad 5 Pro smart keyboards, attached to a tablet UART.
Describes the supply, TX-gate and wake GPIOs, with a MAINTAINERS entry.

The touchpad is described through the common touchscreen properties
(touchscreen-size-x/y, touchscreen-x-mm/y-mm): the MCU protocol has no
way to query the touchpad geometry and the same MCU is shipped in
keyboards with different touchpad matrices.

Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 .../bindings/input/oneplus,pogo-keyboard.yaml | 66 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
new file mode 100644
index 000000000..9055ececc
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 Yibo Wang <wyibo6109@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/oneplus,pogo-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnePlus / OPPO Pad pogo-pin smart keyboard
+
+maintainers:
+  - Yibo Wang <wyibo6109@gmail.com>
+
+description: |
+  The Tinno keyboard MCU used by the OnePlus Pad 3 Pro / Pad 4 and OPPO
+  Pad 5 Pro smart keyboards.  It is attached to a tablet UART and speaks
+  a framed half-duplex protocol over a shared single wire; host
+  transmission is gated onto the wire by a PMIC GPIO for the duration of
+  a frame.  The device provides a keyboard matrix, a touchpad and a
+  keyboard backlight.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    const: oneplus,pogo-keyboard
+
+  power-gpios:
+    description: GPIO enabling the keyboard supply, held high while attached.
+    maxItems: 1
+
+  tx-enable-gpios:
+    description: GPIO gating host TX onto the shared one-wire bus.
+    maxItems: 1
+
+  wake-gpios:
+    description: GPIO signalling attach/detach, also used as the wake line.
+    maxItems: 1
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-x-mm: true
+  touchscreen-y-mm: true
+
+required:
+  - compatible
+  - power-gpios
+  - tx-enable-gpios
+  - wake-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    keyboard {
+        compatible = "oneplus,pogo-keyboard";
+        power-gpios = <&pmic_gpios 12 GPIO_ACTIVE_HIGH>;
+        tx-enable-gpios = <&pmic2_gpios 6 GPIO_ACTIVE_HIGH>;
+        wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+        touchscreen-size-x = <2561>;
+        touchscreen-size-y = <1441>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f82..9c29eb961 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20156,6 +20156,12 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
 F:	drivers/usb/misc/onboard_usb_dev.c
 
+ONEPLUS POGO-PIN KEYBOARD DRIVER
+M:	Yibo Wang <wyibo6109@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
+
 ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.53.0

