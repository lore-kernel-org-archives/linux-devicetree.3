Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12D1384CF0
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460915; cv=none; b=QQeLECLZTE4iXUwP3ZYhYzIsqmDyAzAdRnWsDk2DTS2TyBZp9xssgdQyjMKbhXtRHp1777gZC6iUVwpGTttGoou37ZoJfbh/ZiS2Q+BW1C3npocteD0B1joIUVPMNqNOm5Yh0nLByukj1btKr11hZ7O9i8valb14gUqmq1fg2tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460915; c=relaxed/simple;
	bh=IviMek4fKUwt8VH072dmzWXphQw8MgniUYnwmnsTSvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qtVEIELIZt6+fGSlKbklRnDXyE9kB3TAJtjj0IPy2Onnen1zfRcXIDBBBWEoN1TvFMITm+AtUmxO0O3ZM4+YuAkYJrprcSPkR2AV42iNl8QDNoYKIjYEPd0XTxQHKmyr6k8mnpUHyRpHuXm0UrEkrteZUmHbf/fkuCHh2h3C4no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BogWVTVR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BogWVTVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C091F000E9;
	Thu,  3 Sep 2026 18:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788460907;
	bh=KdPH7qcQpADjdY0VPkSwriwOk53C1RaMn9q/AWNCCpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BogWVTVR9WgqPpp0kF4k+eG1n/ko3N66cy84YSk6tT2ySKuS5FGxkdEuPItdatMA6
	 jGm7fNE5ENBFemaf7S0umIdYbBZ6KBxo5L+iUieDnRM7RnFyCpyRqGrUnX32fCwZia
	 tunFQXkCwQBrR9kmJFVG3c9GWKeBfI3tVXgjJPBBadcVm+slzqPoNzGiX0lixgz/zM
	 asIax2WpQVBDfHE3qS0e/1KzbErJ55o47Y7hB0tDuCsihFcCvHQNJrTTI0/qVs3l9w
	 CKN79/xjh/qc+Enqg5ylG6uo8XnD+ea77gdC9qpeRTk9Slx+J/z7+AHG//p2P0YuZ6
	 c8DLb5KbE7LuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 3/6] ASoC: qcom: sdm845: Use per-speaker RX masks
 for TDM slot assignment
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260903-pixel3-audio-v2-3-7c22ed915291@ixit.cz>
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
 <20260903-pixel3-audio-v2-3-7c22ed915291@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 18:41:47 +0000
Message-Id: <20260903184147.85C091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential NULL pointer dereference when calling strcmp() on an unc=
hecked codec_dai->component->name_prefix.
- [High] Improper reuse of the speaker playback mask (`SPK_TDM_RX_MASK`) fo=
r the CPU capture mask, causing dropped speaker feedback.
--

commit fc9c3ae11318fad7d402ab1b0d3e9652106e6e97
Author: David Heidelberg <david@ixit.cz>

ASoC: qcom: sdm845: Use per-speaker RX masks for TDM slot assignment
   =20
Both Left and Right codec DAIs were passing the same SPK_TDM_RX_MASK,
both speakers ended up on slot 0, breaking the one speaker in
configuration such as on Pixel 3.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index d1cc825fc5cdc..59cfa3b26cd4d 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -157,7 +157,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_su=
bstream *substream,
>  		if (!strcmp(codec_dai->component->name_prefix, "Left")) {

[Severity: High]
This isn't a regression introduced by this patch, but can this cause a kern=
el
panic if a device tree is missing the optional sound-name-prefix property?

If a local user opens the ALSA PCM device, it triggers
sdm845_tdm_snd_hw_params() which unconditionally passes
codec_dai->component->name_prefix to strcmp().

If the property is missing, name_prefix will be NULL. Can this strcmp()
dereference the NULL pointer and cause a panic?

This same unchecked dereference also occurs during PCM startup:

sound/soc/qcom/sdm845.c:sdm845_snd_startup() {
    ...
    for_each_rtd_codec_dais(rtd, j, codec_dai) {
        if (!strcmp(codec_dai->component->name_prefix, "Left")) {
            ...
        if (!strcmp(codec_dai->component->name_prefix, "Right")) {
    ...
}

>  			ret =3D snd_soc_dai_set_tdm_slot(
>  					codec_dai, LEFT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					LEFT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,
> @@ -169,7 +169,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_su=
bstream *substream,
>  		if (!strcmp(codec_dai->component->name_prefix, "Right")) {

[Severity: High]
This is the same pre-existing regression as above, but does this code
similarly panic if the sound-name-prefix property is missing for the right
codec?

>  			ret =3D snd_soc_dai_set_tdm_slot(
>  					codec_dai, RIGHT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					RIGHT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,

[Severity: High]
This is a pre-existing regression cemented by an earlier patch in this seri=
es,
but does the CPU DAI capture configuration miss the speaker TX slots?

When a capture stream is opened, sdm845_tdm_snd_hw_params() configures the
capture mask:

sound/soc/qcom/sdm845.c:sdm845_tdm_snd_hw_params() {
    ...
    } else {
        ret =3D snd_soc_dai_set_tdm_slot(cpu_dai,
                                       SPK_TDM_RX_MASK |
                                       MIC_TDM_RX_MASK, 0,
                                       NUM_TDM_SLOTS, slot_width);
    ...
}

Because it uses SPK_TDM_RX_MASK | MIC_TDM_RX_MASK, it captures from slots 0=
-3.

This completely ignores LEFT_SPK_TDM_TX_MASK and RIGHT_SPK_TDM_TX_MASK. Does
this break the TDM routing for speaker IV sense feedback data transmitted on
slots 4-7?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-pixel3-aud=
io-v2-0-7c22ed915291@ixit.cz?part=3D3
