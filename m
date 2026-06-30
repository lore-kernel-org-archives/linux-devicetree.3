Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE3F423170
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826169; cv=none; b=cP5GcQcqvfqXV0FM4a9MI3WKepyR3OtkiKlCT5LdHAfOyo1qGjKYLmsPSqECkhn0LJSb5ZifTPFR5KU2SUaAB0DBkzKGq9zRWNiWAqpHTH/7/QRGifn6M1vGVDWMTJ8aXllh78y38tT3YCIVfYG1DwOKzeUNQ3Lh75zVZt4KKY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826169; c=relaxed/simple;
	bh=yJKKAp0IZV2IaTJLKLtL/5EpaRt3Oqa1W+87LFyDchY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2E8ZO76p+Hbp3WsLo+1KGWalaZYs8yaxgyIBBoT/+kEKz8oN2kn6Ib3n2/d27/knfRAd+phlhYZkIrC/sdR6a8RKoblQSZWOi7YigRHrt86dzLuCPvUkT9qhjBtH6xGlVvtLjAN9InAumu0H2IOlGpXL/53ZGI/5NDP+/8aG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3Zs6FFS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3Zs6FFS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1911222f8f.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826166; x=1783430966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VljvdQ24/oWfzqGFPiPfyikBl5rGGb5GdJIRz+ybmUk=;
        b=K3Zs6FFSBQhzc9cet6VlC/Gde6740qx0Qslkq/d77Y6r0vgiZWheBNGB3hbrjiIIlN
         i8fOJquTRZr6l26GAN5YuJeLEq2UL9sqFYp9afPAoRPkNVrQHJJo19srZzLW5LoQhHIk
         tOa2nObIKllRYZcvvFZjUAwSIfxsIWDSVPG9n4qk50SLmyljQInSxbbn4vnO/zMVv7Hy
         sRf2yrQg6ZEaCCuuYgY4fIXcc2ZB7Eyekf67fiiEMym/NnWHxDMy5l1QGbmsYqABl6mm
         Z0LCXE4Ff1wc0jUk1CpGCCdnRwmqWjnRoMCA32+s68GdYZ/Zfy4gqckTgP9TeE3E4Ue9
         aFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826166; x=1783430966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VljvdQ24/oWfzqGFPiPfyikBl5rGGb5GdJIRz+ybmUk=;
        b=SZ4gCVIy/ogLeg6g814sSHRXdGwG5l5XHIH75EifkeNKbXVBllFJ6vaVac5VUXSFiK
         BkAOZ1kAaTgh7tXfNjG1Kn0rmYx20ywNIhl+E9a7KThzw68GG1I3lfaODfHJhUSU8cPh
         8DMkFv9Ip1gnuh8cLYQstNZWLY6+1Nr3uUJlFbsRNEqdQ3SrytZE8oBJAO9UAGwtyOcj
         ZzXNbkwX3TC3mt/SeHZsvoh/Bl678IxkHoOS9lCTyQCmNQwoqpvX6R7Q+rJcyZ4l3xRb
         OmUym4LKQo9KKsdZL9OY/19iay+S8xQoszfAqMwBwLttHG74I+41Q5pODoGriYcqG4lN
         gCzg==
X-Forwarded-Encrypted: i=1; AHgh+RqRg1bZ5A5zYjE/+560rmPTRH5k+TdJOMr0UwjL/25ROiz+Iyb7W8XLTp6WumbdzeYbBfy51gqA/Xgs@vger.kernel.org
X-Gm-Message-State: AOJu0YzI5hp4DX5jPtd0jpJwLEJSneUJ2OcAQ0SjJEnMqoLE77v6PaM7
	hGCRoPHGbRQo95P5WKs4ycPeY8FBbg5LJGPGbkOLg7Rm+QnrSDtV1EkG
X-Gm-Gg: AfdE7ckcgONlohUDa+ao6trtjd7BEJpHEVXAuMfqBPbj03cRpej2M0zTt/jo6NdHubW
	j2GpeoOE3GagcfHCHjmSUj4ofCFOZFX7/0XDnHf2LJZUfiUDkzZsGmq8rLPbQ63PeRQH3lTI+TY
	kkyBrBx/ytKvaiBtnphDw5VwGB3xh3kzuETmfS2eGr9JK91iWagxm9BRRQN7s78rIaTz5WggoSr
	ZKFZMkY37sauaeZlPNs4CihAuSADoN/S/X7F58bQWVUfDNmcASqv8pjXOV0J4GlsxboQ+HPPnNp
	4V1PMFEywX/yQ75+TafhvRGDUT4UBEMz5iT4vETP4uieTOUk2THsbePwvVfCAMYjIQXcSgIABSx
	JA0n0G6lmxg6vJvZm9DG9UlbDBFfG/hGiSZGjUNhJhW9L6J14PZFaroIIaXHkvCw5yKOUtCARL1
	HB9JMgRZC8WpO7Cxy32Em2DNWcGQ2eJxiAwIZ2QOjMTAWNsBuxCOiD3g==
X-Received: by 2002:adf:e74f:0:b0:474:530:9d with SMTP id ffacd0b85a97d-476586d02aamr788709f8f.13.1782826166034;
        Tue, 30 Jun 2026 06:29:26 -0700 (PDT)
Received: from localhost.localdomain ([82.77.79.113])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47566743895sm7913706f8f.25.2026.06.30.06.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:29:25 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: arm: omap: Convert DSP to DT schema
Date: Tue, 30 Jun 2026 13:28:55 +0000
Message-ID: <20260630132857.3007019-2-egbostina@gmail.com>
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

Convert the Texas Instruments DSP bindings to DT schema.

During the conversion, ti,hwmods has been made optional.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/arm/omap/dsp.txt      | 14 --------
 .../bindings/arm/omap/ti,omap3-c64.yaml       | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/dsp.txt
 create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap3-c64.yaml

diff --git a/Documentation/devicetree/bindings/arm/omap/dsp.txt b/Documentation/devicetree/bindings/arm/omap/dsp.txt
deleted file mode 100644
index d3830a32ce08..000000000000
--- a/Documentation/devicetree/bindings/arm/omap/dsp.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* TI - DSP (Digital Signal Processor)
-
-TI DSP included in OMAP SoC
-
-Required properties:
-- compatible : Should be "ti,omap3-c64" for OMAP3 & 4
-- ti,hwmods: "dsp"
-
-Examples:
-
-dsp {
-    compatible = "ti,omap3-c64";
-    ti,hwmods = "dsp";
-};
diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap3-c64.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap3-c64.yaml
new file mode 100644
index 000000000000..72429749ebf4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/omap/ti,omap3-c64.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/omap/ti,omap3-c64.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DSP (Digital Signal Processor)
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: ti,omap3-c64
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the dsp
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+      - const: dsp
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    dsp {
+        compatible = "ti,omap3-c64";
+        ti,hwmods = "dsp";
+    };
-- 
2.43.0

