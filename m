Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946644210C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384665; cv=none; b=ajI7l/O05TKzyc9NUfAkydmiuJvkJV/JU2BnHC9GKrpiKiaxLf4F2VlC2vbj3DSPx1KzjJP4TSVVgNYpjX4zaxcr4xD5aAAxaTyuGk6uEe1hjBqikWIte5hjo74aiFF4TiGFNvNbYpKd1xgbDzM/cWFhb0C1jL6OhwgYSIiK3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384665; c=relaxed/simple;
	bh=QijqS+vA0Vu/uuPBC5cmN2une4Npr4tiRLZccoLFUwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aqmylyyvVpCYsABGIXvLXNanNBXlhRVNT2AzA+TO9A6AbvYkhKZy9yFeO9wkDLWzPfG780Kv3vZuY0v7CeHIUOlkD7nGx6DRi2jq8ECq0oESAOLVUmj3F58r9idkDCw3fmE0UDvE7e3Q1pM4GMjUudN7FMGerqixy1F+yRKi7Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfSEe/AF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfSEe/AF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BF01F000FF;
	Mon, 14 Sep 2026 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789384662;
	bh=ys+1/fFhHbBpH6olUBZX4gCT1LubsZygBC2TBQSgFzc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DfSEe/AF8c+igybd+7y7bHCJLJ7sKNuPvsNjMCkzMBrZo2JWbJYxWuSgbW7CZ1KuH
	 G3qd6pDvrfzn9rMZnThh3xGAED3ZRnQQnt7aniWLi7AID6QCB0pLrPve2ChaYJwvvE
	 tOoaAZBaXu4T3NqoChdrOB9fKyiV6xOl3C31+18ZKgpm0wXjB32ZA6aOaiu4GigOkV
	 /z8AWF5Gmx+IWaev592oSCX2MJeDE4swnDCa2Nl/7MZtwGIXqyQ3q74mM3sWvkd0nk
	 Nd4kinFr40TiMYvpFbe8Khwox3xOpyZM9724xMsc/wp98cIFfoND6Ms/lfrw1vkhKf
	 6GE5bCfjYVNTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914110739.203479-3-cwweng.linux@gmail.com>
References: <20260914110739.203479-1-cwweng.linux@gmail.com>
 <20260914110739.203479-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 11:17:42 +0000
Message-Id: <20260914111742.85BF01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver relies on the bootloader-configured CLKPSC (prescaler=
) register but does not cache its value, which will cause incorrect period =
calculations after a system suspend/resume cycle.
--

commit b9ac3c051c5908fe946a0ef1c7b809030aa32933
Author: Chi-Wen Weng <cwweng@nuvoton.com>

pwm: Add Nuvoton MA35D1 PWM controller support

This commit adds a generic PWM framework driver for the Nuvoton MA35D1 PWM
controller. The initial driver supports 6 channels in up-counting,
auto-reload, independent output, and period loading modes.

> diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pwm/pwm-ma35d1.c
[ ... ]
> +static u32 nuvoton_pwm_get_prescale(struct nuvoton_pwm *nvtpwm,
> +				    unsigned int ch)
> +{
> +	return nuvoton_pwm_readl(nvtpwm, MA35D1_REG_PWM_CLKPSC(ch)) &
> +	       MA35D1_PWM_CLKPSC_MASK;
> +}

[Severity: Medium]
Does reading the hardware register directly here make the driver vulnerable=
=20
to hardware state loss during system suspend?=20

If the controller loses power during suspend, the clock prescaler register=
=20
might reset to its default value. When the system resumes and a consumer=20
subsequently calls into the apply callback, this function will return the=20
reset value instead of the bootloader-configured value. This could result=20
in drastically altered PWM output frequencies.

Would it be safer to cache the prescaler value during probe?

[ ... ]
> +static struct platform_driver nuvoton_pwm_driver =3D {
> +	.probe =3D nuvoton_pwm_probe,
> +	.driver =3D {
> +		.name =3D "nuvoton-pwm",
> +		.of_match_table =3D nuvoton_pwm_of_match,
> +	},
> +};

[Severity: Medium]
Should this driver include PM callbacks to handle saving and restoring the
hardware state?

Currently, there are no suspend/resume hooks provided. If the platform=20
powers down the PWM domain during system suspend, the controller state=20
will be lost upon resume and might not be appropriately reconfigured before
the next state application.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914110739.2034=
79-1-cwweng.linux@gmail.com?part=3D2
