Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427159;
	b=hefqYWporRX06RRUD2DnmwFlD7mqegvOmvYL4ine6L0JtiK8Ym9+MXYfpNJytYGseLZT
	 ZEdJ4J8mYW2FJ1r5UHxIifiCXLk/ix1FZxtMV+3q/+L7AJk/Rwq2jxVg793yNGyDV3ojF
	 TwZ51xXaikK4pZXy2tv3zSIRPgAt+5RY+SvuAxFbx0q5xR/PBXz3CzYvW8S6y9Eqs4MRx
	 YZ+nSdyadPhIeMBmQOVvhLX4c2zwEwEWDNmtbv0zIz07Q6d5sAWiqqhj6htZxFxGCbi3q
	 yk/6Gl/HJBBnPDXBREDdQpUjFGKNOIqGE0BQhCsyDujn+HXyKxMsdU2NM3KVlzCGk9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427159;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=WISXIrRiv9xK2uZTaw1brlBZ+PHhofNzGu96gO9Nuj0=;
	b=zVK1iOq0iDFW+9g8wmOBX3xvIEdGSO3svqJPJqusUYPJzhlUJcVgJ4NGMEouL6qN5uMo
	 r3FgyGMCcXTires55F27vh//Iy00vJnY3ogdMUWQnAcsgP7Go02LPTsiWBKZgU7KP+JAF
	 H9T+3zn33pdeOb3yHG2Irib0gwmeIHkb0g0d/IpVZJEQPsG3WN7aCYqOfqGWE2xc8tvlO
	 J3nax1DsdtUyIxNbQGza7e3rgYqk6et6TUAQGNKm3JnqzfvDk3O0jltTljVaMsYnvfI6c
	 CSA/vmh39kELL4/nifp8lt6x3pyOGMqeZPeHflbbK+c3dRLupFL0qunHQZQDpmHxOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qol4iXN9;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED2F606A31A;
	Mon, 23 Nov 2026 09:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED2F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qol4iXN9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2767DC69149;
	Mon, 23 Nov 2026 09:46:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2BAD05FAEB;
	Mon, 23 Nov 2026 09:45:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA74811E68AB4;
	Mon, 23 Nov 2026 10:45:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795427154; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=WISXIrRiv9xK2uZTaw1brlBZ+PHhofNzGu96gO9Nuj0=;
	b=qol4iXN905k8bW/y/OwQVXTTJ3mcKwR/HL5e4FQKrpuk8A2ReNVy4Qk1zIwlLVfMylzKCg
	xYQjFnB7HUKBnmjYmS7tapG1vLfOc54ihljWinVzNDfugZFWxrUa7HbAjjUBraJmVrIAOn
	jZENEmqGB/QGE2HvatQZJAoV6/hd9UhzlC6CMMKq7DDrn9MWW62GbfpdmYr9Jc+5IAS5Sq
	TbBo2R6wCCV+VTnz6+qfGP0ViUGZZfArmyJIwmS0+wpJE+NwelcZsZ/2rUwsmEY4vcazFv
	qsVzY9qj9p88/FKlLP/qE9pF+sjUOjjeHEWAMnQsyW9MY+p/heTu+krC313seQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 0/2] mailbox: Add Marvell MHU driver
Date: Mon, 23 Nov 2026 10:45:40 +0100
Message-ID: <20261123094542.44101-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jassi,

This is the v3 of my patchset that adds support for the mailbox found in
the OcteonTX and OcteonTX2 based SoCs, which is used for SCMI
communication.

This v3 fixes a few things that Sashiko complained about.

Changes in v3:

[2/2]:
 - Request an interrupt vector of exactly 3 interrupts
 - Pass IRQF_NO_AUTOEN to devm_request_irq()
 - Invert success condition of mrvl_mhu_last_tx_done()

Cheers,
-Paul

George Cherian (2):
  dt-bindings: mailbox: add Marvell MHU
  mailbox: marvell-mhu: add Marvell MHU driver

 .../bindings/mailbox/marvell,mhu.yaml         |  61 +++++
 MAINTAINERS                                   |   7 +
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/marvell_mhu.c                 | 238 ++++++++++++++++++
 5 files changed, 319 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
 create mode 100644 drivers/mailbox/marvell_mhu.c

-- 
2.47.3

