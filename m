Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F90481DD
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788837475; cv=none; b=gAYNNs17gSDcfHJ0w7Y2d+YCj9EiKbz0jQzCMoRrSlRs6PXaT8EmQhAkkRJ9l1xeLZrSPQAPWpP0CxMbpGCUjZtDgpMvwVIU8n6Sv3TMxa6FeA9klF8y5tCQ8KtzWmFLmlxTDxllkdtAEU1A0npf32UznYiKCdyAkqbTra8fI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788837475; c=relaxed/simple;
	bh=5NseRyRi968eXRqZb2awjwwP4f0aJtbAOxy5vIm1aeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pwT/AV1qIWjvlUQQEL4R7eYIKcFeN9TpGBXhAtO5hvWArvBt5kpSwJthLQgA/byebpbE4lz/rRSIrR7D9t06EqEdYDgDfPTOmVJ28CFVt13Mh/i7f/7ryUpeLh/RhWN7TwO5F1/TUxvIl0vbALS2+blU5v+OFbIsk6ylLTlWEPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLUKzoK0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLUKzoK0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E531F00A3A;
	Tue,  8 Sep 2026 03:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788837473;
	bh=2pOfPs2I2lqTV3q9mPOxGycPBl8CeNJAGMCvshtRIrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLUKzoK0P4QqClv2jgiv/leBBjMSY6ynCWQ39kXdG9Y/M1KRrJliG4iFJHDCR8ivX
	 VONTdgvGYyUaP0qONKTB4jENjVmTqIhsAOa75zd1jV6XASGWaitnNlUmrY8HZjEetH
	 D5AWvntAyTUj+3rXEU9pKZA40XFTsiGv7ejrPPGZ0hMCtRXq3lVlorfjjxf24vx6Uo
	 v23yAqiv0o6SGEFP26CXUJMTEYIPG8K2Ybt1+l/dt8XvVmQlG3g0qfaCNXVY1MQRBs
	 JAke1myXShAkuf47FVWsaZdFDUEawWlkArXTcDmOeA4QFBZrofR9SZIbmq5Adg8uNS
	 CnrTLHAhccWLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ASoC: codecs: nau8360: Block DSP path selection when
 firmware load fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908030342.222655-1-YLCHANG2@nuvoton.com>
References: <20260908030342.222655-1-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 03:17:52 +0000
Message-Id: <20260908031753.19E531F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Returning 0 instead of a negative error code when rejecting a co=
ntrol write falsely signals success to userspace.
- [Medium] Un-ratelimited dev_warn in a userspace-triggerable put callback =
allows kernel log spam.

Pre-existing issues:
- [High] AB-BA deadlock between nau8360->lock and DAPM mutex during concurr=
ent stream startup and mux update.
--

commit 54e06a9679644c8f5b17d3ad1a405ed38c16ac9a
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Block DSP path selection when firmware load fails

This commit blocks the DSP path selection in nau8360_dac_mux_put_enum()
if the firmware is not ready. It adds a check to reject the userspace
request and print a warning to prevent invalid routing states.

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> index 89b8ee80d6c86..57a5023fe7b7c 100644
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c
> @@ -719,6 +719,11 @@ static int nau8360_dac_mux_put_enum(struct snd_kcont=
rol *kcontrol,
>  		return ret;
>  	}
> =20
> +	if (item[0] =3D=3D NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
> +		dev_warn(nau8360->dev, "Cannot enable DSP: Firmware not ready or disab=
led\n");

[Severity: Medium]
Can this un-ratelimited warning lead to kernel log spam? If a userspace
application continuously attempts to set the DSP path while the firmware
is not loaded, it might flood dmesg and hide other system messages.

> +		return ret;

[Severity: Medium]
Since ret is initialized to 0, does returning 0 here falsely signal success
to userspace?

The commit message mentions that returning 0 rejects the invalid request, b=
ut
it looks like when userspace attempts to set the DAC path to DSP before the
firmware is loaded, the application might cache the control state as DSP
while the hardware remains in HW1.

Should this return a negative error code like -EBUSY or -EINVAL instead to
properly reject the request?

> +	}
> +
>  	mutex_lock(&nau8360->lock);
> =20
>  	ret =3D snd_soc_dapm_put_enum_double(kcontrol, ucontrol);

[Severity: High]
This is a pre-existing issue, but does this locking sequence create an AB-BA
deadlock?=20

In nau8360_dac_mux_put_enum(), nau8360->lock is acquired, and then
snd_soc_dapm_put_enum_double() takes the DAPM mutex:

nau8360_dac_mux_put_enum()
  mutex_lock(&nau8360->lock);
  snd_soc_dapm_put_enum_double()
    snd_soc_dapm_mutex_lock(card);

However, if a stream startup occurs concurrently, dapm_power_widgets() will
hold the DAPM mutex and can trigger nau8360_dsp_clock_event() which acquires
nau8360->lock:

dapm_power_widgets()
  snd_soc_dapm_mutex_lock(card);
  ...
  nau8360_dsp_clock_event()
    mutex_lock(&nau8360->lock);

Could an unprivileged user trigger both actions concurrently and deadlock
the audio subsystem?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908030342.2226=
55-1-YLCHANG2@nuvoton.com?part=3D1
