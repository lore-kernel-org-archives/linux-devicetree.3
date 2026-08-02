Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90B3385BE
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674937; cv=none; b=GNjLzE8yHKiXO037R2f5GEBKTwj04YikGI1lObSkJ/DrOvw9WAg3zfATIQBSkzEqhFVfPnZhKctuOmcuzAsNTSDq84mlNoPjk5oW9dsYInoCpZ3BHHjKMiT2gIcCQkgw3Oza974b9wRLBE99jLnrs3wF6XYEb+sfoE/x91O2kUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674937; c=relaxed/simple;
	bh=MoVRBlMXHs851dZVBCSV0OKR9AP9DwNgbCuXidRZxGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hhc0IwVbkZ2/1d5ytBsEsBYCDoyrA7OPv+up4lZjVFz+9vMVRY9wigqWXY8diW+u1yL2u5dktKJoxOQQ8LQ2WWWRFXo6Cl3xYuwhz/LLayvGFy9XGDGrXAsqbw6jCPLcuvkNVn53q94QQ61EOg/ss1o/HeTTXtTfs8XT6BNdhm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M95g88DD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M95g88DD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB921F000E9;
	Sun,  2 Aug 2026 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785674935;
	bh=DN5g4uEPQSXuDvLKCCzhVylfsSl1zXQa3gsx0U01Puk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M95g88DDO+eTrZUQjYp2HIHxqrUKU8NQ0TDgGvbCKyl4eCcL/v8yE8kVY2I3HUeYM
	 CFT77ZFljlsPdRYWc1z7Cq+Z+qV/RR8/4j7hqSSmsQ1eu/VPLPMdjvrFD31AwWtced
	 +nChWkme//MLO9hTKAyy/dS4kE/S6c92K5oiDocbkOd1ErogpMJBbjS8ZSUh2SD8I9
	 w44UPhkGJ6m6sA93KvU1Ma/3kWqaz/6MI+gG1Ka3v8qD4/DOJjaeyqv5UKRuuiRHgc
	 5mI8yFjTKpBb/kPcgGP3cxuW4z59IMJeAYD218BIpdB5GptavKD3ohy69jiB6P7Ced
	 T74CQUZ1GjddA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/3] ASoC: codecs: tfa98xx: add driver for TFA2
 amplifiers
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260802-tfa98xx-upstream-v1-2-4dd55cdd658a@ixit.cz>
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-2-4dd55cdd658a@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 12:48:55 +0000
Message-Id: <20260802124855.ABB921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The i2c_device_id array fails to use named initializers.
--

--- Patch [2]: [PATCH RFC 2/3] ASoC: codecs: tfa98xx: add driver for TFA2 a=
mplifiers ---
commit 4120c0a8b537c48d7609971c712e99479ca0e3ec
Author: David Heidelberg <david@ixit.cz>

ASoC: codecs: tfa98xx: add driver for TFA2 amplifiers

This commit adds a driver for the NXP/Goodix TFA98xx (TFA2) smart speaker
amplifiers, initially supporting the TFA9894 found on the OnePlus 6T.=20
The driver bypasses the built-in CoolFlux DSP and takes the amplifier input
straight from the TDM interface.

> diff --git a/sound/soc/codecs/tfa98xx.c b/sound/soc/codecs/tfa98xx.c
> new file mode 100644
> index 0000000000000..c84abb8db207a
> --- /dev/null
> +++ b/sound/soc/codecs/tfa98xx.c

[ ... ]

> +static const struct i2c_device_id tfa98xx_i2c_id[] =3D {
> +	{ "tfa9894", (kernel_ulong_t)&tfa9894_chip },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but should the tfa98xx_i2c_id array use named initializers
(such as .name =3D "tfa9894", .driver_data =3D ...) to align with the I2C
subsystem guidelines for initialized arrays of type struct i2c_device_id?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-tfa98xx-up=
stream-v1-0-4dd55cdd658a@ixit.cz?part=3D2
