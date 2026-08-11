Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAEF3BD659;
	Tue, 11 Aug 2026 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464264; cv=none; b=perUQOSAiXY8WkrwsaFG1fM66+GrzTV4zno7dKIo21QQPv0XkmXChHfJlCRe0h0VoiAYTIGYDHO5z5BCp4uWM9BqvQx0fRTJiw3lEWmahIzicoy47XsTi66VB7l7nEgKWOPMstBA8jwyNAeefHIYb5TSBZtnv6xpiW0SdEbGH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464264; c=relaxed/simple;
	bh=Bz5VIkoQKpnIVRzFlQBbxMRZX9jrt37vpkpuL+tVX6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3oOadvzNafHRpj8G8SWFJ216pwOMxU/Yl9L5gP6oznXjh9o6au2SXrleVEAEmnRJ7wQZgDv0FckSKu5dXPE7a3xozo9gY6kDRu16cwdMp3xgfgdV5gOSB9BTYn4tyToCDr4w4K89BROgYU1ZRDxIfAI4hY3iAVwtAxzQ5q3Jes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MBrra3QU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ukVRVAyt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MBrra3QU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ukVRVAyt"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786464261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9faxvCSlME9QEKQ1ahFv9nOyOfV75qVRHVIQ5bM1Z4=;
	b=MBrra3QUZrU58LZoX5t4IoQLaBZK3ou9BMTZh+j41a5K+LH+uHp3Wbm9FPcrj/z0q+yQyl
	VnFecThJ0O5DpKJSnppHqhVsAqZhtsfVq6HxjW8VikvktCzFd8RLOBzgapMX0XgpMR0I+Q
	EauOMhhP5v78jGs9JZ0PZfbWP8OQPZdXwEXA7wZXa9UI813Nr/7xzcGLBkSB9I7J54Ui0T
	M5dtAtIr6r170uhJ6lZTOmoFyIPLMsNmBTH3y6MWj/y7JFRyP/2VfoGhJpRbf4HGjww7N+
	T0f1sVxhUkXFLmNrp/TJz/YMc5mRIm9xHjmdP2u7w4FC/ygzyTNGn3EFfm5FJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786464261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9faxvCSlME9QEKQ1ahFv9nOyOfV75qVRHVIQ5bM1Z4=;
	b=ukVRVAyt2Jhrq4oa6FSMGsLU04GXBqmCQS4BFQNqKUm30KJ7r8YkNDcVv98ceWuxSAgPga
	yVUyF/AsfyOIDwBA==
Date: Tue, 11 Aug 2026 18:04:16 +0200
Subject: [PATCH 2/2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bcm2712-spi-v1-2-4c1708d354bb@linutronix.de>
References: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
In-Reply-To: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786464260; l=1343;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=Bz5VIkoQKpnIVRzFlQBbxMRZX9jrt37vpkpuL+tVX6c=;
 b=Kq2vLt/BC4nMMMCMU+G9SBH7lCVFa9vJgvXyBYNbH+/wAZ8poGKw+rKmZajb97vlLs9xU+ayo
 vWb1W0JZmyrD6A3WoC4CnoAu53p3purxTnchEcGqYwfsGlto0TCISiZ
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
the spi interface.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..81aec81c5ce12 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -69,6 +69,14 @@ usb_vbus_default_state: usb-vbus-default-state {
 		groups = "vbus1";
 	};
 
+	rp1_spi0_default_state: rp1-spi0-default-state {
+		function = "spi0";
+		groups = "spi0";
+		bias-disable;
+		drive-strength = <12>;
+		slew-rate = <1>;
+	};
+
 	rp1_i2c4_default_state: rp1-i2c4-default-state {
 		function = "i2c4";
 		groups = "i2c4_2";
@@ -94,6 +102,14 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_spi0 {
+	pinctrl-0 = <&rp1_spi0_default_state>;
+	pinctrl-names = "default";
+
+	num-cs = <2>;
+	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";

-- 
2.47.3

