Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767994399CC
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786718; cv=none; b=Piei97KVED/dLK2hj+6IGEQ4IHzoRzcwq1/qQBFBbWWSiWX4rDy4qzF/yJqXyxEY2izFbFrt5NQ1G8wG6X0bl/ltdW1rBRHhirIX3EBGeNwJhpVf6gqKHnb5037en9hL6ls3OqeeIB1StCXfdpdANo62auA0viWeD1ZknxWPVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786718; c=relaxed/simple;
	bh=tzwMGkq/hkbs4l4drFuOheu7x/nYQtMQ5XkDogaUfEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bRyMu4nIivl/Rww0AoZD/YQODt/scJ5+synA/QsdvHi4k2MQT3YiVd3jgqpiyxkXaz/UsBAaakGCbhzoh5IcGbSxdcNdQ3CJWKZwMO24sYSzV40YUNEm7OE8CF4PFw5AgKiVOYE5FONlR7doCbHA65bi1KQbaVtRkWRzFiwzIuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCadTu4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCadTu4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AD21F00A3A;
	Mon,  7 Sep 2026 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788786713;
	bh=sOUEM8R63wJvnIvFrvAyTl2doOcjJ9JD/iyOu6HDJU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jCadTu4e6EhjcXW93RyoRJO22K/Ssa03RyhqRtGg1K6AjrlKTN2ontvMealDpkd+f
	 F+DzMg1I8JjeUMdK9IBf+crfHCZncs9xPLxDRejn1ePWnGMC5yXt5eJAdN0Vxo731h
	 S7WpWHFPqjpE1RIbVsn6vpVpRG0QDJ1CM+EmgjD669oWIwlYl3n6tO5TsOBMmdWgDt
	 tfvEkA45+lXBKJQEPKhNJvR+kc/uiQpxrLM68ll6hvqFqUzaVzo7i+pSZAe/6tQYNy
	 B/NsMD9PuvWwOhsCnIY+WyWyiZhgrySE9u6JPicT2dhjXXWyFiU8TfHuw3auwMVGyd
	 0jEgg1BlN5BIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-3-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-3-b097cf1eac77@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 13:11:52 +0000
Message-Id: <20260907131153.34AD21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Moving `hdmi->power_on =3D false` to after `msm_hdmi_audio_updat=
e()` breaks the audio hardware disablement logic, leaving the audio engine =
active before its power is cut.

Pre-existing issues:
- [High] Unclocked MMIO accesses in ALSA audio callbacks can cause a kernel=
 panic if the DRM bridge is powered off.
--

commit b86cb24a12ce06704d3597339883527b57932c00
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable

Turning off the power in msm_hdmi_bridge_atomic_post_disable() should
follow reverse order of powering up, not only because it is logical, but
also because msm_hdmi_audio_update() accesses registers thus block
should still be powered on.

Depending on specific timing, existing code could have accesses to MMIO
of powered off block.

Cc: <stable@vger.kernel.org>

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm=
/hdmi/hdmi_bridge.c
> index db85400e574e4..04c893062dbd4 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -339,10 +339,10 @@ static void msm_hdmi_bridge_atomic_post_disable(str=
uct drm_bridge *bridge,
>  	msm_hdmi_phy_powerdown(phy);
> =20
>  	if (hdmi->power_on) {
> -		power_off(bridge);
> -		hdmi->power_on =3D false;
>  		if (hdmi->connector->display_info.is_hdmi)
>  			msm_hdmi_audio_update(hdmi);

[Severity: High]
This isn't a bug introduced by this patch, but can unclocked MMIO accesses =
in
ALSA audio callbacks cause a kernel panic if the DRM bridge is powered off?

If a user-space ALSA application starts or stops audio playback while the
display is powered off (e.g., via DPMS blanking), the ALSA callbacks
msm_hdmi_bridge_audio_prepare() and msm_hdmi_bridge_audio_shutdown() in
drivers/gpu/drm/msm/hdmi/hdmi_audio.c call msm_hdmi_audio_update().

This function reads from MMIO registers unconditionally, without verifying =
if
the HDMI block is powered on or holding a PM runtime reference. Could this =
lead
to a synchronous external abort (kernel panic) due to unclocked MMIO access?

> +		power_off(bridge);
> +		hdmi->power_on =3D false;

[Severity: Medium]
Does moving hdmi->power_on =3D false to after msm_hdmi_audio_update() break=
 the
audio hardware disablement logic?

The audio shutdown logic in msm_hdmi_audio_update() relies on hdmi->power_on
being false during teardown to correctly disable audio:

drivers/gpu/drm/msm/hdmi/hdmi_audio.c:msm_hdmi_audio_update() {
	...
	if (enabled && !(hdmi->power_on && hdmi->pixclock)) {
		DBG("disabling audio: no video");
		enabled =3D false;
	}
	...
}

By setting hdmi->power_on =3D false after the call, msm_hdmi_audio_update()=
 still
evaluates hdmi->power_on as true. Will this leave the audio engine active a=
nd
programmed to remain enabled right before its power and clocks are cut,
potentially leading to transient audio glitches or incomplete hardware state
reset?

>  		msm_hdmi_phy_resource_disable(phy);
>  	}
>  	mutex_unlock(&hdmi->state_mutex);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-drm-msm-hd=
mi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com?part=3D3
