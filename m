Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E705478E3D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037101; cv=none; b=VaRtXFU7Z9cMhJE6O3/YGbZG/RaWfIcztM2yVhlsKBsv7dyrZGqiLQ+OZhPI+YovTRNSLO5pJE9R6zEuf2LzA+7ZI7Ko0wpljRQdC5S7b4EiwMnDA2dDWREa/LzKvgO3FN1gh5sUeQK1KRDE1JkU3PpGXYeFpttQK+uUHS8z/7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037101; c=relaxed/simple;
	bh=ZKaYQQM7Q7za2Ut/3zuBxRXxAuLgmKZyhha4H1XSTMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xag09eaIYjyfIvxOv1CL/fcK5q4XdCT4H2uO5+3MvXg1M4jw7qGaerR0p4eJeuKxULrlbbCjLpzF+EXO5y8KmHe1YgEEk3tE17I8RNgCJpaIx3qWQsGeo/L8z17/46FSAC1E659CXTwcbu2erAbmn2YENMDlDpdvyoAhwma+e/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6+UBtzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6+UBtzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FB21F000E9;
	Tue, 14 Jul 2026 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784037099;
	bh=ywle4FhaSYuDJqYMKD9liPxZ5Qaxj9kaFlw9SmZeMpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O6+UBtzSSgPv4MD1R0Q9h/vkqAz2H01hu3ZyeWjXzkVzyrCdFY2bwwjwR6drUBT2Q
	 b3UH8smTthxQUWFj/Y3dH6geZCvnR+QfTZC8g8tkr/KT0OHQuTTbBf95a3NGDCXvtN
	 4t47/qSH7RXgZ4s68S/zJWIzrJqPRbWCJfxB1SJ8sXtDW6aXSdxY5zzZmlmng5OG2W
	 98aO/jh3COvCDSlOSa2NFz2k0pxSIGrZaN2IZUYuh90ZDKEWdxXZNKPGRn/M9oDDrJ
	 7bjRS1y/bE+eD9J5dN4AFcNdyIHmIRukebU5ydGVwq6pbHccz2Up7yaFjcSkPPqdlg
	 0pDtnWg+dYeRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolai Burov" <nikolai.burov@jolla.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714-mt6858-pmdomain-v1-2-4f09bbb822e0@jolla.com>
References: <20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com>
 <20260714-mt6858-pmdomain-v1-2-4f09bbb822e0@jolla.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:51:38 +0000
Message-Id: <20260714135139.59FB21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Secure modem power domain is powered off prematurely in the teardo=
wn sequence, violating hardware requirements and potentially causing bus ti=
meouts or lockups (SError).
--

--- Patch [2]: [PATCH 2/3] pmdomain: mediatek: Add support for secure modem=
 power domain control ---
commit 6dae8fe193509453ecfd352eacac6f51667e9e72
Author: Nikolai Burov <nikolai.burov@jolla.com>

pmdomain: mediatek: Add support for secure modem power domain control

This commit adds a flag to enable a secure monitor call (SMC) to turn
the modem power domain on or off on recent MediaTek SoCs. The sequence is
needed because firmware prevents direct modification of the power domain
control register.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c

[ ... ]

> @@ -709,6 +745,12 @@ static int scpsys_power_off(struct generic_pm_domain=
 *genpd)
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE)) {
> +		ret =3D scpsys_modem_sec_power_on(false);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_=
ISO))
>  		regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_offs,
>  				pd->data->ext_buck_iso_mask);

[Severity: High]
Does calling scpsys_modem_sec_power_on(false) here power off the domain
prematurely?

The secure modem domain is being shut down before isolating the bus and
disabling the subsystem clocks. Could this cause AXI bus lockups (SError)
and crash the system?

[ ... ]

> @@ -719,10 +761,12 @@ static int scpsys_power_off(struct generic_pm_domai=
n *genpd)
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> -		scpsys_modem_pwrseq_off(pd);
> -	else
> -		scpsys_ctl_pwrseq_off(pd);
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE)) {
> +		if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> +			scpsys_modem_pwrseq_off(pd);
> +		else
> +			scpsys_ctl_pwrseq_off(pd);
> +	}
> =20
>  	/* wait until PWR_ACK =3D 0 */

[Severity: High]
Should the scpsys_modem_sec_power_on(false) call be moved down here?

For non-secure domains, the actual power down happens here after the bus
protection and clock disable steps have executed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-mt6858-pmd=
omain-v1-0-4f09bbb822e0@jolla.com?part=3D2
