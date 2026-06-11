Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4625F7B9
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781148365; cv=none; b=lPy+msDdm1ZEJf+2sII2+90a1WVDD83KjI7kjgbkmU+DUiz6c6F6BL0UM/CjAZUSnI0KVdYFU6Htmiy7uoqjmaKoKCH3fhNplgNhk6/4DSfC5sk+nphuHYY4E1RmC5U84UuAiz/wL0JYFb/TKAvy+mMEmZsgy9AxSbGBC/SOF6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781148365; c=relaxed/simple;
	bh=vKdXiqNQUrTJnLPiZlwDDA3fAHSSAxJjB/aac4p3WgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ry4HjpYhtZFQaXoZx4RiZWXMbXtjdy7YD9Jp8WiZOoQo6bH1Jlrl32RAMnHgKW3TDG3vbk5DO/7jaZV0IsBF8mTJhbuDN6BDK0OoEngVrUm69BvCG1yS5kpmjVeB0S4dBU7Zby8FEAqT+CENg+TIJ1IwYWesZxgGep/5naHNzoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZE3aSQ7/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZE3aSQ7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B04A1F00893;
	Thu, 11 Jun 2026 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781148364;
	bh=bAEZv8DaeXD+3OFfBsUHm78w6UMq48pZfc+Q4lwwbDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZE3aSQ7/tfiw54lc22qEhFc1YHf2VX1S7C9woqr4VS8+fGUjeK36eN9cDq20DJahG
	 51L9no6f2N4lzGgVTF6BWCR9AL5VpvsTJEhOO+SVIQ7P/BPZl/W58v98m4RM5od4Q7
	 Mqqn0dBTOzEoIuqt0SF03tOhSzEJ2uhcTxWi31CO9XYoItXCrqqMkAv3HQPTVlWlE9
	 is93O3hXEa07PMpwLUh1+8O14tUJWhTEof8HQ//1REVM20yuqIjnDPufK9CzDoJ7Vg
	 9CljRTI8dERbe2iGUJ9xNdSsxhp4uV5kSku1W5OmY748srJvfOi9lzt2GMBlrhOPIk
	 /2YtptCfHOSRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/7] ASoC: codecs: ES8389: Modify the initial
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611031824.4628-6-zhangyi@everest-semi.com>
References: <20260611031824.4628-6-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:26:03 +0000
Message-Id: <20260611032604.3B04A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return values of multiple `regmap_read()` calls are ignored, l=
eading to the use of uninitialized stack variables.
--

commit eeca5823fe9bef5ffe179596ec0a3aab2d9ba07a
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: codecs: ES8389: Modify the initial configuration

Modify the initial configuration.

> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 647d9d62820e6..284eb707f9f7f 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -793,7 +793,7 @@ static void es8389_init(struct snd_soc_component *com=
ponent)
> =20
>  	regmap_read(es8389->regmap, ES8389_MAX_REGISTER, &reg);
>  	es8389->version =3D reg;

[Severity: High]
This isn't a bug introduced by this patch, but I noticed the return value of
regmap_read() is ignored here. If the read fails, 'reg' will remain
uninitialized, and es8389->version will be corrupted with stack garbage.

Could this also cause unpredictable behavior in other parts of the driver?
Similar unchecked regmap_read() calls seem to exist in:
- es8389_pcm_hw_params() (corrupting dmic_enable)
- es8389_mute() (triggering spurious state changes)
- es8389_resume() (potentially triggering es8389_init() erroneously)

> -	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
> +	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x56);
>  	regmap_write(es8389->regmap, ES8389_RESET, 0x7E);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611031824.4628=
-1-zhangyi@everest-semi.com?part=3D5
