Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D387D36654F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254561; cv=none; b=JN0SDGjcH2YudNGABNxeoe02D5aSrmTtinK/H+OallwMrkdxWF/k+ySwGDATkPOUkILjqmVN4nlnjU2tmUtyouXcCRtAVziCZKO3yWrgdhZaM6WskNurWIFB8AF54LEiOFQllIvjkNldqyC7HeFoMwM+4GxOcfzsCrIC1Q/JLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254561; c=relaxed/simple;
	bh=zzTAsnjNbfmbb8VWuywyxsaUUepI21zNGj6qpFJEGVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TWDMbH1WAcCEmtsRjKZfDEGQP8Q3W8N+HYg41yEwvQwoNMm22DDAMo+bYTmefOWcw8+tw64rQueS8XN03EQ7+1F3hKqZ33XFHBoiAys9O3srsIys3NyN63skDcL6csvEeISU69agkKuUMyXGoG/1/t3juBajojqq/qzHv214ApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWuFIC3h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWuFIC3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7811F00893;
	Thu, 24 Sep 2026 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790254559;
	bh=LmcQ3/AfSxInYc1umJ83i1nvyfnm8uOnzFtw2UhnAP8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kWuFIC3hIVyvIv54QBXodJMjKWW3pfWgywalsHrVLAw5FP5nqMDmMOL6FMmSdo0aY
	 TiG7KxyTIQgjrZkcXXIaftq3HTawZtyPv261A1LVHATWNajzLwXS2oX1XQV+8sRkgd
	 0ZyRZdJ6dGyz2Hh43nIlGHXyfaEjEPu/+kVf34SkFWAoiTjTAC4jesGvmSEHPhnIwT
	 pNSNu6oAFpODtkfwt8ZTwjUsTPrtlGmZWJArHniahnUB9i7A5kw9Uz9TahatgZJKfL
	 8UeCwaxyVOQW1Q3XKU2SeoRX4Cb48SCcnus0sei8HauuOoALcvXlMKmLuAje5IsGlO
	 3fR8ltSCoU+tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/8] ASoC: qcom: sdm845: Demystify TDM masks a bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-pixel3-audio-v3-1-5d06460fc8a9@ixit.cz>
References: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
 <20260924-pixel3-audio-v3-1-5d06460fc8a9@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:55:58 +0000
Message-Id: <20260924125559.2B7811F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] sdm845: MIC_TDM_RX_MASK incorrectly implies microphone receives data
--

commit 0baf5b5f350c1d7b76ce347afed1d60796da5d93
Author: David Heidelberg <david@ixit.cz>

ASoC: qcom: sdm845: Demystify TDM masks a bit

Describe the mask with the bits used for each RX/TX.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 6843ab8ba017e..0ce8265ab1c1f 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -23,9 +23,14 @@
>  #define DEFAULT_MCLK_RATE		24576000
>  #define TDM_BCLK_RATE		6144000
>  #define MI2S_BCLK_RATE		1536000
> -#define LEFT_SPK_TDM_TX_MASK    0x30
> -#define RIGHT_SPK_TDM_TX_MASK   0xC0
> -#define SPK_TDM_RX_MASK         0x03
> +#define LEFT_SPK_TDM_RX_MASK	BIT(0)
> +#define RIGHT_SPK_TDM_RX_MASK	BIT(1)
> +#define SPK_TDM_RX_MASK		(LEFT_SPK_TDM_RX_MASK | RIGHT_SPK_TDM_RX_MASK)
> +#define MIC1_TDM_RX_MASK	BIT(2)
> +#define MIC2_TDM_RX_MASK	BIT(3)
> +#define MIC_TDM_RX_MASK		(MIC1_TDM_RX_MASK | MIC2_TDM_RX_MASK)

[Severity: Low]
Does this naming convention accurately reflect the data direction?

The file appears to establish a peripheral-centric naming convention, where
SPK_TDM_RX_MASK is used for playback (speaker receives) and
LEFT_SPK_TDM_TX_MASK is used for IV sense (speaker transmits).

By this convention, since a microphone is an input device that transmits da=
ta
to the SoC, using an RX mask implies the microphone is receiving data. Would
it be more accurate to name these microphone slots MIC_TDM_TX_MASK to align
with the physical direction of the data flow?

> +#define LEFT_SPK_TDM_TX_MASK	(BIT(4) | BIT(5))
> +#define RIGHT_SPK_TDM_TX_MASK	(BIT(6) | BIT(7))
>  #define NUM_TDM_SLOTS           8

[ ... ]

> @@ -128,8 +133,10 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_s=
ubstream *substream,
>  			goto end;
>  		}
>  	} else {
> -		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> -				8, slot_width);
> +		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai,
> +					       SPK_TDM_RX_MASK |
> +					       MIC_TDM_RX_MASK, 0,

[Severity: Low]
Is this using the correct mask name for the CPU capture path?

This forms the CPU capture mask using the inappropriately named=20
MIC_TDM_RX_MASK, which contradicts the commit's stated intent to clarify=20
RX/TX directions. Could this be updated to use a TX mask instead?

> +					       NUM_TDM_SLOTS, slot_width);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-pixel3-aud=
io-v3-0-5d06460fc8a9@ixit.cz?part=3D1
