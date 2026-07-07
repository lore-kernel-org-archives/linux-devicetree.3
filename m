Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279751BC08F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 01:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783388766; cv=none; b=Sju389o3iGOBeGraywNGfwLsgCdidD0S7Ir9RNvODilZ2czujUKQ7QFDgopb7iCFfdpFDYGnoDfoG3/4RbqEbVfJVnOig7W+ybY/vqv4Q/cTFPD1h5u+7zVd2mNvVmXgIM3Ie343REDvBIgMmka7+nWd/IXQhvCS5+Y0tAkSFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783388766; c=relaxed/simple;
	bh=vgU8I3i5fbxFbPui0chOgO4hzLDJFniEdqgCRKD2a+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bxxn9CwSLFXFhpjnwQoMpOnbmb3alFjz/DrvgR9js265iv3yaqcXjZyPM0+nRL55GD0M1251mJyMx4vqJOfag2Ya8GqcOt11GwFd3GfLOfdv+wqnqi+MrB2T0EAmZ1p6dx2Kl2HQc2tZNEJky0OSXRwwTHpK6HDi+lcYnU1XSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4jsgsw7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4jsgsw7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845ea8924fdso4040120b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783388764; x=1783993564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0i+/j/bfcPk03DKuYUjCyKBjIDP+ErpyRxJSaeYrl4=;
        b=b4jsgsw7h7r0KtiseTN5H/mPMExscEjyMwn3Ob2DURB+MwixL99Pn/cugRiQRYJ8Pm
         FsbLlCTdn92VCZU+jUf74JLEetemMgxFe/Mk3eR1EOGCcY7PRgm4hclS4Yuh5B1eLN2F
         Cn00naFcfjMkgqk3mfKp46per8RnWEi18/eF42gka8eWQcd6aiX060DnHpPDYMhH5SbL
         SaxswauXOsWSouI4cycDZSKkgpEfJQclm1/pIee58sPTI7KFiU/sJoWzI3WxFwhB0b/K
         2m4VZ6/SiX3UXS+/IcBP0b92zYyvk36OK2IwZUdyzYE2713G6JE2F0FKDdkFWVtsvTyc
         s+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783388764; x=1783993564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0i+/j/bfcPk03DKuYUjCyKBjIDP+ErpyRxJSaeYrl4=;
        b=HbYbQHQsf1+QBA2a8e9QQZo+d8MgH78rJTzwt2x2sl8eyuH+UY5OTKtXGksHHpg5hO
         sEqU0vQDJMIu+EQmLNxNP7M1foMLCvQgIu0ndO1LRDjg81847xwKs6G0n1P04whb36E1
         CN9yr5qoIpAbzzJQWiUtgE1X/zYO+1x+UFstsHM0qLAy/wJD61NjKchGXsh9J1bMXUDp
         BbfRK9THZz3YlqOf467kCjbtkPRn3HQrG3BUZmvcStHGIHrB3EGxAsHtr9ROqReI/fPZ
         Ha1Mp1aySiZw96DnimztqjZwpD2a3oQ4Tjk0oHZxMqoQrABCMwPMs/KDhCTcR2R8SxKp
         MYeg==
X-Forwarded-Encrypted: i=1; AHgh+RqQJOvo7mxHTYmFqEtfIPAZi2i8GOhsVybzXJ9kshWk2h9YrE5UOt8wN7wu7e3NVaFoIZaRgxCPJXjy@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/dY69+B9qzl/jngPmdhH9FN3yQ3fYpm2MUz8l6vExiTit+fu
	tmAocY8/CCe9WxALew65XB2IruyyNpGsSGhHOeaufDaOtgz3MnFHJOVr
X-Gm-Gg: AfdE7cnJl/9rLm1ehm4XuG+muFtzKni3HGhLUlj2RPH8rDQufpG8rDZZ2bSX0ns9F4N
	a9lx01wYXdVvtmxJMOU/nx3bScoLSdHzn7Yio1ld4Knw0ste4flkNYEKxJY7kiHP/h56mYtbSgh
	NU1gkXhCe80E3wS5+balbZzR5zC4M+pf80ftfW40WBo7BqNroeedkrSez40gmo9xPbsOjXJwvH1
	lyN2bzKd8RSD610KZW0aSzf6Ivzzers2s2iDzkcp8hBnsNF1Zj5rzOk1c0DSOGkzGKXnA2jdf8B
	vnpTs/qosIncnU7oqQ1N8GoueppBLLPdNBO8vjkQgi/YPOpN6FAWFUFTFFVytqL7fiWe3o+CIzp
	KuCmIKYJ9hbpEpmEfNjjwSvS/9qurPMKQE6C6MkW6HYv/mUYjxulG5qhdKQp+eA0wcnxoeYKz1H
	wmaUSWKY2O9sahfA9xVjsU86UWX4+BbOAErlX/ntZz9X4lDHkE7G91hNXBpNPVAGJAaRMywtkcl
	jad56Jxs7VTjIhmHpLAvBROYRTK
X-Received: by 2002:a05:6a00:b83:b0:845:344f:ef1a with SMTP id d2e1a72fcca58-84826be9d43mr2994044b3a.15.1783388764346;
        Mon, 06 Jul 2026 18:46:04 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm4645653b3a.28.2026.07.06.18.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:46:03 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/5] dt-bindings: iio: add Open Sensor Fusion device
Date: Tue,  7 Jul 2026 10:45:21 +0900
Message-ID: <20260707014525.1015-2-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707014525.1015-1-kimjinseob88@gmail.com>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the generic Open Sensor Fusion host interface.

Open Sensor Fusion devices report capabilities and samples over an OSF
protocol stream. Sensor channels are discovered at runtime from
capability reports instead of being described individually in Device
Tree.

The protocol version is discovered at runtime from the OSF frame header.
OSF GREEN is a product identity, and OSF0 is a wire-format magic value,
so neither is used as the Linux compatible string.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../bindings/iio/opensensorfusion,osf.yaml    | 52 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml

diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
new file mode 100644
index 000000000..399839082
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/opensensorfusion,osf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Open Sensor Fusion Sensor Aggregation Hub
+
+maintainers:
+  - Jinseob Kim <kimjinseob88@gmail.com>
+
+description: |
+  This binding documents the generic Open Sensor Fusion host interface. Open
+  Sensor Fusion is a sensor aggregation hub. The hub exposes an OSF protocol
+  data stream over its host interface and reports capabilities and samples for
+  multiple sensor classes. The actual sensor channels are discovered at runtime
+  from OSF capability reports instead of describing them in Device Tree. The
+  protocol version is discovered at runtime.
+
+  Public project documentation is available at:
+
+    https://github.com/opensensorfusion
+
+  OSF0, protocol_major, and protocol_minor are wire-protocol details
+  exchanged in OSF frames.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: opensensorfusion,osf
+
+  vcc-supply:
+    description:
+      Regulator supplying power to the Open Sensor Fusion device.
+
+required:
+  - compatible
+  - vcc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        sensor {
+            compatible = "opensensorfusion,osf";
+            vcc-supply = <&vcc_sensor>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66a..88172d4a4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1237,6 +1237,8 @@ patternProperties:
     description: OpenPandora GmbH
   "^openrisc,.*":
     description: OpenRISC.io
+  "^opensensorfusion,.*":
+    description: Open Sensor Fusion
   "^openwrt,.*":
     description: OpenWrt
   "^option,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d7927..e4df9d8dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20011,6 +20011,12 @@ F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
 
+OPEN SENSOR FUSION
+M:	Jinseob Kim <kimjinseob88@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+K:	opensensorfusion
+
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 L:	netdev@vger.kernel.org
-- 
2.43.0

