Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DD3390CAD
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852348; cv=none; b=uVQbW7vPyppIlk1x3siISnM0I7F1jfMXE2d3Ou7lhRzH3zmcXK4vI5s8ew//QbZ4s3Xjy9Hh85H2I6NYB5V6Q6d3knKunEUmFnqflsgihNY1yVHEDTDGpRS5KDA/EjTgQFU0ZdcCcGSfsVgiyRo2+Da9lQLCWudWIuKP+9K1n1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852348; c=relaxed/simple;
	bh=Lv1FzL55ClwsY1NygJV0Iek4iChHbkXH2FOAQHfXqmM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jsn34tplEIXqIvbpKXISH+OBAkzszSVmk7gKp/ai6gX5sHjmz3at+OrD9Gz/Gaf+Z+VAAE28OUrovOybg9fLWcRZ/UfGybo0EaCSLRd7y7ii1hLVGReOwKJ3EGFCY2tSJOf2KfE8dkzrrnsgpfCW3QQ7YZJhaihg0TGq20dceLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPCy7M0k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPCy7M0k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645FF1F00A3A;
	Tue,  8 Sep 2026 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788852347;
	bh=1lgD2/r9LjhQmUOUH0YH3LrX/i+KeQI0zSLtZTqIS20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PPCy7M0kEV/l5uMwCDewbk5ofC7S+199WVCjwjePE5xMFlpWt3DCukjEiId8ZnQsE
	 hYLsJvy1uQRjvRscFQaEb98lAhL7ibXwHBhi8U8Nd+AXji1lUjIwGSm0VPJz0zkJIF
	 ZVAFhNq0PaJXc81j6Pbvfzdt0D55iJgWG0yxOWQYgw6j/LqZiTN8s5m5ZsHJj1oaZB
	 2EwMukTw18IZmoBOSZLDRY943Df1e3JaKfeS8ylG0ASdBfOzOk7BMk2CRgkDN2DSw0
	 OP0jclFfkglLXBVLkyeC33RtCD1+A/pVKYgb3N6ht4YH7w8/AmdUQ6cQ02koaV334p
	 4nPHZ/o7qV2iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-2-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-2-dcf8956878ca@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 07:25:45 +0000
Message-Id: <20260908072546.645FF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Aborting `atomic_pre_enable()` on power-on failure guarantees an i=
mprecise abort (system crash) in `atomic_post_disable()` due to uncondition=
al accesses to unpowered PHY and HDMI controller registers.

Pre-existing issues:
- [High] Unclocked MMIO access in `msm_hdmi_set_timings()` before the HDMI =
PM runtime is resumed.
--

commit 9912da31672d32069f2e4d118d3714a533a0157a
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()

This commit adds error handling for msm_hdmi_power_on() during the=20
.atomic_pre_enable() phase to prevent register accesses if the power=20
domain fails to come up.

Cc: <stable@vger.kernel.org>

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm=
/hdmi/hdmi_bridge.c
> index 157f19bd90b4e..db85400e574e4 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c

[ ... ]

> @@ -287,13 +294,18 @@ static void msm_hdmi_bridge_atomic_pre_enable(struc=
t drm_bridge *bridge,
> =20
>  	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);

[Severity: High]
This is a pre-existing issue, but does calling msm_hdmi_set_timings() here
risk unclocked MMIO access?

This register access occurs before the power domain is reliably enabled by
msm_hdmi_power_on() later in this function. If the connector is forced on
while disconnected (so HPD is disabled and no background PM reference is
held), the AHB/APB clocks for the HDMI block are off.

Writing to these registers without an active clock can immediately stall the
bus and cause an imprecise external abort (kernel panic).

> -	mutex_lock(&hdmi->state_mutex);
> -	if (!hdmi->power_on) {
> -		msm_hdmi_phy_resource_enable(phy);
> -		msm_hdmi_power_on(bridge);
> -		hdmi->power_on =3D true;
> +	scoped_guard(mutex, &hdmi->state_mutex) {
> +		if (!hdmi->power_on) {
> +			if (msm_hdmi_phy_resource_enable(phy))
> +				return;
> +
> +			if (msm_hdmi_power_on(bridge)) {
> +				msm_hdmi_phy_resource_disable(phy);
> +				return;

[Severity: High]
Does aborting here guarantee a crash later during teardown?

When this error path disables PHY resources and returns early, it leaves
hdmi->power_on =3D false. However, because atomic_pre_enable() returns void,
the DRM core is unaware of the failure and continues the modeset sequence.

Eventually, the DRM core will call msm_hdmi_bridge_atomic_post_disable(),
which unconditionally writes to unpowered registers:

msm_hdmi_bridge_atomic_post_disable() {
    ...
    msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
    msm_hdmi_phy_powerdown(phy);
}

Since the PHY clocks were explicitly disabled by this error path, accessing
these registers without an active clock will cause an imprecise external
abort on MSM hardware.

> +			}
> +			hdmi->power_on =3D true;
> +		}
>  	}
> -	mutex_unlock(&hdmi->state_mutex);
> =20
>  	if (connector->display_info.is_hdmi)
>  		msm_hdmi_audio_update(hdmi);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-drm-msm-hd=
mi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com?part=3D2
