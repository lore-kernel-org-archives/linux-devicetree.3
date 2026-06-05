Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA71B78F3;
	Fri,  5 Jun 2026 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694221; cv=none; b=QfVGx8XoztLnQsqc/7MBueEkJn08uxN8qivjCVOn6Ka1H6Rt3/XwnOFBT3ABiZ9bs0Ye8yf6T5y0uSOceQU9nfiewBhEbv9J033jm/5ecf4EBG6bemhMBFdEFdq95qBaohc9AZIdZH3DEXKwAS2HKbrm4EyoMCAxqehS1M3M5a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694221; c=relaxed/simple;
	bh=2mWo7qvKGtyRI8zqGN0FALEm5qQx8MEDXClpk7ipdxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CckOhBkIFzMktkecy7/UK+VP3i5kcmn2E4xTtAmsm7oQw0ixHDzu2DqZz+uR+7BPZK4DLVKb271VndEXPIozvZ5SVSn+lcoo8+2q6e7YE5qp3Q+2Qfa8u6JqeXkSU2EXT9gKRmRRwWsu6dgGTAWwoqKnDiqmJqjHO5cFOGiFGq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=bqzZ5NLe; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="bqzZ5NLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780694217; x=1781299017;
	i=markus.stockhausen@gmx.de;
	bh=oFxcuMJ6osgASjMsSZwVcfM+b3rzYyEUR7in+7BB8lM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bqzZ5NLe0zjL1OpLySt4h2W7rHSdVACXwKbszAoWTSxaNVHtGzG8I5J7qAq+wKHs
	 o4J0r9/zLlrrVtIC5ry8Zat/jtY5cAN+Ig26HID+h82xVB3iXm2xJ0VkB5QfKwBCO
	 8Nun4w5IC1ngkXcvvJB4tjY0kh6fWA6Wyq+rSm8cQjIu4iaoHWU0UAXrJeT32kfnP
	 J81MWVVFPROSvSUXgi0VOt/uAvn17y9jbn//NtAjaP943a9hQQ15YuC4oRV0DfEm2
	 QiwYvaGCdiuLp4L//Fpt49HfQ+0HmBRa1wSt2ipuDup+K99d1NSUV/312ENmqackL
	 DgJ72Geb0ZSIU9h5Fg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWzk3-1wkkC0346D-00SPPm; Fri, 05
 Jun 2026 23:16:57 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 0/7] irqchip/irq-realtek-rtl: Add multi parent support
Date: Fri,  5 Jun 2026 23:16:39 +0200
Message-ID: <20260605211646.2101652-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R44xBIaN35ZZpkrt3W16OPyne1Ze6Pn96K9j4AoqdJja0FAD1Hd
 wfE4z2brRFmfWD49el3AqEN/GhzEo3r8g0S546UM/VfYFuMgwk6GWsDX/AzN0G+weqGS+7D
 3ePIJw6W1McvDsb2etV8f8JVAxuPRuHrpufcktbsr0ux1CSbEEj5ocSrRq6F4cL/aTcboi+
 INkP0QqBj5X9jP4U5yBBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lnA4qbkwHok=;Bbl3UIdls2xjS6DU7z2S521nirb
 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
 Bo2WbxbsJccp3MV3PYpU5lRnIHw=

The Realtek Otto switch series consists of multiple devices.

- RTL838x: single core (Realtek proprietary IRQ controller)
- RTL839x: multi core (Realtek proprietary IRQ controller)
- RTL930x: multi core (Realtek proprietary IRQ controller)
- RTL931x: multi core (MIPS GIC controller)

The proprietary interrupt controller supports hardware interrupt
routing. To be precise:

- The hardware knows up to 32 different interrupts.
- These can be assigned dynamically to the normal MIPS=20
  interrupts (2-6).

For this each of the 32 hardware interrupts has a routing
register. If properly set up, important interrupts (like
timers) can be prioritized.

Until now all interrupts are always routed to the low priority
MIPS interrupt 2. This series extends the driver by registering
multiple domains for the different MIPS interrupts and adding
the possibility for hardware devices to map a desired parent
interrupt.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--



Markus Stockhausen (7):
  dt-bindings: interrupt-controller: realtek,rtl-intc: Allow 2 interrupt
    cells
  irqchip/irq-realtek-rtl: Use helper for parent setup
  irqchip/irq-realtek-rtl: Add interrupt data structure
  irqchip/irq-realtek-rtl: Add mask for interrupt handling
  irqchip/irq-realtek-rtl: Add a select function
  irqchip/irq-realtek-rtl: Allow shuffled interrupt order
  irqchip/irq-realtek-rtl: Activate multiple parents

 .../realtek,rtl-intc.yaml                     |   5 +-
 drivers/irqchip/irq-realtek-rtl.c             | 152 +++++++++++++-----
 2 files changed, 113 insertions(+), 44 deletions(-)

=2D-=20
2.54.0

