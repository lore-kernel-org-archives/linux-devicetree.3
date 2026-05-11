Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146BD3B530A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534102; cv=none; b=TK8t6ZAOU5pKskftp0DDRDj8oN4PbNxXnqnxErEb1FM3zs5TXowAKK9+0L0k+qxLFc3xWz/RCuiBPXGkYJ/s1bd3KApFYZzwijAtYoAnIPHWDvwrQxB+PSYBx0mcz38eu7MsHKHE+yjyNJ9smpopatO1+omF4IgwtHV0IayWAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534102; c=relaxed/simple;
	bh=Zc31T/QO9EegTI6B6vuxwKR2XMOEi+0n4zCsru7FsDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bcN+SfI2BBSYb8hu5aOMaMhYAF0EuuRDhMu5k9VRs3aPDIDm8EWd+E5rmPGOBpNICPpHE+rl8xr99p0pryRTqq7TbpIenEJJEJpEW6iPrqCSF7RS6y7T/shplXpZmqJlp4UDrqn5RKyLuGD4e0chvYRjwrVOO0EqoiUIazajmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Osm7Zj4R; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Osm7Zj4R"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bf0b1a47b1so46969187b3.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778534100; x=1779138900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6ldejdVN081D7fwNeDF8ZPrc/XeSO77Rq/+gN7cxYg=;
        b=Osm7Zj4R4/Yzhii2ocOlG/VyNmsAe0XBXV4RnOPCIbZfldkh/ut3mp5kdKnb3p4nHk
         gc1BCNDD968g1NfckmAoMUdBtv+53YSdLNEiL9EQSttel/6n3gK01xA6cUsPCsw4HDHx
         Y21uR1jI4usx89SDMEWraPFEcgiATHoYUsidJjQieVT4jW3u+IYwPLumFoLL06KQxSWj
         lZLTecb9aJJimgQp/2Q/VLNhZzNkmaFYU2zXE4wYtu5KFRbBvIX4FPveWpbfTtAD2PR0
         Ncrh6C+Gs1n1HHjMoE44zMbwugQ5uwVq+JDaIsuiCZB/4CXU7WUecEAAfckdWI7llWuz
         xTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778534100; x=1779138900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q6ldejdVN081D7fwNeDF8ZPrc/XeSO77Rq/+gN7cxYg=;
        b=SSSmVYGJJai58LSokSuXBGWzWZV2vbgajzD77+3cL5CD6yA5LAl4sARDF5kh0zRA8J
         Dw0SJyJ7qdWDSTcgjHVgnH8ZE+5CWdak3vEDpvm22etZ59uYI5zCFm7M13QtSVuor6Po
         glwtTIF11rmdEUkPhIuGQOImvFsZ+qt3VOoIpTTUNiWSSIbo8x1oV9L/CiMC+ELCFcW2
         aM3cecF6s4h4F5tyUNx28iz9OhEGmO5x5xPNpc7eeU94eu8FGF14dxPwHsfZM/zLGaYN
         pZ2ba8ElmRUNNCW/NQvvXonPwiqW8EP/JL422ujaDV16Swj7Zq4Xmp4hP4wSvXsORW8H
         mGtA==
X-Forwarded-Encrypted: i=1; AFNElJ9LM/LziZU5bGUmbYSZJDOxggau1vygk32DB1HzSNEIh0BMKeikM6A7gz2vXqwrVDHDF+tSuDQtLDcp@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6etbLAIlbHw86JZQxOaCivwHZkbgM42RVqqRiIjq9zyYG6e+
	A2eH34rUMiOSvyIr7r6z8Iz7dirpiQma5CORm0xm3HdqIXm8MRfpdzI=
X-Gm-Gg: Acq92OFfn8V5/oH5t7HhyHZosZSjmVX1nhPwDvAokBUuZs5ejZIovj7aQGK3FqVONNT
	XRshAKH4ztuZLsYkViL04B+MOTEtrKdxVLXdMZwzaGef8uQipd5Yhq789k7W0oFyTSaPvUufRmD
	t1754JkY6TD+HKLx4fa+TtidKYj//9jF6hORX3KrByc5tuagLbdEt60kAzSjCUtRyYwxB3/ubiX
	W1UJDaztRZYJ9UziSzrYRdj4Lzj9QWIdd/65TFnW27uzEz6UYDXT9SIyVD6wXwLKA+c2l5DZhIJ
	NbLHZDNnyv/IG5/7NgFbSPe+MoHBhGkBi+T80olZv/AbZrE02Vait2dsESXMhHz4B3+32QYgjs5
	ba+NJ8k5xsnneP36bZKBBZEZGTMXMHMWHo2ieOKypQZMCvbw9mGL/6uJoI0g7GN6vXXdrBIzUpA
	e+5+CgB62raAmjmiBcGCJFi01cXXV/8F20MXZ1TAqEUrDt8A==
X-Received: by 2002:a05:690c:399:b0:7bd:9f34:59a3 with SMTP id 00721157ae682-7bdf5debfdemr271707107b3.11.1778534099874;
        Mon, 11 May 2026 14:14:59 -0700 (PDT)
Received: from alir-mac.sitimecorp.com ([12.1.37.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd665464ccsm154634767b3.11.2026.05.11.14.14.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 May 2026 14:14:59 -0700 (PDT)
From: Ali Rouhi <rouhi.ali@gmail.com>
X-Google-Original-From: Ali Rouhi <arouhi@sitime.com>
To: jiri@resnulli.us
Cc: vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Rouhi <arouhi@sitime.com>
Subject: [PATCH net-next 2/3] dt-bindings: dpll: add SiTime SiT9531x clock generator
Date: Mon, 11 May 2026 14:14:52 -0700
Message-Id: <20260511211453.20671-1-arouhi@sitime.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260511211143.19792-1-arouhi@sitime.com>
References: <20260511211143.19792-1-arouhi@sitime.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the SiTime SiT95316
and SiT95317 DPLL clock generators.

Signed-off-by: Ali Rouhi <arouhi@sitime.com>
---
 .../bindings/dpll/sitime,sit9531x.yaml        | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml

diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
new file mode 100644
index 000000000000..0b05f0de65b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dpll/sitime,sit9531x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiTime SiT9531x DPLL Clock Generator
+
+maintainers:
+  - Ali Rouhi <arouhi@sitime.com>
+
+description: |
+  The SiTime SiT95316 and SiT95317 are I2C-controlled programmable clock
+  generators with integrated DPLL for synchronization applications.  Both
+  variants contain four PLLs with automatic/manual reference selection,
+  DCO frequency adjustment, and phase offset measurement via an on-chip
+  TDC (Time-to-Digital Converter).
+
+  The SiT95317 provides 4 inputs and 8 outputs; the SiT95316 provides
+  4 inputs and 12 outputs.
+
+  Runtime configuration (reference selection, frequency, phase) is managed
+  through the kernel DPLL netlink subsystem; the device tree describes only
+  the hardware wiring.
+
+properties:
+  compatible:
+    enum:
+      - sitime,sit95316
+      - sitime,sit95317
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's active-low reset pin.  If present, the
+      driver holds the line deasserted at probe.  Optional; boards that do
+      not route the reset line omit this property.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt from the chip's active-low INTRB output.  When wired, the
+      driver uses it to trigger immediate status readback instead of
+      relying solely on periodic polling.  Optional.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-generator@68 {
+            compatible = "sitime,sit95317";
+            reg = <0x68>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-generator@68 {
+            compatible = "sitime,sit95316";
+            reg = <0x68>;
+            reset-gpios = <&gpio 78 GPIO_ACTIVE_LOW>;
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+...
-- 
2.43.0

