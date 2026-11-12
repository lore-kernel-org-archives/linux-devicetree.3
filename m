Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471758;
	b=I4Bg3enprj8zTzcSg8CKWqSfZAhJihlW+9zFTffuNEpzVQLrdDRQWSBtBf7wnwjZlVuT
	 lHERfAll7G7zMJ6M5IYM8sScst+TAxGoiqGHLtZULWvw6gzxQDHePHDhdtfFZe6GyBjld
	 wgskmk56heqoJf/19WaWWS/o9+iIV2V8uc0CfSZn4aVbJiGg+sR+EZ6WVeT0MDBNpem71
	 J1XNL+dKfh+A+6bXlEJ3Y0U+T8XKXIBfqsVgRmj3rT3HyGyjxlYm/hUIOIC/PsayCz6B/
	 10qhBnPIh8itXhU0DcpgWnQA/6jVJs79ooUw7DsziyRC5ky3LWhvoOMMMS76jf5luGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qTvyvJJmT7xNey7JSDBSUirTgfHQ5ukNn0barNdDgPc=;
	b=D+ZQJ3UpI8ROeiSDFSW5M4Pa+fJNxax7lX6v8smXYyDMye3cRmN7nQ6CqZ0ifTYwBZDs
	 qA4opvnUBNEl+z+fqCZoLtyEo+x7NGTVg87iMRrBhWqiVOZ7bD+brGfhm0+r0SHMNGBNg
	 CCmgIhppjH8L5PSZ6p31S99bPT9JJQznOP2huLB+yrzIbjG5aRRFH3O9k6GvZHK0076WE
	 jV/TYbqUOUzTe2jMdyBj7houBTc4m4TAW0fJICU0lzmHHQ2OBDnAs0pqaRFIjOB6iY6Ee
	 4FzHfIuOsfSy0P7Ss38aGsrkpTTyLB2MTQ6E49qw0evzK5CY33xk5oj2wFes3DkVZ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZCtOTDt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0131F606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZCtOTDt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515921F00A05;
	Thu, 12 Nov 2026 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471757;
	bh=qTvyvJJmT7xNey7JSDBSUirTgfHQ5ukNn0barNdDgPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZCtOTDtlVmcFw+/npQF7uicasWAD4EkdL9gq77xXf02UDwzNhOeAWwVEpx5hPvAu
	 /2WJdJgdgWyr5sAY4GIWEr4BId98UpF5eOYJNoW71TC7LshLqPNggko8kwjA/6CNPX
	 f8DZpa78EdJBUGuaOiDSI7P1RXE7e1iQrusdlENA9Er0fkU3rJZXRahign+URRZqMX
	 W8PUzFknTe2wrb8tQ/8U07LsM5Trfc9B+Qkwvyol66sXPp+/j06YaaHVbKBI9wUgI4
	 W/pu5HdPgx1mDOTxvdgmET3mNjxUX3piZ+5eFEcwvHNZNufPPo1l+t4hx4sJTiFYo/
	 Uc3PXZqi+sFOw==
Message-ID: <sashiko-outbox-210694@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] pmdomain: spacemit: Add power domain driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-04-k3-pm-support-v4-2-de3931aa5153@kernel.org>
References: <20261112-04-k3-pm-support-v4-0-de3931aa5153@kernel.org>
 <20261112-04-k3-pm-support-v4-2-de3931aa5153@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:22:36 +0000
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
- [Low] pmdomain: spacemit: log ret instead of pm_index on power
  transition error
--

commit 1bedd4d63c29dbe88ab766b2b331bdd5d01ee76c
Author: Yixun Lan <dlan@kernel.org>

pmdomain: spacemit: Add power domain driver

This commit adds a generic power domain driver for SpacemiT K1 and K3 SoCs
as an auxiliary bus driver supporting both software and hardware power
sequencing modes.

> diff --git a/drivers/pmdomain/spacemit/spacemit-pm-domains.c b/drivers/pm=
domain/spacemit/spacemit-pm-domains.c
> new file mode 100644
> index 0000000000000..dd0613c1912a0
> --- /dev/null
> +++ b/drivers/pmdomain/spacemit/spacemit-pm-domains.c
> @@ -0,0 +1,424 @@

[ ... ]

> +static int spacemit_pd_power_off(struct generic_pm_domain *domain)
> +{
> +	struct spacemit_pm_domain *pd =3D to_spacemit_pd(domain);
> +	struct spacemit_pmu *pmu =3D pd->pmu;
> +	const struct spacemit_pm_domain_param *p =3D pd->param;
> +	unsigned int val;
> +	int ret;
> +
> +	if (!pd->param->use_hw) {
> +		regmap_clear_bits(pmu->regmap, p->reg_pwr_ctrl, BIT(p->bit_isolation));
> +		fsleep(15);
> +
> +		val =3D BIT(p->bit_sleep1) | BIT(p->bit_sleep2);
> +		regmap_clear_bits(pmu->regmap, p->reg_pwr_ctrl, val);
> +		fsleep(15);
> +
> +		ret =3D regmap_read_poll_timeout(pmu->regmap,
> +					       APMU_POWER_STATUS_REG,
> +					       val,
> +					       !(val & BIT(p->bit_pwr_stat)),
> +					       5,
> +					       APMU_POWER_TIMEOUT_US);
> +	} else {
> +		val =3D BIT(p->bit_auto_pwr_on) | BIT(p->bit_hw_mode);
> +		regmap_clear_bits(pmu->regmap, p->reg_pwr_ctrl, val);
> +		fsleep(15);
> +
> +		ret =3D regmap_read_poll_timeout(pmu->regmap,
> +					       APMU_POWER_STATUS_REG,
> +					       val,
> +					       !(val & BIT(p->bit_hw_pwr_stat)),
> +					       5,
> +					       APMU_POWER_TIMEOUT_US);
> +	}
> +
> +	if (ret)
> +		dev_err(&domain->dev, "failed to power off domain %s: %d\n",
> +			p->name, pd->pm_index);
> +
> +	return ret;
> +}
> +
> +static int spacemit_pd_power_on(struct generic_pm_domain *domain)
> +{
> +	struct spacemit_pm_domain *pd =3D to_spacemit_pd(domain);
> +	struct spacemit_pmu *pmu =3D pd->pmu;
> +	const struct spacemit_pm_domain_param *p =3D pd->param;
> +	unsigned int val;
> +	int ret =3D 0;
> +
> +	if (!p->use_hw) {
> +		regmap_set_bits(pmu->regmap, p->reg_pwr_ctrl, BIT(p->bit_sleep1));
> +		fsleep(20);
> +
> +		val =3D BIT(p->bit_sleep2) | BIT(p->bit_sleep1);
> +		regmap_set_bits(pmu->regmap, p->reg_pwr_ctrl, val);
> +		fsleep(20);
> +
> +		regmap_set_bits(pmu->regmap, p->reg_pwr_ctrl, BIT(p->bit_isolation));
> +		fsleep(15);
> +
> +		ret =3D regmap_read_poll_timeout(pmu->regmap,
> +					       APMU_POWER_STATUS_REG,
> +					       val,
> +					       (val & BIT(p->bit_pwr_stat)),
> +					       5,
> +					       APMU_POWER_TIMEOUT_US);
> +	} else {
> +		val =3D BIT(p->bit_auto_pwr_on) | BIT(p->bit_hw_mode);
> +		regmap_set_bits(pmu->regmap, p->reg_pwr_ctrl, val);
> +		fsleep(300);
> +
> +		ret =3D regmap_read_poll_timeout(pmu->regmap,
> +					       APMU_POWER_STATUS_REG,
> +					       val,
> +					       (val & BIT(p->bit_hw_pwr_stat)),
> +					       5,
> +					       APMU_POWER_TIMEOUT_US);
> +	}
> +
> +	if (ret)
> +		dev_err(&domain->dev, "failed to power on domain %s: %d\n",
> +			p->name, pd->pm_index);
> +
> +	return ret;
> +}

[Severity: Low]
As reported by Troy Mitchell on v3 [1], should these dev_err() calls in
spacemit_pd_power_off() and spacemit_pd_power_on() pass ret instead of
pd->pm_index so that the error code is logged rather than the 0-based
domain index?  With that changed, pd->pm_index can also be dropped.

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
> +	pd->pm_index        =3D id;
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
As reported by Troy Mitchell on v3 [1], can unbinding this driver or
unloading the module while a consumer device is attached cause a
use-after-free on pd->genpd?

Because the auxiliary device shares its parent CCU platform device's
of_node, fw_devlink links consumer devices to the parent CCU device rather
than to adev->dev, so consumer devices are not detached when
spacemit_pm_domain_remove() runs.  pm_genpd_remove() then fails with
-EBUSY because genpd->device_count > 0, leaving pd->genpd linked in the
global gpd_list and referenced by consumers' dev->pm_domain pointers right
before devres frees the devm_kzalloc()-allocated struct
spacemit_pm_domain.

[1] https://lore.kernel.org/r/DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-04-k3-pm-s=
upport-v4-0-de3931aa5153@kernel.org?part=3D2
