Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC9413D62
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604040; cv=none; b=B3h4en/RUXHu852aOwGLPQ0dT/xqAFRXU6YtDnhOkxJSaQ3Om4/eYm/SXbPA0GReiHkmFSplPQmBt8n2FqrS783bq4Z7GlSdCMX0C9jwcHlwJXIey6vnUE4GwzEhThIgRBuwHt7pRhC0bL4zvX3z6Vrw1Z/WlsU5Ms3ET+D2O+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604040; c=relaxed/simple;
	bh=Tk1FG0B7DFzpFihs16y/LWLxuWK/3HdCTNpRjQiFCl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e4eBxJZRfFP/lHNBAyAwfbE9caiqEs8Z2KUjC3d00aKVpHWGpX15G0aLhIBroJNfOdIEZYJywMQqy40p0t6HFL74oeesVD+6aNAWmwDEKX3O1KmzSsKUFvw+HuIbujX/KRt/KpixmEtetu6r+cQzDnvT3qsnYgNTNkBfpPTxMHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZPsH6GA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZPsH6GA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326681F00A3A;
	Thu, 13 Aug 2026 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786604039;
	bh=0Fr1fey4z1RmfoCm6VpWp5RCRLneyeH2BtwQQ0jIr4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZPsH6GAryycxYiXP4qJdE7YVeXkClJlkjjDaZ7syUwS5EqHvB1/X4M6beRC1khud
	 uJGElT9XOW+j5infXm1at7+5QSpsQe5X4biqamVRFBOVvLo4gUsAQbHm9ixEUpGhUc
	 N1P+ewyf3pxD1VS1Y3QNgNMBAiXEwn9joFd5qmafLroEkJP4mXG9ujg1HkceMx/Xpi
	 zScGOjrK2db5ciVQp0/zGSm13xw7GPhHkLbxyO0EMT5su7UoEclUDxq0+VC6HDxltT
	 tAwR6xezJrV5xfuF06cj5bozFFCK9iiR7HTmf1/WO6ubuiupIqy69xJGqLEqFGN1uj
	 0zPqHks1lqDDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Che Hsieh" <yc_hsieh@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813-upstream_kcs_multiple_lpc-v2-2-775b1db3fe95@aspeedtech.com>
References: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
 <20260813-upstream_kcs_multiple_lpc-v2-2-775b1db3fe95@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 06:53:58 +0000
Message-Id: <20260813065359.326681F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized spinlock crash when IRQ is triggered before `kcs_bmc=
_add_device()` initializes it.
- [High] Missing hardware cleanup on probe error leads to a shared IRQ stor=
m.
- [High] Use-After-Free due to dangling device pointer on `kcs_bmc_add_devi=
ce()` failure.
--

--- Patch [2]: [PATCH v2 2/2] ipmi: kcs_bmc_aspeed: Support multiple LPC co=
ntroller instances ---
commit 17a4462de4be19f6ce20e258d80cf2c95a1f7589
Author: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

ipmi: kcs_bmc_aspeed: Support multiple LPC controller instances

Some SoCs (e.g. AST2700) expose more than one physical LPC controller,
each instantiating its own independent set of KCS0-KCS3 channels.
The driver is updated to derive kcs_bmc_device::channel based on an
optional LPC controller alias, allowing multiple instances to register
their chardevs properly.

> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_b=
mc_aspeed.c
> index a13a3470c17a4..591c11a445039 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c

[ ... ]

> @@ -590,9 +605,11 @@ static int aspeed_kcs_probe(struct platform_device *=
pdev)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> +	priv->channel =3D channel;
> +
>  	kcs_bmc =3D &priv->kcs_bmc;
>  	kcs_bmc->dev =3D &pdev->dev;
> -	kcs_bmc->channel =3D channel;
> +	kcs_bmc->channel =3D bank * KCS_CHANNEL_MAX + channel;
>  	kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
>  	kcs_bmc->ops =3D &aspeed_kcs_ops;
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does this probe function hav=
e a
race condition where an uninitialized spinlock can be acquired?

The downstream IRQ is requested in aspeed_kcs_config_downstream_irq() and
the hardware channel is enabled before kcs_bmc_add_device() is called:

drivers/char/ipmi/kcs_bmc_aspeed.c:aspeed_kcs_probe() {
    ...
	/* Host to BMC IRQ */
	rc =3D aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
    ...
	aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVEN=
T_TYPE_OBE), 0);
	aspeed_kcs_enable_channel(kcs_bmc, true);

	rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
    ...
}

The spinlock kcs_bmc->lock is only initialized inside kcs_bmc_add_device().
If a shared interrupt fires, or a pending interrupt from the hardware is
triggered right after enabling the channel, could kcs_bmc_handle_event()
attempt to lock kcs_bmc->lock before it has been initialized?

[Severity: High]
This is a pre-existing issue, but is there a missing hardware cleanup on the
probe error path?

If kcs_bmc_add_device() fails, the function returns immediately:

drivers/char/ipmi/kcs_bmc_aspeed.c:aspeed_kcs_probe() {
    ...
	rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
	if (rc) {
		dev_warn(&pdev->dev, "Failed to register channel %d: %d\n", kcs_bmc->chan=
nel, rc);
		return rc;
	}
    ...
}

Because devm cleans up the IRQ handler but the hardware remains enabled and
unmasked, will this unhandled shared IRQ fire continuously and cause an IRQ
storm?

[Severity: High]
This is a pre-existing issue, but does a failure in kcs_bmc_add_device() le=
ad
to a use-after-free?

In kcs_bmc_add_device(), kcs_bmc->entry is added to the global kcs_bmc_devi=
ces
list. If any registered driver fails to add the device, the function return=
s an
error without removing the device from the list:

drivers/char/ipmi/kcs_bmc.c:kcs_bmc_add_device() {
    ...
	list_add(&kcs_bmc->entry, &kcs_bmc_devices);
    ...
	return error;
}

Since list_del() is not called on the error path, and the probe error causes
devres to free the memory for priv (which embeds kcs_bmc), will any subsequ=
ent
driver registration or removal iterate over the global list and access freed
memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-upstream_k=
cs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com?part=3D2
