Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A792D8DD6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974823; cv=none; b=NrysezRG0g6+KEk4hQpDIdC4gdRdKYV90m8r7E0Ul3aige/yDoCekVKk03F5Nb6WIceu1lwRmxNu1aGPkQmITUofDcjAvUDCp0S9i9FHNtY8pQ4PTk2BOJA5+xq5rfy23wwJI+lMfT2K1O1H89dETkVthfPGSCStwvulhVRE+Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974823; c=relaxed/simple;
	bh=lUHVQIplGShi1G9ACa5gppo7HgP1NR5Ti3VDGRt7Ups=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lni1jLOzTdeQOTDzJqWS56qOZGWyZBgaMnwERAc2djyr3qHrioufj/4F4G3K6uXg40vxZ2c6/rJ6Q0adlijBs9FkMOsIVJb5UKQ7e5mjG29SgqQxOk41jxXc0iF4Al6fltsdFXvFY3JsR+vgmbDAYN2/Q6FKmqXOamByYNOic5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxwYyJCf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxwYyJCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64FB1F00893;
	Tue,  9 Jun 2026 03:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780974821;
	bh=V4iHl2k/1UsDSIS6GFhVTU2dlKl3KiilapqGFlxUIQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxwYyJCflltj5fIqPK0FNv7OMagTaI8jLtd4gP98T9YSgN01lZLaZwWBzQLklAXok
	 KsPm03HbuBbnWwmQGN+2XkSPrz5m97h5QVQ19+YDUVnfl2Ulr6kjoSbwQsrUAmVR4j
	 MPZb1CMIVLl4V6t8WXH45FxFYYgwMD0wvQCqdqcGiOJ1Xk6EU8ufzODpxLMd1rq0ou
	 JUp8UED/q9z//YB9oi3MtwW0pLs6Z3mzLqeFo8EjwiBt7VoP5GgW7VfuUX0MJ7aPT5
	 XPRd/a0gNnXsY+XlsqAc5N9cJOTcKiMsJaIuG7gncM+BSLf9SJ9GCmTVzYs/tr6+PZ
	 BRNqatWlmXpQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] ASoC: codecs: ES8389: Modify the initial
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609030623.17404-5-zhangyi@everest-semi.com>
References: <20260609030623.17404-5-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 03:13:41 +0000
Message-Id: <20260609031341.A64FB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing return value checks on regmap_read() in multiple functions=
 leads to use of uninitialized memory.
--

commit 13fc2779b6e0163ece67df605c65dd1048a313c5
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify the initial configuration

This commit updates the initial configuration values for the ES8389 codec.
It modifies the register writes for ISO_CTL and OSC_CLK during device
initialization.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 6ad0b580068cf..8e47b4e3214e0 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -792,7 +792,7 @@ static void es8389_init(struct snd_soc_component *com=
ponent)
> =20
>  	regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);
>  	es8389->version =3D reg;

[Severity: High]
This is a pre-existing issue, but is it safe to consume the value of reg
without checking the return value of regmap_read()?

If the underlying bus read fails, regmap_read() returns an error code and
leaves reg unmodified. This means uninitialized stack memory would be
assigned to es8389->version here.

This same pattern appears to exist in several other functions in this
driver where the regmap_read() return value is not checked before
evaluating the output variable. For example, in es8389_resume():

    regmap_read(es8389->regmap, ES8389_RESET, &regv);
    ...
    if (regv =3D=3D 0xff)

And similarly in es8389_mute():

    regmap_read(es8389->regmap, ES8389_CSM_STATE1, &regv);
    if (regv !=3D ES8389_STATE_ON) {

Could these unchecked reads lead to unpredictable hardware configuration
and incorrect control flow if a bus timeout or error occurs?

> -	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
> +	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x56);
>  	regmap_write(es8389->regmap, ES8389_RESET, 0x7E);
>  	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x38);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609030623.1740=
4-1-zhangyi@everest-semi.com?part=3D4
