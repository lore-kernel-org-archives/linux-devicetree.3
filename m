Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435959D608
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655973; cv=none; b=Ut09/PpS/y2afDxhDfJ1KdSqceWhKICQZTUxoRisf+OQ5QgkRYNCS8q20sSVtMkz3EHhuMZwo5AGAGFNIbJNqDfKXsHHpTv8k1hQZFQjrK3FGDb+sZKnq2VE0m29r3yu+uJly2/tDJEg9TOuNVixIS6w0ePtPSjRpyfwoFosAf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655973; c=relaxed/simple;
	bh=rJ+WErAIsAF2Kzs1qzQvWZ+cwCjBo61OSPXtvBzmHuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kcz0DdFhtXz0QqQ/lVW7s/6HqUvdhHuf9OkmxoMH21lLQd8SpyEAJjPNl/46VGqZfTa+ccBUslcHe6kgbAOrjJ+B7ySKNwY3wixMV6YCxY91CEM/cKFArmQJplWISsdGLm4RvBLGNmphRiwVeLzvYdJg7URr/jD1fxeKzr/mNYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUEUBKE0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUEUBKE0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0CE1F000FF;
	Thu, 17 Sep 2026 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789655964;
	bh=jT6OIBbeFcVHwJhAaYJ7hDuxIPl6QO9OHRP7Xro7Xg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LUEUBKE0Kqa8B4NLxN5Snfrg4OZWpwe8DwKgDOEKKnZuj94lyuoDoCsrMeWLWGeZm
	 BC6/GjRNMv2F4uc+WVew+KOZwcTVIZLsCE8U5OF7y8Qi1ui1UXHpDP80xJv6CFKB9s
	 uOjriJ41pOdEfF1QErOesdqLZxBtI9PutIjmE9XD532AH1D39sd682bOE7fuHwoWZH
	 Lju4V18/dPbT5vnZe+qjtDqTceKJQSGnVRCr1Eid/UCwMhlEcyWkk34go1yG7PWNwe
	 sA0J2s0sWNFEocuBa8jfz1gii7Mb3ad0Tk5ePV76G2/I3EgNysRlYDFQhGnLEbmW7m
	 f7obrKp+5fPLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] spi: sg2044-nor: Honor SPI clock limits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Han Gao" <gaohan@iscas.ac.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917-fix-sg204xspi-v1-2-5c95dac429a8@iscas.ac.cn>
References: <20260917-fix-sg204xspi-v1-0-5c95dac429a8@iscas.ac.cn>
 <20260917-fix-sg204xspi-v1-2-5c95dac429a8@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 14:39:24 +0000
Message-Id: <20260917143924.8E0CE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: sg2044-nor: AB-BA deadlock between spifmc->lock and CCF prepa=
re_lock
--

commit fd13672e4c9fa0fb60925d0020a99edbeb412a79
Author: Han Gao <gaohan@iscas.ac.cn>

spi: sg2044-nor: Honor SPI clock limits

The fixed divider ignores device and operation clock limits. Calculate
the divider before each transfer so SCK does not exceed either limit.

> diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
> index ff026ca0f7663..f2a1074f68477 100644
> --- a/drivers/spi/spi-sg2044-nor.c
> +++ b/drivers/spi/spi-sg2044-nor.c

[ ... ]

> @@ -385,6 +385,29 @@ static ssize_t sg2044_spifmc_trans_reg(struct sg2044=
_spifmc *spifmc,
>  	return 0;
>  }
> =20
> +static int sg2044_spifmc_set_speed(struct sg2044_spifmc *spifmc,
> +				   unsigned int speed_hz)
> +{
> +	unsigned long rate =3D clk_get_rate(spifmc->clk);

[Severity: High]
Does this sequence introduce an AB-BA deadlock between the local hardware=20
lock and the global Common Clock Framework prepare_lock?

In sg2044_spifmc_exec_op(), the data-plane hot path for SPI NOR transfers=20
acquires the local lock:

    mutex_lock(&spifmc->lock);

It then calls sg2044_spifmc_set_speed(), which unconditionally queries the=
=20
clock framework here via clk_get_rate().

Under the Common Clock Framework, clk_get_rate() acquires the global=20
prepare_lock mutex. This creates a lock hierarchy inversion. If a thread=20
holding prepare_lock (e.g., during clk_prepare() which may require=20
firmware or trigger a page fault) requires a read from the SPI NOR flash,=20
it will block waiting for spifmc->lock. Concurrently, an SPI NOR operation=
=20
holding spifmc->lock will block waiting for prepare_lock.

Additionally, repeatedly acquiring a global subsystem mutex in a hot data=20
path can cause severe performance bottlenecks for clock operations=20
system-wide.

Could the clock rate be cached during probe() instead of querying it per=20
transfer?

> +	u64 div;
> +	u32 reg;
> +
> +	if (!rate || !speed_hz)
> +		return -EINVAL;

[ ... ]

> @@ -395,11 +418,18 @@ static int sg2044_spifmc_exec_op(struct spi_mem *me=
m,
> =20
>  	mutex_lock(&spifmc->lock);
> =20
> +	ret =3D sg2044_spifmc_set_speed(spifmc, op->max_freq ?
> +				    min(op->max_freq, mem->spi->max_speed_hz) :
> +				    mem->spi->max_speed_hz);
> +	if (ret)
> +		goto out_unlock;
> +
>  	if (op->addr.nbytes =3D=3D 0)
>  		ret =3D sg2044_spifmc_trans_reg(spifmc, op);
>  	else
>  		ret =3D sg2044_spifmc_trans(spifmc, op);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-fix-sg204x=
spi-v1-0-5c95dac429a8@iscas.ac.cn?part=3D2
