Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721BF42B75A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328391; cv=none; b=QwcyNeGkhYu10Od7d9m4l1xcw3XCNqWSuz/RiY2iBHOq6OuKDe0TNwMcwNSz/4kRBwnanfUXmeSH5NluwlohwvY28jJoGfr4eU/0d3wHKZ6MHZjUdXdoe567g3Q/OprGjdEbnrmKx3PSDjkW6hoa8Ayk5mNkW1A5DwOeH+X+Hk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328391; c=relaxed/simple;
	bh=Vw0ZDbIdyX7wN5WBU2vgqjTXhB38dKH6zpGgWAAPSMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qflTJyGlYyMcNjHLb1Jy/nU/jox3Q+VmRyqYesrStkF2VdvKx3zQPVq1O45VVk6QTfnzLkwgONC11RZc3Whvy88m2y73dDNU6OQNpfnJWwNViMXyIdOMxiqP1z9ELsXyp0HZnTSiTTgY4SVImVGYlVuAdvxbSsEBNiuw1+u2WbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bz+Qf5PA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bz+Qf5PA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c7902f47so15880935e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783328379; x=1783933179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M4UZmhZB6hL6eBpbZaV0FmU4Q8YxlLtTX/b/nBeOzs=;
        b=Bz+Qf5PAHg2uhx09r/Pojmw/FTEVZVZGA2jC9LG4vMcc98DhKOv3M5doANKwvh8jnw
         VsnL6QNS6qsoU50tB7QcP58uZ8oT3OVBUUXIeTgYum3eA4HMsFToLmjXuFPCfcV+cqQK
         n6WA8DlEreEcpEnbShgAoj0004xHir94a/6YSXvb1kv/xgbCCPQ+6H5AL93YkhLgv/lV
         Znm7APPJEhkIvqvJwNTDTClQYh4GqisuPGHMgVjef09Dyga6hbjv2C0aO7E8MlRQWj+L
         /iedHHybzvBfHsMa6n4suDdZ22ltQdiEpOSXcboBgyPeDv1IA7CBxaIDbmzDzpqdUlOz
         TfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328379; x=1783933179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+M4UZmhZB6hL6eBpbZaV0FmU4Q8YxlLtTX/b/nBeOzs=;
        b=bfriUQ+Pw015GdekgAOiQAwT54gcupk+B+Sp1xxd1uBuHUyYUDFbeOpmaVSqgGJsdg
         z7/I3peMNa6tgKOOskelOcM8xpwHXn/Bn1nBIUYkBEIfjM4cVHyywG6sGA/VOzxvGHJX
         50+NWZG3uihpjm3AllY5Scn6BuUiYb43KKOQWcBrSD+jSsNjE6BSkwWbJLCiAFZ0gG5o
         jUn/aS+H9qjSUXr663gFclANkjRNCDD/5IvHsc/B9Qao8s+/g8yTuBk/0BwDGDzqrcZk
         ymqKCfQnxVZDLRPKPpBl0fNrG1op5TnL/RUjM4ZjUhu1ANKgXDvCjIj05gcwShGRurx9
         dhGA==
X-Forwarded-Encrypted: i=1; AHgh+RowQgqHeP4YwoKVdwVUaIaFAGaWJoyQ+xAl8oyDPdzKrnEk8TapVwFKRxI8mw4zZ1SuXXHuDq28/IPg@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNwyxiJSbS7AiSGmLVPllPuU4rc1VDk7+t0epghBf7qcJmR9d
	Jn+Y4o9oZB9jlGSV/ZhNrxpKKj10D/KLpofdtAWIYi2vkMkIq04qRbgm
X-Gm-Gg: AfdE7ckE2RFdJs/i56Whh88uzuCvsH3c7UObDbV6CLbWaSU0gMtV0/l40EVltRX30TQ
	tNoH+UWGPPYiPPvP1VfyuxNXbvZW5IDf0rMgfdCXR0NwRlaP0Ib0weWjLJqa4Yn2pfOWMivUGdL
	NHboco7ugIS4j+tCv4giI92w0s7ILLpYarrndsw6jv5H9MCxNdQq+AQk8y5UUY5DwOANjwf5P9q
	Fg3RrcSExkOf6A5aC6pwzIZL73LqetYKQV1fQFI9Bx1lVJ+LsOHdDnVjpgcp/2xwAY+raYJN3vu
	xXWLQ5UQBKCYsiNT7SiK5CpDMEaDGeve1jYRJt1JDR1EutaKhSWVFvzhae9Md81sOrQAJ4HOSmM
	vAUExCQQ6hxLEsvQgyzXdNsUXl4pkCMypm5ME18OaP9jVloq88E5TPLYXoiFdrqY6FReHEe2sYf
	hbt05+sjll0SNF51IH2KbOJbMQZRz00Bxg+3y2ZGtk53LpnDvIkcA49Hg=
X-Received: by 2002:a05:600c:3113:b0:493:b03c:5650 with SMTP id 5b1f17b1804b1-493d9156d45mr42366355e9.19.1783328378888;
        Mon, 06 Jul 2026 01:59:38 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm22314373f8f.23.2026.07.06.01.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:59:38 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 3/5] dt-bindings: soc: ti: Convert IVA to DT schema
Date: Mon,  6 Jul 2026 08:59:15 +0000
Message-ID: <20260706085917.835875-4-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706085917.835875-1-egbostina@gmail.com>
References: <20260706085917.835875-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments IVA bindings to DT schema.

During the conversion, the following updates were made:
- Moved the binding to bindings/soc/ti/
- Removed 'ti,iva' from the example as it is undocumented and
  unused.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/arm/omap/iva.txt      | 19 ----------
 .../devicetree/bindings/soc/ti/ti,iva.yaml    | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/iva.txt
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,iva.yaml

diff --git a/Documentation/devicetree/bindings/arm/omap/iva.txt b/Documentation/devicetree/bindings/arm/omap/iva.txt
deleted file mode 100644
index 6d6295171358..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/iva.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* TI - IVA (Imaging and Video Accelerator) subsystem
-
-The IVA contain various audio, video or imaging HW accelerator
-depending of the version.
-
-Required properties:
-- compatible : Should be:
-  - "ti,ivahd" for OMAP4
-  - "ti,iva2.2" for OMAP3
-  - "ti,iva2.1" for OMAP2430
-  - "ti,iva1" for OMAP2420
-- ti,hwmods: "iva"
-
-Examples:
-
-iva {
-    compatible = "ti,ivahd", "ti,iva";
-    ti,hwmods = "iva";
-};
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml b/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
new file mode 100644
index 000000000000..5724b8367a15
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,iva.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments IVA (Imaging and Video Accelerator)
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,iva1
+      - ti,iva2.1
+      - ti,iva2.2
+      - ti,ivahd
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the iva
+    $ref: /schemas/types.yaml#/definitions/string
+    const: iva
+
+required:
+  - compatible
+  - ti,hwmods
+
+additionalProperties: false
+
+examples:
+  - |
+    iva {
+        compatible = "ti,ivahd";
+        ti,hwmods = "iva";
+    };
-- 
2.43.0

