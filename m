Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103397;
	b=eEBZDmK38WRMDoB1Xd3/lRRx70+WlFF4RfbZLFKeskt4fl4PMVouHZsI1SZeolcg3Nyo
	 Qmc31yHw8egJDYaHrQpT5mnjRQ5AQNvYE9vqUPhbBngQNkPUm0dawMOW1L/LD4wQUPCfe
	 FeloRlnKuZdjA+fMaX6m1J2jlN2OvKKSdP6bS/Ho/Qwn/ZfPMoxPyQCLjaB+arKXPqq3R
	 n6H5Z2Kb/2U7ZD52SFyYnQyCsg6LQeUZQNI+POVeykwR7vUfb38AWOQAz40p4o9UXj9JL
	 QXoxjcJFTquPgHhOGQMdiZGtr+ptzO8hzbpaZJKUj6II5i+CIMsXlozjDEqwKHlAHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103397;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PaN9kA6314qCNprV5i6r1zdaGjxGwkKafTV9FvJeKqs=;
	b=G+iA2MBO+h1juYbAQr383tgQ2G/uQahAYonr0EDz2LCAjxF2fsP4JAejQf2+cb8ZknUB
	 xLz/EYLLZMsl2yEm3wz39OWWdkrATumwyAh02UCyLUI8jsf8oxCsImi6XbfEd0SR/fiwC
	 +76G+qTvGt/oEnnsyekAhOYqANSfVWiq7LezlgCBOteXrVJhwm2BkzXMKJzJHIUZzAg4w
	 CsLP0Xq9dZhzTjoZDDuSG1y8yG1jVbp49SQssPBA7n9waqCPdJtJDF+9sQRiQP6jZklh9
	 +E7j/gjGY4eiWAuTdfbkPT04D0DeV9LF3Yua5zEGMDbecPV2rF9jFvYfs7WdlspxjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDbw8Z5q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498BF606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDbw8Z5q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEB71F000C5;
	Thu, 19 Nov 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103396;
	bh=PaN9kA6314qCNprV5i6r1zdaGjxGwkKafTV9FvJeKqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDbw8Z5qWaMbk8y8TrshpoBiVmLJ4mgQSx1dyTGCdP2cTp2GbxBIcVrk3bAEPQDpL
	 EV4xp+tIryztAmYNPlbIL3k28upMfOVP1efYMcWN2MDiebBODFKKuCIg5l0xdVOU3f
	 LNxxW7m+m/Um21mBLdaEi4MwO/87vZxvwmQlQuUtB8up0XewLILCSvl4msMlyR1oNs
	 8y+5kh6SG5OBwhNoLcoBXWjeQFiF1lu5Nu4OHxl6Wm7s+2p7VZ0Zm5NhQ+q5Qkvb29
	 BNcPgX9JPvd1zn7cPb1Y7MFWi9ww0hBJ8FgWfkTr3kUPBCweAx5YXZrvKVMXae0qBd
	 9pSGh1m3nb/1g==
Message-ID: <sashiko-outbox-223424@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] mailbox: marvell-mhu: add Marvell MHU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Cercueil" <paul.cercueil@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119152944.276763-3-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
 <20261119152944.276763-3-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:49:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] mailbox: marvell-mhu: manual pci_free_irq_vectors() conflicts
  with devres
- [High] mailbox: marvell-mhu: missing shutdown op causes NULL deref in
  IRQ
- [Medium] mailbox: marvell-mhu: missing PCI dependency in Kconfig
- [Medium] mailbox: marvell-mhu: wrong register and polarity in
  mrvl_mhu_last_tx_done()
- [Low] mailbox: marvell-mhu: duplicate and unused register macro
  definitions
--

commit d88d0044b75f722104999e16b9dd2c9f50a997d0
Author: George Cherian <gcherian@marvell.com>

mailbox: marvell-mhu: add Marvell MHU driver

This commit adds a PCI mailbox controller driver for the Marvell Message
Handling Unit on OcteonTX and OcteonTX2 platforms.

> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ab869769e2789..ce3b70749a182 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -195,6 +195,17 @@ config MAILBOX_TEST
>  	  Test client to help with testing new Controller driver
>  	  implementations.
> =20
> +config MARVELL_MHU
> +	tristate "Marvell Message Handling Unit"
> +	depends on (ARM64 || COMPILE_TEST) && 64BIT
> +	depends on OF
> +	help

[Severity: Medium]
Should MARVELL_MHU also depend on PCI?  Without CONFIG_PCI, building this
driver fails because module_pci_driver() is only defined under CONFIG_PCI
and pcim_request_region() and pcim_iomap() have no !CONFIG_PCI stubs.

[ ... ]

> diff --git a/drivers/mailbox/marvell_mhu.c b/drivers/mailbox/marvell_mhu.c
> new file mode 100644
> index 0000000000000..a037fe104195b
> --- /dev/null
> +++ b/drivers/mailbox/marvell_mhu.c

[ ... ]

> +/*  Register offset: Enable interrupt from SCP to AP */
> +#define XCP0_XCP_DEV0_MBOX_RINT_ENA_W1S	0x000D1C40
> +#define XCP0_XCP_DEV1_MBOX_RINT_ENA_W1S	0x000D1C50
> +#define XCP0_XCP_DEV2_MBOX_RINT_ENA_W1S	0x000D1C60
> +#define XCP0_XCP_DEV3_MBOX_RINT_ENA_W1S	0x000D1C70
> +
> +/* Rx interrupt from SCP to Non-secure AP (linux kernel) */
> +#define XCPX_XCP_DEVY_MBOX_RINT_OFFSET 0x000D1C00
> +#define XCPX_XCP_DEVY_MBOX_RINT(xcp_core, device_id) \
> +	(XCPX_XCP_DEVY_MBOX_RINT_OFFSET | \
> +	((uint64_t)(xcp_core) << 36) | \
> +	((uint64_t)(device_id) << 4))
> +
> +/* The interrupt status register */
> +#define SCP_TO_AP0_MBOX_RINT  XCPX_XCP_DEVY_MBOX_RINT(SCP_INDEX, DEV_AP0)
> +
> +#define XCPX_XCP_DEVY_MBOX_RINT_OFFSET	0x000D1C00
> +#define XCPX_XCP_DEVY_MBOX_RINT(xcp_core, device_id) \
> +	(XCPX_XCP_DEVY_MBOX_RINT_OFFSET | \
> +	((uint64_t)(xcp_core) << 36) | \
> +	((uint64_t)(device_id) << 4))
> +
> +#define SCP_TO_AP0_MBOX_RINT  XCPX_XCP_DEVY_MBOX_RINT(SCP_INDEX, DEV_AP0)
> +#define SCP_TO_DEV0 XCPX_XCP_DEVY_MBOX_RINT(0, 0)
> +#define SCP_TO_DEV1 XCPX_XCP_DEVY_MBOX_RINT(0, 1)
> +#define SCP_TO_DEV2 XCPX_XCP_DEVY_MBOX_RINT(0, 2)
> +#define SCP_TO_DEV3 XCPX_XCP_DEVY_MBOX_RINT(0, 3)

[Severity: Low]
This isn't a bug, but XCPX_XCP_DEVY_MBOX_RINT_OFFSET,
XCPX_XCP_DEVY_MBOX_RINT, and SCP_TO_AP0_MBOX_RINT are defined twice here,
and XCP0_XCP_DEV0/1/3_MBOX_RINT_ENA_W1S and SCP_TO_DEV0..3 are unused.

> +
> +struct mrvl_mhu {
> +	/* SCP link information */
> +	void __iomem *base; /* tx_reg, rx_reg */
> +
> +	struct mbox_controller ctrl;
> +	struct mbox_chan chan;
> +};
> +
> +static irqreturn_t mrvl_mhu_rx_interrupt(int irq, void *p)
> +{
> +	struct mrvl_mhu *mhu =3D p;
> +	u64 val;
> +
> +	/* Read interrupt status register */
> +	val =3D readq_relaxed(mhu->base + SCP_TO_AP0_MBOX_RINT);
> +	if (val) {
> +		/* Clear the interrupt : Write on clear */
> +		writeq_relaxed(1ul, mhu->base + SCP_TO_AP0_MBOX_RINT);
> +		/* Poke mbox */
> +		mbox_chan_received_data(&mhu->chan, (void *)&val);
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +static int mrvl_mhu_send_data(struct mbox_chan *chan, void *data)
> +{
> +	const u64 doorbell =3D 0xff;  /* Arbitrary value, SCP requires a value =
*/
> +	struct mrvl_mhu *mhu =3D chan->con_priv;
> +
> +	/* signal SCP */
> +	iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
> +
> +	return 0;
> +}
> +
> +static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct mrvl_mhu *mhu =3D chan->con_priv;
> +	u64 status;
> +
> +	status =3D ioread64(mhu->base + XCPX_XCP_DEVY_MBOX_RINT(0, 2));
> +
> +	return status !=3D 0;
> +}

[Severity: Medium]
Does mrvl_mhu_last_tx_done() check the wrong register and polarity?

XCPX_XCP_DEVY_MBOX_RINT(0, 2) is SCP_TO_AP0_MBOX_RINT, the SCP-to-AP0 RX
interrupt status register, which mrvl_mhu_rx_interrupt() immediately clears
to 0 in hardirq context when an RX interrupt fires.  Consequently, any
client relying on the controller's txdone_poll =3D true will read 0 and time
out.  Meanwhile, the AP0-to-SCP TX interrupt status macro
AP0_TO_SCP_MBOX_LINT defined earlier in this file is unused, and its status
bit is cleared to 0 when the SCP consumes the doorbell (status =3D=3D 0).

> +
> +static int mrvl_mhu_startup(struct mbox_chan *chan)
> +{
> +	struct mrvl_mhu *mhu =3D chan->con_priv;
> +
> +	/* Enable interrupts only if there is client for data */
> +	writeq_relaxed(1ul, mhu->base + XCP0_XCP_DEV2_MBOX_RINT_ENA_W1S);
> +
> +	return 0;
> +}
> +
> +/* Define operations related to mbox */
> +static const struct mbox_chan_ops mrvl_mhu_chan_ops =3D {
> +	.startup =3D mrvl_mhu_startup,
> +	.send_data =3D mrvl_mhu_send_data,
> +	.last_tx_done =3D mrvl_mhu_last_tx_done,
> +};

[Severity: High]
Can an SCP interrupt after mbox_free_channel() cause a NULL pointer
dereference in mrvl_mhu_rx_interrupt() -> mbox_chan_received_data()?

mrvl_mhu_startup() enables the hardware interrupt via
XCP0_XCP_DEV2_MBOX_RINT_ENA_W1S, but mrvl_mhu_chan_ops provides no
.shutdown callback to disable it when a client releases the channel (or if
the interrupt was already left enabled before a client binds).  Once
mbox_free_channel() sets chan->cl =3D NULL, an incoming interrupt calls
mbox_chan_received_data(&mhu->chan, ...), which unconditionally
dereferences chan->cl->rx_callback.  In addition, mrvl_mhu_rx_interrupt()
clears SCP_TO_AP0_MBOX_RINT before mbox_chan_received_data() finishes
processing the shared memory payload.

[ ... ]

> +	pci_set_drvdata(pdev, mhu);
> +	ret =3D pcim_enable_device(pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pcim_request_region(pdev, BAR0, DRIVER_NAME);
> +	if (ret)
> +		return ret;
> +
> +	mhu->base =3D pcim_iomap(pdev, BAR0, pci_resource_len(pdev, BAR0));
> +	if (!mhu->base)
> +		return -EINVAL;
> +
> +	/* Configure IRQ from SCP to AP */
> +	ret =3D mrvl_mhu_setup_irq(pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mbox_controller_register(&mhu->ctrl);
> +	if (ret) {
> +		pci_free_irq_vectors(pdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mrvl_mhu_remove(struct pci_dev *pdev)
> +{
> +	struct mrvl_mhu *mhu =3D pci_get_drvdata(pdev);
> +
> +	mbox_controller_unregister(&mhu->ctrl);
> +	pci_free_irq_vectors(pdev);
> +}

[Severity: High]
Does calling pci_free_irq_vectors() here tear down the MSI-X IRQ descriptor
while the devm_request_irq() handler is still registered?

Because mrvl_mhu_probe() calls pcim_enable_device(), pci_alloc_irq_vectors()
is already managed by devres (via pcim_msi_release()).  Calling
pci_free_irq_vectors() manually in mrvl_mhu_remove() and on the
mbox_controller_register() failure path frees the IRQ descriptors before
devres runs devm_irq_release(), which triggers a warning when removing the
populated procfs IRQ directory, causes free_irq() to fail to find the
descriptor and leak struct irqaction, and then runs pci_free_irq_vectors()
a second time during devres teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119152944.2767=
63-1-paul.cercueil@bootlin.com?part=3D2
