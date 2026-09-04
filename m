Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F427426D37
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 06:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502603; cv=none; b=PNhk88btrduGjI+2miTJ/NtEhmfRLRVJ4ptqSvx0XrPA/XpzIHMWpr50aRQcG+ROZIXhmBFMM5OyS4RysKpz/eGb3AhLBFjpCGouAh2f8E53efwjl88jxhcAhFRUO/3DXYEiaSxJ5GIGluWexr2la9R0PvyDyjimv2sW4HJ7Mfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502603; c=relaxed/simple;
	bh=qq2g3wvwfvq/RwokooINSD2gVW7GTN/4XYnXVI7fnPw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pz/QjFQOyt9NDtiT8rFZWH2cACIpCyad5QeP7YpSTD5u1wNxw5zPrt3HyPYb4DCSLRkhz7ni/pn+LiwePvoH2GdXT+OVEgUz71XuqZ50hvKlto2s/q2S86tI8b9makakM47sRyLK/KRg63KYTihDmrCriX8k3GDuBEE+7OHTudY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZiI2dR8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZiI2dR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F4F1F00A3E;
	Fri,  4 Sep 2026 06:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788502602;
	bh=ODnS+1nhJTUSOaf7M0bBOQBEFd/X0pvFwalBnYrj3mA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aZiI2dR8NSbGpukJQ49LF6HysoZxMe6w5c7FD7bUntjRQv4VmLMBEuLIsi0yDzC6z
	 PZwCcSOLqgE8gkaFFuApLOwRdwRXHIGqjq9eMZfNMcDrV6oeVBD8jLB0+vjgVAi3QQ
	 hwRBKo7Kh7EnRNiOkbhtdDBopDtVZVhhJvZi/o9RDShw/Z/j6Kvz7NIRyvvn2evxQ/
	 +SaG2bbUTN5DfQUzmIBrf4R+HFmXUrmNl9gH2PBm5yg9whkRqH02/uq3Plv5JW0/DS
	 2jmW0lrcIKAQsaOoTv51Gk5gJKcTgkY7u8OIPu5sRlwvSIr+0HQl87AowjU0IhJy/j
	 sTeENK+geBmSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: codecs: nau8360: Set DAC path to bypass
 mode when DSP firmware load fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260904060035.196399-2-YLCHANG2@nuvoton.com>
References: <20260904060035.196399-1-YLCHANG2@nuvoton.com>
 <20260904060035.196399-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 06:16:41 +0000
Message-Id: <20260904061642.27F4F1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Directly modifying a DAPM-controlled routing register bypasses DAP=
M state tracking, leading to an aborted power sequence and complete audio p=
layback failure.
- [High] Successful firmware load fails to restore the DAC path to DSP mode=
 if it was previously set to bypass mode on failure.
--

commit 66908584f9a6b49d33fcb5f3e81314daeeff0253
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Set DAC path to bypass mode when DSP firmware load f=
ails

Automatically route the DAC path to bypass mode if DSP firmware fails
to load, ensuring basic audio playback remains functional.

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> index d7af2dffb749a..8b75d3b9ebd61 100644
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c
> @@ -1702,6 +1702,8 @@ static void nau8360_load_fw_work(struct work_struct=
 *work)
>  	if (ret) {
>  		dev_err(nau8360->dev, "Failed to initialize DSP: %d\n", ret);
>  		nau8360_dsp_enable(nau8360->regmap, false);
> +		snd_soc_component_update_bits(cp, NAU8360_R12_PATH_CTRL,
> +			NAU8360_DAC_SEL_MASK, NAU8360_DAC_SEL_BYP);

[Severity: High]
Does directly modifying the routing register here bypass DAPM state trackin=
g?

When userspace subsequently starts playback, DAPM's unmodified internal sta=
te
may still believe the path is set to DSP mode and power up the DSP Clock wi=
dget.

This would trigger nau8360_dsp_clock_event(), which sends an I2C command to=
 the
explicitly halted DSP:

sound/soc/codecs/nau8360-dsp.c:nau8360_dsp_clock_event() {
	...
	if (SND_SOC_DAPM_EVENT_ON(event))
		ret =3D nau8360_send_dsp_broadcast(cp, NAU8360_DSP_CMD_CLK_RESTART);
	...
}

Could this cause the command to time out and abort the DAPM power sequence?

Additionally, does this direct register write bypass the lock and hardware =
state
machine updates normally handled by the mux control?

sound/soc/codecs/nau8360.c:nau8360_dac_mux_put_enum() {
	...
	mutex_lock(&nau8360->lock);

	ret =3D snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
	if (ret <=3D 0)
		goto unlock;

	nau8360_dsp_switch(component, snd_soc_enum_item_to_val(e, item[0]));

unlock:
	mutex_unlock(&nau8360->lock);
	...
}

>  		return;
>  	}
>  	nau8360->load_fw_done =3D true;

[Severity: High]
If a firmware load successfully completes after a previous failure (for exa=
mple,
on system resume), will the DAC path remain stuck in bypass mode?

It appears that if the hardware was forced into bypass mode during a previo=
us
error, the success path does not restore NAU8360_R12_PATH_CTRL to match DAP=
M's
expected DSP mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904060035.1963=
99-1-YLCHANG2@nuvoton.com?part=3D1
