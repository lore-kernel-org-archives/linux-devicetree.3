Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF7737CD33;
	Fri,  5 Jun 2026 21:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694222; cv=none; b=lLC/8DEakFIxU2W19yCOeYgrQxnBXV1WIacgSwl2d390qdOaLixEWlXxNThVxC02oWc3mEclzdMuhvf4Y1XJmpso6eDl4yU3GtSnAKSC6kdbA2wQvAseaqKJQWHjCo4oVTPSVkzzxZ5bdDkfaSjjXaTnTox6mNaVfXxb6MQhGsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694222; c=relaxed/simple;
	bh=qLhJDnbaRNz19Fi8K3B7gjVfvak74cSaN2hmdY8LxEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZ1qmp4S7lP5YSc075Gd75AcXd+feFiFMkfZtvXDFfLoka9bZQWUhybkD+k99T6JkLgyL7EA7DU17Y0pyyxRKtZtmm+VlEC4k/rZVZWsG4n7fEFW35nhhEb7hT02+RhJRGqWXUYxl7ZToFXDz9pZ8F0I/yLFB1DiK+4Zk4KftUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=UBRskOvd; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="UBRskOvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780694218; x=1781299018;
	i=markus.stockhausen@gmx.de;
	bh=8ObT6umpC5lXX2oOCAOJJzvgIq7v4mFjIxpxD0yyQqU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UBRskOvdZD+VnFo7pzwdExqQdd9iYh60Kov+Szu+q2bbw7yYS0stRoTRe1+7SSNd
	 DXzSUklprLXmY/jTLwSGKjbbMRYv5FdlVe0a6KPi1HWLlg2si+vYL0RJTejwHChRF
	 WXqeq8Z8jBe0f7V2PC6nEmc2/z2Ij54GYZCJ8qauhgMvXoA0vr8V6B/KwrAJj903x
	 6bTSm+VVCRSONqi9jW6/h0lUGngmERTQ+H8FQZ+F0VMRpJhjRT0eluVgY/cw0jTPX
	 0oAQN2IvdE6G78QJw5dcWaRkeagEFiLufUB5Bw/aQA28dEwLrPCvVuctfGq+GLA8T
	 7qOTy1Jv8PqozltG5w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8qd-1xA9KZ2SPd-00cQKU; Fri, 05
 Jun 2026 23:16:58 +0200
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
Subject: [PATCH 4/7] irqchip/irq-realtek-rtl: Add mask for interrupt handling
Date: Fri,  5 Jun 2026 23:16:43 +0200
Message-ID: <20260605211646.2101652-5-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605211646.2101652-1-markus.stockhausen@gmx.de>
References: <20260605211646.2101652-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JJLzGYBRdGpSl4teYOtU44xWk/WjceSUYoKOKgonqxnsSGksbeU
 lAof3zQ3r1s3mmpc7+Q+BnCqB8daIDSc1r3fm3iwmhhTAEjdZZ33T9khnvhcLhOB3ZLou84
 vdy/vWAP5c62sgw+rZI0WSbsQUUSaHhHk0ocmnd+IvuJeBKo2B1uXODhEJz95pQzYxp6RbK
 JeOESFA/rXHx7aLP3sixg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ja9SdPxTc8w=;GktF1nmwmzGc7n1LWx1X/PDfSFJ
 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

When using multiple domains for the Interrupt controller, each one
must know which hardware interrupts it serves. Add a mask that is
filled during setup and apply it during interrupt handling.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/irqchip/irq-realtek-rtl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realt=
ek-rtl.c
index 9629b4bed635..508c2dae7ec1 100644
=2D-- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -27,6 +27,7 @@
=20
 struct realtek_ictl_output {
 	struct irq_domain *domain;
+	u32 mask;
 };
=20
 static DEFINE_RAW_SPINLOCK(irq_lock);
@@ -109,15 +110,17 @@ static struct irq_chip realtek_ictl_irq =3D {
 	.irq_set_affinity	=3D realtek_ictl_irq_affinity,
 };
=20
-static int intc_map(struct irq_domain *d, unsigned int irq, irq_hw_number=
_t hw)
+static int intc_map(struct irq_domain *d, unsigned int irq, irq_hw_number=
_t hw_irq)
 {
+	struct realtek_ictl_output *output =3D d->host_data;
 	unsigned int cpu;
=20
 	irq_set_chip_and_handler(irq, &realtek_ictl_irq, handle_level_irq);
=20
 	guard(raw_spinlock_irqsave)(&irq_lock);
+	output->mask |=3D BIT(hw_irq);
 	for_each_present_cpu(cpu)
-		write_irr(cpu, hw, 1);
+		write_irr(cpu, hw_irq, 1);
=20
 	return 0;
 }
@@ -136,7 +139,7 @@ static void realtek_irq_dispatch(struct irq_desc *desc=
)
 	unsigned int hw_irq;
=20
 	chained_irq_enter(chip, desc);
-	pending =3D readl(REG(cpu, RTL_ICTL_GIMR)) & readl(REG(cpu, RTL_ICTL_GIS=
R));
+	pending =3D readl(REG(cpu, RTL_ICTL_GIMR)) & readl(REG(cpu, RTL_ICTL_GIS=
R)) & output->mask;
=20
 	if (unlikely(!pending)) {
 		spurious_interrupt();
=2D-=20
2.54.0

