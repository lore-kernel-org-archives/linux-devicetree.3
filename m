Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190099;
	b=Lp7vHRPkKI2BUBbx9A1fvGGs/sp/ZDqgDKdA/FUbJlY0HqGr4wgSlzDfF1LFcXdVgYCL
	 ZPlZqKa4FV++xDoyfHi04FB7gNqYHP2gYrt5BGwsFcK1YxCGPyNCsp6yRUMzm9cRbaybq
	 vhaLlVUYICbt407dZD98jqT6dYpl43wcEWYsiaCreqfx7yyvFZRo2yjWyKDCFOSwnJAgk
	 J8neVAvmJ8W9oeDhofAm4r+RJbW3j7Yy4g0J/f3zHtNcBe3jdalqRLBYI6zMM8cLe0ANF
	 dDLJek0sHpOFgtFZXWHfDqUzEqShD+OOOqkwaba2zEtjRyggjSsHiALEbY+OIClKcdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
	b=aT5uHyoH4YuLpsdNrjNXoMnIVR+0TemtLNo4Poe388TSXgsNeeGpBtS3wzo1Ko28Cc/b
	 /BQnjlscfREloGjn8QxHZJ7oQxFMwWgOg0K4RW2KrxXDt1hyhuAEI8lslPJz7fZ0Ft1sC
	 fwIR33OGcJZj1kzXGOBH7wOsczx4HQUgaK0eEwMuG5nEeHHZNu/9fp1gKrPfutlYPWK+A
	 2PkKKPrMXUspm33J5fMbUMJt6hDJP5bxxnnY/QR74bdTV9mVcou50SM0BrYjPXN3brdER
	 sxHOwklrYW+JnqLtUEt20qlqeg8bNUJ7tXmp4495f+sSbr6RjwwiV6aMD0UdOoUhFCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdbGCdi3;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D460A3813
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317D460A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdbGCdi3
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9837865e9.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190097; x=1795794897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
        b=DdbGCdi3zWUq8+Om3PTaMnnbscPxsQqPvPYUOXE1YR9UcMj0bQU3k1pJDBNsDARMdN
         bhlGH/GAk9g1AvdGCKl2wiWH5geedfQVoBi1cln4xYh4ImIpkTMLNDAUosgSqZu0T6w8
         uV7RwptFmWiOV7fsrH/8w01xPoyxORKxccJrUuCwecNgVZE/JzofLweL23oZYcSpSAw3
         aXY+A+e/bLWSip95Y2beej2em8WKB74lKlVAAhKuDy9834DVeCmi6Ssu+wWuzoHK6dRV
         eBo88Zfg6SRLgpr+OIpdxVXGkb4nVynqxJym2fjc7ti3dRQMeBNqS9SA1x7Yp9RjWK6K
         71IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190097; x=1795794897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
        b=23993suT0ApAkMAOlpKwjrRjARirwML7ncAyANw60MwSpeYJm+83uJ+cZ5rVzJgUzL
         Xj1k+KdraFpu3AxX1FnHJDHAw627wGeDHwJFOu5EHYWTHG1wbr/m/pZEQsc6RT1mK+vu
         zd7LWLztS1PjdHaa9ASzJcKe84ZT0/ZIc+IvGKnEu/3YATx0olVKhJX0l4Nqhny2wt2X
         njXeBLypccYwSyQf3pmtGBynle7gz3vCzvIxUdDSO1QQ+q06ZLbxNYzecM5ZAH/NUEIj
         Xz+GeIjNKmy4BwyXyg2A2HC7IgfXQ8wRunRNKd4dVgVRGOhMLkPw8ANLFMaUM38ypR+Z
         z4Ow==
X-Gm-Message-State: APuU4Z/C8iDXL/msagCk9I1MLcRwctnXga/WRJsL5TDf3T1LmWB6XWWX
	YkxXyDVdfdfVDF6hDBBS8YolWi3ucyo/w/DCG8PSY0o+7EfFon5B/Baf
X-Gm-Gg: AYBFou0aGNCiqr+18D7lya4VNh28zSY6lBBqDRbCdjxeR5t0h0BDr94HWHrV+PsBDjx
	SyHpv472S6aCGJ9HXt/aseAdGi+rwdIU46KM7uqyZoKuEKQI0T9fQBvu5ZTcfWLlvTvy6JufJb9
	91U+PiCQfMOUbNAL8bzNvV5r70vV5jn5MpluiqsBZ+eBNP/73KDSGPS8n0Vh6bMPugZLQ0VxPp4
	RcEt3ISHoJ+oNfiSwD3EAQLW3H11GthsXb0Z5GOkATKRy8bagDcDeauKBb67j70XqQpmTd7+60u
	BXTxrEUITWzokVG10LI0zNwOPJXpew90b6Io8+5le7sxO1bhf/J+PX/O8ke8YB+aKFCaj2/QnYN
	cQ8S9J9nc5Ta2C8exH3GOyfsV4ycRm+NltLkYtLj9pXUD9chOop8dY454BnD6u1EAAAkwHJFA2z
	ujz4E0DLSIIZCQAs23B+VUWE2MAzlUnFCm7XLq9Gcw39e4P5+krk6LTalBwVg+CRKo6jM6GJktL
	+RyeWmQ5y2wSzmYsWk44o5DPEkl9Ci1wVZDoLLkaBEIav6N49/2PCnykPWzpIJFJQhtbhwXHymL
	dolCM9O4BgfpzsoIRXtdJRHrzTfO7Beh3CAEkzC8SHMK1GK40mlW1a5qOQJ4HvQ0U6TMYlo/Unc
	=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr86535245e9.30.1795190097249;
        Fri, 20 Nov 2026 07:54:57 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:56 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Fri, 20 Nov 2026 16:54:44 +0100
Message-Id: <20261120155450.7719-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Document the Silicon Works SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..2d6d9b1500faf
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW42902 is an I2C capacitive touchscreen controller used on the
+  LG V60 (timelm).
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: lg,sw42902
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low hardware reset
+
+  vcl-supply:
+    description: 3.3 V power supply
+
+  vdd-supply:
+    description: 1.8 V power supply
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-supply
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "lg,sw42902";
+            reg = <0x48>;
+
+            interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-supply = <&reg_ts_vcl>;
+            vdd-supply = <&reg_ts_vdd>;
+
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 28e4aac18d44a..a29019d984393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

