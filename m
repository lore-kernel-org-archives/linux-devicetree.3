Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC003AE6E9
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446235; cv=none; b=UEi65ix9E4TH62QXzWMfUFPZ4iDFrmE88QkKOOzkMENyFtZo3J26b/LbLUaGQzMVstm4sVZj1ECPp+WnxfkonEcOYltrUBeJxHVO7IqElTaorDidQOnOZFUcLvqqxLtzl/WpA1CpCEQ+H26nvLjxmHnvyIsFdLB4l9aA/v/VK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446235; c=relaxed/simple;
	bh=qpo/kTmsOeJRBlPiz+ct1HqTAZB5B8r6/dTcHFDbM7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E/TWztY9rx31NuZ1rcoT49p4nGddGOYFswndIYOzWRwZAJo6syx64WsjIg48w6xg4bnc/6ZxYbuHOagSc9rx80YTK0E6y/EZcG3qHxoRIoKsMqQdBul8nwNIrrdZvGfnMlayfW3X+1w09huN0J3UuFqWS8GZXg8RESCNfhxEzt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9EQqbA8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9EQqbA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C09D1F000E9;
	Fri, 22 May 2026 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779446233;
	bh=PA9jpI/j8UAVj7kd5UtZzi6Aod3S6A+P1N1lXZsP0zY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q9EQqbA8xfGS1eFBCoZawR/u5VWUOKyjmacCjq9RBREFrL2eWKT0ihTnQJsOAxXaq
	 d1IyuLL0q04phCyZFybVUIu1sYfm1d7PkQpqSchllBkPUbBuh1/TIg1wDfpj0DRnln
	 o1xcbrjpQIk2oCRawU8EUHTb2J/Nb3TwSvMCgd5zAfIgQX34mvQRHiN8q+uwEQq2lY
	 lzh14QCuWcV4nScwkXnY79p8HRfeMhaXjEe1l86Mv6peEsIvJhvxXJLyB8PWG8UG03
	 BYCd3JqYTCUZ6PB+7YyrwSQYbufJnKVKBzIZac19D+AckhTEechJShoJ5C5MNoc8D9
	 BH5str3Z04CbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ASoC: rockchip: spdif: Reorder clock enable
 sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260522100318.73474-3-phucduc.bui@gmail.com>
References: <20260522100318.73474-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 10:37:13 +0000
Message-Id: <20260522103713.6C09D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Failure to restore regmap cache-only state if `regcache_sync()` fa=
ils during runtime resume.
--

commit 517eeaafec0deb4d7a25eb1c2641316c2b2e2b72
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: rockchip: spdif: Reorder clock enable sequence

This commit reorders the clock enablement sequence during runtime resume.
It ensures the bus clock (hclk) is prepared and enabled before the
controller clock (mclk) to guarantee proper register access.

> diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/roc=
kchip_spdif.c
> --- a/sound/soc/rockchip/rockchip_spdif.c
> +++ b/sound/soc/rockchip/rockchip_spdif.c
[ ... ]
> @@ -76,16 +76,16 @@ static int rk_spdif_runtime_resume(struct device *dev)
[ ... ]
> -	ret =3D clk_prepare_enable(spdif->hclk);
> +	ret =3D clk_prepare_enable(spdif->mclk);
>  	if (ret) {
> -		clk_disable_unprepare(spdif->mclk);
> -		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
> +		clk_disable_unprepare(spdif->hclk);
> +		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
>  		return ret;
>  	}
> =20
>  	regcache_cache_only(spdif->regmap, false);
>  	regcache_mark_dirty(spdif->regmap);
> =20
>  	ret =3D regcache_sync(spdif->regmap);
>  	if (ret) {
>  		clk_disable_unprepare(spdif->mclk);
>  		clk_disable_unprepare(spdif->hclk);

[Severity: High]
This is a pre-existing issue, but is the regmap cache-only state left
unrestored on this error path?

If regcache_sync() fails, the driver disables the clocks and returns an err=
or.
This causes the runtime power management core to leave the device in the
suspended state.

However, the error path doesn't appear to restore the cache-only mode via
regcache_cache_only(spdif->regmap, true).

If a subsequent register read or write occurs while the device is in this
suspended state, could the regmap bypass the cache and attempt a physical
memory-mapped I/O access?

Since the generic power domain would be powered off when suspended,
attempting this access might trigger an asynchronous system error or
synchronous data abort.

>  	}
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522100318.7347=
4-1-phucduc.bui@gmail.com?part=3D2
