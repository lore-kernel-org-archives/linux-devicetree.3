Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822859;
	b=sfhPqnK1kRmn2wyFajGTH0jiQSJpD0RIidMY1qhuqyETqG3DFxc1qTHHgNMF8Sbv373Y
	 At1RL7322qo70BN8XBPd0lOQ2pQUnWHPM8Mh4ghHjinc2ARXjh2b4/++1I192evsDHuX6
	 xsuc5lUMO0TyS3KOmephtUUIZ2yjpna0oyeBanMK0q9dPrec5TxTxrBVxKoVmHcUAetr8
	 6zMIsUAiujKJQIpFIUfggeaF+g7dgEJB+ZLmQREwbb/tYn22hOcutRCAiq65O4x/gFeeU
	 fc1SlhkhVoes0FQvKj/nMJcUgkTw5j89LQH5PhYtUmkFCHHutGBZjR1GSTJbWocXlJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822859;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qu1nMtazTA36FSz9s6ufiCdwU36D5X4eKEg1fla3hrE=;
	b=JEheaenqajcMavOZDmYAcWUYfsgSbOfiPmjrlI2QO+eMo9ZiKUnOuG7TVCAX8VnQB1Hk
	 h3u5zcSSkJyMhB2PJtqgimfvBffjbNnikxGG2Nyh01TnOyqkJc/psntvCKCz9sXOiL6bb
	 kkR+LvMsuQU5JB3iNEc3xv3w/R9xajElkeNiMKIpx/jhgJiNylpf22Bq5xCDgtpozycGI
	 50Y52A5gXTSS2+wYmwZIA6GHtZydsU5z6wafF4TVEt6qnECgv0ZiY25oI72Papq03ClAm
	 xlwaELh51Ai1XXBN59Cs93ou733R2CqQ9AEo8gx3tiJuZR1ZO9dBLwwUem9/a5HTd/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFUfb9fP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67964606A32F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFUfb9fP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E1A1F00A02;
	Wed,  4 Nov 2026 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822859;
	bh=qu1nMtazTA36FSz9s6ufiCdwU36D5X4eKEg1fla3hrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFUfb9fPuyrJ3OkAAlyefdRpu0zUqVV8mqgH3HCfHCEpr49FT+w982gOrf51Y6ltw
	 Ee2nrbKfQo74d1/9yQh1kav8Oh+4tOAVdkRg4B6pTBZCceo+a5NP15RNtbUbcTfvDP
	 RpgYvCMqWvrByaJ7wQF39gtnnlZgc/goJn5VDje1GgboJaLgEwm/R0ehM9HZa6Edx/
	 M6ZPqD4/7ricf3Gmv6eTntXPWbuqUzitRjhhKrbvFTrwAboMeJwtLMQE7h9qM7x5dw
	 7Ja5SELkJ8i+c06QuliFbJpUxQ4MNZ7LkwSV9wLUrJxS3eRWcPHXBXQsg6Xyp8VUNX
	 iewWXNGzCs4ew==
Message-ID: <sashiko-outbox-197993@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] bcma: add host driver for the BCM6362 integrated
 WLAN backplane
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessio Ferri" <alessio.ferri@mythread.it>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-bcm6362-wlan-v4-4-f001f6d75dc3@mythread.it>
References: <20261104-bcm6362-wlan-v4-0-f001f6d75dc3@mythread.it>
 <20261104-bcm6362-wlan-v4-4-f001f6d75dc3@mythread.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 20:07:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] bcma: unconditional driver unregister in bcma_modexit() after in=
it failure
- [Medium] bcma: memory and iomap leak in bcma_host_soc_bcm6362_probe() on =
scan error
--

commit 400b457ad79cb1893252ac704192c2032be3a329
Author: Alessio Ferri <alessio.ferri@mythread.it>

bcma: add host driver for the BCM6362 integrated WLAN backplane

This commit adds a host driver for the BCM6362 integrated WLAN bcma
backplane, handling clock enablement, resets, big-endian I/O ops, and
emulation of per-core control registers for wrapperless cores.

> diff --git a/drivers/bcma/host_soc_bcm6362.c b/drivers/bcma/host_soc_bcm6=
362.c
> new file mode 100644
> index 0000000000000..e8400cb624484
> --- /dev/null
> +++ b/drivers/bcma/host_soc_bcm6362.c
[ ... ]
> +static int bcma_host_soc_bcm6362_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	err =3D bcma_bus_register(bus);
> +	if (err) {
> +		bcma_host_soc_bcm6362_power_off(host);
> +		return err;
> +	}

[Severity: Medium]
As reported by Sashiko on v2 [1], does bcma_host_soc_bcm6362_probe() leak
core structures and their ioremap() mappings if bcma_bus_register() fails?

When bcma_bus_register() calls bcma_bus_scan(), each discovered core is
allocated, mapped via ioremap() into core->io_addr, and appended to
bus->cores. If scanning a subsequent core fails (for example, returning
-ENOMEM or -EILSEQ in bcma_bus_scan()), bcma_bus_scan() returns the error
with any previously scanned cores still on bus->cores:

drivers/bcma/scan.c:bcma_bus_scan() {
    ...
		err =3D bcma_get_next_core(bus, &eromptr, NULL, core_num, core);
		if (err < 0) {
			kfree(core);
			...
			goto out;
		}
    ...
}

Because bcma_host_soc_bcm6362_probe() powers off and returns without
calling bcma_unregister_cores(bus), wouldn't those allocated cores and
their core->io_addr mappings be leaked?

> diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
> index 72f045e6ed513..4ccc9fb98f616 100644
> --- a/drivers/bcma/main.c
> +++ b/drivers/bcma/main.c
> @@ -682,6 +682,11 @@ static int __init bcma_modinit(void)
>  		pr_err("SoC host initialization failed\n");
>  		err =3D 0;
>  	}
> +	err =3D bcma_host_soc_bcm6362_register_driver();
> +	if (err) {
> +		pr_err("BCM6362 WLAN host initialization failed\n");
> +		err =3D 0;
> +	}
>  #ifdef CONFIG_BCMA_HOST_PCI
>  	err =3D bcma_host_pci_init();
>  	if (err) {
> @@ -699,6 +704,7 @@ static void __exit bcma_modexit(void)
>  #ifdef CONFIG_BCMA_HOST_PCI
>  	bcma_host_pci_exit();
>  #endif
> +	bcma_host_soc_bcm6362_unregister_driver();

[Severity: Medium]
As reported by Sashiko on v2 [1], could calling
bcma_host_soc_bcm6362_unregister_driver() unconditionally in bcma_modexit()
trigger a warning if registration failed during module init?

In bcma_modinit(), if bcma_host_soc_bcm6362_register_driver() fails, the
error is logged and cleared to 0 so the module still loads, leaving
bcma_host_soc_bcm6362_driver.driver.p as NULL. When the module is later
unloaded, bcma_modexit() calls:

bcma_host_soc_bcm6362_unregister_driver()
  -> platform_driver_unregister()
    -> driver_unregister()

which checks if (!drv || !drv->p) and hits WARN(1, "Unexpected driver
unregister!\n").

[1] https://lore.kernel.org/r/20261012-bcm6362-wlan-v2-4-4752da7e0982@mythr=
ead.it

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-bcm6362-wl=
an-v4-0-f001f6d75dc3@mythread.it?part=3D4
