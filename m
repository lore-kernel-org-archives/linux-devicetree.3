Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044752;
	b=A5Q3LoYPz+Fhl1gqUV1YD63w/jT6Mj+kgZzKa0EBW2thSKkxZ1y3bbYPpriqm0E1RaJd
	 38bM06e9SyWh3OKyhqjpAUph+hChbhd1bNxPjo/t//uYbkpbNkYhkKAnd8yzk/crv1N3j
	 KXvrs0kbMwBd00AAl8yl2KQBzXV3/wuiFQomHzWXz8RQSDs1HnVx0Zoqf+Rsi/vZEr/WN
	 u8UOMgzdLFzRR91ZLMs78dDQnqrMtn6KOlRRB6Fg/6y91VY7PgHPzi3REAUkhkmC9u037
	 thhdWlBe+o7tz8HGCN8pQvzP+/my9h+VaqB3vVe463QoKs7DMALgvJ843oigxPV3/iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044752;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mofTz53POTjAAlmpN5LbXKg8OOA6eil30/eUWllOPsw=;
	b=mXo/27hA0iwbRiOQU7aiKiUs78UhvFjeJXaAwlHHdNKOoFgW9bIQZZIkH3Ar0UJVItia
	 D1XbO1tMBtSZY9cV2o8OLcu1zfiZ/L7CyWR4FNMg1Wtob+UPE8f6NtnCjs19RaRTxD6NP
	 KZix35AEK9Jn1tyh+hULEaxwJeQNooLB7A+feECbohpsJc80q3f8Z6U7TqV1mSSgXHkVq
	 lVrQ+qjzLQIQ7Y0Zgyh2jMfRcCLnNxpxBiOuErmuyn3KWHBNTF7X/QXbFNvJCgR1ITAuo
	 8nyBDjWbg4rZFmjMNmU7LreGVDvDNJ+fKxgiVULDdzuhQUwEphx4H3L5yJc6aL396QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihOKCEIe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6E60A2612
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihOKCEIe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A74C1F0089E;
	Wed, 18 Nov 2026 23:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795044752;
	bh=mofTz53POTjAAlmpN5LbXKg8OOA6eil30/eUWllOPsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ihOKCEIelzAiWZf/YxR8T5PfoJqTXxAMvvCu4UJrZloPZ25iix8R8smUzSoF5QO8C
	 kSGXicpQGSLPHLWPbl8ILaWYAKiojaZtN21vAYqqfv7nV3XuXiLGBKAHCBWovNkisi
	 ZE+FHjs/caF0GHAi9Xcw2pX+IFQymy2vthl5ze/zvUnjtfzzAv93LXEStD6XaZDQLr
	 s5H1qXgpn46VWW3u/Jx2EHH3oTGZCjzZnnJ4N8+Az4+XzHyiHRKOa2n2krkAf2C1Px
	 xHLcoNX7EA8MjN9xtj3wVbaXL0QYNRXwl7muIeM7nGaEvXKt7Jq7rITcyR4EPK7o5i
	 tznWGOfK8w1NQ==
Message-ID: <sashiko-outbox-222182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] pmdomain: spacemit: Add power domain driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-04-k3-pm-support-v5-2-42394acdf3e3@kernel.org>
References: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
 <20261118-04-k3-pm-support-v5-2-42394acdf3e3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 23:32:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] pmdomain: spacemit: devres frees active domains when
  pm_genpd_remove() fails
- [Medium] pmdomain: spacemit: unpowered always-on domain in
  spacemit_pm_add_one_domain()
--

commit 3dbb7292ceae5fc8cd5471f6a58e884045deb2ec
Author: Yixun Lan <dlan@kernel.org>

pmdomain: spacemit: Add power domain driver

This commit adds a generic PM domain driver on the auxiliary bus for
SpacemiT K1 and K3 SoCs, supporting software and hardware power-on/off
sequences.

> diff --git a/drivers/pmdomain/spacemit/spacemit-pm-domains.c b/drivers/pm=
domain/spacemit/spacemit-pm-domains.c
> new file mode 100644
> index 0000000000000..9d77d3f4c182b
> --- /dev/null
> +++ b/drivers/pmdomain/spacemit/spacemit-pm-domains.c
> @@ -0,0 +1,422 @@

[ ... ]

> +static int spacemit_pm_add_one_domain(struct spacemit_pmu *pmu, int id,
> +				      const struct spacemit_pm_domain_param *param)
> +{
> +	struct spacemit_pm_domain *pd;
> +	int ret;
> +
> +	pd =3D devm_kzalloc(pmu->dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return -ENOMEM;
> +
> +	pd->param           =3D param;
> +	pd->pmu             =3D pmu;
> +	pd->genpd.name      =3D param->name;
> +	pd->genpd.flags     =3D param->flags;
> +	pd->genpd.power_off =3D spacemit_pd_power_off;
> +	pd->genpd.power_on  =3D spacemit_pd_power_on;
> +
> +	ret =3D pm_genpd_init(&pd->genpd, NULL, spacemit_pm_is_off_state(pmu, p=
d));
> +	if (ret)
> +		return ret;
> +
> +	pmu->domains[id] =3D &pd->genpd;
> +
> +	return 0;
> +}

[Severity: Medium]
Can pm_genpd_init() fail with -EINVAL for a GENPD_FLAG_ALWAYS_ON domain
such as K3_PMDOMAIN_AUDIO if it is powered off at boot?

pm_genpd_init() requires always-on domains to already be powered on
(is_off =3D=3D false) and rejects them with -EINVAL otherwise, aborting
spacemit_pm_domain_probe().  Also, because genpd never powers an
always-on domain off or on after initialization, the power control
parameters defined on K3_PMDOMAIN_AUDIO are unused unless
spacemit_pm_add_one_domain() powers the domain on before calling
pm_genpd_init() (note that spacemit_pd_power_on() logs with &domain->dev,
which is not initialized until pm_genpd_init(), so pmu->dev would need to
be used for logging).

> +
> +static void spacemit_pm_domain_cleanup(struct spacemit_pmu *pmu)
> +{
> +	struct spacemit_pm_domain *pd;
> +	int i, ret;
> +
> +	for (i =3D 0; i < pmu->genpd_data.num_domains; i++) {
> +		if (!pmu->domains[i])
> +			continue;
> +
> +		pd =3D to_spacemit_pd(pmu->domains[i]);
> +		ret =3D pm_genpd_remove(pmu->domains[i]);
> +		if (ret)
> +			dev_err(pmu->dev, "failed to remove domain %s: %d - state may be inco=
nsistent\n",
> +				pd->param->name, ret);
> +	}
> +}

[ ... ]

> +static void spacemit_pm_domain_remove(struct auxiliary_device *adev)
> +{
> +	struct spacemit_pmu *pmu =3D auxiliary_get_drvdata(adev);
> +	struct device *dev =3D &adev->dev;
> +
> +	of_genpd_del_provider(dev->of_node);
> +	spacemit_pm_domain_cleanup(pmu);
> +}

[Severity: High]
As reported by Troy Mitchell on v3 [1], can unbinding the driver or
unloading the module while a consumer device is attached cause a
use-after-free on pd->genpd?

Because adev->dev shares the parent CCU device's of_node, fw_devlink
links consumers to the parent CCU platform device rather than adev->dev,
so unbinding spacemit_pm_domain_driver does not detach consumer devices
first.  When genpd->device_count > 0, pm_genpd_remove() fails with -EBUSY
and leaves pd->genpd linked in the global gpd_list and referenced by
consumers' dev->pm_domain pointers right before devres frees the
devm_kzalloc()-allocated struct spacemit_pm_domain.

[1] https://lore.kernel.org/r/DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-04-k3-pm-s=
upport-v5-0-42394acdf3e3@kernel.org?part=3D2
