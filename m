Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E2D330307
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266385; cv=none; b=OJtaQ83U0rnu6/ql/vpCaT9KgpixznyIRn6iszKl48gsoiL1dZOpcjgsd8OoDuL0pgwfL5GAJAFdgrw8UL7sBnvdkFl/a1bNVEyqLM51T4UXRxSrgbMU5gPm/cib2EbwXpMVYAzmkU12Hd2s6jOomWRPJbLdlkUgoUwfI91jTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266385; c=relaxed/simple;
	bh=2JqmfnKtEZaN0g74cq4fNu2ab8TqAAV+J6kszZxDtiw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SHPt4nBfppd6ONa7pFhCfE+s9hUZIwL2fdDuPdb/qLs1c1ZUAC5YBVFV7E0WMxbVAiI5WvYgR7hz5bZMh3fOj2J+GfpujbHdw8cacJiUmYBlQaBmyxNOOQ+ylbJ/7eeqD5jcJdkdQDDEF9u1ZeiDOO/40F21DVEzCiLFdjU4tTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/arhS0F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/arhS0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEC81F000E9;
	Tue, 28 Jul 2026 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785266383;
	bh=kKh5bHlgSxr7yaa1N0d+muFlHAGPSUDCGWeLaNimWvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/arhS0FXTnm4/xbiMGC2YtE5fbJOf0b571JsorERD5zMeFFf0+o5WNLLjplZP8ZJ
	 BQrIeb67ESeUKdsYSs9vlGUEctNvEZ/R7BqAGiTJxUsjz2GINCsxHgVlf1XIJkUly6
	 5iyir720vYU2lu7J9RCLUros+Eu1X69Gzgm6Dkh9XrhRNji37HU8Q4Shbq6hkQoBrQ
	 AK/ybwwpLC/RcD99143CR8ZJz/M3LBqzkc3cdgk5njR7gnKfNP6/yskrYk/Qj7mql6
	 2mNSWoouHgqtsW6s9jcIEOqQo2qze6gE/dQunSMr9Qxh1rX8ROY7hmMi572iLutArs
	 AjssZ1SlbmMkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/18] drm/bridge: Add out-of-band HPD notify handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-9-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
 <20260728-synopsys-dw-dp-improvements-v7-9-b7640fa8cf48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:19:43 +0000
Message-Id: <20260728191943.7EEC81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential Use-After-Free of the connector and encoder due to missi=
ng DRM device reference in OOB hotplug event handling.
--

--- Patch [9]: [PATCH v7 09/18] drm/bridge: Add out-of-band HPD notify hand=
ler ---
commit 60a32b50437d6f06ebb30ed7d8a1cc757f684526
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: drm/bridge: Add out-of-band HPD notify handler

This commit adds an out-of-band hotplug detection notify handler to the DRM
bridge structure. It allows notifying all bridges in a pipeline of hotplug
events, which is useful for forcing DP controllers HPD signals for USB-C DP
AltMode.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 8b54069fa53a4..632cc3ae3b544 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -180,6 +180,12 @@ static void drm_bridge_connector_oob_hotplug_event(s=
truct drm_connector *connect
>  	struct drm_bridge_connector *bridge_connector =3D
>  		to_drm_bridge_connector(connector);
> =20
> +	/* Notify all bridges in the pipeline of hotplug events. */
> +	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {

[Severity: High]
This is a pre-existing issue, but I have a question about the use of
bridge_connector->encoder and connector here.

The Type-C subsystem calls drm_connector_oob_hotplug_event() in
drivers/gpu/drm/drm_connector.c, which acquires a reference to the
connector via drm_connector_find_by_fwnode().

However, drm_connector_get() only increments the connector's internal
kref, not the refcount of the parent drm_device.

If the DRM driver is concurrently unbound (e.g., via sysfs) during a
hotplug event, the drm_device refcount can drop to 0.

This triggers drmm_ cleanup handlers that free the drmm_kzalloc'ed
connector memory while the Type-C subsystem is still executing
connector->funcs->oob_hotplug_event().

Could this lead to accessing a freed bridge_connector->encoder and
passing the freed connector object down the stack to the newly added
oob_notify callbacks?

> +		if (bridge->funcs->oob_notify)
> +			bridge->funcs->oob_notify(bridge, connector, status);
> +	}
> +
>  	drm_bridge_connector_handle_hpd(bridge_connector, status);
>  }
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-synopsys-d=
w-dp-improvements-v7-0-b7640fa8cf48@collabora.com?part=3D9
