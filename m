Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759F393DDA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763364; cv=none; b=vBnqi+psWfQJdCeobQlko73rHFAQt98t9StLk8Hi0WEKf7et2AK5MQXQ+aK9pZkIfWhMOcw/Yzi9Vo/hwr+4EouCUrebp8fbknL7oKAA5/FImM8/ue/ZIMFldWBEBDNphB85T+NPuNbKjx3kJ6dl7K2KMCsdqVbZjSxAQaeHmzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763364; c=relaxed/simple;
	bh=qJQFsT5Cwe19hdfjFvFLx+FIMAPCKTspua+1xIG+ikQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i9TZH8BwP/95+FSS2LrnhrxkeAgCMf2nDEYnijl/9wfo09RoAXtjysaaiQzsIIkFAJSuoYN/tZMVH5LDxVJqXXAfjqVrjNc77v9yt3w46kyAQY9KvuZGE71rblPaafBm/11Yp/c/mg99GnXzpdoMVI9ntB7Dxv7d/iaNQxzKNcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXr50bhH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXr50bhH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B03C2BCB3;
	Thu, 14 May 2026 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763364;
	bh=qJQFsT5Cwe19hdfjFvFLx+FIMAPCKTspua+1xIG+ikQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JXr50bhH+4nZDcJ+NxUa9Z1B6caPRkQtvDxAk3zZHRADBiWdPI+j/WabxdAezqtE4
	 qOehhj4rUBjA6l/Ye1XaL1B6CmzlSXVQsJsN4+utwyKWg2LwhkKuvWXrlfkmpilOAM
	 BZY5rNWJduuQL5a+BFrS9AzGMhhRBXzwWD1Xpn+uAWYPWFyYQa4HKtrREyAwBFQpB3
	 BTgO1JaUAJXGElrEE5PpHaZbSRw+BHQFEFb7dKYy0G2yV6G9DCI2/4c6OJgzaqrSQF
	 Jd0buTdkcIFUK/xzSJhLGpM2Fjbj1l44izcyVkyJFebzpD/1OKYIuH3r8dXp8IifDy
	 aKvahwv1MWM+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/8] media: qcom: venus: add power domain enable
 logic for Venus cores
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514-msm8939-venus-rfc-v7-6-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-6-33c6c6fb9285@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:56:03 +0000
Message-Id: <20260514125604.30B03C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Clock initialization is incorrectly gated by the presence of power=
 domains, leading to unclocked hardware access.
- [Medium] Runtime PM reference leak in vcodec_domains_enable() error path.
--

commit 1bdd7b26dbc6049ee656dfce05ea05b682bb5990
Author: Erikas Bitovtas <xerikasxx@gmail.com>

media: qcom: venus: add power domain enable logic for Venus cores

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started. Vcodev clocks are added and enabled to the
core Venus device both for vcodec0 and vcodec1.

> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/med=
ia/platform/qcom/venus/pm_helpers.c
> index f0269524ac70e..be705d4d64b53 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c

[ ... ]

> @@ -309,9 +343,63 @@ static int core_get_v1(struct venus_core *core)
>  	if (ret)
>  		return ret;
> =20
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	ret =3D vcodec_clks_get(core, dev, core->vcodec_clks,
> +			      res->vcodec_clks);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }

Will skipping vcodec_clks_get() when power domains are not present leave
the vcodec clocks uninitialized?

If a platform defines vcodec_clks but does not require vcodec_pmdomains,
this early return skips the clock retrieval entirely.

When core_power_v1() later calls vcodec_clks_enable(), it will succeed
on the NULL pointers, but the physical hardware clocks will remain disabled.
Accessing Venus hardware registers without clocks enabled can trigger an
asynchronous external abort and a kernel panic.

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
> +		ret =3D pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +
> +		ret =3D dev_pm_genpd_set_hwmode(pd_dev, true);
> +		if (ret && ret !=3D -EOPNOTSUPP)
> +			goto err;
> +	}
> +
> +	return 0;
> +err:
> +	while (i--) {
> +		pd_dev =3D core->pmdomains->pd_devs[i];
> +		dev_pm_genpd_set_hwmode(pd_dev, false);
> +		pm_runtime_put_sync(pd_dev);
> +	}
> +	return ret;
> +}

Does this error path leak a runtime PM reference if dev_pm_genpd_set_hwmode=
()
fails?

If pm_runtime_resume_and_get() succeeds but the subsequent call to
dev_pm_genpd_set_hwmode() fails, the code jumps to the err label.

Since while (i--) pre-decrements the index, it skips the current iteration
index i and rolls back from i-1 down to 0.

This misses the pm_runtime_put_sync() call for the current power domain
where dev_pm_genpd_set_hwmode() failed, leaving its reference incremented
and preventing it from ever suspending.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-msm8939-ve=
nus-rfc-v7-0-33c6c6fb9285@gmail.com?part=3D6
