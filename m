Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA637BE70
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434784; cv=none; b=pRGrMvvrjQEZTolKGkFmjZlPHN18BjATmKyT7en8SDV237P2r4emOlusO2cfm7gPkPBY2Uq2aGZAz3Qw08G2/VPuE+C1sugA6Vs+luMPe+AUj4md3mnKVNoZeQpBSErWDJR9FOuXKCmFi8o6t/VHATXzby1pr5C1p7ZrKevD540=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434784; c=relaxed/simple;
	bh=k3exzygyaYJnZmvMbc6CI5Cg8n0oDAC28//11ZxjGIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s7qM+fcxyfCUwJAG23qcUmQMRIigDW3ON8u3k/Rz1/r/PXC1WjIvEtxbhyOQcBh19b7Jr27gLvyCTLfuoKdpr4AVEUal2WS1nyzOAoUi3M6PPmBDSzaEiohdJQ9UnyYEUR4I+MuxNTZwIYxc1mmecR5r9bzxuwhP2xPzF3nSAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGm83AG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGm83AG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC941F000E9;
	Thu, 30 Jul 2026 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785434783;
	bh=YgaHbKZ5VBBhzQs2C7uCkknvmSJU/7TGW431utf+4b0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGm83AG9ALVxBp5pT0O5KjHtxBLgMwwuhzIajx9K2FbuRteqwsS2v09ih2UIcfBLN
	 kHDSFwkRcmNAiTu2maKYJgUDygQVsanpJNr9JTdO4J7yYJKq7KP0cTiTGB0GbsijSM
	 QWChJisl0nVNi3n8nhKP0Nmemg85yKEx5oV38g3OVE/TZezfdpDNHAapOuim6gcXa5
	 iDIQaRNdPQdSaGBznmu16ThwaZrI0CNhq++487nvN35oJHLLA554XRgkpjrBmxjBbZ
	 sBX/gEv0uN/LuKcgkNjS8nPPv14Fg+cI5OlGubes76UR9P+NcPjx7m/TamyRbeem+N
	 aqztbtE7UXSog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730174353.108023-9-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 18:06:22 +0000
Message-Id: <20260730180622.CAC941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing DAPM routing entries for LPI MI2S ports in q6routing.c ren=
ders them unusable.
--

--- Patch [8]: [PATCH v6 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s s=
upport ---
commit e726403dddb3e85ced40616ddd6f3d6790dddb30
Author: Richard Acayan <mailingradian@gmail.com>

ASoC: qdsp6: q6afe-dai: add internal mi2s support

This commit adds support for internal MI2S ports on q6afe using the existing
LPI MI2S bindings. It introduces the necessary port preparation logic, DAPM
widgets, and DAPM routes for LPI_MI2S_RX_0 through LPI_MI2S_TX_6.

> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6af=
e-dai.c
> index a0d21034a6264..920345609d2c8 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
[ ... ]
> @@ -665,6 +667,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_ro=
utes[] =3D {
> =20
>  	/* USB playback AFE port receives data for playback, hence use the RX p=
ort */
>  	{"USB Playback", NULL, "USB_RX"},
> +
> +	{"LPI RX0 MI2S Playback", NULL, "LPI_MI2S_RX_0"},
> +	{"LPI_MI2S_TX_0", NULL, "LPI TX0 MI2S Capture"},
> +	{"LPI RX1 MI2S Playback", NULL, "LPI_MI2S_RX_1"},
> +	{"LPI_MI2S_TX_1", NULL, "LPI TX1 MI2S Capture"},
> +	{"LPI RX2 MI2S Playback", NULL, "LPI_MI2S_RX_2"},
> +	{"LPI_MI2S_TX_2", NULL, "LPI TX2 MI2S Capture"},
> +	{"LPI RX3 MI2S Playback", NULL, "LPI_MI2S_RX_3"},
> +	{"LPI_MI2S_TX_3", NULL, "LPI TX3 MI2S Capture"},
> +	{"LPI RX4 MI2S Playback", NULL, "LPI_MI2S_RX_4"},
> +	{"LPI_MI2S_TX_4", NULL, "LPI TX4 MI2S Capture"},
> +	{"LPI RX5 MI2S Playback", NULL, "LPI_MI2S_RX_5"},
> +	{"LPI_MI2S_TX_5", NULL, "LPI TX5 MI2S Capture"},
> +	{"LPI RX6 MI2S Playback", NULL, "LPI_MI2S_RX_6"},
> +	{"LPI_MI2S_TX_6", NULL, "LPI TX6 MI2S Capture"},
>  };

[Severity: High]
Are DAPM routing entries for the new LPI MI2S ports also required in
sound/soc/qcom/qdsp6/q6routing.c?

Looking at how other ports are routed, it seems we might be missing the
audio mixers in msm_qdsp6_widgets (such as an "LPI_MI2S_RX_0 Audio Mixer")
and the Front-End to Back-End mapping in the intercon array.

Without these entries in q6routing.c, will the ASoC core be able to
construct a valid audio path? It appears these newly added Back-End DAIs
might remain completely disconnected from the Front-End MultiMedia streams,
causing attempts to play or capture audio through them to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730174353.1080=
23-1-mailingradian@gmail.com?part=3D8
