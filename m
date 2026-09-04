Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD4635201E
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 02:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490290; cv=none; b=lldjcT7eSLF3EJzFsimngVJzIuVHdlbQxvwDe1Sqj1jbFiz+i0AUcgAq56nzDjDT5m//Oh7JDEcVg9FHXDosXFZMmFgLbySJ+WTsmdYoKspUZhzlIo8HqZ0z/LhjkiHpM/k8f6QBfnowY5jgHVdJ2oWq+kfuRyvGunxtE1bQOBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490290; c=relaxed/simple;
	bh=BJwFJcm45co6Fm2JsygTSc4rkjhJxlmZfCVdJe0DKW4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Af8k2e4LcrdVM6OfB4kDMVzDnAIfcEtSBnSeP+PZXeQWa4McHASzR2XLMx5gbqJB5UXjf9Lp7VQ/aYiTi6NXeZBjYu7rFR4qxJHYtKpOTtyieEHdJ0GeKuB8oSlkkT9YUpryxyYyhUD3hRfVttGOOti6/CY609sl7se9vgMKpTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PV5343Hv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PV5343Hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4001F000E9;
	Fri,  4 Sep 2026 02:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788490289;
	bh=intDzSVdyLwTK6aol5Dlxy8sVETZi/7fEMySnTK6yE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PV5343HvgLkMon8+5ptN5a7cxpeXaUW4rGbHNL+jZND6FcjXXz0wq7rc9ycr7Mcva
	 3PVj+wREpSLLceWOsD40JMi7k5Yhtxkm295amvJY4MCYxLvdhaBB8FTlX4ZstVF14C
	 sjMzMKsr68Jsp3l2cRDYKWmMdjW+Ez39fOhf5CzGnpMJ56sTiXHfo3UENF6tH2DpiG
	 gn0+zoP9tkOm89rT1Pqxv7l5d4a3lMYg+PmV5XqxsaQr29CFHEwDJ9ozLoXV+WPx8A
	 EEW5drf42EK9WDAJRHoFiWcCwQeZILnxw/xGgcOCqnlW8GNlTKqhdTEfmxzXC9VMSE
	 SzEA4/AZ1jgfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: nau8360: Add default PEQ band number
 for DSP init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904024456.193528-3-YLCHANG2@nuvoton.com>
References: <20260904024456.193528-1-YLCHANG2@nuvoton.com>
 <20260904024456.193528-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:51:28 +0000
Message-Id: <20260904025128.CC4001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing bit shift for NAU8360_PEQ_BAND_8 causes the PEQ band field=
 to be incorrectly cleared to 0 instead of being set to 8.
--

commit dcc017a933844c3bdb0f174e1e0108fe17fff20e
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Add default PEQ band number for DSP init

This commit sets a default PEQ band number during DSP initialization in the
nau8360 codec. The goal is to prevent invalid states or uninitialized
parameters before user configuration is applied.

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> index b3cf207eea86d..5a94e9a3072a5 100644
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c
> @@ -1602,6 +1602,8 @@ static void nau8360_coeff_set_def(struct nau8360 *n=
au8360)
>  			i * NAU8360_TOT_BAND_COE_RANGE, 0x20);
>  	}
>  	nau8360_peq_mem_enable(regmap, false);
> +	regmap_update_bits(regmap, NAU8360_R9D_PEQ_CTL, NAU8360_PEQ_BAND_MASK,
> +		NAU8360_PEQ_BAND_8);

[Severity: High]
Does this code clear the band field to 0 instead of setting it to 8?

In sound/soc/codecs/nau8360.h, NAU8360_PEQ_BAND_MASK is shifted:

#define NAU8360_PEQ_BAND_MASK (0xf << NAU8360_PEQ_BAND_SFT)

But NAU8360_PEQ_BAND_8 evaluates to 8 unshifted. Because it is passed
without the shift here, the value applied against the shifted mask becomes
zero.

Other uses of this field in the driver explicitly shift the value,
such as:

regmap_update_bits(regmap, NAU8360_R9D_PEQ_CTL, NAU8360_PEQ_BAND_MASK,
	value << NAU8360_PEQ_BAND_SFT);

Could this regression in the bit shift cause incorrect DSP initialization?

>  	mutex_unlock(&nau8360->lock);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904024456.1935=
28-1-YLCHANG2@nuvoton.com?part=3D2
