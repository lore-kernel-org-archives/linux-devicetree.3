Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7609C1A6817
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490534; cv=none; b=NhI386AeE9dxcY7zjpeiXFOd46Z3LzAuVOFhde+7u0LzE+bwjFRb219apO50xV753PUM5ffXm6DOx5dLiLM2NOBcj5wHzsGFiYnbKF3tATThfaRj7jusxFd9MeC9k+PjUH8m0EL7JuvSJPoVr7dZmQmJcT2QCMPcUr/8s3L3Ks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490534; c=relaxed/simple;
	bh=B22dCbaOVO6mTjaXVauKxYYxa0knPn9q9WwLuNUbcME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IMM3lgUuYRHR6A4CY3j6Lc6dG1oRKbv+p5MBgR976KlOXovL5FvRaULu4fp9qfE5mw8/Bq6QjwlPKzxcF6d+mkhgEYbZPRUko8s3X/bnLYGvpIYyai4drSJbQcjifauw7FsU6cFfPT7MXkZK1MKI1Y1JQKTR3p4NAzjTm2XFiyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvQfRfPJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvQfRfPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF411F000E9;
	Fri,  4 Sep 2026 02:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788490533;
	bh=Zouhp+RGPqtqKAjDqPDewpgCd+0ob3k/yUSsB3H5SUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fvQfRfPJ6INWk9u+6tQHsA6sCflrZbrG3BBon1M8z5KpkQqyiJ3uOIVk32ckX2Mow
	 Ol1SCrAvAuVp+dJnjRv6mgycvIz2Vo0PhbuQhd0Dq90TpwqqKL0RiJUogNJnwCbrfo
	 tbkS+3DskCu47OWqcF1cFtabYCH4ibDoDytkA6HjtgAhVSgJrl8AKeWDNRA0qwu620
	 Jx3kdj1FRElwGEmyKmDjaNZyG6i1RRD9Z9X66GJE7vpG8tSUepbXfx0M8YKGxhIQ1s
	 ZDB2uhyE8G+6tqfLh5goGIdm8qTUkrqMUoRRSN1JBsScAsXEE1ReIIJsZOIB58bVAf
	 /7whwjF00BYqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: nau8360: Set DAC path to bypass mode
 when DSP firmware load fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904024456.193528-2-YLCHANG2@nuvoton.com>
References: <20260904024456.193528-1-YLCHANG2@nuvoton.com>
 <20260904024456.193528-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:55:32 +0000
Message-Id: <20260904025533.0CF411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Using `snd_soc_component_write` overwrites the entire `NAU8360_R12=
_PATH_CTRL` register, unintentionally clearing other critical audio path ro=
uting configurations.
- [Medium] Modifying a DAPM-controlled hardware mux register directly bypas=
ses ASoC DAPM state tracking and locking.
--

commit 6a6b1e851a10df0446b789100342efda63bba458
Author: Neo Chang <YLCHANG2@nuvoton.com>
ASoC: codecs: nau8360: Set DAC path to bypass mode when DSP firmware load f=
ails

This commit automatically routes the DAC path to bypass mode if the DSP
firmware fails to load. This is intended to keep basic audio playback
functional as a fallback mechanism.

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> index d7af2dffb749a..b3cf207eea86d 100644
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c
> @@ -1702,6 +1702,7 @@ static void nau8360_load_fw_work(struct work_struct=
 *work)
>  	if (ret) {
>  		dev_err(nau8360->dev, "Failed to initialize DSP: %d\n", ret);
>  		nau8360_dsp_enable(nau8360->regmap, false);
> +		snd_soc_component_write(cp, NAU8360_R12_PATH_CTRL, NAU8360_DAC_SEL_BYP=
);

[Severity: High]
Does this overwrite the entire NAU8360_R12_PATH_CTRL register?

Since NAU8360_DAC_SEL_BYP evaluates to 0, using snd_soc_component_write()
writes 0x0000 to the entire 16-bit register instead of selectively masking
the target bits. This would unintentionally clear other critical hardware
audio routing configurations (such as NAU8360_SEL_HW1_OUT,
NAU8360_AUD_SEL_SINCOUT, etc.) initialized during probe, completely breaking
audio playback rather than falling back to bypass mode.

Should this use snd_soc_component_update_bits() instead to safely update
only the DAC selection bits without clobbering the rest of the register?

[Severity: Medium]
Does modifying this hardware mux register directly circumvent ASoC DAPM sta=
te
tracking and locking?

The DAC selection bits in NAU8360_R12_PATH_CTRL are exposed to userspace
and managed by DAPM as a mux control (nau8360_dac_mux). Writing to this
register directly from a background worker introduces race conditions again=
st
concurrent userspace ALSA control changes. Additionally, the software DAPM
graph falls out of sync with the physical hardware, which could cause DAPM
to incorrectly leave DSP widgets powered up and fail to apply power to the
bypass path widgets.

Should this hardware path change be routed through the appropriate kcontrol
or DAPM interfaces to ensure the graph and power states are correctly
re-evaluated?

>  		return;
>  	}
>  	nau8360->load_fw_done =3D true;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904024456.1935=
28-1-YLCHANG2@nuvoton.com?part=3D1
