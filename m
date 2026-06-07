Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361AC2C11F1
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845632; cv=none; b=bDohXjIDzjWkzUlgAogyagwwERb0PMIB8Bd5xY9rqiXQfOFNr1yH/UYC3oTzuJ8X6/P/kaD3ECwaPsYneux6WCnttDWBkEOqxq10PxO97ZSRN7TfpGW/JVcReeJTnSmPMFZxch1zGCpQ8PGW6IOEnBFfTHTWukQal3C5LsIudtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845632; c=relaxed/simple;
	bh=K+tQdEa1w/oGtmN7/A0Fdc7GiMO7t+lg3h7hsUuhzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKFdaXEMABdt55uhFmQ1/Ss4kNVgtmLHmo1jRgaoV8UqjoBMtnK7ObUeVgTLSvBCz3qq6kopbSZbGlbXe/vuKfz4HoC/LOK1QY6Hejg/jpnFB/x60mv/osSwrhht8aDRsOVdIWLLA66gvsrHBobCnMaojhrQp7CsSPrrgh8g8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxd7i88c; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bxd7i88c"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-372b4330deeso364641a91.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845630; x=1781450430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=Bxd7i88c2CuuGqkXvIumVvqwG0E2RP7RTno4ndAQi/XYrJzVPB+if8cX6xVEjZcW33
         zE3b/tToUCwbtY0xOza+LHiHHtgOFCWb8PKn6Y4xc6Y580Hy59YBe/k/e/xwH5iLOkxp
         wRxFiKio41aoXHHrtVsEnLbjU2eEWhyzNQ2Neu6BPmmxY/XwW3fwg+fTjIqpsQBPvE2C
         RraatU6jbJjlo6xjaIOY919ZfbbiediUe13xwxy2N/2UoN/S54qqAluUvUyRr3DUYqY+
         LiRtpNspSpTMw8/ozwP/syqRXo++cRW3IC9iWHMosT1ZIH6qpIx/olEFK6MlLvauHacE
         Ci6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845630; x=1781450430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=QHjJG8ZNc/QX5r8+fBmrkWMJ1EpTaHiVTx/D8a2dyGACHEDzcW3dt4ximKz4mx3A/P
         7FXlyjB6kRwPfPz40UdCQAypSSBNlsWn/01uZOtNT4/5kWkMpPC6aFliTZjziFoLPKlV
         EIdQ2gEuZHef2BJ9sVVxxw8Ev1DnezwlB9dRKOfpW6JKJ3Xlt4Igr1FBi+aDyN2hGy4F
         U+OAhtXNkC6v+pNPJtSNQLxPP9WCJunzx9Jw6kbbIZX8GjHtZ+28DGajR8BZrTmYc4h8
         TBa6yJkJJpBNobXtuhdCKA4hddmn6MUHRIc+e9/zikjdxzggbZpa9t0kKEiSkgzBlD2V
         +p0A==
X-Forwarded-Encrypted: i=1; AFNElJ/AT7LMX2ry9iXt3sFNkaaiCFUwqfUqydL/78VuuEsHIuLQEB/vc8JkfQK+ohmcBFNuiDPRlE2jT/lL@vger.kernel.org
X-Gm-Message-State: AOJu0YzwyhKscjf8fwGkwJaoCRxkLhb2kJqbIYHPj9tU3hnX2ch+2FWz
	ipr37LL3MgUtBIvhte4R4B9Xqz7LO5lk84VweAcjsa1YdBncDzG8Emgb
X-Gm-Gg: Acq92OGFLqAZDsELgp33z1U8MgMYgB1SN5lwkRvd8d230/h6tfZuSUIj+UsGgseXZwG
	rUSp4hYBljfRmtXsUi2SdS3heisq61sYXWL3TLv1z+plzLEA9pVLyInQNU1uEpoNnRol/iF0KQ9
	qDM14zLbKlGNPHaUBdju71C8zkltPhB64tBfxRzJiu8RUeUhfANQPfffR6cMJ0/aRRC/n/WT6am
	YeICmrzaNrVfXfFsmFIsEsZlMPDMh2jV6FOflsHjK0kwH9NoFAZ9Knytt9XNYXP6GfjAWYdj+d3
	AoRbVbhpZQkXoF4TigjlKkuZBzlQ6ckfub/LBrzC5hMROOMVYvjldKlSFw4jPKn2AJl1gGk5M/E
	Mxf0dMAGYxbz9GU1jbVL+lDhMT5dEM9MYmOI4uR0klfr9HI7jVtbtjW9N1qgor0/EblJkkTRPOQ
	3ur5hAIjlBMEePt+kPW7rzAYCvl2+stWAxa4pzt8EP40rGVzcsCA==
X-Received: by 2002:a17:90b:4b04:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-370ee5444e7mr12488010a91.2.1780845630473;
        Sun, 07 Jun 2026 08:20:30 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:29 -0700 (PDT)
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
Subject: [PATCH v8 3/6] dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
Date: Sun,  7 Jun 2026 23:19:59 +0800
Message-ID: <20260607152002.446617-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
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

