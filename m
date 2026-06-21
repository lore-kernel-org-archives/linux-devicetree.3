Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86629221D96
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 00:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782002796; cv=none; b=qQtQaUHMyLI3eeHDIH4q3V18QtE43Lta+py2HXP/17FSaY0V9DunAwkWRtJM5SYVy6MpKcYslrZCwOv0baPouwSk9xrCC4lh6rlVS35d5zoF0FAOb20JIk60NnCVA+ONHsd79kHhXvGDx+m59Mwj5h837k4yXMCUX51Bo3bVm7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782002796; c=relaxed/simple;
	bh=5TTxQ3I91yDsizRvGxC6wGurDup/AtF5mbCDjYKei1M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KleGFGVQ6lPxiJzmJqoND/LE1WOyRUNWm/RMi8+REMfVAjH795JR+xkksCwcDjT0KHC1I3vJfSDJJvMnLlMFgPcKHr/prYD8olVOL1jXtzRCUp3vtFRLhpnkuD+URKNhQSitUP+33K42FMnshCCiWJsGsk8j8jSxct61Eg/g59Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ+PYWpe; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ+PYWpe"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-447134764f7so1402422fac.2
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 17:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782002790; x=1782607590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UcOBkVQ+LuwHq0/corgNyTz2DMj/Og0DSgHE/NFxEw=;
        b=QQ+PYWpetG9zk+hisGM4B2Xa3x4V3uLwp9TShUJLa/29KnYerBghnhlDxw6UAUbjHB
         0D/V/VMjTnue43rnDYXc4nci5HHvtawBUKrNl7hGHXmZ7C3Nt/mgPVjmPJLz9kaeMIRi
         fcAeynmVeUzkE2HZ4mGnFGIEs6L4hoVZouAE7/LBtWWwnVTS33t+N2Z1kTgTA7Dvi+d9
         uK9BKF7pIKmdMpBQVKJKE5rO1YYkolSzdJw/GinPfXYtbPKrUY2gx2qgz+1UH5B0Qk1s
         WXJWG8Zjrz1cU0oyFzmb/XGi63UKTo2RWmJGoXKV8Nn1KDWxDMq9aNU7mpa7JA4mZz+w
         dNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782002790; x=1782607590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6UcOBkVQ+LuwHq0/corgNyTz2DMj/Og0DSgHE/NFxEw=;
        b=I8zZrRdfqOCu62x8DyJkMFFxZ6hK+COEIh9u6O6C/DOwYhPHSq15cgY/MWbHNwmvxc
         T2RlSGQHvdw2M8fBWms1G6fwdWSRvxRlg4w5s2BB7lh8Lo2L320S3nLHQNbhCn2yYqeM
         t19OQuOEnPMhPni7ef6RYGyNqeDnaejg5Q2yhB7tITQY3kHT6C9YeeXaT84cB8wV4bPm
         kxqYPUVKEszwk8zIlFFFW22qK4LdfxesSR/dIvuI+TBKrFaJYkJr8GOTqp9krRJyBG37
         NB2A4AnsktjLcl9+mWmo/J38ObjbOmz4I3AgmLM5G9LyWKQVGMCWi9tdiuORa+oNRcvl
         N2rQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+i6+bB9bJ8iuYred8mraL3krOUlDWVOPBT75uIaPM/skH+JtSv9DizGMkibz3vCjcKUmYmneBcSMF@vger.kernel.org
X-Gm-Message-State: AOJu0YygZt+qmMLeebJiTi1v4q9iEB/HYh+Ovnj4bNvc1X3hl34sTFDk
	HpzEiWStiIpQJY7yudhdYdwUxLhdLaO+hDBNCPQChyowuokfGifpj05w
X-Gm-Gg: AfdE7cnRqd9SI+6aU85mTq0qF5cgyD8dE47sUCxw+CwT7brfCSvj83F4U878R+3X2u7
	/SEtFBh30PQMqT7QckPe6xAEZvLbYhGEYVFC8Q55zFm026yqQ80Ce9HQnRzsL2avDEehXtBA+fV
	sJoLRYin++6r4+c59W9xc+Ai/qUU3MuIlcLQqvLgzyG5nqq7T4sCiEuBiZj2K9+7+8Hm9WUfVSU
	Etu1eX8vjSEQ8KVwMWpHoo/W7R8/9uRQWyEOlW7IfxksyyHng19z+eoB9BZOBw1PjvfYEMsrm0Z
	Mmo7UR0UF/y1pkVifctsU7POXhO3YTBL23qlOGWzFSXAOzvMU/pNhfzv219iGIju57+HrGrQhL4
	BBQtAtfACcXpG8nkVA7mZtB2NLLuDVAYOChQGbtKPAwZcAtYjReTNr+53tsPLVow9daNXHsWPRT
	GArXKK89bXzE7EDnTwGHx4cH4TLDk9V1m0Pg0XxeromTWkEhY=
X-Received: by 2002:a05:6870:e386:b0:430:3ddf:9712 with SMTP id 586e51a60fabf-44707c309dfmr7829163fac.5.1782002790326;
        Sat, 20 Jun 2026 17:46:30 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472ec5fd4csm3080457fac.2.2026.06.20.17.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 17:46:30 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] dt-bindings: iio: temperature: Add STS30 devicetree bindings
Date: Sat, 20 Jun 2026 19:46:23 -0500
Message-ID: <20260621004626.66629-2-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621004626.66629-1-m32285159@gmail.com>
References: <20260621004626.66629-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the devicetree bindings for the STS30 family of temperature sensors.
The STS30 family of sensors includes the STS30, STS31, and STS35.

All devices in the STS30 family share the same commands, timings, etc.
The only difference between them is their measurement accuracy and
tolerance.

Additionally add MAINTAINERS entry for the driver.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
Changes since v1:
- Squashed parts of the MAINTAINERS commit into this commit.
- Added ALERT pin as an interrupt and in the examples.

 .../iio/temperature/sensirion,sts30.yaml      | 55 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml

diff --git a/Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml b/Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml
new file mode 100644
index 000000000000..9bb0f04795d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/temperature/sensirion,sts30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STS30, STS31, and STS35 temperature iio sensors
+
+maintainers:
+  - Maxwell Doose <m32285159@gmail.com>
+
+description: |
+  Family of digital temperature sensors from Sensirion with I2C interface.
+  All devices are compatible with each other, their only differences are
+  their levels of accuracy.
+
+  Datasheet available at:
+  https://sensirion.com/media/documents/1DA31AFD/65D613A8/Datasheet_STS3x_DIS.pdf
+
+properties:
+  compatible:
+    enum:
+      - sensirion,sts30
+      - sensirion,sts31
+      - sensirion,sts35
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature@4a {
+            compatible = "sensirion,sts30";
+            reg = <0x4a>;
+            vdd-supply = <&reg_3v3>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d95d3ef77773..7f94b8cac3e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24487,6 +24487,11 @@ F:	drivers/iio/chemical/sps30.c
 F:	drivers/iio/chemical/sps30_i2c.c
 F:	drivers/iio/chemical/sps30_serial.c
 
+SENSIRION STS30 TEMPERATURE SENSOR DRIVER
+M:	Maxwell Doose <m32285159@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml
+
 SERIAL DEVICE BUS
 M:	Rob Herring <robh@kernel.org>
 L:	linux-serial@vger.kernel.org
-- 
2.54.0

