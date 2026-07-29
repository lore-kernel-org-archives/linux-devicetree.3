Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92830F55B
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300399; cv=none; b=SlZJYswFOTgURG0H5/cHxAw7Vovqh02PGh1zxUbVPOubyVxeKWA1jLnc+3uNFjACSD61Esu8u3UCjSnxCYNUIOT7715eKo4S6VrdWqCejMvCcTrbdLu0vKrQ6B7IxLDFkM3QQSZsGYTe/wp9hzFfx8+mwEwl7O8Ij8Ro2hPiA6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300399; c=relaxed/simple;
	bh=11Bn+MrkIAOgkwrRbb2qpLu8l/EytirIMnmCjvMjRYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxjNosaXja2lu/TGudTLmQ4zqCDo5hDtuwLdqTu88vxDJUbIk4oW/OWVKAf/Yvzr66WjcSEpmxHW9rMGOKjgOnrmQoRhaummEjfBqcag/PdR6+IMpcxsKrw3vN0PZDfh6mtjNJVDgbcD4BQDWDvQrrh33x7qg3OAwZeMyFdhCUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmCX6Q08; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmCX6Q08"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e7109321dso311107a91.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785300398; x=1785905198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzPNV24PItXqemQdsd0JvPXqyRjBFLfEI8T1ngUt8+o=;
        b=kmCX6Q08irPGzFC75g9SBqgOX/yDfoVadzMO+5Sq7sAm3CTURx/4kJFT8MgAOacgh7
         /7VMOt43MvnxRVn1mxgQKZMvLoWv3NpS66Dkrqmux6uvWgczZJPMEQ503AsTgKiR1EII
         QRr+22aN5cwaVQ1zIs46o3rBbd7gLc1vPcAInVd5w+UGyY1RXhkdR2VJpnwT0+fyYPMP
         zduJY9x/OtZMZ7WU7qtCPM8TejcevDqHG8+JtSv3NIy/umLJNUaoz8ZoO0xJ1G2wtgkq
         SAV9e1JuFJ81NiuAv15k26khD69rK25Zg+8HhSWXpodVyLHBgkbT/Vl8Wr7ZEUE6D84p
         cyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300398; x=1785905198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzPNV24PItXqemQdsd0JvPXqyRjBFLfEI8T1ngUt8+o=;
        b=r+uz8Obv9qYzFCWtfm37KqM+RINBQGAXIRf8ahuXn3y9ouU+6EWNcM8pTTU8/dWk/7
         8HzfrLmJhoWvVZ15Hz6d9RLGNHcxtheLM+/Jut3MevP3tZt1Ve1qJx77u+4ooEVAw1w3
         TJEdcq42fB/9ZLr/PofMYM/Oc6YK75OoxzRk5by5UJ0y+S3KqxTH1eAnVumRUb+lGTO4
         Qe0vsyX5ifgrFZqH+BaAcloD5TMbstmzVPWREuD6KzTLWomVFi+XsRmX+cZg4ink7EP0
         5bdfNCNA23WtNEJ72fKYnxU30QV2qJu/COkUm2ux9jTX7LwGSlYe6GrTlAM+9kFobVlW
         ao1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrRxIUATDrlPDl1jfRWlLQSkZzD/gGq8z2JZmyInaU27RL2wRRqKf/TxMM4+m3FHJhj7L7XE6/FTrx2@vger.kernel.org
X-Gm-Message-State: AOJu0YwyPrdLsw0FaxR57A/48K4YPRfqZE4ojPNjuMzIwpaNVPznT1dk
	e0iEA0vCSOe3wtLZmGFJ4IdjVae/Nq83O0ALoj6X7vv9b7NcSnwe4CRr
X-Gm-Gg: AR+sD122vFpc8lQ/QRPH0oiHFQDr+CbYjDU44oD0El5bF/BemAg3o2PFwsjmAXl41jX
	P1H/J1bvKVX0QPH69Sym3NjC/hKN2ndNbsTN4HaaBlNn5ihdPd7zU805Vxw3lK3wi1oMrOpipsF
	mKaZGaHwqFQ8HGC74JvKOJXLSC31cbRjodC3eIyZYdsub4aXqUWzR1JeS8A+/dru2x2BqgdHwR5
	hD97LOt3OcxVtsZXJ/gxWGip5zLgyTGXqq+gbbvjLHUfwc6nb2nRItHGKMCeMui/JAVgP2wdYCt
	FBUuNy6pvXA1JBn7sJgUSbpb88FkUjbq8+m1He6p5slCRAKJrrYCOYUxp+Etic54KeZ0tdPBEJ3
	02Y6RWrfyE3GeLw+V55c5no96prRDK0ACd3GKNHdl1QF16cwNvCPPzdvYw6oey/4J33lDEz4yTK
	wAnwHKihYFipn7cwgKaHyuG9pLyTKiP6ht9iLdYS6gjcJQkYxXCiPNwiCeteV15ZR3HPyHPT/qb
	6z2
X-Received: by 2002:a17:90b:5150:b0:38e:21da:9257 with SMTP id 98e67ed59e1d1-38f6a447a10mr5707584a91.37.1785300397876;
        Tue, 28 Jul 2026 21:46:37 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b6d14bsm4730437eec.10.2026.07.28.21.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 21:46:36 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 29 Jul 2026 01:46:09 -0300
Subject: [hwmon-next PATCH v4 1/4] dt-bindings: hwmon: add adi,adt7470
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-adt7470_thermalzone-v4-1-c14039dfa0e6@gmail.com>
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
In-Reply-To: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
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
index 000000000000..06881e521111
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
+  controlling up to four fans. The fan control lines are modeled
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

