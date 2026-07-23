Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A957299943
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784785383; cv=none; b=gnmqV2qMm9i4IXD5F6/8GY1NY0J49Pf1aeAO+hipITWS8eahPPCmRu2fVhz9MGy6M0nSXo9Z+bRSiMTSBPcFRW0j8AleE8zJZ+BT01J6X4imzupnoabGSjuUjtCYzpwyKuoYoLcONekS1Mi69+qxSENst58wareGoImB7zFQ6Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784785383; c=relaxed/simple;
	bh=jP5l19RdtgCR/sGh5dGmSVH2M3CNUNPk1eNcsYMBDiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r5Uhfvhvmrlxsxl6tTTGFiaaxHv9OpJ0a3iyr4ZVjPGkgtwpUl+efyFA9GyAxboBHvQFaU//kaSZ+skJKQ//n15hIjpBq4QiM/mDW3k6rVioWwkDIorIvd7lwWlvWH7qodoS3qzpLCX/IEXirkw6oCF6qqDeOm4Y3J2ie1eoJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYgvhpG4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYgvhpG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9D81F000E9;
	Thu, 23 Jul 2026 05:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784785382;
	bh=OARpeMh+B4Yi8QXYZl5osNC6Tb0Fv3fGKVacvyPfOwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYgvhpG47H0oOqpYwivBloWDMYsoxV3xesHf0Y3vNGdCvht7YxofT4vseh5eU2Cr6
	 Pqjyvn2s4x34TvTb8nG0IPQT8Aj8RyDz56T7E+TpGkhnuiVNMYQ1fROI8zwHyWMUiQ
	 mX7Cl5+PaQTNUmkscBqk61jYlIWU+OS4EJb3g88k8/bxX2XGV9V4ebtThS4IacEloB
	 TWkiaPhSnA33TBe/7eS5APZi2hlQb0fZ497hmvYEqJWhoQd9YHwoWJ+K5WT5jTEeUZ
	 SaJILcR4Am018P+GoJ57Df6G4QxSRKcGPS9852SJknPQsDjN+KbooRag6qkmkRAWSX
	 fpDan6AKEYXMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Che Hsieh" <yc_hsieh@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-upstream_kcs_multiple_lpc-v1-2-d918b5270b86@aspeedtech.com>
References: <20260723-upstream_kcs_multiple_lpc-v1-0-d918b5270b86@aspeedtech.com>
 <20260723-upstream_kcs_multiple_lpc-v1-2-d918b5270b86@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 05:43:01 +0000
Message-Id: <20260723054302.0E9D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `kcs_bmc_add_device()` fails, the `kcs_bmc` device remains on t=
he global `kcs_bmc_devices` list, causing a use-after-free when devres clea=
ns up.
- [High] The driver requests a shared IRQ before initializing the `kcs_bmc-=
>lock` spinlock, which can cause a crash if a shared interrupt fires early.
- [High] The IPMI chardev frees its private data before all file descriptor=
s are closed, leading to a use-after-free on driver unbind.
--

--- Patch [2]: [PATCH RFC 2/2] ipmi: kcs_bmc_aspeed: Support multiple LPC c=
ontroller instances ---
commit 528fa21291ddfb0afac162723f5334b19c0f6d20
Author: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

ipmi: kcs_bmc_aspeed: Support multiple LPC controller instances

This commit introduces support for multiple physical LPC controllers by
splitting the KCS channel representation into a driver-private channel for
register access and a globally unique channel for the chardev exposed to
userspace. It derives the global channel number using an optional "lpcN"
alias on the LPC controller node.

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
This isn't a bug introduced by this patch, but does a failure in
kcs_bmc_add_device() leave a dangling pointer on the global list?

If any driver's add_device callback fails, kcs_bmc_add_device() returns an
error without unlinking kcs_bmc->entry from the kcs_bmc_devices list.
This error propagates back to aspeed_kcs_probe(), which returns it:

	rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
	if (rc) {
		dev_warn(&pdev->dev, "Failed to register channel %d: %d\n", kcs_bmc->chan=
nel, rc);
		return rc;
	}

The devres framework will then free the priv memory containing the kcs_bmc
object, leaving a dangling pointer in the global kcs_bmc_devices list.
Could this lead to a use-after-free during subsequent driver registrations?

[Severity: High]
This is also a pre-existing issue, but is it safe to request a shared IRQ
before the spinlock is initialized?

In aspeed_kcs_probe(), aspeed_kcs_config_downstream_irq() is called before
kcs_bmc_add_device():

	/* Host to BMC IRQ */
	rc =3D aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
	if (rc)
		return rc;

aspeed_kcs_config_downstream_irq() uses devm_request_irq() with IRQF_SHARED,
which activates the aspeed_kcs_irq() handler. The handler immediately tries
to acquire kcs_bmc->lock.

However, kcs_bmc->lock isn't initialized until kcs_bmc_add_device() is
called later in the probe sequence. If a shared device on the same IRQ line
fires an interrupt in this window, could the handler dereference an
uninitialized spinlock?

[Severity: High]
This is another pre-existing issue in the IPMI chardev code, but does
kcs_bmc_ipmi_remove_device() free the private data before all file
descriptors are closed?

In drivers/char/ipmi/kcs_bmc_cdev_ipmi.c, kcs_bmc_ipmi_remove_device()
unregisters the miscdev and explicitly frees the priv struct:

	misc_deregister(&priv->miscdev);
	kcs_bmc_disable_device(priv->client.dev, &priv->client);
	devm_kfree(kcs_bmc->dev, priv->kbuffer);
	// ...
	devm_kfree(kcs_bmc->dev, priv);

Since misc_deregister() doesn't close existing file descriptors or wait for
active file operations to complete, could a user process that is sleeping in
kcs_bmc_ipmi_read() access the freed priv->mutex and priv->kbuffer when it
wakes up?

	wait_event_interruptible(priv->queue,
				 priv->data_in_avail);

	mutex_lock(&priv->mutex);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-upstream_k=
cs_multiple_lpc-v1-0-d918b5270b86@aspeedtech.com?part=3D2
