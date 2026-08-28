Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CC5389E07
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910920; cv=none; b=HHuPiqEiGyJakMv4GUh5/1luWhsVZmoHLmnlAkT2J2kV5ZTqscxJavfeS3nY+CiX98GpaOnarC9+un/8YTYK/5HSLtdKb3Mf8Ct11XU9h4cpFocmShrbTSOHMqQzyVE0t/CDiYuu7ic+yu/b07MtK1SfdXHjuA8FDs9g1kfx/SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910920; c=relaxed/simple;
	bh=H9cY3HUqGT9SKI+YapI58fZaNOQJ3Bii6JWiY3YZ3sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLHtRgcL9D3X+806jj+7VJBYRFS8vfMlHBXHFLcFfHecRCPNchQkHhCtZRqp/NbbXsh5Dw/odIcp1wFWFmolY5iqgTaLHj1Sz2Yu6aK3tTZ/tAZ3xmdLDB9XVplMfNzO5rQQM0Wec6SToiRAbdRcF7jvEXtJZ9PsBhBT8Eu9SK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahmab0ox; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahmab0ox"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso833373a91.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787910918; x=1788515718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkZTYKwU4CakfzDfQMMLG1JWh0tvz+y04iItJyhiZG8=;
        b=ahmab0oxT8Fa6k5GNQSMwTjCqCY9Oc6v7Tk5JV690yv+0YATqCa8Yr/9eEXhJFJ1Cd
         yUhwWK3EDEoGU2PZRn9pjuYSuscyzz/TPybdKIXvlbeGNhoJJcBBPjxM8r/kHQGC1T1H
         z9qYUuZhpDSof/UsWlE/SYok0PebPNrC7EWS+vfrQBt8gJTc5iVyhwEbdk24fk/RdmPc
         EHaAHytu+r6JuaTllP1UHCDn7honIrtv/xbX74OlW+a32+W1xLrZmciTZwjBZ9i6K/gE
         +hL5lGtQ2c3ReWYscp9HV7XfeOQN46H+x/XAAE0fW7Hkn1CKCWU4b2YaNyA+Dg+UmLjG
         fkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910918; x=1788515718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkZTYKwU4CakfzDfQMMLG1JWh0tvz+y04iItJyhiZG8=;
        b=brug42kwcOZXOee2rJwrr9uZNo9YakWWQ7FrMMLdElzo5gJwS4uDsIF997gIs1WiEX
         ZQjVy6ZBgrwIIFL638/vOVPCXxE6qyPIR5sYlxrkmkmF8ZFDjXu0iARbP0Z1wRGqn56P
         yKe1iPRnXDzu9KbgrrNk/Y1/0nOt2QYhjMj53lv3sxsXssNzNjTIdscMUYprbcuOW+MP
         44op+Vrc8lPvQVcaxZGlXygEEsKxs7Onb1GvI6FR0C5qmnRFBIYoMW4OKmGc9JFCQchX
         ea0TooSsm5d98eAmWeltYgtGtKHQArnXlNYRpjNGvwNkRFPFD5F4RliIXR1d2ohGiKjM
         UFcg==
X-Forwarded-Encrypted: i=1; AHgh+RqQ+SH+KS5GJNcJkbKWWRDmeK6O/56drAuG9HiU3yDjrYFSRwyecUbKcdBf4cViECDC7Y5YX9P7uvwO@vger.kernel.org
X-Gm-Message-State: AFuF++nPZTfSuGH7qURgsrsGgmvYDHnCFh5Dlskw2sLUbShNRKtWnq+1
	x+FuVhJacQ4axec0YN5NR9CWlZznEqgGd1u2roDgu4H7QHlWqs+goIH1
X-Gm-Gg: AR+sD12KCl5wYE6dzHSOaqEN6SKgxzE4aj3N71gydV1cn4YoT+P3adpNPl+eATKbJBC
	7xcavqO6Vxui4o3+aK7Zfl9k22VkvheD8Mk5iwYEmAKs+BZ2K9qwFQsFFRNC27RTMiOL2Qm4lpt
	pruI+diMhCR8D+D3aNgmmaRL4LJgGds2jH6v4+FutuFgZOO0eqdVeGpqUsv89Q1IoR5UvZPjirV
	dY7EkZgVhxm65z8Jr3VH67tuMjLaEnfJtinRlq6jBuRJMM80lhFvaIAbIzzZ4RAc7sC2uTOinSG
	1yQdCh6/vwRPdy3BzMeEr7rM0U2jM4DwCgBs1EozaGQQ87ipHHHMFkZCb6kgRHChFqqCEC6z2mX
	H0R5KfnxME9sZdERfNjTgGDMz+aZLEJ+/iP+Uz9iv5XIa8U6NWvrQSvLFExsxqYjxJrwLpbWGfY
	JTt+VlOJ3pzpIQVSOGG240TAWY/jr6Zb7ljFYFoO+gt43CcK+P0iyeDLPVa9BxXfFpWi0zrTkKH
	L04fGKMk0kjGFveQnp8sht5uvWHJdnHwFveJZ6ylYtXDYFY/1B4
X-Received: by 2002:a17:90b:51c7:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-396d0f52b2amr11522464a91.15.1787910917577;
        Fri, 28 Aug 2026 02:55:17 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7aaaasm1872577a91.6.2026.08.28.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:55:17 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
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
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v2] dt-bindings: fix typos in various bindings
Date: Fri, 28 Aug 2026 17:54:59 +0800
Message-ID: <20260828095459.834657-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
References: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
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

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
v2:
- Use consistent identity "Zhijian Han" instead of the login-style name
  "hanzhijian"

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
