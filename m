Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9479D3D7D65;
	Fri,  5 Jun 2026 21:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694227; cv=none; b=j5WUzFa6wrszvBWV8fViDA/YbGlxfZMr4VCruZ6Xnd0uLafhW6oJErsgtD47x46fAm7kbaIJWAt78QNgQDqQDmh+zJhTOpCMyJBEdCCT1THuOaPYXzYDcIUYH3eG8hguag2yNRpUehWLHzTfk4beLEB+le9atx7UYTUXpQCz/MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694227; c=relaxed/simple;
	bh=g1pG2ZTysXWQmXiT4+ryi+mJcrTfOdkpVztuHXZIcPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H10cCyWVFjKYJRWj2MY+/FxSfECTUBZ1OU7/u3bvWPLw+JMeVsR5sOyU7y/8rCEQKuZQ8Dx7mIBgckd3oPO0gh1Z+vzCiW8Cdwn5k3rE20ASfvBUFzlkTYTr45pineFgvZl/bmLlS8l53Ugg+zLzWML9W2vBlQ0/jXNjkb4tzqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=GKR6C0Ig; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="GKR6C0Ig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780694219; x=1781299019;
	i=markus.stockhausen@gmx.de;
	bh=JL94esvjbA44XPI2axxasghgDp4V7quH5bo7dtADKS0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GKR6C0IgfMfRcwUhqDf2U9tB00UaUgs7x/zbet5aZRviSMsQ1xZlxtUIzoOg+eRU
	 SzfRZ4dTK8nWD9b0BRmWOi43ZCFbe1rd8yvCk+b2MrRNWxVAsupzz8jsLV7SoEYVd
	 lyKCU5bgxtSfNUrNZcfc1wcexd3Jr4VQnkJIAQPV8295+BFmmti4E6SVbS8kb2qQn
	 H8CEiZyusE1ji9m9I0eEbwQhELwITbQP4/jeVT6JKX3I8mkGmBJAaHG2C+z4U912j
	 Ar8C2LEuN6sUpka467fHpbkaMybtX4mMRtDQOo0LJ2WFOnYlcXkfq8/e9NWmLNy7v
	 jtzzJlz5gMYgGeN5Rg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbBk-1xNA0D0zv4-00xeVp; Fri, 05
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
Subject: [PATCH 7/7] irqchip/irq-realtek-rtl: Activate multiple parents
Date: Fri,  5 Jun 2026 23:16:46 +0200
Message-ID: <20260605211646.2101652-8-markus.stockhausen@gmx.de>
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
X-Provags-ID: V03:K1:cB59YX6YgQQDtGYEoQAxx02+3VFI15JgC/RJ2woytzjOuzUSDbU
 wuiokGSK7Z/ugQ6JTAnbPwzcobc8uQpfpsN7zk8kFjIfueJtKgFu1PpPb6wnWko1JCpdZZZ
 Grax/sciLyXC5RGkyUiXPO+adJX24iXI/vJTdMXJY81XMJwNDPnJ3XAnSgwMsmHyIqjgLJ2
 vm5piTZsvdjqhHwmDrTRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G4Ke16b8G/w=;Ya50ste/QrxG8btP9AAVZ6SP9H+
 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
 DYdDsRvi4lZOMoMGN8=

Until now the driver exactly registers a single parent interrupt.
Relax this to make use of all defined interrupts in the device tree.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/irqchip/irq-realtek-rtl.c | 88 +++++++++++++++++--------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realt=
ek-rtl.c
index 5c5097edbc98..4b59e0cd86bf 100644
=2D-- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -175,64 +175,72 @@ static void realtek_irq_dispatch(struct irq_desc *de=
sc)
=20
 static int __init realtek_setup_parents(struct device_node *node)
 {
-	int err, parent_irq, num_parents =3D of_irq_count(node);
+	int p, cnt, err, parent_irq, num_parents =3D of_irq_count(node);
 	struct realtek_ictl_output *output;
 	struct irq_data *parent_data;
 	struct of_phandle_args oirq;
 	struct irq_domain *domain;
=20
-	output =3D kcalloc(1, sizeof(*output), GFP_KERNEL);
+	cnt =3D max(1, num_parents);
+	output =3D kcalloc(cnt, sizeof(*output), GFP_KERNEL);
 	if (!output)
 		return -ENOMEM;
=20
-	if (WARN_ON(!num_parents)) {
-		/*
-		 * If DT contains no parent interrupts, assume MIPS IRQ 2 (HW0) is
-		 * connected to the first output. This is the case for all known hardwa=
re.
-		 */
-		oirq.np =3D of_find_compatible_node(NULL, NULL,
-						  "mti,cpu-interrupt-controller");
-		if (!oirq.np) {
-			err =3D -EINVAL;
-			goto err_out;
+	for (p =3D 0; p < cnt; p++) {
+		if (WARN_ON(!num_parents)) {
+			/*
+			 * If DT contains no parent interrupts, assume MIPS IRQ 2 (HW0) is
+			 * connected to the first output. This is the case for all known hardw=
are.
+			 */
+			oirq.np =3D of_find_compatible_node(NULL, NULL,
+							  "mti,cpu-interrupt-controller");
+			if (!oirq.np) {
+				err =3D -EINVAL;
+				goto err_out;
+			}
+
+			oirq.args_count =3D 1;
+			oirq.args[0] =3D 2;
+			parent_irq =3D irq_create_of_mapping(&oirq);
+			of_node_put(oirq.np);
+		} else {
+			parent_irq =3D of_irq_get(node, p);
 		}
=20
-		oirq.args_count =3D 1;
-		oirq.args[0] =3D 2;
-		parent_irq =3D irq_create_of_mapping(&oirq);
-		of_node_put(oirq.np);
-	} else {
-		parent_irq =3D of_irq_get(node, 0);
-	}
+		if (parent_irq <=3D 0) {
+			err =3D parent_irq ? parent_irq : -ENODEV;
+			goto err_out;
+		}
=20
-	if (parent_irq <=3D 0) {
-		err =3D parent_irq ? parent_irq : -ENODEV;
-		goto err_out;
-	}
+		parent_data =3D irq_get_irq_data(parent_irq);
+		if (!parent_data) {
+			err =3D -EINVAL;
+			goto err_out;
+		}
=20
-	parent_data =3D irq_get_irq_data(parent_irq);
-	if (!parent_data) {
-		err =3D -EINVAL;
-		goto err_out;
-	}
+		domain =3D irq_domain_create_linear(of_fwnode_handle(node), RTL_ICTL_NU=
M_INPUTS,
+						  &irq_domain_ops, &output[p]);
+		if (!domain) {
+			err =3D -ENOMEM;
+			goto err_out;
+		}
=20
-	domain =3D irq_domain_create_linear(of_fwnode_handle(node), RTL_ICTL_NUM=
_INPUTS,
-					  &irq_domain_ops, output);
-	if (!domain) {
-		err =3D -ENOMEM;
-		goto err_out;
+		output[p].domain =3D domain;
+		output[p].fwnode =3D of_fwnode_handle(node);
+		output[p].index =3D p;
+		output[p].parent_irq =3D parent_irq;
+		output[p].parent_hwirq =3D irqd_to_hwirq(parent_data);
+		irq_set_chained_handler_and_data(parent_irq, realtek_irq_dispatch, &out=
put[p]);
 	}
=20
-	output->domain =3D domain;
-	output->fwnode =3D of_fwnode_handle(node);
-	output->index =3D 0;
-	output->parent_irq =3D parent_irq;
-	output->parent_hwirq =3D irqd_to_hwirq(parent_data);
-	irq_set_chained_handler_and_data(parent_irq, realtek_irq_dispatch, outpu=
t);
-
 	return 0;
=20
 err_out:
+	while (p--) {
+		irq_set_chained_handler_and_data(output[p].parent_irq, NULL, NULL);
+		irq_domain_remove(output[p].domain);
+	}
+
 	kfree(output);
=20
 	return err;
=2D-=20
2.54.0

