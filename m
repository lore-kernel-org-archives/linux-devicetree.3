Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B359C2F3C10
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555842; cv=none; b=X/z64syDy4ZNeeJagp9X6d/cdPQjCk3wVt+lFAoqIFWKEBFJgN9ljaTuNdk8/pnx85fICbvrehtH7GpnjCWKG4V1x09Gxm3jwmjgGvbqZi63zcVoF6MzYsUsXyv0mASSLJklsl7YZpS9uEUDz/lnJA6onA9zt+2jRRF+0SqPw48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555842; c=relaxed/simple;
	bh=9gHAG5HigLkTRlfUUAPTv5LCVMuSAgSV7KkCUfOiW6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VdhgzYELqb4RcDCLvGNW9a9zOKA3xBLS5n15MkHSzhonIszsgZc9UY+Tk0fzwwcbAW4ON6WNCjYPUvwlWwwyL7iYCGSlpPwXVq4ro/mTGd3VlUCPXhuJn1d6edb7XGWaC0MUpUnzWYC5ynwgabDTqBAsEKLbVTOyO7cLrzzVdik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MX7bNwSQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MX7bNwSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216081F00A3A;
	Mon, 24 Aug 2026 07:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787555841;
	bh=G35dHnALsPD+Puy08DU+SwMlThqnp+a3HlfSlCTxhSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MX7bNwSQwvm+O0oRe4b6TvcgZDZonnT1km4tN8q6H0yrR18RA3E7b7Ap3qkuysCCX
	 BqkF5eW2/Sb+oEKSHWhDNNwwu/ZQ48UVki8G8Ak5dz9Hk7rbeJH/9riQlcNlVYNtUQ
	 v3VSIsA963cqRFG8cDXJfRzPtZxAKQpCAu6qx2ISdVijAiOBLfdpTJ+KVdTGQ5EJrk
	 m3/YEjkKdur8OUwsTt8dY9rrfB4oeZkyhw6WOla1kzVVdP8wDZG62I8K4Wegd3RmYG
	 N6sb/a63xMM/mKLW4F6QYic75HUOLWDQ/JB+9ayq5vxxTEQUENYqgSAs14hc/5joS0
	 Zjr0GUe9aFExw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Che Hsieh" <yc_hsieh@aspeedtech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260824-upstream_kcs_multiple_lpc-v3-1-b15bb0f77462@aspeedtech.com>
References: <20260824-upstream_kcs_multiple_lpc-v3-1-b15bb0f77462@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 07:17:20 +0000
Message-Id: <20260824071721.216081F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Dynamically allocated `struct aspeed_kcs_bank` entries are never=
 freed on module unload, causing a memory leak.
- [Medium] The driver stores the parent `device_node` pointer in a global l=
ist without acquiring a reference, risking a dangling pointer and ABA alias=
ing.

Pre-existing issues:
- [High] The IRQ handler is registered before `kcs_bmc->lock` is initialize=
d, leading to uninitialized spinlock access if a shared interrupt fires.
- [High] The KCS hardware channel is left enabled if `kcs_bmc_add_device` f=
ails, potentially causing an unhandled IRQ storm.
--

--- Patch [1]: [PATCH v3] ipmi: kcs_bmc_aspeed: Support multiple LPC contro=
ller instances ---
commit 6a9db3a3464fe3254462564cc2c5b13db5dfb6b3
Author: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

ipmi: kcs_bmc_aspeed: Support multiple LPC controller instances

This patch adds support for multiple physical LPC controller instances on
SoCs like AST2700. It separates the hardware channel index from the global
KCS device channel index. A dynamic bank index is assigned to each LPC
controller node during probe to ensure unique chardev names.

Link: https://lore.kernel.org/r/20260813-upstream_kcs_multiple_lpc-v2-0-775=
b1db3fe95@aspeedtech.com

> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_b=
mc_aspeed.c
> index a13a3470c17a4..751f477c09e0d 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c

[ ... ]

> @@ -526,6 +530,47 @@ static int aspeed_kcs_of_get_channel(struct platform=
_device *pdev)
>  	return -EINVAL;
>  }
> =20
> +struct aspeed_kcs_bank {
> +	struct device_node *lpc_np;
> +	struct list_head entry;
> +};
> +
> +static DEFINE_MUTEX(aspeed_kcs_bank_lock);
> +static LIST_HEAD(aspeed_kcs_banks);
> +
> +/*
> + * Assign each distinct LPC controller device_node a stable bank index t=
he
> + * first time it's seen, so that KCS devices instantiated from different=
 LPC
> + * controllers on the same SoC (e.g. AST2700) don't collide on the same
> + * global kcs_bmc_device::channel value.
> + */
> +static int aspeed_kcs_of_get_bank(struct device_node *lpc_np)
> +{
> +	struct aspeed_kcs_bank *bank;
> +	int index =3D 0;
> +
> +	mutex_lock(&aspeed_kcs_bank_lock);
> +
> +	list_for_each_entry(bank, &aspeed_kcs_banks, entry) {
> +		if (bank->lpc_np =3D=3D lpc_np)
> +			goto out;
> +		index++;
> +	}
> +
> +	bank =3D kzalloc(sizeof(*bank), GFP_KERNEL);

[Severity: Medium]
Does this leak memory on module unload?

Since the bank entries are dynamically allocated and added to the global
aspeed_kcs_banks list, and the driver uses the default module exit routine,
it looks like unloading the module might permanently leak these allocations.

> +	if (!bank) {
> +		mutex_unlock(&aspeed_kcs_bank_lock);
> +		return -ENOMEM;
> +	}
> +
> +	bank->lpc_np =3D lpc_np;
> +	list_add_tail(&bank->entry, &aspeed_kcs_banks);

[Severity: Medium]
Is it safe to store the raw device_node pointer without pinning its referen=
ce?

If the LPC node is removed via Device Tree overlays, this pointer might
become dangling. If a new node is later allocated at the same memory addres=
s,
could it cause an ABA problem where an unrelated device incorrectly matches
this old bank index?

Should this use of_node_get() to keep the reference alive?

> +
> +out:
> +	mutex_unlock(&aspeed_kcs_bank_lock);
> +	return index;
> +}

[ ... ]

> @@ -590,9 +639,11 @@ static int aspeed_kcs_probe(struct platform_device *=
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
This is a pre-existing issue, but I noticed a potential race condition in t=
he
probe function just below this hunk.

The driver requests a shared irq before the lock is initialized:

aspeed_kcs_probe() {
    ...
    rc =3D aspeed_kcs_config_downstream_irq(kcs_bmc, pdev); // Requests IRQ
    ...
    rc =3D kcs_bmc_add_device(&priv->kcs_bmc); // Initializes kcs_bmc->lock
}

If a shared interrupt fires immediately after the IRQ is requested, could t=
he
handler try to acquire the uninitialized spinlock in kcs_bmc_handle_event()
and cause a kernel panic?

[Severity: High]
This is also a pre-existing issue, but does the error path for device
registration leave the hardware channel enabled?

aspeed_kcs_probe() {
    ...
    aspeed_kcs_enable_channel(kcs_bmc, true);
   =20
    rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
    if (rc) {
        dev_warn(&pdev->dev, ...);
        return rc;
    }
}

If kcs_bmc_add_device() fails, the function returns without calling
aspeed_kcs_enable_channel(kcs_bmc, false). Since the probe failure will
clean up the IRQ handler, could this leave the hardware asserting an
unhandled interrupt and eventually disable the shared IRQ line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-upstream_k=
cs_multiple_lpc-v3-1-b15bb0f77462@aspeedtech.com?part=3D1
