Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6413603DF
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245926; cv=none; b=BLPUD19sUSh2ghe8NeG5zufjzFTNbOsv+n/BtBZiX3HFr1PLiDIvTazd+wxvLFBzQ0zVjl9SxzMggTToJO8V1xRrk8Wy4SGWiNDh3riykbFN/wWWVUwjL4dfh07sCNoUK5lXh0o7RFun4WJgnLJFeDYN3eWXKG/36wXejmqqC1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245926; c=relaxed/simple;
	bh=IgPi+KiUlvSYzb5bOFDhIuxsi0TzKHGTzxqKb+B+qrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCSYU62o8s2zGWgM9PT0kAUDWk2gFaW5MYJRzvENQPZXiO+mPR4aF82z04LVorodNwpPA59qB0uSfDiIorkpEYcT2DNFczSubMA/S92nq/KusC9ezaQ7MSodzzo0ZoO8EiWYdpS5q9ogzXbx+aY6efWWF4ZksOXgBJ4ncoDnjgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHdQy4t+; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHdQy4t+"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0ad52830cso3012289eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245924; x=1778850724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUGu5L00lvWoEhryhoDzPdaQlgLIQeV9TJd2A1wMzug=;
        b=gHdQy4t+fkotyWh9ZytQMZCycciBZ0ejEuiHChqAFzaQ/YNgP0eRhXi9id+DBg6Kl6
         toI7DE1IMJy37QmukaN59zI4Ck1UwqnWm9zSSl9x99BuX53ggXzGdnwUfBseMjt5yQ+W
         yZVMUPbvAxXbXCII8TVHCYKLOlQ+1u7vP1RnYqO36/ZoivBOMewRASU4qLPK7HtocpQ6
         gXJ7BpEToK3hCOsC4MZayI9Ugd3P9WrmM2nYKyXuwxOMknIc9jq9yzHDHYp1I8iLoF/U
         aRHhQ5FSduHGuiSb0+SWYyt+KSBITSEOrn7UIyALz/COHIGdawejdUgraMZc3I22hvB5
         J3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245924; x=1778850724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FUGu5L00lvWoEhryhoDzPdaQlgLIQeV9TJd2A1wMzug=;
        b=tKs/l41rHFnyg4904+OM8/aBGT27ZgZNEy3x7+ItZcgPWAt7YNBOa8W779x98rGD95
         pY4sw/CQ9OkhSZW/p097m/blFncusGZnU5TzcUwWQtIgKtdOWziSLkfagDqV/dE0fQvG
         l70WDxEIZ0AaOXQEqSbL1UiRPgd1XGcMbhzx24CD1B5WXynYl1XnpTfl6enENec1npJX
         mATdoZ2pIvw2psQ2YmN8LFFopriaQg09mpf5elzJ58rRSgTA+2PwyWsAScvdkO5qKoM7
         uJafuO+8Mps11QCbEsvIWq/UJFlZxT/bsPiGViQn7oaXoDCxwOiZebHt/tNDeEI7c0PR
         g9JA==
X-Forwarded-Encrypted: i=1; AFNElJ+6n/i4NsjjoR+RBY+ZBPYoKDs/HCxOOt9XscAnJk5+O4F+gTnlJdNoQES/YZ5ajHLFcO1TwZpFrgAT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy+tIFn1y+m36hF8whu/6QnVaHl8SZOdV37TZLbs1h/zNOimGe
	c0jVlyyl6L2jKitlymIH+DYI3JkzoONEddYrf0QVQHTQ2jpvPSK4vT8L
X-Gm-Gg: Acq92OH3lGzjmIfkTe/l99L2WyCdGL2HgkPriOAiUFLJau1Jgye7zwn1L+3W7WBuvTO
	OICLhJuYO2NQ9QRh5gibTxrAGFa+Odqp92W9T+OLZd6u0JJBsr9Oh8IHBV1RqWGnCNPd9blw8oB
	taw7qctBStD9ygXu32d+3K+6WdK07h5GiBiLL7RRtjPGBNRK5rpDRY4GjGC0XcntVcedCsiU6om
	CLxjCwWbJU2D3V9iGMnxxyKQhpEvRxC1jY5uKJQy7+vXmjtfjzGadDuvLOe4bJLvYjvMH1mtVlm
	vCr6DIVyfcp9xX2M7sP/BiTNDGiFSkzldz609GO4EaA8KiGueFbcr5TWO7hAdeio78mP6CaylKV
	QSqy0PTXJ3utgBiW3YiZxxGQEXn3gSc250jV2avgtsgshiL+uwv4/iw8i1T/Pp2191JgXhlUQvj
	XQYIHm5U92SKseWISgAw==
X-Received: by 2002:a05:7301:3f07:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-2f54a77fd56mr6219341eec.16.1778245924141;
        Fri, 08 May 2026 06:12:04 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:12:03 -0700 (PDT)
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
Subject: [PATCH v5 3/5] dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
Date: Fri,  8 May 2026 21:11:37 +0800
Message-ID: <20260508131139.1523597-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
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
 .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index a8ed62fd2f35..1763d3a17168 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
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
2.53.0

