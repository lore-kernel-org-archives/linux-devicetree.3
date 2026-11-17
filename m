Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920877;
	b=mZSMIm7KyhWGJ0E3wR4jHy5zTWwFegjoos6ztq9OSjtPldgJx7WtNOJFfWq+BrpLYgKA
	 /0QppZRZszH7FHl2Hm/gnKwSW9xTdM/4vR1ThQEF2/CcyW3iudEti8naYTs9zW9dxrFxd
	 dRkqeNL8E4E4JBBoPS4v4LGhFJbK5vYJwyDl8+aYTiHWFDHJY+sze7jkD+geMA9zx27Th
	 pYOI8LdQx3CFU5TLyKW1VvhCo5C+MWEqifIizaaPQ9mvUZ7WLMm99TB4bDk/JUeVlCY1W
	 CCVivdzkK71A7vqF8XxdQEYI7e76Z9weUjifFjA4BU1ZHH34nIOA1trnNfsqYwlcGDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920877;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hLVYgScUX8HYdLVF2WVw1ZHAnwSTjR7HdEjiqI87gHo=;
	b=JLOwwNOZ/xRa8cOUgpq5Z3s/vCyeNeRJ8A08ccQhv/3JKf5kmOA3FiOEAmVJMky3peqY
	 uLHhhKK6bnhh7tR2rAzLtOJrxuqt5/QpNaMY/EfeBGwjiovfbmTFjMIhEF+fpS9bAY426
	 xpP/3tuE3EodtjluXxDJFuceTX4RVax23ngTiqWlKusDMJuhXjSGPYUPbNRv+ruOx+LDg
	 NJWk5vX2gM9McaSsQsJaQUCPd6NtJc1f9OZucdLt0HPoNky/Faz/SCt/K2JPVkqVRVC/u
	 j8xpL/RVrlHVm0CoM+P/xZ/Iv0sMFtqy1rQZa0qeluqzR4ka1AbaPvLDYje41NjvpUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ErLxCPhF;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E6C606A883
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E6C606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ErLxCPhF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hLVY
	gScUX8HYdLVF2WVw1ZHAnwSTjR7HdEjiqI87gHo=; b=ErLxCPhFIJdgX8xgJ3aZ
	54XXiMvtBy/AHNFoY3ZG0KFftEiqaHa99lKVyv1pb5an9MI0/ZNC5qbmuCi21edg
	Uno/4M5J3dIN1ioXh5GhD2XD2BerSlwlAagehujTyyCYC6n8B2ua1ZiWERSDU6b1
	eErm6rFFnFbV4GgNBn6jRBFC7Fl7KLOOEfEO2w8EM/LNQiELNv9LbBHkykGXu0QU
	7dg1Inkw+PJ8DUQwQdFcj/lIscMCv/qiLSzx3M5JSgcn/0X9dd2JoGSWz8rr2jt+
	nnQZkZRt9o/UcM10m1lDTdGnWROCz8bAZZHQuPJDRcVwdbHEyW2sN6ifhGQVFf02
	CQ==
Received: (qmail 250239 invoked from network); 17 Nov 2026 14:07:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Nov 2026 14:07:45 +0100
X-UD-Smtp-Session: l3s3148p1@A8yWlHhg3IQujntI
Date: Tue, 17 Nov 2026 14:07:45 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Message-ID: <avxRnV7rn62YQMwo@ninjato>
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-2-84c76c6d7595@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="MOMQyM849DXDxoR2"
Content-Disposition: inline
In-Reply-To: <20261019-paul-v7-3-rc1-edac-v7-2-84c76c6d7595@bootlin.com>

--MOMQyM849DXDxoR2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 04:43:26PM +0200, Paul Louvel wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>=20
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I enabled this on my board and found sensible results (according to my
limited knowledge about this subsystem), e.g.:

root@RZN1D-EB Board:~# cat /sys/bus/edac/devices/mc/mc0/rank0/dimm_*
0
x16
SECDED
Channel#0_DIMM#0
csrow 0 channel 0=20
Unbuffered-DDR3
0


--MOMQyM849DXDxoR2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr8UZ0ACgkQFA3kzBSg
KbaxfA//WvqDsbOvPH+AB1dURPsu7ZjR+BMQ9u/UklQn0JXVkj+BEm3tFMjbLbK0
YKMNeyoflPgVYExD4vtJhNzdsJ2UvwZCaXHduQdGDSBRpXBjq2yj56dCJIloHD8u
Glrq+WF27oPwFynxH37Du9Fiu/l7H6zqtkADJvMLKa/6p0zDMbdwfdhlka9eLVhx
FHoraLAbsgJhjwR1/J7xhVk+w0/uWV73fDPP9udFtzzPnoB16pX+NLaTPkCfjfKv
FMOCfg7wVBE4HodMYofy/M93inO0EKwzEYju3Y8d8jYo/nCduJRvQW57nfexwBAo
nSWPlOTrCdIUcnC+bxeXcytoN4LcNbRONlFMy5xzPaxgL3OZDyVk/FXlk/xjw6hh
h0gcsBNrlLIXHYbP59FvP+jWibBApAaO8dJT75nV8ErKjuea4uVngNOdq/hJmMzL
wbUodkoRYngqZ+OAFEKlL3v/JxMNVP4wEn5RPxwT+lCQGbNh+0ntcVvC8QmB/W6/
ied+mpYDDTAGRRYZb8p+Rt9aVbj6pZG7G7HqECPuePk6djOe+fq04Qtll9YVtFEC
3ma6YAUDZ0wYMPfMnMk+DoHv2l5oFaR7e+HNJvnk8s3WT77HYriJPC9d8Rdobk1r
3w443XxzzqioNMr9/YNOCKMSyIlf7/TkPfX0+yopsvcS7FUnQf8=
=H9YQ
-----END PGP SIGNATURE-----

--MOMQyM849DXDxoR2--
