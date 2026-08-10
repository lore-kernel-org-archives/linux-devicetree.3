Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126383DA5CD
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373857; cv=none; b=JWB9guDWHjVQqsNVXfzy3ezzYbYM+b6nmGQpBttmRwDDJjywgWQyQb1xrKt+jgg5+qpRhRJ2gflGAtngooOeSjbcz+CmBHkDzqNQTM8TloUSALMSTdXhnzAMViMrzMl7MbwM8AnWn7KVqgLTjydxEXmqIfgYldAK5K9LxU7B/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373857; c=relaxed/simple;
	bh=zIPH8/H9AStJJGlRTtV7zh9GtQETyOYe5UASaKotWZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VA3Ug0hwN432AErL7PZZ3gsYR/EEfrASnQT3mvNeyIlPbPh4fh1UNe3LQHBk7t/N48i3zO+7bkwziTzjJINNrPzJsUzAedpZ5wro8cBI7rpdh1zL4Lmz+XLlOC9CLPNpInXE4X9HWmy8Xa1MPFfMizJFYURIesRxRphmYBmzhZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSMuIqlp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSMuIqlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5276E1F000E9;
	Mon, 10 Aug 2026 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786373854;
	bh=WyOLzU/bme+WKBvI9cI1IWD0TQ8JmMrPBozVSU3K9Tk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TSMuIqlpcV8SNSa+p+clZvul7DDYK7ZYtMAcNebwdGxbzQEwBoguMbMUXIJgfu7JL
	 2NRK7+QpKqsb9+coXxpMUpvCNurRl6i/xeA3ulMJjMbn/+CcqsSyRIZvVOevpOjr+r
	 1ULDjp196A3j26KP2ETaTPmdlxmrgyJuiorkpRKgqBzuL1KgU9+C7ZDGrUGOYOvZLI
	 tNA6Xh6P626v0j2Jh8H2r6T50r036qagXBXIT3YaSunKjRvC1LOmyLlV207ANaAD0J
	 ek7xaLzgWpngWwH3xYzpEe0gAzzYcXwtzTyJRmuWcKuiDo08bZvrQvHfgSlJMlAtZ3
	 RP5LRBJLJN8dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] PM / devfreq: add Airoha SoC devfreq driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260810143057.651478-2-ansuelsmth@gmail.com>
References: <20260810143057.651478-1-ansuelsmth@gmail.com>
 <20260810143057.651478-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:57:33 +0000
Message-Id: <20260810145734.5276E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The driver is missing the `MODULE_DEVICE_TABLE(of, ...)` macro f=
or its OF match table, preventing automatic module loading.
- [Medium] The `airoha_devfreq_target` callback fails to resolve the reques=
ted frequency to a valid OPP and does not update `*freq` with the actual ap=
plied frequency.
- [Low] Multiple function definitions end with an illegal trailing semicolo=
n.
--

--- Patch [2]: [PATCH 2/2] PM / devfreq: add Airoha SoC devfreq driver ---
commit 541990b8210ffb6d5026b9bcd5630443b99f63ec
Author: Christian Marangi <ansuelsmth@gmail.com>

PM / devfreq: add Airoha SoC devfreq driver

This commit adds a simple Airoha SoC devfreq driver. It registers a
passive governor to scale various internal peripheral clocks based on
the CPU frequency requirements.

> diff --git a/drivers/devfreq/airoha-devfreq.c b/drivers/devfreq/airoha-de=
vfreq.c
> new file mode 100644
> index 0000000000000..cb6d8b49e4a40
> --- /dev/null
> +++ b/drivers/devfreq/airoha-devfreq.c

[ ... ]

> +static int airoha_devfreq_get_cur_freq(struct device *dev, unsigned long=
 *freq)
> +{
> +	struct airoha_devfreq_data *data =3D dev_get_drvdata(dev);
> +
> +	*freq =3D clk_get_rate(data->clk);
> +
> +	return 0;
> +};

[Severity: Low]
This isn't a bug, but should this function definition end with a semicolon?

> +
> +static int airoha_devfreq_target(struct device *dev, unsigned long *freq,
> +				 u32 flags)
> +{
> +	struct airoha_devfreq_data *data =3D dev_get_drvdata(dev);
> +
> +	return clk_set_rate(data->clk, *freq);
> +};

[Severity: Medium]
Does this function need to resolve the requested frequency to a valid OPP
and update the freq pointer with the actual applied frequency?

If the governor or PM QoS requests a frequency that doesn't exactly match
an OPP, applying it directly without resolving (e.g., using
devfreq_recommended_opp) leaves the unrounded frequency in the freq pointer.

The devfreq core tracks frequency statistics using exact matches against
its freq_table.

Won't this cause devfreq_get_freq_level() lookups to fail
in devfreq_update_status(), resulting in spamming the kernel log with
'Couldn't update frequency transition information' warnings?

Also, similar to airoha_devfreq_get_cur_freq(), this function definition
has a trailing semicolon that can probably be removed.

[ ... ]

> +static int airoha_devfreq_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	return PTR_ERR_OR_ZERO(devfreq);
> +};
> +
> +static const struct of_device_id airoha_devfreq_match_table[] =3D {
> +	{ .compatible =3D "airoha,devfreq" },
> +	{}
> +};

[Severity: Medium]
Is this missing a MODULE_DEVICE_TABLE(of, airoha_devfreq_match_table)
declaration?

Without it, the modpost tool won't extract the compatible strings to
modules.alias.

Will user-space module loaders be able to automatically load this driver
when the hardware node is detected during boot or hotplug?

> +
> +static struct platform_driver airoha_devfreq_driver =3D {
> +	.probe		=3D airoha_devfreq_probe,
> +	.driver		=3D {
> +		.name   =3D "airoha-devfreq",
> +		.of_match_table =3D airoha_devfreq_match_table,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810143057.6514=
78-1-ansuelsmth@gmail.com?part=3D2
