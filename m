Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E494A0135
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438115; cv=none; b=NECIhZsPYGsi0y/2q+HdXTaXfkqQTC1stDH2rfrkYQiSc/RSn9BShi4kc5wvICkCugOPEhe+8HM2JlScUU4e+z9iyKfFTNK1Ot56ZxDcv6uScPkt9tHkvGDgVZ+Ay5+vIxybTZ9Y0e2uemfaiZVKJKAhMJrPIBeGGJltZug3tok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438115; c=relaxed/simple;
	bh=MZ+jOwjFCJfiks4UJ05apb+49niOg8ev0Z6vbI+bw1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s+eY+nuRJBzCqF2AIFHhW0JGsYOJfIAgUazJFPe8uzOiuEKqZ4Zv3HfXBjwpFT1uCtbDB7br17TFRctVSEBJBIlf0wWWs892qPHE5GIIU8piqWwUzmPJafwJhZgv9V3CyJ8o7EUfeNKYLnFdAI/0QyY6RPK6S3W3bb9z/pIxcZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZsCYv/o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZsCYv/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60691F00A3A;
	Thu,  3 Sep 2026 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788438106;
	bh=pEFcQwUWKI0+glCWBdCizaYXqt/sRHZ3qa/JpkWlcdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZZsCYv/oIufvrbwozPstakgJ3BAdRn1ofneWuuvuVaNvHRI3j/SstJl1/RV85wiUk
	 OdpStGOaiYz/rm1s3nyCR44regZs1qr81fu9rMtTb3fOPY2cvwLWDG6xc3hoNv91di
	 eUOmhFaWSvAh5F+Pl8+SZvBmaL+pWr2+0fZO8n29Gn962LDLQazqDA1ZINye+LlTgj
	 WiPfTiq1B8do6hMG3jfia7z01B3Low2W4jwIHdtO6UIoTAWU3u0Is/wUxNKAED3oYM
	 VS4/4288FVNqscDTCA47VQ2IL8yJHl0rir/PwsCOFd2QjnWzrS0GmjA9hr/q/rVI9t
	 vPNQbb4c0srDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] drm/tidss: oldi: Fix OLDI signal polarities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-tidss-pre-beagley-v1-8-93928baa8b12@ideasonboard.com>
References: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
 <20260903-tidss-pre-beagley-v1-8-93928baa8b12@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 12:21:45 +0000
Message-Id: <20260903122145.B60691F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Modifying driver-private state in atomic check callback violates a=
tomic modesetting semantics.
--

commit 3406ad4360f9e6a4eda4b2203c1f6400e5e7ab77
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

drm/tidss: oldi: Fix OLDI signal polarities

This commit fixes OLDI signal polarities by removing drm_bridge_timings
and properly setting input_bus_cfg.flags in tidss_oldi_atomic_check(),
as well as setting OLDI_DEPOL based on the DE bus flag.

> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/t=
idss_oldi.c
> index 5eb749f495d59..624f1646fb07a 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c

[ ... ]

> @@ -329,7 +352,8 @@ tidss_oldi_mode_valid(struct drm_bridge *bridge,
>  }
> =20
>  static const struct drm_bridge_funcs tidss_oldi_bridge_funcs =3D {
> -	.attach	=3D tidss_oldi_bridge_attach,
> +	.attach =3D tidss_oldi_bridge_attach,
> +	.atomic_check =3D tidss_oldi_atomic_check,
>  	.atomic_pre_enable =3D tidss_oldi_atomic_pre_enable,
>  	.atomic_post_disable =3D tidss_oldi_atomic_post_disable,
>  	.atomic_get_input_bus_fmts =3D tidss_oldi_atomic_get_input_bus_fmts,

[Severity: High]
This isn't a bug introduced by this patch, but does the implementation of
tidss_oldi_atomic_get_input_bus_fmts() violate atomic modesetting
semantics by modifying driver-private state during the check phase?

In drivers/gpu/drm/tidss/tidss_oldi.c:tidss_oldi_atomic_get_input_bus_fmts(=
):

        input_fmts[0] =3D oldi_bus_formats[i].input_bus_fmt;
        oldi->bus_format =3D &oldi_bus_formats[i];

A TEST_ONLY atomic commit or concurrent commits can alter the global
driver-private state (oldi->bus_format). This could cause a subsequent
real commit to program the hardware with an incorrect bus format, leading
to display corruption.

Should this configuration decision be stored in the drm_bridge_state object
instead of the driver-private tidss_oldi structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-tidss-pre-=
beagley-v1-0-93928baa8b12@ideasonboard.com?part=3D8
