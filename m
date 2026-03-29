Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B535F8C9
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774817542; cv=none; b=Adb8wPKcm4DwBc7WyyA5G/1HrvTEUfPkKqF25EpBTw6qJh5J/ziw2oMVxpHIBVgkki1RxVkD9NV5uJWxWBstQDZp5Of2KTu2BSA//mjoRKoaznh2SLGPZGl3fX3PERj/7DWoF8VeYvKsm15GlS2CNs9Gsfq7j7SkbRpCNhIkg4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774817542; c=relaxed/simple;
	bh=5wB2jRWrDf34Wq2yXZveYEIfG5TX6LXKr04QZfDaEM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdylEGTS+fch72jYn9LU0oOpzeq+Jc7/NAbmSJsWZdu++J9a2V9vlLLVz5Ynr4Sx0e33XeHAngmyDAKPIaVRnqw/9PrzN0Oksk74i8nAo3YCCOWYOPEZBuEDciPkPSuwheqkQ9Cva1o+9tzPoYcJArOv6vlli62jWnr5pZUZp80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkVcj4tf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkVcj4tf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2219690a91.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774817540; x=1775422340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4Cow+KHFKRG5kiCnQkhdbidV9anmjbpMjKgFHIwing=;
        b=CkVcj4tfDurUray//vbYq5QklNe6tQseVqX+BPTMLzCkSg1pwh0fJErDkw4Nsigx4G
         MNAeXvvDOoEQFlaoR41EI0VM2Qp0AeX1ZPC4u8OTvi4FjkwfsmqkRfw2v3ov9Y6q06F3
         9h55t3FgTh9EfpBsWWXafLjcmn2dsgAlzsFc5KSchAsICDeJ1mfbMS148VUlVwbXeZtP
         +4Y9lIIOAcwiUSefvWWKk4XZNEiqDeJ77R7Ro+kqk3qZay7lwyD0fBmottvNtfMnocz8
         Kb8jaAI3bSyefU3n0PXzZDWxek36D5NGz2FxaXDfdsxipi6HlQL+sS+u3/LZCT7E1cgb
         SSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774817540; x=1775422340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4Cow+KHFKRG5kiCnQkhdbidV9anmjbpMjKgFHIwing=;
        b=VaCT1mLQiRHTxtmorBP2YEsqMWN5z2C5uwnV7GF5qu+h3azGp8Y9IKciMRnVLWfig0
         8MvS5ChzruDz43oZma8gWUI4lp+4rkbuwUinLBSO+k1iwsJSAgfPlG34bCvdvN7AzGWl
         hz7qGV2tI0uLLZFkM3nAQaTYgryZSmjBtxkhbHbrviUjeyNjZm2rOPhWFrsmUfS6Yu7A
         TkfbxEHS8C5rWaPyYC290TpTIyY5gXDf3IUdLX46/p6ljqNV2tYpIPAphKOo3dB+cA2v
         m68pguXsQvyn2U5i3f7z8V04gIVcYelyR1zMvu54U/PHaQ6uVXNBuvDNiTCLsLUlT5vI
         F4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCW1akxukzzQTJ6oRPTOZDj2s25+kkxAO7gnpLmDPmizWanXbaBC38lWZ+ckvIZem+qHc9b87iEfEpTt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy58L6YvOlLOi1GcX14WQBQhTULXpCOjz61QEXIp32aUGKMMoze
	bhqPpxKR191184eYKysu/xoMRoT85XhPMetyygaj5hGLLxneBw+Vd3ko
X-Gm-Gg: ATEYQzwu8OibD9XHjrDuXKtFoAfaIxGAuSZsHyhbxI5Dt6A/rRMxbIGxJWT+zSVA60M
	2BJSBf1Eo08gsqLD+jCAJpnZQ+Ds2R5MIxfMHE5dNennGbgI4Z850DgSIiXAK22Mr4Wt4DmmDny
	tlpzx4Js3E7AeFybE7gBB5VIGUq1UFnTVvpli+2sASVqMZzf6m69h68Lmf2uGJ0oZ2NVLSuxYXQ
	J+RT6NSG6ShDOlrEm4tvy72lNkA+SLf0IK6t00rMNRyJDtmh6rhtzID9MImel6aey4Caa9TOas/
	Ba61adRa280DVa0KoJ1qnvfM4qT3Wy6l0hec5pAGCIPgSAi7wMW08jiAI+s3XmpKeNrcLLxIvsl
	kJAZxkhRqmnDXwOAvyg7eMkSBYfY8W97a7PvCQE+9AQomqFWmkeEkjYLtFosG2M8lxwHIRzxNsw
	Y09/gG6jiccLTsh+pFO1vfKnYl1gYE
X-Received: by 2002:a17:90a:e7c1:b0:35d:a276:a87d with SMTP id 98e67ed59e1d1-35da276afa0mr2577266a91.27.1774817540473;
        Sun, 29 Mar 2026 13:52:20 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9af6:7748:701:6c70:4173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c500sm10423412a91.10.2026.03.29.13.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 13:52:19 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: power: reset: cortina,gemini-power-controller: convert to DT schema
Date: Mon, 30 Mar 2026 02:21:50 +0530
Message-ID: <20260329205151.15161-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329205151.15161-1-khushalchitturi@gmail.com>
References: <20260329205151.15161-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cortina Systems Gemini Poweroff Controller bindings to
DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v1 -> v2:
- Renamed the node from power-controller to gemini-poweroff to resolve dtschema warnings.

Note:
* This patch series is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../cortina,gemini-power-controller.yaml      | 42 +++++++++++++++++++
 .../bindings/power/reset/gemini-poweroff.txt  | 17 --------
 2 files changed, 42 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt

diff --git a/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml b/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
new file mode 100644
index 000000000000..8fbe7e952b25
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/cortina,gemini-power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems Gemini Poweroff Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The Gemini power controller is a dedicated IP block in the Cortina Gemini SoC that
+  controls system power-down operations.
+
+properties:
+  compatible:
+    const: cortina,gemini-power-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+    gemini-poweroff@4b000000 {
+      compatible = "cortina,gemini-power-controller";
+      reg = <0x4b000000 0x100>;
+      interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt b/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt
deleted file mode 100644
index 7fec3e100214..000000000000
--- a/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Device-Tree bindings for Cortina Systems Gemini Poweroff
-
-This is a special IP block in the Cortina Gemini SoC that only
-deals with different ways to power the system down.
-
-Required properties:
-- compatible: should be "cortina,gemini-power-controller"
-- reg: should contain the physical memory base and size
-- interrupts: should contain the power management interrupt
-
-Example:
-
-power-controller@4b000000 {
-	compatible = "cortina,gemini-power-controller";
-	reg = <0x4b000000 0x100>;
-	interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
-};
-- 
2.53.0

