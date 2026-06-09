Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3F636AB57
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006783; cv=none; b=JuKNbqPQ2aqMmuxTCmQ+wPlc5J4RxDbtJDMz9eSTId0ik2r3NqUNm+e8GMNWD0dsgrnBxdk4QJeLtts7yXEnFb+JPgKzPfnExKTLcpHGqDu9T1xDz7JstP65DWaBdzW/ALmly0cCH8m5nDuJawB8nH4KNbdryAf2Hur2QnqUHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006783; c=relaxed/simple;
	bh=d5QvaMyxfWgfoKJ6waLe9+MPbMokCIoO+JtB4Vbd7No=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s/VQRUNM8c/pWndg+iXnQiAJtN0q088C+e99vqnwHD29//FFOV2eKRMKdLANzq25gk0WfRwF5240nm+a0cI7k3cRJ+XwWcMf6jp1lFR6slnEVpCfRzEE1YrbY1hHVptpQMIplDQcBg2O6w4Y5cddWvjIjZnzfKhDxKPbivdoKNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AO7rgGCQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AO7rgGCQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386C31F00893;
	Tue,  9 Jun 2026 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006782;
	bh=i/U0XvfGiSO1ZfUrUaA7OKsJqRrGZ0sgPaV0zMFZ658=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AO7rgGCQHmcUV1EtvikPjiraXEbwX5+orpeEYwR9kiUHLWcqtoTGEDBF8V3GNHNWx
	 xsa8emVno3uSbmkX9Xk3vwf9LPy+j03m4Eie5INcUP8h7r9rDi9nqhkxZf3LqRkBv7
	 MdTUS38W4S8UKqqq2BDq2hgPzBp9chzwe9tUm+yEFfdNXkfSd0IfkPlicvT3BkyWZA
	 nEhMnKEFGu22ZB7iobt3YL7mfzaZ0RZV3KmPDshi6vBFu+ymnaYKYyBy9j/Imk+jPs
	 O1GVEiuWA3k9XuXaJHJ1G/Pz3189ICKI7f4hK5PCzpM0l7m2w34dtlB5VrvCLccfrS
	 m4LjjyCnIJWtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/11] ASoC: renesas: fsi: refactor clock
 initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260609113836.45079-9-phucduc.bui@gmail.com>
References: <20260609113836.45079-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 12:06:21 +0000
Message-Id: <20260609120622.386C31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unconditional clock initialization during probe breaks the driver =
on slave-only platforms due to clkdev fallback.

Pre-existing issues:
- [High] Logic error in fsi_clk_enable() prevents concurrent playback and c=
apture streams.
--

commit 83020abc14f73339100e18d0f7451918e1591b37
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: refactor clock initialization

Move fsi_clk_init() from set_fmt() to the probe path to ensure that clock
resources are acquired only once during device initialization.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index e29be2bcf952c..43bc77ebcca39 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
[ ... ]
> @@ -970,35 +980,35 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
>  	return ret;
>  }
> =20
> -static int fsi_clk_init(struct device *dev,
> -			struct fsi_priv *fsi,
> -			int xck,
> -			int ick,
> -			int div,
> -			int (*set_rate)(struct device *dev,
> -					struct fsi_priv *fsi))
> +static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
>  {
[ ... ]
>  	/* external clock */
>  	if (xck) {
>  		clock->xck =3D devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
> -		if (IS_ERR(clock->xck)) {
> -			dev_err(dev, "can't get xck clock\n");
> -			return -EINVAL;
> -		}
> +		if (IS_ERR(clock->xck))
> +			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n=
");
>  		if (clock->xck =3D=3D clock->own) {
>  			dev_err(dev, "cpu doesn't support xck clock\n");
>  			return -EINVAL;
>  		}
[ ... ]
> @@ -1672,15 +1678,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai=
, unsigned int fmt)
>  		break;
>  	}
> =20
> -	if (fsi_is_clk_master(fsi)) {
> -		if (fsi->clk_cpg)
> -			fsi_clk_init(dai->dev, fsi, 0, 1, 1,
> -				     fsi_clk_set_rate_cpg);
> -		else
> -			fsi_clk_init(dai->dev, fsi, 1, 1, 0,
> -				     fsi_clk_set_rate_external);
> -	}
> -
>  	/* set format */
>  	if (fsi_is_spdif(fsi))
>  		ret =3D fsi_set_fmt_spdif(fsi);
[ ... ]
> @@ -1978,6 +1975,11 @@ static int fsi_probe(struct platform_device *pdev)
>  	fsi->master	=3D master;
>  	fsi_port_info_init(fsi, &info.port_a);
>  	fsi_handler_init(fsi, &info.port_a);
> +	ret =3D fsi_clk_init(&pdev->dev, fsi);
> +	if (ret) {
> +		dev_err(&pdev->dev, "FSIA clk init failed\n");
> +		return ret;
> +	}

[Severity: High]
By removing the fsi_is_clk_master() check from fsi_dai_set_fmt() and calling
fsi_clk_init() unconditionally here during probe(), does this break the
driver on slave-only platforms?

On older platforms using clkdev, looking up missing optional clocks like
xckb or ickb can trigger a fuzzy-match fallback to the device's main
functional clock. When devm_clk_get_optional() returns this fallback clock
instead of NULL, the check in fsi_clk_init() for (clock->xck =3D=3D clock->=
own)
evaluates to true and returns -EINVAL.

Since fsi_clk_init() is now executed unconditionally for all ports, will th=
is
cause legitimately configured slave ports (which lack explicit master clock=
s)
to fail probe entirely?

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the clock
handling, I noticed a pre-existing issue in fsi_clk_enable() that prevents
concurrent streams:

sound/soc/renesas/fsi.c:fsi_clk_enable() {
        int ret =3D -EINVAL;

        if (!fsi_clk_is_valid(fsi))
                return ret;

        if (0 =3D=3D clock->count) {
                ...
        }

        ...
        return ret;
}

When a second concurrent stream starts (for example, capture during
playback), the function skips the if (0 =3D=3D clock->count) block. Because
ret is initialized to -EINVAL, the function incorrectly returns -EINVAL
instead of 0.

Does this cause fsi_hw_startup() to fail and abort the stream trigger,
permanently preventing full-duplex operation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609113836.4507=
9-1-phucduc.bui@gmail.com?part=3D8
