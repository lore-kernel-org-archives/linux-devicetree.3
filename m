Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513598;
	b=4umPghCI7MBa5YMWea977+YZZHN+UMHjGTjIGIrh3xjSPFaV/HIBunnMmNX6xzfQKBRs
	 dMug8PTKoUURIi7lTe3dtQBSzMAy2qkMCSS+UuYJlANQC9a7RI9RdFAyUH1EVmzwdDFDb
	 q+o/j/4IVHSJraKrw+/tQp2EvFbX2CnS/PaZRGVssUsJfu3MPHMoL+hnUuEDW8347EtIQ
	 v0DS+X1d6GUeq1HDs0Rt+UObFg/xFvUohPDM6WSCs1Sf3r/VC6BlwsNlSdUpRkvbSOoAD
	 9I8K6NXdqWQdEiAZCfdzYC5gTVHuBgnmIco/UXJRCdwfa7l5shASPofyxl58s0v9NBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
	b=mizEsyaJHW9zSbY3+kht1PtHY1HcYoVcIg9IIk3yS7XdBy8FcB5zmUx662hydCmrEVm0
	 MP3GHRNF3dc94xTGOpsjBJlCxrMpGvBCZsXRuO9/+055nLrYY+rFz8SdrblTJ5BXQc7bK
	 3QqYhRXk3zBJcuN7XZ1n6JUnH2dKRNzHaYU1azq7d4jKI2oxZKSDXFZLQh5F1/rKdJn0B
	 N9ziHGGCIcEL6tN20I0sZLV1BGEewDajfIyb1xt45EP6XLCAvXPU/jcVxWQ3rUzun07z1
	 9DmhGFOrU+cUOOKG67wiAprLUWjOtmrb5d3IPYpVQe+dL5fmK5ZlSgJaTbWHKjTkMYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F2DuapRP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1664606CC0B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1664606CC0B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F2DuapRP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso33620695e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513595; x=1796118395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=F2DuapRPmyZprQaMWa13/95lcAo7egtMQxaK0A97dc36K/UbriXjpI4WRcY04/rH+h
         oQhbZmVPs2FSjZbGBvJ9uh0X7+yZ/+97EcWMSiN6KppPDEcBiONtkTrCS8POowkV7Cg2
         CfosKbONOI5Fk0Eo+pRsFWSgNZqA6ugDOfOmrOBUWKpOCLBWaC6ZQH67Lcejb4XbsSid
         MdQ3Ks/BDgtJHKmUIKfl595k9N7kw+dmBigAhMPu4YI/A6a3JMTFvcsoRbGf1S0CaHgu
         J4a/1uVx5Ru36M5vSSfHS5r2nZgqLkbUDvmPu3P9Cyfr9d4s/LhIyLyE68iUsS5wvQjD
         uMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513595; x=1796118395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBF+matHGBGE6Nr1Fd/2Ogm4SDKpAbX6dyL5PCX4Igk=;
        b=nTjxYi7rChJr3ecvJLnv1iBdgDSb+Dj17PXx+gpqKGd7DCVeTxQXPKKktjzN4LPKw+
         raLcgJwTJh4BJVjXhMAeX5mPEJIq1icCPhPKXsaYlrcH6FMzIT1vkVrfEWItlnbHxm4p
         tBo/Bnq95X5nl0ALkPMymy2yiK1CwEo9q7g74Vj8rBqCP3ilwi7Ar4gWDQ3DeXwp+Qbj
         kVEmyUBmWGW4+bjAwjjS1cIqA8hYiCPD4WZIzapTkVw3Z+mUZ85Sj+sJsRl5ZehjpxgV
         5XbgWNOEdfmSYaG15c5lrkVJXBm2wYuqgpjm+SprTnDGZpRTDxmT6HxHKowAZk5mY01Y
         glIQ==
X-Forwarded-Encrypted: i=1; AL+hErFUzdMrg1sLESp2W4dvPTNvOmEal0LUJV7ITLSOo+Ogc+vzqHFgVQPTvqTqAfc0yxQ19h5W4j1Q7ipA@vger.kernel.org
X-Gm-Message-State: APuU4Z9duYArBLeuLKqV/nXH+KzqeITd9X4mdIg1fqjJsw5ov2Qob8xA
	BweaFfJQHzFqCcekIFW0aIa7/2p3zhUu9TAuziezOR+zwwuHj635goEz0/BQ4U2k77g=
X-Gm-Gg: AZFdTZehMbaO1KAfeW+OYjDfHJTyJ5//Yd424gA915dTNAYg7eYPcBIeTyk1eEtboa3
	gFoPgFJXO8AHy6DwgGQqGZO9WSHsQrVuHADaHbrAuArjDTpN4Uw0v2DzpmtDUrWh+HQ1304b15y
	4zL/KiKbyqHPqphEkvi25mWPmSUtdK9dud+5B+0bLKVEL4hg+tSI0P0gfMrqNMZzYAwfL/eQZFK
	D6B2n4SadvicKWdLDXOfNN//Kuy5IcqS/GNIHDJidUp9qN4o3idvudjcz95YmLyuOwoNi4fhC6W
	ICvR7fDdz6Nu+yfjJ6kxsAH8hXYEOfui3+569pcYBLQA2pg79GSs11Zrj47Ntoy3br/LOqiFjuo
	Hecdn9K4Y9EbQ7YKqKZ7AwJyRJZ38qbkdC2v4P0am83f9jdsJucQTVLbxHK3vUXd2hoQkmO3etz
	wlJUOgsf+39wxSLmpkV4T0W7bPm4KrlUuZj1SbB/3HlYxJahYpFNpFpamjcVg+ekkT5Nnmdi6tt
	XDeXA6qXqpC1qQdMXDFk9CPLIOZD7esxY/EE6rXWL81gusIDiYH6I531e758+Z0py42WWayXgks
	kfRzo42VrJuaaToGXMxmCUzEECovz0HD46CZAMcGbOKWguFO6d6TwlO44lQs1ussG1BKiyJdK0t
	Atc7fvxlQxD5xi2omfLRurUka5EQ1pvRw
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr277657935e9.32.1795513595111;
        Tue, 24 Nov 2026 01:46:35 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:34 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
Date: Tue, 24 Nov 2026 10:46:29 +0100
Message-ID: <20261124094632.8879-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124094632.8879-1-gerard@teslabs.com>
References: <20261124094632.8879-1-gerard@teslabs.com>
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

The MMC5603NJ and MMC5633NJL are listed in trivial-devices.yaml, which
allows no properties besides the register address and interrupts.
Boards need to describe how the sensor is oriented, and the supply it
runs from, which is often switched on wearables.

Give them a binding of their own, covering both the I2C and I3C
connections of the MMC5633NJL.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 2 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml
new file mode 100644
index 000000000000..423b8ecbb9e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/memsic,mmc5633.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MEMSIC MMC5603 and MMC5633 3-axis magnetic sensors
+
+maintainers:
+  - Gerard Marull-Paretas <gerard@teslabs.com>
+
+description:
+  The MMC5603NJ is connected over I2C, the MMC5633NJL over I2C or I3C.
+
+properties:
+  compatible:
+    enum:
+      - memsic,mmc5603
+      - memsic,mmc5633
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  mount-matrix:
+    description: An optional 3x3 mounting rotation matrix.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@30 {
+            compatible = "memsic,mmc5603";
+            reg = <0x30>;
+            vdd-supply = <&vdd_1v8>;
+            mount-matrix = "-1", "0", "0",
+                           "0", "1", "0",
+                           "0", "0", "-1";
+        };
+    };
+
+  - |
+    i3c {
+        #address-cells = <3>;
+        #size-cells = <0>;
+
+        magnetometer@30,4a20000f000 {
+            compatible = "memsic,mmc5633";
+            reg = <0x30 0x4a2 0xf000>;
+            vdd-supply = <&vdd_1v8>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..523c205c0880 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -261,10 +261,6 @@ properties:
           - meas,tsys01
             # MEMSIC magnetometer
           - memsic,mmc35240
-            # MEMSIC 3-axis magnetometer
-          - memsic,mmc5603
-            # MEMSIC 3-axis magnetometer (Support I3C HDR)
-          - memsic,mmc5633
             # MEMSIC 3-axis accelerometer
           - memsic,mxc4005
             # MEMSIC 2-axis 8-bit digital accelerometer
-- 
2.45.2

