Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F40239E7F
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 15:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104391; cv=none; b=ddTLumby69vZNY39Nw5IOimkY3piq6YNq63mAuhjYKy1qFJRINxsQTFmMsA4opWRjOgVsXwr6bszBdBeo3m1jEtAqewKiMV9sjM+IPyzEUfsERxNCJwlv11CxmbG4jueRTsiaZKTjMH8bhQTOd7mekJ7byHlPDML98R6W7bU4pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104391; c=relaxed/simple;
	bh=dFgid8o8RH0efeiEllyJuVcTsPKcYRlXNj+mqYJ1kts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gjXNJ0wCgbYLgNB8YN1pJvadgaj0Ox4XImNPBl8iqTC4pGuhw8Qn+3WJaGNa4hlo4wJ4/yGC5jJISPnN4aUTlNijZ9WJkgSeGQczrkFQRoepmJdPcslExtDIhHimbI1geep5s/IY/it+qKHWIMRRvcE5VnzKupYLLo880g0fZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Im3NiHtL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Im3NiHtL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7D31F000E9;
	Sun, 30 Aug 2026 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788104389;
	bh=ZRw8MyovjcmersirVy4rZnAqB5NkC8L+Ldik2ZuJ8+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Im3NiHtLUi6AKjfjHdq34qFq5Amzezi90PYuK5/KtDTSGg2KXiV7R0jTZA7ZSR7ye
	 cHaZlaYDQq+zQ5/EZxLZzYVXyef0DbqbrR/eRLg9ZaXpZ5mFbeb+aiS5mk9o1E02BD
	 DNgvUjlkiVOqft2L5evENthW19QT4rvD0QQOrP64dSaomrIve94HeuMn1HcrcjoZau
	 ykEnXorUa+r3tAQr3IzFlxCjhUal5yOJQ2yrjtFTxtDUfRdikkLwx5bQM663Tz7qwh
	 8LiM5elIKRmrCobfuIHXvaCfOa2LQz7OWj0fIvLnKECM6ibpwx2yc4DBAxwer6coFG
	 C8WFdjAzHffpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pmdomain: riscv: Add RPMI device power service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260830152812.312663-3-joshua.yeong@starfivetech.com>
References: <20260830152812.312663-1-joshua.yeong@starfivetech.com>
 <20260830152812.312663-3-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 15:39:48 +0000
Message-Id: <20260830153949.6B7D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Strict equality check of power state includes context and reserved=
 bits, breaking domain probe and power off.
- [High] The driver ignores the return value of `pm_genpd_init()`, which le=
ads to list corruption and a kernel crash in the error rollback path.
- [Medium] Missing sync_state callback prevents domains initialized as ON f=
rom ever powering off.
- [Low] Kconfig dependency allows compilation without MAILBOX, causing link=
er errors.
- [Low] Domain name truncation when hardware provides a full 16-character n=
ame.
--

commit c4b30c55f0c6f514e587b60c8050b357cd8cdaaa
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

pmdomain: riscv: Add RPMI device power service

This commit adds a generic power domain provider based on the RISC-V RPMI
device power service group. It enumerates the device power domains, queries
their attributes and state, and registers them as a genpd provider.

> diff --git a/drivers/pmdomain/riscv/Kconfig b/drivers/pmdomain/riscv/Kcon=
fig
> new file mode 100644
> index 0000000000000..5c2ef53218a3e
> --- /dev/null
> +++ b/drivers/pmdomain/riscv/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config RISCV_RPMI_DEVICE_POWER
> +	bool "RISC-V RPMI Based Device Power driver"
> +	depends on MAILBOX || COMPILE_TEST

[Severity: Low]
Does this allow the driver to be built when COMPILE_TEST=3Dy and MAILBOX=3D=
n?

The RISCV_RPMI_DEVICE_POWER driver uses mailbox APIs like
mbox_request_channel() in drivers/pmdomain/riscv/riscv-rpmi-device-power.c,
but include/linux/mailbox_client.h does not provide dummy stubs when
CONFIG_MAILBOX is not set, which could lead to undefined reference linker
errors.

> +	default RISCV
> +	select PM_GENERIC_DOMAINS if PM

[ ... ]

> diff --git a/drivers/pmdomain/riscv/riscv-rpmi-device-power.c b/drivers/p=
mdomain/riscv/riscv-rpmi-device-power.c
> new file mode 100644
> index 0000000000000..6590d622c2a44
> --- /dev/null
> +++ b/drivers/pmdomain/riscv/riscv-rpmi-device-power.c

[ ... ]

> +struct rpmi_device_power_domain {
> +	u32 id;
> +	u32 transition_latency;
> +	struct device *dev;
> +	struct rpmi_ctx *mpxy_ctx;
> +	struct generic_pm_domain genpd;
> +	char name[RPMI_PM_DOMAIN_NAME_LEN];

[Severity: Low]
If the hardware provides a full 16-character name in rx.name, does this
truncate the last character?

In rpmi_device_power_get_attrs(), strscpy() copies into this buffer:

	strscpy(mpxy_pm_domain->name, rx.name, sizeof(mpxy_pm_domain->name));

strscpy() reserves one byte for the NUL terminator, which might cause
identical names and conflicts in genpd debugfs if the original hardware
names differ only in the 16th character.

> +};

[ ... ]

> +static int rpmi_pd_power(struct generic_pm_domain *domain, bool power_on)
> +{
> +	struct rpmi_device_power_domain *mpxy_pm_domain;
> +	u32 state, ret_state, domain_id;
> +	int ret;
> +
> +	if (power_on)
> +		state =3D RPMI_POWER_STATE_GENERIC_ON;
> +	else
> +		state =3D RPMI_POWER_STATE_GENERIC_OFF;
> +
> +	mpxy_pm_domain =3D to_rpmi_pd(domain);
> +	domain_id =3D mpxy_pm_domain->id;
> +
> +	ret =3D rpmi_power_state_set(mpxy_pm_domain, domain_id, state);
> +	if (!ret)
> +		ret =3D rpmi_power_state_get(mpxy_pm_domain, domain_id, &ret_state);
> +	if (!ret && state !=3D ret_state)

[Severity: High]
Can this strict equality check fail power state transitions if context bits
or reserved bits differ?

If the state is set to 3 but the hardware returns 0x10003 (indicating it
has lost context, with bit 16 set), this check in rpmi_pd_power() will
result in an -EIO error despite the hardware successfully powering down.

> +		return -EIO;
> +
> +	return ret;
> +}

[ ... ]

> +static int rpmi_pm_domain_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	for (i =3D 0; i < num_domains; i++, mpxy_pd++) {
> +		u32 state;
> +
> +		mpxy_pd->dev =3D &pdev->dev;
> +		mpxy_pd->mpxy_ctx =3D mpxy_ctx;
> +		mpxy_pd->id =3D i;
> +
> +		ret =3D rpmi_device_power_get_attrs(i, mpxy_pd);
> +		if (ret) {
> +			dev_warn(mpxy_pd->dev,
> +				 "power domain %d initialization failed\n",
> +				 mpxy_pd->id);
> +			domains[i] =3D NULL;
> +			continue;
> +		}
> +
> +		ret =3D rpmi_power_state_get(mpxy_pd, i, &state);
> +		if (ret || (state !=3D RPMI_POWER_STATE_GENERIC_OFF &&
> +			    state !=3D RPMI_POWER_STATE_GENERIC_ON)) {

[Severity: High]
Can this strict equality check reject domains that have lost context?

If a domain is powered off and has lost context (e.g., bit 16 is set,
making the state 0x10003), this strict inequality check in
rpmi_pm_domain_probe() evaluates to true. The domain is discarded (set to
NULL), causing dependent peripheral devices to permanently fail to probe.

> +			dev_warn(mpxy_pd->dev,
> +				 "failed to get state for power domain %d\n",
> +				 mpxy_pd->id);
> +			domains[i] =3D NULL;
> +			continue;
> +		}
> +
> +		mpxy_pd->genpd.name =3D mpxy_pd->name;
> +		mpxy_pd->genpd.power_off =3D rpmi_pd_power_off;
> +		mpxy_pd->genpd.power_on =3D rpmi_pd_power_on;
> +
> +		pm_genpd_init(&mpxy_pd->genpd, NULL,
> +			      state =3D=3D RPMI_POWER_STATE_GENERIC_OFF);

[Severity: High]
Does ignoring the return value of pm_genpd_init() here cause a kernel crash
during error rollback?

If pm_genpd_init() fails, the domain's gpd_list_node remains NULL. If a
subsequent operation fails (like of_genpd_add_provider_onecell) and
triggers the error path below, pm_genpd_remove() is called on the
uninitialized domain, which calls list_del() and dereferences the NULL
pointers.

> +
> +		domains[i] =3D &mpxy_pd->genpd;
> +	}
> +
> +	mpxy_pd_data->domains =3D domains;
> +	mpxy_pd_data->num_domains =3D num_domains;
> +
> +	ret =3D of_genpd_add_provider_onecell(np, mpxy_pd_data);
> +	if (ret) {
> +		while (i--) {
> +			if (domains[i])
> +				pm_genpd_remove(domains[i]);
> +		}
> +
> +		return dev_err_probe(dev, ret, "failed to add genpd provider\n");
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static struct platform_driver rpmi_pm_domain_platdrv =3D {
> +	.driver =3D {
> +		.name =3D "riscv-rpmi-device-power",
> +		.of_match_table =3D rpmi_pm_domain_of_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +	.probe =3D rpmi_pm_domain_probe,
> +};

[Severity: Medium]
Are domains initialized as ON at boot able to be powered off?

According to PM domain subsystem guidelines, domains with is_off=3Dfalse get
the stay_on flag set by pm_genpd_init(). Since this driver neither sets
GENPD_FLAG_NO_STAY_ON on the domains nor provides a .sync_state callback
in its platform_driver struct, the stay_on flag is never cleared. This
leaves the domains powered indefinitely, potentially wasting power and
blocking regulator cleanup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830152812.3126=
63-1-joshua.yeong@starfivetech.com?part=3D2
