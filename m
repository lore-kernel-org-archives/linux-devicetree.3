Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD23390CB4
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733789; cv=none; b=VTud6Uj5SBuokvrAHwJ6ENM+LgvkU/yYjAR8PPgw2ufywoJldQnuqw9YJFh/DfRGMj1sjUC2xChkGKGj0h7gDd4/yBsRKRaVS6khs3veCnpuhSp7q5qh03wfXaUWpmseLZc2R9i+KnqM6bpcs38IIQmM7cGH7FUh0LCGhFvXTLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733789; c=relaxed/simple;
	bh=0ZWnfZd1hBkFe1G4fXVPBdGhR0nO+TtVSye1zU8a160=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jZzv/u8W27HxNu4Bi8a8zAKwThkPib/muDr0Cuema48974gPPEGaFs5+Hwo13esi9b0LLraUfVlaoqQ6yLFQDYrMiJJdkgan4lcxOTOAp4QOreZvNebM3xWrNjrsstLNvM+I9qtSmu9tA971xcAyLW+SL5K4iNVo2pJC2hv2iBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+HbsC5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+HbsC5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA11A1F000E9;
	Wed, 22 Jul 2026 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784733773;
	bh=rmdT5HBaHtTFVJHprZplTOOh/VOOKobS/WgREIsrSfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+HbsC5vrhTz+TeYqFj3Ejwl5f4+ON28fjgenrvFgv8QFqfDTJdU6GPBpVerKbhDr
	 ftoIrZ2+arWVgVpv/1iV0MxKVGA1NTxEvX31yHl9h7xmKAC+qe/v1OHKHeXlgjr7tP
	 a3VcjrMKWYs1jqgnlCzm0hDuhP79pGyUMVID9u5Q/7f+oCVfgBqHW8OJ3Ezqxo5i8p
	 nWiM91Ce4pcOHi9Ltx2GkTtOf9gOv+nc1tnbnliNmGBL/YU7KmLSB0vs/5/s1qTlVs
	 ieEbe3MnC52lHomRrVf40sXdEHg7rhnm1M53RnFqn7j240pOTFsjiOxi18PHkTA8KQ
	 9+3iKpRrfcOJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over
 PCIe
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <a283420c1fb6a99df5331e078c7f15b3c97822c6.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
 <a283420c1fb6a99df5331e078c7f15b3c97822c6.1784732161.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 15:22:52 +0000
Message-Id: <20260722152252.CA11A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing PCIE_LPC_ODR4 in switch statement prevents upstream IRQ tr=
iggering for channel 5.

Pre-existing issues:
- [Critical] Returning an error from probe frees the kcs_bmc object while i=
t remains linked in the global kcs_bmc_devices list.
- [High] The KCS hardware channel is enabled and the IRQ is registered befo=
re the interrupt handler's spinlock is initialized.
- [High] Hardware channel is left enabled on the probe error path if kcs_bm=
c_add_device fails.
--

--- Patch [1]: [PATCH v2 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 o=
ver PCIe ---
commit 41d8f781b8898d768896e3f02a1b1877d0c1b5ff
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
   =20
This patch creates a 5th KCS channel to match against the KCS 4 over PCIe
addresses. It exposes a KCS-compatible interface over PCIe for the
ASPEED AST2600.

> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_b=
mc_aspeed.c
> index a13a3470c17a4..4d93af2455b8c 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c

[ ... ]

> @@ -191,6 +197,9 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kc=
s_bmc, u32 reg, u8 data)
>  	case 4:
>  		regmap_update_bits(priv->map, LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_I=
RQXE4);
>  		break;
> +	case 5:
> +		regmap_update_bits(priv->map, PCIE_LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HI=
CRC_IRQXE4);
> +		break;

[Severity: High]
Will this upstream IRQ triggering for channel 5 ever be reached?

Looking earlier in aspeed_kcs_outb(), there is a switch statement
validating the ODR registers:

aspeed_kcs_outb() {
    ...
    switch (reg) {
    case LPC_ODR1:
    case LPC_ODR2:
    case LPC_ODR3:
    case LPC_ODR4:
        break;
    default:
        return;
    }
    ...
}

Since PCIE_LPC_ODR4 is missing from this switch statement, won't any write
to the channel 5 ODR register return early and prevent this new code from
executing?

>  	default:
>  		break;
>  	}

[ ... ]

> @@ -575,11 +605,16 @@ static int aspeed_kcs_probe(struct platform_device =
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

[Severity: Critical]
This isn't a bug introduced by this patch, but does returning an error from
probe leave a freed object linked in the global list?

If kcs_bmc_add_device() fails later in aspeed_kcs_probe() after linking the
device:

aspeed_kcs_probe() {
    ...
    rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
    if (rc) {
        dev_warn(&pdev->dev, "Failed to register channel %d: %d\n", ...);
        return rc;
    }
    ...
}

Since kcs_bmc_add_device() leaves the kcs_bmc object in the global
kcs_bmc_devices list on certain errors, and devres will free the priv
structure containing kcs_bmc when we return, could this cause a
use-after-free during subsequent list iterations?

[Severity: High]
This is also a pre-existing issue, but is it safe to enable the hardware
channel before the interrupt handler's spinlock is initialized?

In aspeed_kcs_probe(), the device interrupts are enabled and can fire
immediately:

aspeed_kcs_probe() {
    ...
    aspeed_kcs_irq_mask_update(...);
    aspeed_kcs_enable_channel(kcs_bmc, true);

    rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
    ...
}

However, kcs_bmc->lock is only initialized later inside
kcs_bmc_add_device(). If an interrupt occurs in this window, will the
handler attempt to acquire an uninitialized lock?

[Severity: High]
This is another pre-existing issue, but is the hardware channel left enabled
if the probe fails here?

In the same error path for kcs_bmc_add_device() shown above, the driver
returns without disabling the channel.

Since the IRQ is shared, could unhandled interrupts from this active device
eventually cause the core IRQ subsystem to disable the shared IRQ line?

>  	nr_addrs =3D aspeed_kcs_of_get_io_address(pdev, addrs);
>  	if (nr_addrs < 0)
>  		return nr_addrs;
> =20
> -	np =3D pdev->dev.of_node;
>  	rc =3D of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream=
_irq, 2);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784732161.gi=
t.gregoire.layet@9elements.com?part=3D1
