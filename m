Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464513635E
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551307; cv=none; b=NJL0sYmuuKVBLp+bqJkVV5ExWOMLvg3d95Dl52G6+jhmlH0G7/2HqhYueeUOKlgNWK5L2S+DATwgP8tuPSd4/8d7/2Z+lkRjaDv8+m+AxTAvzOOxt4E3jVcUFn+YHVE/lRYuwQvlY16CD1K6CQBbqTt8ccSL60Th6HBtfpNSMsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551307; c=relaxed/simple;
	bh=DQx/0qkkYwoxlRzcowovwNez3yaiB1zj8atZuYAlvkE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zye8PVp2QsuzQrf2Tn1JegF6X4O7Xm2rZMSxBJzzkbmXfvJ4J2W9F+8MX965QivAc3aPMdDjqVSFEyg1+bA4jgsDxFGZGJInC+hTyU5urqFzwlQ35MjKvmVwD2cePXHIv8wiN5J1YmFXojkcz/O9DnzeKvaoSMvUcZPsIfljGQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+DlcF+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+DlcF+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D76C2BCB0;
	Tue, 12 May 2026 02:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778551307;
	bh=DQx/0qkkYwoxlRzcowovwNez3yaiB1zj8atZuYAlvkE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Z+DlcF+t2S4Kd/v0EIO9m2yPXSQIdvvdXw5O9zJ2YdPZB93R+w2dhiznFFfZedNnv
	 TuAqzzRNw12tbcQoTltZsMSD2lPIZuP3Zr0R9UqUvLBiMPiO6XB1viLIZlBMho5KED
	 gjdLTWc9fjt2HYp1HA78LEOWJMPEVOYSZxBAuMrAU73rJYhGbxQqoKvQ2r33D6J+HE
	 fzCXtfEy31JGLcmFWU2XhDCRm9LWPw95RW4N5RblPFFKxjGXFLEQOaRMBN2UBSuSmk
	 HJVKHTTjJqrJvCWdRoZN7UcoXomZ73eeVSGwvshHXQXxmc+a4mfO56dZKuvZRlGelA
	 VPIEG1dJTbrzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/8] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
Reply-To: sashiko@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-3-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-3-ae48c0b2b2cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:01:46 +0000
Message-Id: <20260512020146.E6D76C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Passing a NULL state pointer to pinctrl_select_state() causes a ke=
rnel panic.
- [High] Swallowing -EPROBE_DEFER from devm_pinctrl_get() permanently break=
s UHS-I voltage switching.
- [Medium] Masking failures from pinctrl_select_state() can lead to data co=
rruption or hardware damage.
- [Medium] Switching back to 3.3V executes the regulator switch before conf=
iguring the IO pads, risking overvoltage.
- [Low] The code uses "uhs" for the pinctrl state name instead of the stand=
ard "state_uhs" specified in the commit message.
- [Low] Unsupported signal voltages log a warning but falsely return succes=
s.
--

commit 54952d6d0a322262708a9ecada7a38d6245d7b6c
Author: Iker Pedrosa <ikerpedrosam@gmail.com>

mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support

This commit adds voltage switching infrastructure for UHS-I modes by integr=
ating
both the regulator framework for supply voltage control and pinctrl state
switching for pin drive strength optimization.

> - Add optional pinctrl state switching between "default" (3.3V) and
>   "state_uhs" (1.8V) configurations

This isn't a bug, but the commit message mentions "state_uhs" while the
code below looks for "uhs". Which one is expected by the device tree bindin=
gs?

> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k=
1.c
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c

[ ... ]

> @@ -219,6 +223,46 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct=
 mmc_host *mmc)
>  static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *m=
mc,
>  						      struct mmc_ios *ios)
>  {
>  	struct sdhci_host *host =3D mmc_priv(mmc);
>  	struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
>  	struct spacemit_sdhci_host *sdhst =3D sdhci_pltfm_priv(pltfm_host);
>  	struct pinctrl_state *state;
>  	int ret;
> =20
>  	ret =3D sdhci_start_signal_voltage_switch(mmc, ios);
>  	if (ret)
>  		return ret;

For transitions to 3.3V, sdhci_start_signal_voltage_switch() will increase
the vqmmc regulator voltage to 3.3V and wait 5ms for it to stabilize.

Because the pinctrl state is updated later in this function, the pads
will remain configured for 1.8V during this time.

Could this overvoltage stress the pads? Should the pinctrl state be
updated to "default" before raising the regulator voltage?

> =20
>  	if (!sdhst->pinctrl)
>  		return 0;
> =20
>  	/* Select appropriate pinctrl state based on signal voltage */
>  	switch (ios->signal_voltage) {
>  	case MMC_SIGNAL_VOLTAGE_330:
>  		state =3D sdhst->pinctrl_default;
>  		break;
>  	case MMC_SIGNAL_VOLTAGE_180:
>  		state =3D sdhst->pinctrl_uhs;
>  		break;
>  	default:
>  		dev_warn(mmc_dev(mmc), "unsupported voltage %d\n", ios->signal_voltage=
);
>  		return 0;

If the voltage is unsupported, should this return an error like -EINVAL
instead of 0? Returning 0 tells the mmc core the transition was successful.

>  	}
> =20
>  	ret =3D pinctrl_select_state(sdhst->pinctrl, state);

spacemit_sdhci_get_pins() treats the pinctrl states as optional and leaves
them as null if they aren't found in the device tree.

Does pinctrl_select_state() handle a null state pointer safely?

Looking at the pinctrl subsystem, it appears to unconditionally dereference
the state pointer. Should there be a check like if (!state) before calling
pinctrl_select_state() to avoid a panic?

>  	if (ret) {
>  		dev_warn(mmc_dev(mmc), "failed to select pinctrl state: %d\n", ret);
>  		return 0;
>  	}

If selecting the pinctrl state fails, returning 0 masks the failure and
tells the mmc core the pad configuration succeeded.

If the controller switches to 1.8V but the pads remain at 3.3V, could
this lead to data corruption or electrical damage? Should this return the
negative error code instead?

>  	dev_dbg(mmc_dev(mmc), "switched to %s pinctrl state\n",
>  		ios->signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
> =20
>  	return 0;
>  }

[ ... ]

> @@ -252,6 +296,30 @@ static inline int spacemit_sdhci_get_resets(struct d=
evice *dev)
>  static inline void spacemit_sdhci_get_pins(struct device *dev,
>  					   struct sdhci_pltfm_host *pltfm_host)
>  {
>  	struct spacemit_sdhci_host *sdhst =3D sdhci_pltfm_priv(pltfm_host);
> =20
>  	sdhst->pinctrl =3D devm_pinctrl_get(dev);
>  	if (IS_ERR(sdhst->pinctrl)) {
>  		sdhst->pinctrl =3D NULL;
>  		dev_dbg(dev, "pinctrl not available, voltage switching will work witho=
ut it\n");
>  		return;
>  	}

If the pin controller hasn't probed yet, devm_pinctrl_get() will return
-EPROBE_DEFER.

By swallowing this error and setting pinctrl to null, the host will
register without pinctrl support and UHS-I modes will permanently lack
correct pad configuration.

Should this propagate -EPROBE_DEFER back to spacemit_sdhci_probe() instead
of returning void?

> =20
>  	sdhst->pinctrl_default =3D pinctrl_lookup_state(sdhst->pinctrl, "defaul=
t");
>  	if (IS_ERR(sdhst->pinctrl_default))
>  		sdhst->pinctrl_default =3D NULL;
> =20
>  	sdhst->pinctrl_uhs =3D pinctrl_lookup_state(sdhst->pinctrl, "uhs");

Does looking for "uhs" correctly match the expected device tree bindings?
The commit message states "state_uhs", and standard mmc bindings typically
use "state_uhs" as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-orangepi-s=
d-card-uhs-v9-0-ae48c0b2b2cf@gmail.com?part=3D3
