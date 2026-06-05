Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E283D413F;
	Fri,  5 Jun 2026 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694225; cv=none; b=tLIZEGbMmI+8/aozn6tb0fGOonoMAiOpBTo67F3gAsC5+YoduVCc6F8wrN5IWZrCNpQWntjmxbgEAByzNfbnizyLOUiATY9aMDlCpWI7avyb2zLfrn9UN1SCRJZjHkZKpF29FTlEEm6F2NFOc8LIxIzA09LVtONbgeew56twz1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694225; c=relaxed/simple;
	bh=rJDlytkk0qZaUsWk1KvAiNsYUXM7xX4ozyANRdhbtuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAGdlX31JmAuj/9+LCeoYWI4xJg3QTwmqTMrcR6eg7yjEzOQxBENj23oCvmcrdqqTt4L16MOCQub+HmygTfAO/QPs9AIrmxauukLgJqkJQCpBCjwhoKVH4o4eGfJ75ILp7hcf9jlASGRgkecdW/N1uOCw/DTzTAjuF+J2PGjtQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=c49iJZvP; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="c49iJZvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780694218; x=1781299018;
	i=markus.stockhausen@gmx.de;
	bh=pu9EaWKuAqw8OfN0nFpNhk1J4kQu0c6fGx0swq2DOxU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=c49iJZvPt/D3tYqnS8dCWFx9uRvOIzvFNbS/g5uoUlvZY0N/v5DZYTmfETk4sq4a
	 PoqxYHX1rsFmF55ZibnU992/V3kMBIerz59KUNjpAOifKNSfg3nVAsXnkmCi/ym+/
	 0yqYRsH4Rt3njKF3qciUKEt01DtxsCreG8SjCZo0WOixQiwaXurHdDF13JVC7XN2R
	 37xu2IkkVelQ0AhHPWYLqGEYWUhqo82D8KCL/qxAHP4iN1e2hjFnwSgNs4OtqITQr
	 ob0yNhwaz1ghYUEr/yy0xdIW1aWo2Fl6lTerYvFG4zEn6Zn7r8uJFhypfgvREy6er
	 zG/NRlK3Lf7KLPTPWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1wo6EZ1aJZ-00P8hy; Fri, 05
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
Subject: [PATCH 3/7] irqchip/irq-realtek-rtl: Add interrupt data structure
Date: Fri,  5 Jun 2026 23:16:42 +0200
Message-ID: <20260605211646.2101652-4-markus.stockhausen@gmx.de>
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
X-Provags-ID: V03:K1:/FIl1pZHTqKfV+LdAYK6nzf2kD/+qEG7In6mooLHLJYAMDBg2ND
 QukIBMdj/hU5HcDOG/NgWjahKbGG758L5L+OONvQ5UMh4L0e/8fRgwmwkOnh2B7ZO2yGbq6
 QHOFa1kpYNz9RSp2eja45+ZE2zN6afy11V2dw9iD8igh8JIicLpswPvX9qSHOK6/ziUv3a4
 rVbx+XTW7peI0JP/AnkbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NGFiWOGunr4=;/G70ADXS6GW/tRaouTNs8j/tIVz
 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
 tfHY89rUW6ldjWCVUM=

To prepare for multiple parent interrupt domains add an intermediate
data structure. For now this will only host the link to the domain.
Additionally adapt a deviating variable name to driver standard "hw_irq".

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/irqchip/irq-realtek-rtl.c | 48 ++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realt=
ek-rtl.c
index 3b4508ec7198..9629b4bed635 100644
=2D-- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -25,6 +25,10 @@
=20
 #define REG(cpu, x)		(realtek_ictl_base[cpu] + x)
=20
+struct realtek_ictl_output {
+	struct irq_domain *domain;
+};
+
 static DEFINE_RAW_SPINLOCK(irq_lock);
 static void __iomem *realtek_ictl_base[NR_CPUS];
=20
@@ -125,11 +129,11 @@ static const struct irq_domain_ops irq_domain_ops =
=3D {
=20
 static void realtek_irq_dispatch(struct irq_desc *desc)
 {
+	struct realtek_ictl_output *output =3D irq_desc_get_handler_data(desc);
 	struct irq_chip *chip =3D irq_desc_get_chip(desc);
 	unsigned int cpu =3D smp_processor_id();
-	struct irq_domain *domain;
 	unsigned long pending;
-	unsigned int soc_int;
+	unsigned int hw_irq;
=20
 	chained_irq_enter(chip, desc);
 	pending =3D readl(REG(cpu, RTL_ICTL_GIMR)) & readl(REG(cpu, RTL_ICTL_GIS=
R));
@@ -139,9 +143,8 @@ static void realtek_irq_dispatch(struct irq_desc *desc=
)
 		goto out;
 	}
=20
-	domain =3D irq_desc_get_handler_data(desc);
-	for_each_set_bit(soc_int, &pending, RTL_ICTL_NUM_INPUTS)
-		generic_handle_domain_irq(domain, soc_int);
+	for_each_set_bit(hw_irq, &pending, RTL_ICTL_NUM_INPUTS)
+		generic_handle_domain_irq(output->domain, hw_irq);
=20
 out:
 	chained_irq_exit(chip, desc);
@@ -149,10 +152,15 @@ static void realtek_irq_dispatch(struct irq_desc *de=
sc)
=20
 static int __init realtek_setup_parents(struct device_node *node)
 {
-	int parent_irq, num_parents =3D of_irq_count(node);
+	int err, parent_irq, num_parents =3D of_irq_count(node);
+	struct realtek_ictl_output *output;
 	struct of_phandle_args oirq;
 	struct irq_domain *domain;
=20
+	output =3D kcalloc(1, sizeof(*output), GFP_KERNEL);
+	if (!output)
+		return -ENOMEM;
+
 	if (WARN_ON(!num_parents)) {
 		/*
 		 * If DT contains no parent interrupts, assume MIPS IRQ 2 (HW0) is
@@ -160,8 +168,10 @@ static int __init realtek_setup_parents(struct device=
_node *node)
 		 */
 		oirq.np =3D of_find_compatible_node(NULL, NULL,
 						  "mti,cpu-interrupt-controller");
-		if (!oirq.np)
-			return -EINVAL;
+		if (!oirq.np) {
+			err =3D -EINVAL;
+			goto err_out;
+		}
=20
 		oirq.args_count =3D 1;
 		oirq.args[0] =3D 2;
@@ -171,17 +181,27 @@ static int __init realtek_setup_parents(struct devic=
e_node *node)
 		parent_irq =3D of_irq_get(node, 0);
 	}
=20
-	if (parent_irq <=3D 0)
-		return parent_irq ? parent_irq : -ENODEV;
+	if (parent_irq <=3D 0) {
+		err =3D parent_irq ? parent_irq : -ENODEV;
+		goto err_out;
+	}
=20
 	domain =3D irq_domain_create_linear(of_fwnode_handle(node), RTL_ICTL_NUM=
_INPUTS,
-					  &irq_domain_ops, NULL);
-	if (!domain)
-		return -ENOMEM;
+					  &irq_domain_ops, output);
+	if (!domain) {
+		err =3D -ENOMEM;
+		goto err_out;
+	}
=20
-	irq_set_chained_handler_and_data(parent_irq, realtek_irq_dispatch, domai=
n);
+	output->domain =3D domain;
+	irq_set_chained_handler_and_data(parent_irq, realtek_irq_dispatch, outpu=
t);
=20
 	return 0;
+
+err_out:
+	kfree(output);
+
+	return err;
 }
=20
 static int __init realtek_rtl_of_init(struct device_node *node, struct de=
vice_node *parent)
=2D-=20
2.54.0

