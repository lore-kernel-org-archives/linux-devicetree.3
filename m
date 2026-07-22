Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E64028EE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764449; cv=none; b=btl1U8yaSMkpcY0PMdw0bb8lGnM+0Ru/ODggrQ+LyvSV4W3JPNQNFIRmOZqK0FdrLStc9kDZ8MKcboSg9Pr3ypgxarrdFXUM6Kxipmob36d+es4wo6NDS/0wYJcBjRIP8N0n+YnJBWXUOdyDZEnk8dytwze5b6m6bbEQ2JchcXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764449; c=relaxed/simple;
	bh=JkCaYo5NIKbRwzBhYYgpZ+bPxkCbsT/95HXiYxcpZvI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BnRCJ7jqnBDX+GxuHAsmiBn6wLFjXzktO7AHI7mUPS/7NyQqQ/QYDXZY0fSgPTmHw8OaH4Nqiainiz8k/9b9LVWyx55nYDas2FPfWjeGciHWW8ThrI6iCg51u8REX0bO964KMT0HrEeQNZBfB14IOnROhOqL3HQm+03EzKo1684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WW+kdT8C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WW+kdT8C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEC71F000E9;
	Wed, 22 Jul 2026 23:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784764448;
	bh=k6SF8mOF7G3TeRld2dnxei1LaMYYGu7F2ExGgwkrEtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WW+kdT8CAZjJaTEdKijD/C8OrDxojIQpbIkY1xT72LjypCqoIz6SvCK3k4qRfkEOZ
	 0dh4Za28/bF5wTR/0zs1DnPoYfPdGnGY0sLemTROWlaonIX0zblwAewVVDNXihYzXb
	 e89Rwa0z2anJtRnvKrFa0Osag1DyD3Q6/iMc8z8bkibOUrn2bArfgIA0OX/r+6daAY
	 85gcbby4QiSzgKcHmae4ex4lgxOBNzSRT6ScGIBqA9q7I3f32dq46NSUoX/rY9iAEq
	 okZngFK+M72aIBInOr0hs79YOeVXffWsGinMJk1QOslNh+T7VbQq/ADSsZuJNkVGtS
	 dBLQkjQiLJHkw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Input
 Terminals for OT DAI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 23:54:07 +0000
Message-Id: <20260722235408.2DEC71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The recursive graph traversal in `set_input_terminal_sources()` la=
cks cycle detection, allowing malformed firmware topologies to cause infini=
te recursion and a kernel stack overflow.
- [High] Output Terminal format parameters are blindly propagated to all up=
stream Input Terminals, breaking topologies with intermediate processing un=
its (e.g., Sample Rate Converters or Mixers).
- [High] Unconditional traversal of the static source graph configures inac=
tive alternative paths and clobbers shared hardware nodes without mutual ex=
clusion.
--

--- Patch [1]: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Inpu=
t Terminals for OT DAI ---
commit e1c19ca1fbb78240fd7df2f80b2ad3f08d85052a
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: hw_params: program upstream Input Terminals for OT DAI

For a capture stream the DAI is the Output Terminal so
sdca_asoc_hw_params() only programs the OT itself: cluster, clock
and Usage.  The upstream Input Terminals that actually source the
audio never get their Usage, ClusterIndex or clock programmed, so
the power domain comes up but no samples are produced.
   =20
Walk the source graph from the OT and program every Input Terminal
reachable through it.

> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index b4dedba719dc6..ac688cd629706 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
[ ... ]
> @@ -1726,6 +1726,51 @@ static int set_usage(struct device *dev, struct re=
gmap *regmap,
>  	return -EINVAL;
>  }
> =20
> +/*
> + * For a capture stream the ASoC DAI is the Output Terminal, so hw_params
> + * only programs the OT itself.  The upstream Input Terminal(s) that
> + * actually source the audio (e.g. a mic input behind a power-domain ent=
ity)
> + * never get their Usage / ClusterIndex / clock programmed and stay inac=
tive,
> + * so the power domain comes up but no samples are produced.  Walk the s=
ource
> + * graph from the OT and program every Input Terminal we reach.
> + */
> +static int set_input_terminal_sources(struct device *dev, struct regmap =
*regmap,
> +				      struct sdca_function_data *function,
> +				      struct sdca_entity *entity,
> +				      int channels, int rate, int width)
> +{
> +	int i, ret;
> +
> +	for (i =3D 0; i < entity->num_sources; i++) {
> +		struct sdca_entity *src =3D entity->sources[i];

[Severity: High]
Does this code inadvertently configure inactive alternative paths?

The loop iterates over all statically defined sources in the firmware graph,
which might ignore active ALSA/DAPM routing state like MUX selections.

Additionally, if an IT is actively shared between multiple OTs, could start=
ing
a stream on the second OT dynamically overwrite the active IT's registers
without locking and corrupt the first stream?

> +
> +		if (src->type =3D=3D SDCA_ENTITY_TYPE_IT) {
> +			ret =3D set_cluster(dev, regmap, function, src, channels);
> +			if (ret)
> +				return ret;
> +
> +			if (src->iot.clock) {
> +				ret =3D set_clock(dev, regmap, function,
> +						src->iot.clock, rate);
> +				if (ret)
> +					return ret;
> +			}
> +
> +			ret =3D set_usage(dev, regmap, function, src,
> +					SDCA_CTL_IT_USAGE, rate, width);

[Severity: High]
Can this break topologies that use intermediate processing units like a
Sample Rate Converter or channel mixer?

This propagates the Output Terminal's format parameters (channels, rate, wi=
dth)
directly to all upstream Input Terminals. If the IT does not natively suppo=
rt
the exact same hardware parameters as the OT, won't set_usage() or
set_cluster() fail with -EINVAL?

> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret =3D set_input_terminal_sources(dev, regmap, function, src,
> +						 channels, rate, width);

[Severity: High]
Is it possible for a malformed firmware topology to cause an infinite loop
here?

The recursive graph traversal in set_input_terminal_sources() doesn't appear
to have cycle detection. If entity->sources contains a cycle, could this
lead to a kernel stack overflow?

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722234221.8847=
65-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
