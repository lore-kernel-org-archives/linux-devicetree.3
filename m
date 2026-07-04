Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3439D3FC
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153576; cv=none; b=Ze+Nx+ggHOq7Td3iXB21EOkxYy4k9WG5zMugII5NRUvhRqX1Tg1w7dasS25A77ab3lvTK2VddWNVOUe3HAD/q2OYgrbJTKb54RTjnAPrAD3aK1UswVTxhdlSRM2uZ/oM8oOVmSBnT2w0m7hrnOPCXeBYdOw+8EwuFjjo5o0p8l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153576; c=relaxed/simple;
	bh=DyCgGvjmZcZN2OFztcnoTYXDeUsiP8J/yzmQbV2XlIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fOUNCgh3AdUlClymPP2mlKJNAvCK/YKAunyt8aP8dXzMCpHDaCRABfLmglPRPTKz1ZrqW0RVlxmfyGZhyl+FD3UZ+2CrHw9m6kky5c//9DjzRMs9Gpcn/LwlusMDdt5cqh5GE1jBK3LQ2ef6iX1ru2I5bSZOV1G22NeFfqPpZvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1eyELId; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1eyELId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9111F000E9;
	Sat,  4 Jul 2026 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783153566;
	bh=YxqvQQX6Lq97cMdZO81UApnB6lRqvkhDvcrmnJjRl3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I1eyELIdoBR3uJo+4OJ0iDRVNSuCH1ru0/J1/JGRNeIR+lahawoxe+i50bSCHIZqJ
	 FZ4OHnGdW3Kf7lWaGY8bHWGDc68bRllzEqAn+AsyhVz53NaT089Pzuzh4nVVq+0JNX
	 CdwuG8khG8UZPYgyjXav/bedstsVoesBuMs58UgeJizRbTLS4qCNk93G+wkulp9vfm
	 j0HqF8bKIXY+uQmE1bKNA6zbegFn6jYCxapc4zYFJNMAa7SbuRz6Uv+QpkibjOgImK
	 awNYIMNecMyWB667mZDwt0OK2t+D7Hg/7kryyD79L/JwuzuteL1WZDT5s+ON9RFPTb
	 6YnJq9yN+g35Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Barzilai" <amit.barzilai22@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260704080925.75113-4-amit.barzilai22@gmail.com>
References: <20260704080925.75113-1-amit.barzilai22@gmail.com>
 <20260704080925.75113-4-amit.barzilai22@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 08:26:06 +0000
Message-Id: <20260704082606.7E9111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Encoder atomic enable and disable callbacks invoke sleepable kerne=
l functions from atomic context.
- [High] Incorrect end address calculation for column and row ranges during=
 partial display updates.
- [High] Screen clear operations fail to reset the hardware column and row =
address ranges to the full display, leaving previous partial updates unclea=
red.
- [High] Missing format conversion state preallocation in `ssd133x_primary_=
plane_atomic_check` leads to forbidden `GFP_KERNEL` allocations in atomic c=
ontext.
- [High] `ERR_PTR` dereference in `ssd130x_power_off` if `pwm_get` fails du=
ring display enable.
--

commit 28391e97ee3411b1213256c23b42e73a4550eba0
Author: Amit Barzilai <amit.barzilai22@gmail.com>
Subject: drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support

This commit introduces support for the Solomon SSD1351 RGB color OLED
controller. It adds a new SSD135X_FAMILY which reuses existing SSD133X
helpers while providing a custom initialization sequence and an explicit
Write RAM command path.

> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/=
ssd130x.c
> index 3f09977d227b0..f7f0a74a297e2 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c

[ ... ]

> @@ -826,7 +927,7 @@ static int ssd133x_update_rect(struct ssd130x_device =
*ssd130x,
>  		return ret;
> =20
>  	/* Write out update in one go since horizontal addressing mode is used =
*/
> -	ret =3D ssd130x_write_data(ssd130x, data_array, pitch * rows);
> +	ret =3D ssd133x_write_pixels(ssd130x, data_array, pitch * rows);
> =20
>  	return ret;

[Severity: High]
This is a pre-existing issue, but does ssd133x_update_rect() correctly
calculate the end address for the column and row ranges?

When calculating the hardware active window boundaries, the driver currently
sets the range width and height directly rather than adding them to the sta=
rt
coordinates:

drivers/gpu/drm/solomon/ssd130x.c:ssd133x_update_rect() {
    ...
    ret =3D ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_COL_RANGE, x, columns=
 - 1);
    if (ret < 0)
        return ret;

    ret =3D ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_ROW_RANGE, y, rows - =
1);
    ...
}

For a partial update starting at offset x and y, would this program an
incorrect end address relative to 0 instead of the start coordinate, result=
ing
in corrupted partial updates? (The same appears to be true in
ssd132x_update_rect()).

[ ... ]

> @@ -896,7 +997,7 @@ static void ssd133x_clear_screen(struct ssd130x_devic=
e *ssd130x, u8 *data_array)
>  	memset(data_array, 0, pitch * ssd130x->height);
> =20
>  	/* Write out update in one go since horizontal addressing mode is used =
*/
> -	ssd130x_write_data(ssd130x, data_array, pitch * ssd130x->height);
> +	ssd133x_write_pixels(ssd130x, data_array, pitch * ssd130x->height);

[Severity: High]
This isn't a bug introduced by this patch, but does ssd133x_clear_screen()
fail to reset the address window before clearing the display?

When writing a full frame of zeros, if the previous operation was a partial
update, the controller's address window might remain restricted.

Could pushing a full screen of data simply overwrite that small rectangle
repeatedly while leaving the rest of the display uncleared?

>  }

[ ... ]

> @@ -1356,7 +1457,13 @@ static const struct drm_plane_helper_funcs ssd130x=
_primary_plane_helper_funcs[]
>  		.atomic_check =3D ssd133x_primary_plane_atomic_check,
>  		.atomic_update =3D ssd133x_primary_plane_atomic_update,
>  		.atomic_disable =3D ssd133x_primary_plane_atomic_disable,
> -	}
> +	},
> +	[SSD135X_FAMILY] =3D {
> +		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +		.atomic_check =3D ssd133x_primary_plane_atomic_check,

[Severity: High]
This isn't a bug introduced by this patch, but is the format conversion sta=
te
preallocated during the atomic check phase?

Unlike the other plane check routines, ssd133x_primary_plane_atomic_check()
returns early without calling drm_format_conv_state_reserve().

During the non-blocking commit phase, ssd133x_primary_plane_atomic_update()
calls drm_fb_xrgb8888_to_rgb565be(), which then falls back to dynamically
allocating memory via krealloc with GFP_KERNEL since the state size is 0.

Can this trigger forbidden sleeping allocations in the atomic update path?

> +		.atomic_update =3D ssd133x_primary_plane_atomic_update,
> +		.atomic_disable =3D ssd133x_primary_plane_atomic_disable,
> +	},
>  };

[ ... ]

> @@ -1597,6 +1708,31 @@ static void ssd133x_encoder_atomic_enable(struct d=
rm_encoder *encoder,
>  	ssd130x_power_off(ssd130x);
>  }
> =20
> +static void ssd135x_encoder_atomic_enable(struct drm_encoder *encoder,
> +					  struct drm_atomic_commit *state)
> +{
> +	struct drm_device *drm =3D encoder->dev;
> +	struct ssd130x_device *ssd130x =3D drm_to_ssd130x(drm);
> +	int ret;
> +
> +	ret =3D ssd130x_power_on(ssd130x);

[Severity: High]
This is a pre-existing issue in the driver, but does this newly added callb=
ack
also execute sleepable kernel functions from an atomic context?

The DRM subsystem rules state that encoder atomic enable and disable callba=
cks
run in an atomic context where sleeping is forbidden. This newly added
callback calls ssd130x_power_on(), which in turn invokes regulator_enable()
and pwm_apply_might_sleep() (via ssd130x_pwm_enable()). It also calls
backlight_enable() later in this function, which acquires a mutex.

Could these sleeping functions cause kernel warnings or deadlocks when call=
ed
from the atomic commit path?

> +	if (ret)
> +		return;
> +
> +	ret =3D ssd135x_init(ssd130x);
> +	if (ret)
> +		goto power_off;
> +
> +	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_ON);
> +
> +	backlight_enable(ssd130x->bl_dev);
> +
> +	return;
> +
> +power_off:
> +	ssd130x_power_off(ssd130x);

[Severity: High]
This is a pre-existing issue, but what happens during the teardown sequence=
 if
ssd130x_pwm_enable() previously failed?

If pwm_get() fails in ssd130x_pwm_enable(), it returns an error pointer whi=
ch
is stored in ssd130x->pwm. The atomic enable aborts, but because it has a v=
oid
return type, the DRM core treats the encoder as successfully enabled.

When the display is later disabled or the power_off label is reached,
ssd130x_power_off() unconditionally calls pwm_disable(ssd130x->pwm).

Since pwm_disable() does not handle error pointers, could this dereference =
the
invalid error pointer and cause a kernel panic?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704080925.7511=
3-1-amit.barzilai22@gmail.com?part=3D3
