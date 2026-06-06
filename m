Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2843C4B72
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 21:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780781288; cv=none; b=NYSZF4PbMef2/nQ+bJxBsj/Fipy1tPWJ8g7TyviJjBy43LR6zd/Do+0LItVH3TrAq6pVz0vIwvVa9dnPJNHidqiKcNOUpFOAFkujfoFKvVnnxBZ8JHYpSIbHK3jHoxCZ2YYlOUjGtstFGBGjDeW4ZFtesSbQY5YghSOCyoNpXqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780781288; c=relaxed/simple;
	bh=bRYaG8J91NM2baD8BW/U5F6w74wF+8OGKWf2RJDd47I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qBB83Gq4LpT1IJiaSeITuGpU1KiazV5Ql9xMaKILOXNc7SNPa3sUOF2JAooIoiv1dpyQ31S+cTKitcdS5BrCEe8iYWwFJxadgaSe88LI1DP/Htyq7MybuvZ0jpfL8HNjBbDBcQ/7gTsnLX62kKRJOsIk+3ixFhSFgae0+sIBD+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0fw+7RL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0fw+7RL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF611F00893;
	Sat,  6 Jun 2026 21:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780781287;
	bh=61rXf7wc+sM9/sNY1AZiqnpIXoTP2+8Tyhs+Jlsqwsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K0fw+7RLdX8W0dTw43Glakd8STkfFGEeUo6k/XnHV3DK76Bra1ZiliBvj3rpkiDY3
	 Uec9yKSfcelRfxS8WYwKcneOezJDxGdiocQCtjLihR9w5T1xhbOjNdhhSVjyET80Ve
	 tbIisc2uFyMcGu/HaeO1X42aZBnaUimRyDO6yPSqgt2wVxIeThbMVlFXRgBTOhstrm
	 xV+UpYKV3FMmFaDPhiOuHaWrhphDkLPYxtjcB9oHm36MzMq5AMLvahhP0WfhOb3Yud
	 2mn3BA//LlRgcH/buQxVGyTs7ouscwPgdAN8KSHWeUokO52i7AF2RuPpGIXH49k6Xr
	 n+i27ehhVjZ0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] ASoC: qcom: sc8280xp: Add per-card data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@thundersoft.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
References: <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 21:28:06 +0000
Message-Id: <20260606212806.ECF611F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect DAPM pin mask for 'Mic Jack' in qcs6490_rubikpi3_heads=
et_jack_pins causes microphone detection failure.
--

commit 869054356ad0f6ae035a50e1d5d5e99577638b9b
Author: Hongyang Zhao <hongyang.zhao@thundersoft.com>

ASoC: qcom: sc8280xp: Add per-card data

This commit converts the sc8280xp machine driver match data to a per-card d=
ata
structure to support board-specific MI2S codec requirements. It adds data f=
or
the QCS6490 RubikPi3 and a common headset jack helper.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 7925aa3f63ba0..1ccd7437cc52d 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c

[ ... ]

> +static struct snd_soc_jack_pin qcs6490_rubikpi3_headset_jack_pins[] =3D {
> +	{
> +		.pin =3D "Mic Jack",
> +		.mask =3D SND_JACK_HEADPHONE,

[Severity: Medium]
Does this mask prevent correct DAPM routing for the microphone? It looks li=
ke
SND_JACK_HEADPHONE is used instead of SND_JACK_MICROPHONE for the Mic Jack =
pin.

> +	},
> +	{
> +		.pin =3D "Headphone Jack",
> +		.mask =3D SND_JACK_HEADPHONE,
> +	},
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607-rubikpi-ne=
xt-20260605-v1-0-7f334e16fea6@thundersoft.com?part=3D4
