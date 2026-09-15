Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFC747F3BD
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469819; cv=none; b=Jhe7p05rb3wBMPBi+7jFwv42XFIttPRVNXLD5lfF3wsr42D4ipVh8HO0Yd2ebDk9K/kTbdQ0HueJy58Blbqsgk72ACBFUcezGTbnozKc8vwHPOh1DS3IoZwjqvQRN+e0KRTOFkQg5XpCtEeE7UUil9PZ0eIhlAOQdQoTBhIhCwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469819; c=relaxed/simple;
	bh=WVsLetL6Wz5gXje02kgD0/HOqB8QwHga5TFjNGvLzkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DjkDOIguipHdRMdsRqazfBnAKSlgCUlzdMwEMJXCwFp3cqkiZIl6jRrjQ03fjwxVCi0fS0w1SIaPJjWXu9KGRP1vvZtiM8wMnBvMrPbW2wr9yyNXPSFg19abYsuZ9sYIqJ2u4V6z9KFXZXtCWt/alOR/XCC/XZHIrFnReAHYv8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDprMq6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDprMq6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500F91F000FF;
	Tue, 15 Sep 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469817;
	bh=3HcGKiozyOdiTVee3su4+m0qru2V1W2ji42LIr1XCGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SDprMq6EGXZtA7K6VG7sYMRA5yn5TEbNQBSh9hjjmwhX/PV2hKfryfgPwuP/9wnCJ
	 NU6rBUITNg2nczTPPg/yE6/eCKVj8tbcKh9e7PYLY+j2iL2e4c07+DCBst+o3yzuZq
	 wad2POMaxvqYoPejxl3wXHBL4lCLD0TqKYpPDQXV6r9md3aVM8o5mrSqrdMv+F15e6
	 NGQ+Xsp/x2MwheQoOvf80V/JzWBZ2UEUzFZfXjclZJhC+1rZ1aJAAnYNnEqBPZvGR4
	 4VWzL9oLsHM3MCSmOG3cU3KItQL8ZGxlEdXZuHuIHf5PMX5L14CEV6hljZUGAKKeFk
	 TK9e3HU5WGnBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/14] pmdomain: rockchip: cycle optional
 power-domain resets on power-on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260915104328.45901-11-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com>
 <20260915104328.45901-11-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:56:56 +0000
Message-Id: <20260915105657.500F91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pmdomain: rockchip: UAF of reset control on probe error path
--

commit 7f227aa8bc180bf2cac448c39f64d020d6dc07cf
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain: rockchip: cycle optional power-domain resets on power-on

Some Rockchip domains come out of power-on with their bus interface in an
undefined state. On the RK3576 NPU this shows up as a hang on the first
register access after the domain is switched on, and pulsing the domain's
resets at this point clears it.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 39988efd86aaa..6cc8d6efda905 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -688,6 +690,21 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>  		if (ret < 0)
>  			goto out;
> =20
> +		/*
> +		 * Optional: some domains need their resets cycled once power
> +		 * is on. This goes BEFORE the settle delay, not after: a
> +		 * domain that asks for both is asking to settle before the
> +		 * QoS registers answer, and a reset deasserted after the
> +		 * delay would leave nothing between it and the QoS writes.
> +		 * On RK3576 the reset being cycled is the NPU core's bus
> +		 * interface, which is what those writes go through.
> +		 */
> +		if (pd->resets) {
> +			reset_control_assert(pd->resets);

[Severity: High]
Can a concurrent call to power the domain trigger a use-after-free here?

If rockchip_pm_domain_probe() fails, the error path calls
rockchip_pm_domain_cleanup(), which invokes rockchip_pm_remove_one_domain().
For domains with attached subdomains, pm_genpd_remove() returns -EBUSY and
the driver ignores this failure, proceeding to free resources.

If pd->resets is freed in rockchip_pm_remove_one_domain() but the domain
remains registered, could a concurrent request to power the domain (via ano=
ther
device probe or sysfs) invoke rockchip_pd_power(), evaluate the dangling
pd->resets pointer as true, and dereference it?

> +			usleep_range(10, 20);
> +			reset_control_deassert(pd->resets);
> +		}
> +
>  		/* Some domains need to settle before the QoS registers answer. */
>  		if (pd->info->delay_us)
>  			udelay(pd->info->delay_us);

[ ... ]

> @@ -949,6 +975,7 @@ static void rockchip_pm_remove_one_domain(struct rock=
chip_pm_domain *pd)
> =20
>  	clk_bulk_unprepare(pd->num_clks, pd->clks);
>  	clk_bulk_put(pd->num_clks, pd->clks);
> +	reset_control_put(pd->resets);

[Severity: High]
Should pd->resets be set to NULL here?

The reset control is freed here, but the pd->resets pointer is left danglin=
g.
This is unlike pd->num_clks below, which is safely cleared.

> =20
>  	/* protect the zeroing of pm->num_clks */
>  	mutex_lock(&pd->pmu->mutex);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915104328.4590=
1-1-gahing@gahingwoo.com?part=3D10
