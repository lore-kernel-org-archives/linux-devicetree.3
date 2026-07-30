Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C04334D1
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417482; cv=none; b=t1LK43gjL/c4B2tk2OPZjM39MB/r3GqkkIGxZEYndLp47hB+wlnbeAl0JaiNhJ5kOk8D2BAYLUqgXlQvdYQylD0hNOWanpMk3/xAfiR1Ue8plI9YoHAzrM7ldv9obofeM5OvuVhPg6xzDaOn3KshCQjjeXbfiazZPFTkYySxa7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417482; c=relaxed/simple;
	bh=k2zXNYIHXnXOjXX5e8TiuXtH5QsNcilr0xItEcEMYGM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AXdiLnwKnWA/QlXs0UosQMqdBoVO+v9BS+yaTMAr6E3CtSkNEHcABcJhJ6F8li/tjQ1FeaSCpjstpenTnB0BgGQCo31XQtA/rMYSawCXrf0rvniLu6pFJkW+NnbuYSEadM6FfkE2d2SDvIfbtKdVB2DdbI87aMqcijz0FWpGkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVs+TL0T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVs+TL0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA101F00A3E;
	Thu, 30 Jul 2026 13:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785417471;
	bh=BWQB/wS3kB9i2tGDyR0g7fLrPYfr0PC5wRoUQHbfQbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PVs+TL0TO2derf0rV5qOc6G9pvWgi7/GMS4YYEo8SmbbpI0jV7x6BsDsM9kP7PL2S
	 nGyIGSJfNVkK3PJtk119UQ07kb9fip8u40OQFGtrJ9sAwJ1L6mfJsRuKI2+fF8YDsM
	 CkklKjtozzLN/Yzhye24vO0mRyAOXs5q4WPMsmFFhkdP75wukEmwNpAkXngFny6Ncu
	 8G4VRRKBC8zzjbNqKklNu6U4Gb78bSJ0B/ii5PVBTMDp8Ig8IAAjN7AzhTFwPeRsBk
	 O+w5glCpoT8sC0CMqnPp4Dm0sE3KO85vSPjbk4QXM/5J6Drx77hcD519hh6W2JOTqo
	 75TVnlzQkf/3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: sanmiguel: Remove HSC nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-upstream-sanmiguel-remove-hsc-nodes-v1-1-f0308eb8a00c@gmail.com>
References: <20260730-upstream-sanmiguel-remove-hsc-nodes-v1-1-f0308eb8a00c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:17:51 +0000
Message-Id: <20260730131751.7FA101F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing actual hardware from the Device Tree to bypass kernel p=
robing for userspace preference violates DT principles.
--

--- Patch [1]: [PATCH] ARM: dts: aspeed: sanmiguel: Remove HSC nodes ---
commit 4baedd7709172e87dfefc81a46cefd1b968b6e6a
Author: Potin Lai <potin.lai.pt@gmail.com>

ARM: dts: aspeed: sanmiguel: Remove HSC nodes

This commit removes Hot-Swap Controller power monitor nodes from the device
tree. The commit message states this is done to prevent automatic kernel
probing and allow userspace to handle the device instantiation.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> index 3cc6e772cc8c4..98f224d2c091f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> @@ -442,50 +442,6 @@ &i2c8 {
>  &i2c9 {
>  	status =3D "okay";
> =20
> -	pdb_mps_hsc1: power-monitor@10 {
> -		compatible =3D "mps,mp5926";
> -		reg =3D <0x10>;
> -	};

[Severity: Medium]
Does removing these nodes to accommodate userspace policy conflict with the
principle that the device tree should be an OS-agnostic description of the
physical hardware?

Since the device tree is meant to describe the physical hardware rather than
dictate software configuration, removing physically present devices to prev=
ent
kernel probing is typically avoided. If these components are on hot-pluggab=
le
boards or are conditionally populated, would it be more appropriate to use
device tree overlays, or to mark the nodes with status =3D "disabled" inste=
ad
of deleting the hardware description outright?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-upstream-s=
anmiguel-remove-hsc-nodes-v1-1-f0308eb8a00c@gmail.com?part=3D1
