Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35C1DF26E;
	Fri, 12 Jun 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279894; cv=pass; b=rmrxpzs1ntKTMF1wcQV9VhVWrdpaBOwq1kxAb6sp34Ile3rxmnHBRIc+jVSalxCP9RktPMcz4+enk04x+9arvBe/UigE7PxdLAZ484LfeMcGMMrLqmHy4q34ytCu+lD1wUpnhk3olsILhqRipT3xJfrZc8ullCKiNj6s4R0Q5Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279894; c=relaxed/simple;
	bh=BxEKO7UrkMViC5yVIbY/xbpohVjrOccUAObFA9bxqDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gobUb4Qks+aw880rU/lExbRduK3ZYZScGaVvO6S6A/hx/D29Dv+cPJXNp14PuKFP0cRVOtJfEOhPV6yzHUkTRzPCZXGEhqvdf/YDJTLqXCquhoGP4Mv46Gv0m/lG20AjapymAZnfOKup1+Lg748XYzX1mKGpjd+xWjYRHh8weIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=VRN6z7S5; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="VRN6z7S5"
ARC-Seal: i=1; a=rsa-sha256; t=1781279867; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nGvzkeuAayjdmBeqtxbjSWHbdPj8/CMrlnp4k5a07CEE11tERyT42JuG3FEpYN8ArfOh7vM3wdb6O43o0CUsmtS83AC6EEJAksu+JBIs+/WKYNjW3XFwZt4WrcEi1ueQR6dotr75yvNLK/ehDEhQJDj+lIZXuNRvjcmrmdRfidE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781279867; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vzdJ9w2taUV525sIaNdL6rwORL1fnnyeOFL2zOPHUvc=; 
	b=I64hqWs9kfidq6Sua/Ter/ug4SFISdzHpkNJx3kT4lVm3a19ejchBMK8Z0vw07KYDpEV284wpcIsQomhzLp8PuxSHaczeMU3gVGwmtLJd6OO4+uKFXvrkbH7U8/Q/r+GbHdO7RuqK/R8VMr58hKsXqLd7SKZqM+5nwW4LfeEibM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781279867;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=vzdJ9w2taUV525sIaNdL6rwORL1fnnyeOFL2zOPHUvc=;
	b=VRN6z7S5+7K9JM9iR+cBluY6aRs1RVeyf7/gayIkp58AnkAg7LGrPlgwMJDWyn1J
	UuIoGA42i+Jrdm5cqL2X/7ll9Ac+t8wr/HjSVA6URfHh1sHeOuw9QQXw7y76+VZ4b1R
	AofejKoL13MDuLMr2GbhM8nGZdaZ9U9VQbkoWxS0=
Received: by mx.zohomail.com with SMTPS id 1781279864587114.40647436656968;
	Fri, 12 Jun 2026 08:57:44 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id D5B15180674; Fri, 12 Jun 2026 17:57:39 +0200 (CEST)
Date: Fri, 12 Jun 2026 17:57:39 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Yubing Zhang <yubing.zhang@rock-chips.com>, Alexey Charkov <alchark@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 07/16] phy: rockchip: usbdp: Support single-lane DP
Message-ID: <aiwrNQhPsqlqDB-Z@venus>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-7-7775671ece22@collabora.com>
 <f29df43b-111d-471b-8579-0196596fc32b@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rchdwn5oprkndp3s"
Content-Disposition: inline
In-Reply-To: <f29df43b-111d-471b-8579-0196596fc32b@linaro.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/281.270.71
X-ZohoMailClient: External


--rchdwn5oprkndp3s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 07/16] phy: rockchip: usbdp: Support single-lane DP
MIME-Version: 1.0

Hi,

On Wed, May 06, 2026 at 04:53:07PM +0200, Neil Armstrong wrote:
> > @@ -537,6 +538,13 @@ static void rk_udphy_usb_bvalid_enable(struct rk_u=
dphy *udphy, u8 enable)
> >    * <0 1>                  dpln0         dpln1       usbrx         usb=
tx
> >    * <2 3>                  usbrx         usbtx       dpln0         dpl=
n1
> >    * ------------------------------------------------------------------=
---------
> > + * if 1 lane for dp function, 2 lane for usb function, define rockchip=
,dp-lane-mux =3D <x>;
> > + * sample as follow:
> > + * -------------------------------------------------------------------=
--------
> > + *                        B11-B10       A2-A3       A11-A10       B2-B3
> > + * rockchip,dp-lane-mux   ln0(tx/rx)    ln1(tx)     ln2(tx/rx)    ln3(=
tx)
> > + * <0>                    dpln0         \           usbrx         usbtx
> > + * -------------------------------------------------------------------=
--------
> >    */
> >   static void rk_udphy_dplane_select(struct rk_udphy *udphy)
> > @@ -544,18 +552,18 @@ static void rk_udphy_dplane_select(struct rk_udph=
y *udphy)
> >   	const struct rk_udphy_cfg *cfg =3D udphy->cfgs;
> >   	u32 value =3D 0;
> > -	switch (udphy->mode) {
> > -	case UDPHY_MODE_DP:
> > -		value |=3D 2 << udphy->dp_lane_sel[2] * 2;
> > +	switch (udphy->dp_lanes) {
> > +	case 4:
> >   		value |=3D 3 << udphy->dp_lane_sel[3] * 2;
> > +		value |=3D 2 << udphy->dp_lane_sel[2] * 2;
> >   		fallthrough;
> > -	case UDPHY_MODE_DP_USB:
> > -		value |=3D 0 << udphy->dp_lane_sel[0] * 2;
> > +	case 2:
> >   		value |=3D 1 << udphy->dp_lane_sel[1] * 2;
> > -		break;
> > +		fallthrough;
> > -	case UDPHY_MODE_USB:
> > +	case 1:
> > +		value |=3D 0 << udphy->dp_lane_sel[0] * 2;
>=20
> What's the point of keeping this no-op calculation ?

This function is cleaned up in a later patch to no longer have the
switch/case at all ("Cleanup DP lane selection function"). I kept
the no-op calculation here, since it IMHO makes it easier to understand
the cleanup patch and will be optimized away by the compiler anyways.

(I will send out a new patch series in a jiffy)

Greetings,

-- Sebastian

--rchdwn5oprkndp3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmosLG8ACgkQ2O7X88g7
+powOhAAjGKDnrFO/NogQjJApKysPt9NuuN6z1D58zENDmEHAdPNtxLZl9DsyK1f
bhNbIb/kv9nN3HuJgCHsT3/5FiG7xUMq/FzE/LZXkYv70AA9TC1uH8hd6/JvTxzi
jVzUVU9Kgxg0Q5RxfOlFF9pC1NhT+BWzbT5vAbdF367hEKzPataR01oYpn/jgEmg
v7otspxo6li0UWm/kYndVpql9nwDTWTn7upSLcUUNC2JOqVq/JRw9IhX4E+4Q7yO
05uATUwjSXCsWlP2fvLGTuyouPEnpT4vIZEE5yC4MiY4ZMZJECvluWweAhBsrVf6
mcztycUWmsTqEtqfAR02KxwtNJS0cmGpCdKfA/n+GulU4TgsCzD3vsUNQcs4sU6V
rVGb/v4Wh6QJbMBzw8Y+t2ts2coGC27fZUx8f3cSX0KOTqlg2t704/dHvcA9ooAK
rMUekMp8P4TVtXYf2MHtGU4QwviQUqkXGe2STukCIX/fgNYMGPmDrQKo0NUb1BgU
UzApK1gna3wOUBXojV1efN/JEpxQqBbEcy8DJeVu31jBO2ymYObn9PKf2hqjSnIG
HJ/35QT9khXiDj9zcg/pxt7abqwVJVRfIad0nsJ+tIsCYHTlmOzkJTqxauq3A8Zl
Qqjgl0LYeZotsiZ4PCrEiDJyVqxUwdE9+EQR3gyVNoCUcARsNhw=
=+Cjz
-----END PGP SIGNATURE-----

--rchdwn5oprkndp3s--
