Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67529BD95
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463482; cv=none; b=hiNEFclHzNnv3vIgs4sB6oXC7pMpon2mXvbM8aCxIzVNX885qFJaLcXpjUWWG1wXidmPTu1NbBYGaIMyNC+NiI1fU1RV/WUpoeMxgwuQMgC2Uu8ccJ+hcR65ai8AA6OFaQrzpobnWdQxAdWXQeLEgSioG56Z964lKyHPTeWNXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463482; c=relaxed/simple;
	bh=VAJSA2xgO3c4cQcXZQBkqY65yBvsEuuS1NjB7gElWtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbiOyP0wSyxbjtB/xVHlFtNT9qDrVBC/XzIIDr+ZUy81db4EWD/hPJQTVLdUqhvaCRQL/pIWiiEZZPWQLVKXJKKnC6pVT0SU+KdDiPEvoTj3GDjL24JqJmR0u7PlHObyhkjMLvZ3Oyz1mDW1QzZ/qNGjZxa8I0dVmPqCJ/CF07A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zdg5iybp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Zdg5iybp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE2F14E42AF3;
	Wed, 29 Apr 2026 11:51:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD0E2601DF;
	Wed, 29 Apr 2026 11:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA08010729012;
	Wed, 29 Apr 2026 13:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777463469; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kYgU7p+5G7jRn2Lu2neiA6JjUceaSNvUkJDhIyk539E=;
	b=Zdg5iybpl50u7W6h5DFjstn0a8BWQtxfafcPB2bcM9TYKLAvWFqs66pfSKmtm7P3pzmiqY
	O4WyrW3q4ovV9HRkBsU7KGUrazY3Hv5xZJV4lfgii7qacpTpqhqYlhCNL8+WJpiIqxf+9x
	PRW9xiL9vfk4trACNdFQMDv5dpDmfeXS1SsBKWyS6/TC9CCk0imLEM8J93s1g3a3BzeKDB
	IvjHZMonKaTiTtI3Ju11c8tUo2DkQ2JMX2wGC+4QNUxOHwfcgia+IgEMW0KWxX5rF3lx7o
	PD4Mfhy6bFzkLe93GkxdIVFgiNhKy9a64V6mSKul9vQno28eozIPS+fEdWHErQ==
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
Subject: [PATCH v2 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
Date: Wed, 29 Apr 2026 13:50:23 +0200
Message-ID: <20260429115054.158160-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429115054.158160-1-herve.codina@bootlin.com>
References: <20260429115054.158160-1-herve.codina@bootlin.com>
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
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..6f0bc793d657 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22708,6 +22708,13 @@ S:	Maintained
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
2.53.0

