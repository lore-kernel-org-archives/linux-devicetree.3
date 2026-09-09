Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F325153B5FD
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964352; cv=none; b=JhXWQNeq+GJ14cTctpgu2eYIYgZytWyDNS/yk4lM7JiM2iK4OkBLJRe7dA1DNynyAkkm8baNzLQkRlZ/wIXvHoGd4MedjCys8MevNvlblowYYn9cf7M/qsdO2/AiZZzXzs2WrhhvXmrKpFVRz7BfiWi8zTjuDhaMVqJMNJBEls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964352; c=relaxed/simple;
	bh=7mCXoVmTWOvYlndfuhSjIuXORUZU1YvZPh4LlL7KPX4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AQrPjEWjyqr2E21bBNOX1LUX3aVGP64WQ4y0Rx5o4yD02yMX7b1hA2yWvKClC1OYDOzoAGhaJchnPAUyP6YkicLxJ8xaxNhzeQfOz2/IOh3EC48i92Jk37LtQLTpYd7EnFUmIDqVNqg7d2fpd76cqyfpPjyD+5Hp1sJk4Yhq5nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaIinygF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaIinygF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797DC1F00A3E;
	Wed,  9 Sep 2026 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964350;
	bh=W7uC+F89taEPrcLK4uIm/OD3XDCBK6JTCtMOJ7ZR4qA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VaIinygFOT5YtoJOSpguWcfr5yPBGSh+ROQ0lKTu6MscHXAHxnDUHhvw05NVikLLm
	 M0Xuy5bL+fk9KFBZ3YgpZktb+Xw5qgdKCbISjvC9XAGT88CKNOTtGwOAQ7nFTPSPu6
	 mq4WNYEVErL8JnHorzIapBKpBp/tQMm0KadwByQlDTZlcaxTeC75rlBkS6b4nm15bi
	 iE1mKgA19IYAyY6LbJ6vdt6UNbdWrYgdRpQUqU6jRUDOD3hQSUkGSCfCYOg0/GhwbK
	 Co2BnLzfIFw38deKgGyYkHoT4vz31s0PkGMerw2RBJIwFeQ8ymTZsgdyLA/xC4l9hh
	 UsmROEMXDOC+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/10] iio: dac: mcp47feb02: initialize dac_data
 field in channel data struct at probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909-mcp47feb02_refactor-v5-1-8b67bcab93d1@microchip.com>
References: <20260909-mcp47feb02_refactor-v5-0-8b67bcab93d1@microchip.com>
 <20260909-mcp47feb02_refactor-v5-1-8b67bcab93d1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:32:30 +0000
Message-Id: <20260909143230.797DC1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect powerdown state evaluation at probe time causes the driv=
er to misinterpret hardware powerdown mode 1 as normal operation.
- [High] System resume unconditionally forces channels out of powerdown, lo=
sing user configuration.
--

commit f99608deaab75112b697e5e0e28a4014f58de232
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: initialize dac_data field in channel data struct at p=
robe

Prevent operations which use cache from overwriting default hardware values
with zeros by reading active DAC registers during probe to correctly
initialize the channel struct DAC values.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index a823c2a673a26..7502959d98eab 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
> @@ -1020,7 +1020,12 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47f=
eb02_data *data)
>  	gain_ch =3D gain_ch & MCP47FEB02_GAIN_BITS_MASK;
>  	for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
>  		struct device *dev =3D regmap_get_device(data->regmap);
> -		unsigned int pd_tmp;
> +		unsigned int pd_tmp, dac_val;
> +
> +		ret =3D regmap_read(data->regmap, REG_ADDR(i), &dac_val);
> +		if (ret)
> +			return ret;
> +		data->chdata[i].dac_data =3D dac_val;
> =20
>  		data->chdata[i].ref_mode =3D (vref_ch >> (2 * i)) & MCP47FEB02_DAC_CTR=
L_MASK;
>  		data->chdata[i].use_2x_gain =3D (gain_ch >> i)  & MCP47FEB02_GAIN_BIT_=
MASK;

[Severity: High]
This is a pre-existing issue, but does the probe logic misinterpret hardware
powerdown mode 1 as normal operation?

If the probe phase reads the powerdown state register and it returns 1, pd_=
tmp
is 1. This correctly maps powerdown_mode to index 0.

However, the boolean powerdown evaluation becomes !!0, which is false:

mcp47feb02_init_ctrl_regs() {
        [ ... ]
        pd_tmp =3D (pd_ch >> (2 * i)) & MCP47FEB02_DAC_CTRL_MASK;
        data->chdata[i].powerdown_mode =3D pd_tmp ? (pd_tmp - 1) : pd_tmp;
        data->chdata[i].powerdown =3D !!(data->chdata[i].powerdown_mode);
        [ ... ]
}

Because of this, the channel is flagged as actively operating when the
hardware is physically in powerdown mode 1 (1kOhm to GND), creating a
mismatch between the software state and the physical hardware state.

[Severity: High]
This is another pre-existing issue, but do the suspend and resume routines
discard user configuration and unconditionally force channels out of powerd=
own?

During suspend, the driver overrides the software powerdown state to true:

mcp47feb02_suspend() {
        [ ... ]
        data->chdata[ch].powerdown =3D true;
        pd_mode =3D data->chdata[ch].powerdown_mode + 1;
        ret =3D regmap_update_bits(data->regmap, MCP47FEB02_POWER_DOWN_REG_=
ADDR,
                                 DAC_CTRL_MASK(ch), DAC_CTRL_VAL(ch, pd_mod=
e));
        [ ... ]
}

During resume, it blindly forces all active channels to false and writes
MCP47FEB02_NORMAL_OPERATION to the hardware:

mcp47feb02_resume() {
        [ ... ]
        data->chdata[ch].powerdown =3D false;

        ret =3D regmap_write(data->regmap, REG_ADDR(ch), data->chdata[ch].d=
ac_data);
        [ ... ]
        ret =3D regmap_update_bits(data->regmap, MCP47FEB02_POWER_DOWN_REG_=
ADDR,
                                 DAC_CTRL_MASK(ch),
                                 DAC_CTRL_VAL(ch, MCP47FEB02_NORMAL_OPERATI=
ON));
        [ ... ]
}

If a user intentionally powered down a channel, it will unexpectedly wake up
and output voltage upon system resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-mcp47feb02=
_refactor-v5-0-8b67bcab93d1@microchip.com?part=3D1
