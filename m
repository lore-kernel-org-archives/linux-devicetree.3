Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74065368D78
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616615; cv=none; b=JtuxW+7b0kJJEvFuxiXRQ2nlDiCcqSxAiB4NLAOWQsI/ANbz+1YkyNPI+RqVvsl81XmePb8hBzAHdv8f7JVlekv2V8OH3wmy9GsuTCPJypuzxfb/S66aCfA3E/17FBhNXm2MNpRjNs4sLskcSAXSgJYx9TegIJFEG2IjQQiy8LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616615; c=relaxed/simple;
	bh=nQo860iNRYdk0qI1yFiEL5zB9jAFOXcDPPpPboF6CRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PUk7yExHv1vcFzcz9Xzf863BB0CKaxqCaVwLwMozwodz5cf+wTPCM8TEuM7zNt8zKPJ3sgcC0G9EvXLifWwAAx687xbzp3HuLRausNkFKxkQKDi89lw3iL6Ypm+/ewWcY8wFG0tjnPIMwLaXi+BHui582zP96Mc/hSHBkL/rxrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCqXpNgg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCqXpNgg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B611F1F000FF;
	Mon, 28 Sep 2026 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790616614;
	bh=BIA8MsuR4BJwyZUhqiKBE6XCJ54T9EZyPNDb2bTddT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TCqXpNggvdrUmGtXXlfFf8nnrhIKaNe2bQLB0Ez8ARoWdxqVDHtLoz3xkZnwA1QaW
	 29t+VhTfp5XmQQVBTbTLCyLFXu5PbSoj+nuRHnBkTx3LFFCuvRtZM3ulAroZTLFqn/
	 Z1xWRowtXDprk+2CHYr9CAo6FJmfKjVLneYGhdO8mlB89YjhF+4dw2pxSzRmTVhPWv
	 J0/QwrQUHe8TzVrLbTWtQUAyDwwb4Dsu8YmCMElYRmwT5JVapx5FYXmnTwbCzIbZMA
	 qcYG2mSBDSqp2VQTz2ywtJzZaGpx++ANpvGFTFI6dIq71uEddiR42w51BOi81KURB+
	 EEn8yQRAN1Yaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] power: reset: syscon-reboot-mode: enable supplies
 for the next stage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-3-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
 <20260928-b4-rk3576-reboot-mode-v1-3-65486b03bd41@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 17:30:13 +0000
Message-Id: <20260928173013.B611F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pm: memory leak of regulator_bulk_data array in probe error path=
 and teardown
--

commit e442fa70c7e3dbcc8c8ea6a28287f1aa26600fe2
Author: Alexey Charkov <alchark@flipper.net>

power: reset: syscon-reboot-mode: enable supplies for the next stage

This commit requests the boot mode to explicitly enable regulators used
by the reboot mode sequence, preventing early boot code from hanging if
the running system left them powered down. The supplies are deliberately
left enabled to be available for the next stage.

> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/res=
et/syscon-reboot-mode.c
> index e0772c9f70f7a..3072922f1716a 100644
> --- a/drivers/power/reset/syscon-reboot-mode.c
> +++ b/drivers/power/reset/syscon-reboot-mode.c

[ ... ]

> @@ -28,6 +31,20 @@ static int syscon_reboot_mode_write(struct reboot_mode=
_driver *reboot,
> =20
>  	syscon_rbm =3D container_of(reboot, struct syscon_reboot_mode, reboot);
> =20
> +	/*
> +	 * Whatever acts on the mode (e.g. boot ROM) runs before the operating
> +	 * system, and may need supplies that the running system had powered
> +	 * down. Enable them here, and deliberately leave them enabled: the
> +	 * system is on its way down, and what runs next may not know how to
> +	 * turn them on.
> +	 */
> +	if (syscon_rbm->num_supplies) {
> +		ret =3D regulator_bulk_enable(syscon_rbm->num_supplies,
> +					    syscon_rbm->supplies);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
regulator_bulk_enable() here risk an uninitialized pointer dereference if it
hits an error?

of_regulator_bulk_get_all() dynamically allocates the array with kmalloc_ob=
js()
without zeroing it, leaving the .supply field of the returned structures
uninitialized.

If regulator_bulk_enable() fails, its error path attempts to log the failure
using the uninitialized .supply field:

    pr_err("Failed to enable %s...", consumers[i].supply)

Passing this uninitialized pointer to the %s format specifier would cause an
out-of-bounds memory read and a kernel oops.

> +		if (ret < 0)
> +			dev_err(reboot->dev, "enabling reboot mode supplies failed\n");
> +	}
> +
>  	ret =3D regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
>  				 syscon_rbm->mask, magic);
>  	if (ret < 0)
> @@ -36,6 +53,13 @@ static int syscon_reboot_mode_write(struct reboot_mode=
_driver *reboot,
>  	return ret;
>  }
> =20
> +static void syscon_reboot_mode_put_supplies(void *data)
> +{
> +	struct syscon_reboot_mode *syscon_rbm =3D data;
> +
> +	regulator_bulk_free(syscon_rbm->num_supplies, syscon_rbm->supplies);

[Severity: Medium]
Does this code leak the dynamically allocated syscon_rbm->supplies array?

The array is dynamically allocated via of_regulator_bulk_get_all() during
probe. While regulator_bulk_free() releases the individual regulator
references, it does not free the array memory itself. Does this cleanup
action need an explicit kfree(syscon_rbm->supplies) to avoid a leak on devi=
ce
unbind or probe failure?

> +}
> +
>  static int syscon_reboot_mode_probe(struct platform_device *pdev)
>  {
>  	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-b4-rk3576-=
reboot-mode-v1-0-65486b03bd41@flipper.net?part=3D3
