Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB87261A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578918; cv=none; b=jsr3ljCrfmdzs7U8HHe+hh7IwslrN2erq2PHzkWr31JpQgLfOrsZOrze9br5ucHzMxKpnU3A1dRS37dPu/mGzzipSYUuUAlP6fzMIeziHdrtGZ9Yn+enhbWN9EKiTaG+IqjDUJ0A8bNIiX4F/OONYrGOhX5oE/LRgp+XYrDBKzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578918; c=relaxed/simple;
	bh=vmUrKTPBU6nt9jPoKRj/PiVKcoqjTlTY+KxAS6ATr1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ekrG28CArrxBUFhLXnixmmn+XzmCOyN7E+I5QBoc7DRuvmJ+QOYeVZ1QbsNptR8fYnjrKk0uokROKdLhxHi0dGn9rnI6q/j0SsMQ3B+cYhjff1WZli+wxIZDvqQuuWc1sfPV/MUJyBC3iIVy03mdG7z8rPy/opIPInoioOCltak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/R9sqTK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/R9sqTK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cad68425a7so15327155ad.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784578917; x=1785183717; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vqJNSi15UrA4wLzOqGzyPM5qOphazLu22MmYeBqoRz0=;
        b=B/R9sqTKfrXiE6iAHcp+Vzsx6quW8PGMI2XUfSjytsNY7YzmOt/+PNv18KCeSQFU14
         jcN7mMafViWqXvSf+56mfMGjnogRKpuCO+DL8oiRFfOE+mSNWbXPk/mG/RDb+3AbqSwU
         +JhPBrXb+LBVLM2QnV45l+hNmHMGEMilBODh5YEFU8hBC46Vui35ba/WwTrIq9xzJBDZ
         sqOHNpBF0iNrQqqyNFVFFGOA/tGeHV4csYQAO3SN6L043MYSvmD52Cw2gYkSee5DlYY+
         55L474a8gI+oSi3AZmRjQSY3ntn5bxtq4JgA+qqKVXZfrmFwDluPkzclmj9tFwfYnoxp
         i0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578917; x=1785183717;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vqJNSi15UrA4wLzOqGzyPM5qOphazLu22MmYeBqoRz0=;
        b=r/d99BgjaCU+2qw7fbcI6r1hZCq2B/U1TYbInx26upwDD5bcVZxpkvOzAlb5GoeiGy
         xO+AyoE5NGQXBCdNt7sXXFzTw4tPiY4/TIY00A5B8IAHP88hiyVJirAAVKlbwECBCQQI
         VcVx4hX8nHNrQh6Cafz6tdqXE2WisN59yunP30LJvJsx6FIrlF85ZHsqVntfw6e5ke7S
         g09KFLKLzVyIOI/B4T9ebf4A7eOoqg9uPkxtR0BtMonGgpdju7yJKGvRtI6gkqMj/nrB
         9TIxbVc45f3QXLynUCZwFgQVGoEaqJVQzAD0GGL5nCewpJE74rk14vTNvBziid1WaUaA
         fESg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9OCg/w9DTDOLG7ACxuCo8kOA6knMGtROgn0685E8Pn6rUFNBraHMepyuuTRJ4tseo0iLjUByqFCwF@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQXuoZZakLclwdV3JzbHglHSWlD+ZK08chToOFCJPIsMIXP9G
	TQanO9DeicaY55m7QlMjL6e8MNn9gHC4cy2bdTbR0jfzTR5LnrRkeiUq
X-Gm-Gg: AR+sD10JcfjOzMAPPkkS4rJwQldFZ0mljzBRU/P7F8WPI7odeWhbinyL32wKXdzkOad
	GChIqpu98aNoKF2HxjCTsl/yuiEKnk4sm/YfVzyWxkhRjRmk5nJ6oOPLU/xAwp7aCQR1rOHRUjC
	KlpYvTq7JNI54KrXWDjvkfcnxp7zdO+wKNNa+fxiRMBp7fY9rjSBArPH1J6lc4zbm+Lo0nW8sdy
	A8WP+Fx0ZtljnKwnHkBMQZG++9izlir1REpUa5fY7vVtO58JONgA02vXQsNMleBklNCWUE4Qlno
	8h5Fzt4gALalzpT/tAcOIf4qxAET8NktAkpL310g58eFdwHpqeveeachnt4uQOoQrKWyUJsvBlp
	1Dq4pKSGwI61ay5I9GpW7CzUUxbKUV3WCYnavTcLMjUg+DlmIDbSzpoACQkZj7bmi98vnotZIYI
	0rFedaakp2OA6/dhY=
X-Received: by 2002:a17:903:26cd:b0:2ca:d803:5c8f with SMTP id d9443c01a7336-2cf8036007bmr3450515ad.1.1784578916505;
        Mon, 20 Jul 2026 13:21:56 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:542f:3834:f0b5:cc78:ed81:5198])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm40497048eec.31.2026.07.20.13.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:21:55 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 21 Jul 2026 01:51:39 +0530
Subject: [PATCH] dt-bindings: extcon: ti,extcon-palmas: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ti-extcon-palmas-v1-1-cd4071f0b9d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBG4VeRWXdAU1DaVyld5PJrR2yUTCyC+
 O6m7fJbnLOTIgmU7tVOCR9RmWNBc6nIv2wcwBKKydSmrTvTcBbGlv0cebHT2yobAOFm2xDclUq
 2JPSy/ZaP59+6uhE+fz90HCdZHXazdAAAAA==
X-Change-ID: 20260721-ti-extcon-palmas-2eeed9a6ddb3
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784578906; l=3542;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=vmUrKTPBU6nt9jPoKRj/PiVKcoqjTlTY+KxAS6ATr1U=;
 b=bNpi0tis58f0Y7MJeKrX+25BbawWQK4//myu9/8E/WvoqXyw6UHXDBIVogU8kv6UI+KhOVksf
 WEruqhVy3WODH46bqnckMwm2yNWV/JcJef3SqiuVzuZgZtdE32LcX9P
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments Palmas USB Comparator from legacy text to DT
schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/extcon/extcon-palmas.txt   | 22 -------
 .../bindings/extcon/ti,extcon-palmas.yaml          | 74 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-palmas.txt b/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
deleted file mode 100644
index f61d5af44a27..000000000000
--- a/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-EXTCON FOR PALMAS/TWL CHIPS
-
-PALMAS USB COMPARATOR
-Required Properties:
- - compatible: should contain one of:
-   * "ti,palmas-usb-vid".
-   * "ti,twl6035-usb-vid".
-   * "ti,palmas-usb" (DEPRECATED - use "ti,palmas-usb-vid").
-   * "ti,twl6035-usb" (DEPRECATED - use "ti,twl6035-usb-vid").
-
-Optional Properties:
- - ti,wakeup : To enable the wakeup comparator in probe
- - ti,enable-id-detection: Perform ID detection. If id-gpio is specified
-		it performs id-detection using GPIO else using OTG core.
- - ti,enable-vbus-detection: Perform VBUS detection.
- - id-gpio: gpio for GPIO ID detection. See gpio binding.
- - debounce-delay-ms: debounce delay for GPIO ID pin in milliseconds.
-
-palmas-usb {
-       compatible = "ti,twl6035-usb", "ti,palmas-usb";
-       ti,wakeup;
-};
diff --git a/Documentation/devicetree/bindings/extcon/ti,extcon-palmas.yaml b/Documentation/devicetree/bindings/extcon/ti,extcon-palmas.yaml
new file mode 100644
index 000000000000..0bcd8df79414
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/ti,extcon-palmas.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/extcon/ti,extcon-palmas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PALMAS USB COMPARATOR
+
+maintainers:
+  - Roger Quadros <rogerq@ti.com>
+  - Bhargav Joshi <j.bhargav.u@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - ti,palmas-usb-vid
+          - ti,twl6035-usb-vid
+      - enum:
+          - ti,palmas-usb
+          - ti,twl6035-usb
+        deprecated: true
+
+  ti,wakeup:
+    type: boolean
+    description:
+      To enable the wakeup comparator in probe.
+
+  ti,enable-id-detection:
+    type: boolean
+    description:
+      Perform ID detection. If id-gpios is specified it performs ID detection
+      using GPIO, otherwise using the OTG core.
+
+  ti,enable-vbus-detection:
+    type: boolean
+    description:
+      Perform VBUS detection.
+
+  id-gpios:
+    maxItems: 1
+
+  id-gpio:
+    maxItems: 1
+    deprecated: true
+
+  vbus-gpios:
+    maxItems: 1
+
+  vbus-gpio:
+    maxItems: 1
+    deprecated: true
+
+  debounce-delay-ms:
+    description:
+      Debounce delay for GPIO ID pin in milliseconds.
+    default: 20
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    palmas_usb {
+        compatible = "ti,palmas-usb-vid";
+        ti,wakeup;
+        ti,enable-id-detection;
+        ti,enable-vbus-detection;
+        id-gpios = <&palmas_gpio 0 GPIO_ACTIVE_HIGH>;
+    };

---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260721-ti-extcon-palmas-2eeed9a6ddb3

Best regards,
-- 
Bhargav

