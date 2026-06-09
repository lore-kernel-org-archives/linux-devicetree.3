Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6B30DED0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990211; cv=none; b=tAEvNB6yaaT+YvDbscLRUfzhTAE6Z4sCM0ERzTl7PjzNRBBUFOG8CZbhYOiZANdTnWV79h+mOOqMQVMBtyAMr94wUw5fHQcLPnAQY3gEHpaXqdhzNIMurKmZdBf653xfNMlGoqhk8z7wzAMKT3nOLxXWl8hbVx3y++GXIsiA4nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990211; c=relaxed/simple;
	bh=msFsUp+wGLy8MCYMqnfPssKE5rXP5RMr+9mXVb6zffo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kaPodqwYpDVgYCrH8M6YDBWEUJVFUvYKg5PgI5RVvThG3co+fz07aPEaD9FXs1lrm/i5bKAVAAwC53BOjjpwdXRENS+YMT7r1HFa8MGOAoKANzmZiSxGrwwKiOZzJqAMrX1N3w0jBck/DtLnNhI+2DRD60TTQqU1JscOHY84QTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwMSjpOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwMSjpOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEB81F00893;
	Tue,  9 Jun 2026 07:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990210;
	bh=1i0UhTGxIX9TQqFVbPzU146vzxkD81cDw1A0Y/vnih8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VwMSjpOppCcjaJ0tLOI7Cq/FSYLh8FDml2ii3G+rFLnZ3bglbzvVQ6UPeWZ9EvxlU
	 Ql+iBIYGdYUOg2l817iQ3A0BABWXfSxd3xo3mjCCcz5yyJrYZQQmliu48tjLK5+Cr4
	 vo3lUrPdYpq+CqRt5HATdvFtz0oKdG8/tRgxeZV2Rc4+Wx5NcZStVhitvHsodfMQpS
	 CTs1qhb02sfLkwpmT3t0ufbp1J4qs50rmE76FVCj8BFFQHw8hb6NWQprxdo47/Yiw8
	 fBYvpJwGfHEan9eXtSpRmi4dAgNiqugKgReULR9M06ts+ILppbPUS643gxptHeqKm3
	 oZ3u4JyiJ5wZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] ASoC: codecs: ES8389: Add private members related
 to HPF
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609071732.20939-6-zhangyi@everest-semi.com>
References: <20260609071732.20939-6-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:30:09 +0000
Message-Id: <20260609073009.CFEB81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ADC High Pass Filter (HPF) configurations are exposed as devicet=
ree properties rather than ALSA kcontrols, violating ASoC subsystem convent=
ions.
- [Medium] Using `device_property_read_u8()` for a scalar devicetree proper=
ty creates a silent fallback trap if standard 32-bit devicetree cells are u=
sed.
--

commit 709f7c3cb7dfda3e2bb5a1b6319ef2eb235e0bae
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Add private members related to HPF

This commit adds private members to manage the left and right High Pass
Filter (HPF) values on the ES8389 codec. It reads these configurations from
devicetree properties during probe and applies them in the un-mute sequence.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 284eb707f9f7f..2460cf9775c75 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c

[ ... ]

> @@ -902,6 +904,18 @@ static int es8389_probe(struct snd_soc_component *co=
mponent)
> =20
>  	es8389->mclk_src =3D device_property_read_bool(component->dev, "everest=
,mclk-from-sclk");
> =20
> +	ret =3D device_property_read_u8(component->dev, "everest,hpfl", &es8389=
->hpfl);

[Severity: Medium]
Devicetree is typically reserved for describing hardware topology, while
software-configurable tuning parameters like an ADC High Pass Filter are
usually exposed as ALSA kcontrols. Should these HPF values be registered as
mixer controls instead of devicetree properties so userspace can dynamically
adjust them at runtime?

[Severity: Medium]
Could using device_property_read_u8() here lead to a silent misconfiguration
if standard 32-bit devicetree cells are used?

If a devicetree specifies the property as a standard cell, for example:
    everest,hpfl =3D <10>;

The read_u8 function will read the first zero-padded byte (0x00) and return
success instead of an error. This means the fallback to ES8389_HPF_DEFAULT
will be bypassed, and the hardware will be configured with 0 instead. Would
it be safer to read this as a u32 using device_property_read_u32() and then
cast or bounds-check the result?

> +	if (ret !=3D 0) {
> +		dev_dbg(component->dev, "hpfl return %d\n", ret);
> +		es8389->hpfl =3D ES8389_HPF_DEFAULT;
> +	}
> +
> +	ret =3D device_property_read_u8(component->dev, "everest,hpfr", &es8389=
->hpfr);
> +	if (ret !=3D 0) {
> +		dev_dbg(component->dev, "hpfr return %d\n", ret);
> +		es8389->hpfr =3D ES8389_HPF_DEFAULT;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609071732.2093=
9-1-zhangyi@everest-semi.com?part=3D5
