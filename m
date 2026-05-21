Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55F33D25C5;
	Thu, 21 May 2026 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779392837; cv=none; b=qiRZaDMFeixbJ/bOYp8QSmkSES9VVLQrThO4pCS4SRpqu9fOKlm2q9X+sKFMG1onPH/DXWbx7TAn897qP7h32AOb1zYpYIM/4Mz8QiOsIYFUWKHu/gGGhBwRTHnhtaHjcrJz2n2O9UdR9I91M6YPu3W9e3cwSKG/wopoDCG4G44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779392837; c=relaxed/simple;
	bh=bpdZNlcBLd3KwoS51ouSJUNQSPCxowMHjZ/xCXm3x1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXFfnys5vUlmAf9IH3FPT7Hd3wnUgWUgiC+kn3tOJDQbFdyELYjakWT5RHCZkUDppYHhmU/aB4z45MFgD8ESjXL3jScMWalQERTmXSN87A5CbUGjXsllN0o66SyWjG2/sXkp8/4mztkxvzpIhegW2+wxGWLPdM0OQoVRQ+vUUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i57ejD7i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i57ejD7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C9D1F000E9;
	Thu, 21 May 2026 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779392836;
	bh=iF7iL7b/eRDZExcU9oluR8iOMC8+YXUjPYKBmp/PXRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i57ejD7ipwYFQoYWQOyHZ7JiWI6LhNi0bmQ7pOyatQLUHO78lk7wAp/pp7EVRJq1W
	 B9Fu2aQRrMb550LkpweJltALl/A7ruzHvdvjGGpnlJXVCQhLpfvpT2VRvcbBZiRGho
	 0uDP5ogr6juioZwvu9JzIgvz38yZyg09LRpnAZjzWB4CTKgSSR+vInl5aqbtvuCpI9
	 qNJ5d1JN6+e7LWgbZiVwj8xmGmxhTIFywUwDgfzuMAGM57BQfkFUTLuoADKx0OM14j
	 HYYscXdi7VS8RtTcZe4Bw0dAMtpU1ipYgyQdv0xuGIDB2xS/lrs4fcvoEJm9Sqxmge
	 wpdhHfJNTn4aQ==
Date: Thu, 21 May 2026 20:47:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com, dianders@chromium.org,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: rockchip: analogix-dp: Add
 data-lanes example
Message-ID: <20260521-powdery-tux-22a7cf4fadc3@spud>
References: <20260521114459.1394264-1-damon.ding@rock-chips.com>
 <20260521114459.1394264-3-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kjL5jhnqIDr4AwIY"
Content-Disposition: inline
In-Reply-To: <20260521114459.1394264-3-damon.ding@rock-chips.com>


--kjL5jhnqIDr4AwIY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 07:44:58PM +0800, Damon Ding wrote:
> Add data-lanes setting in endpoint example to show actual lane mapping
> usage.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Squash this with patch 1.
pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index bb75d898a5c5..cf75c926318b 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -151,6 +151,7 @@ examples:
>            reg =3D <1>;
> =20
>            edp_out_panel: endpoint {
> +            data-lanes =3D <0 1>;
>              remote-endpoint =3D <&panel_in_edp>;
>            };
>          };
> --=20
> 2.34.1
>=20

--kjL5jhnqIDr4AwIY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9hPQAKCRB4tDGHoIJi
0noXAP9aPT5KoIziqejJtByAcYmbw2ijtjzmEvaq71WErlg8vAD/d5xCbobJ1rmC
s9sTZuiq/HBvQLv/KjXIx0LIEV43OwY=
=PVrf
-----END PGP SIGNATURE-----

--kjL5jhnqIDr4AwIY--
