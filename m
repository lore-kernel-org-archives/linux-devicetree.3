Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF615277818
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784525217; cv=none; b=j2eOwpNOvvl45dl/q2WVBb0m160++cIrjCUI1kDU9/GHrNrOdb5Z2OuYWKiNBX3iv4sy/WpeDp9EbZPMZalTgovDiVSrXQxaRC0Bsf50HazCopuGMa/eVrUMTfR3XC4HHKLGsrHz98+kO/t+ZygimXRl00ZvSvNY3Vw68ZIaqFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784525217; c=relaxed/simple;
	bh=vEAT5H3evwOAOOvK/I6Yg2BHM9EoLMYbLekKiK2KBb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kMPU0SFOiO2TqGMVqQgQ/2AGsdJXSh/gEuQaNLrOKPUKCp3LHR1Y6p1cLz8hFCu4W/OaVMyZuuCBeDjjRuy+vbx4LrtGy+HdNm30Fxzb9HT/XmAFszEjsz06Qt4PISEgM8zl5GvRRS0JSiAg/zUX7LfxKs/2HuWi1NwknAb1pZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPPpVV+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPPpVV+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649051F000E9;
	Mon, 20 Jul 2026 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784525216;
	bh=RV/IfSKgXYxyF/+Uy+8Sd3YDNYlbzxEOWQCgbxaKbKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oPPpVV+6CMzGaWGUOKhEULtGMAj1vNBqq94xe6xMmTi0q9nnzIkcIIgW6X42pcXdY
	 JT5V6QWE43XASJMvB40qtMlmcZyJlvtdaP9ZyIMM+twLO3/ko85qqFi+cpjRQl0hc5
	 K/JbmClmS7bELZ7rhsMCJ/5PzLcxxrjNdqI+KGIwkR7xhL2chEKzHUHuEMueeEK7IR
	 jhuU/7g0BObVnuMGcLwuddJs7dxMyrBrvt2NoFKybm1dJNQjWay9EHQ48whs8JUvCd
	 Mroky31oV5nKxjvpO80rK9RBikjZZeFNz1grSF9j2UbochwTlIOZenXtnl6aoUNad8
	 zb+4lBysAsNxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/4] reset: cix: add sky1 audss auxiliary reset
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720051505.1252774-4-joakim.zhang@cixtech.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
 <20260720051505.1252774-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 05:26:56 +0000
Message-Id: <20260720052656.649051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The reset driver accesses hardware registers via MMIO regmap witho=
ut ensuring the parent Clock and Reset Unit (CRU) is runtime-resumed, leadi=
ng to bus faults.
--

--- Patch [3]: [PATCH v10 3/4] reset: cix: add sky1 audss auxiliary reset d=
river ---
commit 7b77b8d6748a307fae0e5cb9afa8e1010bc6766c
Author: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: reset: cix: add sky1 audss auxiliary reset driver

This commit adds an auxiliary reset controller driver for the Cix Sky1 Audio
Subsystem CRU. It exposes 16 software reset lines using a regmap retrieved
from the parent device.

> diff --git a/drivers/reset/reset-sky1-audss.c b/drivers/reset/reset-sky1-=
audss.c
> new file mode 100644
> index 0000000000000..d31d80e1251a8
> --- /dev/null
> +++ b/drivers/reset/reset-sky1-audss.c

[ ... ]

> +static int sky1_audss_reset_set(struct reset_controller_dev *rcdev,
> +				unsigned long id, bool assert)
> +{
> +	struct sky1_audss_reset *priv =3D to_sky1_audss_reset(rcdev);
> +	const struct sky1_audss_reset_map *signal =3D &priv->map[id];
> +	unsigned int value =3D assert ? 0 : signal->mask;
> +
> +	return regmap_update_bits(priv->regmap, signal->offset, signal->mask, v=
alue);

[Severity: High]
Does this code need to ensure the parent Clock and Reset Unit (CRU) is
runtime-resumed before accessing the hardware registers?

If the parent clock controller driver drops its runtime PM reference (e.g.,
after its probe finishes), the CRU device might be suspended and its intern=
al
clocks disabled. Could accessing the regmap here without first waking up the
parent device (such as by using pm_runtime_get_sync()) result in a bus faul=
t?

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720051505.1252=
774-1-joakim.zhang@cixtech.com?part=3D3
