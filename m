Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B4F331EA6
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 11:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458153; cv=none; b=J7oyBvycbwu5XVtTe7t3fYzVu2krU6eF40ir41Pb6F1DBeMg9xdAJbdxDiL6P+H76bidBRahoCJoEh3iUMoWBuJqgEpFjXZ+vTpa3RGYMazWK8ZNCtcfHYnUYP+XJwwYBoRJgyv15brV5A0Z85e9Sygbhz/LJTYkr2Ys6qIhJyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458153; c=relaxed/simple;
	bh=FGk9eJPHr3lkcS9k8ro+PVsJLRl6uRbL4ju9NHeX0vo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tOiDS9/Ya91Xo1mm46cDgQsZv8ZdrmEjPVonyfxGrG7/OvaBFMdmF4qO9jA3YpmMiOPyffTnIv005YbW2gVyTaPveyf30Zy2Fbm4Vup4MFbvqZHGDvVj4AkQm40JV27+Bs9uPQ6mZwDPmDzbv6YQDavU/8VZeXNhR6fRL2F4Des=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+xn11ab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+xn11ab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDF31F000FF;
	Thu,  8 Oct 2026 11:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791458151;
	bh=yW5gPjG+pVWAwRpEHEelm1XqdZp+vobLJL1kYG0/QQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+xn11abOVuudlYCd0jC8abkVraiPTcIny0l30RiMztLFPDMYQy0/XzUA1PVwbg3u
	 nyJLhb9WUOKAYly3JwyKGJ/+GJHpUZApwr2mzOqZA008izbGxeN23pVGEOgi/Dn+n9
	 9PlNlEn5JmDPeKLr3DnLX3K1iqsBEl5x97GazAY0TKdx3NlSoH33rjZRsvO7we59DL
	 sLIZCgcxFlSdf10f6t0jWkEF4WsThu6uW9FPIFw4G0P6i7eN4HARsth1sEfM8/xWS/
	 QaIWIOLmvxXvEqnD0jX1c159qmAn/UbV7LqwBYNhkynfWKwDuOMJp10gvQqyMKt+LZ
	 d/eriD0vuJZMg==
Message-ID: <sashiko-outbox-164081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add Nord sound card
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-5-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
 <20261008-nord-asoc-driver-support-v2-v2-5-0b6f7e94060d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:15:50 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: qcom: Codec internal enums hardcoded in machine driver
--

commit 2721d92879dd4f31b8adcd325b2322e0930198bc
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
ASoC: qcom: sc8280xp: Add Nord sound card support

This commit adds support for the Nord Ride and RRD sound cards by
introducing the qcom,nord-sndcard compatible and associated
platform-specific data. It configures the codec DAI format for DSP_A
operation and enables MI2S bit clock handling. It also adds a
platform-specific sound card initialization callback to configure the
ADAU1979 capture codec to use LRCLK as its system clock source.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index b5d367486d56a..a759ae9511b6b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -25,6 +25,10 @@
>  #define I2S_BIT_RATE(rate, channels, format) \
>  	((rate) * (channels) * (format))
> =20
> +#define ADAU1977_SYSCLK 0
> +#define ADAU1977_SYSCLK_SRC_MCLK 0
> +#define ADAU1977_SYSCLK_SRC_LRCLK 1

[Severity: Low]
Does duplicating these magic values from the codec driver create a brittle
dependency?

When nord_snd_init() passes these hardcoded macros to
snd_soc_component_set_sysclk(), it relies on the internal integer values of
the ADAU1977/ADAU1979 codec's clock definitions matching these definitions.
If the codec driver maintainers change the enum values, the machine driver
will silently configure the wrong clock and cause audio capture failures.

Could these identifiers be exposed through a shared header in include/sound/
instead of being duplicated in the machine driver?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-nord-asoc-=
driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com?part=3D5
