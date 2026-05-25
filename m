Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599E02DE709;
	Mon, 25 May 2026 16:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779728060; cv=none; b=fJqI5PBaC6tUIu+KRFD5xK4h1WdbC/wMTTh09LuCJsn/6qhaBYd1TLzxakOcfXQNjEEE2Ou1AiCS9z6sHwA6yrviQASvnjfSW92hPGqTbHZvCK2m9uhUQqxZTUjMbljNfiKwGh0vl+evIP1CgRWFqMcqVWmU3VAv6PqRRjawrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779728060; c=relaxed/simple;
	bh=+S0eoAOtErxVwIudJ5k4M/JHZfXjdhMba5y/5EbSVas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/s9I782BldGpTLmkq2m93RbZ5GVbpNHstRGRr9IVZsoqe+/ErA5arcbsn5QU+BJgDFvQYu6HCxY1F8w28s/bCP/zJEZt7Vu53nNT9JV4rBqA6XEswUQexRowhpuJAm8kfm8Nxlpe4VzhKh7OprmotGUmL02cSsluBlEBjpWD3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHSIA2sz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHSIA2sz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92B01F000E9;
	Mon, 25 May 2026 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779728059;
	bh=3kgvASxp3f7rsNalAAxiKY75IcAIHz3Q2alZe0wcMyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHSIA2szLm/lG8nfbsx0b1dX/19zaHSHKmzhqWGOlfRydi3jFqS0LXDvjPo15jyr+
	 GYMyv3Z/0DMGvpPKfLG0XbJC+OcLdnLPzvuK6m8OvRwxBF2MD/heGI1Q7Brotx7ek9
	 8Iuni51ScaWRnImVtRTHOTIckQuMsxO5IsMSKMLpgp6ZGFkTelEqhc/9cLm4jFD0LS
	 3kMa+nu80ND+5cWl1nCeqjCt5kLTFG5W6CVabh/SxGxd50iWHJds6KK5aypiLMwEN7
	 mwQuZrVhRqknXAJAuZh2iThVMKD7rpQkF5fuOzvSCkPIk87OMC6ZjEIynhFEYg5xSe
	 SMmE5z96Q8tyQ==
Date: Mon, 25 May 2026 17:54:11 +0100
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
Subject: Re: [PATCH v8 01/10] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Message-ID: <20260525-ominous-hurling-c24874030f5a@spud>
References: <20260525125331.140059-1-damon.ding@rock-chips.com>
 <20260525125331.140059-2-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mp1gnxnR0vhDimzB"
Content-Disposition: inline
In-Reply-To: <20260525125331.140059-2-damon.ding@rock-chips.com>


--Mp1gnxnR0vhDimzB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 08:53:22PM +0800, Damon Ding wrote:
> RK3588 eDP controller requires HCLK_VO1 to access the VO1 GRF
> registers and enable the video datapath.
>=20
> Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
> phandle reference, which allowed the eDP to work without explicitly
> managing the hclk_vo1 clock. However, this is not safe or explicit.
>=20
> To make the clock dependency explicit, enforce per-SoC clock-names
> requirements:
>  - RK3288: 2 clocks (dp, pclk)
>  - RK3399: 3 clocks (dp, pclk, grf)
>  - RK3588: 3 clocks (dp, pclk, hclk)
>=20
> Do not reuse the 'grf' clock name for RK3588 because it represents
> a different clock with distinct control logic:
> - The 'grf' clock is only for GRF register access and is toggled
>   dynamically during register access.
> - The 'hclk' clock controls both GRF access and video datapath
>   gating, and must remain enabled during probe.
>=20
> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add su=
pport for RK3588")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>=20
> ---
>=20
> Changes in v4:
> - Modify the commit msg.
>=20
> Changes in v5:
> - Enforce the correct third clock name on a per-compatible basis.
> - Modify the commit msg simultaneously.
>=20
> Changes in v6:
> - Expand more detail commit msg about using hclk instead of grf clock.
>=20
> Changes in v7:
> - List all valid clock names at the top level, and constrain the clock
>   count for each platform with minItems/maxItems in allOf.
>=20
> Changes in v8:
> - Fix indentation to 10 for enum in clock-names property.
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 34 ++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index d99b23b88cc5..a1ab7a77bdd3 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -26,7 +26,9 @@ properties:
>      items:
>        - const: dp
>        - const: pclk
> -      - const: grf
> +      - enum:
> +          - grf
> +          - hclk
> =20
>    power-domains:
>      maxItems: 1
> @@ -60,6 +62,32 @@ required:
>  allOf:
>    - $ref: /schemas/display/bridge/analogix,dp.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3288-dp
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3399-edp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3

If you go back to v6, you'll see that I never asked you to remove the
explict clock-names from here or below. Only the one from the 3288
section. The minItems was an addition, not a replacement.

pw-bot: changes-requested

Cheers,
Conor.

> +
>    - if:
>        properties:
>          compatible:
> @@ -68,6 +96,10 @@ allOf:
>                - rockchip,rk3588-edp
>      then:
>        properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
>          resets:
>            minItems: 2
>          reset-names:
> --=20
> 2.34.1
>=20
>=20

--Mp1gnxnR0vhDimzB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahR+swAKCRB4tDGHoIJi
0o1sAPoCijEh8PvkC+TvmEG0cY5/F12kqBe0lYz7nrYlMfDh9AEA70JPBE7y/TZV
FPGNv8tWORRJxlbf3FYOq1H7vDY0/AE=
=9FAA
-----END PGP SIGNATURE-----

--Mp1gnxnR0vhDimzB--
