Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB23DFC67;
	Fri, 26 Jun 2026 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459312; cv=none; b=pQdJpjCAMURySKWfb/xvLanRGfN7GHDfBmEbQeCXeage8i9VkF9A42Tho61BsFyuD60ALFYsc/Ut2UmpvDbLXFAGwm6MARv8hcFtbgXQj589YAq75xZAcidx3+BKD51q5g9pw+EUJvTF/n7eBStgSh22pAVGXdwt//5f/7p6qxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459312; c=relaxed/simple;
	bh=9/ZQNCq5gJY87Vlwivg99tckbQQbIWZpKEao6SW3Wus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l72b8jh5BhNWlkIQA1XLTI+B92uzNRC1gxKVvEIgFXQbyRTbKemzl3LJAEfWTibcqBXDQioZfkACjsmI960FY6BL/+It3UbTkTblETR5dFQcvLOXxMkHuwnBfMu8eMEYo3wBBq0C6AgSDkNpixHh/WSFpHrSDL1UY29ACt/WmOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yoxMlw4U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MsbnVEMz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yoxMlw4U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MsbnVEMz"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782459309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1nXhp9uh5yT71pzm6kmUN3rkr3k2dVlUOP+VY4lLpU=;
	b=yoxMlw4Uc6+g/Z/qA56yYQU4zmwvgSrC4C0ABFcNvfTPKCd3rBgTDshLxB4mmeIZFNavdn
	rs3eC6aUbBlisRu045pTI392nRdFpgd+rwy8K/hua7H6h5V10bRuzS7PJd6dlhPRZ7X3Tl
	CL0Y8DkmSoSzZk4M1I2+fH2HzQm8cQ0DXUe0IIdoWmUje9hEdmC87wBh+OOQqWiVUTzPYC
	wLiGJ3Jtnr/Ha5mw5c+zCw2YDBj6/5avm1iqBWgi2zXd1Fyj1dzlIq3GeW8cIzakolfPHb
	lmPvkUcx/z5maX58w0hmGOg8TDp4s4Ssdnh84JyAp2LkDgbIOQ1LYwuenoH8bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782459309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1nXhp9uh5yT71pzm6kmUN3rkr3k2dVlUOP+VY4lLpU=;
	b=MsbnVEMzdVCCp+HzzBz7dHAEoCSH7cKLW8aSYsPvOqQ6jrEI/989h2nFDvJYtAyDbTYdka
	3AsGdKknZmukUtBg==
Date: Fri, 26 Jun 2026 09:35:05 +0200
Subject: [PATCH 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
In-Reply-To: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782459308; l=1100;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=9/ZQNCq5gJY87Vlwivg99tckbQQbIWZpKEao6SW3Wus=;
 b=lBV1L5rIbQd4Ur3y9gSNPOEuOD160vmFYq7f3X+nbyfbIw889R1ezfKZQFu8IVU2p5cnAMMnx
 r8HCUANasTPABneSf2L9NO+q8borCQih6yctV0EjZCQb6G75qtXyBT1
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware allows to set a reboot mode called tryboot
that allows to try booting from a different partition to allow updating
of the boot partition. Allow reboot mode properties by referencing the
reboot-mode schema.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec97..30b490e0d9fb3 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,11 +133,14 @@ properties:
     required:
       - compatible
 
+allOf:
+  - $ref: /schemas/power/reset/reboot-mode.yaml#
+
 required:
   - compatible
   - mboxes
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.47.3

