Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797B33291F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440525; cv=none; b=bxfo6BVQ3qH7dScajVvt43sV4J/em/v519ULH6B8v30RNZXl2FawhuQqJwrOe53H8/MWEcphb7wuMAiSb/gL6s040cy1zq93KuF9Iv5b6udBoZ3wQsSsajaCh9k3sUnu4kehhutttzkitoglalBYGbhNyqo8xuPNLZXte3pnT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440525; c=relaxed/simple;
	bh=ws2+ohvrTmOigQi/iiBGcj7E4O9EyMxVtV0c/hJzzS4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7RSNobAgXMKqJ6UFE1waqvXbdnJaM1WQ/XOMM5uETyCLdxZfSYE/tv0whlJeUIqzEz+KFJiYqDhOlYimdYGg1cOAAYe8SwmphWPQ1VepxAHJGS7ZlRgmDiO4HO0LCaoxmqWmAkdHX8gT+YRYl1Xb6M6iveHashoB++gczE0X/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXrH+MGu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXrH+MGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCF81F000E9;
	Tue,  7 Jul 2026 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440524;
	bh=cOpEKPHlMJv4NamB+C4PklteS5eqqfez5OQkBmbYBsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AXrH+MGutokjDEFmsQMh9PeanDGRWP0dkDjJ6G07ADOjuCUW2bPpg/6tWyMmZDaKn
	 kZ9qSxMUPYKlZjWGfheg7zV7119RFJfClzXiPcEBqaektOv+/CJAkSorEZ+XKBHB2x
	 LH5QvdCNy2tBE3Ey1yLHOuLhuMoakWyg1w91rByK52l3e0JAj2v8lps9ouXLq82O6G
	 vNIhOWs3lBUcyC+rbjL5oaI7JPFnCMC8rS9P8BNWzK3c3G8O44+M9SXM2r2WZ0DQvm
	 3sJG2OWHg5EcI9nu+2Zryo3fkVCqUeT+8Ob1WLqnHNMA3iWbK+EBZrjirtfsVm6jU6
	 EL41nDXaaJ0Mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] pmdomain: mediatek: Add support for Direct CTL
 simple power sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260707155535.199383-4-angelogioacchino.delregno@collabora.com>
References: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
 <20260707155535.199383-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 16:08:43 +0000
Message-Id: <20260707160843.EBCF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Ignoring the return value of `clk_bulk_prepare_enable` in the error=
 recovery path of `scpsys_power_off` violates its `__must_check` attribute.

Pre-existing issues:
- [High] If `scpsys_bus_protect_enable()` fails in `scpsys_power_off()`, it=
 returns early without re-enabling `subsys_clks`, bypassing the newly added=
 clock recovery block and breaking the clock refcount.
- [High] Error paths in `scpsys_power_off()` leave the hardware in a corrup=
ted state (SRAM disabled, bus protection active, and buck isolated) because=
 they fail to revert these states before returning an error.
- [High] Error paths in `scpsys_power_on()` disable clocks and regulators w=
ithout reverting the power-on hardware sequence, leaving the domain hardwar=
e partially ON while genpd considers it OFF.
--

--- Patch [3]: [PATCH v2 3/4] pmdomain: mediatek: Add support for Direct CT=
L simple power sequence ---
commit a25fe6d3db6b42f564ecc5977f0a00e29a0cfd96
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

pmdomain: mediatek: Add support for Direct CTL simple power sequence

This commit adds a simplified power sequence for certain new MediaTek SoCs=
=20
(like MT8196 and MT6991). The new sequence avoids using RTFF hardware and=20
certain control bits, handling power domain enablement automatically after=
=20
exiting reset.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index db543d4b1813c..feba436279c54 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
[ ... ]
> @@ -682,7 +733,8 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>  err_enable_bus_protect:
>  	scpsys_bus_protect_enable(pd, 0);
>  err_disable_sram:
> -	scpsys_sram_disable(pd);
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +		scpsys_sram_disable(pd);
>  err_disable_subsys_clks:
>  	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
>  		clk_bulk_disable_unprepare(pd->num_subsys_clks,

[Severity: High]
This is a pre-existing issue, but if a step fails during scpsys_power_on()
after the initial MTCMOS power-on sequence, the function jumps to these=20
error labels. It disables the clocks and regulators, but does this leave=20
the domain's MTCMOS physically ON since it doesn't call a corresponding=20
power-off sequence to revert it? Could this hardware inconsistency cause=20
issues while the framework considers the domain OFF?

> @@ -698,16 +750,17 @@ static int scpsys_power_off(struct generic_pm_domai=
n *genpd)
>  {
>  	struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_domain, =
genpd);
>  	struct scpsys *scpsys =3D pd->scpsys;
> -	bool tmp;
>  	int ret;
> =20
>  	ret =3D scpsys_bus_protect_enable(pd, 0);
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D scpsys_sram_disable(pd);
> -	if (ret < 0)
> -		return ret;
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
> +		ret =3D scpsys_sram_disable(pd);
> +		if (ret < 0)
> +			return ret;
> +	}

[Severity: High]
This is a pre-existing issue, but if scpsys_sram_disable() or=20
scpsys_bus_protect_enable() fail here and return early, the framework will=
=20
still treat the domain as ON. Does this early return leave the hardware=20
physically isolated, potentially causing active consumer devices to hit an=
=20
active bus protector or unpowered SRAM?

[ ... ]
> @@ -720,15 +773,17 @@ static int scpsys_power_off(struct generic_pm_domai=
n *genpd)
>  		return ret;
> =20
>  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> -		scpsys_modem_pwrseq_off(pd);
> +		ret =3D scpsys_modem_pwrseq_off(pd);
> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +		ret =3D scpsys_simple_pwrseq_off(pd);
>  	else
> -		scpsys_ctl_pwrseq_off(pd);
> +		ret =3D scpsys_ctl_pwrseq_off(pd);
> =20
> -	/* wait until PWR_ACK =3D 0 */
> -	ret =3D readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL=
_DELAY_US,
> -				 MTK_POLL_TIMEOUT);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		/* Re-enable clocks so that next power off doesn't break the refcount =
*/
> +		clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);

[Severity: High]
This is a pre-existing issue, but if scpsys_bus_protect_enable() fails=20
earlier in scpsys_power_off() when called with BUS_PROT_IGNORE_SUBCLK, it=20
returns early. Does that early return completely bypass this newly added=20
clock recovery block, leaving the subsystem clocks disabled while the=20
domain is logically considered ON?

[Severity: Low]
Does this error recovery block ignore the return value of=20
clk_bulk_prepare_enable()? Since the function is declared with=20
__must_check in the clk API, could this cause a -Wunused-result compiler=20
warning and break builds using -Werror?

>  		return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707155535.1993=
83-1-angelogioacchino.delregno@collabora.com?part=3D3
