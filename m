Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F12D97B8
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284052; cv=none; b=YlDe5OC5K2cH2rY/V50rQMs3aT1RmKPD0W04ozgWJQZxLgHof1V/LCNahveBWDBKx6eVcUEB0+EcGB9WBY6fSIX+p9xa6zHOB6vetPfdg2oEC3yXAKYAG+b7/IAvuyLptx6L72rRyd43v1ath6ingTBPwa9qFjfKVhsnsWqLTNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284052; c=relaxed/simple;
	bh=K+tQdEa1w/oGtmN7/A0Fdc7GiMO7t+lg3h7hsUuhzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwAwPv8B6VPQinOdTjurPJkxnLbyy3AbuI0PCit6Mh8mycUv9fsVcOO/+AX30etPe6kRgBKHNs4cIb33ILQ6bAkWDG4l4SArHLWKuBhEelabDQ95IfhA5xxPAc6u1x2Sbn7Ooq3t9FsCUIeilfP5WCN7KWrKuJojf1rFj60MQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4n3BHX5; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4n3BHX5"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-435153d9b68so3336077fac.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284050; x=1779888850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=A4n3BHX5azFO5a6qhD4oJ6jz5i5i4rDE4PoKzhoN1qumHAZDfXTKQDBBIcLVzibGSu
         FYZJGn1POvAeORJvzG7n9PxDxRxElV43q5I5LzJyYa3vsmiC2iPXO/NheU/WFGcTNt7T
         8HU5Lw1vLFcMt9JASyTgkuhIKvkMbOEqtQ5HAfzwVFCCcEojwpqoZDYe5caFhWFTwREr
         4/oIRV9v5d+9KLkhyY9d2C22w9bJ1I/kWZJlgplud2kPkjFryHEe3S5t9bpIhBvQ+Sg/
         x4PdrTVNsDDVZEjl7BZ7Wz1YpNAjomN3M5aC+kRbDcRWJVbHApdw6pYQWmlM1WPgIFWI
         ZBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284050; x=1779888850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=mm2uCYt3iPKkmAQZaoJpUajqWWeytIPvrKXnkbn/TXTUfX/Cz1c/VUFQ0fX9E8iJb5
         yRu322kuyrLaeOKTyMuAKttvlmrwoYoM7cPIiJ2eJ4zpYTGuEvyIXPdCu7NQ6gEeXNtT
         YxJAXDbWvhnJ1jg9yawaMrqC4BMC1p0mtoPuX1NXqK+Ila1iIZtp2qnj8uzCHN41BsHS
         Nc2C1YoHXvGzMqEKDRNheP+199g1IIx6Bwoscp1jhTzBl2SUaC+xUxTnvxYAZ2aAnpaV
         aP4eGszj2pZHu1RIeEljnZE2EQHZW7bwQrkP/ngpSZJaB7KxuSF208Kn2ePTGuFFW89F
         LK9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8McivB80qwsnR/Qntm6lQeaTEXHUP9PeloPJzql/8B8vPeCbrtBi8l3kG3Qv7lYE9WhrL9Pc+E0djN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nwADkv7cHkCivMGRagkvM//lMiRRPiA4oOqBW1XMPwi4upGQ
	hXirERF4I5kMIiDhru+wmPhcp2zb13Zk4LixHBCpcB8bDKZ8k3u2EnnONPT8J4zY
X-Gm-Gg: Acq92OEU15thMnKe56jDq+Oklg2AEkJI7Gn74HTVnCVMhb7Eea7VNlARG6ArRgY8Us2
	Ya0c7DWAFTUF+3CjZArSN7GHVE3F6jvXzs/APw2oFDnmMp+tIfL8K219MZodCdHKOKkYszptw6O
	ZAUthuOE1jgyvexEWBVs64VVcHDcU3LamfZltpc3LlnGGpyFRLoOWDeX26nN8siq6PRFrG2a+yr
	8H2OAT3Nsjn5xduW3zySx1Pb86Ve50rjsd3NSmOg1xP1zTTvZao6X+y+UYkBvMWrASn30NAW6o6
	ytYnL1reUN/QGm7fKI+3GQL5bitwkPWsF4NY+6hjy0Xj+O1/n+QBdTQLUpHN4QgVG1slXyBErzZ
	v+2zu9uZgh2f/u+LTj0w975d7KavofDqm7R1n/hXJaA2tWdttLVvqjY5SdEksk40Bx1eHE9cDkT
	p4LQ7FiEmw4+feur7i+3TT0mt/A5Qj1xVnlRpZ8Sk=
X-Received: by 2002:a05:6870:21e8:b0:42c:2042:1652 with SMTP id 586e51a60fabf-43a2dcc3808mr15993070fac.24.1779284050251;
        Wed, 20 May 2026 06:34:10 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:10 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v6 3/6] dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
Date: Wed, 20 May 2026 21:33:40 +0800
Message-ID: <20260520133343.1423946-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add powerdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/issi,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
index 5f22d8b77edd..f33c8305e464 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
@@ -45,6 +45,15 @@ properties:
       When present, the chip's PWM will operate at ~22kHz as opposed
       to ~3kHz to move the operating frequency out of the audible range.
 
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
+
   "#address-cells":
     const: 1
 
@@ -145,6 +154,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -157,6 +167,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            powerdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.54.0

