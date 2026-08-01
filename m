Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C09239FCDC
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 05:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563841; cv=none; b=UHRy0SUCGCPFVdn0+GdVAqCrc34VAtXeL/CrZdDGAyF9oDr/KoRkrmV6rQYqAloCY9VlcRd2yxY3nI6ygVUeaglKiC0dpYYvz40SbK8rX9ZHYCTfdhg0yWLBVtBJH4jtGcn6StRN4CIY5wDh8gOtz4p5vZbckGUeLd4/Gu7G3TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563841; c=relaxed/simple;
	bh=UmGwuaINwgae4iV5GHMV00YesKnWGuEpDAE2TvhLT9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H7tTDdkxv025ljsHbjZnubKdhSKOWIvRjliR7BBfKcQ63vcgmKUVi9hvAi01rNwcIj1VN4RdItUcqQgfdkB2OeSE0NKURM4tPNx5dPKdinYBKjgx9hcTYIjaNEQWTtXf3wrgOC7rFpXaQKwY5UcJMvCYxUj5RYwJi/q395ULW8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCmK4JKo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCmK4JKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E447A1F00AC4;
	Sat,  1 Aug 2026 05:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785563840;
	bh=wyKpAM6w1jf4X7n4PzkCksMm0B9H4x0IgzVop94x1x4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NCmK4JKoeNjg3INuIBPgfHRXVGBM7ft9XeCV+QvhsgXiUfhEiSOF3Wavr4WOvZVt5
	 VEpSpZtK1EHxuJDPvBm6rr6zSt/bHcZ7zPLwGEZAdALAE7zAO9GBLp5Skcx10MN8yT
	 2QZwb1rtRmsBnGyoUfOOJgu9NheAAo2p/XT8jfg9/HEEN6IyrTWtw2gMER3+6GIdiR
	 3bPvGqMK2Yvmb+VAoyc6gyM4h6wzQg0hu1s6TlMnfjQ+r/UzOhzL9IZz9JUut7a5Yv
	 uAO82ReX81oMMcNdTMs5q3ScrbXqPRZR/ihjs4iB2Rqan1D3e39SmDJD13+j6jjGCB
	 Ei1nKDIMHfqow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] ASoC: qcom: common: add DAI-node TDM slot
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801054610.4047089-7-prasad.kumpatla@oss.qualcomm.com>
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-7-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 05:57:19 +0000
Message-Id: <20260801055719.E447A1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] qcom_snd_apply_dai_tdm_slots() silently swallows validation erro=
rs from qcom_snd_normalize_tdm_slots(), hiding device tree misconfiguration=
s.
--

--- Patch [6]: [PATCH v5 6/7] ASoC: qcom: common: add DAI-node TDM slot hel=
pers ---
commit f8d4d2026fa6be0ea3757ca3a1aa7c0d4b41e96e
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: common: add DAI-node TDM slot helpers

This patch adds common helpers to parse standard dai-tdm-slot-* properties
from the CPU and codec child nodes of a backend DAI link and applies the
result to the active DAIs. It provides configuration parsing, validation,
and an apply helper for callers.

> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index e4ff247ea47fd..cacf467bc2a76 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
[ ... ]
> +static int qcom_snd_normalize_tdm_slots(struct qcom_snd_tdm_slot_cfg *cp=
u_cfg,
> +					struct qcom_snd_tdm_slot_cfg *codec_cfg)
> +{
> +	unsigned int slots;
> +	unsigned int slot_width;
> +
> +	if (cpu_cfg->slots && codec_cfg->slots && cpu_cfg->slots !=3D codec_cfg=
->slots)
> +		return -EINVAL;
> +
> +	if (cpu_cfg->slot_width && codec_cfg->slot_width &&
> +	    cpu_cfg->slot_width !=3D codec_cfg->slot_width)
> +		return -EINVAL;
[ ... ]
> +int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct qcom_snd_tdm_slot_cfg cpu_cfg;
> +	struct qcom_snd_tdm_slot_cfg codec_cfg;
> +	int ret;
> +
> +	ret =3D qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
> +	if (ret)
> +		return ret =3D=3D -EINVAL ? 0 : ret;

[Severity: Medium]
Will this silently swallow validation errors from conflicting device tree
configurations?

While this logic appears intended to ignore -EINVAL when TDM nodes are simp=
ly
missing in qcom_snd_parse_dai_tdm_slots(), qcom_snd_normalize_tdm_slots()
also returns -EINVAL when there are contradictory settings (such as conflic=
ting
slot counts or widths between CPU and codec nodes).

If a device tree is provided with contradictory TDM properties, won't this
result in the error being hidden and no TDM configuration being applied,
likely leading to silent audio failures instead of failing probe with an er=
ror?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801054610.4047=
089-1-prasad.kumpatla@oss.qualcomm.com?part=3D6
