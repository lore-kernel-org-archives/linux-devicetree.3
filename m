Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8725D30E83A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435351; cv=none; b=LajRwasN6dxpRqx1lpmIhACkZ5Lc4VXP+peCd6ULFoIhlaxWSCCiigBGqd8qk0JHCLFcDUJfAknHDd/7YtfKqOfNuFFXqE/PGP0cLfKTGTHUcTDq3kIp1z0KaeHQrTbSqEafF9AaeZwIQbqx8ax3a6Bd1f+/MnSDM8jedoZeGbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435351; c=relaxed/simple;
	bh=v9Mn/364N6Uwny0Z8RcfwQFeGBE1B0OsUDQc9C9rxMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bzW/U5NgeWs1V4TgEb8q0xvb/KIr322vpMEtWubHbUVdYsE0rXLcTX9iRBfSWBtiUaSC+S8qDmsPQFVS7rfn52Mu0HxrzBVD2B8YO87uFIl35hydOIcr4hdFCPbUKWIIw/gF2WPSy2XO2DbBEketyjCpchnsFE9O9Xo453OrMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmL9BiTz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmL9BiTz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF001F000E9;
	Thu, 30 Jul 2026 18:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785435350;
	bh=lxuy+mGgOoo5fTxaxjTeMDfnNFyWlwtr4vI0yGJ9smU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZmL9BiTz/cSCL5RYfs12GtKeEb9GaU0L1qCDrlfiEJ2KeXK/MrqzzxwICVRYfRFu0
	 Tw4i7yrD3FWXuNMjt7h5daGv33S58btKPDCvVY68zVH4yONx67rK/eCsCIhzYc/7o8
	 Ir3QxvP7BzaqAnfwQU5BaN1SiGGlWRveE9P8YtVnc2Sl79tkikY71yLNoPaBFIqM+J
	 i7rye7X8lj/cLjtoTM91anuKHSaehQk/321nf2k6XLZrq+UPvlWYM756fVmr5VGB2L
	 rh9e1V4gO4G+Bj5BSLiSDLjwK7BRirZLF+r0khRMECSevFPxNil5qhF8XUBj1I84pP
	 7TsTkjWPssAYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add support
 for lpi mi2s ports 5-6
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730174353.108023-7-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 18:15:49 +0000
Message-Id: <20260730181550.0BF001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added LPI MI2S DAIs lack corresponding backend AFE port =
mappings and configuration handlers, causing DAI probe and stream preparati=
on to unconditionally fail on AFE-based systems like SDM660.
--

--- Patch [6]: [PATCH v6 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add support=
 for lpi mi2s ports 5-6 ---
commit d2dcc25c1d269d302ba0498e0de038f74d01d735
Author: Richard Acayan <mailingradian@gmail.com>

ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6

This commit adds the extra LPI MI2S ports used for internal MI2S on SDM660.

Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348=
753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597

> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qd=
sp6/q6dsp-lpass-ports.c
> index e5cd82f77b552..c3d8116ad5035 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> @@ -553,11 +553,15 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dai=
s[] =3D {
>  	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
>  	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
>  	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
> +	Q6AFE_MI2S_RX_DAI("LPI RX5", LPI_MI2S_RX_5),
> +	Q6AFE_MI2S_RX_DAI("LPI RX6", LPI_MI2S_RX_6),
>  	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
>  	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
>  	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
>  	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
>  	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
> +	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
> +	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),

[Severity: High]
Will these new ports fail to probe and prepare because they are missing
backend AFE port mappings and configuration handlers?

When the machine driver binds to the LPI MI2S DAIs, q6afe_port_get_from_id()
looks up the port mapping in the static port_maps array in
sound/soc/qcom/qdsp6/q6afe.c.

Because the new LPI_MI2S ports are missing from the port_maps array, the
port_id used for the lookup will be 0 (uninitialized). This causes the
switch statement in q6afe_port_get_from_id() to fall through to the default
error case and return -EINVAL:

sound/soc/qcom/qdsp6/q6afe.c:q6afe_port_get_from_id() {
    ...
    switch (port_id) {
    ...
    default:
        dev_err(dev, "AFE port id not supported %d\n", port_id);
        return ERR_PTR(-EINVAL);
    }
}

Furthermore, q6afe_dai_prepare() and of_q6afe_parse_dai_data() in
sound/soc/qcom/qdsp6/q6afe-dai.c also lack switch cases for the new
ports, which guarantees they will fall back to their default error paths.

Should these ports also be added to the port_maps array and the relevant
switch statements in q6afe.c and q6afe-dai.c?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730174353.1080=
23-1-mailingradian@gmail.com?part=3D6
