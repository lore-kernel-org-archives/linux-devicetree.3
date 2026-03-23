Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D713C9EE3
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288836; cv=none; b=nR7fVe02CUwnLol/ptqNIVQ8c/wjAEXLfdIG4pEh0yuOdagOeCU1UxmzIgnK9Lhpqe56ip+YnVoeP+6p4kMM74JapWhnE4Sh6ULuLS6rnDFsQVY39N841ilkd4dVitlh//cGr8Zuo5YwDIghedX2Z4+ZVlG+H+Yv+GXvXwomVSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288836; c=relaxed/simple;
	bh=LLPiwF7UGY6nyiXVOwJgMlw8Nb26M+J/LVNn0ejXn6I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JgUC4kCXWRqMUf8LRctIw/QePpl32SkCyZ2Qbe6CltnilFqre+76MHhEhd6Mhzu3k9H87lfc3I3t/ggBnpqYQYtYETXqQpFuk/BKlaht/8AjfXrR/rAOqvQrmNmeYlB/E7v6OwvgGoYxYGmQ9WsaF4oCREW+m7VimTGX4ctODhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG/v+o/n; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG/v+o/n"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so37964185e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774288833; x=1774893633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vg+jkqcoVNFNI7ndmig89tjt/SoHh62XMKbUf5COJgE=;
        b=RG/v+o/n3QCZFPdwO3KEr67CEEdOanZH3dXPiz12s55L4fiUfO2MLjvY8x/fksE5yk
         D5se+E/sLBhwNCH83YUzTq276JqQSktU75IaPi2zplUbjbjJAJ4pboEnBJExizTAgw34
         Sw/eYKad9u32rKrhepNMD1gLMmh3UPD9sq6SvxhG21k0Fy0Oej+V0yS8Zb0QFxPkPMef
         g7JNwMOkbLv3OVqrPyBfb67f1/TvxHmimu/BthHUVaDuF0N53SEhcwC3w4YwY8DbQHby
         0B4jojNXLyobL648KRCvAylCl9t3Gg7/xpBndoCa80dZnXqZLlMry7tnvCDwQpEpJCCB
         N5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288833; x=1774893633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vg+jkqcoVNFNI7ndmig89tjt/SoHh62XMKbUf5COJgE=;
        b=iTr05QyglJcP6Q++wZUL3LJMgtTBu/4+JxvklS1itpel1t3D+NY2UP9Yje/yFT0bPx
         tN95HieXmI06Kb/tLf7Fj7TO+NIHv5uFs18mU2T78boxAvrwv3g+9VkvuvubJq2nS7B6
         jgHlaxwhABwlwX8xICJaBG9cqLJolhM5LNZZ6Nn5vRA0wt0jDwFcf9KQ1c8OORLEBwml
         UHqwb82+siLRrXfQeiHmQsFfZNVY/mG/llM0QWB+oKE84EANPciRKakrJJOnlWwq42Hs
         Mvtayi+CM7Aefgbd0WXVWIu3My9uHaIdIdzAFenUDPNosh7npbFporPqi/0JXLF1+0g7
         9bLw==
X-Forwarded-Encrypted: i=1; AJvYcCXMinnMlWrmDEIMRCaEPlnKgf2mKc8eZGZ03q/uJSNfrmbZqdlpc4strREL/7FOiESOTSWKv7cCsezV@vger.kernel.org
X-Gm-Message-State: AOJu0YxoezaAhDPICevTB+N3Y7U0W9OOc7DTmM/Eny0TUmab4EcA/Qnk
	YI4LxRUuskDbaKVlv/wQGc108bp9TlyiWz5/3c8AAUD5KueY1Ewyo/ju
X-Gm-Gg: ATEYQzwaHZPV4wlXgMSg++Vbx1pHhfLwxv6J0hFTM0kZ86bW4JJrOmpjfXNdqKOdTyP
	SPzINexpq7x1FBvssS9o+OuzKTYnpclEEa9Yl9MegTePJmJP15YZwijHTyrREEZEc1BTld+b2hZ
	bmW0iPVPk+mXPUXMOqRZk+GiT88mRRkRplz/SIcw0MdfJOFuztnCxf4HVrEtV9V4i0vAR0sGMLA
	d5sh/PV42phVQvIpb0o0v2SgF3XYcEjzt1R6itZ5vqFVLQHoqV03yGwlVDuV1up24zPPgEWgaUp
	Vce5omPOrGT6qHJWGa9VF6SpHbp5UDKJEAK86KKmaMzd4/F+bYzEDFhuOZmaM6alZfDbnGTqslk
	ML2QyBCOAZu7mc5tCrYcMKMOc/nOnYLbkpifBlSfuErZcLmheqV+uJZwiSzpqxpz+tLvGtK1Rg1
	bZhDPVwbElGx3x
X-Received: by 2002:a05:600c:1d02:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-4870f1f40f8mr7506315e9.5.1774288833279;
        Mon, 23 Mar 2026 11:00:33 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486ff1d3befsm84419925e9.32.2026.03.23.11.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:00:32 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 19:59:44 +0200
Message-ID: <20260323175948.302441-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323175948.302441-1-egbostina@gmail.com>
References: <20260323175948.302441-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Technologic Systems TS-4800 watchdog timer bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../watchdog/technologic,ts4800-wdt.yaml      | 40 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ------------
 2 files changed, 40 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
new file mode 100644
index 000000000..5c2541ac6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/technologic,ts4800-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems TS-4800 Watchdog
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: technologic,ts4800-wdt
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to the FPGA's syscon
+          - description: Offset to the watchdog register
+    description: Phandle / integers array that points to the syscon node which
+      describes the FPGA's syscon registers.
+
+required:
+  - compatible
+  - syscon
+
+allOf:
+  - $ref: watchdog.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      watchdog {
+        compatible = "technologic,ts4800-wdt";
+        syscon = <&syscon 0xe>;
+        timeout-sec = <10>;
+      };
diff --git a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
deleted file mode 100644
index 8f6caad42..000000000
--- a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Technologic Systems Watchdog
-
-Required properties:
-- compatible: must be "technologic,ts4800-wdt"
-- syscon: phandle / integer array that points to the syscon node which
-          describes the FPGA's syscon registers.
-          - phandle to FPGA's syscon
-          - offset to the watchdog register
-
-Optional property:
-- timeout-sec: contains the watchdog timeout in seconds.
-
-Example:
-
-syscon: syscon@b0010000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0xb0010000 0x3d>;
-	reg-io-width = <2>;
-
-	wdt@e {
-		compatible = "technologic,ts4800-wdt";
-		syscon = <&syscon 0xe>;
-		timeout-sec = <10>;
-	};
-}
-- 
2.53.0

