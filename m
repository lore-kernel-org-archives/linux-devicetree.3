Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9266633BBB1;
	Tue,  7 Apr 2026 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579477; cv=none; b=aaqYCRxVFvYr6h0ApB3A4kkkRSFrWtEpnreqd4/4CyxG8UaBRzpcAbevcjmpIjYlIpL45qBhxBnX/EN1WKin2dmU4rs5hXWujMToIgjnz5PifoIh4CZdsCEYovAFpOeEjhp1jX1+yfqHwjRSG1jnNW9fhl0k2cbJ3fMrAb8qo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579477; c=relaxed/simple;
	bh=G2MiPboFG46RndYOGANWaYMGw9V2r1sIVseGNfWf7K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7oFtr+3Bj0q+pamwome26kZP55zn9Poto+JEmPAbfgO0xaDt9zUrdjXHB9Vjjllhc6CsSPxdcSYrLKbL26bG4WMz7OS/MNxO3N2iEdxc+nsnWB2dsUUzjjE9mqvzRbBpfz4tvsp87nahrkqOYGwkPAV8W+PRgJIpCRXw334prE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k431tsz3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k431tsz3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC821C116C6;
	Tue,  7 Apr 2026 16:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775579477;
	bh=G2MiPboFG46RndYOGANWaYMGw9V2r1sIVseGNfWf7K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k431tsz3kY0MZ2I8gQAXrhxLGDcuwVqRCjo69LTQxtbKr4sp0EBiD3lmKe2yAorif
	 1UvUSvba3pfX9xf4McPDbK5Bnr0QFL0r7EumXNWtERJPbhYcMldZ91McbkugyqCmII
	 RD9uyMzGQHvxSsYZWUWQCQBSNSZhCNdotG4+TAJ5J5Fp7P+jgX1iZRAflFdJ39Fe42
	 jiRNDIzFRIsY289+kvB4vOdirbJ5m/wmp0exOasV8y4QqBakrLvfcLB48SeZeAjTFp
	 ALDGAPQIyu2MF+/0Aupe60NeayHQcLrqZ034iljzVmcqNSPKCpFGRhG8nrlTgevz/8
	 xG7VnKsCqg4/g==
Date: Tue, 7 Apr 2026 17:31:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>, Guo Ren <guoren@kernel.org>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit
 address
Message-ID: <20260407-shine-distrust-0546884c2535@spud>
References: <20260406232655.144043-1-inochiama@gmail.com>
 <20260406232655.144043-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kL4vNa0dNHftN6QI"
Content-Disposition: inline
In-Reply-To: <20260406232655.144043-3-inochiama@gmail.com>


--kL4vNa0dNHftN6QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 07:26:55AM +0800, Inochi Amaoto wrote:
> Previous the CPU unit address cpu of sg2042 use decimal, it is
> not following the general convention for unit addresses of the
> OF. Convent the unit address to hex to resolve this problem.
>=20
> The introduces a small ABI break for the CPU id, but it should
> affect nothing since there is no direct full-path reference to
> these CPU nodes.

I don't think node names are abi anyway.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kL4vNa0dNHftN6QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUxTwAKCRB4tDGHoIJi
0mnXAP4p4InN8dLHh+QucYIvwi/E45p5xHJJmMUsXLdUAW647wD/Uclt3M0D4j9S
6kGsoO6Dy+s6jyv7qUmuspi85sTUPQk=
=hnz/
-----END PGP SIGNATURE-----

--kL4vNa0dNHftN6QI--
