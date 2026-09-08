Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA814F797F
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862510; cv=none; b=MMfnXL01hwLDLtfEd2kUgubiiioQ8E4plrUXd9xz+vQ92P4A61a43+C71PwNMWZmqIcNYM1ZyfEoJXsQfFTnTLeZ4fb/mOPHmEGDwC+BU7xNNlltbOXqIn7Sg+ldw/X73wBy6c7tFFfmNiuoIHHS+yJhzpT8GQgUf5VpWDiY79s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862510; c=relaxed/simple;
	bh=U1UaUE0+0EAi92AKFvEwqOty7ozT8YdNTzDMZBZy6dI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KjPmFtHa28SGIll+xgf4/QqiVVUcdYh/E/jW4oJMY5vJsRcBdJ1uv2l7xhfbr5iHTrdD+yPyzBO6bOMi947iK+XSBppTdKdSNkBN4uZEtfP+kD9FnTECVwKyTZX96svZ82651o1AwOnWkq/S0b46BHIl6uKPK/2pN08gAHgeDGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGoLGhYj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGoLGhYj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C021F00A3D;
	Tue,  8 Sep 2026 10:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862509;
	bh=andQw+ebjgmfPYJID6s08wjhK0YCGL9Mdxmg0Pc61Qs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XGoLGhYjjvGi7roh7OkDuqiebVuR8PxkMZJ+OHGNnrUlkjBxDhrwGLQXnzi7lOjIH
	 O5BB17Hz7aXiH+Ycvr9pM38XTJkUatXJbvDuPfBN2S5riruNvzEoxl5Up6VcBPmeWc
	 oNtzjYO2JjoUJcNUm3Hl9vqHgz6Q8Vo6GOQriTRqKR1IiWkYQQ+U+23kTVWb9yKBnV
	 rWuaXvSoQ9lXG8D0a5GUVt2Rc04aN0nOLHCD0RwT62zlA+qtBd0yC1VBpG/lN2yo7D
	 dnMSXYk7oia+Xt+2tGzQuJtxu/r00Y8pZckH0GYj4pIi/xkkEOu2lAgmApaziqIspk
	 J5Apw3SdhLMsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] drm/verisilicon: add DCUltraLite chip identity
 to HWDB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260908092840.225220-6-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-6-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:15:08 +0000
Message-Id: <20260908101508.B9C021F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Negative cursor coordinates are programmed incorrectly because the=
 offset values are not shifted before being passed to regmap_update_bits().
--

commit 71dc0bfa33a2021c1ba93da0095ed32939fb4009
Author: Joey Lu <a0987203069@gmail.com>

drm/verisilicon: add DCUltraLite chip identity to HWDB
   =20
The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
model number 0x0 (sic, the model name contains no number either),
revision 0x5560 and customer ID 0x305.  It has a similar register map
with DC8000, only one display output and only 32x32 cursor supported.

> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/veri=
silicon/vs_hwdb.c
> index 91524d16f7785..7d630a667a3f0 100644
> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
[ ... ]
> @@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] =
=3D {
>  		.max_cursor_size =3D 64,
>  		.formats =3D &vs_formats_no_yuv444,
>  	},
> +	{
> +		.model =3D 0x0,		/* DCUltraLite */
> +		.revision =3D 0x5560,
> +		.customer_id =3D 0x305,
> +
> +		.generation =3D VSDC_GEN_DC8000,
> +		.display_count =3D 1,
> +		.max_cursor_size =3D 32,
> +		.formats =3D &vs_formats_no_yuv444,
> +	},
>  };

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the cursor
handling code related to this new controller, I noticed an issue with how
negative cursor coordinates are programmed.

Looking at vs_cursor_plane_atomic_update() in
drivers/gpu/drm/verisilicon/vs_cursor_plane.c, when handling negative
X coordinates:

	} else {
		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
				   VSDC_CURSOR_CONFIG_X_OFF_MASK,
				   -state->crtc_x);
		regmap_update_bits(dc->regs, VSDC_CURSOR_LOCATION(output),
				   VSDC_CURSOR_LOCATION_X_MASK, 0);
	}

Is the unshifted X offset (-state->crtc_x) completely masked out to 0 by
regmap_update_bits() because it lacks the necessary shift macro (like
VSDC_CURSOR_CONFIG_X_OFF)?

Similarly, for the Y coordinate:

	} else {
		regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
				   VSDC_CURSOR_CONFIG_Y_OFF_MASK,
				   -state->crtc_y);
		regmap_update_bits(dc->regs, VSDC_CURSOR_LOCATION(output),
				   VSDC_CURSOR_LOCATION_Y_MASK, 0);
	}

Does this also cause the unshifted Y offset (-state->crtc_y) to be
masked out to 0?

When the cursor is moved off the left or top edge of the screen, the hardwa=
re
offset is intended to clip the cursor.

However, if the unshifted offset value is masked out by regmap_update_bits(=
),
it results in an offset of 0.

This would cause the cursor to stick at the edge of the screen fully visibl=
e,
rather than sliding smoothly off-screen.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908092840.2252=
20-1-a0987203069@gmail.com?part=3D5
