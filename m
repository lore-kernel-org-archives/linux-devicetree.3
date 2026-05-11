Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A8632143D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543279; cv=none; b=KsdEV9OweZ7NzmfzLYINqpfMo2HzP2sZruPcOouQzxa0bMZNvOopb2N5d4Js8uGyGropNskuRlzCSXDQNwdo7QTzvpMaKsfDhGLPMSUmvHHSP8Lm29IoRXV54n9PWgvc9KLFZ3Tt4avIvirgtXuYGh6WGmxG+2f/x9I7HIvISow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543279; c=relaxed/simple;
	bh=aLHYNln/Ajdw8CYerXOAyn0/7QSRwQZBG5AJ1NzmIT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IZ5HyL64NIWblE3SfmBOe2KUoU79/GlSlk24Og7VODkgr8wXd2d6MWDVSR2c23x/AMld9lZoGnUr9eSmIai4vfMq6wMvGKla7tmVUZr0SUPkBghWDN1EkmxaeiDVcEq5P+bh5xAFEgtWWBmmpzkcbggPMIPTIBCjr7KL1S6uxnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP2zv5wT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP2zv5wT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C022C2BCB0;
	Mon, 11 May 2026 23:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778543278;
	bh=aLHYNln/Ajdw8CYerXOAyn0/7QSRwQZBG5AJ1NzmIT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WP2zv5wT0De0CG9ojYsiykYhFDgtoS4osdxQH7f8xa3nrxHKK8eOFUpqivW31/WYg
	 zV9x03Fm8zkzi6GB74sEJhW+6tya5fYEatvJFbTxAJKNiVB2oU0izr06NM9Q/s+dQv
	 f9tkvheC+RlkDWsc/vlgueP8khhTNsT3ZTu6BlE926HDS3wo4PZmPxs50I7WU3Ldis
	 r+vBUmyeso/Q5KWfudDRHgIJwSDndNJIWhKDLk/YnZw2VORU1YySNTbGZUh3Z7CIbI
	 4OcI87VVtqzKKs/33dzSiW+/yYkBUPvVxUwPKXvSwCH5gFfvj5xgnD0PJCxyj7PonR
	 AL+ii0OVDo51g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock
 initialization
Reply-To: sashiko@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510084303.122426-8-phucduc.bui@gmail.com>
References: <20260510084303.122426-8-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:47:57 +0000
Message-Id: <20260511234758.6C022C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The return value of `fsi_clk_init()` is ignored in `fsi_probe(=
)`, which breaks probe deferral and leads to a kernel panic from dereferenc=
ing error pointers.
--

commit 055b3b167e655ece1592450b8baaea9abe771d10
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: refactor clock initialization

This commit moves fsi_clk_init() to probe and uses devm_clk_get_optional()
for optional clocks. It allows probe to succeed when optional clocks are
missing, while set_rate() validates clock availability.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 55a11f1fe8aa1..8c46d68069581 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
[ ... ]
> @@ -973,35 +983,42 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
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
>  	clock->own =3D devm_clk_get(dev, NULL);
>  	if (IS_ERR(clock->own))
>  		return -EINVAL;

Does returning -EINVAL here mask probe deferral? If devm_clk_get() returns
-EPROBE_DEFER, returning -EINVAL will permanently fail the driver probe
rather than deferring it.

[ ... ]
> @@ -1997,6 +2001,7 @@ static int fsi_probe(struct platform_device *pdev)
>  	fsi->running_streams =3D 0;
>  	fsi_port_info_init(fsi, &info.port_a);
>  	fsi_handler_init(fsi, &info.port_a);
> +	fsi_clk_init(&pdev->dev, fsi);

Is it safe to ignore the return value of fsi_clk_init() here?

If devm_clk_get_optional() fails and returns an error pointer like
-EPROBE_DEFER, those error pointers will be stored in the clock fields
instead of NULL.

Later, when fsi_clk_set_rate_external() checks if the clocks are missing:

    if (!xck || !ick) {

This check will pass because the error pointers are not NULL. The error
pointers will then be passed to common clock framework APIs like
clk_get_rate(), which will dereference them and cause a crash.

Should the return value of fsi_clk_init() be checked and propagated?

>  	ret =3D fsi_stream_probe(fsi, &pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "FSIA stream probe failed\n");
> @@ -2011,6 +2016,7 @@ static int fsi_probe(struct platform_device *pdev)
>  	fsi->running_streams =3D 0;
>  	fsi_port_info_init(fsi, &info.port_b);
>  	fsi_handler_init(fsi, &info.port_b);
> +	fsi_clk_init(&pdev->dev, fsi);

Would the same return value check be needed here as well?

>  	ret =3D fsi_stream_probe(fsi, &pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "FSIB stream probe failed\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.1224=
26-1-phucduc.bui@gmail.com?part=3D7
