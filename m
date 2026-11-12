Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505687;
	b=FPR/PKEn8K9BjZ5IuOas962fjIRuVuE0EoyHoBRqPGUUnZoRGmVZSntxele9WZ5ZmENr
	 hI/rxSJ70nZYnjYjHBi6wwJnIp28CXooJzyRuemM3QgGdGlpeurgNGeh33em0HBL7kSZ2
	 yTGtMhguD+R0q1CDMQrxsLAMx8Dov3sxXP0fmRCcNoaTqIxzrprIkKmUHvMg7jZkBbPKK
	 wUwhtIKUkSeX+sQfCnkg9ervE+v6+4Nk5I8KkpHHg4XPi5eIF8cVc2YBplRI5oHoJ5qhX
	 A88zOB8Fry9/OGgkKg+Nef9Ac9axItpInZJAxIsJMo1j5UUfHMtDy3JzZYsBvYTBorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505687;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dJGiQetIHbX3as0TuDaMvVbVCAeT6MoF+8H6BEDLMFQ=;
	b=4hCtX5r31DEuf2i1Cyw3lLAfpm8j6IT5EL67v2R8bLVjq08tYkr+WwJnxcoIOW/R5Fo6
	 80AFSFWo5G5K14Is4JVkStwsV3WSxN9QIvZuaDe0Q5oHbD4t7yCg7TnXxZWI+wGHy9X0G
	 Ce0reI14MZu5c0Y2OLl0p+IlcH9DAkMOU1jNRQhYZGIcJgauAJvuWuojmh3D8/sUYrgQM
	 bgLDFd+3voRIx7H+ARLF/PFiFfoXPtq7TnrWaUNuqmxa/tHKZuu6MSikSFpMrJh+fpNQM
	 tsTqEW31cg+5sBBtOpHO5y+HX78EUXGIIGIS/TeVCkb/+I7j/+/8uOKvrI9rVra3Lzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anQ8uJbK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4725E606A327
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anQ8uJbK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DCA1F000C4;
	Thu, 12 Nov 2026 17:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794505687;
	bh=dJGiQetIHbX3as0TuDaMvVbVCAeT6MoF+8H6BEDLMFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=anQ8uJbK8rPg585XVLaNrJkPYarEORnUTJwMzHfRUoE9iLw/md2ZNg/Qu7P7KucXS
	 UH3FsxQWthpGXaKvGJRc9x+68SImM5CwX1R08wUgwddecPu6cYOpWwGaJ+vRs2xnyU
	 3d2s1cdRDBV3q+5N+HN3+Ulk4FDerSNlImbKorsF4pFEZo4M72UCP2XPX9ImKSB7DD
	 TcsxksvFkHLXDwKQWWQvAzxA80z+/YDnCGq6zMw0pFCttcLaN3Ul7ZYetDHriS+FZd
	 zMtwh8qy5DVJOg6iUvH+9W1p0gilWBZu5xDTNXIhJK0yM2aMs+EmySqNit+zVQDt08
	 +Rwu0L9ri857g==
Date: Thu, 12 Nov 2026 17:48:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"asrinivasan@oss.tenstorrent.com" <asrinivasan@oss.tenstorrent.com>,
	"chen.wang@linux.dev" <chen.wang@linux.dev>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dlan@kernel.org" <dlan@kernel.org>,
	"fustini@kernel.org" <fustini@kernel.org>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"inochiama@gmail.com" <inochiama@gmail.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"junhui.liu@pigmoral.tech" <junhui.liu@pigmoral.tech>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"mpe@kernel.org" <mpe@kernel.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Message-ID: <20261112-nutty-sculpture-79ef0610ab4f@spud>
References: <20261111-paralyze-ellipse-dfc194dbe39f@spud>
 <1605ed3f-8078-4ea6-a3a5-b4a3227c0961@htecgroup.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmXmMzYYtSgWjbEt"
Content-Disposition: inline
In-Reply-To: <1605ed3f-8078-4ea6-a3a5-b4a3227c0961@htecgroup.com>

--zmXmMzYYtSgWjbEt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 03:44:24PM +0000, Aleksa Paunovic wrote:

> >>> MIPS has it, as per their patch[2]:
> >>>
> >>>  - gf,mips-p8700-aclint-mtimer
> >>>
> >>> Note that MIPS have mips,p8700-aclint-mtimer in opensbi.
> > /sigh. Aleksa, can we sort this out please as part of whatever revision
> > is made to the mtimer patch in your series?
> Right. I was hoping to address this in a separate OpenSBI series
> by extending the corresponding drivers with the new gf,p8700-* compatible=
s,
> without touching the mips,p8700 ones that are currently in use. Does that=
 work?=A0

Pretty sure that Rob said not to add the "gf,mips" compatibles for
things that had "mips," ones already and I would put this in that
category.

--zmXmMzYYtSgWjbEt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavX7zQAKCRB4tDGHoIJi
0nbAAP9WAex5D/k3nhtu5yovuBxVX6b+28SKurpmeRZBcoJL/wEAwnhPWFVHHAF7
IFlKj4079gOnDxMitVEtHvPcOupclQk=
=E7RY
-----END PGP SIGNATURE-----

--zmXmMzYYtSgWjbEt--
