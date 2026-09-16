Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA51519935
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568954; cv=none; b=GkPlcs+t76Q+VdGpHqAieSgFF4qVH9HFVoH2sOLc6lUYYlPQD6wdWQa40MZJj1rngsjLH1HpQYVWvVHHxBYplgSq0FOrmrmOn/9ZOuPTcKcOj2o7JvOhho8ZAOf06pzg/JMHO/VbpGjz4TnyM49YOhSJoshsY8XkRlkRaIUGhE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568954; c=relaxed/simple;
	bh=gPy2HMkTL1if1epywuROM9FdhE/4LM9L9cvmOfv+Ntk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iZaZQZLVFCoiRuvJAFu/fskE+64wNFeyN7mLp6DNtIqHu3zb2pgrBChMFggFck92VbYy7nmy3OdSoPPoQFANpa0s60hqzmRq8aH23F9/KZInWYawgqZ+L9fa23p/KesN+qhnHHEy5xwjaLx/BWw92+MxMpeu5aMzlGzv+SWGWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFWL4UrJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFWL4UrJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148C51F000FF;
	Wed, 16 Sep 2026 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789568953;
	bh=YrX0skWSfthjXabu93w+sDIR+s8qqr+4FSAkoRSRH2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFWL4UrJfButWER8GvuKKxgekTzG72rpj0WM/aAKP3NwU0HvdWinmkZNFd0XThtjT
	 NTTziE74NkZBIL0j6zqcNeBQ6iPRlBt44qFiGCPIeCRsJUwNA8rjqJsdFIHVvRwqRI
	 mmgw9m+IAsqCxTeR32d4PUI5RyOQHdsyxY4pVYLYz/rqnzovqwBt17Ih3KZSOFqHMj
	 ErXQWCHZ8LUk2sGWRZKoVmlDTg8Zg1vDTjkmyG/f/2Few5t6jFIEEJDDbSg6xJvf6u
	 yqbLdcGRset9gV6obaIjC5RI9gxdUdvwNYsLKPQgqt7w1rarpekkyE8qMw2zEXY9SN
	 XY3KcAYQ7bAHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/11] iio: dac: mcp47feb02: Fix gain field
 initialization for active channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916-mcp47feb02_refactor-v6-2-285464651f89@microchip.com>
References: <20260916-mcp47feb02_refactor-v6-0-285464651f89@microchip.com>
 <20260916-mcp47feb02_refactor-v6-2-285464651f89@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:29:12 +0000
Message-Id: <20260916142913.148C51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: dac: unused macro MCP47FEB02_GAIN_BIT_MASK
--

commit 9156f8c32ec03099abf89f1f0f71cf04b9870e24
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: Fix gain field initialization for active channels

As per MCP47FXBX48 Datasheet, in the format of the Gain Control and System
Status Register each DAC channel has one bit to control its gain,
starting at bit 8, while bits 0-7 contain status or unimplemented bits.
The patch updates the driver to use field_get() for correctly extracting=20
the gain control bit for each active channel.

Link: https://lore.kernel.org/all/20260804134616.1D8A21F00A3E@smtp.kernel.o=
rg/

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index 6a3875e1d6a2c..fa4bd1df95484 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
> @@ -1016,7 +1016,6 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47fe=
b02_data *data)
>  	if (ret)
>  		return ret;
> =20
> -	gain_ch =3D gain_ch & MCP47FEB02_GAIN_BITS_MASK;
>  	for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
>  		struct device *dev =3D regmap_get_device(data->regmap);
>  		unsigned int pd_tmp, dac_val;
> @@ -1027,7 +1026,7 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47fe=
b02_data *data)
>  		data->chdata[i].dac_data =3D dac_val;
> =20
>  		data->chdata[i].ref_mode =3D (vref_ch >> (2 * i)) & MCP47FEB02_DAC_CTR=
L_MASK;
> -		data->chdata[i].use_2x_gain =3D (gain_ch >> i)  & MCP47FEB02_GAIN_BIT_=
MASK;
> +		data->chdata[i].use_2x_gain =3D field_get(DAC_GAIN_MASK(i), gain_ch);

[Severity: Low]
Does this leave the MCP47FEB02_GAIN_BIT_MASK macro defined but unused?

Since this was its only usage in mcp47feb02_init_ctrl_regs(), should the
definition also be removed from drivers/iio/dac/mcp47feb02.c?

>  		/*
>  		 * Inform the user that the current voltage reference read from the vo=
latile

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-mcp47feb02=
_refactor-v6-0-285464651f89@microchip.com?part=3D2
