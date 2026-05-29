Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B5130C608
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034711; cv=none; b=r2PR0vrZBY/9ZEMcAmqXj70QMfiVKs+uaaKXV0oOyLU3xAG1IPX9qjrxfndEig9BwAvhBGvYrEpT8QbTIA917drZfCMQgoRIuUf8Rcu6MhGLZNYARu8e7kn+sWFzv2PjjFAIUU8KAdnzVnWvO/dXSOdJ9lJdGPeeNPIX2fAZkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034711; c=relaxed/simple;
	bh=OS6FQ9Pex0XzkpV/4HJU9MMECUkwbOJLAzYWf7WMIBc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EGAZHodIV5IayuxjD97MHbrgTj3X6bfq4LKBpa3On1te0uAX/LC5Ovb3CYjc0Wi4hQrUikS/JkshG6gTGyqj0s3YhCOSGy/0hWsv8z/jJfZPPS2uD9O3Pyn+KZfhWe4fWUpuApvwFrEUIRAcVARKdyRJD64F40zK576P+jy0tH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsuEVw42; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsuEVw42"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3698e34a567so12465770a91.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780034709; x=1780639509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuuXnQgbsRXJoDchNuBoGmAB9VHC92mFcRfnEHoyUYU=;
        b=nsuEVw42b9g4fu9+EqbsTaXkTS5VY/VtDhrdvEnP77fZTJxulBl65D7csw3emeygMG
         adYICxuWQ61yPyVs/l8YaA4QCOc9SKL1suVeMtwHNTRJIKbZX8HMuP/pYc1JK212tj13
         eCBm6dnnte+HL3AMTDHDIeqYprf8YtnCrPE7B4oNBKsMdRufoLrI5ZZTej28mkqjHCM4
         TBjLM3YIFXtKJZeLFfHEyEtTdzHaOBzRQ8+XkIDMffZDwTFTbTpvcLscAF1cgsnfFVvj
         Sn33fhoUrnHJG2JwXtiYCeV3a05K3X9FOigUdMCzF81KRwdPzhaKCXEIyAhb62sqYy5A
         mwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780034709; x=1780639509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuuXnQgbsRXJoDchNuBoGmAB9VHC92mFcRfnEHoyUYU=;
        b=E9cTeAfIvuGF1h94oN/aJwttuCs874i8Y9L3Az9RygYuAt1TfA1B2WziQ5Wh2ifdfv
         nmR1RZD/OuR1A7eGaI57o9cPtH9s8t5SOrllDFvxATQToDq+/QZSIfHTfs0EceRPv1Tq
         pCq3Tjng8Q8YE3R4P+8j3Gv45xkjESfxDX0svREfIXN0GEIUyyY/MV3EVTvRfGaJIR1D
         B7Y3si/ZXXaIFjW7ocZGss7Ib3mouJwNToYD306QiWNy7deQRJitYO9WkBTvHKwJQU49
         jIyHRZqmjUyl4zfCP6B7rYyU2NfeP4Fk1QyoDqac3e4j1LmYT+YWb43ojksnSWYmC+c0
         PrMA==
X-Forwarded-Encrypted: i=1; AFNElJ/YFVBy41Wx3UuoRnpHdJ5ylsr3hq/lvBAsFYAWa2YfXHxsSHYFZJhXTDINxjeh9lY94FjMRWNpClMS@vger.kernel.org
X-Gm-Message-State: AOJu0YyHq7BsWOq3foMhZ5m5PIilE+Kxmof0YfITsisQoeXtmFlqDyjI
	PeonFv+lKHbE/suQ7x8D0+s3DgsACJil7r5Sn+lCQ1MhCHwHfuZlNDus
X-Gm-Gg: Acq92OFKHmmm4I7huTW98+RJSEEZEcwNE3etpmyKRyzqd0sar62Th2FiWrZjdO+AHaV
	RwT5qmHjhAJdJsTgtSyDmfDsgFWFBQYSiaUqwdWQHydKi72T4kOyxAE/O8VSz5O0ifrQRZKE8s/
	/6OL93GNtDseMpmQwMeu6tMpjeK5vd5OpvN52Z7WtM+e6wGy1kKqb2BvFgJYbNX2SP8VTmNMlaR
	Kimnu0uAwtfT70XNxkrW+RtjIriJ9aYfjKTDIw08F5PGvfmNYx5w6PX1pob4JRxdD+NyW99MOkO
	LIrphfimGeFciepBkmbzbTJLPHeTicJD1aUt1V0nyxy1tJ/KkPqyn1k5grKkT7qdMR6/SH7Y7Y9
	Sf+1nkaqt5m7ImrjOfhiJjJ56NT7rF6SKMxEMEKo+gA6MCPWepeaN5iQ0mSy8FRbvC5+mP/y7FD
	hDg188zHbsKY8pirMGmIhpfyynCEtK7VZMeezmCHJlVWR3M+GgT1032oLszIRqXskUGtOfIDY=
X-Received: by 2002:a17:90b:1dca:b0:36a:ee1:fc24 with SMTP id 98e67ed59e1d1-36bbcd62449mr2033607a91.8.1780034708656;
        Thu, 28 May 2026 23:05:08 -0700 (PDT)
Received: from gmail.com ([2409:40c0:1078:df61:5d14:1864:57eb:6e59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6b50edesm632818a91.14.2026.05.28.23.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:05:08 -0700 (PDT)
From: Rohan Mithari <rohanmithari09@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	peng.hao2@zte.com.cn,
	Rohan Mithari <rohanmithari09@gmail.com>
Subject: [PATCH v2] dt-bindings: misc: convert pvpanic-mmio binding to YAML
Date: Fri, 29 May 2026 11:34:59 +0530
Message-Id: <20260529060459.1053503-1-rohanmithari09@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the legacy pvpanic-mmio txt binding into YAML schema
format for device tree validation support.

---
Changes in v2:
- Remove legacy txt binding
- Fix reg example format
- Add trailing newline
- Run checkpatch validation with --no-tree

Signed-off-by: Rohan Mithari <rohanmithari09@gmail.com>
---
 .../devicetree/bindings/misc/pvpanic-mmio.txt | 29 ----------------
 .../bindings/misc/qemu,pvpanic-mmio.yaml      | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
 create mode 100644 Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml

diff --git a/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt b/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
deleted file mode 100644
index 985e90736780..000000000000
--- a/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* QEMU PVPANIC MMIO Configuration bindings
-
-QEMU's emulation / virtualization targets provide the following PVPANIC
-MMIO Configuration interface on the "virt" machine.
-type:
-
-- a read-write, 16-bit wide data register.
-
-QEMU exposes the data register to guests as memory mapped registers.
-
-Required properties:
-
-- compatible: "qemu,pvpanic-mmio".
-- reg: the MMIO region used by the device.
-  * Bytes 0x0  Write panic event to the reg when guest OS panics.
-  * Bytes 0x1  Reserved.
-
-Example:
-
-/ {
-        #size-cells = <0x2>;
-        #address-cells = <0x2>;
-
-        pvpanic-mmio@9060000 {
-                compatible = "qemu,pvpanic-mmio";
-                reg = <0x0 0x9060000 0x0 0x2>;
-        };
-};
-
diff --git a/Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml b/Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml
new file mode 100644
index 000000000000..fe24bdcacc9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/qemu,pvpanic-mmio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QEMU PVPANIC MMIO device
+
+description:
+  QEMU provides a pvpanic MMIO interface for guest panic notification.
+
+maintainers:
+  - Peng Hao <peng.hao2@zte.com.cn>
+
+properties:
+  compatible:
+    const: qemu,pvpanic-mmio
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pvpanic@9060000 {
+      compatible = "qemu,pvpanic-mmio";
+      reg = <0x9060000 0x2>;
+    };
+
-- 
2.34.1

