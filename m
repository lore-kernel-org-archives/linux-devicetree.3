Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F093624D3
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 22:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759525; cv=none; b=jfk971LrFxl5whUygma/tT+cE3QLWSUzUJ9xW59PgMHqmupzbkmK0cLXinYw3+czpooteHtXTMvWw6IFRXyuwZgt8u121CIj0rZ5YglH8k9jR1VuwfuTNXXcpghHnC4nJjV9r6vhmqsSiJ2URwGU9rUBsSD53SiJ5xtHVMhN49o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759525; c=relaxed/simple;
	bh=tI6pcabNBpBU2uF0Tf51vfZOY6Nyh0nItwuFcb1VMJI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=msTFa8jfh+8kPcI1Zi2apnPb2iniMHFaykI9bmpBDbgZmdtebb5lzlMxkuXd00ktI1vKg6OFgIYQxLMllE8LE1Cf1Pt4xxK5oLnysPFye8Yc9KaEgeiL55XVLZ3HMS298KylQYFbwwvfhw6Ayf2Z0TVAYbyfF16usAaFaRrnU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6C9pEAr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6C9pEAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459EB1F0089B;
	Sun, 11 Oct 2026 22:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791759523;
	bh=AfS3YyyPPwQl6C+lNg9aEJiLV8yDMKSHbBXn9WDZOBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S6C9pEArz7izMYE25ZLnA+iQBK04/ZG9kQFQzTLjn7K8rbeOcY5fMvbRkbDYO3Ooa
	 IKNe8/GfxtFxhPyyPFRrl3HbL+N68/ACIa01Gz5+rT0ZtNEzBrDEh//LLoswOlAS55
	 c+cyMSHuPuY2IJiJ6+oSL3hr6M+v8CIMYveBVXIeF7d5/nIe9m6dRs/tzUp1qe+clc
	 ZSWjEOgUAr21w5sRY6kWpyCHB40/+e5Upd2I1/Sl4K2IoSd6QVZrY4//lceskwr5b8
	 0TGLP7edHy9YiC2vRqYGVCLxuM1bYCBO14Cs7OoVGI6ixSSd46Uc4HYlwTejq9PHJc
	 haUwhXFzVorhg==
Message-ID: <sashiko-outbox-167504@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] bcma: add host driver for the BCM6362 integrated
 WLAN backplane
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessio Ferri" <alessio.ferri@mythread.it>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012-bcm6362-wlan-v2-4-4752da7e0982@mythread.it>
References: <20261012-bcm6362-wlan-v2-0-4752da7e0982@mythread.it>
 <20261012-bcm6362-wlan-v2-4-4752da7e0982@mythread.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 22:58:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] bcma: infinite loop and memory corruption in block I/O accessors o=
n unaligned count
- [Medium] bcma: driver_unregister WARN triggered by unconditional unregist=
er on module exit
- [Medium] bcma: memory and iomap leak on bcma_bus_register error path
--

commit cab76f19668054d5036b4bcfb106104ceaeac7fc
Author: Alessio Ferri <alessio.ferri@mythread.it>

bcma: add host driver for the BCM6362 integrated WLAN backplane

The patch introduces a host driver for the BCM6362 integrated WLAN backplan=
e.
It provides functions to power on the core, enable the clock, and implement
block I/O accessors for register reads/writes.

> diff --git a/drivers/bcma/host_soc_bcm6362.c b/drivers/bcma/host_soc_bcm6=
362.c
> new file mode 100644
> index 0000000000000..524f7bddd65f5
> --- /dev/null
> +++ b/drivers/bcma/host_soc_bcm6362.c

[ ... ]

> +static void bcma_host_soc_bcm6362_block_read(struct bcma_device *core,
> +					     void *buffer, size_t count,
> +					     u16 offset, u8 reg_width)
> +{
> +	void __iomem *addr =3D core->io_addr + offset;
> +
> +	switch (reg_width) {

[ ... ]

> +	case sizeof(u32): {
> +		__be32 *buf =3D buffer;
> +
> +		WARN_ON(count & 3);
> +		while (count) {
> +			*buf =3D (__force __be32)__raw_readl(addr);
> +			buf++;
> +			count -=3D 4;
> +		}
> +		break;
> +	}

[Severity: High]
If an unaligned count is passed to this function, could the count underflow?

Since WARN_ON only prints a backtrace and continues execution, a count
that isn't a multiple of 4 would bypass exactly 0 during count -=3D 4. This
would underflow the unsigned integer to its maximum value, causing the loop
to run almost infinitely and resulting in an out-of-bounds memory write.

[ ... ]

> +static void bcma_host_soc_bcm6362_block_write(struct bcma_device *core,
> +					      const void *buffer, size_t count,
> +					      u16 offset, u8 reg_width)
> +{
> +	void __iomem *addr =3D core->io_addr + offset;
> +
> +	switch (reg_width) {

[ ... ]

> +	case sizeof(u32): {
> +		const __be32 *buf =3D buffer;
> +
> +		WARN_ON(count & 3);
> +		while (count) {
> +			__raw_writel((__force u32)*buf, addr);
> +			buf++;
> +			count -=3D 4;
> +		}
> +		break;
> +	}

[Severity: High]
Similar to the read path above, could an unaligned count cause an integer
underflow here? This might lead to an infinite loop and out-of-bounds
memory reads from the buf pointer.

[ ... ]

> +static int bcma_host_soc_bcm6362_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	err =3D bcma_bus_register(bus);
> +	if (err) {
> +		bcma_host_soc_bcm6362_power_off(host);
> +		return err;
> +	}
> +
> +	platform_set_drvdata(pdev, host);
> +
> +	return 0;
> +}

[Severity: Medium]
If bcma_bus_register() fails (for example, if bcma_bus_scan() encounters
a corrupted EROM entry and returns -EILSEQ), does this error path leak any
cores successfully scanned prior to the error?

It appears the dynamically allocated core structures in the bus->cores list
and their associated ioremap() mappings are abandoned. Should this call
bcma_unregister_cores(bus) to tear them down?

> diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
> index 72f045e6ed513..4ccc9fb98f616 100644
> --- a/drivers/bcma/main.c
> +++ b/drivers/bcma/main.c

[ ... ]

> @@ -682,6 +682,11 @@ static int __init bcma_modinit(void)
>  		pr_err("SoC host initialization failed\n");
>  		err =3D 0;
>  	}
> +	err =3D bcma_host_soc_bcm6362_register_driver();
> +	if (err) {
> +		pr_err("BCM6362 WLAN host initialization failed\n");
> +		err =3D 0;
> +	}

[Severity: Medium]
Does swallowing the registration error here cause problems during module
unload?

By zeroing out err, the module successfully loads even if registration
fails. Later, bcma_modexit() unconditionally unregisters the driver:

>  static void __exit bcma_modexit(void)
>  {
>  #ifdef CONFIG_BCMA_HOST_PCI
>  	bcma_host_pci_exit();
>  #endif
> +	bcma_host_soc_bcm6362_unregister_driver();
>  	bcma_host_soc_unregister_driver();
>  	bus_unregister(&bcma_bus_type);
>  }

Calling platform_driver_unregister() on a driver that failed to register
passes a NULL pointer to the core driver_unregister() function, which
directly triggers an unexpected driver unregister WARN splat. Could the
registration status be tracked, or errors propagated instead of being ignor=
ed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-bcm6362-wl=
an-v2-0-4752da7e0982@mythread.it?part=3D4
