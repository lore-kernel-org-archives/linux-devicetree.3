Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEACE374185;
	Mon,  3 Aug 2026 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751611; cv=none; b=Ty/3LsjV1HebOmGv4INHf1DfJMNRZ6nXkyirXB206ZxWmv2h8V+gM6gGAqnUT11FiOnyqBFvYO1chkaSlZVyZa3FqTj0ooHJ0soNUsSse4KByHN7cudKm2yc3tPk2fEFZ7J8QjzgEN2BDYAK/w7vMmWeN8IdC/CQvHSEwPpJrMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751611; c=relaxed/simple;
	bh=DSPSDoGviOFyo8k3qvSQl5w8Jy3UBcbhVpFibB9/rT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhrNBQWAJi2UNzs9ZwCFonPEjAErVUhOWT4fgj0PiQn0KQTa5/MJA6p1dHRvFHEv/G1f2DWvoq0lAEXq2NvVSQXPNNGmwTbgLOtOs1a4HqK1ht1dI0tu0Pq598XwKPVzsUImgej2RhG/nDcPbM3KHx8CLDu61ueN31XF81g4Tac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tvMCjteP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cyGS1kDP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tvMCjteP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cyGS1kDP"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=;
	b=tvMCjtePIo+htCYbYVLOO/gMz4x+hw/GmLVIBRimrXBzm2WWtTUCoClPp/yR2QgpoVzEOn
	BtQS/ujqC3VUEoTGxB9Pl8R9aJXPJtFb08LFV7TgD+ZOcbcaNvZiFFWzqRzWr9qPJYWuxQ
	EF5oub9GbDBgmIaeeFULf1dQP+a4hH+LnjscLF8L74cCnqEsUG4a2Qvq8OeSeWTKTi9xZl
	iZvytM5QvS9A4dfQzNdrzSaUOkVVL+g3jG1qUGy2R04L8RV6pBs4vq9sLINgCit/yDVSnR
	euJ5dccWom9KGtbL7wSUaN+RwpvNqA6V9cMVyyBh3SKlABNcUPEcx4oG4ki10g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=;
	b=cyGS1kDPsvBg+5P1O46UoU/N+o3u3VOMGfpEzXo7Koxbp3RdaMaVTiPM7L+8+EFonry4d7
	/rrju/ysZxzzgaAg==
Date: Mon, 03 Aug 2026 12:06:42 +0200
Subject: [PATCH 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-bcm2712-d-stepping-compatible-v1-2-401934357a44@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751607; l=1240;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=DSPSDoGviOFyo8k3qvSQl5w8Jy3UBcbhVpFibB9/rT0=;
 b=VLpAZ7NDEZhh1OyXF/WX0FJjof4ksB++8EvPwHlUO/rzcttuBR9BZn9bllNAbQSYrc/DYe7lQ
 BhwNbv8FY4YB0cXdTlWIHCu46B2VICjWgGcPkWLe8UWbVzTSfYYkjVh
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
distinguish between those two steppings.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 127be0fc27c2..11a38cd53401 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -3,6 +3,11 @@
 
 #include "bcm2712-rpi-5-b.dts"
 
+/ {
+	compatible = "raspberrypi,5-model-b-d0", "raspberrypi,5-model-b", "brcm,bcm2712";
+	model = "Raspberry Pi 5 d0 Stepping";
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 

-- 
2.47.3

