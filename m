Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954F64582E3
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451662; cv=none; b=upwsx2qo51tE3dxPn3cWCf+FwBN0gE1VWuqY1qUY9a3sv7y/7Vsyjlc58+3lVEbiw3UIjQtn4uJFY9c5r6UB4efRIRnX8lyGUTyBX44XS8NlRyEHOKjLJ00hPfGs6UMB8NOTUZ7VkptP4yt6h6zQqpLpdPYdHEYAcdVQiy0Sit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451662; c=relaxed/simple;
	bh=y5vMX0cjPASEt3EzoJv5JEe044jSlrPPSvLqgy4Q3QY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aj+wfhM/7aVKHykA1v0GtPZKOqaH5z6Ha36rig4M73qLNF19DnC2aFslAnPuKVm7JwQf3hNMnkoBBJckSL+EYm4ZyHvYyFgGn8jkITimgwkKfGWMc7u3uGH6zs6AlK9SD6+YVvcqqZOfnaItyqPsshZD2W1xn1PjO1jLhBIiX+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FixsxzRC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FixsxzRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D2B1F000FF;
	Thu,  8 Oct 2026 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451661;
	bh=dzVQld7uvKqCJiVeO5nW6gr0wowZw4PMpYe0smaNxX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FixsxzRC70f10RKj13XVOeANMXbUzOJdpaM39z8y4PTp+seGU3WnmJRHC813YZV4M
	 VQaMKTq+8OMhk4hgSK5BT8fLjFMRDPy0Mdf2LgGaGg2v7mTca4Ct8x4N7yK59du0NF
	 G+eS+SC3ZfE9ZlBZrtgDx1S67fcFqhRnU5N5xrD9thXKGSqUgR0dHQaSEXIVoPlKYd
	 1qMXPpN6mfzEtzIoiio+wTHpjT6nWHqk3eCDW8Ayc7qNneWl1SPxKsbASal7v9yG8x
	 LzgAZGz1w5dR2KkIq3TjBLuxw75ON3Rc3qjoKHMSgQo46mvXXKIWRrpSpEAUvVceO0
	 /7zOYT9BhFQ9A==
Message-ID: <sashiko-outbox-163935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] pmdomain: riscv: Add RPMI performance domains as
 power domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008091032.2832333-7-joshua.yeong@starfivetech.com>
References: <20261008091032.2832333-1-joshua.yeong@starfivetech.com>
 <20261008091032.2832333-7-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:27:40 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pmdomain: devres UAF on genpd removal via sysfs unbind
--

commit bcb5ae58c392c6ab2a9b0f57c2292a07b1a39866
Author: Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: pmdomain: riscv: Add RPMI performance domains as power domains

This commit registers the performance domains of the RISC-V platform manage=
ment
interface (RPMI) performance service group as generic power domains. Devices
that are not CPUs can reference these domains through the "power-domains"
property and drive them using the OPP library.

> diff --git a/drivers/pmdomain/riscv/riscv-rpmi-perf-domain.c b/drivers/pm=
domain/riscv/riscv-rpmi-perf-domain.c
> new file mode 100644
> index 0000000000000..fc5c512fe0697
> --- /dev/null
> +++ b/drivers/pmdomain/riscv/riscv-rpmi-perf-domain.c
> @@ -0,0 +1,265 @@

[ ... ]

> +static int rpmi_perf_genpd_probe(struct platform_device *pdev)
> +{
> +	struct rpmi_perf **mpxy_perf =3D dev_get_platdata(&pdev->dev);
> +	struct device *dev =3D &pdev->dev;
> +	struct rpmi_perf_genpd_provider *provider;
> +	struct generic_pm_domain **domains;
> +	u32 i, num_domains, registered =3D 0;
> +	int ret;
> +
> +	if (!mpxy_perf || !*mpxy_perf)
> +		return -EINVAL;
> +
> +	num_domains =3D rpmi_perf_num_domains(*mpxy_perf);
> +
> +	provider =3D devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> +	if (!provider)
> +		return -ENOMEM;
> +
> +	provider->pds =3D devm_kcalloc(dev, num_domains, sizeof(*provider->pds),
> +				     GFP_KERNEL);

[Severity: High]
Since provider->pds is allocated using devm_kcalloc(), this memory will be
automatically freed as soon as the driver's remove callback returns.

> +	if (!provider->pds)
> +		return -ENOMEM;

[ ... ]

> +static void rpmi_perf_genpd_remove(struct platform_device *pdev)
> +{
> +	struct rpmi_perf_genpd_provider *provider =3D platform_get_drvdata(pdev=
);
> +	u32 i;
> +
> +	of_genpd_del_provider(dev_of_node(pdev->dev.parent));
> +
> +	for (i =3D 0; i < provider->data.num_domains; i++) {
> +		if (provider->data.domains[i])
> +			pm_genpd_remove(provider->data.domains[i]);

[Severity: High]
Does this code ignore the return value of pm_genpd_remove()?

If a user manually unbinds the driver via sysfs while consumer devices are
still attached to the PM domains, pm_genpd_remove() will return -EBUSY and
fail to remove the domain from the core genpd framework's global gpd_list.

Because the memory backing these domains (provider->pds) was allocated with
devres and will be freed immediately after this remove function returns,
could this leave dangling pointers in the global gpd_list?

This might lead to a use-after-free and potential kernel panic when
the gpd_list is traversed later.

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008091032.2832=
333-1-joshua.yeong@starfivetech.com?part=3D6
