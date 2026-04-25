Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7D9371D0B
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141203; cv=none; b=T2cLirP45YdQi/PHYKBEafszmkgtrWyBOvYFXPEkL9ToKUcmnYmfW1zq7kWiNMRHI9xz5rBVZN82gLL5rPuIiNprfKx6Hfm5zkuURfxPqqOMILch+9XdXtmCRMpoQ7nrqrsWbG0j8vYg8Ri/999n5CXNEumNwvHEzhFsAmXmzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141203; c=relaxed/simple;
	bh=+gXx26kToc5Qsn+X5xpx5KaXlfJuV83OpMJgOHZcMo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qzS1869hHLo01bqsOzbFGaVubPuhUOz0XuC5/NADLHF63VTI4M9Aw8Eq2OvLEWZaQ/6H/JVwbMlt/X+VOYYVIxdpgkapXJudEjTyRXib2i+IW7ASX1WQdYcibKFAPvaswba+KXDiTrs93zS6AjgiYHypGtCrMEFnsQY5MldhTV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opgvh6ff; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opgvh6ff"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so8613765e87.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141199; x=1777745999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFgTexS82Aes4S2KA8waYF2yU7gR1eiSJ6BQPR26m30=;
        b=opgvh6ffORU3cLe/1PaQ+favvlB7G4jQIe586uew3y1GJCK4KNz5+y0yfY5dRoyT3d
         JeOnmNscJg4pwE31ro848Lt0BH71viwmQq/bvPeZ87UT7UoVw5eLDeNQQ+pLEVd+QrMl
         i8eLLWA1xQR3lBjnY3lRQCX7tQ3x53k0v87q8YVr2+QsCesXDt6YzFE4/yFCHm7mMVgQ
         vsP9RwFZZF7vy68aWEihSudVUvfR+rJe9LO5WZSK02Bm9utHAW7K/8EWxVypGVxQ25v1
         B/0rAekKxvjTaKc4I852cbiPJDFGf11PmBjjXpMHMgUrOksLBRVKmYbfm2Mw2pUlW/bs
         z85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141199; x=1777745999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFgTexS82Aes4S2KA8waYF2yU7gR1eiSJ6BQPR26m30=;
        b=prsDwfgF5XprAFYW9GnnR0i01YAZCgrBamTz2FUsr0rxdq+YhFTZjm48+2A0wAtcR3
         vzZg+X89t8ODKLEKfSTgM5ass5PhvGwWU4PU9gwFE8WpvpWuVcLOgUFHT7Jr4re6xA7H
         DOpG9R38mvg4G1MX6QL9jAu6oZTqaK8QT3j0/q/fLWleWznAdEIb5k4znHHPD4uLR40R
         RC856ocvNGojFCvDQytzZb2rGz6s5CpwIeR1cKx6xRpiPvhSTDANq1DrbURlVpgVAl6A
         6BlxrObRihFVtusyy+z0XK8qVvv03wPmfBWYxujZlAiwiycu5JftRUTL4+BfjOcm5VEA
         yvvQ==
X-Gm-Message-State: AOJu0YzUABuXKE8lbkQ7sz3OsO03NdaKGthtIwuM+5UCUdylfubfckWA
	jzeVtLEaQ7smd8It2Ef1wzvi9hmtNdf+Tkx4SpFkiDZ7D7a50V7ykL1t
X-Gm-Gg: AeBDiev8Qc285kLdXbbge0D4H8MBJ15TUFXmwfiTRL6cbeqt/KSWTmNIMnWLPNAjBz3
	GO65ft9ggcU+dMk1pWbscLWeZFmCJW7nA+Gj1S3Xn5UYj/jBTXJ3IQPX0+umB+WoY1Gy0m4zq6i
	KAMhQxAm5sIVBVNSDeKfgLI5+YTIYk/XAL8ihdS2iacKekNxZgIfxD5NG2/RPyQZKW5Gx//C087
	c12lktT36H52edUj3yj7EsrZbhak4X2tsyS7E36mxB0IGVzSGy9AaGj5GD5tj3mFgf4c7ngKPur
	6G8QdH8B33SKRSb5K9l5vxUWgWY7ldqhhn50C6AuWJuBea6PbLlRlcNM7lv/puFpiyvJcs17pNZ
	jxwuFwm2ROdvDjVtECRd2CIqx8LdcJTuQeWC8HKAspRbXIsrZKkv5r6Tq2xRxFzj+HsiMJdWBSD
	1vJRBUqeL33o1cCL7KObVHpq0=
X-Received: by 2002:a05:6512:3b25:b0:5a2:a8ab:ab4d with SMTP id 2adb3069b0e04-5a4172daacfmr11631274e87.22.1777141199206;
        Sat, 25 Apr 2026 11:19:59 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7ad0sm6836577e87.58.2026.04.25.11.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:19:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: embedded-controller: Document Surface RT EC
Date: Sat, 25 Apr 2026 21:19:35 +0300
Message-ID: <20260425181940.144028-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425181940.144028-1-clamor95@gmail.com>
References: <20260425181940.144028-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document Embedded Controller used in Microsoft Surface RT tablets for
monitoring battery properties and charger status.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../microsoft,surface-rt-ec.yaml              | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml
new file mode 100644
index 000000000000..0fee574a3015
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/microsoft,surface-rt-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microsoft Surface RT fuel gauge and charger EC
+
+maintainers:
+  - Jonas Schwöbel <jonasschwoebel@yahoo.de>
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  An Embedded Controller used in Microsoft Surface RT for monitoring
+  battery properties and charger status.
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml#
+
+properties:
+  compatible:
+    const: microsoft,surface-rt-ec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+
+  monitored-battery: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - enable-gpios
+
+additionalProperties: false
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
+        embedded-controller@a {
+            compatible = "microsoft,surface-rt-ec";
+            reg = <0x0a>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <74 IRQ_TYPE_EDGE_RISING>;
+
+            enable-gpios = <&gpio 88 GPIO_ACTIVE_HIGH>;
+            monitored-battery = <&battery>;
+        };
+    };
+...
-- 
2.51.0

