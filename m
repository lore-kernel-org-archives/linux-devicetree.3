Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F83890FF
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432497; cv=none; b=FB5NeMqHMr6N0Bkeh4rWKbRU8hI6XsUsS8FNaaSg3q3xJLvoJUQHKaku0A5+nwJIhqzSbpiedOOSDDS4iOp5AhctPIAn9LaTXzb49jnSkc5bWJ6oJJUpdRByhjrXKP6NfzvjyUuLJmyYhDGwUmTi5tQoyKIjVz1dyj9FsHASA/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432497; c=relaxed/simple;
	bh=rzOohUkZTOoqYpibYNuaz3QGJj+GiDLIsIh9/HH27SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1SnuTP36qkGEL/kIyFfkeibol/09q9PI5x4E50vpspLJt5rpr9jP0VdmebokSxAwgo1ZHRUnonV8CQ4g1CEjaP6RQDHR2tfzYqAzppDKTulwOuBwJ/0scffXf4r/wFBYiqwtDvFBGhiPchzRf4I/YlopqBiY0cKXgxtWwNQLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M/NjYtOH; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M/NjYtOH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F65C1A2FE4;
	Wed, 25 Mar 2026 09:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34EBC601A1;
	Wed, 25 Mar 2026 09:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83BCC104513BA;
	Wed, 25 Mar 2026 10:54:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774432493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2lnl520+yzWlpBNDXIzMGXX9Wqn+c56EDcuaCfLAuPs=;
	b=M/NjYtOHCv9SdyM415xaDoFWu5ToQnwjjGkdZcdgKDBqiRAicltUT608h5341AIAdze7Yr
	anHEDtSCcTejWqzhq5xkbQhqwFo1UESWEjg56X7/0cRLgF0U0YMW/UiXsxVUdytZZHErVQ
	SV5vU+8eV42EYlg8rdJu51Hf0LBHAaCsf3FclL8QlRByH7Grk2d9iPYONTNqid9GyS2hcx
	PtsVOdKp/McnUhtj3h1ZWXDi577R38hTvV1i/4V1z9fDK+SzkpxTLthQffXaseLPLZ+k6K
	GjnSy3DXDovvLpiYJq1EIz4nXVHUPMcgh9mp0mxzR1cMLniDoW74JOPEk+PBLQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 25 Mar 2026 10:54:31 +0100
Subject: [PATCH RESEND v2 1/3] misc: ti_fpc202: Depend on GPIOLIB instead
 of selecting it
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-fpc202-leds-v2-1-a2f4da739b92@bootlin.com>
References: <20260325-fpc202-leds-v2-0-a2f4da739b92@bootlin.com>
In-Reply-To: <20260325-fpc202-leds-v2-0-a2f4da739b92@bootlin.com>
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

