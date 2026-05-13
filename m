Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88641374722
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659810; cv=none; b=mq2tzUf6N+7FhvBbtWxclBMueino/YHSpolnK0cTcQgA2eeXSxS1SuFtS2gwRqGhbK00nFamXZ0hCbz3gj/QT5bdOc8b6k90uCDI2/Mz+9BX3XmHPm2yGwAApZWV1ihnUSb0BxdhpjqP3rQN4/UoUHuXjejlwthPaE1GMKmkNaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659810; c=relaxed/simple;
	bh=zMWu/hP6Dlnxe/IBpWqQy8v3Kzot9brI5H5/fhi0MIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siw/UzO/h5cJEMsFqX/KXLoAni9quYxp5ivuNAg2hD4ehrj0DUGNv4ziOE26bJBHGH47Wrb2uJS+UHtuU0ZxjATGUc2TglKndkAsO2Z+QmeYjJtlpasQVYwIkK6hTFYx3lH7+hS3k89dWPrbl/FEVZmKEZd6sYNNfXh8w17OqXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foN+0E+l; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foN+0E+l"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so8116770a12.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 01:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778659807; x=1779264607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uC2jsKFjgd5oQjURouLaDIBNO0MVJIAzvh5s+EY9Yi0=;
        b=foN+0E+lx7aQYMbEzJFJpBKOB2R6NoxFd62yjoMhKCC9DNXW1nOOQL+UNSmx/5n7Dg
         FchSFEhonm/9lNRNfIkXI2raOGzmL68tN70GRwIWfQAyoj9pEbYFjCKPLnAlNN8EHTvk
         U8JCRlvsN+Ch64/sXt4WRWubQOUvCdoQOgaGdgqpi8J8qgiWB/6/kJerLbxTDzBwIMtP
         JBOlbJ6+p4m5+w6IyPhntVF3DMDTZL9Y5vmcpwGBb7RT4HLE46dGPJbPC7MRZt2d6vZb
         NgbASse77lIIcSQapnjV0pnnVbpIrVBik+kTNJFpU8NxLapkjoNE9xeWkc3GHsGmOqYR
         46Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659807; x=1779264607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uC2jsKFjgd5oQjURouLaDIBNO0MVJIAzvh5s+EY9Yi0=;
        b=JSr9F59BzqKsLBHvGjNpTsc1c7RXGuPLarNGSO+6dBpQvImZBQNnMyPUn1OLyPRk/s
         g+cT1mFFY/tW7Oobqw10m65caRJxXJnKlsOfsvOVX7KzwkocW9WfA0WYRIBu3a9ssIQl
         ePyPVNj10x9AN4RKdvpofR5v291wWmBknI4DKnKSxv4weLc+FXL1Eig+0OriUwucGz3j
         tTJt1pTkzsv+v2gafczLjWxICWtS/jYq68xK6wfXEGW5jV06Gv7nCP5Zm0bqc9RwxWm7
         F1Am8WmQ8Ie3YTpe+CIMrJzEiYi6A0ecxP7warvqxPALbr7GClVrsZmJ5srm/zZHr1vz
         hrbw==
X-Forwarded-Encrypted: i=1; AFNElJ8HLxX292eeAbG1y1iw4/zY7+cw0UysIB7u2FWTRMyzwNf8HlMWVcYuaNMC7iTCCjGhMO4ozm2Nx6hZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfCxm+vGvCqIzSVzZQuhxJvNhBKA/+UVdMtAafem5ppkSk6dm
	oJHVah037sJc0clIpAXHYlvuxFh+99MykFUL32ssmSNE44Wun3bReKjqCvTkXUD5
X-Gm-Gg: Acq92OHS6mTJ7QGjWZd0Iz4llbMi8KJ+OxGF/rVAUbl9c32475DEKUhvNl/Lj+vNtdF
	chrhvEvvfx2mwTboz/cDniUH2YNPDM9Ge22JAzMhkL+wUF1T5O/bBWvGfKG3FZ+Ljt2Ytv9Fntm
	OCtrVqLf7AZWG9la35fo7IiXD8VZn0Jh+39HsDHfS2av/pRKVtFQQ1lBndH8WajCByOYq/ja5sb
	XY0u0vIrn3iVe3LtV3ZegpnZmcFBx8IVfhw6UvTqzYey2OY3RcTEyGRVQQLLaHL8DjesjMTzhCh
	x4+Iy8c9xQa+MlpBP8wTCS4GHDMhx42OKCE7YXQrVbvHYACzoYGzbl4v3mDjWIoUlzZhC+Y1dx6
	V7F2iilWer6GaNU/qXZRootIJdBfCJvYGxeveWkPD4y1nT3XhoMhUD3th8pE5dTiEPOjk5FNtC7
	QvO4GL13xSwr2Lpf9s1imd+cfnqxU6nQshaKdh+A==
X-Received: by 2002:a17:907:9453:b0:bcf:5729:9e5f with SMTP id a640c23a62f3a-bd3e044edcemr120698666b.10.1778659806635;
        Wed, 13 May 2026 01:10:06 -0700 (PDT)
Received: from gmail.com ([212.75.105.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1c2f9sm5970515a12.28.2026.05.13.01.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:10:06 -0700 (PDT)
Date: Wed, 13 May 2026 10:10:03 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	devicetree@vger.kernel.org
Subject: [RFC PATCH v2 1/2] dt-bindings: iio: light: add Broadcom APDS9999
Message-ID: <438370a42f57250cbead53ac73834fbf9ccb9269.1778659152.git.azpijr@gmail.com>
X-Mailer: git-send-email 2.54.0
References: <cover.1778659152.git.azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778659152.git.azpijr@gmail.com>

Add Device Tree binding for the Broadcom APDS9999 ambient light
and proximity sensor.

The APDS9999 features individual R, G, B, and IR channels with
a green channel that uses optical coating to approximate the
human eye spectral response for ALS/lux measurements. Proximity
and RGB functionality are not yet implemented in the driver.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 .../bindings/iio/light/brcm,apds9999.yaml     | 53 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml b/Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml
new file mode 100644
index 000000000000..759fe0151549
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/brcm,apds9999.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+title: Broadcom APDS-9999 Digital Proximity and RGB Sensor
+
+maintainers:
+  - Jose A. Perez de Azpillaga <azpijr@gmail.com>
+
+description: |
+  Broadcom APDS-9999 is a digital proximity and RGB sensor with
+  ambient light sensing (ALS) capability. The device uses individual
+  R, G, B, and IR channels plus a VCSEL for proximity detection.
+
+  Datasheet: https://docs.broadcom.com/docs/APDS-9999-DS
+
+properties:
+  compatible:
+    enum:
+      - brcm,apds9999
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  vled-supply:
+    description: VCSEL power supply
+
+  interrupts:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        light-sensor@52 {
+            compatible = "brcm,apds9999";
+            reg = <0x52>;
+            vdd-supply = <&vdd_reg>;
+            vled-supply = <&vled_reg>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1aa9c989973f..64c8cf2601e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4302,6 +4302,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/avago,apds9300.yaml
 F:	drivers/iio/light/apds9306.c

+BROADCOM APDS9999 AMBIENT LIGHT SENSOR DRIVER
+M:	Jose A. Perez de Azpillaga <azpijr@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml
+
 AVIA HX711 ANALOG DIGITAL CONVERTER IIO DRIVER
 M:	Andreas Klinger <ak@it-klinger.de>
 L:	linux-iio@vger.kernel.org


