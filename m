Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF67D47CA71
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309787; cv=none; b=Ad8S8ez6MrE1IgPI/WMaLTqU4c6Ho3qKC7FUT8coxUQ5iINljuU9Q9xvI/TF1UkwWP381tP1GGhIAynto+1S4RBggrwzahFEk7QctfhpIN3lDWaNrppThinDXv9IjaLda1EPoshuYRjmtrbUTKN3Dr7EjlpwRlOZi9Y0j+QosI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309787; c=relaxed/simple;
	bh=Hszesw6yVqnZ8OpYpwPtsWJaTs2YTlaai6RAYcmBCoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uvfchz8nWBrW7Q5yL0mkDYO/t6akJU0s2Gu5kb4bA9NVIsBnEXCo/OsiaEMlPAmNNITk2kYMYYwaaxWnzRfMX2Wda9jqUpmO3KZAXFHvFsxE3BB+h2urtgM8CwH4fFVx3DRLC051HIKx9ezvw7KkXZwDPF0MXfJJ633KHDyiaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scX3+nWk; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scX3+nWk"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38deea72eebso791698a91.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787309785; x=1787914585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjmvvNDAO6X5XPPRpkVae2cr18FJFP99cR7ZCryUBd0=;
        b=scX3+nWkH7deRHF+tYx9TbrYJ4/5GCQygA5h6NPUwcxix/Q6E9n2BlgZ0wRLxwslUF
         HXbCqI+8xYhFKjmjddfLt0BUfRn9F1cggrYAj94RpoT/gRmWdkOP50C1CAeuFwi/fmh9
         fHUkjCdVvwlr5Hlq/PlU7Y+dXcqu6Rhl/reN4oE1MKmOtuqlTPJAGW1Z015c4VHhy13W
         luYvF3Fln+sIpfhwQTRnb6UqG/j3o4JZxRKaKq02FnLZUB7ub6j3M+2zvmEqi97Zbgex
         DOM7WmmAPmmsGpPFOFSmi1D6w5NVR5uxXP2/IzT26VSbBuiIm0IgfSplJXlJ0j4M2O22
         sT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787309785; x=1787914585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjmvvNDAO6X5XPPRpkVae2cr18FJFP99cR7ZCryUBd0=;
        b=qZmJIc4GXZHsdHTeh7kJxekAL9xG3oj0gzy5Pi7QbUV4aWA8aaGFqgy7yUXoK3Ueub
         3DqNY7Jf++Mjfl2s98yBHuibpulBQkxUAvVOhea/XL950fKSDqA4gvRP647QmjPXGO6y
         XkBD66UbbT12e1zC8eMH/nRm8iRIUQ8eJgo41RDqUv1PaBTOuIT4Pv8zYfaAaOrlLUIF
         ZGPb4T9aB1GV/VF2zV9F8ziREShRhcTbMWrv8aQCEBuyQpXzSKPhj6e/Eni9hdAIMPn0
         1r5vnVwwpo6Ir6Uvbzuuv7V8DepMmO0MchKUevKUvP2GyoRDWzayhGw2mc4CybMP1C1Q
         +9ig==
X-Forwarded-Encrypted: i=1; AHgh+Rr86rIgU7nYcRmMXIkV5xKeJHybPCCBQSBQHSaMFOKpaBMELNRdTh9ZokDuDI3tXocrWera/PxsvfFe@vger.kernel.org
X-Gm-Message-State: AFuF++ngdTh8O3ncfIACmD/2S9B1Ygf66SODAhYjbRd+0GqHzBcgY6UL
	f37JQ5FoA8XbEAbJpUPxbLqcGrRF1EJ+KUoAMC9fChxYHI92gCWt53/n
X-Gm-Gg: AR+sD10LkpgBuBqH05p6XoIhDkzenGPQ7k/6k7fF3T/QRDhv9UC3zDiwSVktfVWDFfo
	8xpoShhHfRxSGtZ8e831ZaPkDAfsl/IBl3TX8RqxcYhtXwWgVBSwTiqsbJM4YPLUTbvDtx0+4/E
	AgcyM32fJY2lYw/Ts6vwNzJjF/NB7E9m6J7DS90dMCOL1Nd8VfLB607TbKdLHhbd/9QMIi0e46c
	iV/mYbZODBR2RNWtxo59zmatZEf9AjfWhuqq29xofmp3IctIjch/WM0UDZOhGWNWmen5y/GGcBK
	RJDtL2/sKXEOUnxZq0ZnUovAp8369Qx1/H1wfDjlNyxqBSmQD31N2KzxN1vFHy+iZQboXyxG/Y1
	6xkmi9VyCijp09ZcMzA3NdElPAZjvT02oemNY0hqotytmGYuT6YTb3yfOnh/GNkeFsj7bX9CsUV
	33kleGtp3mB3cDBllHCw1kba1gDKpBvNKeYtHpELXwMkd16OkXW/aoUUrTOYp9XpVnF3CHKeueG
	sGOLVF/Jua4nX6LOW+Nj/4JhIHuyr1na6IOmmZK2R8FxJ/HZTGq
X-Received: by 2002:a17:90b:314a:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395c3522213mr9208574a91.6.1787309784878;
        Fri, 21 Aug 2026 03:56:24 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c467980bsm2692579a91.5.2026.08.21.03.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:56:24 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] dt-bindings: fix typos in various bindings
Date: Fri, 21 Aug 2026 18:56:05 +0800
Message-ID: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors found by the kernel's scripts/spelling.txt
and codespell in several devicetree binding documents:

  - "curent" -> "current" in adi,ltc2991.yaml
  - "deivce" -> "device" in zii,rave-sp-eeprom.yaml
  - "ouput" -> "output" in delta,tn48m-gpio.yaml
  - "redudant" -> "redundant" in trivial-devices.yaml

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml    | 2 +-
 Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml        | 2 +-
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml | 2 +-
 Documentation/devicetree/bindings/trivial-devices.yaml          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
index e3e668a12..698cc14b0 100644
--- a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
@@ -14,7 +14,7 @@ description: |
   details see ../mfd/delta,tn48m-cpld.yaml.
 
   Delta TN48M has an onboard Lattice CPLD that is used as an GPIO expander.
-  It provides 12 pins in total, they are input-only or ouput-only type.
+  It provides 12 pins in total, they are input-only or output-only type.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
index 1ff44cb22..2210764a8 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
@@ -49,7 +49,7 @@ patternProperties:
 
       shunt-resistor-micro-ohms:
         description:
-          The value of curent sense resistor in micro ohms. Pin configuration is
+          The value of current sense resistor in micro ohms. Pin configuration is
           set for differential input pair.
 
       adi,temperature-enable:
diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
index d073c51c2..e0aacecd6 100644
--- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
@@ -27,7 +27,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description:
       Unique EEPROM identifier describing its function in the
-      system. Will be used as created NVMEM deivce's name.
+      system. Will be used as created NVMEM device's name.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09c..719b82490 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -186,7 +186,7 @@ properties:
           - injoinic,ip5306
             # Inspur Power System power supply unit version 1
           - inspur,ipsps1
-            # Intel common redudant power supply crps185
+            # Intel common redundant power supply crps185
           - intel,crps185
             # Intersil ISL29028 Ambient Light and Proximity Sensor
           - isil,isl29028
-- 
2.43.0

