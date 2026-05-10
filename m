Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BD388E72;
	Sun, 10 May 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778431532; cv=none; b=ask/m3y5UBQ4W59J5myg3C1hW8xlNYs5oCfVpAickYM+WWuWhAfTan2UIOM8hufpZkkQOkR+RbFjSitXSWw53t6evdw+pRasRNPjvzUWC5CpxdmEugCF6ABW8zVCvijssSSAkjMdat7Os/R2BGjuYXlvazyviVBlyqM4elufyHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778431532; c=relaxed/simple;
	bh=nr2PNmnoE55WAs+wO5a7ozSbaw9DnvmevSQ4RFVMUvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMa7TLJqMBxIKgZctwaBZw5D7xdKYG7kxZ996WnLv564C4zoPNf2dwfwd5gdRAiYwIZPOHiRXYIdXi+/6XbsItvG560A/iip8HN1/C6NNfX+L2H0yv7Pk72AjYoIhMPAL7Gu3wGhFCQl9lOTHd7rBYNsdrUfEZgBNXqwGGf0ARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/TqtAfw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/TqtAfw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FD39C2BCF7;
	Sun, 10 May 2026 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778431532;
	bh=nr2PNmnoE55WAs+wO5a7ozSbaw9DnvmevSQ4RFVMUvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V/TqtAfwYPtp6hyYBBznqHlWUTL0ZMLwuAh0GVRdD9GhS46Y9Hoy7beFN16JMN8Rr
	 rpQ7h558YRQmVJ91KQRi+wL9MbATmPmDuohhKB9Yv4M3I0UeRFGAdWLdZMn3aiMDDb
	 UcX/ftW9YjysQ4Opsw03keHZ1atRS4m47vOB0uHSNezd/Kj+LedNergrzsswaN13RT
	 tRpGhtpWHEiGLJEc7TpGiPT1sqcKKdSVHSRkpmCRHusFsx3VgoudpCNir+4Ck6abA2
	 0p35lA9YDsyx0x8+bJQWhzHZMnv3lUibYeKxHu1zHL+VaLD9na+789QFmmg8waJx57
	 rVFYqGP8313Ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D53BCD3427;
	Sun, 10 May 2026 16:45:32 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Sun, 10 May 2026 23:45:26 +0700
Subject: [PATCH 1/2] dt-bindings: regulator: add SGMicro SGM3804
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-sgm3804-v1-1-e5e8799e0aa0@gmail.com>
References: <20260510-sgm3804-v1-0-e5e8799e0aa0@gmail.com>
In-Reply-To: <20260510-sgm3804-v1-0-e5e8799e0aa0@gmail.com>
To: Philippe Simons <simons.philippe@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778431530; l=3403;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=XWCit0ZA8mWCGZuR1y+fa+IVWSjOU74cPNIGW9a/Ktg=;
 b=q+S2dD3+5X5wiS4eT8yx5WrFzrWAMjwfyP7tLlbhkN/NMfC15a/0lX3B7erDP9wzJsLsBfzJG
 Ozp7cAjPws9A7AaLohjX6+5Wqx02KVdZCtwcR2VTSzhH2YuQfljTisV
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

The SGMicro SGM3804 is an I2C-controlled positive and negative output
charge-pump regulator. It is commonly used to provide the AVDD and AVEE
supplies for display panels, and exposes two reset GPIOs to sequence the
positive and negative output rails independently.

Document the binding for the new compatible "sgmicro,sgm3804" so it can
be referenced by board device trees and the matching driver, and add a
MAINTAINERS entry covering both the binding and the upcoming driver.

Co-developed-by: Philippe Simons <simons.philippe@gmail.com>
Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 .../bindings/regulator/sgmicro,sgm3804.yaml        | 60 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml b/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
new file mode 100644
index 000000000000..f1de17bd5395
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/sgmicro,sgm3804.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SGMicro SGM3804 I2C charge-pump regulator
+
+maintainers:
+  - Alexandre Hamamdjian <azkali.limited@gmail.com>
+  - Philippe Simons <simons.philippe@gmail.com>
+
+description:
+  The SGM3804 is an I2C-controlled positive and negative output charge-pump
+  regulator typically used to provide the AVDD and AVEE supplies for display
+  panels. Two reset GPIOs are used to sequence the positive and negative
+  outputs independently.
+
+allOf:
+  - $ref: regulator.yaml#
+
+properties:
+  compatible:
+    const: sgmicro,sgm3804
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Reset/enable GPIOs for the positive (index 0) and, optionally, the
+      negative (index 1) output rails.
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@3e {
+            compatible = "sgmicro,sgm3804";
+            reg = <0x3e>;
+            reset-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>,
+                          <&tlmm 11 GPIO_ACTIVE_HIGH>;
+            regulator-name = "panel-avdd";
+            regulator-min-microvolt = <5000000>;
+            regulator-max-microvolt = <5000000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f877e5aaf2c7..394216175d2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24391,6 +24391,13 @@ M:	Steve Wahl <steve.wahl@hpe.com>
 S:	Maintained
 F:	drivers/misc/sgi-xp/
 
+SGMICRO SGM3804 REGULATOR DRIVER
+M:	Alexandre Hamamdjian <azkali.limited@gmail.com>
+M:	Philippe Simons <simons.philippe@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/regulator/sgmicro,sgm3804.yaml
+F:	drivers/regulator/sgm3804-regulator.c
+
 SHARED MEMORY COMMUNICATIONS (SMC) SOCKETS
 M:	D. Wythe <alibuda@linux.alibaba.com>
 M:	Dust Li <dust.li@linux.alibaba.com>

-- 
2.54.0


