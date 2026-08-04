Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FE73AF65A
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832389; cv=none; b=UxICWCUeJxuFWxhZ5p0GMq8jCCtG8Ulz2rRug/i9kx1/OhJS9oauo9v0BOruaGjngsf1DySgp2YkOIpqE//x0lyuop05jrMYfq24seNfnLz/ESq5Moy9nCdnJhazWyUylks3p4DMJy3c7G1eVKei40Gq7TYLwdQkocd1VxzC7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832389; c=relaxed/simple;
	bh=f9LEFzLt8rqFBJTWeHRJqihRlIGK/2fRLfI283SUg/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A1G5Kk+gb/PTal4MIOJtRT8dO6j9RUD46lNC1APCg4WS40C7J9+ODSMpP5B1x5I6A3Wh3C8tclhg0y4TQuD8+rSaAOMaBvlmPwfEN+rb3ri1ype3DxKnqyFIp35erZC4Br2r8nO5yx4kQHkRcSIBCr0MViC24JKnic/EIR6QDHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hk6cOdbh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hk6cOdbh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ECA1F000E9;
	Tue,  4 Aug 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785832387;
	bh=eMt/zyOmOL5SkEjFAlcJYiVoI73lHhbxKFER91Is/oQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hk6cOdbhUP05LbxtHwAMgeokkeZaYh7RvwpzRcvtXtGI7USrzWwzVYBlhUwVX9Jys
	 0C1TuxH6qxFRd9STOmrNTwhSoc+SXOZjuWmNBbHC+TyYrtGYw8+0NEgZv2gE5KshaS
	 9mtz7je6g5vZCg8M57Zn3bqfHxXZGr+lb6osxa38vCJSVRwov2izNBPkoeaKmAiiOz
	 jWmOOv2atFiME7BmngUhqD2n1LMITMKbFVFo3YvDbd6l7Fs56isRM9ldLi/Waisjt8
	 gbTuNIdgui0m4b3zloHAMVzEiFx23txwgVHJA16Kgt69o26Uc/YcJ6XJDK5PYdOANY
	 at2FjOcC0+i0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] drm/bridge: analogix_dp: Add IRQF_ONESHOT and
 simplify IRQ handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260804081717.741404-4-damon.ding@rock-chips.com>
References: <20260804081717.741404-1-damon.ding@rock-chips.com>
 <20260804081717.741404-4-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 08:33:07 +0000
Message-Id: <20260804083307.84ECA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the unconditiona=
l clearing of all hotplug interrupt status bits causes permanently lost plu=
g/unplug events.
- [High] This problem wasn't introduced by this patch, but using devm_ allo=
cation for bridge registration inside a component bind callback causes list=
 corruption and memory leaks.
- [High] This problem wasn't introduced by this patch, but the driver trans=
lates `-EPROBE_DEFER` from `platform_get_irq` into `-EINVAL`, permanently b=
reaking deferred probing.
--

--- Patch [3]: [PATCH v2 03/10] drm/bridge: analogix_dp: Add IRQF_ONESHOT a=
nd simplify IRQ handling ---
commit baa2e5313ef615e574d902fb610ffce244dfc46e
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Add IRQF_ONESHOT and simplify IRQ handling

This patch adds IRQF_ONESHOT to the threaded IRQ request to prevent hardirq
preemption, avoiding a read-modify-write race on HPD interrupt mask
registers. It also simplifies the IRQ handler by removing manual mute/unmute
operations and reordering the interrupt clear call.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index a735b828df7e9..a97a0c9ac9b92 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

[ ... ]

> @@ -725,6 +723,9 @@ static irqreturn_t analogix_dp_irq_thread(int irq, vo=
id *arg)
>  	u32 irq_type;
> =20
>  	irq_type =3D analogix_dp_get_irq_type(dp);
> +	if (irq_type)
> +		analogix_dp_clear_hotplug_interrupts(dp);
> +

[Severity: High]
This isn't a bug introduced by this patch, but does the unconditional
clearing of all hotplug interrupt status bits cause permanently lost
plug/unplug events?

If a new HPD interrupt (e.g., HPD_LOST) asserts in hardware after
analogix_dp_get_irq_type() reads ANALOGIX_DP_COMMON_INT_STA_4, but before
analogix_dp_clear_hotplug_interrupts() unconditionally writes the fixed mask
HOTPLUG_CHG | HPD_LOST | PLUG to it, won't the new event be silently wiped?

Because this is a W1C (write-1-to-clear) register, writing 1s for bits that
were not read or processed could cause the threaded handler to miss the new
event entirely.

[ ... ]

> @@ -1407,10 +1403,11 @@ analogix_dp_probe(struct device *dev, struct anal=
ogix_dp_plat_data *plat_data)
>  		 * that we can get the current state of the GPIO.
>  		 */
>  		dp->irq =3D gpiod_to_irq(dp->hpd_gpiod);
> -		irq_flags =3D IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUT=
OEN;
> +		irq_flags =3D IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUT=
OEN |
> +			    IRQF_ONESHOT;
>  	} else {
>  		dp->irq =3D platform_get_irq(pdev, 0);
> -		irq_flags =3D IRQF_NO_AUTOEN;
> +		irq_flags =3D IRQF_NO_AUTOEN | IRQF_ONESHOT;
>  	}
> =20
>  	if (dp->irq =3D=3D -ENXIO) {

[Severity: High]
This is a pre-existing issue, but does this logic translate -EPROBE_DEFER
from platform_get_irq() into -EINVAL, permanently breaking deferred probing?

platform_get_irq() returns -EPROBE_DEFER (-517) if the IRQ provider is not
yet ready. Since the driver explicitly checks only if (dp->irq =3D=3D -ENXI=
O)
to catch errors, the -EPROBE_DEFER value is passed down to
devm_request_threaded_irq().

devm_request_threaded_irq() rejects negative IRQ numbers and returns
-EINVAL. By propagating -EINVAL instead of -EPROBE_DEFER, the driver core
will not retry probing, and the display driver permanently fails to
initialize.

[ ... ]

> static int analogix_dp_bind(struct device *dev, struct device *master,
>                             void *data)
> {
>         ...
>         ret =3D devm_drm_bridge_add(dp->dev, &dp->bridge);
>         ...
> }

[Severity: High]
This isn't a bug introduced by this patch, but does using devm_ allocation
for bridge registration inside a component bind callback cause list
corruption and memory leaks?

analogix_dp_bind() is a component bind callback (triggered by the DRM
master). Calling devm_drm_bridge_add() here binds the bridge's cleanup to
the dp->dev platform device's probe/remove lifecycle, rather than the
component bind/unbind lifecycle.

When the DRM master is unbound, analogix_dp_unbind() executes but the
devres cleanup is not triggered, leaving the bridge in the global
bridge_list.

When the DRM master binds again, analogix_dp_bind() calls
devm_drm_bridge_add() on the same &dp->bridge object. Could this cause
list_add_tail() to double-add a node that is already in the list, resulting
in immediate list corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804081717.7414=
04-1-damon.ding@rock-chips.com?part=3D3
