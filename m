Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCE536E498
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225669; cv=none; b=Mq4vWaMnpSu36Uf/pUx1Hz9ZF3r1/YYFKA/xN5orP57zS4gm81dsQOMgumcPj0UpbzY3f2W87jNQHUTBVFnXIgv9cNA/qVwkEX/5jAi04u3O7hNxgLcKYz4kwTEMX6vvkvJvDzaO9oiFc54bJd9vLu0x0Mx9cWyLdzu7APQeQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225669; c=relaxed/simple;
	bh=ot+rgetzXq684FzVBaK1r/RgJmRb/M6PiNXRbTC32Fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YBlfrBurAoTcajfSTfKuyQSYvEuzqTO/pzAbBKMOI+W+NF44jOAKwoR3mNRzPofbTGroiUEFdBS+yTdRiLtk2lNfxHeG14uDq1DNtWeCVYCPzoy6IqFYox0e43snskd5KkBCihCbujSolo9bmlIWMInNHpFJGgeoYntCePf3OPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOGXrcif; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOGXrcif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9AB1F000E9;
	Tue, 23 Jun 2026 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225668;
	bh=TwspvrhMQ+i9XC4JO30r2c8aaXBT7KqexIDIRkqhJg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lOGXrcif5A8/i2Gk2cLpwQWog9fMwGui9C8CBl1ovxL0GiXyMOipmfIvaqBaIT0az
	 Kj4EJ1ZxKAwuDscg25dmMznIO1VvMPhhluE8CxHYLxCUwgtmjheWoshU/vzohJBZ67
	 K7SmNkV4xRO959wAlABFuC596xVilUVOqV4+8mZYgJQV7ljh6Ym+BcnwBOuFpETWl8
	 B3LRhLT+zwlQ6RBHvMcfH/WbdxuluxzbBON6cgqjMByHYSmgaXEeA6qVmorHqG48Vv
	 D/MV36uIzF9vr0Wi3obI8cjo05TW4beLKIevAU11nwnOA1ImguhLx1g9mgmW8bVM1E
	 A9nnv+lF64GTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] serial: 8250_aspeed_vuart: add VUART over PCI
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <c3e1136d3565216c254db138e29299c2a3c6499f.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <c3e1136d3565216c254db138e29299c2a3c6499f.1782224059.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 14:41:07 +0000
Message-Id: <20260623144108.1E9AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] The newly added error path directly returns on failure, bypassing =
sysfs cleanup and leaving the hardware enabled and port registered.
- [Medium] Brittle lookup of the SCU syscon regmap by parsing the "clocks" =
property.
- [Medium] Setting untested and reserved bits in SCU registers.

Pre-existing issues:
- [High] Preexisting error paths fail to unregister the 8250 serial port an=
d delete the timer on probe failure, leading to a Use-After-Free.
- [High] Unprotected Read-Modify-Write operations on shared hardware regist=
ers.
- [High] Sysfs files and TTY port are exposed to userspace before driver da=
ta is initialized.
--

commit 277ed031956064f236c5536027c1f37b4a76d71d
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

    serial: 8250_aspeed_vuart: add VUART over PCI

This commit adds support for VUART over PCI on the AST2600 platform. It
configures the BMC PCI device enables, sets the PCI class code to MFD, and
configures MSI interrupts based on the silicon revision.

> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/se=
rial/8250/8250_aspeed_vuart.c
> index 6afa2f4057e1b..e204e26fa173b 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
[ ... ]
> @@ -412,6 +433,62 @@ static int aspeed_vuart_map_irq_polarity(u32 dt)
> +static int aspeed_ast2600_vuart_over_pci_set_enabled(struct platform_dev=
ice *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	u32 silicon_revision_id;
> +	struct regmap *scu;
> +	int rc;
> +
> +	u32 pcie_config_ctl =3D SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
> +						SCU_PCIE_CONF_BMC_DEV_EN_MMIO |
> +						SCU_PCIE_CONF_BMC_DEV_EN_MSI |
> +						SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER |
> +						SCU_PCIE_CONF_BMC_DEV_EN_E2L |
> +						SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE |
> +						SCU_PCIE_CONF_BMC_DEV_EN;
> +
> +	scu =3D syscon_regmap_lookup_by_phandle(dev->of_node, "clocks");
> +	if (IS_ERR(scu)) {

[Severity: Medium]
Will this break if any clock multiplexer or intermediate clock controller is
inserted between the SCU and the VUART?

This code uses syscon_regmap_lookup_by_phandle() to fetch the SCU regmap by
parsing the "clocks" property. While this may happen to work if the SCU is
the direct clock provider, does this conflate the clock provider bindings
with syscon mappings?

> +		dev_err(&pdev->dev, "failed to find SCU regmap\n");
> +		return PTR_ERR(scu);
> +	}
[ ... ]
> +	if (silicon_revision_id =3D=3D AST2600A3_REVISION_ID)
> +		rc =3D regmap_update_bits(scu, ASPEED_SCUC24,
> +				   ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_RO=
UTING_MASK,
> +				   ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN | ASPEED_SCUC24_MSI_RO=
UTING_PCIe2LPC_PCIDEV1);
> +	else
> +		rc =3D regmap_update_bits(scu, ASPEED_SCUC24,
> +					/* The bit 14 is reserved in the Datasheet, so we can't say what it=
 does. This revision has not been tested */
> +				   ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN | BIT(14) | ASPEED_SCUC2=
4_MSI_ROUTING_MASK,

[Severity: Medium]
Is it safe to write BIT(14) into ASPEED_SCUC24 when it is undocumented and
reserved?

The comment indicates the bit's purpose is unknown and this revision is
untested. Can setting this undocumented, reserved bit trigger unpredictable
hardware behavior on other silicon revisions?

> +				   ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN | BIT(14) | ASPEED_SCUC2=
4_MSI_ROUTING_PCIe2LPC_PCIDEV1);
> +	if (rc) {
> +		dev_err(dev, "could not set PCI device 1 MSI interrupt routing\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> @@ -540,6 +617,15 @@ static int aspeed_vuart_probe(struct platform_device=
 *pdev)
>  	aspeed_vuart_set_host_tx_discard(vuart, true);

[Severity: High]
This isn't a bug introduced by this patch, but can concurrent access
clobber register modifications?

Functions like aspeed_vuart_set_host_tx_discard() and
aspeed_vuart_set_sirq_polarity() perform read-modify-write operations on
ASPEED_VUART_GCRA. Does a concurrent sysfs write and TTY port open/close
cause a race condition here, since these are invoked from contexts with
different locks (or no locks)?

>  	platform_set_drvdata(pdev, vuart);

[Severity: High]
This isn't a bug introduced by this patch, but does the delay in calling
platform_set_drvdata() expose userspace to a null pointer dereference?

In aspeed_vuart_probe(), sysfs_create_group() is called very early.
If a concurrent userspace process reads the sysfs files, invoking
lpc_address_show() before platform_set_drvdata() is called here, it will
retrieve a null pointer and immediately dereference it.

> =20
> +	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
> +		of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
> +		rc =3D aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
> +		if (rc) {
> +			dev_err(dev, "could not enable VUART over PCI\n");
> +			return rc;

[Severity: High]
Does this direct return bypass necessary cleanup logic and leave the
hardware enabled?

By returning rc directly instead of jumping to a cleanup label, the sysfs
group aspeed_vuart_attr_group is leaked. Furthermore, does this bypass
unregistering the 8250 port and leave the VUART active despite probe
failure, since aspeed_vuart_set_enabled(vuart, true) was called earlier?

> +		}
> +	}
> +
>  	return 0;
> =20
>  err_sysfs_remove:
>  	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
>  	return rc;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does this error path lead
to a use-after-free?

The err_sysfs_remove block cleans up sysfs attributes but entirely omits
calling serial8250_unregister_port() and timer_delete_sync(). Because the
driver uses devres, the vuart structure will be freed upon probe failure.
Since the port remains actively registered, any subsequent access to the
port via TTY operations will dereference this freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782224059.gi=
t.gregoire.layet@9elements.com?part=3D4
