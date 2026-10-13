Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FB4D37B6
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896273; cv=none; b=uuSLKFe7yx6+ZtIZq6+qywxVp24PAaHUZ6jA1nMguAWkHHsrOGoOP+xrpO93EIgQyVSpwTJHzuVDOuysBEETtZVN8qciKuSYoAvicVw+IT8IuvcMLCcuLaOnTj/hYv5uio8KQkg9fBAoo/4Z71GJ5oTrkGn5Z0O4p5emacnJUfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896273; c=relaxed/simple;
	bh=lkbzM8u6Ksurvv8STfByGe12+IIc/BqAKbB9v2Dn01E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7V1aHFHiqihlO5dOUwVCXNYIZ7+w3bMvT/A77K9U2vKu/f7Uq9IPASFwwNPE/buV/kH70URk1Y2KFZ93ySRtQLXx/h9k5PvhHGN0FZJuN7iqoS+HPOgsamhDtui3K7BBdvNCmiH0hwo+z6YqcX1PMVJqafvg5tEY/JN2gXGS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=MF4F6pUA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="MF4F6pUA"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e6df2742cso445109766b.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896269; x=1792501069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=;
        b=MF4F6pUAh5yxJ75huVJMGcH3egOyyWRSCRJfGvDJ0VZjey8lwSxKZ5CzjgEIEXIy4s
         WDM7V/g6QYEwfrYNZP+IxRQ2y92pz0QMOvqoKoPlN6u5tfelWOeFs1dPv6WGToPp5lJ7
         Z/r3Vte1xV6eW6Z4HPGjzTXoEIOB3qPvxPQQPDiMTxL6j6ltuRmL8FWssyPRLUx8H2JV
         pWyxNzkwwnFpZLjvNLxaFu09W8F+F+JMQWz/U62ZeHuJzsgP5VCgoNHqDSWW4KOcC4Tg
         C5sNK2jjFmQ8n87QAV1jtnVOXNG4cGMb0UvKLN/7Rj6k/lHE9WQmCaUZA8ztMZOUtuAb
         IcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896269; x=1792501069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=;
        b=RpdjHpnwjBp3/tg06VigWDGLNBcVFdSBSGgYvAlfX+SIAgJawO6wliZIqfr9LLsPNY
         ucBZy/mFSZ/xZf3yXkDIEGSeeDVKL5+9cSuPWdaQ6HZzelmVl+LxSU2DtIWE5t/nnysG
         qOao2iv61BEf4p6Osv9G78KcR338NfnmD1ySPn/k7mRDIM5TCnXBm6Q863WOjEvBJV37
         sVIII5sq94J6acbCIw4dgb7vNVG0v5LbRsHYGHJVGv1BjZYIFGP6jrICmECqgq+ff72h
         SRWy5gV3zHXACk0nHX9z0FAseRS9giiXMhGkWsowGWIEs5acFGZMah7zGiUaUub/Sh0n
         56ow==
X-Forwarded-Encrypted: i=1; AKwUvBxomIpImNxwDzOj0AU6Oy5Fmqz5Cg+oZM5myekKELp8cYmJWriHZB+Ng1BEKtx5g0Pb5X3b/uEOWWwR@vger.kernel.org
X-Gm-Message-State: AFq9FYJHc4ASBilMrqZjvDvT7jIvYCawqFWllGgIu1jLDmtXw8MehbgR
	wrchBc4mHeDhPsbuWqaLGIZ893WwF96sfeEw+2Hnvt+x5T8YJkBDwaAOyDGWHsS2U0o=
X-Gm-Gg: AYBFou09rGUG73VMIks09W/UTrDbkA+s8e9afv3NI+mUyeUWqIrpNDhZmpRmKifaWda
	FvIEGYjpYYRSDVNKL6Sr7g3UVhWLPdRl3jI8GnJEGAqz4VGK7f5Y/kTGH1S8bwVD1fbyFz/pjGh
	ZLyqS6jbI5JGZZ1wCZIqSYLEJUzlstjuC/wBpFyChtzSXqNjwmoB54GjMryfnSkK4FZhIRMld7m
	+uStM0In9SoUIYf5ENSb7P/UymDwE5ILznnbyYtPCyDq9KezZkxlmdAiiWuWa1bWkp+/wuHN14g
	FVoDlYWc7d+2qDD9OqoM7j6zssNTap2eg6dkOZRucly8dah6BRKGA/gIE9WOtlhnMrj6VrjUZC0
	kAPEWmE+QATK8qiaELO1ojAzf5hzVuSM0EM0fBw2o9uaaHfTK2KCKY2qeaIOFfvXsux//U6JHrI
	LFAQoAlc+Qy6mW6AFSh7WKwvtV+yiBB6VTBV46VZ1oQ07dSO47UuYm6hzGppeEWB2c8TpNpHKQr
	KJ7vM+30TWItqTuTPkqyhblTtcwSybx61mnhqiJWnkI8s1FQDK5U7LfiDQpWD9AiEhKdcJ50Wyy
	fr2sTNh8d7d1wvRrR7RKyz4dv18xp2U=
X-Received: by 2002:a17:906:e114:20b0:c33:62c0:d8cf with SMTP id a640c23a62f3a-c3362c15642mr504101666b.13.1791896268023;
        Tue, 13 Oct 2026 05:57:48 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:46 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan controller
Date: Tue, 13 Oct 2026 14:56:25 +0200
Message-ID: <20261013125735.1542349-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x integrates a PWM fan controller with a tachometer input in
addition to the Sparx5-compatible temperature sensor. Add a LAN969x
hardware-monitor compatible and describe the second register region.

Describe the fan as a child node using a two-cell PWM specifier for the
period and standard polarity flags. The child also carries the optional
tachometer pulses-per-revolution and thermal cooling properties.

Keep the existing microchip,lan9691-temp compatible for device tree ABI
compatibility.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
 1 file changed, 87 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
index 611fcadb1e771..e91c2a3ccd3c9 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
@@ -4,13 +4,15 @@
 $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Microchip Sparx5 Temperature Monitor
+title: Microchip Sparx5 Hardware Monitor
 
 maintainers:
   - Lars Povlsen <lars.povlsen@microchip.com>
 
 description: |
-  Microchip Sparx5 embedded temperature monitor
+  Microchip Sparx5 temperature monitor with a fan controller on LAN969x.
+  The fan child's pwms property references this node to specify the
+  PWM period and polarity.
 
 properties:
   compatible:
@@ -18,11 +20,19 @@ properties:
       - const: microchip,sparx5-temp
       - items:
           - enum:
+              - microchip,lan9691-hwmon
               - microchip,lan9691-temp
           - const: microchip,sparx5-temp
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: temp
+      - const: fan
 
   clocks:
     items:
@@ -31,11 +41,67 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
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
 required:
   - compatible
   - reg
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,lan9691-hwmon
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+      required:
+        - '#pwm-cells'
+        - reg-names
+    else:
+      properties:
+        '#pwm-cells': false
+        fan: false
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
@@ -46,3 +112,21 @@ examples:
         #thermal-sensor-cells = <0>;
         clocks = <&sys_clk>;
     };
+
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    hwmon: hwmon@e2020100 {
+        compatible = "microchip,lan9691-hwmon", "microchip,sparx5-temp";
+        reg = <0xe2020100 0xc>, <0xe2010348 0xc>;
+        reg-names = "temp", "fan";
+        #pwm-cells = <2>;
+        #thermal-sensor-cells = <0>;
+        clocks = <&sys_clk>;
+
+        fan {
+            pwms = <&hwmon 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0

