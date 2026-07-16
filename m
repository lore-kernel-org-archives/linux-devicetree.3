Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06163BD643
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240778; cv=none; b=heKECl+zZAzkT3O7Co/v4L0g4saf/5cKex5Mhgt135lSQ4qSdl3OD562THCMZ4lN/+LnvSXsWpZFPoB4ROwn4dwx+7lHnuRyVXNzeRbdn6iqc4Tq+ccaoq4/3Gq6dhczjppBF5dWhiV4j5MfU14o/e02/onlEeeFALChYrGmRoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240778; c=relaxed/simple;
	bh=iPbVI9GPwrzRFsiKQe9ExVHN8M5GCBGQD8DzBEEiELA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d3mzuagmhD8PgbkYh3edJFxWAqr3U2yOMzAU1a/+AMMX1DQV8s+7UOa42OhJdSSaH2MpUoi7TQizlkdaWB51Dw+GWWzdZrkpDC1SbmQ6UVUCsTdoN6hmNncuimuxiu8ZlcP39gcQKRtwHvdTZqPzAaClaBhlPX31c3N995wD7XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELwnmHVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELwnmHVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8612B1F000E9;
	Thu, 16 Jul 2026 22:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784240777;
	bh=3+LM7zpoT/B9K90aIiX++aRa/GvaKYwxj0Y2NjRnwGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ELwnmHVcKdjWEteeVd5ofcF02t6OGAAprHZ1+uxZvEcFaOsQMkK722RNCWQbpIgei
	 gzo3eoeDwoGV4wNta4/pa4qdj/IWUA5G2aw+9xEq5aUeJeddsxM19xEjnbq5MlR2LD
	 lqWfXG0KAuHuJD4lOfuo2QkWUOv02YxL1plDEEvWFeRLcAqvDGxyACvuHE30puyMJs
	 bVTIQ0nkRxLmjO6RIhqAeBsKLxCB5q5I75ZWUdbJkhXmu8AcqnNRRLcGp6A+CWTEuR
	 2PCvLIa79Qhd4azP1elztNCJ4zpOmMeO8/wNKHH9x5gQHd6DEP3e/ZXJC1TOkc/9RS
	 1twMD58qmQNtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/13] clk: zte: Add Clock registration
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
In-Reply-To: <20260717-zx29clk-v7-6-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-6-408411cfcf36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 22:26:16 +0000
Message-Id: <20260716222616.8612B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] In `zx_clk_common_probe()`, the error path for `data->init(map)` i=
ncorrectly returns `PTR_ERR(clk)` instead of propagating the actual error c=
ode `res`.
--

--- Patch [6]: [PATCH v7 06/13] clk: zte: Add Clock registration infrastruc=
ture ---
commit 377a6af7769b840d87a85b32af3001fd5f4431dd
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add Clock registration infrastructure

This commit adds the common clock registration infrastructure for ZTE SoCs.
It includes support for registering PLLs, muxes, dividers, and gates using
regmap, and introduces a common probe function to initialize them.

> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> new file mode 100644
> index 0000000000000..db4fad2b4b056
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
[ ... ]
> @@ -0,0 +1,155 @@
[ ... ]
> +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> +			const struct zx_clk_data *data)
> +{
[ ... ]
> +	if (data->init) {
> +		res =3D data->init(map);
> +		if (res)
> +			return dev_err_probe(dev, PTR_ERR(clk), "Controller init failure\n");

[Severity: High]
Does this code pass the wrong error code to dev_err_probe() in the
zx_clk_common_probe() error path?

When data->init(map) fails, it returns a non-zero error code into res.
However, the error handling block incorrectly evaluates and returns
PTR_ERR(clk).

Since clk is merely an iteration variable from the preceding loops, it could
be completely uninitialized if num_inputs_enable and num_inputs are 0, which
might trick the driver core into assuming the probe succeeded despite
initialization failing.

If the loops did execute successfully, clk holds a valid pointer, and
PTR_ERR(clk) will return a random large number depending on the pointer's
memory address, resulting in a meaningless error code.

Should this return res instead of PTR_ERR(clk)?

> +	}
> +
> +	res =3D zx_clk_register_plls(dev, map, data->plls, data->num_plls);
> +	if (res)
> +		return res;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-zx29clk-v7=
-0-408411cfcf36@gmail.com?part=3D6
