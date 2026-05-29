Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6C53C1413
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051411; cv=none; b=AAnzdlfKvd9LjZ4DYvReGWRGF+KVH7Ma9QKAfmkq1z1wTAV+MYgwt1KhoBOyaK0/2s/f8ExkjBHJMaI60xcszxyY63GNhqTgtLA5kAr69bdv67Z2jYtPdbxsVThIPKBnS6THQLh4TWqclnwKCq/b4/X40tqHSt3RDgg4Kdidfmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051411; c=relaxed/simple;
	bh=VqZwbtPTw64Ye8uhAbMDDoRjJy2MzArmNS6cMu5aQzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vfa8LAQ39MAI1WDJWjkiAjQbPPm2Nie2He8ks1pzlyX72+ojmxqFiUA3BgSqW11qT1XBkKjA0N1DUubTeK6MmDRhfXN+8L7Q9lgOnWWN/gvBOdesOUaVst5wHJOCiUR9HsHnT99JaYaPNYZeT8kWVg0NRJ6Cq/R6fxgingXzT20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwsWPhYv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwsWPhYv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB431F00893;
	Fri, 29 May 2026 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780051409;
	bh=ldVvGmbOnvo2IS7G36I+48opYBrkjWBWwFojVL/xKqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwsWPhYvygbM56QSmh6NiDWUPB7Obh9vOFgnrHBUjx5iKxK5Ehqr7lKVABzQBUfox
	 3htlJcaH/vn2n+m9TZ1pajDrjLWyK/uQ5Lm7oyeBU9H4Ky46dcFFmzwMdxyrB21Yb0
	 6g6pky8VnH+5ZdrypeZsZTE7rM+s4p9RHZJKxt9lYN3aKWUh+kakEN34ieNZyWZunb
	 /x6UXYhSL8u4VpgcbWZxQaU4Zx2koTrpdBpAfY5a2Oy1a8vNGAXVgE0SAcdkCSA+TT
	 xKcATu/XbImjMz7tY6ZCCqowkaFD20YWR+1Y0lXhyUcOMDiWhbD9JM413cCaeRxvg+
	 pwVQpdVZuaKpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: syyang@lontium.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529094547.869919-3-syyang@lontium.com>
References: <20260529094547.869919-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:43:29 +0000
Message-Id: <20260529104329.9BB431F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] AB-BA / self-deadlock between the bridge's ocm_lock and DRM modese=
t locks during hotplug notification.
- [High] Freeing the panel bridge in lt7911exc_dsi_host_detach while it is =
still attached to the DRM bridge chain causes a Use-After-Free.
--

commit ca8c39080d5fa5c9d8946d55f3858864628e4bf7
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

This commit adds support for the Lontium LT7911EXC bridge chip which conver=
ts
eDP input to MIPI DSI output. It provides DRM bridge integration, MIPI DSI
host interface, firmware upgrade mechanism, and GPIO/regulator management.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 0000000000000..8401b7357b327
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c

[ ... ]

> +static void lt7911exc_firmware_upgrade_work(struct work_struct *work)
> +{
> +	struct lt7911exc *lt7911exc =3D container_of(work, struct lt7911exc, wo=
rk);

[ ... ]

> +	mutex_lock(&lt7911exc->ocm_lock);
> +	lt7911exc_hw_mcu_run(lt7911exc);
> +	lt7911exc->fw_version =3D lt7911exc_read_version(lt7911exc);
> +	/* Notify DRM framework that hardware state changed/needs a modeset */
> +	if (lt7911exc->bridge.dev)
> +		drm_kms_helper_hotplug_event(lt7911exc->bridge.dev);

[Severity: High]
Will this result in a self-deadlock when the hotplug event triggers a modes=
et?

The driver holds ocm_lock here, and drm_kms_helper_hotplug_event() notifies
user-space and triggers the in-kernel fbdev client to restore the display
mode. This leads to a synchronous atomic commit that invokes bridge
callbacks such as lt7911exc_atomic_pre_enable().

Looking at lt7911exc_atomic_pre_enable():

static void lt7911exc_atomic_pre_enable(...)
{
	struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);

	guard(mutex)(&lt7911exc->ocm_lock);
	...
}

Since the mutex is already held by this exact same worker thread, and
mutexes aren't recursive, won't this permanently hang the worker thread?

> +
> +	mutex_unlock(&lt7911exc->ocm_lock);

[ ... ]

> +static int lt7911exc_dsi_host_detach(struct mipi_dsi_host *host, struct =
mipi_dsi_device *dev)
> +{
> +	struct lt7911exc *lt7911exc =3D dsi_host_to_lt7911exc(host);
> +
> +	if (!lt7911exc->output.dev)
> +		return 0;
> +
> +	if (lt7911exc->output.panel && lt7911exc->output.bridge)
> +		drm_panel_bridge_remove(lt7911exc->output.bridge);

[Severity: High]
Can this cause a use-after-free during subsequent DRM operations?

In lt7911exc_bridge_attach(), the panel bridge is linked into the DRM
encoder's bridge chain. If the downstream DSI device is unbound at
runtime and calls this detach function, drm_panel_bridge_remove() will
free the panel bridge memory.

However, the bridge is not removed from the encoder's bridge chain
(the chain_node list). Won't subsequent DRM operations like modesets,
display disabling, or device teardown iterate over the encoder's
bridge chain and dereference the freed memory?

> +
> +	lt7911exc->output.bridge =3D NULL;
> +	lt7911exc->output.panel =3D NULL;
> +	lt7911exc->output.dev =3D NULL;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529094547.8699=
19-1-syyang@lontium.com?part=3D2
