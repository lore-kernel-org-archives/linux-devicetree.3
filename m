Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1870337BB0
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279087; cv=none; b=MiVmdt9a9pRaaobauxkEbR8VYq6VskO0ydfKNhDiK5dY/iXiIFr5yG/NeqNnne+fwUOhU9XI/yum+6/Hjxhrhx0rJ9+/OFOPf+z05xHLtTTSvme4R++Zv7mCPMxozJq/QEWGKOsW+DXzZGtz7XIMf1N7czdfUXF7BSVO+NigT7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279087; c=relaxed/simple;
	bh=a6O32Pi8wDPAzIMRc1mdTxBIzmhCqDUghaYJ3mWfcGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BjA8RN1Lth/p32EW/pmIIK+1KmKjA0jWqYtqlM6tdKIg09iGXOijkT6qanzhyVV/yk1mZ2MJQv7WCgZQYCeVHMq7KCUGYVKG1mEmSkZ+w+I4sJyVX1aNfRMZR8WJldfmmMCJgxdVZ3KCnUYpfQAYDhtjY3/t1nW6xwCj9xlrngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0EMs7l4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0EMs7l4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F621F000E9;
	Fri, 17 Jul 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279085;
	bh=RwOsoX/vjL4MrYp4Va7jdFnjD9fJtLjCAm5EOC09U5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C0EMs7l4JL/fcYMj3ypZD+9VL201Qkk1OZr7K5AqMMPP9PmmXpXUc2kbcsQZmSsJt
	 JwRN6s1hQsrZ2FEnOJfu98rH+bVx87a6TD+V0JFb9W0eM/7+KGdhk5t9MwioTIAaAP
	 FwUix9ZxIWGov/TkzTxqe6+ZkXc1Fsa06SuNCVaSTWHp/+OrCcgeEGgRnbejhK4ovp
	 wEnUiTP+2LvNPyU82brfCZQZVaMmyU2dH0hx66g+j9wClmV/27F0s9Sz74tIVm5vUl
	 pMSVn6RGkpD7KhCEnBjkWQArSjqzrIfDxZd2rkczDjiGwS+c5KAjsy6HqekMaSdykb
	 aThaGG9kyRZDA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/9] pmdomain/rockchip: cycle optional power-domain
 resets on power-on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260717085220.3212274-4-gahing@gahingwoo.com>
References: <20260717085220.3212274-1-gahing@gahingwoo.com>
 <20260717085220.3212274-4-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:04:44 +0000
Message-Id: <20260717090445.03F621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `reset_control_put()` in `rockchip_pm_remove_one_domain(=
)` leaks reset controls on probe failure.
--

--- Patch [3]: [RFC PATCH 3/9] pmdomain/rockchip: cycle optional power-doma=
in resets on power-on ---
commit dbabfedb9da6564f3dfbd42512d2a456cfb08c18
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain/rockchip: cycle optional power-domain resets on power-on

This commit adds optional reset line handling to the Rockchip power domain
driver. It explicitly asserts and deasserts the reset lines during domain
power-on to ensure hardware bus interfaces are correctly initialized.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -840,6 +848,14 @@ static int rockchip_pm_add_one_domain(struct rockchi=
p_pmu *pmu,
>  	if (error)
>  		goto err_put_clocks;
> =20
> +	pd->resets =3D of_reset_control_array_get_optional_exclusive(node);
> +	if (IS_ERR(pd->resets)) {
> +		error =3D PTR_ERR(pd->resets);
> +		dev_err(pmu->dev, "%pOFn: failed to get resets: %d\n", node, error);
> +		pd->resets =3D NULL;
> +		goto err_unprepare_clocks;
> +	}
> +

[Severity: Medium]
Since pd->resets is acquired here using a non-managed function, does it need
to be released in rockchip_pm_remove_one_domain()?

If a subsequent domain fails to probe, the error path tears down all
successfully added domains via rockchip_pm_remove_one_domain(). It looks li=
ke
that function destroys the domain and releases its clocks, but might miss
cleaning up these reset controls:

static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
{
        ...
        clk_bulk_unprepare(pd->num_clks, pd->clks);
        clk_bulk_put(pd->num_clks, pd->clks);

        /* pd->resets does not appear to be freed here */
        ...
}

Would calling reset_control_put(pd->resets) in the removal path prevent a
resource leak here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717085220.3212=
274-1-gahing@gahingwoo.com?part=3D3
