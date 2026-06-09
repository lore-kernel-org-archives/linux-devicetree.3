Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B7B383C64
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000840; cv=none; b=Z+bqlq4wecCnHCXIbe+Epf0Q2PDOUMEZeCgiIgbwGmY0MsWJ+zvXTKm0+mjmpq+UXjlR23iQwbd1OFrdTuxnhOhDrew/XnCbHkeHWpex/gnIshZ1wJkD1KT2nJIXXZf7hKtNxHOiVsmcxmIv8XKNu/8iGRZXCgZ4e472cC5Wo5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000840; c=relaxed/simple;
	bh=kiEwFaOWJMlAZ7IuhsPuouAYsUGjGSBIKThuhRuQeQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V1hZBtlDqjk/yy+7qfTsNW4Tmwj81sx2fGCzwKE43d7OPfuLlDcdS9lQzxQmYLF6rDOwNgHMEPoOhN33qSp/4cNsOL7/VWP3sKkE3Tl/cu28txN/FeBfA+nZmZgWEvLj8sw6GdfMgUbxY43ej+3W5hSLMZ3YFun4NkvK3VvpXkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBUoXr/I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBUoXr/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAC21F00893;
	Tue,  9 Jun 2026 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000839;
	bh=EHkotwFoAf6WdEvM7Qp1TmFtvbyFKU6OC2WHYAlkatc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BBUoXr/IdwusxDPpTALCLRhEx0OogrdU0la/Jmcv3yTCUzZ7JEWQA8esjI8RB/Szq
	 647v/kUK73GlctK9gXOhMjOER7Gb8zH7gISVtSO3PVIEAdKZkNdiId1q3U5gXCJBxe
	 CZA3wLH0AX7DwGLEEhPcQOc4IO+to/CEZCZ4+cHVz2Dprl4AaH9KRR+xQyyY5+fom0
	 cbMwKQNoStEe/n++ynM6Y2dhIgxdz7VKCEBUqTfWKveUxg3AH3b7E+7dFpRrDxbIKZ
	 DhhHuR4btYTDdggBa6yqb1dBKjj+hGvwsWdg0SCeJVhTTU9R3G8PGRYbT8NmyyjdoZ
	 OVS8uAC/XLCmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] pinctrl: qcom: Register functions before
 enabling pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609-mainline-send-v1-sending-v4-2-83768fbf404d@alex-min.fr>
References: <20260609-mainline-send-v1-sending-v4-2-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:27:18 +0000
Message-Id: <20260609102718.CCAC21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Global function pointer `pm_power_off` and `poweroff_pctrl` state =
are left pointing to freed memory if probe fails.
--

commit 4cee21ced39b9add5c750146fde36a08b79745d3
Author: Alexandre MINETTE <contact@alex-min.fr>

pinctrl: qcom: Register functions before enabling pinctrl
   =20
This patch changes the initialization sequence in the Qualcomm pinctrl
driver by registering the pinctrl device with devm_pinctrl_register_and_ini=
t,
adding the SoC pin functions, and only then enabling the device to prevent
invalid function map table lookups.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
[ ... ]
> @@ -1593,11 +1593,11 @@ int msm_pinctrl_probe(struct platform_device *pde=
v,
>  	pctrl->desc.pins =3D pctrl->soc->pins;
>  	pctrl->desc.npins =3D pctrl->soc->npins;
> =20
> -	pctrl->pctrl =3D devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
[ ... ]
> +	ret =3D devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
> +					     pctrl, &pctrl->pctrl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Couldn't register pinctrl driver\n");

[Severity: High]
This is a pre-existing issue, but since the failure paths are being
restructured here, what happens to the pm_power_off global pointer if this
registration (or the subsequent pinctrl_enable call) fails?

Earlier in msm_pinctrl_probe(), a call to msm_pinctrl_setup_pm_reset()
assigns the dynamically allocated pctrl to the global poweroff_pctrl pointer
and sets the global pm_power_off to msm_ps_hold_poweroff.

If probe fails here or later:

msm_pinctrl_probe()
    msm_pinctrl_setup_pm_reset(pctrl);=20
    ...
    ret =3D devm_pinctrl_register_and_init(...)
    if (ret)
        return dev_err_probe(...);

The pctrl structure is managed by devres and will be freed upon probe
failure, leaving the global poweroff_pctrl pointing to freed memory. If the
system subsequently initiates a shutdown, msm_ps_hold_poweroff() will
dereference the freed memory, leading to a use-after-free.

Would it make sense to update msm_pinctrl_setup_pm_reset() to use
devm_register_sys_off_handler() with SYS_OFF_MODE_POWER_OFF instead of
directly assigning the pm_power_off global pointer?

> =20
>  	for (i =3D 0; i < soc_data->nfunctions; i++) {
>  		func =3D &soc_data->functions[i];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-mainline-s=
end-v1-sending-v4-0-83768fbf404d@alex-min.fr?part=3D2
