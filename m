Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF213DFC99;
	Fri, 26 Jun 2026 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459312; cv=none; b=RYNcLT6p1Kb5JkthID1ZekhqCQb/NY873vqVroCLjlzjNkVdLy0Ro2STPPICydsj4WUjvj+A9jxeUdtfZGYAaJmVUW63icQjndGaKsGtnNZzeP1cRB+5yC2OAB+qHl7vdXYHUWDHq0Fze/JonrxsX0GuEWVUuyKb7HEzbVcyGdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459312; c=relaxed/simple;
	bh=vDH7xyINpB8aIhH1p1k0iDI8THECYcbWKH4TgFUwSIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EI/mAo4LgNl+kk9/DoPR2ov5ylI/R6Ja7ZCc4h7lVn8xTWVjdnq1JBTfcyswgWZPfTc+NTBVuWpgB9ooAu4g2g9SDF+H1zaDB54I/HKnYqWi9yCBS2pRRkBz2RaI2hQ2O0iIk1lh/J0mtOHzmGixantDUOlgR2Vg4u59PSPMMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n3vHKV2+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UdKKD7nH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n3vHKV2+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UdKKD7nH"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782459310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwt/kxlU0Ywgyydlp2eJ2vLoMTfcjLWZMUoUXLH7s2E=;
	b=n3vHKV2+xyyd0FcD/B/ZRr+mENG/2UskwZQsL52jvLLvCg3Nf5HhURbSZKJG5e1kI1k9Xc
	WoqpsrFqthiHF397xaPv3ZSYqyGW8kJTmocpyzUHaS8pq80pFtoBlAoVTm5g4cuuDAoG5p
	Xiu95cpTnAScvQVn6+WpjR/XT9uYqSgZKAeiPn1dSE7DVKE1gB/C22ZsgTLZHDhBNM7JPg
	xqUcx2Jv0YyZXgQ0RqxdGaGQi5ikBBLqEZee/4MvSE6UweDkWKyN9hkP3qI4ZTVZmd/Hn0
	fIMu4UR/icihYh3jk0m7F/BPhG/2YIfv23O1DmtOM6Pllg4k0PmNB4//+oKqNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782459310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwt/kxlU0Ywgyydlp2eJ2vLoMTfcjLWZMUoUXLH7s2E=;
	b=UdKKD7nH7jwPMpCuF2zQyM6eSag1HbHvxmhpIW6pgZKlqJ/8saWIn4BeJVqhJctwB6BeqH
	H3sLvvJpcsRMnbAw==
Date: Fri, 26 Jun 2026 09:35:07 +0200
Subject: [PATCH 4/4] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rpi-tryboot-v1-4-490b1c4c4970@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782459308; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=vDH7xyINpB8aIhH1p1k0iDI8THECYcbWKH4TgFUwSIg=;
 b=DMU3jwcQAgiYGwTw+ByY8t8n4oB09PTsBDQ/38EeI5tZNG33/zES84FT5LRHK5fgWTU1olYYR
 OEgslcJPBR/CR1sxonPSrQzbFAwJaiKjCNNIkvhc/gnqYa998iYvrZp
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

