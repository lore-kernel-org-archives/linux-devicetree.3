Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C9E3D646B;
	Fri,  5 Jun 2026 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694226; cv=none; b=PlcQaXWC88C+kpauN+5aX4yNmHWwytc1xACnuJUQ2N8TMyMhe1aj+WKpCmuLyNvgETqnZJpZwAqVuZ5wt3k7VwFXmOGneN60NtOMhupaA252l3IERRD5vKzhdsDKpcX6KlFqQEYVZBoa6kwf7EK5/eQT051TZ7NVJmsqxseR7Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694226; c=relaxed/simple;
	bh=mM7LbsxbCO7Dx40wQiiVdLrZOJpQ3T03A889ahHz2kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfaNAJE9c2FyN/lL/sB7gq1e1QA78V6DeMT0pYRy/T7GN4vMR1LCpHtRNA03DZ0AtyB3lovOcjZkDq6T4UhWoC9poYFjvxbHBAVM68e2cblxg98o6VQQs/bdwNxCanSbgeGLNeg/AnFk0TQLEQgRZqA3cUHhHIUSvOE55aT+oT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=tCjZytCK; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="tCjZytCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780694219; x=1781299019;
	i=markus.stockhausen@gmx.de;
	bh=Ho4iOoZFjJJ/+FiX986dWxBjiM6C7NC1CsfaEIj5y6A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tCjZytCKPN/4m5TPp8VXwi6pGz/0tEmWBwHQmPQfm4eP2VNF6JEPqKnKXQLdLCzx
	 Lkl1W8HTbq/UGR5KK6QZO3X4UZKbisL2mDNGNfLuKGlL4VrXeKu5VrdSc32OPLBX4
	 XhJS6WRWsqlrcp3wY8ZU/bH4dSexnMjIW6D+RiUcodPMYJLbx0zXzQ7J2fjVbqFiO
	 r3+/aKheb87RWNbjDOSsfc8S5iXkVx4VbB2Yjd2nSXrP0htNpVaG+aaz5NlA+oqE5
	 e7QaKae082mcjtrLkFAe7oXUSXBNiuiQsEnyTwHFMyP5ROSsfjktSxfYU1aHA5iWd
	 PqEdnMrpopLkdfNTew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFsZ3-1wTcmb3MCN-009672; Fri, 05
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
Subject: [PATCH 5/7] irqchip/irq-realtek-rtl: Add a select function
Date: Fri,  5 Jun 2026 23:16:44 +0200
Message-ID: <20260605211646.2101652-6-markus.stockhausen@gmx.de>
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
X-Provags-ID: V03:K1:WXH3GLvcH+HxQgGI72CH1POK9C5N40PsG57zh2wlyyuEkTzxPHq
 ye4xvhDDwSQaahvXexL2l88npr1CRNXstqRfMChs7ItQ7i/bN5v6S4K7bVLP/ANlSX/fqL2
 dmB+OM14Rq0sAuYH7gl5DKhy2PeK/nULSGq2e5nDFPrejlTJo5XaDUqWHwNjtZjgp/lj7Fr
 qrpaQLjUQK8HfSJZNSx4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O90o6rDmbR4=;GeZGntuVWS76EC8iBiI6n/Zb+Ws
 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
 6jucAEyM3gW2fIoY95kOgTq11ypyuZJ1I9vVK6k

When working with multiple domains, the interrupt registration
must know to which domain it attaches. Add a select function that
takes care of the lookup. Logic is as follows.

If a device needs explicit parent routing it can request it by
giving an index as a second argument in the device tree. E.g.

intc: interrupt-controller@3000 {
  ...
  interrupts =3D <2>, <3>, <4>, <5>, <6>, <7>;
};

uart1: uart@2100 {
  ...
  interrupt-parent =3D <&intc>;
  interrupts =3D <31 1>;
}

This way the serial console with hardware interrupt 31 will be
routed via SoC interrupt 3. If the second argument is not given,
the first parent interrupt of the controller is selected.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/irqchip/irq-realtek-rtl.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realt=
ek-rtl.c
index 508c2dae7ec1..546d294bad35 100644
=2D-- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -26,7 +26,9 @@
 #define REG(cpu, x)		(realtek_ictl_base[cpu] + x)
=20
 struct realtek_ictl_output {
+	struct fwnode_handle *fwnode;
 	struct irq_domain *domain;
+	unsigned int index;
 	u32 mask;
 };
=20
@@ -125,9 +127,25 @@ static int intc_map(struct irq_domain *d, unsigned in=
t irq, irq_hw_number_t hw_i
 	return 0;
 }
=20
+static int intc_select(struct irq_domain *d, struct irq_fwspec *fwspec,
+		       enum irq_domain_bus_token bus_token)
+{
+	struct realtek_ictl_output *output =3D d->host_data;
+	unsigned int index =3D 0;
+
+	if (fwspec->fwnode !=3D output->fwnode)
+		return false;
+
+	if (fwspec->param_count =3D=3D 2)
+		index =3D fwspec->param[1];
+
+	return index =3D=3D output->index;
+}
+
 static const struct irq_domain_ops irq_domain_ops =3D {
-	.map =3D intc_map,
-	.xlate =3D irq_domain_xlate_onecell,
+	.map	=3D intc_map,
+	.select	=3D intc_select,
+	.xlate	=3D irq_domain_xlate_onecell,
 };
=20
 static void realtek_irq_dispatch(struct irq_desc *desc)
@@ -197,6 +215,8 @@ static int __init realtek_setup_parents(struct device_=
node *node)
 	}
=20
 	output->domain =3D domain;
+	output->fwnode =3D of_fwnode_handle(node);
+	output->index =3D 0;
 	irq_set_chained_handler_and_data(parent_irq, realtek_irq_dispatch, outpu=
t);
=20
 	return 0;
=2D-=20
2.54.0

