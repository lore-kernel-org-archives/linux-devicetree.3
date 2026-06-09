Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E0A3AD516
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006221; cv=none; b=nA19Ak8s7ypi4gfGECRLwHjg6W5sGW/YDLj2VyHk4RFXBXvGiWjVxjLTXuSUqKIVKXDaasb7AuMRFRlbY7u7OVVRn/4nezOk+gwqGKczlnQ5xWEMVybxGv49WUwmchfpJQMyA5K2FozpaN9Q8p+e93TAHfJxFemo34H8Zij1qKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006221; c=relaxed/simple;
	bh=2qNZ9/EREf5huFGQvULUo1ALQ1F0LYNPWUwvvCP/u7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sTRWXAr+v2pZi5hcWP0tANWxnm+eIzeg/7OanNSR0ALrrjDi2RGdrTS0spy3r5fp2yj0E+PXJvCPxEaLHTwJl2oayL4F/ZVYMxsrd1Js5nb0dLqXgP9xObr4SCAuhZZ2rq4xAtAx75EzMDPJpaY7HcV91LhHm/Bb1JcxfRq0PqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmFzgNAu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmFzgNAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C131F00893;
	Tue,  9 Jun 2026 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006220;
	bh=YlMQ1fV054oLwmAsy6cLe+Fev85SEGhDFUGdLR3HnNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmFzgNAuwd587Imk0tIOCXAyOqPPMGXQGL0NN9AMeQWhqB3Cr+cZUWE+4VSoqYH0U
	 v4IOAh5kag+A/f/bmYbcldSxfkAuD5gEK9ZMGff3puDPUoTYKHaRKJB0gwna4sPUbi
	 8qEJoJVrtGOtGOOnxIUHHnOkaSXhGYA+F7z5+C5/b7LqLnxLEyh9z21pLgXV4yUeeY
	 5ptZZA35jimIzMFWgKVOWm4huj5433mq8QPC0LQ8BE7/z1dgEHrZDyYYVDCXFbNPmS
	 li7klHYhfyfIrkpBF3z5e0xQxlRfk5+Hp3RRR0QMrLwkK+i2Idzn4Ai8iJSJE8Wb0E
	 y8im9FZcPYNag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/11] ASoC: renesas: fsi: Use
 devm_clk_get_optional() for optional clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609113836.45079-8-phucduc.bui@gmail.com>
References: <20260609113836.45079-8-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 11:56:57 +0000
Message-Id: <20260609115659.A4C131F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] fsi_clk_enable() returns -EINVAL when called on an already enabled=
 clock, breaking full-duplex operation.
--

commit e751270870bfce8cae5b9b1175c1bc9e265d605e
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks

The xck, ick, and div clocks are optional. Switch from devm_clk_get()
to devm_clk_get_optional() to correctly handle cases where these clocks
are missing.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 1df7dc0143630..e29be2bcf952c 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -994,7 +994,7 @@ static int fsi_clk_init(struct device *dev,
> =20
>  	/* external clock */
>  	if (xck) {
> -		clock->xck =3D devm_clk_get(dev, is_porta ? "xcka" : "xckb");
> +		clock->xck =3D devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
>  		if (IS_ERR(clock->xck)) {
>  			dev_err(dev, "can't get xck clock\n");
>  			return -EINVAL;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing these
clock changes, I noticed a pre-existing issue in fsi_clk_enable().

sound/soc/renesas/fsi.c:fsi_clk_enable() {
	struct fsi_clk *clock =3D &fsi->clock;
	int ret =3D -EINVAL;

	if (!fsi_clk_is_valid(fsi))
		return ret;

	if (0 =3D=3D clock->count) {
		...
		clock->count++;
	}

	return ret;
}

When a second stream starts on the same port (for example, capture starting
while playback is already running), count is 1. The code skips the
(0 =3D=3D clock->count) block and returns the initial ret value of -EINVAL.

Does this break full-duplex operation by causing fsi_hw_startup() to fail
when starting the second stream?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609113836.4507=
9-1-phucduc.bui@gmail.com?part=3D7
