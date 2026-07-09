Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BBC42B324;
	Thu,  9 Jul 2026 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612326; cv=none; b=Yz8H/fVpc2OH3XToC02Istx2fzf/9mIzkRTaoIYkwqnnwaYtZpTDRxrTh9P7hvLk2tuyaBT/FwupZi3SswV9/xY1R6+GV/IC40LCzsOr9OxoH4096AeaI4oOCb8EEoVDhnwEj9+7LkOo8thBN/1J7dxlmj17q/6GmtPnA+CPCUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612326; c=relaxed/simple;
	bh=QgoiG6IPX5YsMyUlVzmh9MgMADCFITLbf9l1isOTDOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBt2YMtxPxnucmojJWG4E6D2ZXZVBPLJ/VjzskSj9H5KIhMoG9VYTN+oyWChpf11Z9qNpYBztH8QFgh6eUEen1OM8yRKhN4ysZOcfBjn9duYv0y07IE22ZOtZjzx7SaNcSiWmU8ycMXGmsJzLlZo4D2GNlWCZpHVzzQIJDakYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwClcfqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwClcfqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D8F1F000E9;
	Thu,  9 Jul 2026 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783612324;
	bh=GRMlo223WK1vJhCGy8/PE42NkVsYFCsHmCK+AI0l5aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YwClcfqy+EI0om3wSR+FTT1nFgfjpWkF5h/T1GEs2Hwem8VlfwtaZT1QNgHljZDAW
	 hipWaCyRmHExw0KqSNv/DEr/yLqjSScHHShaYXoLCEbXeMIIj+Aqs4O9iJP7uWLJrk
	 AxD0I3bINYSMttjJ51Ryh5aKOd7sAt7uBRwhghu20uMYKW5WnpcJoKdRgm3FEeNjce
	 jPV4MVNrJp4jz/JLFpD5KL5Ppm5AmP8zte4zGC+yyiRtCNYhZsUAyoFYBNxfPJbzr/
	 gnyt7BrYYpctTlbIIhJaXsAkkugU6Ep2yVX3ZIZ7V1dAOJjimxGQQqNViFMw3LaZsy
	 BAtoaebdIc8gQ==
Date: Thu, 9 Jul 2026 16:51:59 +0100
From: Conor Dooley <conor@kernel.org>
To: "Praveen, Gokul" <g-praveen@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, neil.armstrong@linaro.org, nm@ti.com,
	robh@kernel.org, sjakhade@cadence.com, kristo@kernel.org,
	vigneshr@ti.com, vkoul@kernel.org, yamonkar@cadence.com
Subject: Re: [PATCH v5 net-next 1/2] dt-bindings: phy: cadence-torrent:
 Update property values to support multilink SERDES configuration
Message-ID: <20260709-unvalued-washtub-d024d21f5624@spud>
References: <20260708083725.66777-1-g-praveen@ti.com>
 <20260708083725.66777-2-g-praveen@ti.com>
 <20260708-purifier-subside-667f32244c09@spud>
 <18b1c832-d0ba-4465-90c8-09e7c48becde@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mqzgQ8eCWAJGP231"
Content-Disposition: inline
In-Reply-To: <18b1c832-d0ba-4465-90c8-09e7c48becde@ti.com>

--mqzgQ8eCWAJGP231
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 03:37:15PM +0530, Praveen, Gokul wrote:
> Hi Conor,
>=20
> On 08-07-2026 22:09, Conor Dooley wrote:
> > On Wed, Jul 08, 2026 at 02:07:24PM +0530, Gokul Praveen wrote:
> > > Update the maxItems value of clocks parameter as 3 clocks
> > > (refclk,pll1_refclk,phy_en_refclk) are supported.
> > >=20
> > > Update the clock-names parameter to support mutilink SERDES configura=
tion
> > > as the existing enum configuration of the clock-names parameter does =
not
> > > allow both pll1_refclk and phy_en_refclk to be used at the same time,
> > > hence preventing the support for the configuration  (refclk,pll1_refc=
lk,
> > > phy_en_refclk), which is neeed for multilink SERDES usecases.
> > >=20
> > > For multilink SERDES configurations where the links require different
> > > clock speeds, all 3 clocks(refclk, pll1_refclk and phy_en_refclk)
> > > are needed.
> > >=20
> > > For example,considering the USXGMII+SGMII multilink SERDES configurat=
ion
> > > usecase, having only 1 reference clock(refclk) fails because USXGMII
> > > requires a clock speed of 156.25 Mhz and SGMII protocol requires an
> > > clock speed of 100 Mhz.
> > >=20
> > > Since one reference clock(refclk) alone cannot cater to the 2
> > > different clock speed requirements of these protocols, the second
> > > input reference clock(pll1_refclk) along with phy_en_refclk
> > > is also needed.
> > This binding supports 2 devices and the generic compatible. Do all these
> > devices have the new refclk?
>=20
> Not all of these devices have the new refclk(pll1_refclk), Conor, which is
> is why the enum was kept as it is and in these devices multilink serdes
> configuration will not be possible due to the limitation of not having the
> new refclk(pll1_refclk).

In that case, please restrict 3 clocks to only the devices which have
them.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> However, The intent of this patch is to add multilink serdes support for =
the
> devices which have the new refclk because the
>=20
> earlier clock-names configuration could not support having all the 3
> clocks(refclk, pll1_refclk, phy_en_refclk) in the clock-names, which is
> needed for mutlilink serdes configuration configuration.
>=20
> Also, Please feel free to ask if you have any other queries, Conor and th=
ank
> you for this query .
>=20
> Thanks and Best Regards
>=20
> Gokul Praveen
>=20
> > Thanks,
> > Conor.
> >=20
> > > Signed-off-by: Gokul Praveen <g-praveen@ti.com>
> > > ---
> > >   Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml | 3 =
++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torren=
t.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> > > index 9af39b33646a..ac0f625cd76d 100644
> > > --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> > > @@ -34,7 +34,7 @@ properties:
> > >     clocks:
> > >       minItems: 1
> > > -    maxItems: 2
> > > +    maxItems: 3
> > >       description:
> > >         PHY input reference clocks - refclk (for PLL0) & pll1_refclk =
(for PLL1).
> > >         pll1_refclk is optional and used for multi-protocol configura=
tions requiring
> > > @@ -48,6 +48,7 @@ properties:
> > >       items:
> > >         - const: refclk
> > >         - enum: [ pll1_refclk, phy_en_refclk ]
> > > +      - const: phy_en_refclk
> > >     reg:
> > >       minItems: 1
> > > --=20
> > > 2.34.1
> > >=20

--mqzgQ8eCWAJGP231
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/DnwAKCRB4tDGHoIJi
0n4XAQC5MnC2I5YXHC52d+ueIJB+UAs57axUxbMswrRVlQ4JpgEA/wgE2WC9Nhgs
VMzI4rhMq6Yy6RqGA/Uoy3fwULsBgQM=
=t+xa
-----END PGP SIGNATURE-----

--mqzgQ8eCWAJGP231--
