Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB61FF5E3
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225750; cv=none; b=YWI65rQtZ60yGkoik21jhDy7xoxLnFZ8SK+lCPbfKk5MtHfmtFVK1poGmuYN1gpQQqNgagDku38NxtFm0UtVzXbhm4ztJxR50xWN/mGuHE20dP7ktnZpb2Sn9eiAFbK9KIuATcZb9SMcYtBVY6mHnyvFye+GH2usR8ZZNgJgFUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225750; c=relaxed/simple;
	bh=njz34RJydzGqExBwoWLeMgoYK4LxYJIAAkTejeFlak4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dxw+VphSyb88vqLrlhbiw12Ii0YGdLPzZniJPDPFIn939DLS2G9A0RTuDm617ScMJ0FfC3yaPzO47OcOAXO5GZzoHTAoebvW+3Uqsj2Ah41FLnQ6lTmeaLQOw6aZgYWOPxOX0nGfzCSEAUKRsg9XoaQZfXBWLr1mBQDC8DCnC5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyxSGYXO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyxSGYXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2481F000E9;
	Tue, 23 Jun 2026 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225748;
	bh=7ueKOiQ3uKM85o6oVZkX1COJD47m0qoJvZB13uKqMQM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iyxSGYXOWY4Hs4JNq5zT2DRvBRr5ON2/iUKO0ll9x+OJRpKrQt1iUnkZuEqpZ0lWX
	 PKGLvGvnqg5e5SK5S5Ke+6EPy4s/Cbpqsk4rLBUbhV2jDMK0jvxagBLZk+XrO03/Me
	 atAsUaF9a0NPXy+MivolMNUdLdaFTUOuswi91rrnM94xMLpyhvhe+oorbZMKRevOEO
	 rNUQimjHiJZirJ/Z8/QxkxTToGWgTTGLt7NssNbz2C1qfFMjYgoxsNP4vWZVC3KMEA
	 50bQLu241skARnme3CDKdTraipNRSjOCb7xWWOv5C2Ac9Nphhfizu41GheKIeKLXK2
	 +45qpGnP5GaIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 14:42:28 +0000
Message-Id: <20260623144228.6A2481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Newly introduced error path completely bypasses all probe cleanup.
- [High] Modifying a static global array when MSI allocation fails causes s=
tate corruption.
- [High] Assuming index 16 and 17 are unconditionally valid for partially a=
llocated MSI vectors.
- [Medium] Device Tree Binding Schema Validation Failure
- [Medium] Using the 'clocks' property as a syscon phandle violates DT sema=
ntics.

Pre-existing issues:
- [High] Probe error paths fail to unregister the 8250 serial port, leading=
 to Use-After-Free.
--

commit cd4f0040d97e2d9918c8ecf27108ed2de48871b7
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ARM: dts: aspeed: g6: Change vuart compatible string for ast2600

Use the ast2600 compatible string.
This makes it more precise and enables specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index bb7b9c87a8072..b03797f4674d4 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -23,7 +23,17 @@ allOf:
>      then:
>        properties:
>          compatible:
> -          const: aspeed,ast2500-vuart
> +          anyOf:
> +            - const: aspeed,ast2500-vuart
> +            - const: aspeed,ast2600-vuart

[ ... ]

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 189bc3bbb47c9..5ff52697e8bb4 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -698,7 +698,7 @@ emmc: sdhci@1e750100 {
>  			};
> =20
>  			vuart1: serial@1e787000 {
> -				compatible =3D "aspeed,ast2500-vuart";
> +				compatible =3D "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";

[Severity: Medium]
Will this pass device tree schema validation (dtbs_check)? The binding in
8250.yaml defines the compatible property as anyOf with single const string=
s,
meaning it expects exactly one of those strings. The device tree uses an ar=
ray
of two strings. Should the schema be updated with an items array definition=
 to
accept this combination?

[ ... ]

> diff --git a/drivers/soc/aspeed/aspeed-host-bmc-dev.c b/drivers/soc/aspee=
d/aspeed-host-bmc-dev.c
> new file mode 100644
> index 0000000000000..3160b6aedb5b6
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
[ ... ]
> +static int vuart_msi_index[2] =3D { 16, 17 };
[ ... ]
> +static void aspeed_pci_setup_irq_resource(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev =3D pci_get_drvdata(pdev);
> +
> +	pci_bmc_dev->msi_idx_table =3D vuart_msi_index;
> +
> +	if (pci_alloc_irq_vectors(pdev, 1, BMC_MULTI_MSI, PCI_IRQ_INTX | PCI_IR=
Q_MSI) <=3D 1)
> +		/* If pci_alloc fail, set all msi index to the first vector */
> +		memset(pci_bmc_dev->msi_idx_table, 0, sizeof(vuart_msi_index));

[Severity: High]
Does this code inadvertently corrupt global state for all driver instances?
Since pci_bmc_dev->msi_idx_table points to vuart_msi_index (a static global
array), calling memset on it will permanently zero out the MSI indices
system-wide if any device fails to allocate multiple MSI vectors.

Also, does the threshold check protect against partial allocations falling
short of index 17?

If pci_alloc_irq_vectors() successfully allocates an intermediate number of
vectors (e.g., 4 or 8), the '<=3D 1' check evaluates to false. The driver
retains indices 16 and 17 and attempts to fetch them via pci_irq_vector()
below, which triggers an out-of-bounds warning and returns -EINVAL.

[ ... ]
> +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev, int i=
dx)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev =3D pci_get_drvdata(pdev);
[ ... ]
> +	uart->port.irq =3D pci_irq_vector(pdev, pci_bmc_dev->msi_idx_table[idx]=
);

[Severity: High]
If a partial allocation leaves us with fewer vectors than the index stored =
in
msi_idx_table[idx], pci_irq_vector() returns a negative error code like
-EINVAL. Could this error code be incorrectly passed as the IRQ number here,
causing interrupt registration to fail later?

[ ... ]

> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/se=
rial/8250/8250_aspeed_vuart.c
> index 26fc0464f1cc2..e204e26fa173b 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
[ ... ]
> +static int aspeed_ast2600_vuart_over_pci_set_enabled(struct platform_dev=
ice *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
[ ... ]
> +	scu =3D syscon_regmap_lookup_by_phandle(dev->of_node, "clocks");

[Severity: Medium]
Is it semantically correct to use the "clocks" property as a syscon phandle?
The "clocks" property specifies clock providers and specifiers, not raw sys=
con
phandles. Piggybacking on this to extract a syscon regmap leverages an
implementation detail of syscon_regmap_lookup_by_phandle() and violates
device tree semantics.

[ ... ]
> @@ -540,6 +617,15 @@ static int aspeed_vuart_probe(struct platform_device=
 *pdev)
>  	aspeed_vuart_set_host_tx_discard(vuart, true);
>  	platform_set_drvdata(pdev, vuart);
> =20
> +	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
> +		of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
> +		rc =3D aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
> +		if (rc) {
> +			dev_err(dev, "could not enable VUART over PCI\n");
> +			return rc;

[Severity: High]
Does returning directly here skip probe cleanup? Bypassing the err_sysfs_re=
move
label leaves sysfs groups, timers, and the 8250 serial port registered while
devres frees the underlying vuart structure. Does this leak the sysfs groups
and timers, and potentially cause a use-after-free if the 8250 core accesses
the unregistered port?

> +		}
> +	}
> +
>  	return 0;
> =20
>  err_sysfs_remove:
>  	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
>  	return rc;

[Severity: High]
This isn't a bug introduced by this patch, but does the err_sysfs_remove pa=
th
fail to unregister the 8250 port? If probe fails after port registration,
serial8250_unregister_port() is missed. The 8250 core will later dereference
the freed vuart pointer via port.private_data, causing a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782224059.gi=
t.gregoire.layet@9elements.com?part=3D6
