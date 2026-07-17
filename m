Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F13E835B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282237; cv=none; b=taGvGtepT5NGFoin2Jlvk88H80ZDe44LLFOORcUhJN3aa4qWiboKyt4RLLdJlqkefOvQf7FrDPlNvLfUeGAyW9zcTPiehTnDRo8WLxf/p8JvbuNluwNhU+nYJWpPGNnj8pEQIyYNt/NpxXkeTV9tz/akzkftHcIRavjdJ4TQrRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282237; c=relaxed/simple;
	bh=53cQQbHnKYTUlIp1/Oe1lnHotiqeGBENPlrWHZNDVy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8jOVTkPy028u+8PN5AoIEZ9e0fGB5AZ77m8RJ9i4yDl+apy1D6X+TqAsIKTsMmwPUKRN5eqimMx9LT/jaLakc2BiNQAu64yum5knI8S03EEZqY/O+XVlexTZ7gxF4W3pwi9AxnmGrHWeWH1J0cRhyLU8kH46mzGMNhiB0APZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1n4OiNv+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1n4OiNv+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D6181A104F;
	Fri, 17 Jul 2026 09:57:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF2C260361;
	Fri, 17 Jul 2026 09:57:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4D8F11BD0424;
	Fri, 17 Jul 2026 11:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784282233; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=m09xP2eVOvf/ABP75jSTVRTHgDA66h9ZeoreFZaMOj8=;
	b=1n4OiNv+55sW1TOx8XiPJQYrs86vnE0BroLgDJM1t+vv/Llxdm2c0O+Wapz1RGKBPIKOO3
	KrXV1paMgENiPiMw8eJizB/GVXALQQqIFJoAxm5NCt38mL8uImFTAtQeWl7AeluhD8DpBE
	XXQRjD7SopQYlI0WBqbloVnK8L8Jn2y7wMQ8eao4dP2bpc0HYg5HJLAEggXnekGYB1Xbux
	IHFJxB+KOLMV/LepegEWTMgz20ihZqckblAdsREBDadsv3OAuStSidApe2j7rZsYpBEA0X
	7eFhVu9JL/QJQtUGK07U1nQG+hmf+ljL7xKmWvIFxLJHaDWoBN9OP01ZWVCqFw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
Date: Fri, 17 Jul 2026 11:55:49 +0200
Message-ID: <20260717095552.767475-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717095552.767475-1-herve.codina@bootlin.com>
References: <20260717095552.767475-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

After contributing the driver, add myself as the maintainer for the
Renesas RZ/N1 timers driver.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..17fd5f749344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23025,6 +23025,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 F:	drivers/rtc/rtc-rzn1.c
 
+RENESAS RZ/N1 TIMERS DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
+F:	drivers/clocksource/timer-rzn1.c
+
 RENESAS RZ/N1 USBF CONTROLLER DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.55.0

