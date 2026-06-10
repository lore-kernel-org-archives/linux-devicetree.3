Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086281898FB
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074200; cv=none; b=R+aVxTo8VD/P+To5t9lfgNbVl84/RxLN0oDMmCuumzjUzTtsvVRNfBVmDv3FOlts/fmOsJcZpAdnHYR4Hrwa0UZi3AVU0IKYDXKOqJ/N30kj7Hy9y1KYcBmvcGwHxBudDE4Asxen6naCyoqI5VdVJM2g6+xv0FLu0L82sckRHvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074200; c=relaxed/simple;
	bh=qf0VeHa/6kGUPJGuU4Z40w26BlpU1+MTgwfr7rmCU14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BOnq+0ZnJhAhrvtI6gG4ckzNLpeC1VhrB9mEJCpx1zCjOK7zvi9eTO3Z/rEK6LCbb3M2yj7sn2otboVf6ZKPzsj3/WyVoqKveuaSFJgNcySBJjhdjotDoqiC1F8qJMczhXQTROxTmKqkyRqvnjtvvYYylwRDZuBLCYHjudAiIY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSBssM+w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSBssM+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E68B1F00893;
	Wed, 10 Jun 2026 06:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781074198;
	bh=/96t2E/vi0bKgljOOmUYC3x+n9TgBVyKM6HAmRfyLn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YSBssM+wseUpWY0zqyLQG74Ff8krIglt7rGl2+3gyzwYK9bsYna09x2brluB5kOJC
	 ZYRRfGkdFxR8NwfwQHsmny0v+r9rUuNTENWvSFc2uaHcnmUspoIRIB2DCWgQQsHexZ
	 jbLNs7LscibWQB3xtXHUyoExVcp5/ISp4q6hGt25ANPmGMkLxzGS31tHDj/49NV4wm
	 pFBHHg+DPKMCSBDocvVLAE10ytRr35z+D0UWsFQjpRxymIqQZJOhWr+/htBgJf4CgH
	 uBJwWCVhR8qE+kcA5ai64muPjjSrSHAh19GFhinmuCwBhSOY2Q3QLaGe4RMLSGUyFE
	 KEFlvmmgD36Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/12] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610-glymur-v8-6-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-6-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 06:49:58 +0000
Message-Id: <20260610064958.7E68B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Bundling global OPP voltage votes into per-block power helpers cau=
ses fatal undervolting on multi-block platforms.
--

commit 86dd0baf96fce305fc0cfdbc52efa9bd09e3d865
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Replace enum-indexed clock and power domain tables with per-bl=
ock structures

This commit replaces flat tables and enum-based lookups with per-block
iris_power_domain structures. Platform data now describes each hardware
block's clocks and power domains independently, and the enable/disable help=
ers
operate on these instances instead of looping through tables.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -70,74 +69,61 @@ int iris_opp_set_rate(struct device *dev, unsigned lo=
ng freq)
[ ... ]
> +int iris_enable_power_domain_and_clocks(struct iris_core *core, struct i=
ris_power_domain *pd)
>  {
> -	int ret;
> +	int ret, i;
> =20
>  	ret =3D iris_opp_set_rate(core->dev, ULONG_MAX);
>  	if (ret)
>  		return ret;
[ ... ]
> +	ret =3D clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
>  	if (ret)
> -		return ret;
> -
> -	pm_runtime_put_sync(pd_dev);
> +		goto error;
> =20
>  	return 0;
> -}
> =20
> -static struct clk *iris_get_clk_by_type(struct iris_core *core, enum pla=
tform_clk_type clk_type)
> -{
> -	const struct platform_clk_data *clk_tbl;
> -	u32 clk_cnt, i, j;
> -
> -	clk_tbl =3D core->iris_platform_data->clk_tbl;
> -	clk_cnt =3D core->iris_platform_data->clk_tbl_size;
> -
> -	for (i =3D 0; i < clk_cnt; i++) {
> -		if (clk_tbl[i].clk_type =3D=3D clk_type) {
> -			for (j =3D 0; core->clock_tbl && j < core->clk_count; j++) {
> -				if (!strcmp(core->clock_tbl[j].id, clk_tbl[i].clk_name))
> -					return core->clock_tbl[j].clk;
> -			}
> -		}
> -	}
> +error:
> +	iris_opp_set_rate(core->dev, 0);

[Severity: High]
Does dropping the global OPP vote to 0 here cause issues if a secondary blo=
ck
fails to enable? Since the OPP vote is tied to core->dev and shared across =
all
hardware blocks, it appears this could drop the voltage while a previously
enabled primary block is still running, potentially starving it before it c=
an
be cleanly disabled.

> =20
> -	return NULL;
> +	while (--i >=3D 0)
> +		pm_runtime_put_sync(pd->dev[i]);
> +
> +	return ret;
>  }
> =20
> -int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_=
type clk_type)
> +void iris_disable_power_domain_and_clocks(struct iris_core *core, struct=
 iris_power_domain *pd)
>  {
> -	struct clk *clock;
> +	int i;
> =20
> -	clock =3D iris_get_clk_by_type(core, clk_type);
> -	if (!clock)
> -		return -ENOENT;
> +	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
> +	iris_opp_set_rate(core->dev, 0);

[Severity: High]
Could dropping the global voltage vote to 0 here upon disabling a single bl=
ock
trigger immediate hardware lockups or SErrors? Other blocks might still be
active and running at high clock frequencies.

> =20
> -	return clk_prepare_enable(clock);
> +	for (i =3D 0; i < pd->pd_cnt; i++)
> +		pm_runtime_put_sync(pd->dev[i]);
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu4x.c
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -335,17 +240,13 @@ static void iris_vpu4x_power_off_hardware(struct ir=
is_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> =20
>  disable_clocks_and_power:
> -	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
> -
>  	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
> -					   [IRIS_VPP1_HW_POWER_DOMAIN]);
> +		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp1);

[Severity: High]
When disabling the first block (like vcodec_vpp1 here), the global OPP vote=
 is
dropped to 0 due to the new per-block teardown sequence. Does this result in
undervolting for subsequent blocks (like VPP0 and VCODEC) that haven't been
disabled yet? The old architecture appeared to disable all clocks globally
across all blocks before dropping the OPP vote.

> =20
>  	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
> -		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
> -					   [IRIS_VPP0_HW_POWER_DOMAIN]);
> +		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp0);
> =20
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_PO=
WER_DOMAIN]);
> +	iris_disable_power_domain_and_clocks(core, core->vcodec);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-glymur-v8-=
0-1c79b9d51fc0@oss.qualcomm.com?part=3D6
