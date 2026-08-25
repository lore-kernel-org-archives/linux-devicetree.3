Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C95342524;
	Tue, 25 Aug 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676128; cv=none; b=pg0RcrVleobtjcalTKNdaD8DnvNWP7zPvgswekGOJ7KhKiNpdVepJ4gZ5Y55NhYjBleEtsk+fC7ZUJeOJuA/NvTB3N7BLDtdf0Y/qK4nze4OYN8ev79UN6At1WJXHHKcx6OA14O0iqcOfcu5Xg33oZXsSaNqFVH0T5+Dr1yYHyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676128; c=relaxed/simple;
	bh=Gi/HElnBsdS4NkjIMmfuwVQ6VMWNE3QDLq68DtQjOeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgOjBhRrA+X2mQ0TisFYQuNwGQNGSKiuzpRtsBJzSKhVWJj6o6Y1M4BxvniT3TL+QrRayaOGxv4vyU9fOwcBlDYkHPlakKpM/SVVujOxyJ7AZC7M1SGiMoQvmVRm2OlYb/lyeAVOruoEcOf+QTAkHe2gjhw9jTbxzTlJGwUoqTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFDi/arR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFDi/arR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565671F000E9;
	Tue, 25 Aug 2026 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676127;
	bh=Gi/HElnBsdS4NkjIMmfuwVQ6VMWNE3QDLq68DtQjOeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kFDi/arRUmL+zG4HLDNVd3mgrwyKszk5g4ekFgVWBdcQ0uBbqBjoQ8N6cseH7utNV
	 6CrhLUC0IIbft60b9+o683/VZwK0ztmLuuK4KtcX0lO1T/fvy602U6hq1P4E3yHSik
	 bgtmaXn8ZDmJoZ97OFx5SCo9fKLcy9iC5xT6zomjmdWoYlB6EXWvP81xtNITedG/BH
	 dru3MICIYR3SUpxf80KdxI7SgvQMLL3iDpkM2e7dETvBTIX0r/GCPiutt0BefytRwe
	 7sW9qxdyTDl947tRcme498hBmJO8iC8GcZ5WXDC+VWkDqxprIPzMSO+G7jMxwOebza
	 Nmj6xbROJKnag==
Date: Tue, 25 Aug 2026 17:42:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi
 extensions
Message-ID: <20260825-mahogany-reminder-e22b34a405ea@spud>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
 <20260818-hunger-module-a44d9716010d@spud>
 <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qsPavORSHUujOhEi"
Content-Disposition: inline
In-Reply-To: <CAHuiULBGKCqxMzO7f-i0VeuN0nykEaDwzVzq1VtT5VK2LM3eTQ@mail.gmail.com>

--qsPavORSHUujOhEi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 06:46:39PM +0530, Mayuresh Chitale wrote:
> On Tue, Aug 18, 2026 at 3:05=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Aug 17, 2026 at 09:32:17PM +0530, Mayuresh Chitale wrote:
> > > Document the RISC-V Performance Event Sampling extensions Sspesa
> > > (Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
> > > Overflow Interrupt) in the ISA extensions binding.
> > >
> > > Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
> > > is present.
> > >
> > > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> >
> > Why is this series RFC?
> It's because the spec is still in draft stage and also the register
> addresses have yet to be assigned.

If you send more RFC revisions, please include this explanation.

Thanks,
Conor.

--qsPavORSHUujOhEi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao3F1gAKCRB4tDGHoIJi
0igmAQC3/jRrzcCF94Y2gLi7rhhdnueft/WH5dLQRWVjjM0OwQD+L8Jw14XJ8EtK
Lo7n/kM+LUOD5qRcDphLiQP8J2jzFgU=
=X1BW
-----END PGP SIGNATURE-----

--qsPavORSHUujOhEi--
