Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136BB330D25;
	Tue, 30 Jun 2026 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839711; cv=none; b=G6ru9eXH+ZE+stLgS7ZanLg7kzvFHza8wVmZYZA9q79gDzccVAge3alr2gPn5G32ffgxKtUKOKDISclQ8AsLpeK6L1xWSA/Lw/lJxxY54GFSYdBhEGlsrLfKc0lcGWIocDf92Qu2sxQJSmQvHpNk5ac9IkRnj/MKpMosOLW9E+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839711; c=relaxed/simple;
	bh=zoCexdF8WAmj/A/cB9RD+x/uZadpQsC20Zx9sVby7Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHPFSRbxhM+1mphsOMHsTO0IHM6/d1R+BB27hI6o58u6t7FQDsNBJvPLLL1U6K25TNL8cJn2i/P5M5ZfI0mdPyFp8NfQKlBoT6KBWf5kyzYbuWnboL4T+QTCoFfgTg+V9uoqu/k5S8eIbLX97BYyw3oqqU6YXYIsUzIbatnxWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4V3OQDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4V3OQDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BC21F000E9;
	Tue, 30 Jun 2026 17:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839709;
	bh=zoCexdF8WAmj/A/cB9RD+x/uZadpQsC20Zx9sVby7Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G4V3OQDK4LuGRepnI0nswNLNa/lKuAhTlsiY4H/ai3sTir+w0BkplZkG/88C1YjoE
	 Ffdpg1MXKDTALoy7fWJHkV5zrAGmDMuCfZ4r3rU2LIGF2RAMIENOXc2420muOJmZQl
	 wcYv8eysEx7vayF4lhA/q/SJt0VpKuDjgVWrVwzWfQDvkeIX6icpH0FEFRrq97NAbn
	 uFtuWna5TSOULIZpfJCPupO92fBNo3m+AUaPlt7Bij+TgXJQb88ndD9BPaTwXxg6kc
	 QPfxJokhSoTAtT2/0X9552Zd+fvO7iA5LXtk52p63kzZaqPP6LAp1VHVA34bI9L5Ph
	 84iUzCm7/+6mQ==
Date: Tue, 30 Jun 2026 18:15:05 +0100
From: Conor Dooley <conor@kernel.org>
To: YC Hsieh <yc_hsieh@aspeedtech.com>
Cc: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 3/4] dt-bindings: ipmi: Add optional LPC properties to
 ASPEED BT devices
Message-ID: <20260630-privatize-flap-8b01761853eb@spud>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
 <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>
 <20260629-bogus-vocation-db32e55a595f@spud>
 <TY0PR06MB6855F690BCCCA45172F3F0AD93F72@TY0PR06MB6855.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GgAjwmP4KtDGuBGB"
Content-Disposition: inline
In-Reply-To: <TY0PR06MB6855F690BCCCA45172F3F0AD93F72@TY0PR06MB6855.apcprd06.prod.outlook.com>

--GgAjwmP4KtDGuBGB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 02:24:52AM +0000, YC Hsieh wrote:

> ************* Email Confidentiality Notice ********************
> =E5=85=8D=E8=B2=AC=E8=81=B2=E6=98=8E:
> =E6=9C=AC=E4=BF=A1=E4=BB=B6(=E6=88=96=E5=85=B6=E9=99=84=E4=BB=B6)=E5=8F=
=AF=E8=83=BD=E5=8C=85=E5=90=AB=E6=A9=9F=E5=AF=86=E8=B3=87=E8=A8=8A=EF=BC=8C=
=E4=B8=A6=E5=8F=97=E6=B3=95=E5=BE=8B=E4=BF=9D=E8=AD=B7=E3=80=82=E5=A6=82 =
=E5=8F=B0=E7=AB=AF=E9=9D=9E=E6=8C=87=E5=AE=9A=E4=B9=8B=E6=94=B6=E4=BB=B6=E8=
=80=85=EF=BC=8C=E8=AB=8B=E4=BB=A5=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E9=80=
=9A=E7=9F=A5=E6=9C=AC=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E4=B9=8B=E7=99=BC=
=E9=80=81=E8=80=85, =E4=B8=A6=E8=AB=8B=E7=AB=8B=E5=8D=B3=E5=88=AA=E9=99=A4=
=E6=9C=AC=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=
=BB=B6=E5=92=8C=E9=8A=B7=E6=AF=80=E6=89=80=E6=9C=89=E8=A4=87=E5=8D=B0=E4=BB=
=B6=E3=80=82=E8=AC=9D=E8=AC=9D=E6=82=A8=E7=9A=84=E5=90=88=E4=BD=9C!
> =E4=BF=A1=E9=A9=8A=E7=A7=91=E6=8A=80=E4=BB=A5=E8=AA=A0=E4=BF=A1=E6=AD=A3=
=E7=9B=B4=E5=8E=9F=E5=89=87=E6=B0=B8=E7=BA=8C=E7=B6=93=E7=87=9F=E4=BC=81=E6=
=A5=AD=EF=BC=8C=E4=B8=A6=E5=B7=B2=E5=A7=94=E7=94=B1=E7=AC=AC=E4=B8=89=E6=96=
=B9=E5=85=AC=E6=AD=A3=E5=96=AE=E4=BD=8D=E5=8B=A4=E6=A5=AD=E7=9C=BE=E4=BF=A1=
=E5=8F=8A=E4=BF=A1=E9=A9=8A=E7=A7=91=E6=8A=80=E7=8D=A8=E7=AB=8B=E8=91=A3=E4=
=BA=8B=E4=BE=86=E7=AE=A1=E7=90=86=E5=8C=BF=E5=90=8D=E8=88=89=E5=A0=B1=E7=B3=
=BB=E7=B5=B1=EF=BC=8C=E5=A6=82=E5=90=84=E5=80=8B=E5=88=A9=E5=AE=B3=E9=97=9C=
=E4=BF=82=E4=BA=BA=E7=AD=89=E6=9C=89=E7=99=BC=E7=8F=BE=E4=BB=BB=E4=BD=95=E9=
=81=95=E6=B3=95=E5=8F=8A=E9=81=95=E5=8F=8D=E5=85=AC=E5=8F=B8=E5=BE=9E=E6=A5=
=AD=E9=81=93=E5=BE=B7=E3=80=81=E9=81=95=E5=8F=8D=E6=B3=95=E4=BB=A4=E6=B3=95=
=E8=A6=8F=E5=8F=8A=E5=B0=88=E6=A5=AD=E6=BA=96=E5=89=87=E3=80=81=E4=BA=A6=E6=
=88=96=E9=9C=B8=E5=87=8C=E5=8F=8A=E9=81=95=E5=8F=8D=E6=80=A7=E5=88=A5=E5=B9=
=B3=E7=AD=89=E4=B9=8B=E6=83=85=E4=BA=8B=EF=BC=8C=E8=AB=8B=E7=9B=B4=E6=8E=A5=
=E9=80=8F=E9=81=8E=E4=BB=A5=E4=B8=8B=E5=8F=AF=E9=81=B8=E6=93=87=E5=8C=BF=E5=
=90=8D=E4=B9=8B=E8=88=89=E5=A0=B1=E7=B3=BB=E7=B5=B1=E8=88=89=E5=A0=B1=EF=BC=
=8C=E5=86=8D=E6=AC=A1=E6=84=9F=E8=AC=9D=E6=82=A8=E5=8D=94=E5=8A=A9=E4=BF=A1=
=E9=A9=8A=E6=8C=81=E7=BA=8C=E9=82=81=E5=90=91=E6=B0=B8=E7=BA=8C=E7=B6=93=E7=
=87=9F=E3=80=82=E4=BF=A1=E9=A9=8A=E7=A7=91=E6=8A=80=E8=88=89=E5=A0=B1=E7=B6=
=B2=E7=AB=99=E9=80=A3=E7=B5=90=EF=BC=9Ahttps://secure.conductwatch.com/aspe=
edtech/
>=20
> DISCLAIMER:
> This message (and any attachments) may contain legally privileged and/or =
other confidential information. If you have received it in error, please no=
tify the sender by reply e-mail and immediately delete the e-mail and any a=
ttachments without copying or disclosing the contents. Thank you.
> ASPEED Technology is committed to sustainable business practices based on=
 integrity and honesty principles. In order to ensure that all information =
can be openly and transparently communicated, a third-party independent org=
anization, Deloitte and ASPEED Technology's independent directors, have bee=
n entrusted to manage the anonymous reporting system. If any stakeholders d=
iscover any illegal activities, violations of the company's professional et=
hics, infringements of laws and regulations, or incidents of bullying and g=
ender inequality, please directly report through the anonymous reporting sy=
stem provided below. We thank you for your assistance in helping ASPEED Tec=
hnology continue its journey towards sustainable operations: https://secure=
=2Econductwatch.com/aspeedtech/

Sort this out, it's not compatible with mailing lists.

--GgAjwmP4KtDGuBGB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP5mQAKCRB4tDGHoIJi
0sANAQDA/60UmVrLczKv6SoSmrQAAFOoThdWuBLoAD3P9T2y1QEA2X+Byuamqo3I
lYXK5bHUCYUvg75FNp5lunAzcWGfVwE=
=8JpS
-----END PGP SIGNATURE-----

--GgAjwmP4KtDGuBGB--
