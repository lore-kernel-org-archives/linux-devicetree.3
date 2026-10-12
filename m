Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62AC425880
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 19:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831772; cv=none; b=o4fZP1yq6aoecZ9JoSmg4Ns5qcx0i6jf4Z//AZVjAtFRLUN2f2nv/1uBVhOhGzVGhoqbpz/E20ZjFnXcNJ2TDsd0fohkwlR2cWcBq+G2FlgZGnoOiuxjQy/iMzIhnh+QeEtyP2Sk9lvcciOMpeHmsBZ8yfPQbVr1dbddvC672bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831772; c=relaxed/simple;
	bh=WVJvej3px7Ra8ChsdFJ9PKHS4Cy1YbcyAkrAlm85AEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7PUGPP3SkbBbhQj4lYXK1e5b6lHyI4T33KLrBIDOgtrswohn5GXb+JvNMjBfwY4GvgT0lruJWi27+14I52LAxtKokDw61H5I8Xyt4DpGUk+ZzCsIUvNKyIYpXnKdZ8Qo1+WptZZ7PG4pKg2N8X3dlef1wji+a+S7v5IT+dwqg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=DTdgIZO3; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="DTdgIZO3"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53397325663so23441581cf.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791831769; x=1792436569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcD/+zwif6Ezba5VquszHm7XURm94pdp0gErgKYBK7o=;
        b=DTdgIZO3S9x2fS941KSHibv3vnZtBAe/oSjsIl3nd4DsMEQAzj5Gyn4xPMS4ZnHehX
         yLuXwqrtnKbEIKAE2vKoov2OZ1aMm1Q5c/nKrb3lI+UxcEyRzVPgroDWlXlB1rqMhnWK
         qZRffxXgL2tQwuf5FjzUEV4oSbH98ZdzxmdQgj7J85WE9DPM5bz6HuODi5avKRWo4Fw5
         p3a5Nq9IFC/Npy1VZWA5sdfqQ05WuDWQ0k3WlIxd++/wCWDxcP88Gg0P15NVCSS64uu1
         QXEmMmuhiGGz49gGhV2fWQ6WBfZkF9x4Gy/XC/ExBXzi5jsPZXhOfAMf0Ba6SqETSW0B
         jTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831769; x=1792436569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcD/+zwif6Ezba5VquszHm7XURm94pdp0gErgKYBK7o=;
        b=YALTitXO1kZKKeHgiRKH0z4dD/5iXrG1JTxKGDRk3j28MNfUj/KD7JyU5TCzBG41jK
         5phgqmhP+mNKTTjvC2jy61/X6RJEnfLXiaQZxdUoH2WeetqzOsT2qBtFfmwKDmu/PTw+
         PeKd9Munut76OP+JGjkP6afmh8WWhDgyqce3SUkPRwkigJpqtSCTKflgQJpnpm0NqWGd
         uz9JiNfXmqoZL6zlzcQxEfojVXaePIuTQiob7D/Hekpgtwlxoinpfmhuc+DtFTpAJqVM
         yjbrTRWe234OntDNWuXBGHmGHZK28Zb5QpNqN/V8Ljq1mFwTmZ3RxKCkSdUrqnlNIcHX
         c8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwXvzw9I3VgYpfu78DwV84wgecN5PjuCQllBh7BTwPZKr0zjegQQqQ38CLLpgABMd96PUdzEQOxHi3/@vger.kernel.org
X-Gm-Message-State: AFq9FYLGiXHVE0krNrn5ekhSL1j58ftUxIJSrzi6dN3DmbvAmD/FSgp6
	Cz4KQd1rkXNAUHQtwe2LtZld/zVqBys1FWDm+jgg7NhJeJc9se5ui3GhxEkqiR2viwkKgeP7ZCo
	8QsPa5XQ=
X-Gm-Gg: AYBFou1q9E1F6ECBYim38pE9ONBKvhGu4UXnjhlrNOPX7D3LRG4+/t3lRRpb4ZzGlD2
	a9U/WMZdNn55ZZ00CThaeAR771Fh45hsNmPSSrqtCMxo6oaocv7aXb1SJy/atkv2Bd8tOnZ63wp
	O/UOFYuJgdK9/p4bEUhOnwvjyYVcKN4Ta8sKjjCRMqhAKn07IN2QaBq3/P9LkKdTtHCchzxI3se
	2FmLCOlgQkuxy+tDCv27JKsDZnlySkkH6S3SBB++L52K1rozw9AJgynmicHAigP8e3kd0WNi3UQ
	zs6V1PnRk3zJrXB9C0jWMS00xZGMaHfyidNDiAnAsdUsCQtkl1W+emM2qgs9UxrC6crC6lZdJBy
	JIQxFHiXQR8DeC7EKZDFLV+t5wBtTleybfQlVoCGE4OASeFR7SjZwHDTjGdlBddG1xVju9eTQq3
	wcT+kmhlFM0H1GHtEyo7XNy9xZ4K47b8k5ZDJ6396uH80qPerX2202h3j+XkSGBdyittDBW9Xy0
	l0=
X-Received: by 2002:a05:622a:5294:b0:533:3868:1f79 with SMTP id d75a77b69052e-5359fdb667dmr170661171cf.45.1791831769457;
        Mon, 12 Oct 2026 12:02:49 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7cesm4815216d6.48.2026.10.12.12.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:02:49 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: tglx@kernel.org,
	radu@rendec.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: introduce toshiba,tc9564-msigen.yaml
Date: Mon, 12 Oct 2026 14:02:43 -0500
Message-ID: <20261012190245.3988619-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012190245.3988619-1-elder@riscstar.com>
References: <20261012190245.3988619-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for the MSIGEN interrupt controller present in the
Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../toshiba,tc9564-msigen.yaml                | 70 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
new file mode 100644
index 0000000000000..39dc63964bd52
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/toshiba,tc9564-msigen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 MSIGEN Interrupt Controller
+
+maintainers:
+  - Daniel Thompson <daniel@riscstar.com>
+  - Alex Elder <elder@riscstar.com>
+
+description: |
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch
+  includes an embedded PCIe endpoint that provides access to various
+  SoC peripherals (including an interrupt controller) via its BARs.
+
+  The TC9564 MSIGEN (MSI Generator) provides an interrupt controller
+  with 25 hardware interrupt lines.  It aggregates internal interrupts
+  and generates a single PCIe MSI to the host.  Each PCIe function
+  implements an MSIGEN instance.
+
+  Each MSIGEN uses a gated clock and reset line.  These are provided
+  by the clock and reset controllers internal to the TC9564.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: toshiba,tc9564-msigen
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+    description: Gate clock from the TC9564 clock controller
+
+  resets:
+    maxItems: 1
+    description: Reset signal from the TC9564 reset controller
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/toshiba,tc9564.h>
+    #include <dt-bindings/reset/toshiba,tc9564.h>
+
+    interrupt-controller@f000 {
+        compatible = "toshiba,tc9564-msigen";
+        reg = <0xf000 0x100>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        clocks = <&tc9564_clock0 CLOCK_MSIGEN>;
+        resets = <&tc9564_reset0 RESET_MSIGEN>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 252b6d7ee1638..9e73a912f0c0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28173,6 +28173,12 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 MSIGEN DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
-- 
2.53.0

