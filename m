Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D987140BCB6;
	Wed, 17 Jun 2026 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781731075; cv=none; b=MmQ3te+W8Z99clo4NVNL7p67JK0CHLtgvX3pNP2VaIl9GiHEXONsfjC5DPaXkV9J5cklHaH9/EtZN0XAGBevDqrjDhJCT1guu8bt1fK7mYpHpPuYvCrhtOUQxB7NRyqaieYcOn9cy8JtdLXv483NT0ZuahSlicf5PsaCAZKCd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781731075; c=relaxed/simple;
	bh=eycdsdV7ytQQDE6DJ18g284YGQSMK5DWz+RszIZX5pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIiOrcocBEdZ1q6oCZBuJ7XiQcOvugFpDFYzezB8WPwi73eoxk4mPvt8Y2ptHg9QPD3/z6lK38sn0x7mRck+dfFUoOCgUT4mRsPPn77Uhfri+Cy6/EgxJa5qA7YLtg3QCZRtox69Q4uPoTczyMnqiqy2W8kyeAN7cY9IBG7Pp+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUFhYcTq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUFhYcTq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3F71F000E9;
	Wed, 17 Jun 2026 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781731074;
	bh=r8L0edQt/Ee/yQpXmlrZgcjgW4ACeKUS6LxtyCaw9XY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EUFhYcTqHHFprC+qZA3THeFlIO8qFuA5cHIEVgLsAZVQ6sMUJU+vSWkNNi3if6Zv0
	 OkPfTUuHql8WSH92iBZoJyldI9iRlKLs8V4PBdp+VV6pmYSmXiKyrmaWAZAo777F/B
	 vbo8e2TjqdunvNkZUG10as16NbmOWAdi9cA/BcWQN7kas0fUJFIBJGnQSa35vgur4R
	 oF2182EZPnrUMy8qvWvKwc7NYFxSQT0vgOA8bKxvd8P/wv2yPo8tC+jmCyYmpJ6QJ2
	 kM0Ov8CC+QfE9NBm0IOUvLEVXJCTjPwsKJee/DQoL3N/KELYjdOiZKG3LncoK6sJsZ
	 v5kDJI6h/C4lg==
Date: Wed, 17 Jun 2026 22:17:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Message-ID: <20260617-defrost-handler-3290abc01857@spud>
References: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
 <20260617-feature-mipi-csi-dphy-4k60-v1-2-4611ff00b0ff@wolfvision.net>
 <20260617-deviate-sulk-c57104ef939f@spud>
 <c34d4167-1a33-4e20-820c-735811b6a966@wolfvision.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ickn2VCpN26N0qJ+"
Content-Disposition: inline
In-Reply-To: <c34d4167-1a33-4e20-820c-735811b6a966@wolfvision.net>


--Ickn2VCpN26N0qJ+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 06:20:19PM +0200, Gerald Loacker wrote:
> Hi Conor,
>=20
> Am 17.06.2026 um 17:51 schrieb Conor Dooley:
> > On Wed, Jun 17, 2026 at 02:23:14PM +0200, Gerald Loacker wrote:
> >> Add support for the optional rockchip,clk-lane-phase device tree prope=
rty
> >> to allow board-specific tuning of the clock lane sampling phase for
> >> improved signal integrity across supported data rates.
> >>
> >> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> >> ---
> >>  Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 7=
 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-d=
phy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> index 03950b3cad08c..0d824d1511bc0 100644
> >> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> @@ -56,6 +56,13 @@ properties:
> >>      description:
> >>        Some additional phy settings are access through GRF regs.
> >> =20
> >> +  rockchip,clk-lane-phase:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    minimum: 0
> >> +    maximum: 7
> >> +    description:
> >> +      Clock lane sampling phase in 40 ps steps. The hardware default =
is 3.
> >=20
> > Can this instead become rockchip,clk-lane-phase-ps and be listed in the
> > actual unit?
> > With the -ps suffix, you can then drop the $ref.
> > The default should be listed as "default: 3" (or default: 120)
> >=20
> > pw-bot: changes-requested
> >=20
>=20
> Thanks for the suggestion.
>=20
> The phase setting is a hardware tap index (0=E2=80=937) selecting a delay=
 line
> position. The datasheet mentions =E2=80=9Cabout 40 ps=E2=80=9D per step, =
but this is not
> a calibrated or guaranteed value and may vary with PVT.
>=20
> Because of that, I=E2=80=99d prefer to keep the property as an index and
> document the approximate delay in the description:
>=20
> Clock lane sampling phase selection (hardware tap index 0=E2=80=937). Eac=
h step
> corresponds to an approximately 40 ps delay as described in the hardware
> specification.
>=20
> This matches the hardware model more closely. Happy to adjust if needed.
>=20

Sure, I think that's fair.

> >> +
> >>  required:
> >>    - compatible
> >>    - reg
> >>
> >> --=20
> >> 2.34.1
> >>
>=20

--Ickn2VCpN26N0qJ+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajMO/gAKCRB4tDGHoIJi
0nNiAQDGqdn+tVrfgHKSxX2jDI4GVxuPM/2N7UWyiTmGN1rXPQEAgQ4uRnmAPDwA
ghCPMmy7HHNGhVGn8aephG5ofuMtPgg=
=h3/b
-----END PGP SIGNATURE-----

--Ickn2VCpN26N0qJ+--
