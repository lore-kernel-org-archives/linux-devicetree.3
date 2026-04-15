Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB73382CB
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776255178; cv=none; b=MJ9FtTOsI9FMhXBwDnmUysKbsyzVHwZt1/oYVeyJP2gPE56IZyVE0lObkIRBx9ehnrplMEdnO+VYCe9Or5OwYcOA89hZEPLf+F+CAFAG8WAyyEMfR0pNtR82F270ruHewGVz91fnA24ME49ms+xvLL5t3f/BDm3qdavUxqsYuHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776255178; c=relaxed/simple;
	bh=aBfzyu2TGg94jDcHyA7UEDezz7c2+m1UW527MciqLkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZYOoGfbwRIh3m2vGpfd0YZg8v4QFCDny3KK2Q4AF4YD99xsAkeyY5RInvD2kwcz63k5ZP2rn3JYmuDGm8cjAHZvL7WDBDIKgx4XMWUOtHfzvl53te03/c1ODqP9LbxS/mj4Bedqfzf8qWw63c9nTJ0+6mVS0SBQ4Wjz/pYZhQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifJIeiZn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifJIeiZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECA2C19424;
	Wed, 15 Apr 2026 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776255178;
	bh=aBfzyu2TGg94jDcHyA7UEDezz7c2+m1UW527MciqLkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifJIeiZnhCaVmaSWobmLdMqbdMACSYdM6EqNqCvgYs9brjTkG2Vznr3RSYD38so1u
	 IxcFt+gx61/NYZWbi+dYOhSTFgT0y5GuAvVzI4d1PNyBIiNoiQc1vcAQnHIZeU7Ff+
	 ByKcsgPr1L22Gh60pJzkec+ZJllaUuwVYXbxQQDsPy8wkyUBo8O2HcdzhWiTfDaiXA
	 f7MuZ5ApFMFBrLmJESYteB9vPPzB76nJPKTRswF2cZv9cIOXkyC94phwVje5qcglS/
	 Tjau0+8P4OEFG0t8OA+2ffoZBhFsTMqhShzOGyf2V72koe77G0b5WWvOQCT7EVWvgv
	 pn9SD7YG1hDfw==
Date: Wed, 15 Apr 2026 14:12:55 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Enable spi nand
 controller for EN7581 EVB
Message-ID: <ad-Ax97ny5gg-yjz@lore-desk>
References: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org>
 <abBPufvrG8I8UP69@lore-desk>
 <CA+_ehUyfP7bohsSZEbjp-KLxD084NcR+2SmhDNrpoKQE=BiHcQ@mail.gmail.com>
 <ab5bab39-88be-4f58-aee6-2bb0dc49a732@genexis.eu>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8vPczH/oiUxX08+n"
Content-Disposition: inline
In-Reply-To: <ab5bab39-88be-4f58-aee6-2bb0dc49a732@genexis.eu>


--8vPczH/oiUxX08+n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> On 4/15/26 11:47, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 10 mar 2026 alle ore 18:07 Lorenzo Bianconi
> > <lorenzo@kernel.org> ha scritto:
> > > > Enable spi controller used for snand memory device for EN7581 evalu=
ation
> > > > board.
> > > >=20
> > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > Hi all,
> > >=20
> > > it seems this patch has been reviewed by AngeloGioacchino, but it has=
 never
> > > been applied to linux-mediatek tree (or at least I can't find it). It=
 is marked
> > > as 'New, archived' in patchwork [0]. Am I missing something?
> > >=20
> > > Regards,
> > > Lorenzo
> > >=20
> > > [0] https://patchwork.kernel.org/project/linux-mediatek/patch/2025022=
5-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/
> > >=20
> > Hi,
> >=20
> > friendly ping here. There are lots of patch with review tag and ACK
> > also for 7583.
> >=20
> > Any chance someone can ping maintainers that take care of picking these=
 patch?
> > Or someone that can reply on how to handle this? Maybe we need to sync =
with
> > them? Lorenzo (and also me) are fully maintaining the Airoha ARM target=
 also on
> > U-Boot. Also on OpenWrt this target is starting to get traction and is
> > getting used
> > there, so Airoha is not considered an abandoned target anymore.
>=20
> I think the following Airoha patch set has not been picked up either:
>=20
> [PATCH RESEND v3 0/2] ARM: dts: airoha: en7523: update dts
>=20
> MvH
>=20
> Benjamin Larsson
>=20

ack. Thx Ben for pointing this out.
It is not clear to me if these patches should go via linux-mediatek tree.
@AngeloGioacchino @Matthias: any input about it?

Regards,
Lorenzo

--8vPczH/oiUxX08+n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCad+AxwAKCRA6cBh0uS2t
rDQuAQCnScvp/PlYWDJUXaQxTJ0+x4isrD9cGiuLlUR6FLCOLgD9EGIOIf01gaxB
5BbOzMFMcHGr+2KmLZKbLvT2Ket6KwY=
=0i3n
-----END PGP SIGNATURE-----

--8vPczH/oiUxX08+n--
