Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB13DA5A5
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281075; cv=none; b=FOfTjtHCCHcI0wDOjZrobpbRuSkvdg2DeFYcZQ+A9K7sZ3VXcTWMvcQtc7ETO/sdOBkrSZ4lb5LDN9x89FAX66ONHk8dXeq1UPE18hDyDGPd362MOkBJthK0JZ/F5AnycGM1TtfRTzWbzFhbjhX80lOVf1XZKQ0Ust7V4Ddu80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281075; c=relaxed/simple;
	bh=CP+f/Zqcpll82YZooUFb1Yef5Q3IC+ZW4WDhNhjcRPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XtkeyPNSe1mYRD+IUE/Ils6jiwrIek6GxbyQKuKaRVn36Ms9RlBBxYrzAV9mZNlKu3M3wStSCXLvOW9a86fWyxQTNB++H1uvJZdnp65tNb16ZqAtA6AIZOy9zuDIoCTkl+7G50TgIIeoU5DXDehDr7Cex7WLbrQbUVnFvMi101E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oqo/KE8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oqo/KE8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1334F1F00893;
	Wed, 20 May 2026 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779281074;
	bh=uufxwjnvlgXdI4KlLK1hTEAAym3ZCPmM13Ve0GmKan4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oqo/KE8VCNNpzLIyTm8fNN8osAUCxvB/R/CRUUCnUnZrOg4NJQQAxER36ORxnyOmu
	 PgvZELKs6GYpR3zwQTBx8vyPKOIwRkrrc+ymuQe6xDi2luKJ2EI4hmoMexOrVI7WkZ
	 7VBJ7PnVOeK3RomuiMR9zpCDFx0RUqR2OQLWkpVWSHIZ/BwKlLVlE2gx5WgEA+Akdv
	 V2h/Hm4AX8OGkE2Vx56RwBWxb3LvPL7eYJHegLJZGJ44VYIjfChpwxz0NFwSHsIKUi
	 3ZxQ/igRw0WQ/KmliiTvvwOh03hPXKbht1QWxf/5Z2gNZD2vZHj3BlteLHUF1oTHVe
	 C4Xa+HWY/Iqng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/17] media: ti: j721e-csi2rx: add support for
 processing virtual channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520120022.539913-11-r-donadkar@ti.com>
References: <20260520120022.539913-11-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:44:33 +0000
Message-Id: <20260520124434.1334F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The check for an unmatched stream in `ti_csi2rx_get_vc_and_dt` is =
incorrectly placed inside the loop, rendering it dead code and causing a fa=
lse success return.
- [High] Error path bypasses `video_device_pipeline_stop()`, leaking a medi=
a pipeline reference if `ti_csi2rx_get_vc_and_dt` fails.
--

commit a246af785a58954c2b9c8219f7853322d7ba7a14
Author: Jai Luthra <jai.luthra@linux.dev>

media: ti: j721e-csi2rx: add support for processing virtual channels

This commit adds support for virtual channels by using get_frame_desc()
to retrieve the frame descriptor from the connected source. It falls
back to virtual channel 0 if the source does not support
get_frame_desc().

> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 26a8eaa98b3da..d0a681ba78ebf 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

[ ... ]

> @@ -881,12 +887,46 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffe=
r *vb)
> +static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
> +{
[ ... ]
> +	for (i =3D 0; i < fd.num_entries; i++) {
> +		if (ctx->stream =3D=3D fd.entry[i].stream) {
> +			ctx->vc =3D fd.entry[i].bus.csi2.vc;
> +			ctx->dt =3D fd.entry[i].bus.csi2.dt;
> +			break;
> +		}
> +
> +		/* Return error if no matching stream found */
> +		if (i =3D=3D fd.num_entries)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Is it possible for the i =3D=3D fd.num_entries condition to ever be true he=
re?

Because it is inside the for loop body where the condition i < fd.num_entri=
es
is strictly enforced, i can never equal fd.num_entries.

If no matching stream is found, the loop will exit normally and the function
will silently return 0 instead of returning an error. This leaves ctx->vc a=
nd
ctx->dt uninitialized or with stale values, and bypasses the fallback logic.

[ ... ]

> @@ -901,6 +941,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queu=
e *vq, unsigned int count)
>  	if (ret)
>  		goto err;
> =20
> +	ret =3D ti_csi2rx_get_vc_and_dt(ctx);
> +	if (ret =3D=3D -ENOIOCTLCMD) {
> +		ctx->vc =3D 0;
> +		fmt =3D find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> +		ctx->dt =3D fmt->csi_dt;
> +	} else if (ret < 0) {
> +		goto err;
> +	}

[Severity: High]
Does this error path leak the media pipeline reference?

By jumping to the err label, the execution bypasses the err_pipeline label
which calls video_device_pipeline_stop(). This would leave the pipeline
permanently in an active state and block future pipeline operations
with -EBUSY.

I understand this issue is fixed in a later commit ("media: ti: j721e-csi2r=
x:
add multistream support"), but could we fix it here to ensure this commit
doesn't introduce regressions during bisection?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D10
