Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037096;
	b=R6qXesjTy/to1D8bKxMw3Hi+8dJuI8DW1X/So6pDd7FFXHsBGCTrZXqrO5irYtSA8NKf
	 /SIU9OB/aGnhUBkjPo4WXWBZhFVkredJo4c6R+0WLC5tWyBm3bvrYyTyrRQocbRd4jgcq
	 vwuFAk4elhrMiRG1ulC3Ficf1YSOUIxeWnhYB+epZ+j1f6dVwHdpw9T6thg+zMIOHh5JF
	 BOAvTq2WoRYQofZ02N+/ca5/E5ouC2WIa+bIGuz442n6ozZgDaiLQ4Ai52VClkmunR+MZ
	 wL20sty1xELevMcP//U0uzYoZEu5nnNTUbiu/+FhJbcHGBkXZa3RX0HoQmubWzzQKyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037096;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HgEH5cLrinHq9eSROFAW3XpxSzq5TUujP250dxuo8uo=;
	b=NG3/TIc1XXCohVy6bYcQCSeFzsLLzVbwHDW+ZzQaNWQCHlB2cNTJCKp4GihH4iXewK2w
	 5kXj8SlE8WNjW+tIt3IRytsFg+Y5HV22n2BMHX1kQgBxxnlO5CpvQX5T+RxOGkjKcQHY6
	 luxuZPzB+Dqp1MwtQvQbE3eGSooEq8vNjvXxIB8k7d4Vr6MpM7GGp/nrADpQPPWQWVjnZ
	 TssH34QVoBNu/tq3kd6fKT7xA6988hBhF044To1DvkKIUVQkjX4D0ACMHlvq0pTpKdo2W
	 Z0R502uES1UbD2dX1FeGVMme98Is8gIVqHbxN4ywbyygJNinERGRpesIE/x347QVGiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJvy2Jum;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D528A606A330;
	Wed, 18 Nov 2026 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJvy2Jum
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CADF1F000C5;
	Wed, 18 Nov 2026 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795037096;
	bh=HgEH5cLrinHq9eSROFAW3XpxSzq5TUujP250dxuo8uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AJvy2Jumdmfk9Z2YWPaQm8LglDiyY/Dj8MkUU8VGJJfVX3ZPHwDf2TTSZws0TlkNw
	 xhSZnxH16nOw8TvstdnSfzIkl+5fm2IxLf/Zy9Z40mTkoqxWuT4wF9S+e77WGRXAcg
	 XmOSnCjT4BdfDGwyQc8EHBSc7AlzjFSf18Cz5z+s53Zvh0h8o0KX/24GkcnuzerEkq
	 /YtmtUlj8FhsVqPf03i94x7C+xMufhPGR5d4wZmWToHX8qBjlq2//sf643zCQ1WJa/
	 4UA+T5MKrSjuGzkW17MNi0Yb1tJo13zGVLzSLQY3z9wAJuQU/APlbqRSkj0I8JdF3N
	 nzFqN+nUeQtwg==
Date: Wed, 18 Nov 2026 13:24:55 -0800
From: Drew Fustini <fustini@kernel.org>
To: Kanak Shilledar <Kanak.Shilledar@axis.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"wefu@redhat.com" <wefu@redhat.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] riscv: dts: thead: Cleanup with dt-check-style
Message-ID: <av4Xp-apSyZxSgb8@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <55208f641473e0714e4509fd5d071343b3a0de98.camel@axis.com>
 <auPzj_N44iXtrR_3@thelio>
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
	protocol="application/pgp-signature"; boundary="UAw8jnEInJTNEJJi"
Content-Disposition: inline
In-Reply-To: <auPzj_N44iXtrR_3@thelio>


--UAw8jnEInJTNEJJi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 06:31:59PM -0700, Drew Fustini wrote:
> On Mon, Oct 26, 2026 at 01:02:22PM +0000, Kanak Shilledar wrote:
> > On Fri, 2026-10-02 at 15:43 +0200, Kanak Shilledar wrote:
> > > Fix almost all warnings thrown by dt-check-style after krzk's updates
> > > to the tool [1] when run under the strict mode. There are still a few
> > > warnings remaining which are documented in the relevant commit
> > > message.
> > > By doing this the files become easier to read and maintain.
> > >=20
> > > After this patch series only the following warnings are thrown:
> > >=20
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:221: [child-name-
> > > order] child node 'oscillator' out of name order
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:227: [child-name-
> > > order] child node '32k-oscillator' out of name order
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:248: [property-name]
> > > property name "snps,wr_osr_lmt" is using discouraged style
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:249: [property-name]
> > > property name "snps,rd_osr_lmt" is using discouraged style
> > > 	arch/riscv/boot/dts/thead/th1520.dtsi:253: [child-name-
> > > order] child node 'aon' out of name order
> > >=20
> > > These are left for future work as they create a very large diff.
> > >=20
> > > [1]
> > > https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines
> > >=20
> > > Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> > > ---
> >=20
> > Friendly ping :)
>=20
> Thanks for submitting this series and sorry for the delay. I will apply
> these to thead-dt-for-next once 7.4-rc1 is released.
>=20
> Drew

I have applied all 4 patches to thead-dt-for-next:

  [1/4] riscv: dts: thead: beaglev-ahead: Cleanup with dt-check-style
        https://git.kernel.org/fustini/c/27da5ff6ffb2
  [2/4] riscv: dts: thead: th1520: Cleanup with dt-check-style
        https://git.kernel.org/fustini/c/eda5b545ffd3
  [3/4] riscv: dts: thead: th1520-lichee-module-4a: Cleanup with dt-check-s=
tyle
        https://git.kernel.org/fustini/c/0cfb7b8f5073
  [4/4] riscv: dts: thead: th1520-lichee-pi-4a: Cleanup with dt-check-style
        https://git.kernel.org/fustini/c/5b1f375d891a

Thanks,
Drew

--UAw8jnEInJTNEJJi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCav4XlAAKCRDb7CzD2Six
DLNqAP0evKW2cYpDjM5kWGd/p29FC08eDapYN8/RIJfRxhqvlAEA7zVEtHenGSaY
+U+1z7GHgLr+6iXCQvG1iLEGnnoHBgE=
=ivEq
-----END PGP SIGNATURE-----

--UAw8jnEInJTNEJJi--
