Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB24405C3F;
	Thu, 30 Jul 2026 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409181; cv=none; b=EhnV68eDWnDHFQNTE+PNb6EqY6Mur5eJYBLCP2KCNciaOtJC0aq8aBTyoeA781FhEhqyTZTI4EjQqcjBUmFppHXpA+x7rKCLEXs/OJCBBCD3vGjbsQuEFYohtwlp5EN0gshGvfEwyNl7zNZVW9ziG+Jt/prZrWeN2LY3/cYdX/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409181; c=relaxed/simple;
	bh=C+uGckLOdITLt/kUyMrN4ykbfgkVjGfKLErvQZgVqtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVdQD7GWkhl4+afBcRVvlEy7iN5lFTKk8j6//o4Ud0cL/TKWe0Irz5vyWury6DseGO8tNSESIMPz257/kZvn9A1dbYiyZXqSykGQics2qctihENNDyPAo9+ue6+sBHKFLvg+R+k01B4xiF7q5gd11688F/jCHBg11C7ZULjDMs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VacB9tOi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gbW8pyi4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VacB9tOi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gbW8pyi4"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785409178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IkO+u74+e9THgGCVimFAAwGehYhdaspeWH8EGEZnuyg=;
	b=VacB9tOi+pzMpXfBgw/3U8egioiKwX3ug2Zoh8Qm8PcAEQXJkzkc8j8v+//+hmFq+41Hbe
	87uqScmNEdhkh8cBm31Dxd8+yp2fhlx/91d5PwB0z8i5bG+PnLusfHFFPjEnFOD4UDAnx3
	Hu0G7qCX6nRjW3WK5Z1Jt+5YzmSuwgPzQecL+I3UC7kkP47q4KF+CfJf2LukD1Ib8j0wK8
	/VJbbU3XIXGV5mssrjUcSSx/4iO4UJA/LAaiU1+EF0qKDvqW/WItbNunwEMk1TDvffdGRu
	dqlMwKyebXBKpQ4IYM6E5QoJEDcdj200BwGsq0Vk9EQS+05RdiShR/V1oh/3+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785409178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IkO+u74+e9THgGCVimFAAwGehYhdaspeWH8EGEZnuyg=;
	b=gbW8pyi4/8cZcWrQR82clTfp3wXpt7ZKToqg+ycYxySfgY8ZoYWViQhs6311RD8a1Lz7rP
	wzCRwD+0WHz0m0AA==
Date: Thu, 30 Jul 2026 12:59:31 +0200
Subject: [PATCH RESEND v3 2/4] dt-bindings: raspberrypi,bcm2835-firmware:
 Include 'reboot-mode.yaml'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rpi-tryboot-v3-2-849c001d67f8@linutronix.de>
References: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
In-Reply-To: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785409177; l=1237;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=C+uGckLOdITLt/kUyMrN4ykbfgkVjGfKLErvQZgVqtQ=;
 b=vJybdRCTWN+mgjR2wqYQP5Se3mSCCAqQ6aohtc+0jLMdBI62XixPgwFE4RhLUXUw+I5axTMLc
 QGONTYjQ/nnBKrH+DWjruxXjU04gXyUWnoXgo8GKmJwtYTginbOqTrb
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware allows to set a reboot mode called tryboot
that allows to try booting from a different partition to allow updating
of the boot partition. Allow reboot mode properties by referencing the
reboot-mode schema. The firmware allows a 32bit value to be sent as
reboot flag so restrict the maxItems to 1.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..28c571386046 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,15 @@ properties:
     required:
       - compatible
 
+  mode-normal:
+    maxItems: 1
+
+  mode-tryboot:
+    maxItems: 1
+
+allOf:
+  - $ref: /schemas/power/reset/reboot-mode.yaml#
+
 required:
   - compatible
   - mboxes

-- 
2.47.3

