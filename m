Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438391;
	b=h9k18FGuHMRCczHTym8G3jfkK21QDnejQm4mepaswx9DYqzTbIkoXJ1wilV9K860iSZy
	 vMky58xzDPS5e/c1gW6BT71bWPNLaG7LJ1IZSbrPc3v7nyp6/E7+J+uivF/9AVlQFvRm8
	 aUp6R7Pel3WRYC/B1fDVIZ12/ioFrL4WglLwPJl1fFgD5hDluDIW6sXk3FTqZUpH2W7RJ
	 sn7y7ikUVvVOA3btTCEpMwvWapnE9gpRDYrW6S4SW37Ntn1BLsFht/jd8wDK2j0XbYqCh
	 grRrL40jeQYyk5VqQH+7WajH/8oXJKFv7ZJHX6ZfzSVEJ/8am2zNvSx4MaDxZbdAmKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438391;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=H5SnWUnro2qExgQkV3dbhQ6vKq6c42ybHaKDpPYlOnA=;
	b=NMIyHiML+shKwogkhx4RM5NnNE/9af823yH1xGJnGPiUY88Q8UUC+secCsJ1WSq24bsH
	 LxB8VC4VUsIEZ9utglrNH2Hr6yRagKGV4BJZRzo4d/JBs08RCGe/MAZZvJeeXYNPP5QsF
	 y3gI06ggeHQEUye8bbbky5T9vIZphrFEIfNVG0FJi+HcpNzNXjK4HXfKh5lLUg+jJ0uKh
	 zDMKnTIsmoyTfaDcH7BeVJrBnwHA7bryTh5U9Vdw/yKC/Xku5WRhwKKhYGDf9lMaPQX+C
	 4mnXvo/nFQL/8p40OLGDatYjpC+Wk2a8OHCZ/0d26jvztv7Ca3tr4YVqZ921B6gRz3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aVxNoddu;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24490606A690;
	Mon, 23 Nov 2026 12:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24490606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aVxNoddu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C6FEF1A179E;
	Mon, 23 Nov 2026 12:53:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95063601E1;
	Mon, 23 Nov 2026 12:53:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D106E11E69214;
	Mon, 23 Nov 2026 13:53:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438388; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=H5SnWUnro2qExgQkV3dbhQ6vKq6c42ybHaKDpPYlOnA=;
	b=aVxNoddu6PNe6qdzMWbnd+11xDh0/XPDGUyqgkqoANfUaLK42ry/x057eaMl84uBeXXuPS
	GAvLLJpqZmSYB9mI9FHMI63neArCEHNlEhdM5T1F3pAphTyNmTlK/3IDbDdsQgEGexTYRn
	On7LNfSyf4THD/ii1GKvXXLiQy1sn4Nd24tm4Yc8w9v+2gNzM2uXXIQcbV5AClziDsNisA
	s8ChpuDIJ8zO0tAX6i61k1eHj38Dfz85xKhke2RWyHvyMQndOzoU0flOpWGW7tOrkzPpeS
	AXmyah/EBp0M3tMYcAuS/5X67igmDg+/XH6e+PoGzaV2wUR3BPkIvmYZKIOwig==
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
Subject: [PATCH v4 0/2] mailbox: Add Marvell MHU driver
Date: Mon, 23 Nov 2026 13:52:55 +0100
Message-ID: <20261123125257.111219-1-paul.cercueil@bootlin.com>
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

This is the v4 of my patchset that adds support for the mailbox found in
the OcteonTX and OcteonTX2 based SoCs, which is used for SCMI
communication.

The v4 fixes building on some archs that don't define ioread64 /
iowrite64.

Sorry for the rapid-fire. If this v4 doesn't pass Sashiko's review I'll
wait a few days before sending a v5.

Changes in v4:

[2/2]:
 - Use readq / writeq instead of ioread64 / iowrite64, which aren't
   available on every arch.

Changes in v3:

[2/2]:
 - Request an interrupt vector of exactly 3 interrupts
 - Pass IRQF_NO_AUTOEN to devm_request_irq()
 - Invert success condition of mrvl_mhu_last_tx_done()

Changes in v2:

[1/2]:
 - Fix binding path in MAINTAINERS file
 - Move MAINTAINERS entry so that it's in alphabetical order
 - Fix formatting of DT example

[2/2]:
 - Add Kconfig dependency on PCI
 - Order includes properly
 - Remove duplicated macros
 - Pass a pointer to the "mhu" variable to mrvl_mhu_setup_irq(), instead
   of getting it from drvdata. Then we don't even need to set drvdata.
 - Use devm functions unconditionally. This fixes an issue where
   pci_free_irq_vectors() was called while IRQs were still in place.
   It also allows to drop mrvl_mhu_remove().
 - Use pcim_iomap_region() instead of pcim_request_region() +
   pcim_iomap().
 - Enable IRQ in .startup(), disable it in .shutdown().
 - ACK the IRQ after calling mbox_chan_received_data()
 - Fix register used for polling TX done
 - Clean up macros

Cheers,
-Paul

George Cherian (2):
  dt-bindings: mailbox: add Marvell MHU
  mailbox: marvell-mhu: add Marvell MHU driver

 .../bindings/mailbox/marvell,mhu.yaml         |  61 +++++
 MAINTAINERS                                   |   7 +
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/marvell_mhu.c                 | 239 ++++++++++++++++++
 5 files changed, 320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
 create mode 100644 drivers/mailbox/marvell_mhu.c

-- 
2.47.3

