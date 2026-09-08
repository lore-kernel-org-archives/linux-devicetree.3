Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CCB54A7D7
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874309; cv=none; b=TZgcrWUuCrhMALcfWRYPIm4BHt+PSBJIDySiUIdX4N4PaqX1D9gXnJhKrJNgZWBOuXQ0uKucWnp4S/NVQkhhXlKgOiXWxZoUk8SWd6D7TFmiLB0ZNRb8xt8uPChTxJDQuGBXIWayYNtppKViEpWi7Opi4tehpS1jsCMmFYPSJig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874309; c=relaxed/simple;
	bh=dhnWJnXaxw0P0j3PLR7CX+ym7THKxl9bQFROIbM+/WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCeIh0Ust0nCI6aHXt3JvW/7N/Wap3VLGdC6mitrqib+1WofABq6QfKI35Ram0Le+RPvkd84i7gMqmsxv3O+LFE0D4vY4ivJVMf7Jcr9w5mOx2kRXWZoCUlPiud2yIU4A5JwJJ903dYOXzHRz9a8jv4s54EBeatv1BkyVtMSqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5U01osI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5U01osI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2751F00A3F;
	Tue,  8 Sep 2026 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788874295;
	bh=dhnWJnXaxw0P0j3PLR7CX+ym7THKxl9bQFROIbM+/WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R5U01osIbt5PuHbUuvi3dOa6NmTHxEkdlxiS4OxJq7O4CtPyM11gvISLypnLLVUch
	 9f+U2awUKAxMe5mj1CTQSmW/HSW/SmhoOu5soJvA8codtKhqg4bgcPs+Wl/VHBLmvR
	 7WdMvqvp0g4RT/2n5shIRHPNQ4ZifvWcpMkMOLrX/FI5dR7Vc77UhFTaFLegL0/0Gt
	 Je2JuXmRs2jw0OhsIH/QtSZqcMabWJ/4YWs6Dp9oYXS3sfAiGXf9cOYLZICsBTmLIN
	 Gp+gTgxt/c71SF6Ws54Nk3RMvjDKMxsxvDUoKHh0nVapv+gSrvfNGSdCLGu9u55EAr
	 CJ0Isos76BhqQ==
Date: Tue, 8 Sep 2026 14:31:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
Message-ID: <20260908-zebra-reacquire-f534e563a4d0@spud>
References: <20260316060328.1173634-1-ganboing@gmail.com>
 <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
 <20260324-marshland-stretch-cc21ae7fdc2e@spud>
 <1a7cf36f-aef3-4837-8390-5d063fab3e14@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oro6JpDkbVfVmUyg"
Content-Disposition: inline
In-Reply-To: <1a7cf36f-aef3-4837-8390-5d063fab3e14@gmail.com>

--Oro6JpDkbVfVmUyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 07:15:14PM -0700, Bo Gan wrote:
> On 3/24/26 10:49, Conor Dooley wrote:
> > On Mon, Mar 23, 2026 at 04:08:33PM -0700, Bo Gan wrote:
> > > Hi All,
> > >=20
> > > Any suggestions/comments on this?
> >=20
> > I'll get to it at some point, just busy sorry!
>=20
> Hi Conor,
>=20
> It's been quite a while, and I almost forgot about this. Any new
> suggestions? Comments?

Oh god, I completely forgot about this - sorry.

I'm unfortunately not available really until the 22nd, but I'll do my
best to take a look before LPC.



--Oro6JpDkbVfVmUyg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqAOMgAKCRB4tDGHoIJi
0r5NAQDALbANihieHP5lxczzb36m0lZZrnbbEhBSfYQ59A55NgEAlj4ZiKRgN2Sc
7B4cksPhhSqM9X9AUI8QciYw4K6j3g8=
=JpNz
-----END PGP SIGNATURE-----

--Oro6JpDkbVfVmUyg--
