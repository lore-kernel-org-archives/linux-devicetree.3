Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BCB2E7165
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351899; cv=none; b=rncbqQQg7JWKaZEvgzRcJzEmcdNahX7i7CB8bNRw6grMZKNyoHrp092S+HGmE1MMWCDKVF/JuqUQc7GkJiwWjHOfgmY6/bFqUlzwEi02IL3B/J3LZCl8BmEwZbI6frZ1+uUTzs6Vn7PTNjrYccOvKi0kGeOnY1+03DNXpqHdlMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351899; c=relaxed/simple;
	bh=4AESW8smBrIgQp83iJa6A3zvfLM8S1zymT0ss2m9j+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bpjYXCTPxSiCmZ0toJZANJXOK4GY1MLrRR9qLPlBLRUE3RBiAJhWUk3+jOaZulVQ6bIqRbrY/FpHM+qXGN0wPnUDvyQY9TUE5EgsORZ7sFzywFDqCTB25tGDdbBTc0FjX/19+JCcEXjA282s2+YBKcu84ohANcOK05jjaPOpxuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwJWGmpX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwJWGmpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B54F1F000FF;
	Mon, 14 Sep 2026 02:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789351897;
	bh=E6jIkuufmVSPqcmzr1mTaMzS2eLatGUkiAXsXW7vpO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZwJWGmpXPyq9ptcMbbL/l6sVwBNBR3c2jZwmCzT2LKurFq4n5dS+MOgKDfyPDaFL5
	 QrzAuDUS4PqLB4QefwzDi9rk71N3epQg2ctvOhNeiRMPmBxyv/FweaytZqoJjapJ0+
	 Mg28klCw9YXdeK5M7/BH2v26TmB2FeyNyyIHDNYyp1JunjpjYCHJ68DpZXxX8Y2ul3
	 /rZaZptPG2F2YfCyZRs0D24q/RafuQVP7fNDAA3miVs81aOX7apVcDHDaQtvK+GTxm
	 PdQHdCeG2dxzXWboxcWl/0tshLzZHqt/s4VWERMIsDrpV1ct/toew2sk270ShQe5Cf
	 etCucTY7RPXvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] ASoC: codecs: nau8360: Block DSP path selection
 when firmware load fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914015648.311986-2-YLCHANG2@nuvoton.com>
References: <20260914015648.311986-1-YLCHANG2@nuvoton.com>
 <20260914015648.311986-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 02:11:37 +0000
Message-Id: <20260914021137.9B54F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `flush_work()` causes `alsactl` state restoration to spo=
radically fail on boot.
--

commit f48ac064e0d2cdb72be2043789666477aed5f727
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Block DSP path selection when firmware load fails

Block the DSP path selection if the firmware fails to load to prevent
invalid routing states.

If the firmware is not ready, nau8360_dac_mux_put_enum() will print
a rate-limited warning and return -EBUSY. This rejects the invalid
userspace request and maintains the original hardware state without
causing audio wrong status.

Closes: https://lore.kernel.org/linux-sound/aqK_oOpMAXVhxkHJ@stanley.mounta=
in/

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> index 89b8ee80d6c86..f5dee12127cd0 100644
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c
> @@ -715,8 +715,13 @@ static int nau8360_dac_mux_put_enum(struct snd_kcont=
rol *kcontrol,
>  	int ret =3D 0;
> =20
>  	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> -		dev_warn(nau8360->dev, "changing path is not allowed during playback");
> -		return ret;
> +		dev_warn_ratelimited(nau8360->dev, "changing path is not allowed durin=
g playback");
> +		return -EBUSY;
> +	}
> +
> +	if (item[0] =3D=3D NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
> +		dev_warn_ratelimited(nau8360->dev, "Cannot enable DSP: Firmware not re=
ady or disabled\n");
> +		return -EBUSY;

[Severity: Medium]
Will this cause boot-time ALSA state restoration to fail if the asynchronous
firmware loader is still running?

Userspace initialization tools like alsactl restore write to ALSA controls
immediately after card registration during boot. Because nau8360_load_fw_wo=
rk
is scheduled asynchronously, nau8360->load_fw_done might still be false when
alsactl attempts to restore the DSP path.

Without a flush_work() call to synchronize with the firmware loader, does t=
his
mean valid DSP routing configurations saved by the user will be sporadically
rejected during boot, causing the audio state to fall back to the default H=
W1
path?

>  	}
> =20
>  	mutex_lock(&nau8360->lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914015648.3119=
86-1-YLCHANG2@nuvoton.com?part=3D1
