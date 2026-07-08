Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A99137206E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525725; cv=none; b=iVodEhiFwQtiWOTzLeiQxb2s8QWvTvknna0hFAVqTBYN+NgQA6xWfKwhJhI1F3V6AOr++m7SXzNAP79hxyZmOzzOt1etrgkzmXMgljX1LqaKkcMX00zedndFilfwsCeZ/grS7/+OQDFPW7ST07GVPJ9nXd8Z0cN7m07bUVkH2MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525725; c=relaxed/simple;
	bh=eMIiVWyjj8YpwKA8dUVbvNSU/iz4C+3htDYVuWxpPhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k6v+Smfrd5AbZUr/9tulZAzudQmZO/By44RBxpWgJ6EgNcMM5xf25APEJMyCJoGpobgE2FqMH5d8j2hwdQnKPZD6jKW1+c+6bd/X0ZeK8KOgHahtGWCIv4qt6I7xWwGHCMmimyagB24YWnjdA7ezJzHadNoNNpG+PtbjKm+OP3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3yFkKaE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3yFkKaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2BB1F000E9;
	Wed,  8 Jul 2026 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783525723;
	bh=c34FntawGGFVIVIRlJ0GmixbvEdNRyB9CjEdPeK6eIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e3yFkKaE9ppBgDqEDrdyOBkLnKmlpaFtt/mqH5lbPt+SPs2kv8a/AWn1CXWeyokQE
	 A0jY9vidB6FjhYPCcU999v66WdXabGIP8kqGxAdKMA7qTougydkeggAyAFUMDUHF6y
	 rAClQqGI0VqfOivsTZZ4g2fKWBrMqa6z81+NPLPlJBR9jrrO9YmIgQPvE8UJG4TCLe
	 2rCk/NQU94K2Cmkyp1t2n4KXe42UJOrk9H5SVrABPsCWG6Q62zUoBN0w3tdnSVXhbR
	 Ko2nrOFH3jWsna47O++EDKO2VCKJ0bR7FJTXHF3lUqDY3H/T9GDwHY3yIYfJ4n4laz
	 ufx3ZZcWYv77Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] soc: aspeed: add host-side PCIe BMC device
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 15:48:43 +0000
Message-Id: <20260708154843.8B2BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The physical address of the PCI BAR is stored in an `unsigned long=
`, which silently truncates addresses on 32-bit architectures with 64-bit p=
hysical addressing.
- [Medium] The driver requests legacy INTx interrupt fallback but enforces =
a minimum vector count of 32 and hardcodes MSI vector indices, making INTx =
support impossible.
- [Low] Missing newline character `\n` at the end of a `pr_err` message str=
ing.
- [Low] The probe error message references a non-existent function `aspeed_=
pci_setup_irq_resource()` instead of `pci_alloc_irq_vectors()`.
- [Low] The driver computes a physical memory address for the UART mapped r=
egisters by adding a fixed offset to the base of PCI BAR 1, but fails to ve=
rify if BAR 1 exists or is large enough to contain this offset.
--

--- Patch [5]: [PATCH v4 5/7] soc: aspeed: add host-side PCIe BMC device dr=
iver ---
commit 466ab6d1aa3de4b6bd606a9368f52aa1b3fbe52e
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
Subject: soc: aspeed: add host-side PCIe BMC device driver

This patch adds a host-side driver for the ASPEED AST2600 BMC PCIe device.
It exposes two 8250-compatible VUART ports over PCIe between the BMC and=20
the host.

> diff --git a/drivers/soc/aspeed/aspeed-host-bmc-dev.c b/drivers/soc/aspee=
d/aspeed-host-bmc-dev.c
> new file mode 100644
> index 0000000000000..e586d05055775
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
[ ... ]
> +struct aspeed_pci_bmc_dev {
> +	unsigned long message_bar_base;

[Severity: High]
Can this cause address truncation on 32-bit architectures with 64-bit physi=
cal
addressing?

The physical address returned by pci_resource_start() is stored in an
unsigned long, which is 32 bits on 32-bit platforms.

Should message_bar_base be typed as resource_size_t or phys_addr_t instead?

[ ... ]
> +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev, int i=
dx)
> +{
[ ... ]
> +	uart->port.iotype =3D UPIO_MEM32;
> +	uart->port.iobase =3D 0;
> +	uart->port.mapbase =3D pci_bmc_dev->message_bar_base + vuart_ioport;

[Severity: Low]
Is it safe to add the VUART offset to the base of BAR 1 without validation?

If BAR 1 is uninitialized or not large enough to contain vuart_ioport, this
could result in an invalid physical memory address.

Should this code check pci_resource_len() before adding the offset?

[ ... ]
> +static int aspeed_pci_host_setup(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev =3D pci_get_drvdata(pdev);
> +	int rc =3D 0;
> +
> +	pci_bmc_dev->message_bar_base =3D pci_resource_start(pdev, 1);
> +
> +	if (pdev->revision =3D=3D 0x27) {
> +		pr_err("AST2700 detected but not supported");

[Severity: Low]
This isn't a bug, but there's a missing newline character at the end of this
error message. Without the \n, subsequent printk messages might be accident=
ally
concatenated onto the same line.

[ ... ]
> +static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev, const =
struct pci_device_id *ent)
> +{
[ ... ]
> +	pci_set_master(pdev);
> +	pci_set_drvdata(pdev, pci_bmc_dev);
> +
> +	rc =3D pci_alloc_irq_vectors(pdev, BMC_MULTI_MSI, BMC_MULTI_MSI, PCI_IR=
Q_INTX | PCI_IRQ_MSI);

[Severity: Medium]
Does this PCI_IRQ_INTX fallback function as intended?

The allocation requests a minimum of 32 vectors (BMC_MULTI_MSI), but INTx o=
nly
supports a single vector, so the fallback will always fail.

Also, aspeed_pci_bmc_device_setup_vuart() hardcodes the vector indices:

	uart->port.irq =3D pci_irq_vector(pdev, vuart_msi_index[idx]);

Since indices 16 and 17 are invalid for INTx, will this driver completely f=
ail
to initialize on systems where MSI is disabled or unavailable?

> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "aspeed_pci_setup_irq_resource() returned error %d=
\n", rc);

[Severity: Low]
Is the function name in this log message incorrect? It references
aspeed_pci_setup_irq_resource() instead of pci_alloc_irq_vectors(), which
might make debugging confusing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783524645.gi=
t.gregoire.layet@9elements.com?part=3D5
