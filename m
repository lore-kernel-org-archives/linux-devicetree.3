Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0413D891F
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281407; cv=none; b=SfR5l8Pe6DQ6sLUU4V4odgmIm1iTIXFGxUsbROGIYzr58tqJoWVJYa3g3quqrkBhGka+bnpEsPYGZFk9M9D30w81dXYAqcV2FIpwVz+e3thv8q4aAvklJs/PAqTmKwBTCNC1GvW5J6H/YVplJ+vsLO9Fe0NVUZYlfhHg9gnpSVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281407; c=relaxed/simple;
	bh=Ms8KrmobsNmTMFpJ/93IDugaXmnB156D0bOZprPcjCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCaNJ1BNCEG3XeOLdzZ7xwwLh+v4Mba4AAFSgw9HDk15qbv3xz1p0PzZFK9Pn84UmAak56rFmsMhu2kfSW3SZwXCBuNFhkYxeSzE0nsskd0FWbJkrM3DNe30GZaCZZAxVPgdLdqTixLznyT4ZNs6wA4n7mPOJXYaSE7P7sHbiOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i27o4WWa; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i27o4WWa"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8819033dbadso297457b3a.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281405; x=1791886205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txtCljEVWe/u/jv1SP0sOmdyVcE1LpT4sX5ouMHqrXk=;
        b=i27o4WWa3tiBGgwrIiSTv1J8NuZDhYrPmdaH/ngo8BpaL9iEVyG0iJFRwUrcHzIfi/
         6fUEZ80uAavpzSovF01XflS2y00XCztZHaQ1YAQYZYw+HupD4VMOzRYnjsYj+06Aeuqd
         2w9eRoPYr88MpzGJNVm7l5dtnjhfcgKlqXIhOBSsfzqKd2mQ+apytejPzUKfCgDPC6o5
         nyCOYMHHlAllhqqenxjELmDg0EDesH5hyoLaDcUZ75u5m/AdIKqKinmKdefSZdgUr1xC
         LgA5UCV3ElLygK1WAXhMSZorssDGxxP/f9zufltKRPKvdvXNPE8M+98++BYRO92ny+qC
         kiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281405; x=1791886205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=txtCljEVWe/u/jv1SP0sOmdyVcE1LpT4sX5ouMHqrXk=;
        b=2C5hqYpaym5liIqnoznDapIpkF3xMIxV6dXInguAKRVOX+X9oc4WupVnyrxs3UING3
         gXgiqEhcKUb+3Lk+UGibKo+9DpawhIyr4JAYigqvKJjVpixZHzOPl2FrMjfzvOQz1rPG
         Gnc7E5AMvV6yVAQJXLaJoCrXmvPlDF/tzdzghSkN9TXVL1OM9VLOHHNMTLkS3gOr8x5d
         x3PJcJPVZ6yI5UREExBsoMrreoleBFwTy9ac0+jRjMaRd6vNO+OCsFlJdfYRW06+bf/k
         kcdxEBbnPvlNfiQChwnaTo7dbEdc/nKhiePkZxIrR8ibx7XudmaCGjIQc6cHkG1z180R
         HBhw==
X-Forwarded-Encrypted: i=1; AKwUvBxhyeOLV56uei/7LwXe9ryELbzBiRAHfPY5JoRvnOlsLFGz6H8eBpib6P+JP8eTCcbpJelKK3upIWpI@vger.kernel.org
X-Gm-Message-State: AFuF++n9VWUkuaJ2DaIyrNVA8JRx1fjUCq4xJ5HW7fZCF6khu/TBG1pM
	jU8Kn8HqOMVcZcvTE+lyPm+kjBX9ljx/i7HRz0KbgKa2DXOM8qv36c/l
X-Gm-Gg: AYBFou2tPT8C8yFKWsrMtvE4YwX1CAC+WQg3JrxnkybxO6G7FRuiBvBZGT+wSAlqN0c
	tqdKPXz0cbeDARGrl5S2WUUtnKAvtVT+/+McEOUDI5ToJec/MGiI8E2L7mDMlWgCNMKuDkKlhYr
	OzFf8cNhIpzK+q21uYPhok57XxoAw+0rz6SMA+anST92V+9rxtNIXiB/G1NX4JsITh8xDTcfk4k
	CBIOlhMGHSW4NlpLSz3Pux38GSjB3WqNn2YxzIYPBrG0WcYNTKOPd26pQTCg8TrA5rwzw0yS1ox
	gFludNuZt6v84UB6/USIs7oUvYqCj24T71lIwwqC5XcPsJMvT2DdBBNM1vfLw/mgHQl74KV0e76
	GEgHEEOwrTxiN9/+QdHf4qMptLaMFwsK2rpRczB8Sk1VxW6yApjLWchJVOgPq/0oHcSNxAj6xOT
	TbT3JneOyzmq1ANAxr4BnQSgfdOrhK3sUPLCW8XQZRiGcoNOuo1FPeE9OqCsb7E11d6Sy5RIIoz
	1iAoW9F118QVOcX0Lg=
X-Received: by 2002:a05:6a00:3004:b0:880:ec27:9826 with SMTP id d2e1a72fcca58-890dbc81240mr825118b3a.2.1791281405512;
        Tue, 06 Oct 2026 03:10:05 -0700 (PDT)
Received: from l (ec2-56-155-114-54.ap-northeast-3.compute.amazonaws.com. [56.155.114.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f7198sm4592961b3a.9.2026.10.06.03.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:10:05 -0700 (PDT)
From: Liu Yufei <lyf98405@gmail.com>
X-Google-Original-From: Liu Yufei <lyf98405@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Yufei <lyf98405@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: proximity: Add Vishay VCNL36829
Date: Tue,  6 Oct 2026 18:09:42 +0800
Message-ID: <20261006100943.78971-2-lyf98405@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006100943.78971-1-lyf98405@gmail.com>
References: <20261006100943.78971-1-lyf98405@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liu Yufei <lyf98405@gmail.com>

Add devicetree binding for the Vishay VCNL36829 proximity sensor.

The VCNL36829 is a proximity sensor with an integrated VCSEL emitter
in a small package. It is controlled over I2C and has an interrupt
output. It is powered by two supplies, vdd and vddio.

Signed-off-by: Liu Yufei <lyf98405@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
- Collect Reviewed-by from Krzysztof.

 .../iio/proximity/vishay,vcnl36829.yaml       | 55 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml b/Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
new file mode 100644
index 000000000..6f20537ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/vishay,vcnl36829.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VISHAY VCNL36829 Proximity Sensor
+
+maintainers:
+  - Liu Yufei <lyf98405@gmail.com>
+
+description: |
+  Proximity sensor with VCSEL in an ultra thin small package with I2C
+  interface.
+  Datasheet: https://www.vishay.com/docs/80580/vcnl36829um.pdf
+
+properties:
+  compatible:
+    const: vishay,vcnl36829
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  vddio-supply: true
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        proximity@60 {
+            compatible = "vishay,vcnl36829";
+            reg = <0x60>;
+            vdd-supply = <&vdd_reg>;
+            vddio-supply = <&vddio_reg>;
+            interrupt-parent = <&gpio>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f82..e6ef84b49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28754,6 +28754,11 @@ S:	Maintained
 F:	drivers/input/serio/userio.c
 F:	include/uapi/linux/userio.h
 
+VISHAY VCNL36829 PROXIMITY SENSOR DRIVER
+M:	Liu Yufei <lyf98405@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
+
 VISHAY VEML3235 AMBIENT LIGHT SENSOR DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 S:	Maintained
-- 
2.53.0

