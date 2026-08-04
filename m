Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2406843BDA3
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832255; cv=none; b=oOhRZTVLZLm34j380CEF6Z3mliWCtTWd5J3mcMCVjEONLONTZcCC1TQNpeCD7Duzj+N7EIVcnV++Fftw6SsISCyISoBPtbjy4PvLk0aOK8vWea15RYLUnJjcHupcIttgs8Vefkhe0HBGiCtNlEAWZETXHcAS7edyZjriEcpV5tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832255; c=relaxed/simple;
	bh=26JSb96Y0y0ImYlUgH0jeYjlivi/yQFlSHAETZbcFKg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UzoLL9KQNVCIrs5g7dOJE33ZFLvpH2p2D3IYVGN/95ezTccrGN3SzEA0y9hIFNxKGA8o0f6EJxoRw6BmW86ZwrWmfsiu+ycwBWIogglo6VctNDCAKyC/CmBN2hxp/BXCtove8yDaddgLt5gAHHX6H/tb0M1lDOQaJJSby+M+Lzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCaoLX18; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCaoLX18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A301F000E9;
	Tue,  4 Aug 2026 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785832253;
	bh=9g9WJpdvyVCic1IuudqZvp/iNeX6syDlQ6cEx+tzFS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iCaoLX18glXyCBVJ809l7OcZqTwxqebxswEi+PQUIQpVyidfisCq0cEu76dqBn1FH
	 2+2WC5BKlqpzPQ7XQfpuEo9usc2UZL/agAi+ScPxIdthg0CM/CEWeI4eXFROWCZJmH
	 CUNAt2XtXZ7JPI/Q9DK5trjmEmYQi+upUrWUQimZxA3q2NQRb8dtxdRResOhMCiKP5
	 c168IaDqXsphsoaCHVhn6o6Oe4hpRLB3qzRlxPO7kpJXF+COp0rQC3DJeI6wwECxAI
	 AvcyV24defCAR4wwZm+cSyUMw8SwVms6Ugp/Xp61BMM7WlmilfzviJLV4N+ichYF0+
	 n0V3hq8NKxUTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/10] drm/bridge: analogix_dp: Restrict forced
 connected status only for panel endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804081717.741404-10-damon.ding@rock-chips.com>
References: <20260804081717.741404-1-damon.ding@rock-chips.com>
 <20260804081717.741404-10-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 08:30:52 +0000
Message-Id: <20260804083053.70A301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing early return in analogix_dp_bridge_detect() causes uninten=
ded hardware accesses and significant delays for panel bridges.
- [Medium] Missing drm_bridge_put() causes a reference count leak for the b=
ridge returned by drm_bridge_chain_get_last_bridge().
--

--- Patch [9]: [PATCH v2 09/10] drm/bridge: analogix_dp: Restrict forced co=
nnected status only for panel endpoint ---
commit 7e658941bfdab69a58f5d04d4acd4ae671e37ea8
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Restrict forced connected status only for panel en=
dpoint

This commit limits the unconditional connected status shortcut to cases
where the last bridge in the chain is a panel. For other cases, it relies
on analogix_dp_detect_hpd() to report accurate hotplug state.

Link: https://lore.kernel.org/all/5209243.oAaWjsssbx@diego/

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 1c85ca93ee7b1..f7db5b5a3f917 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -910,8 +910,15 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge,=
 struct drm_connector *conne
>  	struct analogix_dp_device *dp =3D to_dp(bridge);
>  	enum drm_connector_status status =3D connector_status_disconnected;
> =20
> -	if (dp->plat_data->next_bridge)
> -		return connector_status_connected;
> +	/*
> +	 * Only assume connected when the bridge chain ends with a panel.
> +	 * Panel bridges lack a detect callback and historically rely on
> +	 * this shortcut. For other next bridge types (e.g., DP connector
> +	 * bridges), fall through to analogix_dp_detect_hpd() to report
> +	 * accurate hotplug state.
> +	 */
> +	if (dp->plat_data->next_bridge && dp->last_bridge_is_panel)
> +		status =3D connector_status_connected;
> =20
>  	if (!analogix_dp_detect_hpd(dp))
>  		status =3D connector_status_connected;

[Severity: High]
Does this unintentionally fall through and execute analogix_dp_detect_hpd()
even when the bridge chain ends with a panel?

Previously, analogix_dp_bridge_detect() returned early here. By just
assigning the status without returning, it looks like panel bridges will now
unconditionally execute analogix_dp_detect_hpd(). This can introduce an
unnecessary 100ms delay and unintended register/AUX writes to manually force
HPD on hardware that lacks an HPD signal.

Should there be an early return here instead of continuing execution?

[ ... ]

> @@ -938,6 +946,10 @@ static int analogix_dp_bridge_attach(struct drm_brid=
ge *bridge,
>  			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n",=
 ret);
>  			return ret;
>  		}
> +
> +		last_bridge =3D drm_bridge_chain_get_last_bridge(dp->encoder);
> +		if (drm_bridge_is_panel(last_bridge))
> +			dp->last_bridge_is_panel =3D true;
>  	}
> =20
>  	return 0;

[Severity: Medium]
Does this leak the reference to the last bridge in analogix_dp_bridge_attac=
h()?

drm_bridge_chain_get_last_bridge() increments the reference count of the
returned bridge, but it doesn't appear that drm_bridge_put() is called
before the function returns. Will this prevent proper cleanup when the
device is unbound or the module is unloaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804081717.7414=
04-1-damon.ding@rock-chips.com?part=3D9
