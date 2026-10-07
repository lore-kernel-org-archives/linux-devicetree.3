Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686244749D7
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368080; cv=none; b=el+cPuZ7/WhqLH1+FYcVeH+hcaBM+aqChYK/Ip8Asu8QBvLedu8yCuVD1siKQGRp4cI0xGQ/db9/fdONzPdqwCF3apf47+mGuHN6zqy2NZk1st7JStBELlZPmyRHczESwy8iAiI1QqbRGrSPw5kDgcGce3sExvvL4T5Z7T5wOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368080; c=relaxed/simple;
	bh=Rbv6dUWWHBOn43wEJl4KI5lrUlJMbMpOP3Q3hpo1lc0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=q4K2WqljZaJwT8kg8EYY6JniLbImWJKhoW/DhUjCZ89ZrbSLvKifO87WboP++CQxNwTQ9cWFnIDgJttkzMmDVxPKRzqniM29AO4+w0Q1h7nNc3y48JjKgBx6G4bQbqAGajyi2LRZ+8hGEnzPUPUF1NLemYlHxowt4xk7BJUEILA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3EejBD9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3EejBD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACDC1F0089B;
	Wed,  7 Oct 2026 10:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368069;
	bh=E6LklzaIGXM1ONLAG14pifBlUtIph4pbKIDnXAYZt7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a3EejBD9gxoWzyO0ziIKJ02L4zUsvk4zzS5QWh+esDma/AAoeaiKFwnCwYa8fAxkg
	 Rp0UnLvxiPD2zfn7FzJzcH6SkY+Qs/TdjWpDUFDtgVvFboNa3SW5KBw4UlwwgQkTuM
	 PncBafs+rxc9T8C1ZLhQPZl+V4+SIXcJ/mxbWFlTlKtFnfFJaYuHYZzUgLd1f8DUj3
	 jJQINVNCzKLqFQ5pBK/muYvFdF/nDehckprb2ca/R/8LzngJ4HdxqOrHPh6TJk/38z
	 BrMtayRhBQp/vjP1V0m1qc2L4lWm3Pd12NPWf07QDodzDdh1aW6pwATolwYeZV5/ZU
	 mwlDHLnStXVHQ==
Message-ID: <sashiko-outbox-162848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] regulator: Add RPMI voltage service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261007100022.2512187-3-joshua.yeong@starfivetech.com>
References: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
 <20261007100022.2512187-3-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:14:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] regulator: mpxy_reg_set_voltage_sel() rejects 0 uV and masks lis=
t_voltage() error codes
--

commit cbc4d4861f2f3917f562d79d42a2f9d2a4373b1c
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

regulator: Add RPMI voltage service

This commit adds a mailbox client based regulator driver for the RISC-V=20
RPMI voltage service group. It enumerates voltage domains advertised by
the platform microcontroller and registers them as regulators.

> diff --git a/drivers/regulator/riscv-rpmi-regulator.c b/drivers/regulator=
/riscv-rpmi-regulator.c
> new file mode 100644
> index 0000000000000..46119297e7de9
> --- /dev/null
> +++ b/drivers/regulator/riscv-rpmi-regulator.c

[ ... ]

> +static int mpxy_reg_set_voltage_sel(struct regulator_dev *rdev, unsigned=
 int selector)
> +{
> +	struct rpmi_reg_domain *mpxy_reg =3D rdev_get_drvdata(rdev);
> +	struct rpmi_set_level_tx tx;
> +	struct rpmi_set_level_rx rx =3D { };
> +	struct rpmi_mbox_message msg;
> +	s32 volt_uV;
> +	int ret;
> +
> +	volt_uV =3D mpxy_reg->desc.ops->list_voltage(rdev, selector);
> +	if (volt_uV <=3D 0)
> +		return -EINVAL;

[Severity: Medium]
Does this check incorrectly drop specific error codes from the regulator
core and prevent setting a 0 uV target?

If list_voltage() returns a specific error code (such as -ENOTSUPP), it
is masked by -EINVAL here, which degrades error reporting upstream.
Additionally, if the hardware explicitly supports and advertises a 0 uV
level (which is valid for regulators that support turning off the
output via voltage selection), the driver will falsely reject it.

The standard regulator subsystem pattern is to check:

	if (volt_uV < 0)
		return volt_uV;

> +
> +	tx.domain_id =3D cpu_to_le32(mpxy_reg->id);
> +	tx.level =3D cpu_to_le32(volt_uV);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007100022.2512=
187-1-joshua.yeong@starfivetech.com?part=3D2
