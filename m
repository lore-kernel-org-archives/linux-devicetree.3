Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E43CBE80;
	Fri,  5 Jun 2026 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694223; cv=none; b=o+6+b+5rJaUdWq44M//lyB0ZxQ7iX4/p0xhNehWlOXwhALRBAu7eHEPUUB4C036TVfYmYPTIfTpJ0fzVvdv7Yq8H8kkAfjgZA5dp0J5fU+wHDS1fcs8syn0xtBgp9xbkdI1fMB4jjQhsbumHl4EBByVSX5x/tKl7xo95GCOIuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694223; c=relaxed/simple;
	bh=bGBa6574lYMBcACrzqd+1waqq++tmxM6kUS/zVzR734=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DS+u5Nv19MTxbIF/+DwogcMJ3nR++VJGvxHQfpmdTozI/B01Qqvkr30uUIgAc3FWj/F3L7d0/gzXD35u8ZOj1R//2cnHC3K4z3PVuwFMCHXAHiHQzoLvLesrhEstLf+1U6tmlmTlxulqF5g2aNo/AWJp2BLUeywGaZCg5x7JYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=c56Nbihn; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="c56Nbihn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780694219; x=1781299019;
	i=markus.stockhausen@gmx.de;
	bh=sJKBaHJ0xBGt4U0SgxxwEOltdZ90kiMQjkElu+hdHTw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=c56Nbihnqfrl/xk1ntrRdFfPMnJyptpFe2dwS0ibdMuk9Yub0oGYl+kBtJn64/H3
	 LTqsZbr4FEE/piM5UmYUXt16GinrXfbJw9PnSDhaO9T3RJzmQeOluVQUXcn5KkJft
	 4Rfxh4OAa7+zWYKNKlV3+FWZDlG2LjcL84LkVVBjctVayf3wpe/DApH/GRUxMSAIG
	 F0uKPE/FxXW5/DpU52Na+f2uIg+JiZOwUd7gHzfBXrgW5ZJkWPI9NW63Ghy4d0udN
	 OJZrylmk51hj82qt5ivGhNC2B627EG3EqgXFoIfKcJY0RqDCnZlZEBtgdlKHeVj0a
	 egLwMonKeXQJyVGyfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSc1L-1wgMTK06kj-00Wn8U; Fri, 05
 Jun 2026 23:16:59 +0200
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
Subject: [PATCH 6/7] irqchip/irq-realtek-rtl: Allow shuffled interrupt order
Date: Fri,  5 Jun 2026 23:16:45 +0200
Message-ID: <20260605211646.2101652-7-markus.stockhausen@gmx.de>
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
X-Provags-ID: V03:K1:jk9kcW84vkJ0GWb/S6x0w620wAfqNiru5ACr7kHoXUs7ZTiu1qv
 KwRwcFpwLiONifvJfYm4wqSUG+4pn0ZB1F3XyxOGGvxY3eThiRE+4To1lPLZGzbfFGhvJ3/
 riGPh9UVr/9Y2I6zfiCBZaDLHX0BfL9NcDwgSBQyKuHMAh4EX6MGGuLZ7WrayzyW42ypc4+
 nPK+fS9WSLvSB5R72aoBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7KlsK7VYK+A=;bKnQKeXl5q81SRUqswM+bagm750
 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
 KvFgPqGGpKXR42pnc2Tlo+eeEvkFNQQzqNsApQY

The driver silently assumes that the first given interrupt in
the device tree is nailed to "2". Any deviation from this will
break the driver. Fix this by storing the given interrupt
in the domain data structure and writing the proper value
to the routing register.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/irqchip/irq-realtek-rtl.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realt=
ek-rtl.c
index 546d294bad35..5c5097edbc98 100644
=2D-- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -28,6 +28,8 @@
 struct realtek_ictl_output {
 	struct fwnode_handle *fwnode;
 	struct irq_domain *domain;
+	unsigned int parent_irq;
+	unsigned int parent_hwirq;
 	unsigned int index;
 	u32 mask;
 };
@@ -122,7 +124,7 @@ static int intc_map(struct irq_domain *d, unsigned int=
 irq, irq_hw_number_t hw_i
 	guard(raw_spinlock_irqsave)(&irq_lock);
 	output->mask |=3D BIT(hw_irq);
 	for_each_present_cpu(cpu)
-		write_irr(cpu, hw_irq, 1);
+		write_irr(cpu, hw_irq, output->parent_hwirq - 1);
=20
 	return 0;
 }
@@ -175,6 +177,7 @@ static int __init realtek_setup_parents(struct device_=
node *node)
 {
 	int err, parent_irq, num_parents =3D of_irq_count(node);
 	struct realtek_ictl_output *output;
+	struct irq_data *parent_data;
 	struct of_phandle_args oirq;
 	struct irq_domain *domain;
=20
@@ -207,6 +210,12 @@ static int __init realtek_setup_parents(struct device=
_node *node)
 		goto err_out;
 	}
=20
+	parent_data =3D irq_get_irq_data(parent_irq);
+	if (!parent_data) {
+		err =3D -EINVAL;
+		goto err_out;
+	}
+
 	domain =3D irq_domain_create_linear(of_fwnode_handle(node), RTL_ICTL_NUM=
_INPUTS,
 					  &irq_domain_ops, output);
 	if (!domain) {
@@ -217,6 +226,8 @@ static int __init realtek_setup_parents(struct device_=
node *node)
 	output->domain =3D domain;
 	output->fwnode =3D of_fwnode_handle(node);
 	output->index =3D 0;
+	output->parent_irq =3D parent_irq;
+	output->parent_hwirq =3D irqd_to_hwirq(parent_data);
 	irq_set_chained_handler_and_data(parent_irq, realtek_irq_dispatch, outpu=
t);
=20
 	return 0;
=2D-=20
2.54.0

