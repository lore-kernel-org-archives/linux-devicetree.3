Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D186480321
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935071; cv=none; b=q4vbSa6IH5YYL0UlxoYlMi9Kdux9K0dTmsA4wgdst5o9CuJuaInPOANxjYIBBvHW03/8jGP9XsqXaEinL+z+Elob5woKVwRlI8ZrBPYkp4UHCoL1aFh7xf/MdmP08J0UEVz2ClydHsfvKNzmJR8ndh/QDSfbVn96PO77gdyw0Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935071; c=relaxed/simple;
	bh=UHMffMYnS2ynovZmh4U+d85mgfvXvj3l2i9TRsvfsNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mwxvAuSP7CU2gYrW62DgjE1nEOIr3xW9cbby0ufQetm4OiCkc6IJ6EboRzOvdtik2MiNwCPu9R01yxFLucqu8+L4Uj1VuuWdKoa3h4XFC/M0MBDDZYXll29FV41Sq7m4oLqxDK08YTIAo5Dq90hr+mR0gShRpIvx77G3jXQhHjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWgRazzO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWgRazzO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796DC1F000FF;
	Fri,  2 Oct 2026 09:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935068;
	bh=W4t45qMC4Z/mbEOXcYn2Gkqpwp34rqBzrdZ7PnxHo5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bWgRazzOlvgIWT3vJ1pE+OdoDbJ1KJuLm/PaJ3wW5SNEuA87xemC7eZgH6NxwbHeq
	 46sJe01BGET2TMRD9+5FkutQlC6LtWxMDNsD+O8zw95elGF2N3aL1oS/d5Vt0iGakj
	 9vH/mvWhlDVGOXqIsU+ibcUru+UXzPCAzjCKB4izMz/c5EPAIty3moik3dvsvyZ3ZZ
	 HpEHraYjJi6ae7sAyFX6zsh/cEERfT3teHY/PK+4+L+2VYOgrv1okWPn6WYktZAsOK
	 hZ8hl/bfXYYpWX76GX0qag95zo0UqzgNDDMdLU4j2t3J4+TvnQPAROCbb6vAMAh6FQ
	 TBuYEwHV157Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] ASoC: pcm179x: Add left-justified formats for
 pcm1792a
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9tYW4gU21yxb4=?= <roman@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261002-work-v1-3-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
 <20261002-work-v1-3-f0e53bc7331f@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:57:48 +0000
Message-Id: <20261002095748.796DC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: pcm179x: missing LEFT_J in auto_selectable_formats
--

commit f6579131e2b6aaf5049aa6728620f5e3a4687837
Author: Roman Smr=C5=BE <roman@amarulasolutions.com>

ASoC: pcm179x: Add left-justified formats for pcm1792a

This commit adds left-justified format support for 24 and 32 bits to
the pcm1792a format table to match the datasheet.

> diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
> index 61b87dab32667..c059e410cbbe4 100644
> --- a/sound/soc/codecs/pcm179x.c
> +++ b/sound/soc/codecs/pcm179x.c
> @@ -75,6 +75,8 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] =
=3D {
>  	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
>  	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
>  	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
> +	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
> +	{ SND_SOC_DAIFMT_LEFT_J,  32, 3 },

[Severity: Medium]
Should the new left-justified format also be added to the auto-negotiation
bitmask in this file?

When the ASoC core attempts to find a matching DAI format between the CPU
and codec components, it intersects their supported auto-selectable formats.
Because SND_SOC_POSSIBLE_DAIFMT_LEFT_J is omitted from the bitmask, it
appears this format will be skipped and remain unavailable to generic
machine drivers unless manually configured in the device tree.

For context, the current bitmask only includes I2S and right-justified
formats:

sound/soc/codecs/pcm179x.c:pcm179x_selectable_formats
static const u64 pcm179x_selectable_formats =3D
	SND_SOC_POSSIBLE_DAIFMT_I2S	|
	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;

>  	{ SND_SOC_DAIFMT_I2S,     16, 4 },
>  	{ SND_SOC_DAIFMT_I2S,     24, 5 },
>  	{ SND_SOC_DAIFMT_I2S,     32, 5 },
> };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-work-v1-0-=
f0e53bc7331f@amarulasolutions.com?part=3D3
