Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0014A7C80
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637253; cv=none; b=q/mUIDMfZyoPFp2XlA9II9lN0XfAJmgPn7Y6f1JyP5TtTK08Qvo0i4E50Wm8R8sj0NmDeeEIxGhVq5C3DCQsx9Z7o6kij7aQiGNfylTE7YAb/0i2ll/g13AtGGkWmFUvEEp3+mEpO18DU3Xn91oa2hWpB7j3SNMBXFY6CPzykwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637253; c=relaxed/simple;
	bh=42d9HDwBt+B8P7fHH96fvCp4pQgu6usf2SceCCjvRRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4FuBDzJHu3HBav1MB6hF5OfrLPWEammMOG2XcYFOT7ryzOpecZ01dbijsIC1K0ksurU6VefG8f4YGZ2PEOpJPCJ6JxJ5RjJ+o1AS7FxSMVGdB7mxRKUeZjukZXi1VQ0Y2IBY21P5GC6jTWXmVOi7CasfGPImRnBJ3s96Jrso2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhyV6nAN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhyV6nAN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a01933b584so5634055e9.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637249; x=1792242049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPcp5ifQOKmlbhns5WaO84H4QU9w87b0LtEeq3dQOzY=;
        b=IhyV6nAN+6ohOXdDXEzJMcl+oc3yB6wjoyREhvj1BfvTVehZJbTdwv+Tm+458YdUWX
         EF+obN8XFrOiPFPi8u9DKx98/CHFMcGYZC1Id3Lrd81+WCx9x6mBp23WVoiaYYL5vzHU
         IutzpAQy1XAXsLWblgg2Fc32ejCzrYsefUhPCTBJnUS2f1AitbAFXiu1kh9QPkaSnl9X
         1+hQKysW9v0VX+fBnk1LeMmZadGV1bfLKf9rTNTccB0wjRIuP6E9MTCFRRi0MGqjngc5
         Cm5paczR8yQyGiGvHuOm9EwRBcrPm18A6Wn+RqCJWTi7KTdLP3QRtQokzj7rJiVzB9Jl
         H49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637249; x=1792242049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPcp5ifQOKmlbhns5WaO84H4QU9w87b0LtEeq3dQOzY=;
        b=q+CZq1NNj8yFhFxjQRzIvTZnFa11qmH/xNWbpgYyK2NtoXU42lrEZgEz6wPZfsqw+c
         Z3Qeb2hTUasKFdIGSCLjL0n5Qaz+RdGHM6IEbfmEuTe9tM1OzyuL1txHcEcL18wDMO3l
         yp7OZJnRhqYWNgQG7k52Li2gAxAYpyLEGMV5weIRr7rPs8o1R0nd0w/fVtQ/79+5KH6X
         krIpcQENUWv+cGT/WC9qhWuMIh2uFvkCeDAOwD4/gKSC96PB17ZDHyGa+G1gAJMOGCx1
         /pMdNPSoUnNxExNXyux9FuBMJ7gB3eSZeQjxe84mIoIJbG5jGHKGxKv/yBoetwPdIP96
         sc9w==
X-Gm-Message-State: AFq9FYJm62McydXEKf7fglZUQk1uFFVCUKAZqqjjwbbDwJZko80PSiZN
	IwJpTD+QZOXZnE5OcAEo+uvkZsKJ9S1t83jQGB44Rp6sWjLN8ZjHERNiAMLDD1bc8zchog==
X-Gm-Gg: AYBFou13h+4duVUCZZ6F+yLNENWC6LtKGGcO/1Uu0iaH+TXoBQcR33zfmxzFfwAvV4E
	ReGGnGnoaq6ExDqVPj7YBAL385fmlk/vDu2l7EIfxpODVWt8H+w/TrPaemdemt8LSw7v67j5sJN
	n7RT5qmqFmxozx/CtXVLEXkvaisFhQD+p8sRNd+p63Jeqreimyd4G0n4ytcGBTtOfde0k8T3taD
	mZF/pCG0s5N7J1SWUUkPIOrQnwByoYfZKPVy5FyAiDUwY5h33HwtYHmA3T3VIr0BzyMZ1chklqg
	/3yVZrPkMAzLRuJOwqhCONp2xb5s2KzD6z2DDyKA0WySoz0Sd6OuDO+Tj0NVvL/hPxCt+8ZwFaj
	k9NVZD1QG2dnbu90MPWrvdaB8OOrQ6yCcYfpxk9RWRyM/yCHAYArNFeQBaP2w7QB4Q2WAVnw9Bq
	5PqUmhIRaDAwk416loJ3p+Dvvg+izJs/zQpyN/p1Klh4WNMreHwtswdl9UEnJlPsVMV+ekd0M5u
	hMA43kDlP7lk6o1weRjZuw4afyYNVmVdnx0qthnIMDgRoJRkCa5P5kxAvk1tzaPfzYfBN3ERa/3
	9mmDjjgP2qFvpTvfY3nel3tZ4xJeYsIU8OJRG3tTzzAJicUQR0u4JeL7RNBATA==
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a18e43a29fmr95353065e9.2.1791637248717;
        Sat, 10 Oct 2026 06:00:48 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:48 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 21/24] dt-bindings: usb: Add ZTE ZX279128S DWC3 controller
Date: Sat, 10 Oct 2026 13:59:59 +0100
Message-ID: <20261010130024.177503-22-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the USB host integration with three CRM clocks and four reset
bits.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/usb/zte,zx279128s-dwc3.yaml      | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
new file mode 100644
index 0000000000..ee26915f42
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/zte,zx279128s-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s DWC3 USB controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has a DesignWare USB3 controller (DWC_usb3 2.80a) with
+  integrated USB 2.0 and USB 3.0 PHYs, used as a host. Its clocks and resets
+  come from the top clock and reset module.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 20 MHz reference clock
+      - description: bus (AXI) clock
+      - description: 32.768 kHz suspend clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  resets:
+    description: The four reset bits of the controller and its PHYs, in the
+      order they are released.
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@9100000 {
+        compatible = "zte,zx279128s-dwc3";
+        reg = <0x09100000 0x100000>;
+        interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&topcrm ZX279128S_TOP_USB_REF>,
+                 <&topcrm ZX279128S_TOP_USB_ACLK>,
+                 <&topcrm ZX279128S_TOP_USB_SUSPEND>;
+        clock-names = "ref", "bus_early", "suspend";
+        resets = <&topcrm ZX279128S_TOP_RST_USB_B11>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B14>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B9>,
+                 <&topcrm ZX279128S_TOP_RST_USB_B10>;
+        dr_mode = "host";
+        snps,ref-clock-period-ns = <50>;
+    };
-- 
2.55.0

