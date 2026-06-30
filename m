Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791546AF2E;
	Tue, 30 Jun 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853175; cv=none; b=hzhjW90GJsHGFvKRwIyoEx4+08sq6uz9uEn2OEYz29vUVpc3olk2N1/29iccqjlRLKpiOUoaVQMKkO4BasSK9XfbjIsR8z0QyvhSDEdSz6L6eR1z3V5GuYSFvvWjcc/39JPdn3mWOoVd6RBTyLCEYJMBsRgM9pM00UIdniX59uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853175; c=relaxed/simple;
	bh=PNNiSTCi7EhpAclKeO532TViWIYhN8h+fgNrfR/aiXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7mX+XWGv2sJ7vrIHl6jsCKfhuBKdARqdlbYKJGjFqIyId77j5DQ4IzOz7paiWSxQ0eofomCC4HJ3u74EbS4Pqe0WEcq72VSZXAgatWN2vkp7Qm3XJAI+RgJfw2YaLGR11L0HMBQE+/40145h9JVEp1Oc0zY9O4JWkGVH0/UfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jV/r2iDP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=grPEsb7i; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jV/r2iDP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="grPEsb7i"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782853172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jq2ATW2JSNHysJMJorGQ3YDIHg6LPeqIwvJYtvUnwf8=;
	b=jV/r2iDPomCyIGyT3bclVSqN4Uz7/VGsP3ffmowanT7Utgmw7/9O0mZqNsdQaCB7Vt17Io
	rvIc5V+wAlbs+3MBWIgnixdlsHepw9mkWUACiQr88soc/ANiklACKdUtp/C7GLuTtSU3Hc
	vYUW4UdXGiz5WzMcwn8bmI81EsrJtc1ILG7TLTRcygs6kNABv6THT3Qax6w8cjVV2k1h1g
	+XmCqVyATs/U4VuJzZIVkaNETIIDOE15cYa4maXyXYZDR2UFnYsA+L3uof2TIIVzlqVisQ
	4ksqR4HHkcg103fbg097bhxRAwGGLuTkzzet7PCxodbK+CG7434foyVSai5+yQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782853172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jq2ATW2JSNHysJMJorGQ3YDIHg6LPeqIwvJYtvUnwf8=;
	b=grPEsb7i2JpEMZuDo9sS5jTSHv0kGUGLPpLNNCjHLAN+IDiOhc1mdSrUhy3bs+WmXhV5DJ
	hGSIAMj2XgPkMoBg==
Date: Tue, 30 Jun 2026 22:59:28 +0200
Subject: [PATCH v2 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-rpi-tryboot-v2-2-f68d2dc6aa27@linutronix.de>
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
In-Reply-To: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782853171; l=1166;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=PNNiSTCi7EhpAclKeO532TViWIYhN8h+fgNrfR/aiXU=;
 b=9YJyLntrGvo+CpvtMU9SzUYAdKoIjLJlaUK+K0FaqltIg2LL4G8XghH0NmcVVUmV+KVFFELgy
 rqu/HSBw1F1B9S5xmsRJMrXQJUAIhpaBUpNmqZqux2grnJ/PAgsyQXv
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware allows to set a reboot mode called tryboot
that allows to try booting from a different partition to allow updating
of the boot partition. Allow reboot mode properties by referencing the
reboot-mode schema. The firmware allows a 32bit value to be sent as
reboot flag so restrict the maxItems to 1.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec97..28c5713860468 100644
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

