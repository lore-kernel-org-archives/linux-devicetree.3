Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7B7370D56
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751224; cv=none; b=PLjaC5eIqF3h7/1gVQzGdwrJaU6zv+vJDEUHq8dnQaRJEr0o3oNfgLb0BtC93nj7+cniGiozVYA9xIerSf5UOruVegBwKMZKHs3fmoHT/MZZ51whSlp8LtW/YMnPL1xPk7exUuXqSrMXewcWypiuHuPoxefzyPnVgWQy0z0yXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751224; c=relaxed/simple;
	bh=S1MNEDirUKJs0Np3fpdlbYJrMnlV6cIImTEK1SpjeyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V06RjoOmwOomuXkJDbI3aJFNJqdsGnUC9STkHiQn3ATSyFuMEABJltZDqv0OH7VQofbIQOkgIA981EovkuW7irTarJF8/lJRh4aXn410EwTlbDmimnbXZeHxmS8ND5g4ljerR0840VGI8vWNfHvXbFOv9w3U7r8RbhMebBz9ZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmxZlXF7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmxZlXF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4791F000E9;
	Mon,  3 Aug 2026 10:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751222;
	bh=y/jJARlnnweIcMoRv904fpzxXNLrE7WQ9kzjX68aY90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FmxZlXF7JZxVUD0uqxOWOKJusMT3ACbSfg45MRoHrZiRQst9fZ0M1BXnkHQ1rUYV+
	 jnv21jwohb+XAu0LkJCTtihzTSOSff6EFHdF9rwiil8eQ7GY9mi6nspvsSYN9jvGUY
	 bekweDe4fXCpHzbB6PweBrB/O8cqAwKmoDLB/bh0VlYWfSS7aPYm84yZRZgA3VPZ7C
	 bc7EZFMb0X7fq77yq9HqKa1Wpcrd8w8Hzubu32xvD13WvpLxo/8+9MbWekl+mEfvaU
	 KUABSCPNl0FT9CH0qjXiRnCgc8DurhfpXbZHPc63ZZd25mjEAOb7A8jbhmXcg7V0r8
	 DVluMNmXRbl4Q==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v4 3/6] pmdomain/rockchip: cycle optional
 power-domain resets on power-on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260803094125.3285895-4-gahing@gahingwoo.com>
References: <20260803094125.3285895-1-gahing@gahingwoo.com>
 <20260803094125.3285895-4-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:00:20 +0000
Message-Id: <20260803100021.3D4791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A pre-existing resource leak occurs in `rockchip_pm_add_one_domain=
()` when `of_clk_get()` fails, leading to permanent leaks of previously acq=
uired clock references and potential unbounded resource exhaustion upon pro=
be deferral.
--

--- Patch [3]: [RFC PATCH v4 3/6] pmdomain/rockchip: cycle optional power-d=
omain resets on power-on ---
commit c4991b83e89b1e1b5f031a43c8789950a7837730
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain/rockchip: cycle optional power-domain resets on power-on

Some Rockchip domains come out of power-on with their bus interface in
an undefined state. This patch cycles the domain's resets to clear it.
It takes the domain node's resets if it has any, and pulses them between
releasing idle and restoring QoS.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index e1857f8786864..82051f60090f3 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -857,6 +866,14 @@ static int rockchip_pm_add_one_domain(struct rockchi=
p_pmu *pmu,
>  	if (error)
>  		goto err_put_clocks;

[Severity: High]
This is a pre-existing issue, but looking at the clock acquisition loop just
above this in rockchip_pm_add_one_domain():

	for (i =3D 0; i < pd->num_clks; i++) {
		pd->clks[i].clk =3D of_clk_get(node, i);
		if (IS_ERR(pd->clks[i].clk)) {
			error =3D PTR_ERR(pd->clks[i].clk);
			dev_err(pmu->dev,
				"%pOFn: failed to get clk at index %d: %d\n",
				node, i, error);
			return error;
		}
	}

If a clock at index > 0 fails to be acquired (for example, returning
-EPROBE_DEFER), does the direct return bypass the err_put_clocks cleanup
path? It appears this might permanently leak the previously acquired clock
references, potentially leading to unbounded resource exhaustion upon probe
deferral retries. Should this code clean up the successfully acquired clocks
instead of returning directly?

> +	pd->resets =3D of_reset_control_array_get_optional_exclusive(node);
> +	if (IS_ERR(pd->resets)) {
> +		error =3D PTR_ERR(pd->resets);
> +		dev_err(pmu->dev, "%pOFn: failed to get resets: %d\n", node, error);
> +		pd->resets =3D NULL;
> +		goto err_unprepare_clocks;
> +	}
> +
>  	pd->num_qos =3D of_count_phandle_with_args(node, "pm_qos",
>  						 NULL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803094125.3285=
895-1-gahing@gahingwoo.com?part=3D3
