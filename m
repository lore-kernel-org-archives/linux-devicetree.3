Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6F37418C
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184241; cv=none; b=Y/wlON+OxSnZ/TwP1BaR7En6ZsBtD1hM2qtH84FCgQ3kajv/1mc3YSncT0wnJ33VVn2B5uum0ykI4P3PXO4zOlPYDSAtx4odv3czY8RrnVg4c/gir2HkC6EWuABGX2WJmpbZCjJMNW4ZN7dEmCWa2NjChX48ONc7YdC6MkdDe34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184241; c=relaxed/simple;
	bh=g9L55NSZTjbF7DR8qLdBD/MseUaTAj2QqtyFJ7AK9Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbiIn6XZ7Xpuj6DG8cY8m6+TUt4g4zwx9p4Dp/RHNIxGLU7f8J0dj7HHkwvSmp45xc8/+My5P7Mq28udJqmCkGyLOWbY84ygMUQ2/S1dyoR5x0Kveu61I2gW2qZLvhSYO3KZHN7468Phn1iNl0nI5h1iecwg7esDlN/2R9UWgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coTZ3kc7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coTZ3kc7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so11944495e9.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184238; x=1791789038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6xKUj60fP5HlRPnblfOGOYjQo1YTnSgTpi29S2wERA=;
        b=coTZ3kc73YAlhxDe344hpUJXqQCSQ1ILhAUJv0Drevojrn2YnmnCt41e5tDObOAdCg
         jgaOJ7IWZx187cfqYrFjRVykfeDPJtX6Ijrjb725QB3m0DIFURyg9Xyeb4wbYNCNjos9
         HG7GEqK3+ShJamQXxeJiHTn1E0J1fZBjuRdtbaxGtZrPmNjTsU55WqyJMrGsgFrJXAcg
         iTpz/LwbOqCoP5TCpvC20vQ+raMKVn3YHwM9d459syQyQJyjQTkYhMz7dnrGgYdDmT9F
         dYlLrLrZMMeCBrS2skA7+VU0+c8zyfQjPLUfdb9+wkHDZakVW5u10y/uk+a/Uo7JzCCJ
         e/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184238; x=1791789038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6xKUj60fP5HlRPnblfOGOYjQo1YTnSgTpi29S2wERA=;
        b=x+Qfy2RWcj+iMsE8b4sY4uiF97h5XVhe36Xe6p/ptcXO+31Y3wLf0Fxt+yY0QLXz3r
         xx/beUi0qeU4ICqvoT7jHcGHguYqqy8hGsFBQFwalow3XBuManqzMq+bpezJxPHZJlAa
         RU2HPMdy5z2E+Nsn73K7TyXwBuiBR9hOpO6VjlULkGcg9n0E/YquvBDTEs6d89kDRm60
         9FHccqF81IYi4rtrHy0yC52e8Zu8uqdKzcHu3I2NuFocokBWAzuAwwWF7771UbRit64c
         HrpaT7/ypn+24fkHRSeI9Ip4nJbOrwOalz1pGAE2HjX20R/zeN+5lrmAw6qR9pC4g1J2
         ijJA==
X-Forwarded-Encrypted: i=1; AKwUvBxiNUePraxslpZBHfo0elDpPeolYlvI+1BDUiR1tAT5CMTqEmMecxkvJC3mzgi3P3mmXUPbzbCOqlJB@vger.kernel.org
X-Gm-Message-State: AFuF++n/Zix6wChIpRHtwVj+blh2RGlkxCuPSby3rElQg5SE7Y3UwJ6a
	qgRPuFSJ6mffx1klElVVdKSmDo1vRVyvAxdhn7snaO8ZX0pOwm6o2DL9
X-Gm-Gg: AYBFou1MzKCrcD9iPs09H9QlNkhWcIUZ6YQ0Ww4aaW79BKOBL8YQDUldXcD4bAfjuml
	nOVE13fQBGpmZjfgE6bCvYSImLN2yrxFz+Nkt7XdBWVe42q4tiyaen3OCz75X7nBpHtre/5kxvV
	30IqUqsxGlf9HQ4xBRZ+RhNVHSv2DvUtAGEBFIciPQbeTf1JPf4TE1O+rTCtesJHX1bEU+rpk7V
	C5XkW0lumewKZr37cZfvZaSgzf/IHtXDywqzrgkfUBmsITar5Qxr5MrAWS2w2RReLdbJ8CahSDn
	tO/b/Ufu890U3qHlz1s1pBufnn0ur1Y6dcCyZ0VZWdlV9sJkq/Oez+UIPEB+RdaWRpt108GfIWB
	03EpCAGKWbrP2m9AntWHJzWd/HFk5kFa7iW9uAPKbvbF4IJccE3JJeESW3NzXP6pjhKHZ1QC3ud
	MNlUQJHlmwgdgZwSoMUp9mjyCtqncvqggAdH5ugGRWdGeTbaT8tJj7f4wvF3M8wDPSYQTaEw4ej
	tDcvrDuGGB0YLzczYqB/1TSTGnk8lokJuNS8pWyqTXHzqc3a9FCJXQ8lFO645pK1D9Gl8W5oGnc
	qLA9vVqui9p+r16tcjbSbUMWcqmKV9rsBhWM
X-Received: by 2002:a05:600c:1c08:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1722ad405mr36499765e9.23.1791184237829;
        Mon, 05 Oct 2026 00:10:37 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm316749855e9.14.2026.10.05.00.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:10:37 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Mon,  5 Oct 2026 09:10:08 +0200
Message-ID: <20261005071010.7191-2-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005071010.7191-1-robertbozik@gmail.com>
References: <20261005071010.7191-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
and the standard SCCB command interface.

The sensor ships in laptops as an under-display camera, where it is
described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
the closest relative already in tree.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v4:
- No changes to the binding.

 .../bindings/media/i2c/ovti,ov32c4.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
new file mode 100644
index 000000000..804307cd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov32c4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV32C4 Image Sensor
+
+maintainers:
+  - Robert Bozik <robertbozik@gmail.com>
+
+description:
+  The OmniVision OV32C4 is a 32 megapixel RGBC (red, green, blue and clear)
+  CMOS image sensor in a 4-cell arrangement, with on-chip 4-cell fusion and
+  binning. It has a 6528x4896 active pixel array, a 4-lane MIPI CSI-2 D-PHY
+  transmitter and the standard SCCB command interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov32c4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Input clock (XVCLK).
+
+  avdd-supply: true
+
+  dovdd-supply: true
+
+  dvdd-supply: true
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad of the sensor.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
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
+        camera@36 {
+            compatible = "ovti,ov32c4";
+            reg = <0x36>;
+
+            clocks = <&ov32c4_clk>;
+            assigned-clocks = <&ov32c4_clk>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_2p8>;
+            dovdd-supply = <&vreg_1p8>;
+            dvdd-supply = <&vreg_1p1>;
+
+            reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
+
+            port {
+                ov32c4_ep: endpoint {
+                    remote-endpoint = <&csiphy0_ep>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

