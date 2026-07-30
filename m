Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9A63D669F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 21:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447029; cv=none; b=DOPNndXgvGEtYNEGEbUDKizw287bXUHc8rig7qkSa9A9Fwo8qleTSDs2Y8h/+206+8eCNlXw0AWzck/Z7LRhZVFVAEUPl5S0hUeqDllP9F/mtmbeKfIOEwxSaGKJgjoby8hqK6sb1BZlOk4HBynQR+1ljoPkM2C3E9ZkFE5hzkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447029; c=relaxed/simple;
	bh=kPSU8K3hloJk0CA8KkjVBFkdAjOTtZpzNvFwM4OXI18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARPsnkxNIyYsbmNLKmclqZyKkQjoklX9LP7Z8LaZ+Bnm+dpcIcniu3OfjfjXJJWbbX+tB3zo+JpFvi7k6RsuGBo+22kN1OF1TeNrkm46Ee11MtCA8VuBBTVDZWvyrNuztEmJPySUGDQGUJKwynuXvk9+hit01osppQiksHmdpYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtVPEDWU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtVPEDWU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so3774985ad.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785447028; x=1786051828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJRlG/nhDfRO8KA3xYrGnvb0TOuHPcGeB7eh7wI6Y04=;
        b=mtVPEDWUCuTdz+e3LgqNxygHIqzI93ShgLoTjYwLyfwwCKdknXR4bmJWl4IpcWC4FT
         Pn9OsH2/eoz6XgEdcezCjbxlpOppi2z1mZzd8XEyHmgbEaBfFJLqDIELNdjsoKljIFlm
         FbZwBTTLpyB2KOnB9ejpSmM47gwU4XdbJLJHYWdpn0QGks8WxnBcStYCDVnb7NfEu4eF
         JCPEsJljds0rD29i4T9aWCLbG+wc3tbD4I+WcxUCaQizKWpeqfFyPTzRtjb+ejy9SFqt
         GUD2i5iB7Nzg8oODFw8gunT9xpsuJrm0CXUFGsNxXDYoHBmSuVtGW6BZedIZa5dpAtUd
         m1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785447028; x=1786051828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJRlG/nhDfRO8KA3xYrGnvb0TOuHPcGeB7eh7wI6Y04=;
        b=T3ihnO3WurMAu9wXMTDL+0GC8mRqv3R2Y2hwGUc2JZ2GWegPpu1MLi+TSMcpoKCOg0
         PaQTCFfTZD/4aamCNG1to4aZyTwqV1Jr8azCuFgBewXKebwInuqQWLC4neoEKL6dBQfp
         fc0ABUscuzq87CFrXIY5c2ugsbFuV2nSMiD/hy5VBzVijHW6ocFc/R8Xs5qZK1ZOqn2m
         eKNGgSDe4AkAV66KojVl5NEsYmB0QxjUAA6+PxfZb+r+zf1ADMZt3NKnQBMuUyEzOxK+
         HosmXqHw0JJ+V5cwt1S8WCWd/vQ28ERA/tIvKMvcVl3E+ma1HvmwI/8mFOJay9mbSa3/
         +DyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQrgRIsm3kDgjc7oanZl7pL/LroDgXTPOueNBwNWO8X1CVUGYvaTV4vRMMhovZ4ypmzMkQcld8TqoU@vger.kernel.org
X-Gm-Message-State: AOJu0YwKzzu+Lx7ayNOsuTMpEUjt7CaC9vtIfPePleWejWkV1oD5swlR
	O9MppemqwDOlrZSFpedxKSNHcaY+nR+2bNhEBOc0/lzF64imqcu2I30/
X-Gm-Gg: AR+sD10KaKnPOP7uZYxdqvMrFo+wXe7e1WiECFppcLDlhbO/pyNaRWkVA12RXM1idKI
	dYFs+Y8Kkdf0gWz5XjqZC8QBrazsxwRpNdeWRped0GkLn+G9kNF+tu7IbBuUN6I5aJ9bOKvbdae
	kfj+PbW3l0H16xbJwj1kkyv5tVWcecWmYh/taLZQJMqpMKKlxIIMZZtQun5CmKyS7K/3/yut38D
	pOSUHkuc6KhGX3nw7BUnmrON8YteiGHSdjT32D/2yf++B++XbIg0hwaR21PJALrxGzWs0kIkVQ8
	OmhliDToL3j7rwF7LkuF+GA2lxdGSHUv9gsCt3SvYqiKfpYCGILICoP5Z3YSfelTNgREV+QlBjG
	Lo8iittPajhu78u97XURSs6kHXC5DL9HPRztGvOXXt0vyB2JA0yYo7OutNWWDK0G1Limi8ZG0rO
	NDXllb5J6YTN0+LTXCSIPphUvW0nnW2+isYRG8WOTJlAPmWD1+93NiCshbEMVZDa//BAnnhiczV
	Fpc
X-Received: by 2002:a17:902:ec81:b0:2ca:2073:3119 with SMTP id d9443c01a7336-2d035ce64f1mr38650655ad.32.1785447027541;
        Thu, 30 Jul 2026 14:30:27 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d2ec2asm28584728eec.21.2026.07.30.14.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:30:19 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 30 Jul 2026 18:29:56 -0300
Subject: [hwmon-next PATCH v5 1/4] dt-bindings: hwmon: add adi,adt7470
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-adt7470_thermalzone-v5-1-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
In-Reply-To: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

The Analog Devices ADT7470 is a multichannel temperature sensor and
PWM fan controller. It supports monitoring up to 10 external
temperature sensors and controlling up to 4 fans.

Add the device tree binding documentation for it. This includes
support for the thermal framework by defining the "#thermal-sensor-cells"
property, and models the fan control lines as PWM channels by
defining the "#pwm-cells" property.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
new file mode 100644
index 000000000000..f653a06f241a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADT7470 hwmon sensor
+
+maintainers:
+  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
+
+description:
+  Multi-channel temperature monitor and PWM fan controller.
+  It supports monitoring up to 10 external temperature sensors and
+  controlling up to 4 fans. The fan control lines are modeled
+  as standard PWM channels.
+
+allOf:
+  - if:
+      required:
+        - "#thermal-sensor-cells"
+    then:
+      $ref: /schemas/thermal/thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: adi,adt7470
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  "#thermal-sensor-cells":
+    const: 1
+    description:
+      Valid index values are 0 to 9, corresponding to temp1 through temp10.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@2f {
+            compatible = "adi,adt7470";
+            reg = <0x2f>;
+            #pwm-cells = <3>;
+            #thermal-sensor-cells = <1>;
+        };
+    };

-- 
2.55.0

