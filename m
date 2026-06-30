Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253C5425CEF
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826171; cv=none; b=EWlkDbtaLwn2zng+Gn6Si/0iWaLPoevPJVdk+qdKOWnVRmXCm2J3PFERcALW6RCcPiDoDGGhTbz6lYR/sC1+pZwJD5201++aAgZ/Dli+7vSzeDf100LbTQ21DoSKpZFfe2p3uSiClAQsUBWTjr3m68R1z3iDSjrhpHolD9OrZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826171; c=relaxed/simple;
	bh=KvS9iboCv+JWrm9Ck/dGTtEkDnBtU38cR0QXS35kEhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVRTx/xXqI/+YXo2DSAyj7eK+tMjOcLnv9j7hrEtJO20Sde5ITsvAM8i8InAaV5mzA4jA4T8JccSM4MceY5w6xIfZyzKAiEQZ7c9gzUuvW7tV1MtbvX+GE+Q76BlBs6fXgu2YBIo0gx16xlbFRNUhCFrusopCw36NhPpKuJI/uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPtTNdEa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPtTNdEa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4939a809b24so29613755e9.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826168; x=1783430968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJoToAgBZ7GSul4H71JDZ8KBe0DXnlaCKvXioqaRVM0=;
        b=IPtTNdEaho71Qlw6i9yH+dJHqf1JZvFyuq43FykEs2mbJyp4wgQZqMAFkjW3azojTD
         kOxSm3iu+EThdPxXj62iPXu6DgcFI1qYRwIEqg5WVI3DId7ArW/OHM+oj/ZWn1waeyX3
         /nsAcO1dOXrL8CpcbvQrxB44rK+ud8xYZ+Nvlwoz6CzcYgInmRedxlUupjnPBzqLP1Hh
         8zo975b3yDKKWBtAO1cWvpoRUHFMO3jReRdkZEL0HuYtzaSz8Ap3ZGlpEuZc4OScJxT8
         kC3N/K76nF4UQS1c9Z1r0otxzbCS/LOnEr7fcvhXFwsq9Ig1WBnXWHMw6vbSF+lhgrKD
         k4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826168; x=1783430968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJoToAgBZ7GSul4H71JDZ8KBe0DXnlaCKvXioqaRVM0=;
        b=sFk7ccmYYEkA52z0K/vIae0JJ79bU+GrKIyVZlI8FaRqeLANyI+sGUSLSj5ADH4g6V
         FlGwemhNXGboE5QCQs7B/7B+4EvEIlxMeaw4PVFX8EDQB3+b3sTnwJ5lWjV7Tq5wro51
         6G8Zs/y/I+P6vkm93heSkSLTdmCjVeETuvT40foLtBU+s+XKgDgWi84V4GdsfTeOmtuG
         SyX8PxHbfQ1gVQIg9yedgyTgd4Q+HPxWFfMpMqivZ6RykFA3DDXV64oTL538jJ+7jTuq
         2CrPn5Pg3V99cqJEqGt7DYMe9oc1hNiN7r4abDKPQox7AfEsVKQMmFOElydivsGIJliX
         xjSg==
X-Forwarded-Encrypted: i=1; AFNElJ/gtcp/XfF7zFuXPZG74aExKGmGX8WKdJH9N/mvoRn7AHrXzEJqic+R5BnG47zHF3fw8jwvcsE6MsEH@vger.kernel.org
X-Gm-Message-State: AOJu0YzHdYoZwjU4CQZSz/OvPNwB98OCCIkrxTG4tdnRBA7KN4TFeSx/
	xQr5q4wfxen0eD9qJ0VEJoFnk74AkyqBz+9SIwDJ1Gz/lBZzNGR0mTq3
X-Gm-Gg: AfdE7cmggpQJIL0jnGjshf9+AZr09hUSjPK8YrA7bHtOBJOz2WCXBVC304aCL8ZUZHE
	b8GbEpJ6QAlhmr6tBp8KFyWZXkOl4HCFD1xrLkoWNI+OaTcpGo5d4j5f3ZO7nqgql+568tE8kTM
	UKI1j1w+pZEeK/8rf7eDs3HNrY25BqGJH0fXtlA7UIyNA1gD5n02Vlb6/nwURDgbmQ/B3ZAIOs/
	jD3rOVlLOcTlDeqEV0GvE3AB9FMHywUQiqHEtSv3jQLvs10m2oA5yYASZDCrNbONa82V2+X+Nd6
	UzJcchqJpfxnlFDUVRcjm1luC3LP/p0W9DGevls/eGMHnNl7+ecQVOh98uZlqf0LJbaeEkm9gqC
	dN234VKx5UTSGUCslVF6+sbIVtWUVdl0JRWQ1MZbOAEKHWS+RYmcrqsZtrds9gZ2o23azAfqdXw
	6zN8UPI7qAXBnoK1etNaHkXLStys7E71pmwYJJllID4uKREpnAAvGFPQ==
X-Received: by 2002:a05:600c:46ca:b0:493:bd71:6084 with SMTP id 5b1f17b1804b1-493bdab0243mr8820915e9.31.1782826168176;
        Tue, 30 Jun 2026 06:29:28 -0700 (PDT)
Received: from localhost.localdomain ([82.77.79.113])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47566743895sm7913706f8f.25.2026.06.30.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:29:27 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: arm: omap: Convert IVA to DT schema
Date: Tue, 30 Jun 2026 13:28:56 +0000
Message-ID: <20260630132857.3007019-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132857.3007019-1-egbostina@gmail.com>
References: <20260630132857.3007019-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments IVA bindings to DT schema.

During the conversion, several updates were made to reflect actual hardware
usage and resolve dtbs_check warnings:
 - Added a dsp sub node that references the new ti,omap3-c64.yaml
schema to support OMAP3 configurations where the DSP is defined as a
child of the IVA node.
 - Updated the compatible property to allow ti,ivahd as a standalone
string.
 - ti,hwmods has been made optional.
 - Added a second example to demonstrate the OMAP3 configuration
with the nested DSP node.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/arm/omap/iva.txt      | 19 -------
 .../devicetree/bindings/arm/omap/ti,iva.yaml  | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/iva.txt
 create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,iva.yaml

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
diff --git a/Documentation/devicetree/bindings/arm/omap/ti,iva.yaml b/Documentation/devicetree/bindings/arm/omap/ti,iva.yaml
new file mode 100644
index 000000000000..771415196235
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/ti,iva.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/omap/ti,iva.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments IVA (Imaging and Video Accelerator)
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ti,ivahd
+          - const: ti,iva
+      - enum:
+          - ti,iva1
+          - ti,iva2.1
+          - ti,iva2.2
+          - ti,ivahd
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the iva
+    $ref: /schemas/types.yaml#/definitions/string
+    const: iva
+
+  dsp:
+    type: object
+    $ref: /schemas/arm/omap/ti,omap3-c64.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    iva {
+        compatible = "ti,iva2.2";
+        ti,hwmods = "iva";
+        dsp {
+            compatible = "ti,omap3-c64";
+        };
+    };
+  - |
+    iva {
+        compatible = "ti,ivahd", "ti,iva";
+        ti,hwmods = "iva";
+    };
-- 
2.43.0

