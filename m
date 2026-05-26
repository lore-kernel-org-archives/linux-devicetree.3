Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9633988E3
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807029; cv=none; b=i/n6RLjWGZ4OFXSUXe3jY/QSQjBx8dwz7OsLoT0TjqDHPh/vV00yqbiWkY8k/J5+PriNjSyJKlit0M5FksA36eQyUcDpnYltMGy4TcsWqysn2d/w73BJuML06Ha8nC66wqaglxwgHpw30udT0oYu4pkeeBBkcGKggx116HmKI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807029; c=relaxed/simple;
	bh=PHQFwrb1eSX4qnhXMKYkrydy5G35YpeYqUChHi88bMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sc1E4o4xa+5DAO9MWbAw2oDc1FrRvFjUyWU54/GMu1W4tROw7L9cSdjJCyH+KOgVbM2G78+AVhjgHmRZBJCU0B0b/CpGfrqt0wqeBpT9LNTnwqbGDn0/lswHTloR/VQtnALBIZuHOQ+utbAdfbhHeLV68ISPL6nKf67p1GewfkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLVmC7Oi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLVmC7Oi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03001F000E9;
	Tue, 26 May 2026 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807028;
	bh=6fcz21LfB54xwUPloJjUUrB0ctevbM/mZ9snRAVTBSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VLVmC7OiDOaw/yj+HMyeHfLXZ39MOfHjaSraQ/Ij5o+dnQQ1lUe1gIqwgO86fc7ux
	 8GF6f5UZa/ROWsfidUttNeaNXH0yV8CWhHEiKrjoY/FlpM0b6vaVWi0YKkxqk1P9SQ
	 47gyFWR1mHjwtpffnUhanhnhyebI4wm2kNa0KLXIleXDGdgphzjTchKU/G1aiTjrII
	 /Qs5FoBkApsFKe8X2zsLFqIFsIzeYGggCiuj11s888vzFEhTJfiXNEJwPXwXDI/RW9
	 u8/lOYW5A2FukR8J933GO51jHzL+jt+PrDxQZ9lwmt1acFmRwdga+hTh+1ZxUkVtf2
	 QWBBAkleknRDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/8] media: qcom: venus: add power domain enable
 logic for Venus cores
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-msm8939-venus-rfc-v9-3-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-3-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 14:50:27 +0000
Message-Id: <20260526145027.E03001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] NULL Pointer Dereference on `core->pmdomains`
- [Medium] Teardown Rollback Anti-pattern
- [Medium] Hardware Initialization Flaw for `vcodec_clks`

Pre-existing issues:
- [High] Ignored Error Code in `venc_power_v4()`
--

commit ee1d99aefaee1c4f53ba3c0a0d86c1b9d54963ce
Author: Erikas Bitovtas <xerikasxx@gmail.com>

media: qcom: venus: add power domain enable logic for Venus cores

This commit adds power domain attachment and enable logic for Venus
vdec and venc cores. It introduces an array of vcodec clocks that
are retrieved from the device tree and enabled during decode and
encode sessions.

> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/med=
ia/platform/qcom/venus/pm_helpers.c
> index 14a4e8311a643..be1cbd5cfe842 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c

[ ... ]

> @@ -309,7 +343,77 @@ static int core_get_v1(struct venus_core *core)
>  	if (ret)
>  		return ret;
> =20
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	ret =3D vcodec_clks_get(core, dev, core->vcodec_clks,
> +			      res->vcodec_clks);

[Severity: Medium]
Is it intentional to skip getting vcodec_clks if vcodec_pmdomains is
not defined?

Clocks and power domains are physically independent hardware resources.
Tying the initialization of vcodec_clks strictly to the presence of
vcodec_pmdomains means that if a platform defines vcodec_clks but lacks
vcodec_pmdomains, the clocks will be silently ignored, which could lead
to a failure to power up the hardware properly.

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int vcodec_domains_enable(struct venus_core *core)
> +{
> +	const struct venus_resources *res =3D core->res;
> +	struct device *pd_dev;
> +	int i =3D 0, ret;
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev =3D core->pmdomains->pd_devs[i];

[Severity: High]
If CONFIG_PM or CONFIG_PM_GENERIC_DOMAINS is disabled (which is possible
under COMPILE_TEST), the devm_pm_domain_attach_list() stub returns 0 but
does not allocate the list pointer, leaving core->pmdomains as NULL.

Since res->vcodec_pmdomains is populated from static device matching data,
could this loop execute and trigger a NULL pointer dereference on
core->pmdomains?

> +		ret =3D pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +	}
> +
>  	return 0;

[ ... ]

> +static int vcodec_domains_set_hw(struct venus_core *core, bool is_hw)
> +{
> +	const struct venus_resources *res =3D core->res;
> +	struct device *pd_dev;
> +	int i =3D 0, ret;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev =3D core->pmdomains->pd_devs[i];
> +		ret =3D dev_pm_genpd_set_hwmode(pd_dev, is_hw);
> +		if (ret && ret !=3D -EOPNOTSUPP)
> +			goto err;
> +	}
> +
> +	return 0;
> +err:
> +	while (i--) {
> +		pd_dev =3D core->pmdomains->pd_devs[i];
> +		dev_pm_genpd_set_hwmode(pd_dev, !is_hw);

[Severity: Medium]
If setting hardware mode fails while disabling it (is_hw =3D=3D false), the
error handler loops backward and re-enables hardware mode (!is_hw) for
previously disabled power domains.

In core_power_v1()'s teardown path, the returned error is ignored, and
the driver proceeds to manually disable power domains via
vcodec_domains_disable().

Does this rollback leave the domains in hardware control mode, potentially
preventing the genpd framework from properly powering them off during
pm_runtime_put_sync() and resulting in an inconsistent power state?

> +	}
> +	return ret;
>  }

[ ... ]

> @@ -875,7 +1011,7 @@ static int venc_power_v4(struct device *dev, int on)
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but in venc_power_v4(), if
on =3D=3D POWER_ON, the driver calls vcodec_clks_enable() and stores its
return value in ret:

	if (on =3D=3D POWER_ON)
		ret =3D vcodec_clks_enable(core, core->vcodec1_clks);
	else
		vcodec_clks_disable(core, core->vcodec1_clks);

	ret =3D vcodec_control_v4(core, VIDC_CORE_ID_2, false);

Could the unconditional call to vcodec_control_v4() overwrite the error
code from vcodec_clks_enable()? If the clocks fail to enable, the driver
proceeds to access hardware registers without propagating the error, which
could cause a bus hang and system panic on ARM platforms.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-msm8939-ve=
nus-rfc-v9-0-bb1069f3fe02@gmail.com?part=3D3
