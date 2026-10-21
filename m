Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613489;
	b=YYhVMwUxFzHBVU7aMheZdGjPT77ZnloEB4wX1zE/R9bJd634PVcbqPZAalqb0zRkmIqU
	 9dZF6jVgROMzxLw9NLRQ2sNR+cA0nq9P+S12qDkYpuemQjSOAbvu5e07+E6ZITNbCXwTU
	 qEM0EhenElbjub8RSBLTQVLO2IJzAjrqpEz8mh7qEpouiF4Bn4/HSF4+KobRZuollycng
	 yTUJBtZvPDCxnvv9hpMiucnk9VkEQVir2pKwBtCUBGdvIpNBFBQ199t0LCuWUAvY64qy3
	 kmstv/LKf+zEfEAtqx1Ohpgmpk5nf+NV9jIP31yjRz4eXft3mjy2eUu6Yf8ZTf+mYyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613489;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k4preqOnpOQDDnNP/5Rb1T7hHAC928dCs9yDwRIFtpY=;
	b=34NA/skPxJwv0jgr6lAYTAc4zfICkMKLM3LlCsyixBzYu+U79x7eJulCKfFLiaFq24A7
	 Gs3//any9GCIbFZBt0NrQ2xyhya5s7kRAz94i0lJmJ7vShlTY8g19zGj4k9wJFV/GcL+J
	 hALHhc1go1m25G0IiElVUyqeyq1nFXd6dQ4yLSy9NzU5aujItMQZuypwJYnUY3+4rJzgi
	 +ifZVDLZ+YLZV+VczhFPHbum0pdW1JI7qA2P8Z4IwhA8V9zrYeinWRHWgdVfeoX9fvy45
	 pjG/c7n0k3LucIfxtSpBmu0hJgRVSWq2n0/VYkeKGPgynOOepvkqy7CdlifTCP9nWaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ameI5ci8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFD606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 20:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ameI5ci8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8DF1F000C1;
	Wed, 21 Oct 2026 20:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792613488;
	bh=k4preqOnpOQDDnNP/5Rb1T7hHAC928dCs9yDwRIFtpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ameI5ci8cLPdmzbAx3RDB+pXHGHKRaw3OZGXHzzVFSznnvNJDmgtApFi0dSCEaQEZ
	 ZYOl2oJ91PO1zLPpBuzthrD3th+OmBb4fd90un4XX8ukT5n/Of4sVwfCMWEhBbgSzN
	 cfCWQn0uQdIn22pDTu0XH2qAV71zXicaej2W4kbanoKBk9fa9i23M+RVs9L6TqVj1B
	 hN1/06P1+69okuevBuWrHGsyLh0MGwM0fjjH3p6ttMTNT3c/PlGmnBdf6ti/4J+Fmp
	 RX7MquWH8Y8QGi/SXwT51vsUJ06aUVfuvPIhxgVC7twB97LOb7zkg7+qwYlj7xD1/C
	 WnZRMOBiwf2MA==
Message-ID: <sashiko-outbox-180630@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] bus: Add Altera AXI Timeout Bridge driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-feature-timeout-ip-v2-2-a037be089518@bruker.com>
References: <20261021-feature-timeout-ip-v2-0-a037be089518@bruker.com>
 <20261021-feature-timeout-ip-v2-2-a037be089518@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 20:11:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] bus: wrong base and 32-bit truncation in altera_timeout_bridge_isr=
()
- [High] bus: uninitialized spinlock exposed via sysfs in altera_timeout_br=
idge_probe()
- [Medium] bus: altera-timeout-bridge: NULL deref or probe failure when CON=
FIG_SYSFS=3Dn
- [Low] MAINTAINERS: missing colon on M tag for Altera AXI Timeout Bridge d=
river
--

commit 2fab3abca0c9e4fa16264b963ed344d58e87a918
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

bus: Add Altera AXI Timeout Bridge driver

This commit adds a bus driver for the Altera AXI Timeout Bridge that popula=
tes
child devices behind the bridge and handles timeout interrupts by logging t=
he
timed-out address and exposing irq_count and last_timeout_address via sysfs.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b5cab72d851b..27f7ffd6f0cb2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -945,6 +945,13 @@ ALPS PS/2 TOUCHPAD DRIVER
>  R:	Pali Roh=C3=A1r <pali@kernel.org>
>  F:	drivers/input/mouse/alps.*
> =20
> +ALTERA AXI TIMEOUT BRIDGE DRIVER
> +M	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

[Severity: Low]
Should the M tag in MAINTAINERS under ALTERA AXI TIMEOUT BRIDGE DRIVER have=
 a
colon after M ("M:") so scripts/parse-maintainers.pl and
scripts/get_maintainer.pl can parse the entry without failing?

> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-altera-timeout-bridge
> +F:	Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
> +F:	drivers/bus/altera-timeout-bridge.c
> +
>  ALTERA MAILBOX DRIVER
>  M:	Tien Sung Ang <tiensung.ang@altera.com>
>  S:	Maintained

[ ... ]

> diff --git a/drivers/bus/altera-timeout-bridge.c b/drivers/bus/altera-tim=
eout-bridge.c
> new file mode 100644
> index 0000000000000..87886c3ad7941
> --- /dev/null
> +++ b/drivers/bus/altera-timeout-bridge.c
> @@ -0,0 +1,173 @@

[ ... ]

> +static ssize_t last_timeout_address_show(struct device *dev, struct devi=
ce_attribute *attr,
> +			char *buf)
> +{
> +	struct altera_timeout_bridge_data *driver_data =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	u64 addr;
> +
> +	spin_lock_irqsave(&driver_data->lock, flags);
> +	addr =3D driver_data->last_timeout_address;
> +	spin_unlock_irqrestore(&driver_data->lock, flags);
> +
> +	return sysfs_emit(buf, "0x%016llx\n", addr);
> +}

[ ... ]

> +static irqreturn_t altera_timeout_bridge_isr(int irq, void *data)
> +{
> +	struct altera_timeout_bridge_data *driver_data =3D data;
> +	u64 timed_out_address;
> +	resource_size_t effective_base_address;
> +	resource_size_t effective_address;
> +
> +	atomic_inc(&driver_data->irq_count);
> +
> +	// Read and print the timed-out address (encoded in the lower nibble
> +	// 0x8..0xF according to AXI Timeout Bridge IP (CSR Interrupt Status In=
formation)
> +	timed_out_address =3D lo_hi_readq(driver_data->bridge_registers +
> +		ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS_LO);
> +	effective_base_address =3D driver_data->bridge_register_resource->start;
> +	effective_address =3D effective_base_address + timed_out_address;
> +
> +	spin_lock(&driver_data->lock);
> +	driver_data->last_timeout_address =3D effective_address;
> +	spin_unlock(&driver_data->lock);

[Severity: High]
Does altera_timeout_bridge_isr() in drivers/bus/altera-timeout-bridge.c
compute the wrong physical address and truncate 64-bit addresses on 32-bit
platforms?

In altera_timeout_bridge_probe(), devm_platform_get_and_ioremap_resource()
populates driver_data->bridge_register_resource from reg index 0, which is =
the
bridge's own 16-byte CSR register block rather than the subordinate bus
address window described by ranges:

Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml:
    reg =3D <0x10000 0x10>;
    interrupts =3D <0 12 IRQ_TYPE_LEVEL_HIGH>;
    ranges =3D <0x0 0x10010 0x1000>;

    timeout-device@100 {
        compatible =3D "timeout-device";
        reg =3D <0x100 0x10>;
    };

Adding driver_data->bridge_register_resource->start to timed_out_address ad=
ds
the CSR base address (0x10000 in the binding example, yielding 0x10100 inst=
ead
of 0x10110) rather than translating the subordinate bus address through
ranges.

In addition, timed_out_address and driver_data->last_timeout_address are u6=
4,
whereas effective_base_address and effective_address are resource_size_t. On
32-bit platforms without CONFIG_PHYS_ADDR_T_64BIT (such as arm32 without
LPAE), resource_size_t is 32 bits wide, so assigning the sum to
effective_address truncates the upper 32 bits before storing into
driver_data->last_timeout_address.

> +
> +	dev_err_ratelimited(driver_data->dev, "timeout at address 0x%llx\n",
> +		(unsigned long long)effective_address);

[ ... ]

> +static int altera_timeout_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct altera_timeout_bridge_data *driver_data;
> +	int ret;
> +	int irq;
> +
> +	driver_data =3D
> +		devm_kzalloc(&pdev->dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	driver_data->dev =3D dev;
> +	platform_set_drvdata(pdev, driver_data);
> +
> +	driver_data->bridge_registers =3D
> +		devm_platform_get_and_ioremap_resource(pdev, 0,
> +			&driver_data->bridge_register_resource);
> +	if (IS_ERR(driver_data->bridge_registers))
> +		return PTR_ERR(driver_data->bridge_registers);
> +
> +	ret =3D devm_device_add_group(dev, &altera_timeout_bridge_sysfs_group);
> +	if (ret)
> +		return ret;
> +
> +	driver_data->irq_node =3D sysfs_get_dirent(dev->kobj.sd, "last_timeout_=
address");
> +	if (!driver_data->irq_node)
> +		return -ENOENT;

[Severity: Medium]
What happens in altera_timeout_bridge_probe() when CONFIG_SYSFS=3Dn?

In drivers/bus/Kconfig, config ALTERA_TIMEOUT_BRIDGE depends only on
OF && HAS_IOMEM. When CONFIG_SYSFS=3Dn, devm_device_add_group() succeeds as=
 a
stub while dev->kobj.sd remains NULL.

Calling sysfs_get_dirent(dev->kobj.sd, "last_timeout_address") then passes a
NULL parent into kernfs_find_and_get_ns():

altera_timeout_bridge_probe()
  sysfs_get_dirent(dev->kobj.sd, "last_timeout_address")
    kernfs_find_and_get(NULL, "last_timeout_address")
      kernfs_find_and_get_ns(NULL, "last_timeout_address", NULL)
        kernfs_root(parent)

If CONFIG_KERNFS=3Dy (for instance with CONFIG_CGROUPS=3Dy), kernfs_root(pa=
rent)
dereferences parent->__parent on a NULL pointer. If CONFIG_KERNFS=3Dn,
sysfs_get_dirent() returns NULL and altera_timeout_bridge_probe() fails with
-ENOENT before devm_of_platform_populate() can populate the child devices on
the bus.

> +
> +	ret =3D devm_add_action_or_reset(dev, altera_timeout_bridge_put_dirent,
> +				       driver_data->irq_node);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_init(&driver_data->lock);

[Severity: High]
Can last_timeout_address_show() in drivers/bus/altera-timeout-bridge.c acqu=
ire
driver_data->lock before spin_lock_init() initializes it?

In altera_timeout_bridge_probe(), devm_device_add_group() creates the
last_timeout_address sysfs attribute before spin_lock_init(&driver_data->lo=
ck)
is called. Once the sysfs group is registered, a userspace reader (such as
udev) opening and reading last_timeout_address invokes
last_timeout_address_show(), which calls
spin_lock_irqsave(&driver_data->lock, flags) on an uninitialized spinlock_t
(or during error unwind if sysfs_get_dirent() or devm_add_action_or_reset()
returns an error).

Should spin_lock_init(&driver_data->lock) be called before
devm_device_add_group()?

[ ... ]

> +}
> +
> +static const struct of_device_id altera_timeout_bridge_of_match[] =3D {

[ ... ]
 Let's double check everything in the response: all rules followed, plain t=
ext, wrapped at 78 characters, ends with a blank line. We are done!commit 2=
fab3abca0c9e4fa16264b963ed344d58e87a918
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

bus: Add Altera AXI Timeout Bridge driver

This commit adds a bus driver for the Altera AXI Timeout Bridge that popula=
tes
child devices behind the bridge and handles timeout interrupts by logging t=
he
timed-out address and exposing irq_count and last_timeout_address via sysfs.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b5cab72d851b..27f7ffd6f0cb2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -945,6 +945,13 @@ ALPS PS/2 TOUCHPAD DRIVER
>  R:	Pali Roh=C3=A1r <pali@kernel.org>
>  F:	drivers/input/mouse/alps.*
> =20
> +ALTERA AXI TIMEOUT BRIDGE DRIVER
> +M	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

[Severity: Low]
Should the M tag in MAINTAINERS under ALTERA AXI TIMEOUT BRIDGE DRIVER have=
 a
colon after M ("M:") so scripts/parse-maintainers.pl and
scripts/get_maintainer.pl can parse the entry without failing?

> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-altera-timeout-bridge
> +F:	Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
> +F:	drivers/bus/altera-timeout-bridge.c
> +
>  ALTERA MAILBOX DRIVER
>  M:	Tien Sung Ang <tiensung.ang@altera.com>
>  S:	Maintained

[ ... ]

> diff --git a/drivers/bus/altera-timeout-bridge.c b/drivers/bus/altera-tim=
eout-bridge.c
> new file mode 100644
> index 0000000000000..87886c3ad7941
> --- /dev/null
> +++ b/drivers/bus/altera-timeout-bridge.c
> @@ -0,0 +1,173 @@

[ ... ]

> +static ssize_t last_timeout_address_show(struct device *dev, struct devi=
ce_attribute *attr,
> +			char *buf)
> +{
> +	struct altera_timeout_bridge_data *driver_data =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	u64 addr;
> +
> +	spin_lock_irqsave(&driver_data->lock, flags);
> +	addr =3D driver_data->last_timeout_address;
> +	spin_unlock_irqrestore(&driver_data->lock, flags);
> +
> +	return sysfs_emit(buf, "0x%016llx\n", addr);
> +}

[ ... ]

> +static irqreturn_t altera_timeout_bridge_isr(int irq, void *data)
> +{
> +	struct altera_timeout_bridge_data *driver_data =3D data;
> +	u64 timed_out_address;
> +	resource_size_t effective_base_address;
> +	resource_size_t effective_address;
> +
> +	atomic_inc(&driver_data->irq_count);
> +
> +	// Read and print the timed-out address (encoded in the lower nibble
> +	// 0x8..0xF according to AXI Timeout Bridge IP (CSR Interrupt Status In=
formation)
> +	timed_out_address =3D lo_hi_readq(driver_data->bridge_registers +
> +		ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS_LO);
> +	effective_base_address =3D driver_data->bridge_register_resource->start;
> +	effective_address =3D effective_base_address + timed_out_address;
> +
> +	spin_lock(&driver_data->lock);
> +	driver_data->last_timeout_address =3D effective_address;
> +	spin_unlock(&driver_data->lock);

[Severity: High]
Does altera_timeout_bridge_isr() in drivers/bus/altera-timeout-bridge.c
compute the wrong physical address and truncate 64-bit addresses on 32-bit
platforms?

In altera_timeout_bridge_probe(), devm_platform_get_and_ioremap_resource()
populates driver_data->bridge_register_resource from reg index 0, which is =
the
bridge's own 16-byte CSR register block rather than the subordinate bus
address window described by ranges:

Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml:
    reg =3D <0x10000 0x10>;
    interrupts =3D <0 12 IRQ_TYPE_LEVEL_HIGH>;
    ranges =3D <0x0 0x10010 0x1000>;

    timeout-device@100 {
        compatible =3D "timeout-device";
        reg =3D <0x100 0x10>;
    };

Adding driver_data->bridge_register_resource->start to timed_out_address ad=
ds
the CSR base address (0x10000 in the binding example, yielding 0x10100 inst=
ead
of 0x10110) rather than translating the subordinate bus address through
ranges.

In addition, timed_out_address and driver_data->last_timeout_address are u6=
4,
whereas effective_base_address and effective_address are resource_size_t. On
32-bit platforms without CONFIG_PHYS_ADDR_T_64BIT (such as arm32 without
LPAE), resource_size_t is 32 bits wide, so assigning the sum to
effective_address truncates the upper 32 bits before storing into
driver_data->last_timeout_address.

> +
> +	dev_err_ratelimited(driver_data->dev, "timeout at address 0x%llx\n",
> +		(unsigned long long)effective_address);

[ ... ]

> +static int altera_timeout_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct altera_timeout_bridge_data *driver_data;
> +	int ret;
> +	int irq;
> +
> +	driver_data =3D
> +		devm_kzalloc(&pdev->dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	driver_data->dev =3D dev;
> +	platform_set_drvdata(pdev, driver_data);
> +
> +	driver_data->bridge_registers =3D
> +		devm_platform_get_and_ioremap_resource(pdev, 0,
> +			&driver_data->bridge_register_resource);
> +	if (IS_ERR(driver_data->bridge_registers))
> +		return PTR_ERR(driver_data->bridge_registers);
> +
> +	ret =3D devm_device_add_group(dev, &altera_timeout_bridge_sysfs_group);
> +	if (ret)
> +		return ret;
> +
> +	driver_data->irq_node =3D sysfs_get_dirent(dev->kobj.sd, "last_timeout_=
address");
> +	if (!driver_data->irq_node)
> +		return -ENOENT;

[Severity: Medium]
What happens in altera_timeout_bridge_probe() when CONFIG_SYSFS=3Dn?

In drivers/bus/Kconfig, config ALTERA_TIMEOUT_BRIDGE depends only on
OF && HAS_IOMEM. When CONFIG_SYSFS=3Dn, devm_device_add_group() succeeds as=
 a
stub while dev->kobj.sd remains NULL.

Calling sysfs_get_dirent(dev->kobj.sd, "last_timeout_address") then passes a
NULL parent into kernfs_find_and_get_ns():

altera_timeout_bridge_probe()
  sysfs_get_dirent(dev->kobj.sd, "last_timeout_address")
    kernfs_find_and_get(NULL, "last_timeout_address")
      kernfs_find_and_get_ns(NULL, "last_timeout_address", NULL)
        kernfs_root(parent)

If CONFIG_KERNFS=3Dy (for instance with CONFIG_CGROUPS=3Dy), kernfs_root(pa=
rent)
dereferences parent->__parent on a NULL pointer. If CONFIG_KERNFS=3Dn,
sysfs_get_dirent() returns NULL and altera_timeout_bridge_probe() fails with
-ENOENT before devm_of_platform_populate() can populate the child devices on
the bus.

> +
> +	ret =3D devm_add_action_or_reset(dev, altera_timeout_bridge_put_dirent,
> +				       driver_data->irq_node);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_init(&driver_data->lock);

[Severity: High]
Can last_timeout_address_show() in drivers/bus/altera-timeout-bridge.c acqu=
ire
driver_data->lock before spin_lock_init() initializes it?

In altera_timeout_bridge_probe(), devm_device_add_group() creates the
last_timeout_address sysfs attribute before spin_lock_init(&driver_data->lo=
ck)
is called. Once the sysfs group is registered, a userspace reader (such as
udev) opening and reading last_timeout_address invokes
last_timeout_address_show(), which calls
spin_lock_irqsave(&driver_data->lock, flags) on an uninitialized spinlock_t
(or during error unwind if sysfs_get_dirent() or devm_add_action_or_reset()
returns an error).

Should spin_lock_init(&driver_data->lock) be called before
devm_device_add_group()?

[ ... ]

> +}
> +
> +static const struct of_device_id altera_timeout_bridge_of_match[] =3D {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-feature-ti=
meout-ip-v2-0-a037be089518@bruker.com?part=3D2
