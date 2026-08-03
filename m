Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F19374A1B;
	Mon,  3 Aug 2026 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751611; cv=none; b=K03EXSGE0X1kfZbXuIqHOud884g07Mmyt2IDpu8O32RaqDYODygDoP9H+Ag2IXdTDQoc+692wWkQvQ7JmCcFgJJuNxLAzbSJgAJpanB7IeR30BGGbvt1M+otMmf5CgCqwmrtDR0b9DXmJpNa7mKnZyE7YE6FwljAhw6OOKN100o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751611; c=relaxed/simple;
	bh=LYWeZ2upKWS8B2/ERLkNN+fvSd4smTBxK5Abj2B9biA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFqENO/5CItQ/OIvHLQKa7sIQ0MKW8vXPLvzqUoeygBAHqW4NK5KJfd0Nxn2MXsZWIelIuQQXKKzM6LTIQ7ClMQgCICxUbpNxHJ3WEB0cBXUmlvjwOOUAnOagDW4Pm4zp/6r+zf4+4tcSnrgmSLZE8Gh7Rlsq2K3oDjV51G5rGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L9h67yDe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gHvG8Fg6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L9h67yDe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gHvG8Fg6"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0R7UvEnhCni08A6zvyB5ypdO3lgXpKbMitNA1dEJ4Q=;
	b=L9h67yDeIbfzHmzFdZukIwmFnggpBJvp9AoVxEVo+MFJu1LYIGqe5LRePiZ/nCCxJuKXWn
	all87GKEjWrlFjErAV8e7EkCjKVXb7bSd4bUk5KCqxmGYZlZ55J7XA1pOFmGfIPxUPyCvy
	b9OyqC4PzhJB6GTeDxlZO9RtJXmDKfwks8+weQnlzet2Cm3uv/TT72eQA9rizuQGFIgmRX
	6kt8nuJz45Yp8NG5GF0lElXVopwK7HksZ+Lru0AWVT79SmgZ70mxZVh/TU2N/GrFXBgdgc
	XJJkDM/rpw0owVNfy78vn2AZAX6Ka2dUWidQMqnQYr64TsTzW6dq+KZYBVcoSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0R7UvEnhCni08A6zvyB5ypdO3lgXpKbMitNA1dEJ4Q=;
	b=gHvG8Fg6B7ZlxZ5a3YDJ7jIpEIVLx+AUjxWKoQEZMjHgvrem1UJXv98sfWwXy7yxmhYWcV
	7JxxnR0b2KxBLlCw==
Date: Mon, 03 Aug 2026 12:06:41 +0200
Subject: [PATCH 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-bcm2712-d-stepping-compatible-v1-1-401934357a44@linutronix.de>
References: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751607; l=1077;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=LYWeZ2upKWS8B2/ERLkNN+fvSd4smTBxK5Abj2B9biA=;
 b=gkK0yU8KAwFOk2pPVSuHRdmUsI17ApQ2RP0YRm+e0WKA1in5BBqe69EC3+myiBNHJS6/+tuy3
 OUeHZHyyT8TBhL+d1Brf0OMbwneDF4A1DI5csZ+36oV+Bw9nmwbUUT0
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

Add the Raspberry Pi 5 d0 Stepping to the schema.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 2729a542c4f3..43729a887f84 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -25,8 +25,15 @@ properties:
 
       - description: BCM2712 based Boards
         items:
-          - enum:
-              - raspberrypi,5-model-b
+          oneOf:
+            - enum:
+                - raspberrypi,5-model-b
+            - const: brcm,bcm2712
+
+      - description: BCM2712 based Boards d0 stepping
+        items:
+          - const: raspberrypi,5-model-b-d0
+          - const: raspberrypi,5-model-b
           - const: brcm,bcm2712
 
       - description: BCM2835 based Boards

-- 
2.47.3

