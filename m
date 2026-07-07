Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15C32B10E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441260; cv=none; b=GsYyNYAV4OtnWplK17IgAwGJ4PWWUcgRv2rYX9Wv+MzcXBswS9b2mEIF8NMiFf0ksGisxs1WecAg2YEzMKWLixHDLQEACXAEkiaMrvhPmRZH47fsInoBhun6T65R66lwP2ftBqTsCFSU5M8YTVywrKcnzHOclHbWz0VuJA/fYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441260; c=relaxed/simple;
	bh=SL0JW20ykRa3g6RVse0nAGgMlaxI+JFQSMK1Gl3BeYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qZnwCjSN3gHQBz06D+uIT1Xh7vyoUMepT/gL7yovdXbdV+E4jIm+lFBA8FW190nRFlL8QRIbLhd2FPhgygG0379gr1sxYsHBSjXldIonSwM0jjjo2Z1FFwAudTG2lwCDBEuhlQOV3+BrnIGBTM+O/vhM+8HHxkTZl+erehV9XDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsdpYqMp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsdpYqMp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21991F00AC4;
	Tue,  7 Jul 2026 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441258;
	bh=stoOHu9RVD7nqxBeOWbVjRlTwmrU/WwMaSvlM1wcaQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DsdpYqMp+4+22GVJSpR39Jb+sqnpW8+h/mvkLdc8MZT0PrrKpiN2w3D81IObMTRWF
	 fcNVgBBJz/ph8avUcwI+j56Vu75nmUezhnRgEYwg+rmKSEN1S2iYSdMnn8n3z8qSQb
	 NANlMrIZfDPomvgYJ2etDiGOhA8RpisXypUhVRhNElUmb9Dme2XxChlJdvNehOBEbW
	 QW1WSp6SQxRQO5B3rYnv6wIkYl1YrTgUMzmwYDeE8hWxcQNbXSC8e426m40qPS/mGf
	 k28n6ZKiwCy/QCiSHKCdj3+gX8y6v3GhFnurjutqfm2sti1bUA8aKo4cOAgd9caQy6
	 4WB3XdcNLK0UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] pmdomain: mediatek: Add support for MT8196 HFRP
 DirectCTL domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260707155535.199383-5-angelogioacchino.delregno@collabora.com>
References: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
 <20260707155535.199383-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 16:20:58 +0000
Message-Id: <20260707162058.C21991F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Resource leak on error cleanup due to dummy `sta_mask` in simple=
 power sequence domains causing `scpsys_domain_is_on()` to incorrectly retu=
rn false.

Pre-existing issues:
- [High] Kernel panic during probe error cleanup due to unconditional deref=
erence of `pd->data` for `HW_VOTER` domains in `scpsys_domain_is_on()`.
--

--- Patch [4]: [PATCH v2 4/4] pmdomain: mediatek: Add support for MT8196 HF=
RP DirectCTL domains ---
commit 6f2aa6326ce2b3105bc55383da9b0e0d8b25e2d6
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains

Add support for the power domains provided by the HFRPSYS Power Controller =
of
the MT8196 SoC. Those control power to the eDP and DP Transmitter IPs.

> diff --git a/drivers/pmdomain/mediatek/mt8196-pm-domains.h b/drivers/pmdo=
main/mediatek/mt8196-pm-domains.h
> index 2e4b287206596..d704c9fa93374 100644
> --- a/drivers/pmdomain/mediatek/mt8196-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
> @@ -602,6 +602,27 @@ static const struct scpsys_hwv_domain_data hfrpsys_h=
wv_domain_data_mt8196[] =3D {
>  	},
>  };
> =20
> +static const struct scpsys_domain_data hfrpsys_domain_data_mt8196[] =3D {
> +	[MT8196_POWER_DOMAIN_EDPTX] =3D {
> +		.name =3D "edp-tx",
> +		.sta_mask =3D MT8196_PWR_ACK,

[Severity: Medium]
Can this lead to a resource leak during error cleanup?

The MT8196_POWER_DOMAIN_EDPTX and DPTX domains use simple power sequence,
bypassing standard PWR_ACK polling. To pass validation during initializatio=
n,
they are assigned MT8196_PWR_ACK as a sta_mask.

If this bit is a dummy and not automatically driven high by hardware for th=
ese
specific domains (since it is never polled during power_on),
scpsys_domain_is_on() will perpetually read 0 and return false.

If a failure triggers probe error cleanup, scpsys_remove_one_domain() would
skip scpsys_power_off() for these domains because it incorrectly believes t=
hey
are already off. Does this leave the domain permanently powered on in a
corrupted state and leak prepared clocks and regulators?

> +		.sta2nd_mask =3D MT8196_PWR_ACK_2ND,
> +		.ctl_offs =3D 0x74,
> +		.pwr_sta_offs =3D 0x74,
> +		.pwr_sta2nd_offs =3D 0x74,
> +		.caps =3D MTK_SCPD_SIMPLE_PWRSEQ,
> +	},

[ ... ]

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index feba436279c54..55e7478804236 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1258,6 +1258,10 @@ static const struct of_device_id scpsys_of_match[]=
 =3D {
>  		.compatible =3D "mediatek,mt8196-power-controller",
>  		.data =3D &mt8196_scpsys_data,
>  	},
> +	{
> +		.compatible =3D "mediatek,mt8196-hfrp-power-controller",
> +		.data =3D &mt8196_hfrpsys_data,
> +	},

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to a kernel
panic during probe error cleanup?

If a hardware voter domain is probed successfully, it is added to the probed
list. If a subsequently probed domain fails, scpsys_domain_cleanup()
initiates rollback, calling scpsys_remove_one_domain() on the hardware
voter domain.

scpsys_remove_one_domain() unconditionally calls scpsys_domain_is_on(), whi=
ch
attempts to read pd->data->sta_mask:

scpsys_remove_one_domain()
    scpsys_domain_is_on()
        u32 mask =3D pd->data->sta_mask;

For hardware voter domains, pd->data is explicitly set to NULL, which appea=
rs
to result in a guaranteed NULL pointer dereference. Could this bring the
system down during boot on unsupported or failing hardware configurations?

>  	{
>  		.compatible =3D "mediatek,mt8196-hwv-hfrp-power-controller",
>  		.data =3D &mt8196_hfrpsys_hwv_data,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707155535.1993=
83-1-angelogioacchino.delregno@collabora.com?part=3D4
