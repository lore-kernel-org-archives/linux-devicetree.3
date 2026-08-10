Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E913C37B3;
	Mon, 10 Aug 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362401; cv=none; b=nSHL2508zFOogREV9MYimtvsmwnqFy+R9rnsEmex61oVO+5oFk08cpqQ4qcQM0h7tlnA5iktx9RSFd4Ji9QO8cuQK9CJXatOmUGgLKpmqNQwDy4AWAijFXJMAMVg3HOFiJYOJj0vqiN5X6iBgnXtP27ulToiU/uZZnXcXslA0xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362401; c=relaxed/simple;
	bh=Ii58RXGxpJr9hwDGS1ZAAJhAGvQaWwv4kU6x/v3mamk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptTAXMoWzey0zqT9zR+LBgXs1lGYpkvv37pmqVJZWAMk02kfVy/zq4AsZ2BnHEpidfAbiu3M3KRfrM0TI0RMi1UfYu1JewwoMqHHnUQjjsk01gBrPvColsLZmlhQvlLiixY3lvSuIY6JRCB2jhhCHdnXU4JaptNwMd9Qo2ShwH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=epiPuh7f; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NC/iBeHu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="epiPuh7f";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NC/iBeHu"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Awn8zlaZXi7jR36kN4PdMr9Rfn05NBCDgVEntOe8AQ=;
	b=epiPuh7f+6fSEbyzXbih/w2Kp+nQC2h7Sv2/yksd2smi/42WThIsI4oUkMlkyy7rYrWkoQ
	gwSwi/Z1wvPnk2zTk6Yh6+9LcBs4mRALnEUBKeIMNjiHU5ZvZxd6WKuX9Rv348Dt1lYmG+
	RTvbSVXUHhvha/k5r4kaoimU4YoPE99bWFLejbsjDgONJCWmtWl7LiKftV3lodRjQgrQqJ
	h6T5KVuF26Sj9ZpM3T3+ceeFb0TEU8z7xEQiq6qi5H6qq2Ellt/zPqSdniL+4brxVkRFBR
	jrtQqkQr8Auk3P/pio0ZOZ3Mbs+jfxnYhcd/tG4uy5K+uSIHOBzGf6v7Q8Ttjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Awn8zlaZXi7jR36kN4PdMr9Rfn05NBCDgVEntOe8AQ=;
	b=NC/iBeHufKzyMEk/3JlShOnP+MxT9Fhz4GuAL0ftCUXd8/CHP25p35+dtt74qrLah8BVQr
	TphxTZTQ/3N3FIAA==
Date: Mon, 10 Aug 2026 13:46:34 +0200
Subject: [PATCH v4 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-bcm2712-d-stepping-compatible-v4-2-73f74479539c@linutronix.de>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786362397; l=1361;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=Ii58RXGxpJr9hwDGS1ZAAJhAGvQaWwv4kU6x/v3mamk=;
 b=+WAlGB2PNCMoo3RnO6z4TF5oFjO0zV10Hs3eJvTbPRTInbnrkqL84RU9Ob3NyxKbPYdLTLKJE
 3OH7eu0Lv29DtcSEnEVKj0OkwH7rnrLXv3sQzBNXIBIwKWVlvNEAs3+
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b" through its include.

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" together with a
"bcm2712-d0" string to allow us to distinguish between those two
steppings.

Fixes: 44839e2ac8ec ("arm64: dts: broadcom: Add DT for D-step version of BCM2712")
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 127be0fc27c22..ae4b7c587dbc5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -3,6 +3,11 @@
 
 #include "bcm2712-rpi-5-b.dts"
 
+/ {
+	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";
+	model = "Raspberry Pi 5 d0 Stepping";
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 

-- 
2.47.3

