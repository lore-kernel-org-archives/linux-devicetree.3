Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16F47DD61
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523849; cv=none; b=j0lipvCvxTW7iyiSADA0aSmJhekAwoxLKkXrvCurh9rJnroIuLoy+7c4cRZQUvygdQVUjdrLJYFCcQmgnOCpzzY/1RO6odKLT6qqRNbNBKasMK7oDdhEDg6pseenRvg97IpZ96Vl2I3Zrxbt7ujLfIf07jC0L9b4UpSEXZcc4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523849; c=relaxed/simple;
	bh=/8ZvffL3ILEBrk/0x1tLtqVFd5vGZKigFoFjHZaarmI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UJ0BcVTlDZrc88hq0QN62dNafvblFBS+xjk2ERxD2U6mX/QvstKjidFxM2pGes6E3XzoeVlIGu/Gx3AenQZBW0AArjw6ws+bvME4FiUWGB+k86nP8rP986mEV3nQ6MHVCyMQrzpweNqre1kW7I+kypND9aPphlkIagxXSlSAHbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qg/WrjoG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg/WrjoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6741F0155B;
	Fri, 31 Jul 2026 18:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523847;
	bh=l4qxjJ4vguVqiVbxPKNbVuC3TCtuX8zcoi1SjPSZQGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qg/WrjoG0YM1nK4/h5SeOkiTytL/UThmEcLyEOyTAJaVfiDUDB7I1nIaP/CTLS8LN
	 lUhsk5gbMym0Q0Kj6BDNqvjTSCL7BdmZXqeonQJ5LeIzDn+nEIOhWsjRV17eloLH94
	 qoWRB64WVcogJsZVhRd+iD8oOOPxbRkpbezODn+4Ma4wVBI1mom4MnQXCPc35jFF8v
	 ncHpQrQAta8yAR7965zkKjCyQ0R22/931pcR0pW+zMccyk3/f9gh6J3H4VTwmn2OqY
	 1+PJwYdnBr88wFrkHaenhhDx3xDZBVi4oO83GwqYe3HuUKU/Uu7n2Zu+3X9Q2OuiIb
	 Or1wQ6Rd43oYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 21/21] drm/bridge: synopsys: dw-dp: Add audio support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-21-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-21-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:50:46 +0000
Message-Id: <20260731185046.9B6741F0155B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing lock in dw_dp_audio_mute_stream() creates a data race on=
 dp->audio_muted and hardware registers, leading to state inconsistency.
--

--- Patch [21]: [PATCH v8 21/21] drm/bridge: synopsys: dw-dp: Add audio sup=
port ---
commit 4c38ba6f108f1bab4d60be41675a0058796ffe6a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add audio support
   =20
Implement audio support for the Synopsys DesignWare DisplayPort controller.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index a39007f13a052..a62fca20ac2fe 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> +static int __dw_dp_audio_enable(struct dw_dp *dp)
> +{

[ ... ]

> +	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1,
> +			   AUDIO_DATA_IN_EN | NUM_CHANNELS | AUDIO_DATA_WIDTH |
> +			   AUDIO_INF_SELECT | HBR_MODE_ENABLE | AUDIO_MUTE,
> +			   FIELD_PREP(AUDIO_DATA_IN_EN, audio_data_in_en) |
> +			   FIELD_PREP(NUM_CHANNELS, dp->audio_channels - 1) |
> +			   FIELD_PREP(AUDIO_DATA_WIDTH, dp->audio_sample_width) |
> +			   FIELD_PREP(AUDIO_INF_SELECT, dp->audio_interface) |
> +			   FIELD_PREP(HBR_MODE_ENABLE, 0) |
> +			   FIELD_PREP(AUDIO_MUTE, dp->audio_muted));

[ ... ]

> +static int dw_dp_audio_mute_stream(struct drm_bridge *bridge,
> +				   struct drm_connector *connector,
> +				   bool enable, int direction)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +
> +	dev_dbg(dp->dev, "audio %smute\n", enable ? "" : "un");
> +
> +	dp->audio_muted =3D enable;
> +
> +	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1, AUDIO_MUTE,
> +			   FIELD_PREP(AUDIO_MUTE, enable));
> +
> +	return 0;
> +}

[Severity: Medium]
Does this function need to hold dp->audio_lock when modifying dp->audio_mut=
ed
and the DW_DP_AUD_CONFIG1 register?

If ALSA calls dw_dp_audio_mute_stream() concurrently with a modeset that is
calling __dw_dp_audio_enable(), could it lead to a desync between the hardw=
are
state and dp->audio_muted?

For example, if __dw_dp_audio_enable() reads dp->audio_muted as false, and
before it writes to DW_DP_AUD_CONFIG1, dw_dp_audio_mute_stream() executes,
updates dp->audio_muted to true, and successfully mutes the hardware.

Would __dw_dp_audio_enable() then overwrite the hardware register with its
stale false value, leaving the audio stream unexpectedly unmuted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D21
