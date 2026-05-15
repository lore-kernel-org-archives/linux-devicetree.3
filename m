Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854246AF06
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846987; cv=none; b=Rto1bDqrnOUsrS4EK9ZGXJWKsTAKRgm83YV6xiuthVi+FpskYk5a/TMvT7H4Dwu2CudwHnwuyl3xh7tNecF3oHvA4ivipjGJkI/6ydBS7iNQ3scLaVAqg4DbrYQICNlg8rnBLM7qWDusGsTMvzqFxTFTc3Q23i80cLZNLhd9+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846987; c=relaxed/simple;
	bh=93CRcjKlU/KWwikR6dpCd7HSqR8F+AHMHouYiYWCzpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eS14sNcdjDDIf6PfjbBWkQ//gRHM3sBV8TMhMEr/mABKKu9OlEuuR+N6RcGYqc5Fl9b58/dGwsrorrKBrl83bTjnJikF0tQ4zo/8a5/42Php4rbjtKppjBhuGpQZh1AhYuD2kmSAr8IK97vRc0yfkNxhDx4FRdbpeSAFqMJyTs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUgkEz5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUgkEz5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155A2C2BCB7;
	Fri, 15 May 2026 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778846987;
	bh=93CRcjKlU/KWwikR6dpCd7HSqR8F+AHMHouYiYWCzpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rUgkEz5dx4F4JWtugNr89dXp3ou4tyZubd7dgceM0XU/8aihSS9SCefLa9GnyDvFa
	 6AkszLLqrO3WU8ivFUy+498bwz55UTJVY+aawzeRTY5fFmsSicMJpgqzVKyt/iaVKD
	 0SOTbA4t1jro6SwntauWLW1B7xxKAr8p/wBKRa5GdSw5/wBjUsSlvI3h2RKt9S4PLv
	 suW90FL3mo9up4xP140njrUkiCjEAkqH5thjg4Ll7SZS5+KdUwzf1dB2lLy35t5gXC
	 92x6iTyurwlWvFyusd8DC+fgePOWiRbBlJOBvs/oWNOgO1RBQiWFzJdpMCc+HETW9C
	 r9nXbC3WxoC0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: simple: add NEC NL6448BC33-70C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260515-v7-1-topic-panel-simple-nl6448bc33-v2-2-74ab0baa1817@pengutronix.de>
References: <20260515-v7-1-topic-panel-simple-nl6448bc33-v2-2-74ab0baa1817@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 12:09:46 +0000
Message-Id: <20260515120947.155A2C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware configuration mismatch causing WARN_ON stack traces and d=
isplay failure.
--

commit ed55c8f29ffdce716c41311e39a5db4fabaf9549
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

drm/panel: simple: add NEC NL6448BC33-70C

This commit adds support for the NEC NL6448BC33-70C 10.4" 640x480 LCD module
to the simple panel driver.

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 236bd56208ccf..dca6cbc41bd9f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
[ ... ]
> +static const struct panel_desc nec_nl6448bc33_70c =3D {
> +	.modes =3D &nec_nl6448bc33_70c_mode,
> +	.num_modes =3D 1,
> +	.bpc =3D 6,
> +	.size =3D {
> +		.width =3D 211,
> +		.height =3D 158,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> +	.bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.connector_type =3D DRM_MODE_CONNECTOR_LVDS,

Are this bus_format and bus_flags compatible with an LVDS connector type?

In panel_simple_probe(), there are WARN_ON() checks that enforce strict
configuration rules for LVDS panels.

MEDIA_BUS_FMT_RGB666_1X18 is a parallel RGB (DPI) format, not an LVDS format
(like MEDIA_BUS_FMT_RGB666_1X7X3_SPWG). Because it is missing from the LVDS
format whitelist, it looks like this will trigger a warning during probe.

Similarly, DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE is not in the whitelist of
allowed LVDS flags, which guarantees the bus flag WARN_ON() will also trigg=
er.

Could this mix of parallel RGB format settings with an LVDS connector type
cause hardware configuration issues or a corrupted display?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-v7-1-topic=
-panel-simple-nl6448bc33-v2-0-74ab0baa1817@pengutronix.de?part=3D2
