Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAF53E0088;
	Tue,  4 Aug 2026 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849248; cv=none; b=X66EIh7s8+7IDI9UgiReSC3D5r8kUmiZ78FmqVJbouYje2rWN7Hb9xrDguOPZrmBGHVftmj+allzBVOaC1bbQNATf0EJlxNozGjPd13+IdYB2ca35KyW9bL2unSC7RiKBBbWgJ8e49oVJoA5INLgM8ufPPw3c4+/bDByklRlyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849248; c=relaxed/simple;
	bh=/MKWKONQK9pvBmbMb+jL2ulg4+Hsp+n+1Tof1+X5ess=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBKnsWFsGZ5luicGh2B6o+dcrOp7nPlaCHnx0jaKb1IPAJMGzIDAmN+gMuKCUMIkDRhlQzgL3xMV42AhmN4GmVayMlwkATWR3NhY7cC187VLi3JG0SjHWMsSx6cPzNTT0aQJacjRYUKd1iwoQpLygKjVtHLZT8Zqz5/SzTqcTrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1+DPPkTg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/NhH7eej; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1+DPPkTg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/NhH7eej"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMXBx6JiVxExqi9nyxpGvBkZnmNfKmRnM7bi6imU1IA=;
	b=1+DPPkTgN63DpQwSgnY9hrTeHhZD0P4DbHBv5T9BQaUpL4Q+GO4i8b5uyG9iiyAQiMmI37
	PVWGWir8MZsbPbDoUMXiD9ut0tmxgQ/UEEMFEMx8xvLHGM+Y7BmO3RaCdB9bvUzXxz+lmo
	EiihaxrddoEyK4dXGZ5oK1RbfQdGgkztWyB1gB1XCLAsoa8EzkCbrt4NjrghpK/i/GHcXR
	h18KSNnDy1E3AdRraa7joigyd48UgF1p2+q3lc/yytz2gPSyBBsgYpSQnAeC37TNtJgf3o
	YtcBt7oijP1AfJHyDoqHHKezXisv2MvfIDFiPaBrpOc4PLrWqgNg/CH/qQRRRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMXBx6JiVxExqi9nyxpGvBkZnmNfKmRnM7bi6imU1IA=;
	b=/NhH7eej9OJkM9cQ1wrFVl/WnOlf7wUIew0TM+tuv73zzXQIDXENNCK04gA8+Xg0Cz7BTK
	o/+gbgZUXp8WRCBw==
Date: Tue, 04 Aug 2026 15:13:48 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-bcm2712-d-stepping-compatible-v3-1-1860094486eb@linutronix.de>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
In-Reply-To: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785849242; l=762;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=/MKWKONQK9pvBmbMb+jL2ulg4+Hsp+n+1Tof1+X5ess=;
 b=hYfhb/epw5l1XpP1ikvPBir7/LQlcjvLdkGiGpsbrTRqo1i7+jezcSOYxuaBa/xjFYMgqgUda
 kb8SbdhoHVMA/9daln+zsow/fKPFFgxbqhUdaVKBTPeyo8emnNc5fhp
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

Add the Raspberry Pi 5 d0 Stepping to the schema.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 2729a542c4f35..e2b32905c6a8f 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -26,6 +26,7 @@ properties:
       - description: BCM2712 based Boards
         items:
           - enum:
+              - raspberrypi,5-model-b-d0
               - raspberrypi,5-model-b
           - const: brcm,bcm2712
 

-- 
2.47.3

