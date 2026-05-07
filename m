Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B444DB61;
	Thu,  7 May 2026 17:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173806; cv=none; b=V8oBsbLRPDyQCRB+eceImrSixlAkqvJpaAakanNHYahoMeas0cLSQw/ibDVNOuQPa3FBMxt9626ELPA+47RnanKqBZwwIlwkcnRO9pSUfXyEMMyH2JCR2R7AzS27F2jVTWonbUwZtMsJm9AJ7Cc2KCxHqPpnZhSA8iLjMBUyKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173806; c=relaxed/simple;
	bh=+fDDC2gOM2vT37zdm0PRjn+cEpox1iVc6cmHoJwRQCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIEBClI0P3z/7UPjTD3AGypr8e0fToduSCMz2RdxkbEo4uGiYtD2pryrWMIP4zkHtcbcOYASDDxTLR6Nx4vtwygptuK0cP9Ke87rEVbvW0ZUW/Zceu9YCEftAkSW6pQyYnWiBFl1FT2ioFqCInhgiSiyHuErN31D9hdZ4XetNTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cyo4OR5A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cyo4OR5A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC4AC2BCB2;
	Thu,  7 May 2026 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778173805;
	bh=+fDDC2gOM2vT37zdm0PRjn+cEpox1iVc6cmHoJwRQCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cyo4OR5A5MyZj9MMxk86nEfGhWcKSueVZGP4x/CxhWKnTTa0/BdwWzRwssDNCFNiN
	 dkqnUmE1y21qSe7oEyAvyiLZAkYaIB8nUjjj4WlVN3hrklJ//F+lbyfuARrt2aAZvJ
	 DSQVHPr0Zl9j+pJ4JP85SOzegE5/xILzm3eYhXN2IIuysrmvEsWyv4UsTEZMbPqXE/
	 OHaLDuR+SWpCiQrNnXwLdLei3AO+HTAMThdUVXxKrLqVNiqgF0kqlirTOHME3VW4Am
	 VQ8vJF9al4xc7yYlbjsXsVerkYAROCg67yV6Ta3o9Rlhq9icBmKV6Jigj/2umsbh1r
	 9Zr850FHZesBQ==
Date: Thu, 7 May 2026 18:09:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: jhb100: Add JHB100 base DT
Message-ID: <20260507-marina-cost-dc8e597ccf26@spud>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-5-changhuang.liang@starfivetech.com>
 <20260506-proud-dubbed-9ab8011df899@spud>
 <NT0PR01MB1216090A629C0095441617F6F23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XQEiPSEut9rI/7HI"
Content-Disposition: inline
In-Reply-To: <NT0PR01MB1216090A629C0095441617F6F23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>


--XQEiPSEut9rI/7HI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 09:05:44AM +0000, Changhuang Liang wrote:
> > On Wed, May 06, 2026 at 01:59:37AM -0700, Changhuang Liang wrote:
> >=20
> > > +	clk_uart: clock-25000000 {
> > > +		compatible =3D "fixed-clock"; /* Initial clock handler for UART */
> >=20
> > What does this comment mean?
>=20
> Here it's just a temporary clock; it will be replaced by the clock driver=
 later.


In that case, it is highly unlikely that I merge this without the clock
driver.

--XQEiPSEut9rI/7HI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzHZgAKCRB4tDGHoIJi
0hgHAQD28JsxpyMgMAdl7P10S7blw9HcLMODqNpWq66EFUqvagEAx2wXe7SCziUl
s/0N0aDh4GCXtJ64mod/tE/f18OrOQg=
=sk7Z
-----END PGP SIGNATURE-----

--XQEiPSEut9rI/7HI--
