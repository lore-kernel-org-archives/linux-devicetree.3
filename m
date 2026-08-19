Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706D2DA74C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143859; cv=none; b=ovDVWDOX3wu6zQ/Pk0WFsrxj9yQhaXwIQWOvdVTlsEUPLBbNaVAbbWRD89Hfe4nPOqpVXPEuTc9/nllKl3jbsGIRubFPSbasxH5NyPsJhY5FxtnwGpulI+X9CC4OWi1IfoJ87+XV8YwvmmxYQTnuxbjVI5KP+o3apRtULjic69E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143859; c=relaxed/simple;
	bh=O4VjSLoNRekWqiiQogimKvwpZfRVFwZ5IXtkx52dL8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XGAJ4C6aFWQ8EA3neBNtjQsOVVA2DFEOqssihhoY42O8fFBzua9akS7Knr0qtsYAo3fn5fI9L8UtnjGQFKdGHPo1SQKlmnwoyxeesBOFku+/ApmXT0QHhrkFaD4EoAx4NRfNTdZOuhEPlGBgMlblutvBrlBg9ab7iHAth5e5O64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPMx9HMT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPMx9HMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742F61F00A3A;
	Wed, 19 Aug 2026 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143857;
	bh=nXZOau+Slls28YkTVXupLesFtExsas+vD3SGTndB3CA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CPMx9HMTuVmuiwOGTe2rRxt/r5bkXSlPbCrF+ytQ6//XHmOzK8MfcXLQzDsq07g10
	 5O4vhvh2WF3ZgJ2p6PiGLWYPsA53CHtO/hbPZKW+1Rfm+vwg6oYqAiQ3YpO4aXcpEx
	 qATjeZifRYpiKQAUgqw2s2qIfWMuv/1ww1YvaywaZc2makS8dHfKn4k0t2nPf+xS3h
	 OKxjV12PziRYK5CJYSfpbovW11+ltVZWEoucdU0/HlBNo75C9oifN7vB8RLLpVbiRJ
	 ju0ZUM3mmkMrMIGuajBKsMyRCcT93cVO+nS4fnrHNLZft00BPaiGylY1G57qViEhHz
	 tV9VKAgab78VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/9] iio: dac: mcp47feb02: correct gain bitshift at
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260819-mcp47feb02_refactor-v4-2-beb2aa3bfd09@microchip.com>
References: <20260819-mcp47feb02_refactor-v4-0-beb2aa3bfd09@microchip.com>
 <20260819-mcp47feb02_refactor-v4-2-beb2aa3bfd09@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 12:50:57 +0000
Message-Id: <20260819125057.742F61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] System suspend and resume forcefully overwrite and lose the user-c=
onfigured powerdown state.
- [High] System resume corrupts the VREF (voltage reference) configuration =
by overwriting it with the powerdown mode.
- [High] Sysfs store handler returns 0 on false state, potentially causing =
userspace infinite loops.
--

--- Patch [2]: [PATCH v4 2/9] iio: dac: mcp47feb02: correct gain bitshift a=
t probe ---
commit f1be9d71af346cda91f297b65aff2d8b9c5d0198
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: correct gain bitshift at probe

This commit corrects the formula for initializing the gain struct field
for each channel. It ensures the correct bits are extracted from the
Gain Register.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index 7502959d98eab..bf78618ac2c89 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
> @@ -1017,7 +1017,6 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47fe=
b02_data *data)
>  	if (ret)
>  		return ret;
> =20
> -	gain_ch =3D gain_ch & MCP47FEB02_GAIN_BITS_MASK;
>  	for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
>  		struct device *dev =3D regmap_get_device(data->regmap);
>  		unsigned int pd_tmp, dac_val;
> @@ -1028,7 +1027,7 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47fe=
b02_data *data)
>  		data->chdata[i].dac_data =3D dac_val;
> =20
>  		data->chdata[i].ref_mode =3D (vref_ch >> (2 * i)) & MCP47FEB02_DAC_CTR=
L_MASK;
> -		data->chdata[i].use_2x_gain =3D (gain_ch >> i)  & MCP47FEB02_GAIN_BIT_=
MASK;
> +		data->chdata[i].use_2x_gain =3D (gain_ch & DAC_GAIN_MASK(i)) ? 1 : 0;
> =20
>  		/*
>  		 * Inform the user that the current voltage reference read from the vo=
latile

While reviewing this patch, I noticed a few pre-existing issues in this fil=
e:

drivers/iio/dac/mcp47feb02.c:mcp47feb02_suspend() {
    ...
	for_each_set_bit(ch, &data->active_channels_mask, data->phys_channels) {
		u8 pd_mode;

		data->chdata[ch].powerdown =3D true;
    ...
}

drivers/iio/dac/mcp47feb02.c:mcp47feb02_resume() {
    ...
	for_each_set_bit(ch, &data->active_channels_mask, data->phys_channels) {
		u8 pd_mode;
		int ret;

		data->chdata[ch].powerdown =3D false;
    ...
		ret =3D regmap_update_bits(data->regmap, MCP47FEB02_POWER_DOWN_REG_ADDR,
					 DAC_CTRL_MASK(ch),
					 DAC_CTRL_VAL(ch, MCP47FEB02_NORMAL_OPERATION));
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does system suspend and
resume forcefully overwrite and lose the user-configured powerdown state?

The state is blindly overwritten with true during suspend and false during
resume. The hardware is then unconditionally awakened, ignoring any prior
user configuration to keep the channel powered down.


drivers/iio/dac/mcp47feb02.c:mcp47feb02_resume() {
    ...
		pd_mode =3D data->chdata[ch].powerdown_mode + 1;

		ret =3D regmap_write(data->regmap, REG_ADDR(ch), data->chdata[ch].dac_dat=
a);
		if (ret)
			return ret;

		ret =3D regmap_update_bits(data->regmap, MCP47FEB02_VREF_REG_ADDR,
					 DAC_CTRL_MASK(ch), DAC_CTRL_VAL(ch, pd_mode));
    ...
}

[Severity: High]
This is a pre-existing issue, but does system resume corrupt the VREF
configuration by overwriting it with the powerdown mode?

The pd_mode variable appears to be mistakenly passed as the value for the
MCP47FEB02_VREF_REG_ADDR register instead of the correct reference mode.


drivers/iio/dac/mcp47feb02.c:store_eeprom_store() {
    ...
	ret =3D kstrtobool(buf, &state);
	if (ret)
		return ret;

	if (!state)
		return 0;
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to return 0
here?

Returning 0 from a sysfs store handler instead of the length of the
written buffer can trick userspace tools into an infinite loop as they
repeatedly try to write the remaining bytes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mcp47feb02=
_refactor-v4-0-beb2aa3bfd09@microchip.com?part=3D2
