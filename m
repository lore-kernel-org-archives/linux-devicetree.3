Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC392E737E
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 01:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384776; cv=none; b=EUz+L2LyqjYsg0t+6fiy5jdK2vTNdnvSphJUl2aHV14gtjDN3c6TJdo6PDb0jAy1UAtakv3JBHAe8G46MlJXVULk26rjg8O9cH/rM9lLAu1akKzO+sSB5rKGGxyHia4Rt/rzZRorFwqeEMP58SIhY9ayrNypAmQn9oaRIaGAlzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384776; c=relaxed/simple;
	bh=mhu7VQi5nbBAN9Zn9j1l1cfmqS/PN4mzd61KAU5Q0HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNaSbuootYty/dDprHuwjlHkxeT4/iWJTdItTOCLFNe/FTi2PrPqWndAZ287puGEd+ar+e7jApy1/nZAuAcBxoL7Nb6EWUZtjd8oNJtr5iH2CRBpWAepdQ2gZQrqXnrexPz8UDTZpIelfw33615FpiESfuCfxXdLJb2cTx1hDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQLr3/lv; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQLr3/lv"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2dfa0f73c3cso4140195ad.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384775; x=1790989575; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=kQLr3/lvce7B9RMhulTxDJu5Ss1ukjOChx4GuHCABc+yu3OVnORqpIKLjgNk8crqUB
         ODiuhomWNrPDvJ4LK9Rgiuhq3iEd2Mqwsu9qooe8jNbKnOYnVlIFUXETavvgUwruHklo
         ffqyFAFBCMMCaK743h85dm931JORUN4QdNKpjB4YIArAO0Jdi3BbV9o/VK9cZaU4uF+g
         hCxHuF+KJ+3RCbMZhhoc/KejzxX4DtPR6b6PiW4+RvmoA+Rw8TOy/pytFDxY2VArRh7i
         5G2n7t3VB+ff3eCKjiWdw2+GnV2GdBG5lq4lSwyjice0cMu1woqUOQPNCXCQV9GGC/ln
         MdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384775; x=1790989575;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPh7h4QVBO0+zLyzuNTJsDnUZi453ATtVOhNG9pw0Zg=;
        b=dBU8roUjoTsr+CGOuEW2DJQW59qOzQKHWaXh4MpHT4YsybBW93pLK+5sp2vzoHNlS4
         mLMKurRL/qZwQtbAYvelZwHZtKIvyq/vAdOTIWGorR86yMC3+7gq7yrU1m15umdurMcl
         YAioJWGKFMIueCHCDejkyvN4H8NoO56q8GT4P3gu1YHV+eZh+0ChRffeAAHWLPuV3VRS
         /aZMD4pNDs0RHseydzAUx9dq/NOXdNnu6Y+GVTZZ8iPd4bOZM66NR5hzfDYxsjZFaBSW
         FM7koLSRMrPGvqZchy2y46FMtAVyAIHUSu/xU8dDbAQnSRioznqZ+6H7I0pQ3qidHKZb
         ueig==
X-Forwarded-Encrypted: i=1; AKwUvBxoJqHTgaEdoU8GcoCKdPpItjvNB4P4QUcJ1xSrExwN5yUnDDNhVooojtC06qJxZLCfvqPOZZUkGm6s@vger.kernel.org
X-Gm-Message-State: AFuF++k19QOWqMX5FNd9U7H+REw6o3lzJTuYaATZfEcdMw0rEZCtdcas
	/+6MGDmAXCMOkkaqMVUypGITPxLLqoXnU5iS2WoQtatlfX7MA+XzOJaj
X-Gm-Gg: AYBFou07HdzMlQoa3VT82y+4PBrmFuvqgRRcPDHNqNopQt1YC8Esl/Qw10vkDYdkix2
	EYGuKfWXGC6AiB/upusJi1X9ToGgyKVh+hPr1P9P5axcN6QwktaoAtVpaOfSGaMiYx8SVUQlRHv
	GEMASv66+FjmtZpFAKbA418hN4rGrNLFDdKR9URAkFzNQPIDNLPE5WZAN8xeyxshXodWPBBVRXH
	mOdloqWggU2zTgvZPoEwHZ17/LHak5DTIfeTVwjQ9zLfdwJcf7YPmWcFsP8O4WxbT4DeLHPDlIQ
	pESbOAH+/sbe6eKLSm3k3NWC9TLuco44eStoU4BhRYOL/qgznQBY6kMpPvW6O7IhqhHK7cFoeKB
	XxPBqgMurSa8EGvTKi6Rg+6Es2HUqnCKFRY5IKxYLKcAS9d5SN6Mr0vhwsj1Bal186egjnZqcw/
	vl3hCWqy3GwUX7MgsM/V/PZ4RgtAS/pZcXVYaarUTlVpON4NpO1aJco5uPt2aPu5xoS0FbfSUH+
	ea7Hj+Hq6x8/iCOCs/PH0eGo2v+NqtpixLmYe1d3CWoAXeeROyBNM7lLH8vA4Y3v0WUy1n3C7Gx
	mHw7tlx2EZ9BFGMYARafaCxfakRKezGJUfzOkqU0ktoujryQ+hI=
X-Received: by 2002:a17:903:245:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2df7da6101cmr56469765ad.9.1790384774750;
        Fri, 25 Sep 2026 18:06:14 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm17424215ad.27.2026.09.25.18.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:06:13 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Date: Sat, 26 Sep 2026 11:06:02 +1000
Message-ID: <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
In-Reply-To: <arJMrsl45g2_bLPB@sirena.co.uk>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
 <arJMrsl45g2_bLPB@sirena.co.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Mark,

On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Standar=
d Time Mark Brown wrote:
> > +static void macaudio_vlimit_update(struct macaudio_snd_data *ma)
> > +{
> >=20
> > +
> > +	/* Check that *every* limited control is locked by the same owner */
> > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > +		if (!snd_soc_control_matches(kctl, volume_control_names[ma->cfg->amp=
]))
> > +			continue;
>=20
> This is used from the volume limit timeout work which doesn't hold the
> controls_rwsem, userspace can add or remove user controls which would
> change the list so the work needs to lock the controls list.
>=20

Would it be sufficient to scoped_guard the controls_rwsem wherever we
use this pattern?

> > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> > +				   struct snd_pcm_hw_params *params)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substrea=
m);
> > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> > +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->=
id];
> > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > +	struct snd_interval *rate =3D hw_param_interval(params,
> > +						      SNDRV_PCM_HW_PARAM_RATE);
> > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > +	int i;
> > +
> > +	if (props->is_sense) {
> > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > +		return 0;
> > +	}
>=20
> It feels like this DAI ought to have separate ops...  Also, for the
> sense link will we definitely already have a rate set up?

AIUI, the cpu rate should always be set up by the time we hit
this path as it is only taken when setting up the VISENSE FE (after the
playback stuff is already set up).




