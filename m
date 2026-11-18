Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021611;
	b=ckIpNTHolewaljG0HVoqdohg9sDYASei66umJ/jU+zlWcWLt4PmqxQ8ftlBo4iU70PP0
	 ORJdLNPbdNSmloQ905KPFF7lgA86UJxZmRbTS3BeozwGKFvIA4IPejXWv2mCJOPl1qsgU
	 tLkfXk06TT4pR3wdRQB+EqDFbwnIlt/4/URBHUvSpZUrL3tv5CX9+bKfpwt1dtvig2g7u
	 S3L192G4kCJKuAYOol++D41K2OwtRyyN8CU5yGWd7Ml55O5EVbhhNuJHyjoNX3P4QACW0
	 H1QC5h74HRU3BFKPdnFoImpEUIA3q/37v6hOxFjaTR/i2aUftLwq0coKg8pbfEU8ATQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021611;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=wWl7nv1+iCYYni971N0J3aMrvV4R7qgN1XFvCJhdF8c=;
	b=aNhDJNGQZm+eKiJyFdGYQ8vwH4sevxD6B4UR8dfEjgFvyOuo2tPHDYkk89PfVGqx9lvr
	 bmZPcRUTjcF/SxiRpx/KMRvOISu+2n/auOva5Mu0dWNABJvIf+eNd1BEqp2r1jW+AV5qA
	 Fm7+mMtkuEw8npl/gaSMnzUgFADn95PQZ/Ac/dfl056rzIqxpxtUviOXHjJUQ1XSwaerm
	 Cqx96N/YCEiaC+HC6Nf99uhfitKiiPY7Q7nLT/7sER5hPK2/lnaD3X5SGLxjA90xsprLQ
	 yGb3HeVmxUmu0GKKptXPokGYc3CjBbx/DyJyST//U8gVgKS5TyO3rJQizXTA6qWKC2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dvHmoOE1;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58346606A33B;
	Wed, 18 Nov 2026 17:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58346606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dvHmoOE1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D6B54E415F3;
	Wed, 18 Nov 2026 17:06:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D83F65FFAF;
	Wed, 18 Nov 2026 17:06:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E55DB11BC29F6;
	Wed, 18 Nov 2026 18:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wWl7nv1+iCYYni971N0J3aMrvV4R7qgN1XFvCJhdF8c=;
	b=dvHmoOE1JEeyXXz0NtPhMKYVm4kCGm/o6gKTrdjLyE/qzzpG+peQJo2YBwmtwA22rrIabw
	rqPK3n5Y6uIEAlVpl4P9dwYEXHBqJfmCbOaT2sXPkqqvVu+eW/dWt4AqgejRRIIgxnqc2l
	hgzlLik794leDoRMDoID2TliUaC/+TQCcBFdeO8t2+OY6tNhlHoEjndF6/1MvJTVVJ6T7+
	hAbI4p59xPz2uivozbJkillEcef6MI0LxiO6hDIUWqMlLVW1Qb1aT5ZQDAnWLGFAISWTpA
	pFBQ8TXnRTKD5dJvc8BK6EoNijGrgEOW75TO9eiafWgK9KYisord6IcGeyfeNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:19 +0100
Subject: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I have the platform, I currently use it for my developpements and
therefore I care about the clock controller driver and the SPI
controller driver not being constantly broken. I would like to step up
to help the Nuvoton team (not visible in the diff since they created
an MA35D1 catch-all entry) in the maintaince of this driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..44361a557aee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20072,6 +20072,14 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON MA35D1 CLOCK CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
+F:	drivers/clk/nuvoton/clk-ma35d1*
+F:	include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported

-- 
2.56.0

