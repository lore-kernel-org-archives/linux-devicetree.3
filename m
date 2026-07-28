Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83FB346AC5
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272704; cv=none; b=a+7ua+O2ThF8t7ecw4cYUB246QUF0tPfZMWet4mjIPP7kWYv/7uaZXuBSEEz2zlAJMhfmoNmjluIrlY2d46lpy65bZypxQ/8jaX6DsaGnyPbEim6RAZgGRZkaLPiRxDddcfNjKswRo11XNcwDsnM9rlTCj6tKYwcPd67oP0K1HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272704; c=relaxed/simple;
	bh=718Ya0vqAmbq8Fz2USoyNSvWLxkScwPL/3/y/cELB5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Eru9jX4HA7VF7S6b8H3jlYMHTz5S17Icz8xp9ap72vkZ1+iz8REbdC7CR46ySKAzinc76dU8xFDG8BEuAEyncdpDN1j1bu2TPyFID6S6O+DrolJDQhF7kTZEgJsDyrwIf59hHWtiGywKVQSC4Dz4dQ6ZvMUm0weqUhSto3B0Zwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUSKAcvA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUSKAcvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86DF1F000E9;
	Tue, 28 Jul 2026 21:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785272702;
	bh=uSJvW2aSZaQQcpZ5Wgx/kgiX7MWXoK21J3zNsJ/g27w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IUSKAcvAFnQBBdYTmPce10MMR5kcY+XGTHsAlm3Wexv/AxS25RL6o/83NCvxLYx0p
	 lYUxc7YuC15JfE1r4OZPUFh8mums6DSoLWES7N5uPOp7XQrpMgbia8dGoXp21E2MLF
	 fzBDy8+JJpPqk4Q4WWKPLBwTobtUzhajqG8LQ14It056tQCSy1/csBESSeIQc/5GPq
	 PlyqnAnaQ2TB3t4p23wIk/6bXdPoTK+AnfRG8XytQPzU1Iu9u/lMkxRx870dM09SCy
	 ATAzOJR9BwszNnhIV3l5/3kA36q63MWzUjVeGoX2pNZtR2tHbNNQb9jKiFS1DWoi61
	 V8FzlnI4ZJBNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 18/18] drm/bridge: synopsys: dw-dp: Add audio support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-18-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
 <20260728-synopsys-dw-dp-improvements-v7-18-b7640fa8cf48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 21:05:01 +0000
Message-Id: <20260728210501.D86DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Multichannel audio channel allocation is hardcoded to 0 (stereo), =
breaking surround sound routing.
- [High] Audio InfoFrame can steal SDP slot 0, which is hardcoded for Video=
 Stream Configuration (VSC), corrupting the VSC packet if ALSA prepares aud=
io before the display is enabled.
- [Medium] Unconditional attempt to enable both I2S and SPDIF clocks causes=
 valid audio configurations to fail if the unused clock cannot be enabled.
- [Medium] The audio mute state (AUDIO_MUTE) is lost across DisplayPort con=
troller resets during atomic_disable/atomic_enable cycles.
--

--- Patch [18]: [PATCH v7 18/18] drm/bridge: synopsys: dw-dp: Add audio sup=
port ---
commit 5e1e4e31e16d403e05ea9b2201464ef6e1a35fc1
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add audio support

Implement audio support for the Synopsys DesignWare DisplayPort controller.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index c0026bd4c7b53..3b73e822478d7 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1679,6 +1708,247 @@ static int dw_dp_link_enable(struct dw_dp *dp)
>  	return ret;
>  }
> =20
> +static int dw_dp_audio_infoframe_send(struct dw_dp *dp)
> +{
> +	struct hdmi_audio_infoframe frame;
> +	struct dw_dp_sdp sdp;
> +	int ret;
> +
> +	ret =3D hdmi_audio_infoframe_init(&frame);

[Severity: High]
The hdmi_audio_infoframe_init() function initializes the frame to zero, whi=
ch
implicitly sets the channel allocation to 0 (stereo).

Since dw_dp_audio_prepare() receives the channel allocation in
params->cea.channel_allocation but does not save it, will multi-channel aud=
io
(like 5.1 or 7.1) be transmitted incorrectly as stereo, potentially causing
the AV receiver to drop or improperly route channels?

> +	if (ret < 0)
> +		return ret;
> +
> +	frame.coding_type =3D HDMI_AUDIO_CODING_TYPE_STREAM;
> +	frame.sample_frequency =3D HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
> +	frame.sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_STREAM;
> +	frame.channels =3D dp->audio_channels;

[ ... ]

> +static int __dw_dp_audio_enable(struct dw_dp *dp)
> +{
> +	u8 audio_data_in_en;
> +
> +	switch (dp->audio_channels) {

[ ... ]

> +	}
> +
> +	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1,
> +			   AUDIO_DATA_IN_EN | NUM_CHANNELS | AUDIO_DATA_WIDTH |
> +			   AUDIO_INF_SELECT | HBR_MODE_ENABLE,

[Severity: Medium]
The dw_dp_audio_mute_stream() function sets the AUDIO_MUTE bit in hardware,
but it does not save this state in the software context.

If the display is disabled and re-enabled (causing a hardware reset),
__dw_dp_audio_enable() restores DW_DP_AUD_CONFIG1 here but does not include
AUDIO_MUTE in its update mask.

Will an intentionally muted audio stream suddenly become unmuted after a
display power cycle?

> +			   FIELD_PREP(AUDIO_DATA_IN_EN, audio_data_in_en) |
> +			   FIELD_PREP(NUM_CHANNELS, dp->audio_channels - 1) |

[ ... ]

> +static int dw_dp_audio_prepare(struct drm_bridge *bridge,
> +			       struct drm_connector *connector,
> +			       struct hdmi_codec_daifmt *daifmt,
> +			       struct hdmi_codec_params *params)
> +{

[ ... ]

> +	regmap_read(dp->regmap, DW_DP_CONFIG_REG1, &cfg1);
> +	supported_audio_interfaces =3D FIELD_GET(AUDIO_SELECT, cfg1);
> +
> +	if (supported_audio_interfaces !=3D DW_DP_AUDIO_I2S_AND_SPDIF &&
> +	    supported_audio_interfaces !=3D audio_interface) {
> +		dev_err(dp->dev, "unsupported DAI %d\n", daifmt->fmt);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D clk_prepare_enable(dp->spdif_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_prepare_enable(dp->i2s_clk);
> +	if (ret) {
> +		clk_disable_unprepare(dp->spdif_clk);
> +		return ret;
> +	}

[Severity: Medium]
This code attempts to enable both the spdif_clk and i2s_clk unconditionally,
returning an error if either fails.

If a platform has one of these clocks defined in the device tree but it
temporarily or permanently fails to enable, will this cause the entire audio
preparation to fail even if the user only requested the other (working) aud=
io
interface?

> +
> +	if (audio_interface =3D=3D DW_DP_AUDIO_I2S)
> +		clk_disable_unprepare(dp->spdif_clk);

[ ... ]

> @@ -1720,6 +1990,14 @@ static void dw_dp_bridge_atomic_enable(struct drm_=
bridge *bridge,
>  		dev_err(dp->dev, "failed to enable video: %d\n", ret);
>  		return;
>  	}
> +
> +	scoped_guard(mutex, &dp->audio_lock) {
> +		if (dp->audio_interface !=3D DW_DP_AUDIO_UNUSED) {
> +			ret =3D __dw_dp_audio_enable(dp);

[Severity: High]
If userspace prepares audio while the display is disabled, dw_dp_send_sdp()
might allocate the first free slot (slot 0) for the Audio InfoFrame.

Earlier in this function, dw_dp_bridge_atomic_enable() hardcodes a reservat=
ion
for slot 0 for the Video Stream Configuration (VSC) packet:

	scoped_guard(mutex, &dp->sdp_lock)
		set_bit(0, dp->sdp_reg_bank);

Does calling __dw_dp_audio_enable() here then clear slot 0 (wiping out the =
VSC
packet) and reallocate it to audio since audio previously held slot 0?

> +			if (ret < 0)
> +				dev_err(dp->dev, "failed to restore audio: %d\n", ret);
> +		}
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-synopsys-d=
w-dp-improvements-v7-0-b7640fa8cf48@collabora.com?part=3D18
