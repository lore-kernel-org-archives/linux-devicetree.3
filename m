Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F67D42A82
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138004; cv=none; b=PktAPrle7wsHShofQ1z2A3pdJHK1dg5fvyhrqrUh93CwZLSd1RbJE2jv6yG9dbM0siTGsYldDn63DXES546FEEvUVdArJI8fzWngyUbxpq7LL5nhN5pjkOVREBen+EScgLYA+L3y0PYJXwWfoOyfGpQ66qxhEDM5WrRJxLHY/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138004; c=relaxed/simple;
	bh=/lMOUo+06JQSvgZZSsDMRGuGP+HIziJxpjzG8G4oEhk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hzv+W8d6jGFYbJzP/CBDwlOdo6BNy3XKqT9oEkomdk0218FMNm+mAm9q1G4f0lGBev8ZZmbX7twSvrxy3vEEFIVUAHB70UO6kD9teFBCXTgu1KGEKjTcQ5mHIubrNLCk2WetENaGhhUPAN/0CIxP5cYBd/cSpwFk67jIUJ0mqNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOr3cFL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOr3cFL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09631F000E9;
	Mon, 27 Jul 2026 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138003;
	bh=E0Z7ZJdSKrVWoG5sM9NlG/FezkMuWZ4+jkTARh4Ugcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOr3cFL6zVmhFeoUhoJobEaZulglmg/lPVS5Knq2j/lGbAUPcNVHx95BXzZ4+HJut
	 mb8+sytqIcJ3Xfsol9ZDWcRAVDt/e7bsdVC0kMJ95jN/1WBXvpLPqrb6y8rSE0nepm
	 m2+WcDlIn+D6HtJcXcOQ+ece7+n5OKxSp0E7x9a8Q7KbvSyb47cdXfb012VOTcV0vJ
	 Mm2KZvJovrWV3w88+IMNTNm8ChEy6D1aHVlgwtKLBIkMsjl6BqLfClUpJ/FNaCcHRN
	 c3m4wID7MRV6+soe6x6X8EDab9/A3nVj1+Rc4GZGjIvOiKGqYfKYLiaKCT4TJZthNg
	 HWCD+UG2h1ILQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over
 PCIe
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <45f36ea6a3a2df18b51c5b83200c7596dbafe133.1785135437.git.gregoire.layet@9elements.com>
References: <cover.1785135437.git.gregoire.layet@9elements.com>
 <45f36ea6a3a2df18b51c5b83200c7596dbafe133.1785135437.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:40:02 +0000
Message-Id: <20260727074002.D09631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized spinlock access in interrupt handler.
- [High] Hardware channel remains enabled when `kcs_bmc_add_device()` fails.
- [Medium] OBE timer race condition allows infinite background polling.
- [Medium] Unchecked dereference of `pdev->dev.of_node`.
--

--- Patch [1]: [PATCH v3 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 o=
ver PCIe ---
commit 99fe5c8c1ecb27a7e6072d1058a4963ff797b165
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe

This commit adds a 5th KCS channel for the ASPEED AST2600 to support
KCS 4 over PCIe. It configures the appropriate registers and restricts
usage of this 5th channel to compatible AST2600 controllers.

> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_b=
mc_aspeed.c
> index a13a3470c17a4..97daa2b3d6a04 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c

[ ... ]

> @@ -452,6 +479,10 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bm=
c_device *kcs_bmc, u8 mask,
>  			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIE4,
>  					   enable * LPC_HICRB_IBFIE4);
>  			return;
> +		case 5:
> +			regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_IBFIE4,
> +					   enable * LPC_HICRB_IBFIE4);
> +			return;
>  		default:
>  			pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
>  			return;

[Severity: Medium]
This is a pre-existing issue, but since we are updating channel 5 here, I
wanted to ask about the OBE timer logic earlier in this function.

When disabling the OBE event, aspeed_kcs_irq_mask_update() calls
timer_delete(&priv->obe.timer). Because timer_delete() is asynchronous, if a
concurrent timer handler (aspeed_kcs_check_obe) is executing on another CPU,
it might observe the hardware OBF status is still set and call mod_timer().

Could this result in the timer endlessly re-arming itself and polling the
hardware indefinitely in the background? Might timer_delete_sync() or a sha=
red
shutdown flag be needed here to prevent that?

[ ... ]

> @@ -575,11 +607,16 @@ static int aspeed_kcs_probe(struct platform_device =
*pdev)
>  	if (channel < 0)
>  		return channel;
> =20
> +	np =3D pdev->dev.of_node;
> +	if (channel =3D=3D 5 && !of_device_is_compatible(np, "aspeed,ast2600-kc=
s-bmc")) {
> +		dev_err(&pdev->dev, "LPC over PCIE KCS4 only supported on ast2600\n");
> +		return -ENODEV;
> +	}
> +
>  	nr_addrs =3D aspeed_kcs_of_get_io_address(pdev, addrs);
>  	if (nr_addrs < 0)
>  		return nr_addrs;
> =20
> -	np =3D pdev->dev.of_node;

[Severity: Medium]
This isn't a bug introduced by this patch, but I noticed pdev->dev.of_node =
is
used here in aspeed_kcs_probe().

Earlier in aspeed_kcs_probe(), we have this assignment:

aspeed_kcs_probe() {
    ...
    np =3D pdev->dev.of_node->parent;
    ...

Is there a scenario where this driver could be manually bound via sysfs by a
root user without a valid Device Tree node? If that happens, would
dereferencing pdev->dev.of_node->parent cause a kernel panic?

[Severity: High]
This is a pre-existing issue, but I have a question about the probe error
path further down in aspeed_kcs_probe().

During probe, the driver enables the hardware channel and then registers the
device:

aspeed_kcs_probe() {
    ...
    aspeed_kcs_enable_channel(kcs_bmc, true);

    rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
    if (rc) {
        dev_warn(&pdev->dev, "Failed to register channel ...\n");
        return rc;
    }
    ...
}

If kcs_bmc_add_device() fails, the hardware remains active on the host bus.
If the device asserts an interrupt in this state, could it result in an
unhandled interrupt storm since the channel is never explicitly disabled on
this error path?

[Severity: High]
This isn't a bug introduced by this patch, but looking at the sequence above
in aspeed_kcs_probe(), there appears to be a window where the hardware is
fully enabled to assert IRQs before kcs_bmc_add_device() is called.

If an interrupt fires immediately after aspeed_kcs_enable_channel(), the
registered handler aspeed_kcs_irq() will trigger and call
kcs_bmc_handle_event(), which attempts to take kcs_bmc->lock.

However, kcs_bmc->lock is initialized inside kcs_bmc_add_device():

kcs_bmc_add_device() {
    ...
    spin_lock_init(&kcs_bmc->lock);
    ...
}

Does this mean the interrupt handler could operate on an uninitialized
spinlock if the hardware asserts an IRQ before kcs_bmc_add_device() finishe=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785135437.gi=
t.gregoire.layet@9elements.com?part=3D1
