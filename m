Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1641C862F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271828; cv=none; b=reiBjhQX5QVvGsQk6Qp3ZG2xNIXtV2Kz15AGXn1W/zUcxKrZfUKrYkABWuTNQyrGCPUuchLVC4Bw9/ixwipNS2BBNUv9wbaj5dP1b69g+lzppYhgHOYyTk7H94jEt8AaZag8apt3+cZtb3BrU72yFVsoY1nVAhjZMDZrxok6uR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271828; c=relaxed/simple;
	bh=qEWk/wGkiGIKMpJdSK8XvVQj4rqTrcapNPU241gS+rM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bHOsq4MXDyM3PIvPfyxd+/GMIv7LlEV3YaYQGdlvSzPn/GOj6kdzXvbgCp2gu1y3w4d+/TjxSAYD9U/dOTVx2pzsymV4YpmfMfN9j8UuzO5KYJGaNG54vlflxB7EqtQsFpo8h8qsQZLCjiqc3Ys9QGHNtqxmoSraj7C3KKPdqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIiqCe7N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIiqCe7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2A21F000E9;
	Tue, 28 Jul 2026 20:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785271827;
	bh=LCL1QNvxMPjzTjFmC0W8Ajtf4tzoBIcO2WYr15c4cMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eIiqCe7NOB+cT/HHlB5QEwva/h/LoyHSEzCvOV2puRNgBhZKqwWgtzGIwlZA63elw
	 M77EwJhXWsDnZlGHqJZpWnGfzTc0uwcOgBhimDydUHwz4aAgCj38HOl5LDsxtsXhPK
	 aBhZqITeDnVOFRL1Tj91m3ajFK2adqet/NAY75KlgrK9le0y1AgCmTeJY5jesqeq+2
	 E+DClHwN62IZYx3IBJhYKEM96TGAIzSB9cXhIl9lrqDrP5YXkfQzvsbrLZnxDTMOiL
	 ZgYOPjyZgQ+TKphZvjUA6Po0BErlnKqASlbWfu0lb0ZFIWET2vYb+njjD1SbHDjDcP
	 2IxeQKtPSnz9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 17/18] drm/bridge: synopsys: dw-dp: Clear only
 enabled SDPs on atomic disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-17-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
 <20260728-synopsys-dw-dp-improvements-v7-17-b7640fa8cf48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 20:50:26 +0000
Message-Id: <20260728205026.EF2A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced and unconditional clearing of SDP slot 0 defeats tracki=
ng and risks concurrent stream corruption.
- [High] Sleeping functions are called from an atomic commit callback path =
in violation of DRM rules.
--

--- Patch [17]: [PATCH v7 17/18] drm/bridge: synopsys: dw-dp: Clear only en=
abled SDPs on atomic disable ---
commit 7e0bb4945c91158df2f4360bed9dbdb18041404b
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Clear only enabled SDPs on atomic disable

This commit updates dw_dp_bridge_atomic_disable() to selectively clear only
the previously configured SDPs (like VSC SDP) instead of bulk clearing the
entire SDP allocation bitmap. This aims to prevent handing out in-use SDPs
to other systems like the upcoming audio infrastructure.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index fcee47c6716a7..c0026bd4c7b53 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> +static void dw_dp_clear_sdp(struct dw_dp *dp, int nr)
> +{
> +	regmap_clear_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
> +			  EN_VERTICAL_SDP << nr);
> +
> +	regmap_clear_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
> +			  EN_HORIZONTAL_SDP << nr);
> +
> +	scoped_guard(mutex, &dp->sdp_lock)
> +		clear_bit(nr, dp->sdp_reg_bank);
> +}

[ ... ]

> @@ -1738,8 +1751,14 @@ static void dw_dp_bridge_atomic_disable(struct drm=
_bridge *bridge,
> =20
>  	dw_dp_video_disable(dp);
>  	dw_dp_link_disable(dp);
> +
> +	if (dp->vsc_sdp_nr >=3D 0) {
> +		dw_dp_clear_sdp(dp, dp->vsc_sdp_nr);

[Severity: High]
This isn't a bug introduced by this patch, but does this code call sleeping
functions in an atomic commit path?

The DRM subsystem calls dw_dp_bridge_atomic_disable() during non-blocking
commits via drm_atomic_helper_commit_tail(), which runs in atomic context.
This patch adds a call to dw_dp_clear_sdp(), which acquires a mutex using
scoped_guard(mutex, &dp->sdp_lock).=20

While the function already acquired this mutex and called sleeping functions
on this path previously, adding new mutex acquisitions here can lead to
system instability or deadlocks when the display mode is disabled.

> +		dp->vsc_sdp_nr =3D -1;
> +	}
>  	scoped_guard(mutex, &dp->sdp_lock)
> -		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
> +		clear_bit(0, dp->sdp_reg_bank);

[Severity: High]
This is a pre-existing issue, but does unconditionally clearing bit 0 here
defeat the tracking mechanism?

If userspace opens the ALSA PCM device while the DRM bridge is disabled,
ASoC might allocate slot 0 for audio. When the display is later enabled
and disabled, dw_dp_bridge_atomic_disable() unconditionally executes
clear_bit(0, dp->sdp_reg_bank).=20

This silently revokes the active audio allocation, allowing another
allocation to claim it while the audio subsystem still believes it owns
the slot.

While the previous code wiped the entire bank via bitmap_zero(),
explicitly clearing bit 0 seems to leave the audio tracking vulnerable.
Should this unconditional clear_bit() be removed entirely since
vsc_sdp_nr is now being handled explicitly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-synopsys-d=
w-dp-improvements-v7-0-b7640fa8cf48@collabora.com?part=3D17
