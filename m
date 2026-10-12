Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703444B4056
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823440; cv=none; b=t2J1Pr5g0qcDXR8JAx6fRzjgKW6Gq2/TEqLE3uVlkyFw+aD/ajzJ6eDpcGcxeaR7T6OoUztgKRE2oUqh0iNtX+uuttW1cKqJJa2e6KpgaHSRRM8CQUqraEl9K3Nz887qQk5ZPfHJNeDZVSOcn55vInfM4qio4CU72xhXUouIYgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823440; c=relaxed/simple;
	bh=dpsrGmthbDdJViv27CwZRLe0onq0Y1dVg1G5SbJ/e/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDZHQHZ7FTvLlvQ4RajnWELXHZYniV9l2WApV4zbVOBwfnINWvPt0oZhIvbVMl6iN1ER4xGht3uAAH8sfD56DBWYmYKLSaSpMaruklZ66bn4Htdbg5nkv5eaiwi04QVNyb5+iBatcIAr9LBZi494RwXmQc656b5Ik9G3XJH2hiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ZKc7c0Ke; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ZKc7c0Ke"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9196d8543cbso23875776d6.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791823438; x=1792428238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HubQDXY8rf/2H64/w0p0PG60Zk77KAD8GwYfI4yp4xU=;
        b=ZKc7c0KeeEyrPdh03OZMhaSnynWpFiMyFJ7LwzvZL7ceSjfcJfnKbZHI5XG1aaYpP1
         9cgP8OrE/5mUadW4hVuWbrEuh5royEMOy822lEROPeMQTPPZFsiyPbbxdJZSh//uk5Fu
         ZzKdnRjGL0vucwWMjN3smMV3LLNO7Jw39B3SLIwJH52A4k/udZbSlzYCTl2JtQtFDc5y
         IUrXWuU3aYo68ZIihmy1Bj83BdaDhIRqvm560blFlWPq/REp8F2TIUqL91ql8HwXtB81
         riYuoiea0mhgM5f79+Dq0TAJHLvStvnyM0iy7RcnRwwjR4kgc+EFUDoE/v4W0cAUjNBw
         O7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823438; x=1792428238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HubQDXY8rf/2H64/w0p0PG60Zk77KAD8GwYfI4yp4xU=;
        b=mABO8QSYGctChAfiH8IZmgGO3l6HKzXpPfRcoNZh/l8bm+rNm0PcxJMxehdSnUXDW0
         ecy4jnDz5jITJuwVhNRJNuYBeeHU6ZYI1Pfi0lHch9Fze6TCiGzmTPapdZ8AlSlyinDE
         7+IBNacuj1uQiW8Lj6Mya/nIFYFDNdH+5tHCyS3VpQsLCq4r9HuvvQGmxA1pGK6/uwr1
         F8L64XcouqZgKkF/RR625MQ5w79C0eSsEYgZs6OOPxQ6og1RWEKHT6zOcAy+mIN4j5WR
         QUsXZ9ZqvIiyd2223lN1FumMLLZHpaBHxwsXxn3m2yDEi9bQCRoxqfY0FHbKaQAuTp+W
         cuVA==
X-Forwarded-Encrypted: i=1; AKwUvBwn8ag+OC52yDn4q6EdoxsDlB+erMuGFS0ej9GN9f8GLV6+MD6fIU9qmYK6JgoIhst8xStsqGmboYfJ@vger.kernel.org
X-Gm-Message-State: AFq9FYI42BbGkM8hZafidRuCOd3ozBf1ggO2ZifuLLX//RN/3soVx1Wq
	h8UIjrYhMnJTP+zdXAdFLWwPMQHdgesTv5HTNb7rXco++JPOrwFUlc/uN0lvcI1oIag=
X-Gm-Gg: AYBFou2+HHqP70Z5lptbj8jBOVq3spqPRUDZguLn29Z2hL5lX0kEbIaAR5q59xeYrD9
	vGDLPzCIeyEx9F8jxEGW+7QNxr+Fs8WytLfG+/NCB8XIL11xbCcTzurLjvqE5gExH6JzLx6natk
	Ku1qteqUC+6oF6d8/T0BwozC0+wmiLf0DrC0Xd9TdzDZ6CwHQx/MCXvbalqSm7urX8X06FLFqcD
	PyFUCr7dRwC+nQhdeaTd6cstNjydrFiQT6FJdHeAxRlxl997TthqLkp3XIkdxOrWJ9ZgSsZSjvx
	3UH1j0gnDa1ZKZg+bpUjitz2Y8fRA2Xslf6amvznLGqpkDb0obpADTgDjPm7kaXshidicZelTEd
	bBM+v4ts9BXFKV7C804Q0+5adniDgs+05g225+NBPrhwKzrKVaMoaH/Y804sttTOp/oUuiuNOtM
	YDNPXnhBXaN4fQlA27B0jJyl96eQxQ6Yybmrw8Iqjt6xedy1eYarPKqY++gDu/HV98qW7gfjyjO
	dwk1WVsHmFI8Q==
X-Received: by 2002:a05:620a:270d:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93ebd497208mr1734898085a.66.1791823438385;
        Mon, 12 Oct 2026 09:43:58 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm24998885a.40.2026.10.12.09.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:43:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH 1/2] dt-bindings: reset: introduce toshiba,tc9564-reset.yaml
Date: Mon, 12 Oct 2026 11:43:52 -0500
Message-ID: <20261012164354.3872326-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012164354.3872326-1-elder@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for the reset controller functionality present in
the Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
 create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
new file mode 100644
index 0000000000000..1908e9539abac
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Reset Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch
+  includes an embedded PCIe endpoint that provides access to various
+  SoC peripherals (including a reset controller) via its BARs.
+
+  A total of 13 resets are implemented, though two of these are not
+  controllable.  Access to the reset controller relies on PCIe being
+  functional, so the PCIe reset is assumed to be deasserted.  Similarly,
+  the PCIe controller relies on I2C, so the I2C reset is also assumed
+  to be deasserted.
+
+  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
+
+  The reset controller uses registers within the same page as a
+  clock controller, so both devices are defined as children of a
+  "config" syscon.
+
+properties:
+  compatible:
+    const: toshiba,tc9564-reset
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - "#reset-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/toshiba,tc9564.h>
+
+    syscon@0 {
+        compatible = "syscon", "simple-mfd";
+        reg = <0x0 0x2000>;
+
+        reset {
+            compatible = "toshiba,tc9564-reset";
+            #reset-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 252b6d7ee1638..d0eb44079fe17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28180,6 +28180,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 F:	drivers/misc/tc9564-pci.c
 
+TOSHIBA TC9564 RESET DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
+F:	include/dt-bindings/reset/toshiba,tc9564.h
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/include/dt-bindings/reset/toshiba,tc9564.h b/include/dt-bindings/reset/toshiba,tc9564.h
new file mode 100644
index 0000000000000..5fcc9a06d4ff6
--- /dev/null
+++ b/include/dt-bindings/reset/toshiba,tc9564.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __RESET_TOSHIBA_TC9564_H__
+#define __RESET_TOSHIBA_TC9564_H__
+
+/* Reset IDs */
+
+#define RESET_MCU		0
+#define RESET_MCU1		1
+#define RESET_MSIGEN		2
+#define RESET_INTC		3
+#define RESET_UART		4
+
+#define RESET_MAC0_MAC		5
+#define RESET_MAC0_PMA		6
+#define RESET_MAC0_XPCS		7
+
+#define RESET_MAC1_MAC		8
+#define RESET_MAC1_PMA		9
+#define RESET_MAC1_XPCS		10
+
+#endif /* __RESET_TOSHIBA_TC9564_H__*/
-- 
2.53.0

