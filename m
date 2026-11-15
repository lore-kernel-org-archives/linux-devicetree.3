Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733120;
	b=Iq1Zkajr2/uwbVX+MnYnlJwAe4fLhphojbJr4h5Vja8XCO6r2dzQIZlP1Ou7rUDVs/AF
	 ohHkayzEhu5T0yFvBlY9r+S7FtW0WUoOp28R2ErdQ9tdQNP3sV/UGRn/mNmwlbxRYFMDS
	 vrfHNsd/DbSevCor+HhhJ8StZlXcucJBulUBXuJqldNf7XQJqW1O9Cm6xdMZTyAZHFV6H
	 neHY1/glLrdnBN+XkcEGg3aKj38Nwtoi8u4dsQxaLzvn/6fOlrFk0yjHvCMwEUbjQa5WQ
	 818lGYsNYEoeoeuaXe/81FnnSanCAkZOHM8nwxFPWSZ4EMWG/9S8P3NbXVDtK7BXNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
	b=Gyo3KvNHM79reo8/a4qhOH15IvT81b3Oc4V7NqpRh8w39m3bveFzCZdm4FqQWHcRCo7T
	 FN4zFgADCWnigXresEsdRzY1W3EjI51kgg+FjkOyffj0aK4SQGOK7FojoGMXPIveVHN0H
	 4ZZE6KTelvaKJgADWshSzrQgyRsT3FJUmo6Vn4QiGUTXjWb3PYSVQSUgOoXWeP/fqGeUo
	 x77DiuCysIntaYIM6miaCQAvWNXVK6j+8YSIQDvd/WARyuoEHpttbLJddP6/6GN1kOHKy
	 Ml1ZF8mEhFxyLjGnCjZah0NDO8lxmX8O8m86F4VY+0P7wa96WKQr6Y9jyMx8SbWtVpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPsUUrm6;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673D606A331
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4673D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sPsUUrm6
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso471552266b.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733119; x=1795337919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=sPsUUrm635yddSdvTL7IG5cX2QAsw0XXrkPv6Pn/50HxLhpopLxnB9woE8SMJdkzPQ
         ZyVD8w+AHewcn3a1c93CucFI0Mq7zRsKJF3bldMV6CmQ7PmZYthmcnDhoE7sLD1fnnvs
         dIIsDTtaffiPVjVGvOEBHgEPuR21kH9N+mID9RNJnNk8Da0GEbDNj7iJDNF0bqtwyFAv
         BUVyH0xeSCizRcmsccXEMu4YUe057/v/rwPf3CF5G4ETita+V5S8Tubdlkd76sQwxDpD
         cQkaQ24toV68rPjAkXeG0zSt84eDQUSER3+3fu8KgxhsR7aNQpY8L/sJE1ymtU8my4g7
         7MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733119; x=1795337919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=KKjcDjROlYGv7csxd2DBUuPMlHTY3VuWFzZS1KrEtJ2l1++DqBehAlaEUlLAUYtAvU
         WeN6G9gHB8y+Xlmifdn4PRMx4HRM46oZEryrB9immT7W5I3obd8Pv+I51PM+PUcC6u5p
         50e0l4+3dgfnHihnN+A5d5IqdkDoDG4lVvCFf0Ep45HcrpDKvQzdiSaEk42UWUbb72sL
         aJJxmsc7k7RBqsueUg5o85N5tn2C6xK9974HUdr+vWQrklTQlObssoNDhUz9Et41CLNq
         e4DAWaPuXpdU9+JxgLybVUn+9wI+EBvfQhIc5brPe04BRabS3zVrCYcdGeMpxikFnk0U
         hcgw==
X-Forwarded-Encrypted: i=1; AL+hErHm5ElkQKr6Y9erAmRINhu9ql2qqUrJBads/COpX3leE8M+79I3G0KQJTz1Q+PG9WVLvPhP3uRIlZjp@vger.kernel.org
X-Gm-Message-State: APuU4Z9Le13bh8DNuRO/4cvcW8+6GK236EADW0u/uKCuiGtywSZY6B4l
	j0Jt/a5a3gigbms2fx79S0tJHyTB7bvhsyxaVwlaALk72NLt/KWAdHvf
X-Gm-Gg: AYBFou3bMXaEx0oTdNulvCrG9t2UZV24YsKS8UpL5586F0wUrnAiQcn1/6OE2Y9adkp
	poPrPMP+ZL9iyWbCvFq8Hv6r6Da8Bq+aXQgRrzVm40/RlHpH/dBpXIAhe9PyR1dKqI35mxXiHz/
	yRq/WG/1LvoHLB4DSAzaC+anToTWLtVdy38Q0/KblVKn1WcfHJnO7wYEaR31JXL7K4lRwnx2zcz
	DzmxYpRDjNvUIQlHzjTaS+6kj4EN/WfddZuhz6V5RnFxxYq+GGqYaAcrsV7esEtC0vGnUAXwA80
	loVbXNm822mbJ+SdR2IkV1MeQhKUnZtrlsc+s8BRAwWYuAHLF4230vYUZ2Oe+2m/OsweClB4D4Y
	SWjnXWoI4l1BVFJLW3zKOtoZP/cV0xCl7/UafYAa6qK6SqpuPbL+rMjBwlFSyseIitslLKEvAT/
	Ul5//Vhk9jtIQJJIB9RDovBLfDv8gy1NmGSUSqYhRZz3RuhbamAvozb/pMdP/5r9K3s1mBBtCDy
	lO33ckUqkD9h+qkzo39zkJZDFOjh+xq4rWSIRhC3X8jgg1axRR9j7PWlDyIjyehBwVEHXafIXfi
	SCa+lr1LWlunR0HMOrVwpFiJGrqa4mczrad1BPYeLrhrITib9HV6nU8teNoXi8nKw/6cfVzGfAt
	GQuRp2gwoyQ==
X-Received: by 2002:a17:907:9448:b0:c41:8e21:4d58 with SMTP id a640c23a62f3a-c5096199393mr579973966b.5.1794733118390;
        Sun, 15 Nov 2026 00:58:38 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Sun, 15 Nov 2026 10:58:22 +0200
Message-ID: <20261115085826.89641-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..3f3f3058af52d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat2870.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAT2870 LED Backlight Driver and Multiple LDO Lighting Management Unit
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: skyworks,aat2870
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to EN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Regulator providing power to the "IN" pin.
+
+  backlight:
+    $ref: /schemas/leds/backlight/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-backlight
+
+      led-max-microamp:
+        minimum: 450
+        maximum: 27900
+        default: 27900
+
+      skyworks,channels:
+        description: layout of active channels, where each bit represents
+          one of 8 channels.
+        $ref: /schemas/types.yaml#/definitions/uint8
+        default: 0xff
+
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-regulator
+
+      in-ldo-supply:
+        description: Phandle to parent supply of regulators populated under
+          regulators node. They all share same parent.
+
+    patternProperties:
+      "^ldo-(a|b|c|d)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@60 {
+            compatible = "skyworks,aat2870";
+            reg = <0x60>;
+
+            enable-gpios = <&gpio 139 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_vbat>;
+
+            backlight {
+                compatible = "skyworks,aat2870-backlight";
+
+                skyworks,channels = /bits/ 8 <0xff>;
+                led-max-microamp = <27900>;
+            };
+
+            regulators {
+                compatible = "skyworks,aat2870-regulator";
+
+                in-ldo-supply = <&vdd_3v3_vbat>;
+
+                ldo-a {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo-b {
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+
+                ldo-c {
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo-d {
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <2800000>;
+                };
+            };
+        };
+    };
-- 
2.53.0

