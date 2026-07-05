Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF332D77E6
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 20:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783283107; cv=none; b=bXFttDLVcb7GXZ76HVu6/JDl7tlBRWEH0ofy9e+LRTokoZyTU29IZmL3JrRyaigaSsdYh/yVv4dReuUUHo4TQjGmo73xLyUOsf076fVubA4FRkp9KVCq40YtVXi4unPfHByHcD1uRs0g4xWOEnXXqOafmbWkwfWwuDjS1ANgJpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783283107; c=relaxed/simple;
	bh=7YHJMcp4E/DgLuuJlEnjDMAdAwm7aM+GzJcvH0l/e3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L1UVWqt/wO1jVm2xmsnsM+0D72h+PejjIsEaR+xr6Y/zV/WieJMq/X8sadcpqrvkNTPaETc/vgarqcD2i4a7ybY1nvFDlbsRa1XSMYacu7vNMNpWYxKtKvJIrktb7dIFXFCY0eimJZZLt/aYVQlyztFcjedPY9gZaqpKbl+KftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTBwXafu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTBwXafu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1F71F000E9;
	Sun,  5 Jul 2026 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783283106;
	bh=cAj7F2+zosF+lzg/oeuSOFAaFv5KVxrvIDuPlAZDyvk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WTBwXafuMx0RDkrErR0y/Tx7k0MVt1zA7DRcjodtRRepUPXl0I6K4f1vbG/Zq09me
	 lVSnPf+ExY2qUNL8zv+6ZNEpK66bLc7IhZRdxmrC7epWBbqr0I9oFT7L8w4X3L7VaN
	 Nbv7UGRHY+sQKGhsolDzKE1EgBSRzBxWKtCqaeUsFz9ch6Ew63/9RijWmt35dLvnY/
	 aVbRmS9O2tadFMRemix65z+jKneo1qf1HNUO07OcKa8/Kmy/wYWE0EmXxQc1kdmmtT
	 NGvpGZ0xSGXCtSUasURIvtz9oHekpvLTwOwUncV00rkDaM42d71Ijd5CM2YzQCbNHa
	 hTarJ/xl6D3Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/6] ASoC: qcom: sdm845: Use per-speaker RX masks
 for TDM slot assignment
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260705-pixel3-audio-v1-3-3b66f33859f1@ixit.cz>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-3-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 20:25:05 +0000
Message-Id: <20260705202505.EB1F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Changing the TDM `rx_mask` reduces the codec's capture stream ch=
annel count fixup to 1, mismatching the 2 TX slots.

Pre-existing issues:
- [High] Unsafe use of `strcmp` with potentially NULL `codec_dai->component=
->name_prefix`.
- [High] Incorrect TDM slot mapping offset for CPU DAI drops right channel =
audio.
- [High] Mismatch between CPU DAI TDM capture mask and Codec TX masks.
--

commit a3245c8cb8ad225800a041e09ecebd46b152d459
Author: David Heidelberg <david@ixit.cz>
ASoC: qcom: sdm845: Use per-speaker RX masks for TDM slot assignment

This commit splits the playback receive mask into per-speaker masks for the
Left and Right codec DAIs. This ensures that the Left codec gets assigned
to slot 0 and the Right codec gets slot 1, addressing an issue where both
were mapped to slot 0.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 9de3282bda4be..8b65aa3982d47 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -155,7 +155,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_su=
bstream *substream,
>  		if (!strcmp(codec_dai->component->name_prefix, "Left")) {

[Severity: High]
This is a pre-existing issue, but is it possible for the name_prefix to be
null here?

If the device tree is misconfigured and lacks a sound-name-prefix property
for any of the codecs on this DAI link, the name_prefix string will be null.
When unprivileged userspace opens the ALSA PCM stream, this function iterat=
es
over the codec DAIs and directly dereferences name_prefix via the standard
kernel strcmp function.

Could this lead to a kernel panic, and should there be a check to ensure
the prefix is valid before comparison?

>  			ret =3D snd_soc_dai_set_tdm_slot(
>  					codec_dai, LEFT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					LEFT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,

[Severity: Medium]
Does passing this 1-bit receive mask into snd_soc_dai_set_tdm_slot() cause
issues with capture streams?

The ASoC core unilaterally maps the receive mask parameter to the capture
stream mask. By splitting the playback mask and passing the 1-bit
LEFT_SPK_TDM_RX_MASK here, soc_pcm_codec_params_fixup() uses this mask to
override the capture channel count to 1.=20

Since the codecs transmit on 2 slots using LEFT_SPK_TDM_TX_MASK, could this
mismatch lead to incorrect channel count parameters being passed to the
codec hardware parameters and DAPM widgets?

>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,
> @@ -167,7 +167,7 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_su=
bstream *substream,
>  		if (!strcmp(codec_dai->component->name_prefix, "Right")) {
>  			ret =3D snd_soc_dai_set_tdm_slot(
>  					codec_dai, RIGHT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					RIGHT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,

[Severity: High]
This is a pre-existing issue, but does the CPU DAI capture mask match the
codec transmit masks?

The CPU DAI is configured earlier in this function with a capture mask of
SPK_TDM_RX_MASK | BIT(2) | BIT(3), which evaluates to 0x0F, instructing
the DSP to capture on TDM slots 0-3.

However, the left and right codecs are configured to transmit on
LEFT_SPK_TDM_TX_MASK (0x30, slots 4-5) and RIGHT_SPK_TDM_TX_MASK (0xC0,
slots 6-7).

Since the CPU does not listen on the slots that the codecs are actively
transmitting on, is speaker protection feedback data being permanently lost
during capture streams?

[Severity: High]
This is another pre-existing issue, but is the TDM slot mapping offset for
the CPU DAI dropping the right channel audio?

Looking at the tdm_slot_offset array definition:

static unsigned int tdm_slot_offset[8] =3D {0, 4, 8, 12, 16, 20, 24, 28};

This array maps the left channel to offset 0 and the right channel to offset
4. When passed to snd_soc_dai_set_channel_map() for the CPU DAI, the S16_LE
format forces the slot width to 16.

Whether the DSP interprets 4 as a slot index or a byte offset (which for
16-bit slots evaluates to slot 2), channel 1 is placed outside the active
CPU DAI transmit mask SPK_TDM_RX_MASK (0x03) that only enables slots 0 and =
1.

Does this cause the DSP to drop the right channel audio entirely during
standard stereo playback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-pixel3-aud=
io-v1-0-3b66f33859f1@ixit.cz?part=3D3
