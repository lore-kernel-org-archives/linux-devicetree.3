Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB21EE7D5
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712519; cv=none; b=OmFvjEj5yoYakN3RcCReq4gQTUm1ompWN1/7kEJnbUz/EpIxaD74Oui0KgUZ+8X7h2t/vuiNUuSlCflcBY4SeLjwVAcoFD5kzgLfLzPHFYhiFWSt3ER712o+PjehkC8Uji7ya368u1Nq+cxwAZYKLrZL5sjSve9BrqDSfW4d+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712519; c=relaxed/simple;
	bh=BC5IsWtExIjTbma9hZqacStE1l4GCM4NLnIlFfEp92g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YvdmG0o7RJfLamJryKiPQOWs91/h18PBv/az0aN8zrAJwltmnpba7rw28LRZq5fTwdVEaSCw1aUMVk8jGHnOZ0biBL6gGpAKxMaKXYw0PJmZxEF2qhsqgLL8FleTCkSLeawug1HSNzzgQdZxIIzGsGw3wAD/LGwBwagAdM5NRHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8haTTMm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8haTTMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227F3C19425;
	Wed, 13 May 2026 22:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778712519;
	bh=BC5IsWtExIjTbma9hZqacStE1l4GCM4NLnIlFfEp92g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=T8haTTMmHvY7EB7vDMiidY6b56600bbK0JnQ9I/mpiE/LbQyR6wwEZUNY2NMB/4pB
	 frjNK3BLD8kuZs1f1kxvhY0pNWKugI7f9xH57iY8xAHTEjdf/fMT1yy9kDkeA2lbhC
	 8KPySkJ7J40KcuGRIUSEw275WsEl7cGo8TCgCZ/VxKfMJMNQ0xoyGcwfi/wfELrtBT
	 MM7MFzFF9wQ47Ebvdd4Xk9Y84/9BQSUbKVA+i/DIXxS8/826aoI4iunfVeNr6meQ3N
	 yr7j/xWmWB3o2uuZFdL+Mn0Q79XbCAIHycOe+cZgvkUQRBEDFZ6Xrxvv47Hsssx/+m
	 a0vcFO1Y8OS2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] drm: renesas: rz-du: Add support for RZ/T2H SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260512144104.761531-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:48:38 +0000
Message-Id: <20260513224839.227F3C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Register access is performed unconditionally even if hardware cloc=
k enablement fails, risking bus errors or system crashes.
--

commit a456e1dcca8021206b701fc39c90471891f25115
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

drm: renesas: rz-du: Add support for RZ/T2H SoC

This commit adds support for the RZ/T2H (R9A09G077) SoC, which includes a
DU with a DPI interface. It requires an explicit assertion of a DPI
output-enable signal during CRTC startup.

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/=
drm/renesas/rz-du/rzg2l_du_crtc.c
> index 2b772a11c7eec..017d5f26bc965 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c

[ ... ]

> @@ -217,8 +218,12 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *=
rcrtc)
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
>  	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> +	u32 val =3D DU_MCR0_DI_EN;
> =20
> -	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
> +	if (start && rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_DPIO_OE))
> +		val |=3D DU_MCR0_DPI_EN;
> +
> +	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
>  }
> =20
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)

This isn't a bug introduced by this patch, but this modifies the register
write logic inside an unsafe hardware path.

In rzg2l_du_crtc_atomic_enable(), rzg2l_du_crtc_get(rcrtc) is called to ena=
ble
clocks and deassert the reset controller, but its return value is ignored:

drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c:rzg2l_du_crtc_atomic_enable()=
 {
	...
	rzg2l_du_crtc_get(rcrtc);

	rzg2l_du_crtc_start(rcrtc);
}

If clock enablement fails, the driver unconditionally proceeds to
rzg2l_du_crtc_start(), which accesses the DU_MCR0 MMIO register via
rzg2l_du_start_stop() above.

Could accessing MMIO registers without the corresponding clocks enabled res=
ult
in an external asynchronous abort or bus lockup, leading to a system crash?

Although atomic_enable cannot return an error to the DRM core, should it at
least skip subsequent hardware register accesses to avoid crashing the syst=
em
if rzg2l_du_crtc_get() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512144104.7615=
31-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5
