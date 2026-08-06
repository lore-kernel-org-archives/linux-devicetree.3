Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE53769F8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786038341; cv=none; b=muxTUs4w+mA7PQUVJsOJBKqYyHqa+BcpXE71IJTrix/Nw2nXZXcuz9WPQSoqbWReCe4agIQ/BEcPmEPiJ+Yu8DXg0PlKrLJswiyjSKnOrLHM0LW/P6upMSGRkJaZ9b0VJ6XskCd6T87tPLxsdMqvvPrCa98ugUiDE6UY2MP4jJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786038341; c=relaxed/simple;
	bh=YSW72kE9ZvesV/WzlU/VeduiP2qQxnQKGXKZnJcG2fg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QhbdZo9aOUM1jGSmygeQlZZDOjGTMEwy0OrrWRo6KeMwAvQfVG73U/3dMudIYuQcnoj7Q3VJQGVNtAAK/64mE9x5+6tpUzx2NDe7kY3TylsZGwGwWbVxGAPWvPNBCCrzflPAKZD8G2EMmSf+mrDGJDR7IIYnD6BQuWpWQqS6X1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjO0TcOf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjO0TcOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384541F000E9;
	Thu,  6 Aug 2026 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786038339;
	bh=iVTYkIoaXD4DsPFBAUwZ/Ve7pvApUzD96ATmPYcwsJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jjO0TcOff9Ur0HbDmmZ6TuNdNRagwDWCR8midXza9jcjG849mC+oUSyiclXVnjtRu
	 hdTswt8s0wQXe86nPaV5mpyBLthIrtAaULtogaHc9hN4vdXQ3tJ1RGVhPgXKjx2Uuc
	 geuCPRR0Rh/ej6gT0b+yObrstxtkZbj6goLht+DMz+TR2N2IcsujDyf/D9TGXUA0Et
	 9Xklom34wAE/XEo+4P3+8P1oIfLqHOmJRwwSgND/rPpZj3BmnxvD+DMakZXCkDJp0r
	 QFdFQGjyGqnxUj4ZgmbxCKyPP62/IXH77bZcsKEVIIweG51t1pSoTNjTRDBqz542Vk
	 r2B0yDnB3gKpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 17/21] drm/bridge: synopsys: dw-dp: Drop useless
 reservation of first slot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-17-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-17-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:45:38 +0000
Message-Id: <20260806174539.384541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sleeping functions (mutex_lock and usleep_range) are invoked from =
within the DRM bridge atomic enable/disable paths, violating atomic context=
 constraints.
--

--- Patch [17]: [PATCH v11 17/21] drm/bridge: synopsys: dw-dp: Drop useless=
 reservation of first slot ---
commit 8eeeddc14d0ae1c89dc44b8a4cd95896d24d3082
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Drop useless reservation of first slot

This patch removes the reservation of the first SDP slot in the atomic
enable path because it potentially races with audio SDP reservation. The
author mentions it is unnecessary or leftover development code, and that
slot 0 works fine without being reserved.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 31495a813e408..d8682ccdfec87 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1713,9 +1713,6 @@ static void dw_dp_bridge_atomic_enable(struct drm_b=
ridge *bridge,
>  		return;
>  	}
> =20
> -	scoped_guard(mutex, &dp->sdp_lock)
> -		set_bit(0, dp->sdp_reg_bank);
> -
>  	ret =3D dw_dp_link_enable(dp);

[Severity: High]
This isn't a bug introduced by this patch, but this function executes durin=
g the
DRM atomic commit sequence where sleeping is strictly forbidden. While this
patch removes one instance of mutex acquisition, the remaining atomic enable
and disable paths still contain sleeping functions.

For example, dw_dp_link_enable() eventually calls dw_dp_link_train_fast() w=
hich
sleeps:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_link_train_fast() {
    ...
    usleep_range(500, 1000);
    ...
}

Other functions in the atomic path, such as dw_dp_send_sdp() and
dw_dp_bridge_atomic_disable(), also acquire the same mutex:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_bridge_atomic_disable() {
    ...
    scoped_guard(mutex, &dp->sdp_lock)
    ...
}

Can these remaining sleeping functions cause kernel warnings or deadlocks d=
uring
standard display modeset operations?

>  	if (ret < 0) {
>  		dev_err(dp->dev, "failed to enable link: %d\n", ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D17
