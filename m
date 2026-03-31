Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F563ED10A
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948877; cv=none; b=KLz6V9j1scFfeIW1cGpUuv2+nwtBJO84TGLQYiFbTTv4hl7THs7OELqs97HF9/6j/OHTkPucqULbtDZtrZrkrQTAhyAHjcmRet63D2Ek1IFHXYKNucI5VEBXf2GPYblFhw9wSTxOi2lDffNE+KbNaQmSzWYeTjYs3rS6veytUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948877; c=relaxed/simple;
	bh=rzOohUkZTOoqYpibYNuaz3QGJj+GiDLIsIh9/HH27SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ctlc3RFrvwwZZzdteguwQUyL6xWw77srEjghpDw2mCmCIViMds9zHPI1SltKdGrfUMTCFjZ30Sij491J4Bjd6K9Sw0qEs9ICOelMJZYsiovnYD2VV2LMzMvdOhwlxRJjJCtzPfYlo6aC2smrtpNab2p0bJJCc4yBKVsvTj58zjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o/unU2/Q; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o/unU2/Q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C51344E42886;
	Tue, 31 Mar 2026 09:21:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B6396029D;
	Tue, 31 Mar 2026 09:21:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA77D10451001;
	Tue, 31 Mar 2026 11:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774948865; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2lnl520+yzWlpBNDXIzMGXX9Wqn+c56EDcuaCfLAuPs=;
	b=o/unU2/QVOjJ3r/KaK5sRbqa9E6vPx4Bc0gmO82bWUnvi6Ony3VNi2iHrUFz9SdXFpKNzn
	YPd4WXCeg3MXowy4c9jUtxYiNgFTjo00JWhVzQIAyEkjUXKDdGqNgaTxxL3wtmdt8+ewTr
	4cvGYaOLJadpflRCCpW0o0t/tg8PnJQfrcpGaJ4LefaztV3LEs7GVeTAT+eu29bP8QKGpD
	bYpEaJrJZgqn5skVr7zthI9CWoEdLUcP5A2lhPJxJqocEYRdwPHy+A4QDxZLHOA2VraPc4
	pHME79dPqoAS/DsfR1O2EJDJ9cWXEvdxxh70q4P09FFyhSSoc2/D6cdYiUhlQQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 31 Mar 2026 11:20:56 +0200
Subject: [PATCH v3 1/3] misc: ti_fpc202: Depend on GPIOLIB instead of
 selecting it
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fpc202-leds-v3-1-74b173537d42@bootlin.com>
References: <20260331-fpc202-leds-v3-0-74b173537d42@bootlin.com>
In-Reply-To: <20260331-fpc202-leds-v3-0-74b173537d42@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felix Gu <ustc.gu@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Selecting a foreign subsystem such as GPIOLIB may lead to dependency loops.
Use a "depends on" instead.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/misc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 5cc79d1517af5..dcb36e39d7079 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -116,7 +116,7 @@ config RPMB
 config TI_FPC202
 	tristate "TI FPC202 Dual Port Controller"
 	depends on I2C
-	select GPIOLIB
+	depends on GPIOLIB
 	select I2C_ATR
 	help
 	  If you say yes here you get support for the Texas Instruments FPC202

-- 
2.53.0

