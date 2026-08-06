Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EDC331EC2
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038282; cv=none; b=R0F+UYkptc6OpZVAcOCSl5si4zaK4BJSsdN8SGpVDDjCFpd+BpRJk3FMG/wVn5PQCyf01KFW5+9NYQIJLvO1WNyvFB71azFQtR3sT5zDk5mIxRk1Vu9J+8CI2yWQn5upJhCWHwuZMUKmDIfuuoxg69qvlToc3O32HUDAThdRih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038282; c=relaxed/simple;
	bh=3NsKblpadyqB8kFa/uHJ+jA6ZXiFSf6OKVbxtcWe08Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T4QxUa229bmC8R8bY4HEKcnhdf4iJaWi3oWO9rznBX7Njil4AmcaFCMc9dFm2QaVUjERzNUCk2dVDD5C6rCnFM53si0JXG+RYVxiZnVMhYBqZV7ymbR9pLJ8cyQAVl6pPP2IFZNgCiTRcPn3jzbcPBfPAoZjHOLHFuxF5wQaPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4u2o6l7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4u2o6l7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BEC1F000E9;
	Thu,  6 Aug 2026 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038281;
	bh=9rN6BYKnjbscIaHnxKzNteyr1HEwInIW6JwkxxMa8Z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4u2o6l7T0BcMHIzhPbROxysGYZtSWilr0ezRjCkA1kkN0Lw9A7+Y9xB15jj5BbI9
	 D/nSueC8Eo+PKGe/C/uoVNKjYF9C0WI2dOh1fixh+ZPIky8CfovuaGX9fpd04BFybs
	 b62iffyBfURjRwr0e/RZAAeo5MaK35RA54ChmAEJ6REDOYau3weq5N5hZphrKQ68vo
	 DlQ+lz3oe7GZbwih5vl6gBZON899gFZyXmxzSql4ztFtNq/cgnz+T04xjt6Yu0azJB
	 J3xS9eboWUHGh/H9E3cPnNy8HRlGhypmmsKHR4e1bRSwFH4J/uxeEoBTkwGqHhbA7N
	 rRdjrLGqIKn8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 21/21] drm/bridge: synopsys: dw-dp: Add audio
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-21-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-21-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:44:40 +0000
Message-Id: <20260806174441.48BEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Sleeping functions executed in atomic context.
- [High] Concurrent execution of ALSA audio callbacks and hardware reset ca=
uses unprotected register accesses.
- [Medium] Unchecked `regmap_read()` return value leads to use of uninitial=
ized stack variable.
--

--- Patch [21]: [PATCH v11 21/21] drm/bridge: synopsys: dw-dp: Add audio su=
pport ---
commit eb4fb1ad87ba9ac01c09edc96621a5ee17d9b830
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: drm/bridge: synopsys: dw-dp: Add audio support

This commit implements audio support for the Synopsys DesignWare DisplayPort
controller.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index b610abf76ef77..df149c52fce0f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
[ ... ]
> @@ -1697,6 +1728,261 @@ static int dw_dp_link_enable(struct dw_dp *dp)
[ ... ]
> +static int dw_dp_audio_prepare(struct drm_bridge *bridge,
> +			       struct drm_connector *connector,
> +			       struct hdmi_codec_daifmt *daifmt,
> +			       struct hdmi_codec_params *params)
> +{
[ ... ]
> +	regmap_read(dp->regmap, DW_DP_CONFIG_REG1, &cfg1);
> +	supported_audio_interfaces =3D FIELD_GET(AUDIO_SELECT, cfg1);

[Severity: Medium]
Since regmap_read() can fail and return an error code, can this leave cfg1
uninitialized?

If the read fails (e.g. due to a temporary bus issue), FIELD_GET() might
extract bits from uninitialized stack memory, which could lead to rejecting
valid audio formats or accepting invalid ones.

[ ... ]
> +static int dw_dp_audio_mute_stream(struct drm_bridge *bridge,
> +				   struct drm_connector *connector,
> +				   bool enable, int direction)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +
> +	dev_dbg(dp->dev, "audio %smute\n", enable ? "" : "un");
> +
> +	guard(mutex)(&dp->audio_lock);
> +
> +	dp->audio_muted =3D enable;
> +
> +	regmap_update_bits(dp->regmap, DW_DP_AUD_CONFIG1, AUDIO_MUTE,
> +			   FIELD_PREP(AUDIO_MUTE, enable));
> +
> +	return 0;
> +}

[Severity: High]
Can this ALSA audio callback conflict with a concurrent hardware reset?

While dw_dp_audio_mute_stream() takes dp->audio_lock before updating
DW_DP_AUD_CONFIG1, the DRM subsystem can concurrently call dw_dp_reset()
to reset the controller:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_reset() {
	...
	regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL, CONTROLLER_RESET,
			   FIELD_PREP(CONTROLLER_RESET, 1));
	...
}

Since dw_dp_reset() does not acquire dp->audio_lock before asserting the
CONTROLLER_RESET, could dw_dp_audio_mute_stream() write to the IP while it
is held in reset, resulting in a bus hang or dropped register updates?

[ ... ]
> @@ -1735,6 +2021,14 @@ static void dw_dp_bridge_atomic_enable(struct drm_=
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
> +		}
> +	}
>  }

[Severity: High]
Is it safe to acquire a sleeping mutex (dp->audio_lock) here?=20

According to the DRM subsystem guidelines, bridge atomic enable callbacks
execute in an atomic context during non-blocking commits, where sleeping
functions are not allowed.

Additionally, __dw_dp_audio_enable() called from this block contains a slee=
p:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:__dw_dp_audio_enable() {
	...
	/* Wait for inf switch */
	usleep_range(20, 40);
	...
}

Could this usleep_range() cause deadlocks or kernel warnings when invoked
from this atomic commit path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D21
