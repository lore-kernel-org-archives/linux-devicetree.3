Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432114;
	b=2fs39tp7DnHnBHAS5Z4VgZqut6ZLJcLOxQF56HmuWXMBYZSbC9UCAH9sRZUIdg0cG4vT
	 Lj6yNGK3qL4B412Tp564W1Oac8TT242p/0p1yz2QUosBgldX+iS+xl8DGgz5wnJCmKSR4
	 341lf16Uj6omMtVjaZG2FtLFqJS2ncIUUkIzwFSiNdbE4o45689TtCsjF8y6bjkfgUySD
	 8jfoGMDvsRiWAW4HXggqRaYVcqKx/IKaSMA2AMI7gcFMKGwAIonU62924uD6yviyJ2bEu
	 Xd8GF8RmzJIYfRQiTlehssUrTedGy5yHmHsjl+DLmFyfwj3G7K7j+Yagi3ZelXbq4tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=hQwYOAFtnFXGR2xhLfrHhbxyney7LOosWoT5stDEkcJ45gLWNf7B6gfotN1yRkXovdiA
	 vkrq3A53DUiK+GJ92x7JF5XR/0N5mNtEe5lnc1Hotx8rUWIyUtjL3y6kTcDKiyHPmZ0hi
	 KxWe0NSeZ0ye1YjJ7r0At+wl1ZoFjkcV/7hNHUXXOuLuq7sLHnAj4KChBfx0TUrliEaOU
	 JZmu0CjuBR+eaaR8zY1ACE6QxQ7Y3jP3NK7clW1z/rnZFFYcu5mWF9lGZ/3of9LEoPkec
	 IKIa4YUiNZvw+DBYGk4Tm2ZTGwiAYA28u+s6RoeIRnBGreLyrWQaBpzdmwhpOnkCSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F07606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F07606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so4401595c88.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432113; x=1796036913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=kdMpA+3XEIpWJhRS0Cf/pmEdcgIkOQFvMDyFXDhVHlrltr7setMvk12Eq5Fw/oUozO
         ARismXyoNbCSoI01ed6CtEwAy9cYw+tXXBPhv/0+Fr6Tu5sxBskpG7CN5/+XS2alDltZ
         sNDYUqnOc5ZXU1EAOUmUooKZgc/OKtZSTGBDRgWf26KYnmIgGVrvbP2lT/n/n5iWEqIH
         c/nmBEfIw0e1dCac2inrtRLqu5kewWHzHfWn1euJZedgvxfVLOcNnrGHCzc5Geo2LAmX
         vCzjk9trv0j8wKgVzqsSU99Zvzy0q/AR0s6oDGOiFiC86Hzw8Qr6VQDdaZmegnZT1hgm
         xVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432113; x=1796036913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=AG/dckNsK8Od3WpaEBqum/wmnwKblOH1SM2R5/sqiNY22qdrpse+7IMp778OhhOX4h
         yYxKAqnO+FU2NGcaisepD+ZjjQg107YBPKlPq/kQnvrSa8WHhTb56z88M/kmPFPZuPZv
         W5howuenVKhLP5gxnb5O5+66/yjq82S0jNVSsceeQCNTB4dYENvmICXqpnSoiCl7IadK
         PAeapoHkWF4Dw2kGHvdP8Fhei62WDZxCfTbN1TyLJl/wFggVnbNlRpBSilNEae4zGJ9e
         dynYw4EoQ3nUUqO/RhyvItzTmuyXmcRiRv2Zv6xgOYTLhrjgtX/R5Jx4kvhnY//srHdf
         W8UA==
X-Forwarded-Encrypted: i=1; AL+hErEU9vqlKIQEv4z+8Iz4kJ2Lk5VHE7pfTIB78FwuLYqTRPK0ArvpUeC/4iAbkEq939l5DK+x+4fGGvnP@vger.kernel.org
X-Gm-Message-State: APuU4Z8RhBu1mwWl0IOrXOMGZumA+i7QmYnPrtiq0x3ki7c/FwMVQ/TO
	nqigaQeOwiqI2a+xwRVIFfjWLfGpMyzoMKHsyCSOsjBoo7a/WjCkOjn1
X-Gm-Gg: AZFdTZcjlCn23NEsJ65f7OwpS+mI6cjhl0xnjV2IGx3QHGV+BLowfig3fQOtBbfSDj3
	P8oszcTS9sn3ch524K7/cKtBsrdc/Yxr5FUAXxSzLNkW8CXO9ZWfGm8z496n4XzTN8YYL30Yn46
	fc3KY48Ca547mcPlsAk+MwnRr27/wAgjPjn1yycAgws93B1GRnHaBxR4nPeEP3j6R02AGjCLFhz
	ArHpQPbpRwQZyMOn7/+GDXBlNcvPHtfEqYiH4DQgNi6DCnsIEg6waPkjoOTnDCZUpayS1UlZqme
	cvINNgJmKgLthZNNqFszqBrmWRiFlhsX7ziBpOurN/2+j6fLth5+TkiU0c9ybNPSZE3Py8ilwXF
	rxIfGUKcqu4UFbViE5FmNa1HZg2nGJnV6FWotbqwO9fxSxSVqxaFM09TCBjlcq97tdmloxviEvN
	G+zwNV1k7OTju5HlMeOLBfWxhiWQFLHGg40mNBzCq8+Dw4tIDnXPE3f/oN2+CUwTMZcGcociPSf
	e7kSl1woFwLSGdF0qsc8n/qu9SnCvI3ZGPLswVZxBEEHZvtHOI+123/Ns77hTRz0dLN3nDcLh36
	7Mu38VVmVlk+Xu2jmjCh01BCl+feRrHgezlflTOWqGmxEg==
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr12384482c88.10.1795432113393;
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/6] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 18:08:01 +0700
Message-ID: <20261123110805.119610-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI
CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..0e440209c3fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 0
+              - const: 1
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
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
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

