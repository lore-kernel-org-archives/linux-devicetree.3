Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5E35C185
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782538536; cv=none; b=Apy1rf4mZv4919c9Wd+lDx/Q5tEHUffGnEbSOs8FUZ2CBLuL8Z/qtxko7/p4Io8RWTtWcJGVzIaZkJ1wFWvER2ryh2vkzlYEs/HWXSI7A7wnzyJxTVIn2gkKpAoVC+5ZSXfH7l4mPbk8pW4a9jLP+Um8cDrH6qtWoEmzJzm3NiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782538536; c=relaxed/simple;
	bh=WQc7S+jvROHQpmE+v4+rkLIEhVmHd3NcTcoE07qT/Sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nxg6HBrpdB73scnmRKgIcamHsVzvf0CoXW2lQC3eB9u4TnxumdrT4xbhnzZLmhcVzXNtP9/yJG9ds174WC12jacGVUoZg5W5SwwBmFdCNaRCKq93ndF6bmCi/VM0rzldXPZu8zEpv7UIZUvKQH7EPLH2iu6gN/pFOVcSfdpDna4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0pa4q/x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0pa4q/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3E91F000E9;
	Sat, 27 Jun 2026 05:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782538534;
	bh=l9f/NbVf5fgU28GAB0uVWqeK1MGsRbUcZ6npvaEXgTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0pa4q/xQ8P+vaR3yaT48lmJeRajlmSl3fiE7S8X02dqD7aczde13GSH8BUT+kx3L
	 kpF9AlPCC1XhoNppM/KZT/OpLRf1ef34vVZfXEhrttTigPekLnLWl3RIrQJ+myBbro
	 ci7ZS4tbeKZ8siZNHWY7kSWRR+1mftfhdBCXywbCotUoQjjEHKpEUft130OWI7R6LQ
	 vagm/bz6e/vxvZ08n+epDE6vbjretGp4moJgY2wbC5PoOQgl6d/+lcvv6ynvreGg5X
	 gyQnoAog1R1wGR0pNXd1khIO4CLWRGrdTQ+iVoGy79V9m9759oiRoNryR7pqgVDoY5
	 PA9/DaLfDowpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haiyue Wang" <haiyuewa@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260627052708.172918-1-haiyuewa@163.com>
References: <20260627052708.172918-1-haiyuewa@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 05:35:34 +0000
Message-Id: <20260627053534.7C3E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The KCS BMC drivers register and enable their IRQ handler before i=
nitializing the device spinlock, leading to a potential crash or lockdep sp=
lat on an uninitialized spinlock.
--

commit a51ce0f5a1fd9344e679346b6911e87b35021057
Author: Haiyue Wang <haiyuewa@163.com>

ARM: dts: aspeed: g6: Use KCS AST2600 compatible string

This commit updates the device tree source for the AST2600 to use the
specific aspeed,ast2600-kcs-bmc compatible string instead of the older
ast2500 compatible string.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 189bc3bbb47c9..9d09d6e0092a8 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -576,7 +576,7 @@ lpc: lpc@1e789000 {
>  				ranges =3D <0x0 0x1e789000 0x1000>;
> =20
>  				kcs1: kcs@24 {
> -					compatible =3D "aspeed,ast2500-kcs-bmc-v2";
> +					compatible =3D "aspeed,ast2600-kcs-bmc";

[Severity: High]
This is a pre-existing issue, but modifying the compatible string draws
attention to an issue in the underlying driver's probe routine.

Does the driver initialization sequence have a race condition that could
lead to a crash on an uninitialized spinlock?

Looking at the driver for this compatible string:

drivers/char/ipmi/kcs_bmc_aspeed.c:aspeed_kcs_probe() {
    ...
    rc =3D aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
    if (rc)
        return rc;
    ...
    aspeed_kcs_enable_channel(kcs_bmc, true);

    rc =3D kcs_bmc_add_device(&priv->kcs_bmc);
    ...
}

The IRQ handler is registered in aspeed_kcs_config_downstream_irq() and
hardware interrupts are explicitly enabled via aspeed_kcs_enable_channel()
before kcs_bmc_add_device() is called. However, kcs_bmc_add_device() is
where spin_lock_init() initializes the device lock.=20

If an interrupt fires (either from the hardware or on a shared IRQ line)
in the small window between enabling the channel and initializing the
spinlock, will kcs_bmc_handle_event() unconditionally attempt to acquire
the uninitialized spinlock?

As an aside, the same initialization order issue appears to be present in
the npcm7xx_kcs_probe() routine as well:

drivers/char/ipmi/kcs_bmc_npcm7xx.c:npcm7xx_kcs_probe() {
    ...
    rc =3D npcm7xx_kcs_config_irq(kcs_bmc, pdev);
    if (rc)
        return rc;

    npcm7xx_kcs_irq_mask_update(kcs_bmc, ...);
    npcm7xx_kcs_enable_channel(kcs_bmc, true);

    rc =3D kcs_bmc_add_device(kcs_bmc);
    ...
}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627052708.1729=
18-1-haiyuewa@163.com?part=3D1
