Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C68239D3D3
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785978639; cv=none; b=eCkeUOsz3ERnLI5zZ4MAIFoGLc8DhpHs08G1XIGdVvUvZjXEWSNSS6uCi9J/YkqF1c0oQUggNEQtE8GBsMwxHJnTIIFI0pIPfD3fj5L9kzup2Dd8uBnCCDOK9vOd3w91/i/xZ2d5Nydjhb5OODtez76pec8egGIgKSurqMIC8pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785978639; c=relaxed/simple;
	bh=R1xzqfbFC2U9N0wF05c3mVFpCi7t05VZbkZ4C9N/6aI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R83LL5jNZRs7Mx2pkaXhzQEKRR8J9RLODVEpihW1MzsV4QPaZuV+4u7sQHDReWYQKdlewjsOxLnZHFycdK1UmU/c1hg3N4ShLL+mgEgTelYOj74H5O1UWm3spLngNSRVJpUps+3ZiBldh0mCftRRTm9Q7MfE0Is4Vj4QiaDqUu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCVNnRA7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCVNnRA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2B01F000E9;
	Thu,  6 Aug 2026 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785978637;
	bh=gGiIJ6X/2UaRzL0MmJ4Yaw6N6v5yNsMTF0ENa2isIGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QCVNnRA7e19xmbKcVdgSTtZlJg+nscTeUiccZ10WfwT0TtkADiAR32pOSZEeKjKNM
	 qAZ7hRV0AJUQv4xtX0xxPN/tKNFj89sMf6aDIcH4cpqH2ozeIKoQMWYCduM3hIgttW
	 8tvcEmM39lJhqCZn1fEgFSgE4rw8uPo691K7OGSpFgh3HnT/S8U1W+hnwLGdu1CgP8
	 dwMX3p3r206ybNjK6trGEs4sUZp0Cbvy4zR8R0Tx0bo2W3G2XdugiczEivZnK0Hu+L
	 QfLmbHfDSPs6KLSCIu1ZHFrmdIb15JwrhgBK5TQHS3nioM2FK0qgqZyJE5XNfQh1ps
	 sLkYP/0E5r1EQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 21/21] drm/bridge: synopsys: dw-dp: Add audio
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-21-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v10-21-d84a26c303d6@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 01:10:36 +0000
Message-Id: <20260806011037.4D2B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing cleanup on error path in `__dw_dp_audio_enable()` leaves=
 hardware in inconsistent state.
- [Medium] API Contract Violation: Driver advertises support for up to 8 ch=
annels but explicitly rejects 4 and 6 channels.
--

--- Patch [21]: [PATCH v10 21/21] drm/bridge: synopsys: dw-dp: Add audio su=
pport ---
commit 9ab6f22adc71114a7960ab5539cd2a122bac5aef
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Date:   Thu Aug 6 00:39:27 2026 +0000

    drm/bridge: synopsys: dw-dp: Add audio support

This commit implements audio support for the Synopsys DesignWare DisplayPort
controller. It adds functions to manage audio stream setup, infoframe
sending, and integrates with the HDMI audio codec helper.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 264d8dd50c413..0175590f3f56f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1696,6 +1727,254 @@ static int dw_dp_link_enable(struct dw_dp *dp)
>  	return ret;
>  }
> =20
> +static int dw_dp_audio_infoframe_send(struct dw_dp *dp)
> +{

[ ... ]

> +static int __dw_dp_audio_enable(struct dw_dp *dp)
> +{
> +	u8 audio_data_in_en;
> +
> +	switch (dp->audio_channels) {
> +	case 1:
> +	case 2:
> +		audio_data_in_en =3D AUDIO_DATA_IN_EN_CHANNEL12;
> +		break;
> +	case 8:
> +		audio_data_in_en =3D AUDIO_DATA_IN_EN_CHANNEL12 |
> +				   AUDIO_DATA_IN_EN_CHANNEL34 |
> +				   AUDIO_DATA_IN_EN_CHANNEL56 |
> +				   AUDIO_DATA_IN_EN_CHANNEL78;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1,
> +			   AUDIO_DATA_IN_EN | NUM_CHANNELS | AUDIO_DATA_WIDTH |
> +			   AUDIO_INF_SELECT | HBR_MODE_ENABLE | AUDIO_MUTE,
> +			   FIELD_PREP(AUDIO_DATA_IN_EN, audio_data_in_en) |
> +			   FIELD_PREP(NUM_CHANNELS, dp->audio_channels - 1) |
> +			   FIELD_PREP(AUDIO_DATA_WIDTH, dp->audio_sample_width) |
> +			   FIELD_PREP(AUDIO_INF_SELECT, dp->audio_interface) |
> +			   FIELD_PREP(HBR_MODE_ENABLE, 0) |
> +			   FIELD_PREP(AUDIO_MUTE, dp->audio_muted));
> +
> +	/* Wait for inf switch */
> +	usleep_range(20, 40);
> +
> +	/*
> +	 * Send audio stream during vertical and horizontal blanking periods.
> +	 * Send out audio timestamp SDP once per video frame during the vertical
> +	 * blanking period
> +	 */
> +	regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
> +			   EN_AUDIO_STREAM_SDP | EN_AUDIO_TIMESTAMP_SDP,
> +			   FIELD_PREP(EN_AUDIO_STREAM_SDP, 1) |
> +			   FIELD_PREP(EN_AUDIO_TIMESTAMP_SDP, 1));
> +	regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
> +			   EN_AUDIO_STREAM_SDP,
> +			   FIELD_PREP(EN_AUDIO_STREAM_SDP, 1));
> +
> +	if (dp->audio_sdp_nr >=3D 0) {
> +		dw_dp_clear_sdp(dp, dp->audio_sdp_nr);
> +		dp->audio_sdp_nr =3D -1;
> +	}
> +
> +	dp->audio_sdp_nr =3D dw_dp_audio_infoframe_send(dp);
> +	if (dp->audio_sdp_nr < 0)
> +		return dp->audio_sdp_nr;

[Severity: Medium]
If dw_dp_audio_infoframe_send() fails, this error path returns immediately.
Does this leave the hardware in an inconsistent state, since DW_DP_AUD_CONF=
IG1
and DW_DP_SDP_VERTICAL_CTRL registers were modified earlier in the function
but are not reverted on this path?

> +
> +	return 0;
> +}

[ ... ]

> +static int dw_dp_audio_prepare(struct drm_bridge *bridge,
> +			       struct drm_connector *connector,
> +			       struct hdmi_codec_daifmt *daifmt,
> +			       struct hdmi_codec_params *params)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +	u8 supported_audio_interfaces;
> +	enum dw_dp_audio_interface audio_interface;
> +	u32 cfg1;
> +	int ret;
> +
> +	guard(mutex)(&dp->audio_lock);
> +
> +	/*
> +	 * prepare might be called multiple times, so release the clocks
> +	 * from previous calls to keep the calls in balance.
> +	 */
> +	if (dp->audio_interface !=3D DW_DP_AUDIO_UNUSED)
> +		__dw_dp_audio_disable(dp);
> +
> +	/* The hardware is limited to 1,2 or 8 channels */
> +	switch (params->cea.channels) {
> +	case 1:
> +	case 2:
> +	case 8:
> +		break;
> +	default:
> +		dev_err(dp->dev, "invalid audio channels %d\n", params->cea.channels);
> +		return -EINVAL;

[Severity: Medium]
Since hdmi_audio_max_i2s_playback_channels is set to 8 in dw_dp_probe(), the
ALSA subsystem will advertise support for up to 8 channels to userspace.

If userspace applications attempt to negotiate 4 or 6 channel audio
(e.g., 5.1 surround), will they unexpectedly fail with -EINVAL here during
stream preparation instead of being safely constrained by ALSA upfront?

> +	}

[ ... ]

> @@ -1734,6 +2013,14 @@ static void dw_dp_bridge_atomic_enable(struct drm_=
bridge *bridge,
>  		dev_err(dp->dev, "failed to enable video: %d\n", ret);
>  		return;
>  	}
> +
> +	scoped_guard(mutex, &dp->audio_lock) {
> +		if (dp->audio_interface !=3D DW_DP_AUDIO_UNUSED) {
> +			ret =3D __dw_dp_audio_enable(dp);
> +			if (ret < 0)
> +				dev_err(dp->dev, "failed to restore audio: %d\n", ret);

[Severity: Medium]
If __dw_dp_audio_enable() returns an error, the failure is logged, but
should __dw_dp_audio_disable() be called here as a fallback to properly cle=
an
up the hardware state?

> +		}
> +	}
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v10-0-d84a26c303d6@collabora.com?part=3D21
