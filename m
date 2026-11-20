Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135466;
	b=L1BDhtQMKoR1iGAEHlJHKsXEEis54hf8+RU/ZaR78T07JzSQ6WRfrNI15W/nElC3/shG
	 AGXmpS9jZTrESXyG1F0wP+Jg03ObvV2aAEOToCRY2cE8jMkA9k1d0K/CjnG9sWi1AYkV/
	 C/PQ/iLxhWvifADl+ji2JAMGi/DN5GWEz+aB80SQD3CmBAakN0tbiAQpuAJFn5S2AGjtm
	 tMBXS7Wue1UscT2Ht7leIyNqfALc+VEHkGtwX8qou4/04ASPQmK/adwLv4BOHKNh30NkQ
	 3nouQDlZqY38B6czfJ+pg3FoqB5us4zAv9CFx5mBwq21gnTXM2x8Pe4QYPBs5XCkrSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HAT1U9wNy0EKa5OwUErsAyJuiK065rYrDAt2SMRpc5U=;
	b=gOfLsf4Teq/NZDKgzftoXfs/JJXZN5Q0g9KgetlAMTnyGmuPuG6zSa6lp8/RlnFYwQLC
	 ntSjeT7MosFTKThIq1FDqHEs+T8tJ/auLoVnoNrilP/JK4ijyZJC+zrdAujZn5R2K84a2
	 BScCQ5Ncdlivyo2K6Jcjamf14n3uWT/TDdQNo64/0EwW9h2XeynwPmefQ2Q/p+emxmuCX
	 Xnsj4vzc5VasTnoTeS0TudnL6urnLqxdCOGZAKeTVrsi3ycerodYRNWtOdlyk14pndUVs
	 cSiSVRlcZMRJkQi1I/KcRU4o26TEAfrhqyTF7h21dubjRyufoJv5ZEOA2flEuGzXQTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqnxk9wz;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65693606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65693606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqnxk9wz
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso180695f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135465; x=1795740265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAT1U9wNy0EKa5OwUErsAyJuiK065rYrDAt2SMRpc5U=;
        b=Cqnxk9wz0Xf8p62QPRh6wqWUaj6v9mXQsriLuN8UnEMEfuadKYAqGLmj2PlPcQQgMw
         1F9YfjUJxiJIwBYb8pbaXU9k5zEnDIATH2HproQtfLWzbPfvlmJevYLApPJd0nFmAFvb
         eCL3LX5N5r0CXCaN153CD3JIDOrqlPNExUtHaZSc6f0MKrh+1F1+SAsYm3d0srADQgj9
         eBVmVczMSBocwB87o4u9yN8jVGEZEsR8A49kyeuk+ZfV0H/NkbXekdXmGc0YsUue0UKq
         q+N6TkbS/z9ta2AYlybHRpNyQ/TiugRwMNXTWP/GUhXi3Pelpl7zkoXZLcPGlVK0fQAA
         5VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135465; x=1795740265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAT1U9wNy0EKa5OwUErsAyJuiK065rYrDAt2SMRpc5U=;
        b=FgOMltEWIZRIufsonuCSauE1mFJvBIV9REniut8x4pffj55d2AqKLRfiYIWrYXdbEB
         y1Ts/fZKMEMKnLY4xDOhq4GN8pyc/SsSLKHbaRuasl0H/mGZw8AwfhQywUIQwFA21ISO
         3Q/JppxiE/9E8N0RuMWhVhgwOOquRf942QCWf0egU1210ybPTr/4eD587jQKO5Ff0Mhq
         gfeuIMBahkhBao8K5eDXb5ldxdZFDMfPPWrpWGJZGQfaXFMMq/U0sjgww+Yn8nNQR9x8
         Pj/ctdWUc2B9jLQ3qWpM9b9D8qwtQDAF3QD1iQwbfBsgnPEqLuQKmXaZr0VuyE/4g01Y
         +AZg==
X-Forwarded-Encrypted: i=1; AL+hErG66YqnjR+naHECFrGyNSjP6Uyl2P8Y6PxMea9eemc35EO+1W2OcEga5LiTP1LJEfXWCAzrfIQ/EBKV@vger.kernel.org
X-Gm-Message-State: APuU4Z9BhKaPyKY2OLWzSTWZsUUJOu0rrzmqhJwg/8rNHnDV0RPDQtxO
	2CWLNC7wmgjWb25ezlI5QWAeL6mdMnjVLtSPX6IjHEZXeycB3LJgJxvk
X-Gm-Gg: AYBFou2VIhk8k3CPubEbiwiJdw9HyTL2Sg4t7gFC7z5brDsU/oppoFBFIO+GsEdAsE+
	uqhRCPWsv1U8MH8Tv6GVo/3Gq8B1SIWLOBQ8TzloJKQ5daAr9U7P169GpsmliAe190+qD1sWNLB
	l5BZQwHd/SRTZUEHFEoz9uLMZjhymbii1unYydvjtHZ7oYELVSOQ1l3tw85uWcgjs2LX2+1R+b7
	UtnZ85x+EfytQH9Pd69sffAKDV3MOqPF0rd0rR5/itXiUfqR7d17wi8qpkwLSbiUYgnhv9Tk8xg
	I84+tyZ+vQSPkW3ixV3XoZcbGc5P0zpwZvhbEHQfq6+oT+Ke5LJvkW9uAAnlp4Ymjl4hy5zZ2N2
	aviCuNgKYxW4Bq7TJVSvvGY+rv8EiTlUaObamh1ugz82lzVJJSw8/Y8n0wdQE1x63ihcWPR9HrU
	cVNR0oCn20hLndnIeYr8riyLCy8sh7vDq22NXNA2+zQAFPsMniR1Nm16EVyxEu5rSYTx+WBEZe6
	QPP9e88HkhRJ6B5ZvoOdOqjWik+PG7e68yVBNz/pstKvAuuiSsUVevitjnH/CbOb0CyE70U/guM
	w/DybJ33mevo9/sTUmJfJHrIIZ/oK+IfP8Le6w==
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr26497435e9.12.1795135464741;
        Thu, 19 Nov 2026 16:44:24 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm2686669f8f.21.2026.11.19.16.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:44:24 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	"Wang, Sen" <sen@ti.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: dt-bindings: add Texas Instruments TAS2557
Date: Fri, 20 Nov 2026 01:43:23 +0100
Message-ID: <20261120004414.1686884-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120004414.1686884-1-morf3089@gmail.com>
References: <20261120004414.1686884-1-morf3089@gmail.com>
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

Document the TAS2557 mono Class-D smart amplifier with an integrated
DSP for speaker protection. The device is controlled over I2C and
receives audio over I2S/TDM (ASI).

One node describes either a single device or, with a two-entry reg, a
stereo pair sharing one bus. The device at each reg index applies one
half of a stereo-tuned firmware image: index 0 is DEV_A and index 1 is
DEV_B. No channel selection property is needed, as for ti,tas2781.yaml.
reg is limited to two entries because the firmware format only defines
mono or DEV_A/DEV_B devices.

reset-gpios and interrupts are per device: the item at array index N
configures the device at the Nth reg entry, and a single entry is
shared by every device in the group. A pair wired to independent RESET
and INT pins uses two entries each.

ti,asi-port selects which of the two audio serial interfaces, ASI1 or
ASI2, is wired to the host.

The DSP boots from a firmware image generated per speaker design with
the TI PurePath Console tuning tools. The optional firmware-name
property selects a board specific image shared by the whole group. The
default names are the mono images, so a pair must set it.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---

Notes:
    Changes in v4:
    - use the ASoC subject prefix (Mark Brown)
    - reset-gpios and interrupts take one entry per reg index, a single
      entry is shared by the group (boards with independent RESET/INT
      lines per chip)
    - add ti,asi-port to name the wired ASI (Mark Brown)
    - drop ti,imon-slot-nos and ti,vmon-slot-nos: the chip has no slot
      field for I/V sense, SNS_CTRL only holds the I-sense scale, which
      the firmware programs
    - require firmware-name for two chips, the default names are mono
      images
    - move the review history out of the commit message (Krzysztof
      Kozlowski); Reviewed-by not carried over because of the property
      changes
    
    Changes in v3:
    - single-node reg-array model (up to two devices), matching
      ti,tas2781.yaml; drop ti,channel, derive DEV_A/DEV_B from reg order
    - rename ti,imon-slot-no/ti,vmon-slot-no to the plural
      ti,imon-slot-nos/ti,vmon-slot-nos arrays; firmware-name maxItems: 1
    
    Changes in v2:
    - add the four mandatory supplies to "required" (Wang Sen)

 .../devicetree/bindings/sound/ti,tas2557.yaml | 158 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2557.yaml b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
new file mode 100644
index 000000000..4a7f90659
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Gianluca Boiano <morf3089@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tas2557.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAS2557 Mono Smart Amplifier
+
+maintainers:
+  - Gianluca Boiano <morf3089@gmail.com>
+
+description: |
+  The TAS2557 is a mono, digital-input Class-D amplifier with an
+  integrated DSP for speaker protection, controlled over I2C, with
+  audio over I2S/TDM (ASI). The DSP runs a firmware image generated for
+  the speaker with the TI PurePath Console tuning tools.
+
+  One node describes one device or a pair sharing one ASI bus, using
+  the reg-array convention of ti,tas2781.yaml. The device at reg index 0
+  is DEV_A and the one at index 1 is DEV_B; they select the two halves
+  of a stereo-tuned firmware image. The firmware format defines no
+  other device types, so a node has at most two devices.
+
+  Datasheet: https://www.ti.com/lit/gpn/tas2557
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: ti,tas2557
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description:
+      I2C address of each physical device sharing this node. One
+      entry configures a single mono TAS2557. Two entries configure a
+      device pair; the device at index 0 is DEV_A and the device at
+      index 1 is DEV_B.
+
+  '#sound-dai-cells':
+    const: 0
+
+  reset-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      GPIO connected to the active-low RESET pin of each physical
+      device sharing this node, one entry per reg entry. A single
+      entry is shared by every device in the group.
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description:
+      Fault interrupt output (INT) of each physical device sharing
+      this node, one entry per reg entry. A single entry is shared
+      by every device in the group.
+
+  vbat-supply:
+    description: Battery/boost input supply (VBAT), 2.9 V to 5.5 V.
+
+  iovdd-supply:
+    description: Digital I/O supply, 1.62 V to 3.6 V.
+
+  avdd-supply:
+    description: Analog supply, 1.65 V to 1.95 V.
+
+  dvdd-supply:
+    description: Digital core supply, 1.65 V to 1.95 V.
+
+  firmware-name:
+    maxItems: 1
+    description:
+      Name of the DSP firmware image to load. Defaults to a name
+      derived from the silicon revision, which is the mono image, so a
+      device pair must set this property. A device pair shares one
+      image; each device's half of it is selected by its reg index,
+      not by this property.
+
+  ti,asi-port:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+    default: 2
+    description:
+      Which audio serial interface (ASI1 or ASI2) of the chip is
+      wired to the host. Only the selected interface is configured.
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - vbat-supply
+  - iovdd-supply
+  - avdd-supply
+  - dvdd-supply
+
+if:
+  properties:
+    reg:
+      minItems: 2
+then:
+  required:
+    - firmware-name
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4c {
+            compatible = "ti,tas2557";
+            reg = <0x4c>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+
+            vbat-supply = <&vph_pwr>;
+            iovdd-supply = <&vreg_l6b_1p8>;
+            avdd-supply = <&vreg_l6b_1p8>;
+            dvdd-supply = <&vreg_l6b_1p8>;
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4c {
+            compatible = "ti,tas2557";
+            reg = <0x4c>, <0x4e>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>,
+                          <&tlmm 78 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <73 IRQ_TYPE_LEVEL_HIGH>, <74 IRQ_TYPE_LEVEL_HIGH>;
+
+            vbat-supply = <&vph_pwr>;
+            iovdd-supply = <&vreg_l6b_1p8>;
+            avdd-supply = <&vreg_l6b_1p8>;
+            dvdd-supply = <&vreg_l6b_1p8>;
+
+            firmware-name = "tas2557-stereo.bin";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d37ed235d..8e024bcfb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27724,6 +27724,7 @@ M:	Sen Wang <sen@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/ti,tas2552.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
-- 
2.56.1

