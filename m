Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319224;
	b=AHbmQ6Pz+Wl6s5JxgyQKdWQSSExIYRG+IXvnP6LNfT0ymf3+8BSGGV7D7panPWil84X2
	 Xu6vhPhdktyd8I5tIoKn3RTuuuhzNtEVXlUgGw31iBABD/z+5VYfqjHB6H9oiYhFwCze1
	 FEaSPBGpcEyPMftOoDLVLpyVmsQ1n0YJRIIxI1mrio+m8oipibjyHFXU05k5+KdWh5BD3
	 CrOO5IQpOd7+kdExyHPzbw6k0ii3N9pBi9MREhAIh0QhcLXc6q9Qmiwxwm2x4bSvFKjYv
	 IVuNJC+V0ODaHwoBcmvIuCnn9QuASvbN2YoE0tCv0cRePThLEuP4U0L/+iyQyAXiLpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xgEf59wW516NgPmfsLZmDRO6dAOrXpUhyDeSMZa7qDQ=;
	b=G05j/WDLJQZ3nXAz/a72XHIotzKoGz2TcADQpjZdaEKJysprPVqgxwXJP/UEGFmknTvH
	 Uyt4Q4iZ5bd6UdDqQKVkEqm1NKLjBCQSVchUsnz3oc7Bc9GGASZrJf/qey1epv/Wf6gQx
	 YCohoYaqBHC9FdCaIYZaqrnT0FMHkkbZIqTCcX1bdJHwJSb6xrkJq9zKPJuJTUCW4ivEg
	 DAYs+D+KkFKdXXy64C3m7S8vPb+qidLTsVeXzQdjXQqyHlKzjE9s1Z/LM5j+2545wED8j
	 /2E/BeP1JVhSJi0hmNUdoqKxRV3zHi5EIrh/K5xsrrJHbeD5wsyIsGENJfBdIeIg4EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7+KuGat;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC59606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 03:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC59606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7+KuGat
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1230632a91.2
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 19:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795319223; x=1795924023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgEf59wW516NgPmfsLZmDRO6dAOrXpUhyDeSMZa7qDQ=;
        b=U7+KuGatBQ2Ti1dwmiNQUpfbYWGVoNkgEVdpVGe6L+kgG+4Zi3VJSNV3NxUT2flsft
         KO12/u6c/lL05p2Hbc8T4nM1fzopwOtQTYh2NocLitrRCRZjlo/hY8Ph4YcluFv2VDbI
         Eba0eyvkGvU9NRPEFhzB2Y6uEmWkyoR7zkv6qH0t067qBdvZaccc/A4wvnAXCteuRPCf
         8JVCm1Io7/M/HZU9g2CWRkvPsc9q1tzyIEzLRhGgqDR2P7hkFyyu7CFOIl/IUPw+fQaH
         POh3e72ZrCI/YYu3f8i36SJVKeTnwVIZx+BgR07EiIWqpJmcoGAm9P82+Fvq2trx/gde
         Nzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795319223; x=1795924023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgEf59wW516NgPmfsLZmDRO6dAOrXpUhyDeSMZa7qDQ=;
        b=Zib5Qcl7RVX0/4oP7xSmfeZbLaS+CGFXMSJ6yGq5GxNgHD+GM4uoWb3hDcCXoF46zd
         dxaOVx5l81//XNvPmYhWYlRYUOSGcuAEs8poopxyFd73vZsI6fqellzbaTEFUgO0HG63
         f1/QuhhtRjNmn0dRiwGUOHSo9Axww8kr4ps92wZRyZLs3lxWBbKVljW69Hr6ZMFRB+E+
         CjNWC3uw1gojL4myGLX8rt4L2kYBm2rOfU7wHt1Os9zd6kZyoMKzFngltjICy885gri8
         y4Gd4U26clnXKvA32APOGDZ1rh7u21Hg+JqyY0nKWnlqQtAF9vZ+WHmHRWzdkooYa6Uv
         FE3A==
X-Forwarded-Encrypted: i=1; AL+hErHJZ9XSn7CzfVOiInEa/t55S8FR/46uCXhQbbMWiF/NxymLY5ZivpV64sv9fASrfX7zCK1YR90KFRfP@vger.kernel.org
X-Gm-Message-State: APuU4Z/OVQCGYZha+QkC94SMygNA7JAXRjIjBLZ/jbtX+Kq/xSd0WTfk
	mVBeZDA2EwqxuWyajf0k6KXZIFvm+3pyYrPkcLiIucqZWim3khVGL01o
X-Gm-Gg: AZFdTZdCv/7/2BOmuhUP2jFSTc6L4WCip6ZSKzI4tl9JreWGUuFsuToejqNjfrWYDlk
	JyRGO8sVOoAxUlQsg2EA4BsHppGJuDSZg8XQfS6KYEUnkvLt0NSw3Ln7+4QW9SE+cUVlyXc6xt/
	O5yYtgeOU2f0z45phgL46BfR5/S6OyZ93JXzOMudOhPUStsc4Ihwvmv1mRkE1RllonJopfyzTY2
	vW9xtYkjJhjwJHXwqfIJu/mY36Oes10VepFTjiiF5AdBqCmvovTYBlEqTpRym5JmOsMcEbpUjJr
	NpFBBXE3QZH+VMbOVrUs0OPMq18gAzzsrfjn3fkfudsUD+nC+va/grBWeB7hrk9ATySZWs1tlMv
	HQygzdhlEYlZ3nJcvFHsNBzRI+yZ01Sp6gfuNSoF9hr+ZNtKQLhI724MYWHvi7Ji10ArUtvpRep
	rhK3mW00Jsss6V7LWXST9vJe0EFXkDCRZqRtME/cqtsbHKVV6a4DOQee5+eVOSVR6gSbSXd44he
	Pq5gp9NQXaNDrwJMzkfH1+TkyCBFuajSkF0MUL49SmnFomRNH3dct/UQBafxphL5oYg5sc/he3l
	qhQcQ3H47ctAE6m4ExkdKrhbfqacjY7f0GyqnV12JAE/4TY1s82wsHO2uBgu85rMcLiUpXvDd4u
	UzZ9afCuw8x4H6Gs3kL4=
X-Received: by 2002:a17:90b:388c:b0:3b3:c04e:4b74 with SMTP id 98e67ed59e1d1-3b41c9b2becmr7746348a91.15.1795319223311;
        Sat, 21 Nov 2026 19:47:03 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm11040018a91.17.2026.11.21.19.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:47:03 -0800 (PST)
From: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chernyav.a@gmail.com,
	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add Samsung S5K5E8 image sensor
Date: Sun, 22 Nov 2026 10:46:55 +0700
Message-ID: <20261122034656.1093369-2-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122034656.1093369-1-huynhtuankiet33@gmail.com>
References: <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
 <20261122034656.1093369-1-huynhtuankiet33@gmail.com>
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

From: Andrii Cherniavskyi <chernyav.a@gmail.com>

Add Device Tree bindings for the Samsung S5K5E8 5MP RAW10 CMOS image
sensor, including required regulators, optional reset/powerdown GPIOs,
and 2-lane MIPI CSI-2 endpoint properties.

Signed-off-by: Andrii Cherniavskyi <chernyav.a@gmail.com>
Co-developed-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Signed-off-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 109 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000..3aa50bd58
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8 Image Sensor
+
+description:
+  Samsung S5K5E8 is a 5MP CMOS image sensor controlled over an I2C-compatible
+  serial interface, outputting RAW10 image data over a 2-lane MIPI D-PHY
+  interface.
+
+maintainers:
+  - Andrii Cherniavskyi <chernyav.a@gmail.com>
+  - Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
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
+    description: MCLK supply clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  powerdown-gpios:
+    description:
+      Active low GPIO connected to the XSHUTDN (powerdown) pad of the sensor.
+    maxItems: 1
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.8 volts.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.2 volts.
+
+  vddio-supply:
+    description: Digital I/O voltage supply, 1.8 or 2.8 volts.
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
+              - const: 1
+              - const: 2
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdda-supply
+  - vddd-supply
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@2d {
+              compatible = "samsung,s5k5e8";
+              reg = <0x2d>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <24000000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              powerdown-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p2>;
+              vddio-supply = <&vreg_1p8>;
+
+              port {
+                  endpoint {
+                      data-lanes = <1 2>;
+                      link-frequencies = /bits/ 64 <420000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f72ce07a4..10b7bf57a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25013,6 +25013,14 @@ M:	Andrzej Hajda <andrzej.hajda@intel.com>
 S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
+SAMSUNG S5K5E8 CAMERA DRIVER
+M:	Andrii Cherniavskyi <chernyav.a@gmail.com>
+M:	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
+
 SAMSUNG S5KJN1 CAMERA DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
 S:	Maintained
-- 
2.43.0

