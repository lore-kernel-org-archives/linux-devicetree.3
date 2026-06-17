Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EFA3403E7
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781718489; cv=none; b=au38Py1wiFO5+OI6elNPI04rREqCfB2TafYWrwno/wMXixsKWFxLTcCtjtwLntmmyndJXoilk+9QrnW4koWn8vcAVnpVlZ6Iuqp9Fi7VHBNu9Z+ciLv3ug7DQmA/vQQv3lXVspjuIbBzmELBuBlZmfp6C9WhFigfdRoEuw6GeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781718489; c=relaxed/simple;
	bh=BJu5zuBd984ABXNyYHw+39Dq7EX9ehyIzLRGUbQvlIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8OsFDKchhdgiUBTLFMsaM5g2QTOkNeLM87hq/moSxN8TfSz6mCGPlMfenZhTK0R03QSbD7PUVYIiW9itvs1BYUFFmYgrHEM47izzoWZcC+y1STL6Ec2ATgHLLzYsIMvsD00mgm+h1K+8Yg8Bcgh3iomo+srpi8wlMcGxw9uvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce8BgISO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce8BgISO"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4602e2a0372so71755f8f.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781718486; x=1782323286; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR64uMa2bAG9g6xt9cb3u96jXreT/Fybs92ONnyRO6s=;
        b=ce8BgISO2hLPgURzL3RtgTefC72BDnZ4Vyu2da6ec+cvOSgartIgVjZY5KjyoxsxOd
         CL8nZsXrObMyNpkfnQEaXlHAX6x4RZ15TnCRWWCmSoHvSybjAAu+rr/KLeI4F3wDL/td
         lI46nATHr0nLdkdKjEszknVcQVzkw5vxo/L9hlyiMbQVP/XEmXdseEL+GgTpD4b/5cE3
         3HS4FxPgGncvX/N8kbNBFtCWKl4RHqJi3pSXDBXj4eLhele7BG/8xq+Y3sZy9gndiOTg
         bb2NFbfOA625oZLhgAKsi3O6DOJsbvLWtAgIDanUk8D2tRPgiH/2AsHFS+VV7aR4vEB/
         sk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781718486; x=1782323286;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZR64uMa2bAG9g6xt9cb3u96jXreT/Fybs92ONnyRO6s=;
        b=nyCIqZJmDv5Xq8Lrgk1y3PpvzEVvWceDcDKem8ij76xbf6r3C+3b6Nx0iHoFNhIKeH
         15AFnMl+ySzlSOR4dPz9C439Y0aF11jCgCr51G0KaoaDsJU6VcJ9Qhi8XYipVPV7e8f+
         PwP9KXElR4pOLtLS3QXzu49Y2T0Tx3qUK+w5NtSAZ66Hz0X9gqizDOTPs9qOC8hFR1Dx
         sXqY5YpKdRDPeTMcsPufpA7Xpxkudz0v/A6AaQzBehtWuI44UsCbqRkyhmlylEaZUY5P
         h97tjuAz60QyDRecNoAb5e4IvA4cT0gqxPBA9mSyTtVXj1jICdHaC7/TrLl6Hhr5JffT
         T/Jg==
X-Forwarded-Encrypted: i=1; AFNElJ9nxoxhhThl9gx0USIULjiLdK9Nta0U5Kc5x/qPaWYODqhxhCvaNdOcjagyinReEUzx+dKJkEH9lrdR@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZWThBhV9cEElHi1jlz4RiMyinI9ekP9nTVB3mCKUaZheTfDJ
	/ZkI+DThztbipkTE3rHMaDOx8qHXc7ve/k6R9ms7ifXOAVXPnFjNQRZ7
X-Gm-Gg: AfdE7cmaLsOBspTSGy+nUk0TVZFiLBglRECDcUxyGOIVMRBRKAX3jsfurUvsC6ApxH7
	j0XnECHZRGPLO/PWbswyUw16YxC9DZM9uRxUJ4JMTIqAo/XKPIVLusNE5FAMbNVJgWg+lRJXfbK
	j0PcT4uRb7xsBRDXWu0i6zGwSkpJDGobKi4eriGUm3pyws1WfxfwjnSo3pEPLenNMoEWS5umPwu
	kxgqwKr8AssXczBAcqM4VFL7BHkTAMIjEJAuNLo3eACPpCM7nD7OQOgKs/63/V+8sqZWkW/O8U1
	NQTA5V5+dg1LxO9dhB7QunVKqnPfEnd8FaEZfRAGludVviqvHxoe/ladRARQ0q8oeHwhqSTaHMW
	6K/hw1zrWsHMD32ZY94kl6tuWeyAmRwxDbCX6Hycp348rp+9dRIuP+WQYWwEjEFsaThXZMB2TZP
	nhK3sQUwPBR9hfpHIKh8eragI5mg==
X-Received: by 2002:a05:6000:1789:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-46240cf95d5mr8421507f8f.23.1781718485787;
        Wed, 17 Jun 2026 10:48:05 -0700 (PDT)
Received: from strix.localnet ([197.250.227.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm57712415f8f.8.2026.06.17.10.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:48:04 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock and
 reset bindings
Date: Wed, 17 Jun 2026 20:47:53 +0300
Message-ID: <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
In-Reply-To: <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
References:
 <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
 <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartJBti3yevQCyGA81fgJgUkw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartJBti3yevQCyGA81fgJgUkw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Wed, 17 Jun 2026 20:47:53 +0300
Message-ID: <-l2OM6P0RNSYRQfOSObOyw@gmail.com>
In-Reply-To: <20260617-tabasco-pulsate-454ed3f8f0b6@spud>
MIME-Version: 1.0

Am Mittwoch, 17. Juni 2026, 19:08:02 Ostafrikanische Zeit schrieb Conor=20
Dooley:
> On Tue, Jun 16, 2026 at 11:26:21PM +0300, Stefan D=C3=B6singer wrote:

> > +F:	Documentation/devicetree/zte,zx297520v3-*
>=20
> Sashiko complaint here looks valid.

Yes, it is valid.

It also brought up another concern in patch 12 that has an impact on this=20
binding:

Am Dienstag, 16. Juni 2026, 23:42:19 Ostafrikanische Zeit schrieb sashiko-
bot@kernel.org:
> issue(s) to consider: - [Low] The `syscon-reboot` node is incorrectly
> defined at the root level using the explicitly deprecated `regmap`
> property. --

And indeed "regmap" is deprecated and I missed it somehow. As far as I=20
understand, to put syscon-reboot as a child of the clock, I need to add the=
=20
simple-mfd .compatible:

Either

topclk: clock-controller@13b000 {
	compatible =3D "zte,zx297520v3-topclk", "syscon", "simple-mfd";
	reg =3D <0x0013b000 0x400>;
	...
	syscon-reboot {
		compatible =3D "syscon-reboot";
		regmap =3D <&topclk>;
		offset =3D <0x0>;
		mask =3D <0x1>;
	};
};

=2D-- or ---

something@13b000 {
	compatible =3D "zte,zx297520v3-topcrm", "syscon", "simple-mfd";
	reg =3D <0x0013b000 0x400>;
	ranges;

	topclk: clock-controller@0 {
		compatible =3D "zte,zx297520v3-topclk";
		...
	}

	syscon-reboot {
		compatible =3D "syscon-reboot";
		offset =3D <0x0>;
		mask =3D <0x1>;
	};
};

I see both ways in existing DTS files (e.g. imx6sl.dtsi for the fomer,=20
uniphier-pro4.dtsi for the latter). Is there a preferred way? I have a mild=
=20
preference for the first, as it would keep all 3 clocks in the same way. If=
 I=20
go for the second, the clock driver would have to query its own node and th=
e=20
parent node for the regmap.

AFAIU unrelated to syscon-reboot option 2 would give me the opportunity to=
=20
have separate clock and reset nodes and bindings and skip the aux bus, but=
=20
this would not be a correct representation of how the hardware works.

--nextPartJBti3yevQCyGA81fgJgUkw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoy3ckbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiYhsQAIShhN0EMMLivsL4YTkw
5v1LXpB2e5pyTGJADq4zJ7jpoL5M5U66D/blUzW3M2QmTsbt5PpE2QrKp/mgImGI
TM3prev1qjMzHYov/LErP4wEcvShHPacjc3h2AFslmfJslU4iLOplzaHqxoJ2C4O
SqK8M6h9ggZofVn5f9ykwFu3/3OTWOrQD/vLO4PffYZPFzZn8d4j8gnUxDVio9yY
L9iVGedu8gvqMSCT2RGVeVsKFdXefaJXR7noAWvjyDusgzpiQX0HRYy8zEYcDcl9
sp0vGFq4lKNQlwkR5a1cU71m5HVegyq7E6BqC4zxVSCe7AcV2B/xYu5bRz7+fwi6
WEKdaafl8XvxtchAQyAG8prLZ722Fc1iNzE/Aa9adZBJA8BtxmNj/0Q1DmKT1cEe
0vjDwsN1brxvOuIoadocDxhfcD8CjBmDuUl+P9EPBzrOMicZchr7rlELZ/gTjqy1
fRebnrPsjspoc8LsvXPnuzNvVhxDIS69w7rQd74yu03SsMDzuJsYc39oYAuYWTpk
BcgrjlfMuiPDmGGnHEgUMtJDmzbyy9nfoiZXHpbD+V7KbD0Yv8hLdvjFbGaDDP9z
HOLdkQt4SKBTG4pAGym5UR5ztF2bvTSVAJedmacdn0dhkx7GcPu9hR5fvQMsbgQt
nf+USg3fU6CKa5Ynka2KN3Cx
=mLYQ
-----END PGP SIGNATURE-----

--nextPartJBti3yevQCyGA81fgJgUkw--



