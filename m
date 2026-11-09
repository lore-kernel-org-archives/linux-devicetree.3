Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231384;
	b=WHEoMOCtXD1Tx6IPJpz2A9f/p67o/IegIY0wRomQ/PU3Z8J5i0mczHhwh8qCTRxG8VAG
	 bE/pbxx/afPWp+Tyu3vFv1fuSb7vYGRv4IzJpkk9vwFj7Gep39w9fuMoTF+leBRc2/naM
	 oOFf4J9sdNtd+IRYNdgpz4Dh9Zzp+LqNCMJ+k/V4atFWcJNmOTZT96hj/deaD038yd6bf
	 tGvCKEVPKfaTUBXRNmDORT6DWVHLGw5YqtxRc+laYG1rDjaNDXLwCcnsSfM8ss3dZAkAs
	 B/u7Dnfi0XlBGwRnXVQgkw1+ie/cGnmwzYj9QjAnKuEUVZCjF5eDux8I2jjNI0ukslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
	b=dXsOPuvAOrmZmrAZ3ZUOa9+p9ixXepOL6Rt/h1bSTXpO4zDgPp4KX6L2Agkc50U6VJOU
	 0af+YfFmiewBvX7bJVtO0luyqOUXTyUuA6hnhtVwcsSvqrzNy6XiBgDzWl/JhgUjw/tSD
	 3mNSBFx8hF/Oj/xm34U2JbIaxgBR8efK//gI3Fw5sj4+CNHlbDBUXJEXmlnMgsXZyb0w+
	 7ldVWmbY7Kb94Dy8fAccZShVmS/YBSnFUP1M3LSnfjGZtK5yUhrgYPJaEduiDwEoAOc4t
	 84qFzyskqHTQLeG3Av6QZ3NU7R4HSAHv4PYh0OqVJ+S4/PjRcSUF6KgPEA66KLY368w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=Lddqbonz;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EF0606A336
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EF0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=Lddqbonz
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so10612235e9.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231382; x=1794836182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=LddqbonzUr6K0romfGF6hlerJbpmIzHvEHhqyIWAmAqdmk/R/RLWOz57Zi/UW/CxWH
         znBTgbW4yHY5aYHkODU8j2wnYFi/mel9aRfgUbkIxM+mHIoNhu15PMhrj1e7+E8OhMcT
         j8x+KiRb1/La5Rooi5P6A6uu9lXmk7j+uByHVEjrnV3amn0x/sRYfmJ5edOQesRb+he/
         aJl4karHtl4ur9/hWKlLgGPSay0ISSarnokiHFKgoVCeOHF8kJOQloMP/OmlLTcszoGC
         qbp5tnbYmGXru/ffupw7/Y4LpMU41pEBoxKS8btbKzb8vYC9lIKPkwyKN05QV+Mi78XP
         mqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231382; x=1794836182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=dWOZcu1f6NMOFhtVJSg0t63fVgZ+upsrEtCfv6xYJ1gCAHhric3hHb4QoApzjElyO4
         3bFxAdChxPWflRp/So2S3Lf092TCt9nRJ4zkOfEEc5ajFx219ESxCSKaHVMzTfRLbAQ7
         lYWprf8Vj+7GtuGP0ZranTxetAe05mxQ1QPQfU7cZO0vloDbCyCfuR9xG0z6wjTXsNQg
         FJ5mNA5kwb+dkldzFhkrL6FtNTAS83P3G+OXIiaeyU9bRvHv8ufXXCTWvNi1PVlPd5wx
         XdIuc+TjCsvzJe+v8KSKU8I00RnwnGdvXje3gQ/vIcdeSYVIKCS91qRqIPD8bHpmYCdY
         +drQ==
X-Forwarded-Encrypted: i=1; AL+hErH5U5CDrmwaCP2B8vBxsoOf4B/7Hf3/Wk8MClZq+aIGml/dgCft3K7NyWtkWsfEaK4CZOEaVpNib8AU@vger.kernel.org
X-Gm-Message-State: APuU4Z8DNihgn8cfovKYH/yAVMr+lsM2+0sNkrBjwkVLnNjolU3mgU7e
	e14k8X2AMNb59rbL2bvYw1ExWfYYYOGPuqyk+d9uXP04AXRrJwvHEWmuopGOYippyP0=
X-Gm-Gg: AYBFou3UxK+SQNMn2dod5s92APC66qsPE7ay4qGwLguu+TbSowqRuDxDKwXWPv57CjY
	tX3kNrkEJFVYlcAGYiAMywANLNjhO5NKaTjXSPF9YJR7WGzoJlq3KNtp6FLXy3LTdka56IDg1oW
	azW0pbmMiSrvy4nX9d2YMuXDxdzoCTIs3Xoo7Eoy2tluwd6y0u+X1R1vjgxGP5RLWofa7u/1TCX
	zDYR189g+IgqNclkq3hyzyTFFqHSr4ZCynV9uyhdfPH1tV1XCrVGpGVjbixF709h7ZGzWA8H4/2
	uFLQyKzVx9PcGwPk8EHVW9nTpdv7cFeCvLSlxoUkloAble6wZJYzrbe+nGBHZZtUUuMT09gxJOJ
	R1Iw9Eh8PL+2/O87TcP8vYRu3AxXt/z5UjN5vyGzlcXZ57Gy+WpwOKH2BS8t2KB5kZqgL5QimY8
	NdCGvhlqt6fC7de1lOl3AfX+HuKTFK9RGauDu1CpyxYILQHhRoFYzd+CJK0ZayYkEGUynuYpvjb
	DijFqWtUmNd6RxZCBdXNP4nvwtnpn/Mjgv5fTcV78vVKaOebukT6eJE+OLkDe1V0ep9AJ+r+oed
	sc1dRw2jroS2SS5tiX+P+9ovUlV6yfoQHHJygbapr3q4t4MgrlwqtA7ppgWLIoxNBoZ3cXqdDVQ
	PYxlyqodeCWNzISvS4/DoLaWna00vfRhImWdVldHaMtM8crwGuUYrBtF+7XDh64Ep1R63BY0dEb
	Ib8axCwPdCw0C5+OC+xXJ4+bbo
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr71051325e9.35.1794231382337;
        Mon, 09 Nov 2026 05:36:22 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:20 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Mon,  9 Nov 2026 14:35:05 +0100
Message-ID: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
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

The LAN969x fan controller has a PWM output and tachometer input in a
register block separate from the Sparx5-compatible temperature sensor.
Describe it with its own compatible and binding.

The optional fan child specifies PWM period and polarity, tachometer
pulses per revolution, and thermal cooling levels.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..0b7d38a6d20ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Fan Controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  LAN969x fan controller with a PWM output and tachometer input. The fan
+  child's pwms property references this node to specify the PWM period and
+  polarity.
+
+properties:
+  compatible:
+    const: microchip,lan9691-fan
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System reference clock
+
+  '#pwm-cells':
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: PWM period in nanoseconds
+      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
+
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      cooling-levels:
+        description:
+          PWM duty-cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
+      pulses-per-revolution:
+        minimum: 1
+        maximum: 4
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
+      cooling-levels:
+        - '#cooling-cells'
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#pwm-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    fanctrl: fan-controller@e2010348 {
+        compatible = "microchip,lan9691-fan";
+        reg = <0xe2010348 0xc>;
+        clocks = <&sys_clk>;
+        #pwm-cells = <2>;
+
+        fan {
+            pwms = <&fanctrl 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0

