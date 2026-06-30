Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A8747A0B8;
	Tue, 30 Jun 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853175; cv=none; b=Y7xQJMOmxANKCdY+SZSNUYHBZnOZwaRrKtGc9q+pl7AR7N6olUIbQ+tKu6JkhwGEb2s+ovICNDS7ocMIxf5flSjOIuQ7+weR5Voaziao/+5qyetgg63/3X8cFJbdHwVoT31RMbe77F2P1zTBjgoG+AVxN2l2Tt7hwnX5M74db4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853175; c=relaxed/simple;
	bh=vDH7xyINpB8aIhH1p1k0iDI8THECYcbWKH4TgFUwSIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spXRaq3Lk7DYdIPLp1s/uYkPXzvs+vwAGN3+veCRR3LCXQpja8AWJ+oJwf8X643KzdT3LZkGerz9OwkKdRC1qAKzGwn5FuHCXPN8KfJ0Uyn6K2/U8S2G3GdmLeNLMI+adrQfsZNqAcXK86dpZbxe6ps8orw69mPaDNjr5W7ReS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KfRwcLMe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vF8DoH3q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KfRwcLMe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vF8DoH3q"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782853173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwt/kxlU0Ywgyydlp2eJ2vLoMTfcjLWZMUoUXLH7s2E=;
	b=KfRwcLMegwdWzKupVoMQHawxCc2y5GScgOTKhD/nEuZyN9yTJcgFf5XKdnul9i0tQwbWQz
	vkPA9dupgv7G0RHPnWeyQ0pBIcgalOwiUxEqXStObFxuzykRTMGfKbkHV0exk9oN4hSppD
	PfJtKLqxvpZQixSIOvT5SOQ7FgKpUBoRykEJlTI6z4DieoyOjrzipJPrJPLxZ1aVrbXq3i
	0x0DX90m3PIPvw1uf8GyFvIctNcE66V8g973GTDnVi/wdFnFFmN/p2GC9bE93uxvU7q52q
	C5NN8ilwD3i01tKHYJMUgperGwU1o/LdthP/b8e6JYamWzYq6Mnnu5mMqIs5RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782853173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwt/kxlU0Ywgyydlp2eJ2vLoMTfcjLWZMUoUXLH7s2E=;
	b=vF8DoH3qzpotkFzzr7RNxvOQ4/lJWpnEl+1jA37iwnAacS8GUMHZslzZmDjG3Xf75OQpib
	Nc8KCc8KbNjKRmCA==
Date: Tue, 30 Jun 2026 22:59:30 +0200
Subject: [PATCH v2 4/4] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-rpi-tryboot-v2-4-f68d2dc6aa27@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782853171; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=vDH7xyINpB8aIhH1p1k0iDI8THECYcbWKH4TgFUwSIg=;
 b=+b7Xv+0x1RhwT/qxNV6k+kZP2b56DyLuA0E2Z/9Kp6GrYGcUAIKCw+ejti4OB/COUjNAgrgWU
 /4DDDnP2JiNDCIkOE7zXfBl3bsVHsShk8fpD5J/NfZo2hqK5h51dTug
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The raspberry pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..67095c7ff770d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -49,6 +49,8 @@ firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3

