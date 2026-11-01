Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520583;
	b=KoOPlT3tzWi61EMTgSIqJ9HLswAaQVLbkyfy9CfGzMwcSdgBbm0ACSyrftGyplG1s5c+
	 x0gruQaoTZsunlFYl2i5MrzFSMO6AnC1ANJYKvl4m/cSDUDqYkM0zGFDebyGBcs9uBq9R
	 ENo4CmIuYJed5NSg+ErrjY4rlWlQDHglu1OJBDlx8M/VfPxtyN1pB5AL/Q8/ddPFroUcr
	 fSg3r9RdABIhHIsyTgekZGsnkDHAA3WwgPzpb7QRzqIRa5id1CgYXDfISEkiud86J8yqs
	 ISIqet2xaj2/oRbgKBZkbaTR1ZTIzGHFs3E7AsBR3pSTrEfHVtznPZxZs7yWcbgZY2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
	b=auyS4OwxWDXuuqO45MK1lJb50EbQe2gwALJcncvKK2P86HIBbsQjugK+LKML/j/Gj60h
	 NMaLLO2AgW0/g2noXOT6feL60zZOqlvR94zzaqKmFP7dx5/i/b0Y8GDbEJfvu+wb7o0h8
	 rW1V6C9fns5B0LAGZkMvjrNAMLGDKF9wdlZFoK5Ps+GXVi0p2erxLoMArq9N92/QNW/Zl
	 9/f8pRlliULR0exwWKtC2+MW4v7qShmXM3D3o/Nqe8fii4XBqybvUTIU3rEUbVDr21OfY
	 ISOKMPglGXBT3rvcN7sWqJy8e/UrmFNxVxKGuYdiGqtViGQRyYtiN0xeY1kJ5gpnuhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp6k7NjO;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C550606A32F
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C550606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp6k7NjO
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a2551d7b5so4015258eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 01:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520582; x=1794125382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
        b=wp6k7NjO7CvhnB9nj/3d/3iVOtHiuOC7juvPoVeBZzvXJDmftA6/TLI4zWL8Dld//0
         wA8cHBigcXtZ4Kz4r1wdWExQsZhcveWPx2P71RdqfYdnMhnVmaNTTMgrXVV7LKRMhOJN
         XBneBxGqmDus+d7xflLQ2CiXhsg9Zey1hmbzT/0xxbNjgoYy28qLFtsXKnwo8PdhDKmk
         wDVtYqwgQIREWraLUSTzjnGyMOkuxDLZj1eV5JJuvgcinAtMjEuqkagKmu0sCNGXWGes
         CY0ezDue5rCO4+AHKFA+3Lea7B5ZxS/l7Qa7kpt5zK2J2MqlKuc2vjq/rsey1xb1/9/X
         taEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520582; x=1794125382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
        b=IpOLFH7hRloi/YkA8LuKwoq14Tan1I7UhJsEzKL4zda+MXfnbbJ9x47HMftp5Nvvqd
         UyoGjBNVHIPsLGGMLPSbLXnIXQJLjv0CA8gODbcXc3ck3LZfV7cDqoDHX/815Zq2qjM5
         JdH/1CsYDPYjgdlDRVYXMrioFunHupLRLLhiPQReykf1hfyBeYLcS8tKC+6riGOGIOYE
         32LZvbx9ItmSQhiP3zPSBthqP8AWoB4tSQEs/n2t2AXV1HU5cWbqsx+vIVvhaMleP6Yn
         Y2ZGN4FxPICQ2L78ShgmZb4EkogI2v4otMTmyOgfqVjyHBxvH/6g2YSV/XAN7z74Bkho
         +weQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFzGfV4/DedGPW5iJ2p9tdOEK+ZoHFGGeKumKTPvuk15tptASCyj8c9SoTPHrmf7C3wAwF3B+yM7UT@vger.kernel.org
X-Gm-Message-State: APuU4Z+8M4qaJnKhCz2k3uhnH5Vsr0XKOYDlwmuJYnHyq50cfHKyfptL
	THlgwUZQgWMHL8BRNGKAbmxbNvYqREj4IK1vavWOWfnFO6ssFT8c2Jfm
X-Gm-Gg: AYBFou3YtRE78zOSJ4jBxzIuQ5QyzZ6Unpm/9P6dDUD8+bK1DRrVPme5SI5rBVKDjlb
	IroHm/jw37oaxk18RnGETUJgP6/Sl88dFBsgKw+QeShPyAfwVWcFx+UtgO0p5flT9WMpy6wHNUp
	vsb5jqosgJhGsZa1N96CUADPqHmLR8J9bAfHB+KC/MKYQ7RIZJoFZgLPMG+VhQFvhvvxt6Pn6QZ
	DcOjEzmfR0UYMuOQ9cA08sEW+wAILn74YeLqpZ5C5ef4dpsq0lAAWmN6dT7BZmmkyDACMzh7PKw
	gToEaBHlbckR8OmTAinsJ0jQTLSJV+HHkbuvhEGBhH/nuTiq5jX5LqJE8vwxU8Nbt34sXDWhgfm
	DlChPcRLKBw2+ffJZqMaIt9HZsgwlkkmS852NVmwbf22jpxsvrWUtdj+zz3mgp04E1sK0Fni4jV
	+5Q7aL+QydPX47iUg4v2GolBoufq8N35viqbmG/ADxz/mqa50jnZwzPfcMbZR+ZXVOyxpBKYJHI
	8z3oXib+MlwW6XK9dmaQoEXdDPgD3xhaJCJ4owScF2jzs+pRVC2iUnUS6Du6nVH5IHvpeVA07S0
	1QH1V3mupuaIWxlWgG+jvmfA9YBudMyuVP67JsI9
X-Received: by 2002:a05:693c:6304:b0:36a:60f:3e9c with SMTP id 5a478bee46e88-36a420595aemr10215792eec.0.1793520582159;
        Sun, 01 Nov 2026 01:09:42 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:41 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: sound: add Everest ES7202
Date: Sun,  1 Nov 2026 16:09:25 +0800
Message-ID: <20261101080926.267041-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101080926.267041-1-jerrysteve1101@gmail.com>
References: <20261101080926.267041-1-jerrysteve1101@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
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
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0

