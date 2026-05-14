Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C92E35839E;
	Thu, 14 May 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782595; cv=none; b=TUG0TX+4549eAWfCX6uw/U2l1khOE3QevEbyGnzJULQ6p5zkNN6OmKUIm7daSVuiJv0lysNdXONWO6T7H0Q2QPjXN+fjDlpwTWWTVAe0FaPghH09jIFEyNzONFyGdhxiAFl1SaG9/6HsWQgjcMuZ/QeQcendMrICKSNZSat0YgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782595; c=relaxed/simple;
	bh=fJEm25dH1y6EOkMRRYqO7y8ORNR0reygkJUR3Cbg4Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7p2XvUae/F9U5uFm+SkcCtZEWVhg/iPo6/IoYQU/WgxEpUuhmk7P0CnZnXSX7cNRn5Cg8NYC10IdR8AfRd7IKEn3Pgai/KUaJmelsMM+iUhF6HDPBaduknA4WX42OH9RmBWa9xg1bkauKRQwUJY8LtfyUHFOKXBy58j8fHHM3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFLSa1Es; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFLSa1Es"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77756C2BCB3;
	Thu, 14 May 2026 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782594;
	bh=fJEm25dH1y6EOkMRRYqO7y8ORNR0reygkJUR3Cbg4Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFLSa1Esfxz7x1JwzdViATqXIRSaoQSXevi1OJtbMbtHqLQpSO+ZcPMKkh1nlyS2M
	 R8lt7VLW3yJKEd+3CNLstb03LDrHISdsQhyrbbpKI3UmA6QpTU1qiB67R0W2r7Q4t2
	 jCuphqpdWqDq6hTtuKhzk0755NkrH/8ECe0xluGyh5sUZeZ1Jb4YMquxEg3NHmeva8
	 Ze2GuxElc4KboQwjoTCDYiWEGi4pw7sP4nVJ4aol82oJfFPVM5en06KmgFt/MZ5GrG
	 JVFSdyuTMbgaIdvvSSdILDiLs7PAOdr16jSpYckBeFCqy089YAb3ZhhaIn7XyCuult
	 94RlkDoAGH0Wg==
Date: Thu, 14 May 2026 19:16:27 +0100
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
Subject: Re: [PATCH v1 1/3] dt-bindings: display: rockchip: analogix-dp:
 Expose inherited properties
Message-ID: <20260514-upstate-sneer-0b6e78682798@spud>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
 <20260514070133.2275069-2-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mVkoKuQ4tnstZXFd"
Content-Disposition: inline
In-Reply-To: <20260514070133.2275069-2-damon.ding@rock-chips.com>


--mVkoKuQ4tnstZXFd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 03:01:31PM +0800, Damon Ding wrote:
> Expose the inherited properties from the base analogix-dp schema
> to satisfy unevaluatedProperties constraints.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Given it's unevaluatedProperties, not addtionalProperties, this patch
shouldn't be needed?

> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml    | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index bb75d898a5c5..896ded87880f 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -50,6 +50,13 @@ properties:
>    aux-bus:
>      $ref: /schemas/display/dp-aux-bus.yaml#
> =20
> +  reg: true
> +  interrupts: true
> +  phys: true
> +  phy-names: true
> +  force-hpd: true
> +  ports: true
> +
>  required:
>    - compatible
>    - clocks
> --=20
> 2.34.1
>=20
>=20

--mVkoKuQ4tnstZXFd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYRewAKCRB4tDGHoIJi
0gh6AQDIt0Wy+KmYo0XcRM9NN7v66Y9rNrmbrCAaSxSTx2tAuwD/XM5Y1B12VcMT
yz1+fUbrvZi2xJUPMA4qhMFXCvAXGgA=
=+BYe
-----END PGP SIGNATURE-----

--mVkoKuQ4tnstZXFd--
