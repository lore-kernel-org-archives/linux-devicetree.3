Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C4837DAB9;
	Fri,  5 Jun 2026 21:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694222; cv=none; b=qXpsHTBuBXcQrdDxF8+7bTk1VeVpE7T9WdDXrrESaQDcqLbOBzwDAWC2Y74BanKGEEmfT5Ym0UAmpL0j1Gg7zPq7jBe1jJY8iUV0gez4UU25cXxmQvogsODVEpqVSrem6y+qVAgaqFqIwYttWsxXeg53TQIUUptw3DdUvf1NUg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694222; c=relaxed/simple;
	bh=pfnKZ/JEKf+5jA2k2dny6MLMPJSM7mOjTQU2AVNuHio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPNgPzO+yV/od562ae6aLZIi90KXtSi10lIcJcfS6hpulDy8iym1gAOdHeTJSLcUPUviFNGJAI692xjAM6OzauIxUY26a3Kvw67hqnfFESCMWOALyOyBVHunAIeTh8sk6lHzIrhqkn1nu2k/Mba/i8+y4f1UcUtjCaRodyYqrhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=XunTtHTN; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="XunTtHTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780694218; x=1781299018;
	i=markus.stockhausen@gmx.de;
	bh=YLatkjbT+v3ykGSjChVmJ3qUyTRNioKsriDx+oGnYNo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XunTtHTNfSSd8wJKmo7KN1mLprmgwHGwVZJeYT/L2hLGUQ3cBt7WDzxRyVOAtCQT
	 +g009+8uAzovuUemTxfIJz/kvktPG75byWYtPKm9G/p/w0mfR1M6ObPemlF4pw7r2
	 643I/98HtokIu/rJVxBqNBa+GmR0HpmOWAdIiHEq5gGDs4QHGS2UNMK5KSOhAdtHC
	 wbmygeh6Hc6OG/ZJZ6yfDFSd62YqU1UpqNwIjt1r5iy/1+AN3M8vUnFXOw66xGU8R
	 jvAzgJ8yxc7jB7zaDhpTRnBfyFhTHERwVmAK1rlYX/GnB+nLTLJ/BO2/W7VUg1pav
	 +DqiKW0J8NDr464mBw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ygz-1wWyor0jM3-005oKu; Fri, 05
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
Subject: [PATCH 2/7] irqchip/irq-realtek-rtl: Use helper for parent setup
Date: Fri,  5 Jun 2026 23:16:41 +0200
Message-ID: <20260605211646.2101652-3-markus.stockhausen@gmx.de>
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
X-Provags-ID: V03:K1:WyjDicMlLG+y5o60/qEbbVuavc79u0TNLug4FSXf8thaWQS8cyP
 OEDviMrV2Q30grHJJKBLJYLH/mXiQ2ZLIUe7cKBkj9yMskVGbsUdLoqGsQ25holWR6lHcnK
 4Ug3O1DYoPoezaVc0PBQWTQ3Qj0Q7WG4a+8hFfIeRsxPCuU98GATqRXCKirCLhypZerjcHG
 0o4MEd9m6hYqzGRcEc1XQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uIRaO2UAeCw=;53MRDzR9HRNelI1YvwDLUaKs0Zp
 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

With the upcoming commits the parent interrupt setup will be extended.
Relocate it into a separate helper. Although it still works only
for a single interrupt prepare the coding so it can be easily
extended with a loop for multi parent support. For this reduce the
line lengths so that the upcoming indentation still leaves the
width below 100 characters.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/irqchip/irq-realtek-rtl.c | 60 +++++++++++++++++--------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realt=
ek-rtl.c
index 2ae3be7fa633..3b4508ec7198 100644
=2D-- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -147,48 +147,35 @@ static void realtek_irq_dispatch(struct irq_desc *de=
sc)
 	chained_irq_exit(chip, desc);
 }
=20
-static int __init realtek_rtl_of_init(struct device_node *node, struct de=
vice_node *parent)
+static int __init realtek_setup_parents(struct device_node *node)
 {
+	int parent_irq, num_parents =3D of_irq_count(node);
 	struct of_phandle_args oirq;
 	struct irq_domain *domain;
-	int cpu, parent_irq;
=20
-	for_each_present_cpu(cpu) {
-		realtek_ictl_base[cpu] =3D of_iomap(node, cpu);
-		if (!realtek_ictl_base[cpu])
-			return -ENXIO;
-
-		/* Disable all cascaded interrupts and clear routing */
-		for (unsigned int hw_irq =3D 0; hw_irq < RTL_ICTL_NUM_INPUTS; hw_irq++)=
 {
-			disable_gimr(cpu, hw_irq);
-			write_irr(cpu, hw_irq, 0);
-		}
-	}
-
-	if (WARN_ON(!of_irq_count(node))) {
+	if (WARN_ON(!num_parents)) {
 		/*
-		 * If DT contains no parent interrupts, assume MIPS CPU IRQ 2
-		 * (HW0) is connected to the first output. This is the case for
-		 * all known hardware anyway. "interrupt-map" is deprecated, so
-		 * don't bother trying to parse that.
+		 * If DT contains no parent interrupts, assume MIPS IRQ 2 (HW0) is
+		 * connected to the first output. This is the case for all known hardwa=
re.
 		 */
-		oirq.np =3D of_find_compatible_node(NULL, NULL, "mti,cpu-interrupt-cont=
roller");
+		oirq.np =3D of_find_compatible_node(NULL, NULL,
+						  "mti,cpu-interrupt-controller");
+		if (!oirq.np)
+			return -EINVAL;
+
 		oirq.args_count =3D 1;
 		oirq.args[0] =3D 2;
-
 		parent_irq =3D irq_create_of_mapping(&oirq);
-
 		of_node_put(oirq.np);
 	} else {
 		parent_irq =3D of_irq_get(node, 0);
 	}
=20
-	if (parent_irq < 0)
-		return parent_irq;
-	else if (!parent_irq)
-		return -ENODEV;
+	if (parent_irq <=3D 0)
+		return parent_irq ? parent_irq : -ENODEV;
=20
-	domain =3D irq_domain_create_linear(of_fwnode_handle(node), RTL_ICTL_NUM=
_INPUTS, &irq_domain_ops, NULL);
+	domain =3D irq_domain_create_linear(of_fwnode_handle(node), RTL_ICTL_NUM=
_INPUTS,
+					  &irq_domain_ops, NULL);
 	if (!domain)
 		return -ENOMEM;
=20
@@ -197,4 +184,23 @@ static int __init realtek_rtl_of_init(struct device_n=
ode *node, struct device_no
 	return 0;
 }
=20
+static int __init realtek_rtl_of_init(struct device_node *node, struct de=
vice_node *parent)
+{
+	unsigned int cpu;
+
+	for_each_present_cpu(cpu) {
+		realtek_ictl_base[cpu] =3D of_iomap(node, cpu);
+		if (!realtek_ictl_base[cpu])
+			return -ENXIO;
+
+		/* Disable all cascaded interrupts and clear routing */
+		for (unsigned int hw_irq =3D 0; hw_irq < RTL_ICTL_NUM_INPUTS; hw_irq++)=
 {
+			disable_gimr(cpu, hw_irq);
+			write_irr(cpu, hw_irq, 0);
+		}
+	}
+
+	return realtek_setup_parents(node);
+}
+
 IRQCHIP_DECLARE(realtek_rtl_intc, "realtek,rtl-intc", realtek_rtl_of_init=
);
=2D-=20
2.54.0

