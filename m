Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C6C2BE7A7
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124250; cv=none; b=Pij+MAkjwH0FJvDFaPQPzLSbwONP4e8Tw8Eh73IRvZ1pw1W9fq+FT6Vf6tIC3H04PPVKp2GSbBISSQRimAqfkeookDNfRjIiHPShyYYBDagI9qjwaMxD0a26eKmfz4Nhwi0x111NmuLtknO1PXtDNHgHnL/YY+RmOiK/h5WbTU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124250; c=relaxed/simple;
	bh=Y4EEFcujomb7GQyWhJW2QkMSvegzGGM9imZ8+0ye5X8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=meDyc7tnkVomOSTz32M3UmgcEXcPgGyGb6tZolM3RxlLkCcGerrmGonkJebIEfHlVgtKrSyCZipaHJd5Fx79rgQOKkbDDafzkwIGxO6W0tZT7YO17uwZi3sFEdsGEZ+01eYngrnla5jDef7brhNiJBhFptfOiZAoceA+k5b+A4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egR3e/Ni; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egR3e/Ni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEF61F000E9;
	Wed, 15 Jul 2026 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784124248;
	bh=PN7RcNLuRwt/7uRuJx/hWseYvt/sORhEBTT9EGxuGMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=egR3e/NiyBD8mj8qh0jKOgcnRk9T29T3+BTSAVK2M1bEuZMAtocXOl+Tf62Aewksk
	 zEvXTF9i2IGIFafo1qV2FFJ5lvIjll2sO3jG87NTDBndFs13NkL98l7cQEX6XdJPBd
	 G79IlbaMcx4pYwVuhY0xg7yMheiyQYx+oTn4NHCqio9bBpwKfTMCIojg+/dNa/UA+d
	 U2PML8xQJ6lKnBmfAqdy2CL/iTPegmot7oIEaUtW7C23t5GrSG67Y22nu6OENc3d6i
	 ePwNu0haaPC2Uqd7cJF4HY48nCS/YxX6dsK0WgAae6hjLPbN8fZKRlf4DkjCpsyCOH
	 /LIQznqroQafQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolai Burov" <nikolai.burov@jolla.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715-mt6858-pmdomain-v2-2-6293e87fc093@jolla.com>
References: <20260715-mt6858-pmdomain-v2-0-6293e87fc093@jolla.com>
 <20260715-mt6858-pmdomain-v2-2-6293e87fc093@jolla.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:04:07 +0000
Message-Id: <20260715140407.CDEF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] scpsys_power_off_internal breaks LIFO hardware sequencing by power=
ing off the modem MTCMOS domain before disabling subsystem clocks and resto=
ring external isolation.
- [High] The error path in scpsys_power_on erroneously calls scpsys_sram_di=
sable for secure modem domains, attempting to write to firmware-protected c=
ontrol registers.
--

--- Patch [2]: [PATCH v2 2/3] pmdomain: mediatek: Add support for secure mo=
dem power domain control ---
commit 9becf79ed55f0246ad67aeb4808362788efdf915
Author: Nikolai Burov <nikolai.burov@jolla.com>

pmdomain: mediatek: Add support for secure modem power domain control

On recent MediaTek SoCs such as MT6858, the kernel is required to use
a secure monitor call (SMC) to enable or disable the modem power domain.
This patch adds a flag to enable this new power sequence for SoCs that
need it.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index 8309a4b46afb0..ada9ea8b45b79 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
[ ... ]
> @@ -717,7 +751,8 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>  			goto err_pwr_ack;
>  	}
> =20
> -	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ) &&
> +	    !MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ)) {
>  		ret =3D scpsys_sram_enable(pd);
>  		if (ret < 0)
>  			goto err_disable_subsys_clks;

[Severity: High]
Since the MTK_SCPD_MODEM_SECURE_PWRSEQ flag is now used to skip
scpsys_sram_enable(), should the error path also be updated?

If a failure occurs later in scpsys_power_on(), the code jumps to the
err_disable_sram label:

err_disable_sram:
        if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
                scpsys_sram_disable(pd);

Could this attempt to invoke scpsys_sram_disable() for the secure domain?

The commit message notes that firmware prevents modifying the control
register directly. Writing to ctl_offs on the error path might trigger
a secure-world exception.

[ ... ]
> @@ -761,7 +796,11 @@ static int scpsys_power_off_internal(struct scpsys_d=
omain *pd)
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ)) {
> +		ret =3D scpsys_modem_sec_power_on(false);
> +		if (ret)
> +			return ret;
> +	} else if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
>  		ret =3D scpsys_sram_disable(pd);
>  		if (ret < 0)
>  			return ret;

[Severity: High]
Does placing scpsys_modem_sec_power_on(false) at the beginning of this
function break the hardware power-down sequence?

If the MTCMOS domain is powered off here, won't the subsequent call to
clk_bulk_disable_unprepare() attempt to access clock control registers
in an unpowered domain?

Typically, this causes an asynchronous external abort or bus fault. Should
this secure power-off command be placed at the end of the function,
parallel to scpsys_ctl_pwrseq_off(pd), to ensure clocks and external
isolation are disabled first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-mt6858-pmd=
omain-v2-0-6293e87fc093@jolla.com?part=3D2
