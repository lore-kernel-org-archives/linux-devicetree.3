Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E5C3D8101
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769048; cv=none; b=BwTogJdAxsZGZ9FrhbsrDsIxozgZD3MXFuGD+5wtau3fLiddXFhg6KbLaBiQzFhUp8Rxce5LvtLiVo+AlCUQ3pEnC9C7IBvZL55/MWg+lmby94yWJ+VaSfN0JEfoZ8SQn+zsl6sC2wA8ils+xTa+pGe66a1YD19pHhBmHoJIGnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769048; c=relaxed/simple;
	bh=XZKP1GpSk/ASVDK2/D8yHSdHODwNLy6NGoNHmeayd9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ljDHLxZ0fycJqgj+6gtRoc3x6jbfxgQSWBPvtPGbQCgVi54ZCwpKQsn1YEmL1YlHaV25ww0/QVSmPEvyiofA5UpDZJNosZWWbs/jgg2wiLWJPqcTv4teicUZejwjatW8H+PqXInxXfkwTwh3q5qQqVT639w8JYzUrALqroaZloE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZ4thko2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ4thko2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D54F1F000E9;
	Thu, 18 Jun 2026 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769044;
	bh=Oo2s2QWwMk5YgZACPm8iQZdazusZ28dHH8AnE8wdqi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fZ4thko2CcJrFKrF+/Ayz5MgL9V+2vu6UUG/3o8I6X8nqbXbOPdHBgrIcC6TaUz33
	 CON8OhYX587HN9OM8BLseeI943RNMBSBOMjqa85jj05T5c8KqH2gCIMz2oGWtTj7R+
	 sfwoSABOge+FRcIQN901vwpZMZCvFHDpRg3Ll39cjZWET1InWZjVoNVwhQwbE9i3SK
	 80NhZwvEwh1SLVulgEBNg/L+LCOxQQwRZPjOi2AlTJF4eumZrDJxv45euNyN9Lkrae
	 iBUHhupC8NY6RUwGEiriZSUs2sSHMRBd1plmA/JcGpFvekkEVt7jq7WJ1Z5BmmXXcH
	 yAsHt8DaXO+IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/16] spi: dt-bindings: add
 spi-phy-pattern-partition property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618073725.84733-3-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-3-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:50:44 +0000
Message-Id: <20260618075044.7D54F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unnecessary `#address-cells` and `#size-cells` properties in the `f=
lash@0` node will cause `dtc` warnings and violate the MTD schema.
--

commit 7871aada614c3c1ea1780c6f6248e24acac0f319
Author: Santhosh Kumar K <s-k6@ti.com>

spi: dt-bindings: add spi-phy-pattern-partition property

This commit introduces the spi-phy-pattern-partition property to the SPI fl=
ash
sub-node to allow referencing a specific partition containing a PHY tuning
pattern. This is used when devices like SPI NOR cannot load the pattern
dynamically.

> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/D=
ocumentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -204,10 +204,29 @@ examples:
>          flash@0 {
>              compatible =3D "jedec,spi-nor";
>              reg =3D <0x0>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;

[Severity: Low]
Will adding these cell properties to the flash@0 node trigger an
avoid_unnecessary_addr_size warning during dt_binding_check?

Since the newly added partitions child node does not use a unit address,
these properties do not appear to be necessary on the flash node itself.

Does this also conflict with the MTD schema, which deprecates these propert=
ies
at the MTD flash node level in favor of placing them strictly inside the
partitions container?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D2
