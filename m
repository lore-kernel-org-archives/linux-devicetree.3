Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AC53D7D72
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899989; cv=none; b=bShhULmnqvRxJcfyg1vTGNE3MD3P5Wx4zIVURRNCedRAKQmuP5Ei7nDklrxuLuKt/dUEZNMktvTRGQB2IqjMrx4wHO8WpmJAZyzr3oufYK61YeQJCq1Rcglzb1BS6Swrs6gdUVLcJyfO2LH3wCeBWQNwugufEx1AXpK405B7KrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899989; c=relaxed/simple;
	bh=zjDzq2tM8dHvbDV4z/A+aC4fSFYPgLvc0sMIRrqQ3rA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L33HPVwaR3Rl4iC/PYqalU7HOK/XaLiM96jU7SXXz2iG9YAcg1LHT+T7/bVOnJ/mbGPWZXRfJARzwU97MqKD6p2lfBM4JKUh9nH6ZSsm92IPF/S40AsqOEp7IZivWwDDof6nsJq2uMsj6Astwq1WoeWAQVeyWcR5kOBqBYTfvsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCduSXaE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCduSXaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9006E1F00A3D;
	Fri, 28 Aug 2026 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787899987;
	bh=T8Ni++JT7sgcySCZgEh0z8wGtLe/sgpGIYkKf0mfNJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oCduSXaEz760hEw+N+jTwf950Y2ofLxyCjhg/NIEcwxc/NQtjcZJNbUCWW00EEkNg
	 dxCx98tP7MzGvrwCpvf6wiJ6cR8jATQmeTWr9ZhTym9xSHPRCMWQ7wrU/EkQXFDbxe
	 hf1l7ly2YT08bOSYJlWBazg2bpBcjHKnXQC0PEfFVs2z7+JyLil15j32xghRLlb3it
	 NEa+zHd4E9iTluZRAhi4lpVCvexyCcfwf24QszWjVx8RTKISu8geFQgeiDzXzDj9es
	 EfrWaq44dn/Og2JCAIIlPxMqOgDHfcnSCT978lnWNwt1Is8J191LZef7mClogJaSjD
	 kuHsWcfZaRlvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/10] iio: adc: ti-ads1262: support REFOUT and VBIAS
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260828-ads126x-v4-9-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-9-1dc27e9c0260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 06:53:07 +0000
Message-Id: <20260828065307.9006E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Calling regulator_get_voltage() on a regulator's own supply from w=
ithin its .get_voltage() callback causes a recursive locking self-deadlock.
--

commit ea8c096c3d3561a926dd5bc84b789c153ef1db68
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support REFOUT and VBIAS regulators

This commit registers the "refout" and "vbias" regulators in the ti-ads1262
driver to enable their use as common mode supplies.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 3f6d34a08b296..4784142f35c9d 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

[ ... ]

> @@ -1132,6 +1133,120 @@ static irqreturn_t ads1262_irq_handler(int irq, v=
oid *dev_id)
>  	return IRQ_HANDLED;
>  }
> =20

[ ... ]

> +static int ads1262_vbias_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct ads1262 *st =3D rdev_get_drvdata(rdev);
> +	int avdd_uV, avss_uV;
> +
> +	avdd_uV =3D regulator_get_voltage(st->avdd_supply);

[Severity: High]
Does this cause a recursive locking self-deadlock?

When a consumer or sysfs triggers a voltage query on vbias, the regulator
core calls regulator_lock_dependent(), which safely locks vbias and
recursively locks all of its supplies, including avdd.

The core then invokes vbias's .get_voltage callback, mapping to
ads1262_vbias_get_voltage(). Inside this callback, regulator_get_voltage()
acts as an external API: it initializes a new lock context and attempts
to lock avdd_supply again.

Because the current thread already holds the mutex for avdd, attempting
to lock it again with a new lock context results in a self-deadlock. A
thread attempting to read the vbias voltage will deadlock indefinitely,
causing a hang on that code path.

Could this approach use the unlocked internal API
regulator_get_voltage_rdev(rdev->supply->rdev) to get the supply's
voltage from within a regulator op instead?

> +	if (avdd_uV < 0)
> +		return avdd_uV;
> +
> +	avss_uV =3D st->avss_supply ? regulator_get_voltage(st->avss_supply) : =
0;
> +	if (avss_uV < 0)
> +		return avss_uV;
> +
> +	return DIV_ROUND_CLOSEST(avdd_uV - avss_uV, 2);
> +}

[ ... ]

> +static const struct regulator_desc ads1262_vbias_regulator_desc =3D {
> +	.name =3D "vbias",
> +	.of_match =3D "vbias",
> +	.regulators_node =3D "regulators",
> +	.supply_name =3D "avdd",

[Severity: High]
This line establishes avdd as the upstream supply for vbias, which
instructs the regulator core that avdd is a strict dependency of vbias
and must be locked before dispatching operations to vbias ops. This is
what triggers the self-deadlock described above when
regulator_get_voltage() is called.

> +	.ops =3D &ads1262_vbias_regulator_ops,
> +	.type =3D REGULATOR_VOLTAGE,
> +	.owner =3D THIS_MODULE,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-ads126x-v4=
-0-1dc27e9c0260@gmail.com?part=3D9
