Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A0E32143D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543268; cv=none; b=A+xCAW02jYgxmuScv0B3VxERYgPmTW+d6HCotfLEg4bymjnmTtEQgf6bGfapKNVxVfNGoraJcIuO8aycFt4Kyb+CG0FKJhQ1C9+0RbHx5l4eY2l7CJVfEkbpDFq/Zfj6UWF7DK062HywCYdhnxH/XTWdpGM1EFQxbbdPSiRIJq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543268; c=relaxed/simple;
	bh=z/tE5cdNjpAJiZQvKwi8k6mQFsujDSaI53YWX7QfLfk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=flC0cYxe+BTJtOLyLcSX63W7Ha6zpuYpocuGj3HTB/SXQ+ROXP/P+p2vWTuusHf2s1q52vN1GxfaGpjt2ICdAgDtA6MOP7fo6Xgg6PjwNUMtY5xia4yEZf4kNcVVZrlqIXpSFCInDOeJQK3wlV6ThUyv+hto7Gj0ynVXy7qrhQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEUCE3rk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEUCE3rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917EBC2BCB0;
	Mon, 11 May 2026 23:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778543267;
	bh=z/tE5cdNjpAJiZQvKwi8k6mQFsujDSaI53YWX7QfLfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jEUCE3rkLeHVMQ6IBtOdWyXtlnJZJMc0pNjwQhAJCLE/Z+W4lmjIHwfvzhUyiITsg
	 9UfZgeWk9IqQCoayZg3Rey42BsIzqBkV3/A4FRzlMWGEf8lXE0KD7mcDCYM79DeKoV
	 GRABI6mtfAlPvpQc4fssoNm/klGAuErE0uwJor0RQxVyP65NHubS4QWJg+wve8n7Po
	 glfnqOldn+mwxuYbfADy/hRiP/mx1PfQXj77c78ZpwmFTsnLr6awADAw4GorN4DXA7
	 uTDq3uRWVq3ZBD9B1ETz7bIdqE8vGNSuztSEomyrFiH51mWU2YVAiiZ0GM82KwZjTL
	 1dmDKvhipcltA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/8] media: qcom: venus: add power domain enable
 logic for Venus cores
Reply-To: sashiko@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510-msm8939-venus-rfc-v6-6-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-6-e69465375900@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:47:47 +0000
Message-Id: <20260511234747.917EBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing NULL pointer check in the error path of core_power_v1() ca=
uses a kernel panic.
- [High] Unchecked dereference of core->pmdomains causes kernel panic when =
PM domains are disabled or not configured.
- [High] Hardware teardown order inversion risks bus hangs and synchronous =
external aborts.
- [High] Unmanaged PM domain attachment leads to permanent resource and mem=
ory leaks.
- [Medium] Devres allocations in vcodec_clks_get() are improperly tied to t=
he parent device, causing memory leaks on child unbind.
--

commit 82e8b597268e31404de211144b4b0ac33778da1d
Author: Erikas Bitovtas <xerikasxx@gmail.com>
Date:   Sun May 10 09:47:44 2026 +0000

    media: qcom: venus: add power domain enable logic for Venus cores
   =20
    Attach power domains for vdec and venc cores and power them up if a vdec
    or venc session is started.

> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/med=
ia/platform/qcom/venus/pm_helpers.c
> index f0269524ac70e..5ed7cbef8149c 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c

[ ... ]

> @@ -297,10 +297,31 @@ static int load_scale_v1(struct venus_inst *inst)
>  	return ret;
>  }
> =20
> +static int vcodec_domains_get_v1(struct venus_core *core)
> +{
> +	struct device *dev =3D core->dev;
> +	const struct venus_resources *res =3D core->res;
> +	const struct dev_pm_domain_attach_data vcodec_data =3D {
> +		.pd_names =3D res->vcodec_pmdomains,
> +		.num_pd_names =3D res->vcodec_pmdomains_num,
> +		.pd_flags =3D PD_FLAG_NO_DEV_LINK,
> +	};
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	return dev_pm_domain_attach_list(dev, &vcodec_data,
> +					 &core->pmdomains);

Does this leak the power domains if the driver unbinds or initialization fa=
ils?
There doesn't appear to be a corresponding dev_pm_domain_detach_list() call=
 in
the error path or in core_put_v1().

Perhaps we should either manually detach them during cleanup, or use the
managed devm_pm_domain_attach_list() API instead?

> +}

[ ... ]

> @@ -319,12 +340,128 @@ static void core_put_v1(struct venus_core *core)
>  static int core_power_v1(struct venus_core *core, int on)
>  {
>  	int ret =3D 0;
> +	struct device *pd_dev =3D core->res->vcodec_pmdomains ?
> +		core->pmdomains->pd_devs[0] : NULL;

If CONFIG_PM is disabled or no generic domains are found,
dev_pm_domain_attach_list() can safely return 0 without allocating
core->pmdomains.

Would this lead to a NULL pointer dereference here when trying to access
core->pmdomains->pd_devs[0]? Should we check if core->pmdomains is valid
before dereferencing it, rather than relying on res->vcodec_pmdomains?

> -	if (on =3D=3D POWER_ON)
> +	if (on =3D=3D POWER_ON) {
> +		if (pd_dev) {
> +			ret =3D pm_runtime_resume_and_get(pd_dev);
> +			if (ret)
> +				return ret;
> +		}
>  		ret =3D core_clks_enable(core);
> -	else
> +		if (ret) {
> +			pm_runtime_put_sync(pd_dev);

Could this cause a NULL pointer dereference in the error path if the platfo=
rm
does not define PM domains and pd_dev is NULL?=20

The successful resume path checks if (pd_dev) before calling
pm_runtime_resume_and_get(), but the error handling here unconditionally pa=
sses
pd_dev to pm_runtime_put_sync().

> +			return ret;
> +		}
> +	} else {
> +		if (pd_dev)
> +			pm_runtime_put_sync(pd_dev);
>  		core_clks_disable(core);
> +	}

In standard power management, teardown operations usually strictly reverse =
the
initialization order to avoid faults. Here, the POWER_OFF path disables the=
 PM
domain before disabling the core clocks, while the POWER_ON path enables the
PM domain before the clocks.

Could powering off the domain while its clocks are actively running lead to
unclocked register access faults or bus hangs?

> +
> +	return 0;
> +}
> +
> +static int vcodec_domains_enable(struct venus_core *core)
> +{
> +	const struct venus_resources *res =3D core->res;
> +	struct device *pd_dev;
> +	int i =3D 1, ret;
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev =3D core->pmdomains->pd_devs[i];

Similar to core_power_v1(), could this dereference a NULL core->pmdomains
if dev_pm_domain_attach_list() succeeded but returned 0?

> +		ret =3D pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +	}

[ ... ]

> +static int vdec_get_v1(struct device *dev)
> +{
> +	struct venus_core *core =3D dev_get_drvdata(dev);
> +
> +	return vcodec_clks_get(core, core->dev, core->vcodec0_clks,

Is it intended to pass the parent device (core->dev) instead of the child
vdec device (dev) here?

Looking at vcodec_clks_get(), it uses devm_clk_get() which ties the resource
allocations to the devres list of the provided device. If core->dev is used,
the allocations belong to the parent device.=20

If the child vdec device goes through unbind/rebind cycles, wouldn't this
cause clock references and devres memory to leak on the parent device?

> +			       core->res->vcodec0_clks);
> +}
> +
> +static int vdec_power_v1(struct device *dev, int on)
> +{
> +	struct venus_core *core =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (on =3D=3D POWER_ON) {
> +		ret =3D vcodec_domains_enable(core);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D vcodec_clks_enable(core, core->vcodec0_clks);
> +		if (ret)
> +			goto err;
> +	} else {
> +		vcodec_domains_disable(core);
> +		vcodec_clks_disable(core, core->vcodec0_clks);

Does this sequence have the same teardown order issue mentioned in
core_power_v1()? The domains are disabled before the clocks are shut down,
which might cause hardware lockups or aborts.

> +	}
> +
> +	return 0;
> +err:

[ ... ]

> +static int venc_get_v1(struct device *dev)
> +{
> +	struct venus_core *core =3D dev_get_drvdata(dev);
> +
> +	return vcodec_clks_get(core, core->dev, core->vcodec1_clks,

This shares the same question as vdec_get_v1(): should this use the child
device (dev) instead of the parent device (core->dev) to avoid devres leaks
during child unbinds?

> +			       core->res->vcodec1_clks);
> +}
> +
> +static int venc_power_v1(struct device *dev, int on)
> +{
> +	struct venus_core *core =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (on =3D=3D POWER_ON) {
> +		ret =3D vcodec_domains_enable(core);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D vcodec_clks_enable(core, core->vcodec1_clks);
> +		if (ret)
> +			goto err;
> +	} else {
> +		vcodec_domains_disable(core);
> +		vcodec_clks_disable(core, core->vcodec1_clks);

As with the other POWER_OFF paths, would disabling domains before clocks he=
re
cause hardware issues?

> +	}
> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-msm8939-ve=
nus-rfc-v6-0-e69465375900@gmail.com?part=3D6
