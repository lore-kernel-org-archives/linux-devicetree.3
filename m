Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019C2572695
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964750; cv=none; b=pZ4slw4c01FC6gWOhBzCqEINaVY+G9Xk/29aaLTxKjh2uc+3mryskW1BgnuwD0aa3eJQe0USnblSOdidVPPDSkNAkeUKcYwe4E8zdxKN9HpDUkpDX+Wn69uDJ2f19RdyIU/xv3PF2p0U7hO4CDMmXA10gxtlDZ+rztCdTI5GeDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964750; c=relaxed/simple;
	bh=akVd552e30M0GgLs68Sj1tlyMrLuq+xWjdCVWes0rrQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vE8mVhaxMuSrh7Hvdin5lmYrcPpAYamFtM2IqvP/KV8e0hnM9e5ZHYX/Vp3fQeRc/zZdV+FryZsFs3LgU0jNjyAiRuTt90NyGx7RyHmbDB/R7ktCS1BCMFMSg5XORHikB2TKHdLsP5btH5MnMO6kdK6MFWWOAwLbfmvws7QF4y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfH2S1QU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfH2S1QU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9971F00A3A;
	Wed,  9 Sep 2026 14:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964748;
	bh=tg76nF3q1Eu3j0QCvssvDxqjDxBA1OYDWmkzmwtn26M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QfH2S1QUX4XvgP9DaKN18ZwnKHw5dxNMK1l0uEBrXxJNPsHjwRnIMM1xQv8QkpSco
	 gteblbbs5YYYxKnkG0etwNNtR2sQsU2U968G1W+Fa/ksEFzeDjIq0XNTeIiEfwCyA9
	 tR0ZYTjhDbuSl9DAV3E28OmgZkFP3UtKckqutN2RSLX7OicLRnaR81AUT8jrIKx+iK
	 EeHk5j3WQGkdrVWmMLFqpqcl3LU51c7qZLbv1nnePsXWaVfWTw13k9emZN0x1SIy5H
	 WCIstwhoofzI2TOrWys++vqc543ajxjyHGyhCAE2LJKBnT4JTz8cBYfgGs6z+Jl7eJ
	 V6thuKl8h9pzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/10] iio: dac: mcp47feb02: rename command mask
 define
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909-mcp47feb02_refactor-v5-7-8b67bcab93d1@microchip.com>
References: <20260909-mcp47feb02_refactor-v5-0-8b67bcab93d1@microchip.com>
 <20260909-mcp47feb02_refactor-v5-7-8b67bcab93d1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:39:07 +0000
Message-Id: <20260909143908.0E9971F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to correctly parse the powerdown state during ini=
tialization, causing it to lose the distinction between 'Normal Operation' =
and '1 kOhm to GND' powerdown mode.
- [High] The driver's suspend/resume PM callbacks permanently clobber the u=
ser-configured logical powerdown state.
--

commit 0d81d552cabc3f0d9820a2ed59353c19dc69d754
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: rename command mask define

This commit replaces the initial mask define with two new macros.
These new macros explicitly select the corresponding bits for each channel
in the VREF and Power Down registers.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index c054711a55ca0..fb66bd2664a9e 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c

[ ... ]

> @@ -1069,7 +1070,7 @@ static int mcp47feb02_init_ctrl_regs(struct mcp47fe=
b02_data *data)
>  			break;
>  		}
> =20
> -		pd_tmp =3D (pd_ch >> (2 * i)) & MCP47FEB02_DAC_CTRL_MASK;
> +		pd_tmp =3D MCP47FEB02_GET_POWER_DOWN_MODE(pd_ch, i);
>  		data->chdata[i].powerdown_mode =3D pd_tmp ? (pd_tmp - 1) : pd_tmp;
>  		data->chdata[i].powerdown =3D !!(data->chdata[i].powerdown_mode);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible this logic
incorrectly parses the powerdown state during initialization?

When pd_tmp is 1 (1 kOhm to GND), powerdown_mode is calculated as 1 - 1 =3D=
 0.
When pd_tmp is 0 (Normal Operation), powerdown_mode is also 0.

Since the driver then sets powerdown to !!powerdown_mode (which evaluates to
false in both cases), it seems the driver loses the hardware's true powerdo=
wn
state if it booted in the '1 kOhm to GND' mode, misreporting it as normal
operation.

>  	}


[Severity: High]
This is a pre-existing issue, but I wanted to ask about the suspend and
resume behavior in this driver.

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
}

If a DAC channel is explicitly placed in powerdown by the user via sysfs,
would it unexpectedly wake up fully powered on after a system resume because
the user's requested powerdown configuration is permanently overwritten?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-mcp47feb02=
_refactor-v5-0-8b67bcab93d1@microchip.com?part=3D7
