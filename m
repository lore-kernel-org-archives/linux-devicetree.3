Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD3A449B1D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581108; cv=none; b=AOHVKn91BuR7OK0IUtsaGqfkweWihrfS8iiilXSuAzCrcQqDLIk/FWlasqPDcCqzJ4vtw0UYP4Eq/aM7qmvreRIeF0uSlGVLwwjlorKuj+7qJOMqRcB2HUOA9WLff4Ty7arpXoa+YWOa8pApvTXeANWkmLrw3LgG2w3v8ZwQDIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581108; c=relaxed/simple;
	bh=T7Su+MtlKEtw6bcjM9D0KHJkrWXBhRauX8Ph3xPa8x4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tiy8E4+OmiqEmcg/3QeRXXZmsnvOrf5IWZ8q7sUw6GczRoDF4RDyjrrqP/AyIJGzGySnsRqEUD/nMLRtM0cr7IIlWNJNpSgPM2gzx1QxNmDze8G4C5Wh69UAteHes1jrEFPnci1H+ufcwrfX0aAm933NCZPh7+042jimCypFNW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQDsQla4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQDsQla4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1064A1F000E9;
	Mon, 20 Jul 2026 20:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784581107;
	bh=TRIB2nvwYPSpbajkkfYKDKhXO/Ljs7neQ/nDta26roo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BQDsQla4lzhKn0fI0Oe0441VMKXFTIaiG3yKUKL0ryVeV7SraOZeU9gmtW6u49RuE
	 VScFqNPyAIMhjQfRn7hKMXQftA6aoveeLr6hazkeodBRJNM2YlrbTw8uqanb+jY0v8
	 VJpf6YXW4u4RJJ0/o3DLuFWh1IXWhmyeEZTayJi+sJo3MIl/XZIpJp/uscUc+04aid
	 lfaAW7p5tCDO49wDOhKogDTYhsTYACCTdT7hcJ0LL1R7XD+p/4hycojQxYjyNqi6gn
	 K2FMkKv4rEgHzbFilXXg7kvkPeFqaWyCk3MKN5Rxw/RUNKLHSxOka1mMes8VtS3m84
	 42v4ZVVO6+FXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolai Burov" <nikolai.burov@jolla.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-mt6858-pmdomain-v3-2-8966d8de93c8@jolla.com>
References: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
 <20260720-mt6858-pmdomain-v3-2-8966d8de93c8@jolla.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:58:26 +0000
Message-Id: <20260720205827.1064A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Hardware sequence inversion for secure modem teardown
- [Medium] Unwarranted 1-second busy sleep loop on SMC hard errors

Pre-existing issues:
- [High] Missing power-off rollback in hardware bring-up error paths
- [High] Bus protection resource leak on early power-off failure
--

--- Patch [2]: [PATCH v3 2/3] pmdomain: mediatek: Add support for secure mo=
dem power domain control ---
commit a98929d49f9662dbe82719e18f3bfc5621c41558
Author: Nikolai Burov <nikolai.burov@jolla.com>

pmdomain: mediatek: Add support for secure modem power domain control

On recent MediaTek SoCs such as MT6858, the kernel is required to use
a secure monitor call (SMC) to enable or disable the modem power domain.
This patch adds a flag to enable this new power sequence.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index 8309a4b46afb0..5b4d860318a46 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
[ ... ]
> @@ -668,6 +672,34 @@ static int scpsys_modem_pwrseq_off(struct scpsys_dom=
ain *pd)
>  	return 0;
>  }
> =20
> +static bool scpsys_modem_sec_poll(unsigned long cmd)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 1, 0, 0, 0, 0, 0, &res);
> +
> +	return res.a0 =3D=3D 0;
> +}
> +
> +static int scpsys_modem_sec_power_on(bool on)
> +{
> +	struct arm_smccc_res res;
> +	unsigned long cmd =3D on ? MTK_MD_MTCMOS_ENABLE : MTK_MD_MTCMOS_DISABLE;
> +	bool tmp;
> +	int ret;
> +
> +	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0 =3D=3D 0)
> +		return 0;
> +
> +	ret =3D readx_poll_timeout(scpsys_modem_sec_poll, cmd, tmp, tmp,
> +				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);

[Severity: Medium]
Does this code assume any non-zero res.a0 indicates an 'in-progress'
operation? If the SMC call returns a negative error code (like
SMCCC_RET_NOT_SUPPORTED), will it dive into a 1-second busy sleep loop inst=
ead
of failing immediately?

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
[ ... ]
> @@ -739,7 +774,8 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>  err_enable_bus_protect:
>  	scpsys_bus_protect_enable(pd, 0);
>  err_disable_sram:
> -	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ) &&
> +	    !MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ))
>  		scpsys_sram_disable(pd);
>  err_disable_subsys_clks:

[Severity: High]
This isn't a bug introduced by this patch, but does this error path block s=
kip
reverting the MTCMOS/SMC power-on state before disabling the regulator?

If a step fails after powering on the MTCMOS domain (for example,
clk_bulk_prepare_enable()), the error paths drop the subsystem clocks and
regulator but fail to explicitly invoke the power-off rollback. Could this
leave the SMC firmware tracking a powered-on domain while physical power is
cut, potentially deadlocking firmware?

>  	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
> @@ -761,7 +797,11 @@ static int scpsys_power_off_internal(struct scpsys_d=
omain *pd)
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ)) {
> +		ret =3D scpsys_modem_sec_power_on(false);

[Severity: High]
In scpsys_power_on(), the sequence un-isolates the buck, powers on the doma=
in
via SMC, and then enables subsystem clocks. To maintain LIFO symmetry,
shouldn't the teardown sequence disable the clocks and isolate the buck bef=
ore
cutting MTCMOS power?

Since the SMC power-off call is placed at the very beginning of the function
here, could this cut power while clocks are still actively toggling, causing
hardware bus hangs?

> +		if (ret)
> +			return ret;

[Severity: High]
This is a pre-existing issue, but does returning an error here leave the bus
protection enabled indefinitely?

If the SMC power-off fails and returns early, the genpd framework treats a
failed power-off as the domain remaining active, but the bus is now
permanently blocked. Does this error path need to revert bus protection to
avoid a system hang when accessing devices within the domain?

> +	} else if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
>  		ret =3D scpsys_sram_disable(pd);
>  		if (ret < 0)
>  			return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt6858-pmd=
omain-v3-0-8966d8de93c8@jolla.com?part=3D2
