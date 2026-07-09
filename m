Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AAE3F39EB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587608; cv=none; b=te3fZniAM2bSjxg+LTQ68qT5CADhO266bBgfsTpf4uAXsPLri5GwpA+S+XIFPqEBOSwIX1bxEJ1OIkxkFXxA/L/CYnxy7sV7AOiouCwR6RsLJjaWwMcwhtch/k+lanXABeAL6tQDo6c1Jlltz/4sqe3xUlaABRzsKSAvYeRi+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587608; c=relaxed/simple;
	bh=mJRRyqB6b7q1ojhRyyN9V0wGTFI2Ukde7ogrkbTnNyY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y2f2aa/6dVviOVzaVnbwiItWtKaZenrVvC0/gLIPoaD9EekZuQNlL6t37coWssK97J1mI5jvevYI+8WpukH643okFfCagxrV9o0FytVVoNbZwji8y8OJhMBVABZveTTIBpwwNepxuML+gT6xgVFISA0LFVGkIhrSdr0Tetkq9gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8F5K0Ru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8F5K0Ru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D701F000E9;
	Thu,  9 Jul 2026 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587606;
	bh=XtgP9LJ8eoqudhqexXn1SDw0LfVBQI814poM/eLD32c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T8F5K0RuVTA4T7Ac8Q1gn3M7HfaItK4prGGVoXAD7P1ByozvKPAsd8HaKMQ9hF3zd
	 zoMJI/LdtuMuZ9Dcf9oAXxOANY5B4ZKFEaxyRS2synZoq7ejUW4KJ0X8KWh+1IAdYw
	 /32mcX1Yv6Hjs3AEVL9tWhEM6LxhLDQxNDDVQBd6IA6qo+0Y9MTxBLid6iDj3IL/Sh
	 vOJhSdz5CpD8RFK9CyrZ/9IzTGhlJ1/mdoH/eM/bjHsC/oy5oj/FFNoZJ4oJLbRdNI
	 fU0hHKqGKpVFr3sUqJaBuUVZjcCp0lMq/yBHACYqmtRdSz0vkLOtj0ccanGnC8XWXM
	 JxNebs3kvih2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] pmdomain: mediatek: Add support for MT8196 HFRP
 DirectCTL domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709084635.24912-6-angelogioacchino.delregno@collabora.com>
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
 <20260709084635.24912-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:00:05 +0000
Message-Id: <20260709090006.32D701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] Unconditional power-off of SIMPLE_PWRSEQ domains in error cleanu=
p, masking potentially incorrect status mask configurations.

Pre-existing issues:
- [Critical] Missing error handling for pm_genpd_init() causes kernel panic=
 via NULL pointer dereference during error cleanup.
- [Critical] Missing subdomain unlinking during probe error cleanup leaves =
freed genpd objects in the global gpd_list, causing Use-After-Free.
- [High] HW_VOTER domains invoke sleepable clock and regulator APIs while h=
olding a spinlock with IRQs disabled.
- [High] Missing GENPD_FLAG_NO_STAY_ON or sync_state callback causes regula=
tor-supplied domains to stay on indefinitely, leading to hardware malfuncti=
on on regulator cleanup.
- [High] Unbalanced resource cleanup on the error path for KEEP_DEFAULT_OFF=
 domains left on by the bootloader.
--

--- Patch [5]: [PATCH v3 5/5] pmdomain: mediatek: Add support for MT8196 HF=
RP DirectCTL domains ---
commit 5fec9c9afff1947a88f0033701c6c01f031caa0d
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains

Add support for the power domains provided by the HFRPSYS Power Controller =
of
the MT8196 SoC. Those control power to the eDP and DP Transmitter IPs.

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
> +		.sta2nd_mask =3D MT8196_PWR_ACK_2ND,
> +		.ctl_offs =3D 0x74,
> +		.pwr_sta_offs =3D 0x74,
> +		.pwr_sta2nd_offs =3D 0x74,
> +		.caps =3D MTK_SCPD_SIMPLE_PWRSEQ,
> +	},

[ ... ]

> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1071,7 +1071,7 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>  		if (scpsys_hwv_domain_is_enable_done(pd))
>  			scpsys_hwv_power_off_internal(pd);

[Severity: High]
This isn't a bug introduced by this patch, but do HW_VOTER domains invoke
sleepable clock and regulator APIs while holding a spinlock with IRQs
disabled?

Since HW_VOTER domains are registered with GENPD_FLAG_IRQ_SAFE, the genpd c=
ore
guarantees their power_on and power_off callbacks run with interrupts
disabled. However, scpsys_hwv_power_on() and scpsys_hwv_power_off()
unconditionally call clk_bulk_prepare_enable() and scpsys_regulator_enable(=
),
which take sleepable mutexes.

Can this result in a scheduling while atomic BUG or kernel panic?

>  	} else {
> -		if (scpsys_domain_is_on(pd))
> +		if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSE=
Q))
>  			scpsys_power_off_internal(pd);
>  	}

[Severity: Medium]
Will this unconditionally force power off for SIMPLE_PWRSEQ domains on the
error path?

If a SIMPLE_PWRSEQ domain is ever configured with MTK_SCPD_KEEP_DEFAULT_OFF
and probe fails, it appears the cleanup path unconditionally powers it off
regardless of whether it was active. Could this lead to disabling clocks th=
at
were never enabled, resulting in a clock underflow WARN_ON?

Is it possible this acts as a workaround that masks the fact that
scpsys_domain_is_on() fails to report the true state for these domains due
to their status mask configurations (like MT8196_PWR_ACK for edp-tx)?

[Severity: Critical]
This is a pre-existing issue, but does scpsys_add_one_domain() ignore the
return value of pm_genpd_init()?

If pm_genpd_init() fails, it seems genpd->gpd_list_node remains 0-initializ=
ed.
On a subsequent probe failure, the error cleanup loop calls pm_genpd_remove=
()
which executes list_del(&genpd->gpd_list_node).

Could this dereference a NULL pointer and cause a kernel panic since the no=
de
was never initialized?

[Severity: Critical]
This is a pre-existing issue, but does scpsys_domain_cleanup() iterate
backwards calling scpsys_remove_one_domain() without breaking parent-child
links first?

When this happens, pm_genpd_remove() returns -EBUSY and aborts without
unlinking the domain from gpd_list. Since the driver ignores this error, de=
vm
may free the still-linked genpd objects.

Could background processes like genpd_power_off_unused later iterate gpd_li=
st
and trigger a use-after-free when accessing the freed memory?

[Severity: High]
This is a pre-existing issue, but is there unbalanced resource cleanup on
the error path for KEEP_DEFAULT_OFF domains left on by the bootloader?

If such a domain is left physically ON, the driver warns but skips OS resou=
rce
preparation, leaving the enable_count at 0. If probe fails later, this path=
 in
scpsys_remove_one_domain() evaluates scpsys_domain_is_on() as true and calls
scpsys_power_off_internal().

Could this unconditionally disable resources the OS never enabled, triggeri=
ng
a clock/regulator underflow WARN_ON?

[ ... ]

> @@ -1288,6 +1288,10 @@ static const struct of_device_id scpsys_of_match[]=
 =3D {
>  		.compatible =3D "mediatek,mt8196-power-controller",
>  		.data =3D &mt8196_scpsys_data,
>  	},
> +	{
> +		.compatible =3D "mediatek,mt8196-hfrp-power-controller",
> +		.data =3D &mt8196_hfrpsys_data,
> +	},

[Severity: High]
This is a pre-existing issue, but is the platform driver missing the
.sync_state callback required to clear the stay_on flag for default-ON
domains?

Since the driver initializes default-on domains with is_off =3D false, the =
genpd
core sets genpd->stay_on =3D true. Without a .sync_state callback or
GENPD_FLAG_NO_STAY_ON, stay_on is never cleared, and the framework will ref=
use
to power off unused domains.

When regulator_late_cleanup() later forces unused regulators off, could this
silently cut physical power to domains the kernel still considers logically
active and cause a hardware malfunction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709084635.2491=
2-1-angelogioacchino.delregno@collabora.com?part=3D5
