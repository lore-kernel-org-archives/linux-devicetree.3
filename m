Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1CF3F5BE3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784846329; cv=none; b=UjraNyzgi6zeG1Aj0Ywt5uXbTS4bgk2QH8avLWQRHsz76Prth5ITCol5YZ9r8ccf/SvcotxpUnbCDKbRs9Gpsu3L6uXd6Pw3sLS5qt3Wpq+P+xLM++P6bfQa3Q+vCQx77useu2toVcAgne+EDRxxpK7qqGQzWiQdWSoVpAg2icU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784846329; c=relaxed/simple;
	bh=ZxPrjSsbxT9DJDdjFuHYqaL/tLkMGXDdbRAfKvyAZeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vBr13hhabrDkB9ccXyXSieifJqjjYKOs/zKgfbSq/l7gP7GLNi3d8YjXV5ohtped4UltOUKOyfH3WKVc3pLOstT494QUX3TZwMTND67GVk5+Hf7vB7RaXIvR8rNtjBNfelLWhFtYSI3BSUqzU0dEw5q54zU7vymEAp+ieQIPF6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXManLm8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXManLm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EA11F000E9;
	Thu, 23 Jul 2026 22:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784846327;
	bh=YzXgNCJrXug++jdnBenwtCBO6+ShH4iOpkGAyuOFDQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gXManLm8CvEQBAFPKN+gK7nGb61Gz35UFD055ep8R5kzpusSAA3wl8qNxxji9w69y
	 UOZc/BEAJLSOPUDaNmlCTlrmdE+DLSVK8hFxEZKXLsvWUitqABc0l3Ws+kCjWGyyFw
	 hiSUSZI2F99WwEBdMGJwPrvBrdRFMEbo4CRPBanjgE6ejab0+Vnl5vyKOmC22xVmmH
	 nPIU0nUlzRQ0m33EKhFnITogIgXhC7IfLwGbAHymUhRZ5RbgAkBkDyXwk3PXTyjMX8
	 GXlL7BmlKLYppmrsZxfVD7BDvf1efbyW4dlHhMzjYAcmbh4dge8jX9NYw0xxp9Ub5N
	 GVptGN2nD94ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/15] drm/bridge: synopsys: dw-dp: Add audio support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-15-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v5-15-9445c2e87441@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 22:38:46 +0000
Message-Id: <20260723223847.34EA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Unhandled error from `dw_dp_audio_infoframe_send()` results in=
 a negative SDP index, leading to out-of-bounds memory write and undefined =
bitwise shifts.
- [High] Typo in sample width validation allows 32-bit audio to bypass chec=
ks and silently overflow the hardware register mask.
- [High] `dw_dp_audio_unprepare()` unconditionally clears `audio_sdp_nr` (w=
hich defaults to 0), potentially corrupting the active video stream's VSC S=
DP configuration.
- [Medium] `dw_dp_audio_unprepare()` fails to clear the audio stream and ti=
mestamp SDP enablement bits, leaving the hardware in an inconsistent state.
--

--- Patch [15]: [PATCH v5 15/15] drm/bridge: synopsys: dw-dp: Add audio sup=
port ---
commit 8d3e8e3c7ab668f3eaf614e21b09c813acc45d46
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
drm/bridge: synopsys: dw-dp: Add audio support

This commit adds audio support to the Synopsys DesignWare DisplayPort
controller. It implements the necessary DRM bridge audio callbacks and
configures the hardware to transmit I2S or SPDIF audio streams.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 2bd37e5c36da8..a9e04cee002e8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
[ ... ]
> @@ -1890,6 +1928,205 @@ static void dw_dp_bridge_oob_notify(struct drm_br=
idge *bridge,
[ ... ]
> +static void dw_dp_audio_unprepare(struct drm_bridge *bridge,
> +				  struct drm_connector *connector)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +
> +	/* Disable all audio streams */
> +	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1, AUDIO_DATA_IN_EN,
> +			   FIELD_PREP(AUDIO_DATA_IN_EN, 0));
> +
[Severity: Medium]
Does this leave the hardware attempting to send stale audio SDPs?

The setup logic in dw_dp_audio_prepare() enables EN_AUDIO_STREAM_SDP and
EN_AUDIO_TIMESTAMP_SDP in the DW_DP_SDP_VERTICAL_CTRL and
DW_DP_SDP_HORIZONTAL_CTRL registers.

However, this cleanup path disables AUDIO_DATA_IN_EN and clears the
infoframe SDP slot, but does not appear to clear the stream and timestamp
SDP bits.

> +	if (dp->audio_interface =3D=3D DW_DP_AUDIO_SPDIF)
> +		clk_disable_unprepare(dp->spdif_clk);
> +	else if (dp->audio_interface =3D=3D DW_DP_AUDIO_I2S)
> +		clk_disable_unprepare(dp->i2s_clk);
> +
> +	dp->audio_interface =3D DW_DP_AUDIO_UNUSED;
> +
> +	dw_dp_clear_sdp(dp, dp->audio_sdp_nr);
[Severity: High]
Can this unintentionally clear the video stream configuration?

When the dw_dp structure is allocated, dp->audio_sdp_nr is initialized to 0.
If a userspace application opens the audio device but closes it before
hardware parameters are configured, dw_dp_audio_shutdown() will still be
called, leading to an unconditional call to dw_dp_clear_sdp(dp, 0).

Since slot 0 is typically already in use by the video stream (allocated by
dw_dp_send_vsc_sdp), this could cause the display hardware to lose its VSC
SDP configuration and break the display.

> +}
> +
> +static int dw_dp_audio_prepare(struct drm_bridge *bridge,
> +			       struct drm_connector *connector,
> +			       struct hdmi_codec_daifmt *daifmt,
> +			       struct hdmi_codec_params *params)
> +{
[ ... ]
> +	if (params->sample_width < 16 || params->sample_width >> 24) {
> +		dev_err(dp->dev, "invalid data sample width %d\n", params->sample_widt=
h);
> +		return -EINVAL;
> +	}
[Severity: High]
Is this a typo where >> 24 was intended to be > 24?

If an ALSA client configures a stream with a 32-bit sample width,
params->sample_width >> 24 evaluates to 0, which bypasses this check.

Later in this function, the 32 value is passed to
FIELD_PREP(AUDIO_DATA_WIDTH, 32). Since AUDIO_DATA_WIDTH is GENMASK(9, 5),
this will silently overflow the 5-bit mask and truncate to 0,
misconfiguring the hardware.

[ ... ]
> +	ret =3D dw_dp_audio_infoframe_send(dp);
> +	if (ret < 0)
> +		dev_err(dp->dev, "failed to send audio infoframe\n");
> +
> +	dp->audio_sdp_nr =3D ret;
[Severity: Critical]
Could this lead to an out-of-bounds memory write if sending the infoframe
fails?

If dw_dp_audio_infoframe_send() returns a negative error code (for example,
if dw_dp_send_sdp() returns -EBUSY because the SDP bank is full), that
negative value is assigned to dp->audio_sdp_nr while the function proceeds
without returning the error.

During teardown, dw_dp_audio_unprepare() will then call:

    dw_dp_clear_sdp(dp, dp->audio_sdp_nr);

In dw_dp_clear_sdp(), this results in negative bit shifts and an
out-of-bounds write:

    EN_VERTICAL_SDP << nr
    clear_bit(nr, dp->sdp_reg_bank);

Would it be safer to return the error code here instead of continuing?

> +
> +	dev_dbg(dp->dev, "audio prepare with %d channels using DAI=3D%d\n",
> +		dp->audio_channels, dp->audio_interface);
> +
> +	return 0;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synopsys-d=
w-dp-improvements-v5-0-9445c2e87441@collabora.com?part=3D15
