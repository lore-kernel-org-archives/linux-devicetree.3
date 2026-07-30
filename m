Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA784071F5;
	Thu, 30 Jul 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409182; cv=none; b=KC/8zdYUA24T5Q164ZKqd4la96DIo3LwBDFNYeR/MgqVjpdd43dhrJsHTDQ/60G6Ac7P4gTUa47vS67sGBYgMuUKV1+neroAI7vQ9ot1EJpVo/qZ6w0w9N7zywTB7ZPHbUqyZwAs9mJWix181dnP12xJU1MHvg2MhqpVxmgMFAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409182; c=relaxed/simple;
	bh=XReJCbkSEq0T0EqNnZyVqtP6Nx9G9Ste8TwNoFswOt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Es/nRbFp7d3cw2GnAOJRWueR2ZfNqS8U8/jD3s371JrFd6EEAmBazri4mg1viJ4HN5AkluA+cvouRsWOf+pSXY8tOcS4U+0SPaKVoXWUJ849Rm8KLYlcCFOHKSZpvSo2WGcT6ymUPDz4nvKZlJLnQ2pFIxxMlB8qBc1/Jabi/Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IaVDuVlK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yPk/MFxp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IaVDuVlK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yPk/MFxp"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785409178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v/3GxvojxoLKdyGvS8XxmLrfbIDxAyXo/GWEJwJDgc=;
	b=IaVDuVlKqYukNoAugXV6bw3EgoqbFMkMsKWqqarqcq7k9zR+Bqjnnquf6KuhtF1ZWUc+BR
	L7/yq6EedFe423ZqnbJQCggqb4VVeiQOfq3QPFfb6vmhKuY96A74+Hy7MOlH5/Ebmn+hEu
	fqTajvShTPDZtu3vBGOQXjq2BxWfMGEMX5//K6/41g26SVVPQgZyaypPnyVd5FhdPMaHmr
	d0Rd2MY0hCqyQ3WCMW8vdRYa4lTTBJQkm/95HGy/l4I7m+T1xhK1zi7KlmkXQg8pEjHZ5O
	dJeSMtFZnELw5kXC8aXwKU5OVP014h1COeFskLv2/Kj4jS5z2OYLi0baVW2xuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785409178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v/3GxvojxoLKdyGvS8XxmLrfbIDxAyXo/GWEJwJDgc=;
	b=yPk/MFxpUyYK9iGY/mSrPOHB5GiH2MRvajgQo1yZkLiFc75pniQZgQTIkQBoKL4lfdFHAQ
	2wTntIY9e111E2CA==
Date: Thu, 30 Jul 2026 12:59:33 +0200
Subject: [PATCH RESEND v3 4/4] arm64: dts: broadcom: bcm2712: Add reboot
 modes to firmware node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rpi-tryboot-v3-4-849c001d67f8@linutronix.de>
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
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785409177; l=864;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=XReJCbkSEq0T0EqNnZyVqtP6Nx9G9Ste8TwNoFswOt8=;
 b=09aPWQQjL8cXe+8pd09kc8Y16/GxOwFzWf2RPwUt4IFPu+STceGizMLgSFbyhYi17Lb8G+qc8
 EVrNfEZaUHuDY2HC/q45RhQmaPCk5wFTvdgaRNqmeDwFuqEb9dSStnD
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1a..67095c7ff770 100644
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

