Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7747DF93
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017851; cv=none; b=DZsAPdqBCp1at+iX/a0QYTyf6iKRmLGsk9HmbUJshmGmDFB1KKaE7QQYEsSYN4TKTmqtJ96jY9B32ncZpA+a2ZDydlPdlKbMeh840MdLOMcV9x/B4z8Cx6TSaS7DkgWuGlDPT2XlpLyIFoND8ieTIJlxg6r+3MV0guDLhFosUGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017851; c=relaxed/simple;
	bh=gq+kHulOLR4dgbBisQ7GLSOnoecgd20i/IUmxCEUPBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=st5pgBnB3+kHTrDIw7iLvWzV16/HPsB1JQL2MSF14HaaR8lD/d+Etfa2yxxfXjjVUkZUTCSrF82gUGjz7FDmwKZxDhs7hHbRpqev3PwURAXPRjJuqlnoaors6UuZBxXoTymCZ2mOdA0RwnSPJgwPkBabiDSU+X/S2UwZlQxbvko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhVWUjg1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhVWUjg1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C734B1F00893;
	Tue,  9 Jun 2026 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781017847;
	bh=Eo7AWma7mk2Vl8YN8s2RkgOWU2F/he64LpJPJubmP6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KhVWUjg1Dw7PfR/tkIhIjwRR5LrlcSV34GpkcAHKkjQKoWd+oiqDvDr5a2PhtBPUE
	 0e6n6mm2VyNPCe4B3uKgnTU6iqqv9m+q8zAZ7iBJ7ws+95ruPiazTa5A6cDj0t7j9m
	 w3Ai/7FhpdhecmoabVk6j1/sf5K6FDE9TslIgXFhUnoTsevXgxIBfdoRz7belJqRjQ
	 5cCx39jrU0zW4Vi84G0WeB+I0GN/PUpbbiCnd4qM6t41AJfYarD4YDI7+Ngkd/A4Sy
	 Z6m+ULcAgk3eOqUb3NyIBU0Sr9cKGinETOBgZc9Z3pwtU777s7XSQnsAl2haQXs+Vj
	 Qz852ORPXuF2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-ad5529r-driver-v4-2-2e4c02234a1a@analog.com>
References: <20260609-ad5529r-driver-v4-2-2e4c02234a1a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 15:10:46 +0000
Message-Id: <20260609151046.C734B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The hardware reset logic fails to guarantee a reset pulse and skip=
s software reset, breaking module reload.
--

commit e9e9fe5da17e349af411f3cecc999fcff44de1e2
Author: Janani Sunil <janani.sunil@analog.com>

iio: dac: Add AD5529R DAC driver support

This commit adds driver support for the Analog Devices AD5529R 16-channel,
12/16-bit DAC. It provides basic IIO voltage output capabilities and suppor=
ts
configuring output ranges.

> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> index 0000000000000..d2d0287d0f951
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c

[ ... ]

> +static int ad5529r_reset(struct ad5529r_state *st)
> +{
> +	struct reset_control *rst;
> +	int ret;
> +
> +	rst =3D devm_reset_control_get_optional_exclusive(&st->spi->dev, NULL);
> +	if (IS_ERR(rst))
> +		return PTR_ERR(rst);
> +
> +	if (rst) {
> +		ret =3D reset_control_deassert(rst);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret =3D regmap_write(st->regmap_8bit, AD5529R_REG_INTERFACE_CONFIG_A,
> +				   AD5529R_INTERFACE_CONFIG_A_SW_RESET);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does this code ensure the device is actually reset on driver reload?

If the driver is unbound and rebound, the hardware reset line might already
be deasserted. Since reset_control_deassert() is called without a prior
assert, and there is no teardown action registered to assert the line on
unbind, will the device fail to receive a physical reset pulse?

Because a hardware reset control is present, the software reset in the else
block is also skipped. Could this combination leave the device in an
unpredictable state on subsequent probes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-ad5529r-dr=
iver-v4-0-2e4c02234a1a@analog.com?part=3D2
