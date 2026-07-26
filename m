Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA261F942
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045985; cv=none; b=e7tgSM4iBg+mJr4gAHKqryvFVAKTYHcnBlR8+oTwjWg/6Qfo1iNemxIAir94UacINbXqnZl0mHaN4rLLLRUINm9WBH6LTweAc8KykvS9pNHGKBNkxeR+9YcALhS5qaGpVl9WQPKkuw2H8Qh7MQYmzzVT7vwdgLHvHOsdksJz0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045985; c=relaxed/simple;
	bh=edp5fSGR/yT8HdT71RB/q+xaUEI/7vpu6v7SRFqFwFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c5lPmQO5NlFyRPAjEqrwfzqjAkMJ4cqT1pSO3dnGaNvvpxQsmFNPe4OWOdTPUOnyvHeXVrb9Oe7dhaDFZtWuW+IbBJUaX4jU3BWQkBKCDNTqrZhO0B2xEeNGpSxhysuGVwTWxGpmPskYx0U5UD0EVhXim+2llk/xzMBgeMq+N3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oykqYRcw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oykqYRcw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5805C1F000E9;
	Sun, 26 Jul 2026 06:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045983;
	bh=6HzldNd7UyPIuo0hICH8tA3Axj2wcB7EZRP26bGrFos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oykqYRcwzVWrjm7FZAJkgCCW4XFfYK5VQXFV3+8jtBAP4ky7lYdyX4rSY9sL1OrCf
	 X+c/Nf6qIlVWhaZeIxcXnVheKu6dib+bCKmS0Oh/xeME30MKdUIwyQTD62VVtp+LrM
	 KvkYYbigy8cYPFqM7rxlWIJ3UU5dcwZzMF7xcwFakHmyTzxrN+fl0a7UxcIscOFrw9
	 +rqKIigqs4Tz32TXR6XgZ7AhpvqRaprR73hNtKSuZbf9a39uGuB5P+ZFDqzaspUwKC
	 c0EHYKPz4mrrSmMmnsAGgZNZzlrlQTwVxFdgzOvfbFAIOeIBDsdauYLQo8RY2GWebA
	 qeYLBD2D8D6OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 07/14] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260726-glymur-v10-7-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-7-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:06:22 +0000
Message-Id: <20260726060623.5805C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked dereference of optional `iris_power_domain` pointers (`p=
d`) in resource helpers (`iris_enable_power_domain_and_clocks`, etc.) leads=
 to kernel oops.
--

--- Patch [7]: [PATCH v10 07/14] media: iris: Replace enum-indexed clock an=
d power domain tables with per-block structures ---
commit a990e7238dd52b7ecf138859cc143e38431554ef
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Replace enum-indexed clock and power domain tables with per-bl=
ock structures

This commit replaces the flat tables and enum-based lookups for clocks
and power domains with per-hardware-block structures. It introduces the
iris_power_domain structure to bundle devices and clocks without runtime
index lookups.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu4x.c
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c

[ ... ]

>  static int iris_vpu4x_power_on_hardware(struct iris_core *core)
>  {
>  	u32 efuse_value =3D readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>  	int ret;
> =20
> -	ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRI=
S_HW_POWER_DOMAIN]);
> +	ret =3D iris_enable_power_domain_and_clocks(core, core->vcodec);
>  	if (ret)
>  		return ret;
> =20
>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
> -		ret =3D iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
> -						[IRIS_VPP0_HW_POWER_DOMAIN]);
> +		ret =3D iris_enable_power_domain_and_clocks(core, core->vcodec_vpp0);

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer=20
dereference if the platform data doesn't provide configuration for this=20
block?

If the hardware efuse indicates VPP0 is present, but the software=20
platform data omitted the VPP0 configuration, core->vcodec_vpp0 will be=20
NULL. It is then passed to iris_enable_power_domain_and_clocks(), which=20
dereferences it immediately:

iris_enable_power_domain_and_clocks(core, pd)
    for (i =3D 0; i < pd->pd_cnt; i++) {
        ...
    }

The same pattern appears in iris_disable_power_domain_and_clocks() and=20
iris_genpd_set_hwmode() for the core->vcodec_vpp1 and core->apv pointers.=20
Should there be a NULL check for these pointers in the resource helpers,=20
or should the efuse check be combined with a software configuration check?

>  		if (ret)
>  			goto disable_hw_power_domain;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D7
