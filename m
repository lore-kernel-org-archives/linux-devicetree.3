Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF942C50F
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123411; cv=none; b=fTo7Atp7N5htvhAwUTntqjccordFUzwdriVxlFuVQMjYy6LqlqdNA6+Qzz2+I0+eZYyiKSfGz/sz5wwggw1vwuFgOGFrVD8zUxGd827H9Ccfx69j/o3uSv/6ryxDdTR0VllK7pJhxs15qvWudV+u3g8OVO5ye6nswkNzkGgEiOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123411; c=relaxed/simple;
	bh=C4/be4hs3ssizuRvXnxVzdoHIg1jbfnqF5uvMeaZpjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gqB+FD36CHX/z64ixkaADPCo9doCdWyhXIU4B3hq+ZHC71OjzklmBd5k48YqqVDadE4DcESZgI8Vo4FyCbyVry32PIiXs+IR6TtjFTt40doLWQ34fnsG4XLFI9Vh2zcIc1k/rNyWk7tdctD+OAyzSnCkhI8M4EjRHFik7yC2294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPl0Bis5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPl0Bis5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BF31F000FF;
	Fri, 11 Sep 2026 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789123409;
	bh=SsnRGeY9pfqs6951nwVjHW90rc1K98Ft785+FmFyK5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KPl0Bis5Ne3pPURdzyvjt9RrRtvfo0+S/Gvt8Q3uqe0D5YCIwDUIm2UCoqzNTP4th
	 tTLFaaUdphYmRGnCU8OTiDPW4nVKKh9zKNj597Mdmx4zOTduU1aR/ah0b7vEJ8h5Fx
	 j6By/Kn3grFHM6Yko0p6TXcPKtXgq8hg1/S1tvtlfs43dmoE/fgqd7GzT7oj7c73cC
	 +YdJtmpx+BxAZNTATzUtphtacpmG6FMbmU9bYMhc/cRN+ZtxIlvhTNhxdo6eAZFwzD
	 spbKL1iIo+LNW7hple/4Vnr+kAW8e7xPc8NJ8ao4zd6VRBp133goXuEvyKCRIi+KPG
	 f77SOdkJun6XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-3-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-3-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 10:43:28 +0000
Message-Id: <20260911104328.C5BF31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent lockless calls to `msm_hdmi_audio_update()` from ALSA/A=
SoC and DRM lead to unclocked MMIO accesses, hardware state corruption, and=
 data races.
--

commit d1867d224f6fab10a2909a251c0566882d455741
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date:   Fri Sep 11 10:29:36 2026 +0000

    drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disab=
le

This commit reorders power_off() and msm_hdmi_audio_update() in
msm_hdmi_bridge_atomic_post_disable(). This ensures the HDMI block remains
powered on when msm_hdmi_audio_update() accesses hardware registers.

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm=
/hdmi/hdmi_bridge.c
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -339,10 +339,10 @@ static void msm_hdmi_bridge_atomic_post_disable(str=
uct drm_bridge *bridge,
>  	msm_hdmi_phy_powerdown(phy);
> =20
>  	if (hdmi->power_on) {
> -		power_off(bridge);
>  		hdmi->power_on =3D false;
>  		if (hdmi->connector->display_info.is_hdmi)
>  			msm_hdmi_audio_update(hdmi);

[Severity: High]
This isn't a bug introduced by this patch, but does this fully resolve the
unclocked MMIO accesses that can lead to hardware state corruption or bus
hangs?

While this correctly orders the power down sequence for the DRM bridge,
concurrent lockless calls to msm_hdmi_audio_update() can still happen from
ALSA/ASoC entry points while the display is powered off.

For example, a local user running an ALSA client can trigger this via the
prepare hook:

drivers/gpu/drm/msm/hdmi/hdmi_audio.c:msm_hdmi_bridge_audio_prepare() {
    ...
    return msm_hdmi_audio_update(hdmi);
}

Or during shutdown:

drivers/gpu/drm/msm/hdmi/hdmi_audio.c:msm_hdmi_bridge_audio_shutdown() {
    ...
    msm_hdmi_audio_update(hdmi);
}

Both of these ALSA hooks call msm_hdmi_audio_update() without acquiring
state_mutex or checking pm_runtime_get_sync(). If power_off() has already
disabled the clocks, the unclocked MMIO reads and writes in
msm_hdmi_audio_update():

drivers/gpu/drm/msm/hdmi/hdmi_audio.c:msm_hdmi_audio_update() {
    ...
    /* Read first before writing */
    acr_pkt_ctrl =3D hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
    ...
}

can cause synchronous external aborts on ARM platforms resulting in a
kernel panic. Should these audio hooks be synchronized with the bridge
power state?

> +		power_off(bridge);
>  		msm_hdmi_phy_resource_disable(phy);
>  	}
>  	mutex_unlock(&hdmi->state_mutex);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-drm-msm-hd=
mi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com?part=3D3
