Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413795;
	b=a//l6QJaDecGfJWGDsTtlz/eOaDpv9ETX8iJYC1P6BjA+L17V1LhtTP6pq6W/vBF+lox
	 iLSB9bpDsxIng7c4DUKAvzS8KfQpUiE5wRpMPvp3sFuNzNnh5HyBSQ2ZakU0m6pBraIlw
	 gd/X9YFBThhOKVMnPWtD37bDEcae5zpKX6U4xLCzIqQrBEuI8iosam69yrdg7nQej8ArB
	 Fx7CgaGWShKBL7x5/Yzbv8S+sGgYqwgkIuKn/z2uPsO2GXO6yp3sbsRzbBaT2LdOTaTuD
	 b4BoXI3d2LPI2kzNvbiwIYg0yr9+efBHXZ/ZGpXT/vrf28J/8V5llSlofJUcXfkxiBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
	b=enM1Drp7L6jtTsjzhAQYe6eNU5isoqtGe+IfE19BaWHaBYthYjjxUJCPt4t89v6rK69Q
	 WUGp0buKIThCQI8B0XO2uSPyB3HM/e8R7zjUMeIoT9zV0avjz3aCLhOo19m3VEfSgAGEn
	 QIhDlJGlnGeQss+riCecV+PidPGXexB8wCdO7SHYtKmgBkL/ccWk2q+HcWVLLPfN4YZUw
	 avvDuK2jDVy6w2vgy3r7GaizHNrSJo5WdJEDiBMf521BDJi1FXN7U1HdA9tf17ZmKsRcm
	 9IzFKn0wfT7Ooom3D3kzPHrNf+sJ8ekn0TERYohf944YBSv4Q/zP7X0qvJa3VZcj57A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xCGgpKHO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D679606A332
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D679606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xCGgpKHO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so24932885e9.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413794; x=1795018594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=xCGgpKHON65vGWLu5CG1Egngwk2+BdTi+fnSsSL8D0x8Xqivs1HujwomCjDv2PPMZR
         q1VSZnruWiOoG/A8ksoUMLToYXYFzCXX6Wka8yk3Bkz6oolx7esGfrc0u+7+e/NfowS6
         K3blGXurwKXyACJIfPTQ62IhUwWmSqR9Ajgri9lqTE5lEYbTPQIItU3FfyeA08d0SYEN
         RmPhSHR0/kChKXvGKMKn9Hc3XMRZgExRnHHXpFfOTvW9IWTYHWQGFTPhIZ+PQkKgxdfF
         zfhdOksppr/kElqDPx/cr3e1HM7bkbGnizpDpDOZxpYxaeW5nbN0SDGeiE6q4MfVH6+N
         NbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413794; x=1795018594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=m/Kps7Q2GMBLBd+l8DdLNl6Suh28oBaMHBLQHHSJrmpTdOsZ6tpiX/g+1un3e1xehw
         Og5mPyCTAofkfTcnpOjCitMF/7U5DRwCFdPcdgo/tS7HrWqwAUW364XfGJLUXhi3xodT
         yy0G21CeCIvtT82LZOBLT4SH184xynNmxOPY++LOR8eqxXfGNn7iqCLf9/XIlW5T1sYm
         +4t0m+/BzTP7jRX7DgD+ReyGjC958jaqkDTOhXdFxgl8mYayGMBwH5O4kAEDYqT03Xh4
         r6/HJhGBtLduJb+bjfGjiTruK6NYGszDL8UgKd1RSZ5s548FT8XNCbtng/9eOhkcd+xs
         YTng==
X-Forwarded-Encrypted: i=1; AL+hErFJ4hqXGdrtxkpXkrelKbdJejfFrypKUJHXwBZIhSwYq3AkwiYa5uF5KZzswNg1BYGMZVk2716yVp6R@vger.kernel.org
X-Gm-Message-State: APuU4Z+cEtgn04jwkfS7DpW4fJ42hGhgJRYC952wK3YnBaox7kFhFrw0
	PM2MUAduXuGMVNVxE2R4xM12MbqLaOodR1WkHKz4B07i27DXmXT0p9Ti00dV+x6cQ1c=
X-Gm-Gg: AYBFou3WlSNadVknANBtlOUzk7EyiCMQdFGK153RhlQ5l0vUPCqjPRQ91l+KWsZWMg3
	rI0EI5+2X0VXJMRxekznIBb8QZOwlRBmZ9eLRCo1dO+J+SNXTsQDft9nlqOWoMFBbp3oBjYvUcq
	wRAswolBoQiLmnNcSY1heb9EunTsL1/qXRqS2sz8Bdgr6perMoZx5WRxqgker1LxsRO31H1BQcT
	n4+RWCrMRoQBpuw7V1ckjCyCciE4yXcKsnmtNp/dTg96kRgyz83u+G55bituxWFs7fuKNgvqVYg
	WjdlpEszAgW+jWh24nexDlnTxOZTbBE1H8S79M4faPt0+nQvyNpNd3L68DLdLZXxGynNADbbPQK
	NQJDqmW0uEoseIKB+NAeMvkvuxUVqIK/Wpm0l3EVZIkpk+O8nPYmTFaRD/YTQbMzjErmafx4+gH
	qkSHqAL7PNt7wDvIJRFfmlQirkSvv+MeXMX5cgRlO8w6/szpZ0nMzD0pXaeNGAnWOa8sljgfQIL
	+0Bsy6qENOs4CkMSxW9w3WTRft+GaS4SR7En+x6odmoOtY/yyUTDzx3HBSbcWzYl3szUxsNf1em
	TUWrVNq2iMQzm4lrS8SiYW3YT076VTLALvWNHZ1kkxQz/tTMlSwuLi47N+5ibN4UOftw1TINvuH
	UTTdT4tmAFJlLALP3VrrhTTk72LLMcUruhWuXT4rkoibnO1M0DMeAzWFODuVV0qXOmOARGhhHwb
	Q5cMnMv1sILuBVUUNFR0QmIvM=
X-Received: by 2002:a05:600c:348d:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ba0935cdafmr48000605e9.8.1794413793928;
        Wed, 11 Nov 2026 08:16:33 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Wed, 11 Nov 2026 17:12:46 +0100
Message-ID: <20261111161619.232141-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Drop the unnecessary literal-style description marker.
- Inherit pulse-count bounds from fan-common.yaml.
- Require cooling-levels only when #cooling-cells is present.
- Add Conor Dooley's Acked-by tag.

Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..6a8d05a62f7c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,79 @@
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
+description:
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
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
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

