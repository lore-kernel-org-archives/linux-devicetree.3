Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174816;
	b=yJhxWsEb55VwHzGZAfXQh7KHmWQUgZTyGBuDsLg2LvgFkB31PxpmjxFsI4hCH/Xi8TVz
	 I3Wwh9UEU+WsU0MhqFgMPdQtXEkaXDbLm/72ipRx0pQgmCZmuS9M6bMAi606LfrLWEYqX
	 HAssQS1q1Z/xzvX7RNIA8zVHxdp0QP66FX0AqixdukxgdLUL6j7yvmbE1/ZspHUIq7TKz
	 4kB1CAbkde3Dp3mJvFOLOb3Mqs+ggfKVaEOxGUEL5WPoD+3RZyg5oPMHBVLPP7l3C+1Lh
	 KpseMT4afSNTkB//r9kxHFk0uKRRFuED1Vt7aSW3V681vgud2Be+gzR62nSc1XJXYIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174816;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=z7GZse95e9OsWMMR9FTF/D6iQnoJXWz8o3LKfdTm+tU=;
	b=DFws6DZoXf8vJ8YNCv7HJDoS1vKITzLpxqy9RH5IviisGPMCvW0y0/AyWFGtyIuG4g6E
	 9OCuVsRAbLQaJ+QLr8qi9SvQdpI4FNqZRL24aSrnRlGf2f/uyG9auBbBrOejC0nYErJMv
	 KXafd1Ac++ehRikLEHVdeQXK4NQ3BTEXyHig1sTh/glnY5kgAcsBV91Uy29NI24S7ib/g
	 fU2eaYrIrY7cZaxP2YP7zOEf7nWA/n1Ix6d8vA/UgIfBOWPshnE8uA0RobJVFjjgFayZH
	 Z/iqcypgqWW+kqUJ5td5tjAEZ3jISYZbofe+DDzq4a2EA5L4aMGKKfRCjfQCSKVw2Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ii0O5BgW;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F73E606A331;
	Fri, 20 Nov 2026 11:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F73E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ii0O5BgW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E66524E41681;
	Fri, 20 Nov 2026 11:40:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA9536017D;
	Fri, 20 Nov 2026 11:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28D7A11BC0D5A;
	Fri, 20 Nov 2026 12:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795174806; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=z7GZse95e9OsWMMR9FTF/D6iQnoJXWz8o3LKfdTm+tU=;
	b=Ii0O5BgW3ORmBERcxum5rHlZoh99KBF/YCCtFeyC90YTIam82qxFnQMYqdBzYHsjRRtQ0b
	ceKkW1iqU/N/rtgs8+hkqhRNogEPa8nZ4YXmxaE1cQA5V6Zn06KjZIWb9J+BW93OnTkMa+
	5uYCb0QSVQRdi1W64qNZpNMhKfCxzhm4jIsP4sXU7O8sV8G23JV1k9cNU2YzX/d+vOXJBV
	J4Prvo7WtqZK3yGLYwOc4qyVGOnCLk9jbd5Y76Dpd/RpnwdWCQ8EpZOD5E7FjZ0kTD/v60
	rhGh+O0VRW0FZy5+tXA0u9a++pIsff0m1tztoXhAHY2AdSU89Csrh+2+OytrkA==
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
Subject: [PATCH v2 0/2] mailbox: Add Marvell MHU driver
Date: Fri, 20 Nov 2026 12:39:50 +0100
Message-ID: <20261120113952.168265-1-paul.cercueil@bootlin.com>
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

This is the v2 of my patchset that adds support for the mailbox found in
the OcteonTX and OcteonTX2 based SoCs, which is used for SCMI
communication.

I dropped v1's last patch (that affected the SCMI driver) since SCMI
maintainers and Sashiko reported that I could replace it with a simple
DT property.

Changelog:

v2:

* [1/2]:
 - Fix binding path in MAINTAINERS file
 - Move MAINTAINERS entry so that it's in alphabetical order
 - Fix formatting of DT example

* [2/2]:
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

