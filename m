Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391338236F
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058919; cv=none; b=aw0jVRlzyjQCfHCrN8FX+OcjCM9hwEUH4bQZNnuMZGyYlUbdZ+HO926IiYL0uqX/siEAVs5b0Of2YWPcRW2ZkEe24wmxg6Kj87Pq9OOxc+h1tP9cw6VFl/9b167uLZ4TxayLC3reFdEgBq4lyQrx0hfLDSsoQ2Kg4/h3nceqoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058919; c=relaxed/simple;
	bh=ashavTxgOUJZqoPInhEpeZj8vfEg6zTM4bvI0mbKNcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahNPYKXvZRViBcbqJtrbHMHkAsDjOyPrwxYWKKMFR+SADSj0lMAZm8VH2EC+1c6G8tmbYCbrCjPV6lshZCyxUnUJWfEmHjTrkq1A8DA+irZvDLVTRDfLxHqNNlYC/hHBkrGvfMUJNLezYI8RJrUjaT+l+9MYAf1Z27LXcvOkeo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXaninCE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXaninCE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b001cd92bso291705f8f.2
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058915; x=1791663715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMS0fznvLZomihe8C/oJh3xR5MqfRPhNrCBOy3H79Y0=;
        b=YXaninCEyJFoYTbARRsXKA5GvtP6ufWjXg3bIjBprDombPYdFnJ3czmj4dD4IeDmRb
         Ty5enD2vJ2zdJ6P6pGBM3AA+LH6KEVCgNcrwYbnAGS9VyOjIcDFauyjdM/dCv/dvGzLG
         QkczVyRhWzPPkeuidzTnSzTssodwxWZCpaHlqSUAhX1ndFLviubDWP3UkgX+LeGCeQUp
         ZoIOb3mTCfqTirN9bN7DBDjL14ni9fUtiJvvkdSPmnuazXY7EAdHChbN7C8wYGnzYW5Y
         i/K2W7ljP/Vju3N/JoQzswh5pIx3SmJSTzYmvM6p99e0AWyJHei02fFHKyCaFpCcaNGl
         INGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058915; x=1791663715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMS0fznvLZomihe8C/oJh3xR5MqfRPhNrCBOy3H79Y0=;
        b=VK+eMnnhpG6DWf3879rJXoyJ3b+EDlOQmo92sjrDIyeMMWByvGlbGpHmZXrMYTZPE8
         oDRKcVXyUc72YxTdw+Tx/Pu/92Ig/Dpe3ng0/qAEQaU1W5gdI+hMj/Fq8PvVXBAnTNgA
         uwICNmrrSHlBrga45o7bwF7troR8YkCJIUbIkunyt1Bsc4ObXyZmYS784dFTvBs1PTvM
         a2Jynoz7/LgiGdZjiUscR+R7v3WGFdhbPMQPZs5ywJMsm9X6w8vaza2Hx11DUk+xISp4
         eD2IaaYMAGHqF2iDe9C/YCRZa+M2p0ZeR0pdGZLq7qAii3r2T/MJve5OAVbrZNMD65PL
         gMHg==
X-Forwarded-Encrypted: i=1; AKwUvBxEF23Qp5ybXiqiWl0xF1RWFJ6B3hK6uuADZgrng1Nep6pAAFdz36rit/tINAd6ynu1ekATu/uczdC9@vger.kernel.org
X-Gm-Message-State: AFq9FYIUFMkzplYL0H7LE6rQDFB82/CdC5AbSFdtsn+UzkQFHLVVHwYD
	DTzOqXOc8FC550IYO2pOKVEhmzUHUD6qI90WTWl2x98Y16gUJb5Em62s
X-Gm-Gg: AYBFou1glJemoOhRnsrrHYpwx1QM84lUFtDsMTkGaf9cOuVq3AAy9rwKZGLqM+UdGjw
	UhV+j3PTNuEgsmGEVodYyRxaFEjkd34PVnPIt59KjGL4fISFpZZ4YyBaZCQT6ypTb3dySkKRsmH
	RhO2edhCvY8uRZ60dkY0gfP8Qpxez0bhsgQk7yOw9HXhMmuRt2O/RnGZgeScYmfFlnGaWAtz9EU
	FHoUzq3PxB1etuOYsxvA+ubC+x7OjYKNB+X0MF+VbadtJmW8GlTFVHeRMRmBWKW2ZebPaZ+LNVM
	5UWmlsf/RuRAZyrzb6blSUzZv27IP7jRPQEBbFR2TCYqArSddTbV0zhcwVmJrk0kMxwwe+97sdb
	LzPZPXzbeznyEWjJjmhMBGYZaYGVNKrj5KvSgxG3sSsvYEOvLI0+qi4Aojgm5w2qrQZ0MEkFMfB
	szc663QRBWLcjs+UUYHwBF5WM/TXDoMS6gbUa4/nwT1bbmsSu9l4NHlrdHiDENra9O40UYppHmS
	cSYRg==
X-Received: by 2002:a05:6000:22c6:b0:48c:466e:9d06 with SMTP id ffacd0b85a97d-48c47fe73eemr6546300f8f.20.1791058915157;
        Sat, 03 Oct 2026 13:21:55 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm15083316f8f.23.2026.10.03.13.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:21:54 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Sat,  3 Oct 2026 22:21:41 +0200
Message-ID: <20261003202143.4697-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003202143.4697-1-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
address 0x70 and is distinct from the Qualcomm reference EC that the
reference designs place at 0x76.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../lenovo,yoga-slim7x-gen11-ec.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
new file mode 100644
index 000000000000..37337de86b0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga Slim 7x Gen 11 Embedded Controller
+
+maintainers:
+  - Oleg Keri <okerixx@gmail.com>
+
+description:
+  The Lenovo Yoga Slim 7x Gen 11, a Qualcomm Snapdragon X2 Elite (glymur)
+  laptop, has a Compal embedded controller on I2C. It reports board
+  thermistors, battery cell voltages and CPU fan speed, and drives the
+  keyboard backlight.
+
+  This controller is not the Qualcomm reference EC that the Snapdragon
+  reference designs place at address 0x76; it speaks a different command
+  set and answers at 0x70.
+
+properties:
+  compatible:
+    const: lenovo,yoga-slim7x-gen11-ec
+
+  reg:
+    const: 0x70
+
+  interrupts:
+    maxItems: 1
+    description:
+      The controller pulses this line while it has events queued.
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
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-slim7x-gen11-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c57cbb68060..0bc10ee20cf8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15063,6 +15063,14 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 F:	drivers/platform/x86/lenovo/yb9-kbdock.c
 
+LENOVO YOGA SLIM 7X GEN 11 EMBEDDED CONTROLLER DRIVER
+M:	Oleg Keri <okerixx@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
+F:	drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
-- 
2.55.0

