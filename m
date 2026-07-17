Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DAB33AD88
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321977; cv=none; b=onLN4Oj1+JL0GzSo6Vt/3oVvFZfpxAsr1O1tD1p/faIAAftnQjJWX3PBsGNKU0X3ksUo82R+VSrB3MnC+cAkKn+JVHU7NxodS7znniasAyLylVAG5620xpvrtnalBiFX+Jh9wbT3tosa7d22udE4VMkddQbEHwQBMCuevIwoymQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321977; c=relaxed/simple;
	bh=xeMJkUp+9bHx+elzCT+IwDbJFiAPwzNnM2mZU7LP9TQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hu4262wKWW4f0dvff+mZBvYSaSfVIeJYDsrTm+y0Zm9ry5WdcexqKXMBohkIFw/13aCYUIotZdHBGTTdM7+Sh3VY5hTg2gEHEqYl654GGTANmw3TYv3Q792nNM2VoctfTpDKnO+Y+pG4JC3VO5FdVvIU7MjpBcAHI0WnkcOXovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC5/LyEC; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC5/LyEC"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81ee6b2da98so23105827b3.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784321975; x=1784926775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wb5kISc8J94n8IdvHv41Cz+DWVxzSUvjB7qt5LTjR6g=;
        b=FC5/LyECWcoenTWRifsw5+V138Cq0DF33CDN226tfBQNkmYdd2NqQDztzgWZ9Jz0zb
         fNsHB9NGb6ZDgzCatEKaWB/cfGSCqVSjOfiNQZ8lOUJDERcHxCAXydDGBjo03bP8bn2I
         eI2PUliFgpFlcn7FPSZJwrmZb2XRUsf5lyTPaZjSgwzpMieF0CC3IeUn63l5gV2T+u5X
         wAZmbVi4tA+PRAzJg4ik+mmuX1A+h/5uptVY152jvVAacY2i1I5b60a3bRrjMHd4fXbb
         nS87JLGB+w9dTuoubSilQ9CEVkfrte5iSZFgtKJBz8wP8reUpOrBTWjWTQ7YS/3YucTz
         wq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321975; x=1784926775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wb5kISc8J94n8IdvHv41Cz+DWVxzSUvjB7qt5LTjR6g=;
        b=V9/UuN60tWlRh6fMCSQwTqrsMpR2pz2M4WO1NYLhUY/jmyP7VLmGGCMfROebVCLLfk
         2OTa8OkfacGL1LCAKMszUwZGPn1VwzioDwv5RvaF3TtotZKH4FVR0z5LPGk/U4wEqbhH
         cTWBai9sZvGrbU9JYkXwRfT8kFx9LcNkCOWzo3lqsmyg97SVYDpf/oIyfiKS5DjDBf7G
         knEBHWLWDivwJoyeXlhelJp7t7k1GX25CiNscS7gxbe3ArV6rPQ26Ohf4YH++q9HHZlb
         qviNrPCUdaTDzm/P8VmJNW5yLHrtG9OonNkD9rAeLHVXDGVl0SOiir515wmSag3l1uNU
         kBUw==
X-Forwarded-Encrypted: i=1; AHgh+RrK2+X5dkQ+ChXnpSMVSHtaiarO5zS1ngUqBznMn3OoOjg8fxwV2cHPAtAmTzjJNT+D5Kjj1PidHSUw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeo9S77dB07dP8VadUkbUKZ2Vu/xeYefMWZfD4S+o20I2+5Yht
	Zu9EtaybmjaA/cuoC5BjGcl5Wsdy9sai1jE8M9behdvnfl9WZv7SC7s8
X-Gm-Gg: AfdE7cmDZ0fCKHd96l3nMmc5Ix0836qwIfJZVPsBkRtkyI8G2gbIJLi0gYW0yVFpDCa
	bJ96K7kgihz0tg+/38Jod3WhoDmo/IOpfzP7s/6GIGTWbfQsb7PMpX740C56ybxhvPmoX8Cuwdm
	V32bvyJgugPdrkKPgWVHOCP2qYG59vnMvMf4CjitJn8yDBTcQdl0LFmOO6rH1trZ/SdJqHdL977
	DsN63/NRTzF+4sD7yirjIDH0lpHxn/uKanaSNuKgNNWmrSyE+ouFXeOKuin5GSq0f2zsWjPiptA
	XAOP2U4Xn194zBFEVy2Nwx6eIHSELNm914owfcdmjOiY57x0Dl4xDo6nwVmyoVrZg+c3yl6zAca
	ch37iS6UgXvFfcI0tI/MYQHB1VXeOlyJbG+HcFMdig+0QYleFpvS2ZdHalu4kAt6yp6QTMRgdJ8
	Ap9P6U0CK2Gnxpm6u5
X-Received: by 2002:a05:690c:7204:b0:81d:7bfc:40b5 with SMTP id 00721157ae682-81ef25e17f4mr14846097b3.42.1784321974593;
        Fri, 17 Jul 2026 13:59:34 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef3e6656dsm20013647b3.0.2026.07.17.13.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:59:33 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 17 Jul 2026 17:59:14 -0300
Subject: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
In-Reply-To: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
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

The Analog Devices ADT7470 is a temperature monitor and PWM fan
controller. It supports up to 10 external temperature sensors and
up to 4 PWM fan outputs.

Add the YAML device tree binding documentation for it. This includes
support for the thermal framework by defining the "#thermal-sensor-cells"
property, and support for the PWM subsystem by defining the "#pwm-cells"
property.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
new file mode 100644
index 000000000000..14bb6359c91f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
@@ -0,0 +1,62 @@
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
+description: |
+  The ADT7470 is a temperature monitor and multiple PWM outputs.
+  It supports monitoring up to 10 external temperature sensors and controlling
+  up to four fans.
+
+properties:
+  compatible:
+    const: adi,adt7470
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - The first cell is the PWM channel (0 to 3).
+      - The second cell is the PWM period in nanoseconds.
+
+  "#thermal-sensor-cells":
+    const: 1
+    description: |
+      Number of cells required to uniquely identify the temperature sensors.
+      Valid index values are 0 to 9, corresponding to temp1 through temp10.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adt7470: hwmon@2f {
+            compatible = "adi,adt7470";
+            reg = <0x2f>;
+            #pwm-cells = <2>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+
+    fan0 {
+        compatible = "pwm-fan";
+        /* Connects to PWM channel 0 with a 50000 ns (20 kHz) period */
+        pwms = <&adt7470 0 50000>;
+        cooling-levels = <0 100 150 255>;
+    };

-- 
2.55.0

