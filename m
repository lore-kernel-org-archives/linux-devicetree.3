Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262859;
	b=AJ0kQsBQffX7vV7qCeleMZ5cjiqOE2XuY2Gzybu0q4svQw8k1Ll1N+w+sDal3UghmExo
	 h7Wj824/P7U7TTieh6avYynj8CtwRBGK88CsX7ALp0SiZyK2agx4+EzZL+MsjptQ2iwLX
	 VFwIjGnnRocL8rUvXyKa0IbzVyz5mbUallABjSZphHhFc2biCQfYc838xsANeRJ4QnV0U
	 kadbb4MNYkMc7CldFTCkFIK33+RF4AaTMPdpa7DCEZyvAaYNuE0l/Lp43Ph4shQY0L5/i
	 gKUFSozp1xDSDSjEqVRXR9u/WHatAYqZU4Zo7B4EGFPm212A+eofAInztu13gLpbskw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DkECxiVdqR9VXVRGAphink4EdZVw3RAtb3ttxyIIKKQ=;
	b=S1UdBux+3EVJ6FHCwq+krqM7hvzkb+y4lbAhbXag1vLRZAvtFmtW2MzYpmd1P3SGo/UA
	 7B9QPgOaQEbKfT9EMe0f4YGguWlZoCV55+jwpzxydv8wYExbPh+H45ij3opOJAxZNB1rw
	 FjPo3Ywc4TsY8FTjK03BQrdneOb0kfsQOyQoD+g25me4krPX/vIjB9joxz//q8dkkmwIB
	 OFBOu7u069vJFTO4C+hgYT8YRazb7f4lGnS/tURCxYv6krnWWzWChebr8Kzc7m7D/W8oF
	 7nuKXEDHtNYqijS2bXp/FNwwFc5qv98UN2SbXSYop3RSBcNxB9k13iuAP82XCUPZ2KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVi0GLal;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2DF606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 12:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2DF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVi0GLal
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1478059c88.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262858; x=1795867658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkECxiVdqR9VXVRGAphink4EdZVw3RAtb3ttxyIIKKQ=;
        b=SVi0GLalaDihXUIFCMpJntt/k9T5IAOpXUMnnF1/AJnbYJGFkp5wt3dJ/B5nrCsO2L
         2OwfN4zj+b5Q7tkNuY6O2ojpikGhW/Wa2ePEBaVAlQRkgNU1koAdsyLCskCvNCglARNE
         B+QTnYg4qovmeu1GjfD250n9ZQjRPrCqgq2VNDopPGgscUW4NCBQta4PTI6Et6JggQ2v
         QrTd5oeZLrqcn3eLSG7wmqVWjIpmNh9NBZvCgDgH5Cs+alAPrRel7fE3lXFyPGgWrGRg
         WV/NIDQ4m2iJvgFk4LWVeiRrJ7apnYityTZdX7xsBn5sTC3tcnVRJCbgTH3y3Pt2GTrl
         f5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262858; x=1795867658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DkECxiVdqR9VXVRGAphink4EdZVw3RAtb3ttxyIIKKQ=;
        b=DYESyiAqZ+DINWesuuNkYhIrOva40OCeD7h1gYzLOEXoYJwHpXWDH0c4pD0zPRY8xn
         kYWrp1UeZOrraQWy8rzYJUOnRxxG4CTlO+o6yR5aY7aUuIsxS6MDUYIRCF/MvFNgaj8u
         hdgkHkt8gq3r5mIf0BV19OvycHVtfSGfbAfK8R7nTmPiiSXgrJPzDKZEdcsR2ppMClN7
         cn1yS1LdYHXis5nRBRshm2wA16ttrjTSXQO5QXPqwG8QEakBZHQL9hBxzX4pRCWMF6Y5
         qXAdjD2KAzvZM+B6Jrdv394Y6znRLV226Gu22PGeJChQsrQqBJjuMIipHKMzPIQ+i5qa
         MaEw==
X-Forwarded-Encrypted: i=1; AL+hErFUrfBk0FdAISkTLTu54WkfsfJ0KBLkSmp8KTOKF/zQTGNycURWLZPsb1wy+Sq8rturiHcJ239VN2Cm@vger.kernel.org
X-Gm-Message-State: APuU4Z8bk07Sr5K25YsPan1dFg9Cb9zGoAUzpa7lImWRhZ9GD/wwEv6P
	1qg4m1Go0xIU0sp01/pJbQGyvfU4pAtclC8IAF50aTCdDWWV2+JGdPmq
X-Gm-Gg: AZFdTZc8wvZJHBTx/a/rSdkiPA6FGl0amW0ukekxoracgZB082+nuTAJh+iZvbBggCw
	GHMb7W1OsCKapAddA1wLh9NAA2NYzXuOw1Yhsa8SiEuiEUzr5/2/gNj9NLTLs53SvmXoEhJgaz4
	vHVPP7d3qto3BAY/EhlUNCTS+IPFZsvIN2u/EA8KdefUjwywDjt5DQUjjeC+w1sldTlRj4H8tHt
	pMXdtuLUlyuQT4aVibqWKHEipFGTOLPxVUOEugYWx9PhCcdbBP3a1AzjAW/VbmNo5tqbcwcdgKh
	hELg1/vcjNMgiCgffHu7fp4/6kFpOT9VYCSfxl/Zf3DdqqUW7Z0HbjNZAGyrXAJ3hKGrqXxBR9z
	GUVtuNBN8kHP7uzUioHJ2hnB6lhuUKcJmpvS5LKsZ6INfy2umb0XSYQMNQytT75xS5cRh2Obkg3
	oObuc91A8DBdD4kcRyyr6DMdAEKtlIK/yv3A8OVYZcJMlTS/Ax2u+y16aAhXbdgWgVMhnolSz7W
	OTHX/pQ5xt6zRZ/KSWKKqeN2DnQuvbOJ151tL0k9Wayf90N9hTpMcC4YcHaQqnl6nhY77Po7bBM
	Hg8i/T7qRPi5RkwuWGe1bRMgCCCNF/oSG1jv9EY+tlrEUHnRYp0oko1zYWYvNwhQa6k40mlMACM
	3+p54bwahTt5h6sD6G9M=
X-Received: by 2002:a05:7022:f90b:b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5568ebfaamr5215284c88.30.1795262857705;
        Sat, 21 Nov 2026 04:07:37 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm7465314eec.1.2026.11.21.04.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:07:37 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5K5E8YX image sensor
Date: Sat, 21 Nov 2026 19:07:30 +0700
Message-ID: <20261121120731.2028810-2-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
References: <20261121091907.1190346-1-huynhtuankiet33@gmail.com>
 <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
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

Add Device Tree bindings for the Samsung S5K5E8YX 5MP RAW10 CMOS image
sensor, including optional standby-gpios and MIPI CSI-2 endpoint
properties.

Signed-off-by: Andrii Cherniavskyi <chernyav.a@gmail.com>
Co-developed-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Signed-off-by: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8yx.yaml  | 102 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
new file mode 100644
index 000000000..a70becba5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8yx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8YX Image Sensor
+
+description:
+  Samsung S5K5E8YX image sensor is a 5MP CMOS image sensor.
+  The sensor is controlled over a serial camera control bus protocol,
+  the widest supported output image frame size is 2608x1960 at 30 frames
+  per second, data output format is RAW10 transferred over 2-lane
+  MIPI D-PHY interface.
+
+maintainers:
+  - Andrii Cherniavskyi <chernyav.a@gmail.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8yx
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
+  standby-gpios:
+    description: Active low GPIO connected to STANDBY/XSHUTDN pad of the sensor.
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
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
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
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@2d {
+              compatible = "samsung,s5k5e8yx";
+              reg = <0x2d>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <24000000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p2>;
+              vddio-supply = <&vreg_1p8>;
+
+              port {
+                  endpoint {
+                      link-frequencies = /bits/ 64 <420000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f72ce07a4..b98726c35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25013,6 +25013,14 @@ M:	Andrzej Hajda <andrzej.hajda@intel.com>
 S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
+SAMSUNG S5K5E8YX CAMERA DRIVER
+M:	Andrii Cherniavskyi <chernyav.a@gmail.com>
+M:	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8yx.yaml
+
 SAMSUNG S5KJN1 CAMERA DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
 S:	Maintained
-- 
2.43.0

