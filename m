Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122633AB496
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432722; cv=none; b=kn9PBxvIWOr7O1zz5I+EPDB09HF4qyaj/vbk7/pr4BcyWFqC2UeQEoObxUzg4MaMl5ARZBWCJ8TYPg+911M6g+sPesgL44+/h/VPCYH4QFdDav46joREvXMhbdCaTTVN2BshNELt5XDI7X3pSRAQT28lqrzcXfljGY3vFGTYWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432722; c=relaxed/simple;
	bh=eFb5eOwbXr6jWfO7MObkxGWPL5If/wsM7suYFIvjVTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giNs2ZE16N6bBfIxR4P8vcI1h+ZicPvIrItAc2nL9NHHbHK94jIVyswYov12ezD0Xf7RUHzWdDG+l2w1vam24iglZzpv/JCI3jkwU7Dm4bnwgH5l4U9MxScDHBwOVKBnGdNxO0Xyy08fqMhp7nnM3bc3kCygCwLqbuJur4lCBls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UataWm6G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UataWm6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B6D1F000E9;
	Thu, 30 Jul 2026 17:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785432720;
	bh=2frrfW3181LKyK3fiozB/GHo+GJ+LYol3EwZKQouEv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UataWm6GTtPTQsvVoPmqNOKpUOtBvT3T3DJU5NuSfpMttJR1catQeq6JRc72X34FF
	 LIV10+6QXqwZKgCkY6I1dvuwnyNtJJsH5yQtH8nKsC5By/4CNi+OmOLkhG6+S8dV9x
	 SkSsobU5IDTzUtLCKkpKexpgQfhvaVwoyTbGaxRAnFUg5p+NwS5la+h2UikIbmSfHA
	 1qkhMgVHrSyDQLzPsksuWRddKydOw7MdNcLTkErac0f7Xr8aWuhMsIYGxyUP5/vC6q
	 ai2e1TIZak7hTPNOIDQV8sypF8iAk4KdpxdqvzCqwRe+6A3IiiQuzhicsw9XfftDXd
	 O+nFIAhIVmITg==
Date: Thu, 30 Jul 2026 18:31:56 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: devicetree@vger.kernel.org, Ilya Sorochan <k0tran@altlinux.org>,
	Conor Dooley <mail@conchuod.ie>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org, heinrich.schuchardt@canonical.com,
	hal.feng@starfivetech.com
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
Message-ID: <20260730-rockslide-depict-5edb03f8efc1@spud>
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
 <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
 <20260729-electable-remake-1b8c94a452b7@spud>
 <b1f10fad-e5ad-40a6-b37b-6e950736c1d2@freeshell.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XGIKtqsdaLV2K/Bw"
Content-Disposition: inline
In-Reply-To: <b1f10fad-e5ad-40a6-b37b-6e950736c1d2@freeshell.de>

--XGIKtqsdaLV2K/Bw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 02:07:07PM -0700, E Shattow wrote:
>=20
> On 7/29/26 03:59, Conor Dooley wrote:
> > On Wed, Jul 29, 2026 at 02:39:50AM -0700, E Shattow wrote:
> >>
> >>
> >> On 7/28/26 11:02, Conor Dooley wrote:
> >>> From: Conor Dooley <mail@conchuod.ie>
> >>>
> >>> On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
> >>>> Add bootph-pre-ram to mmc1_pins clk-pins.
> >>>>
> >>>> U-Boot pruned their overrides recently in favor of Linux which broke=
 booting
> >>>> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
> >>>> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-=
common overrides")
> >>>>
> >>>> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0=
e@canonical.com/
> >>>>
> >>>> [...]
> >>>
> >>> Right, I am going to try this again. I don't think there's actually a
> >>> valid technical argument against it, since it just affects the stage =
at
> >>> which configuration is applied rather than configuration itself.
> >>> If the configuration is wrong, and more devices don't use this config=
uration
> >>> than do, people need to move the node to where they think should be. =
That
> >>> shall be done separately.
> >>>
> >>> I don't want to hear about the politics about whether or not Starfive=
 want
> >>> to support it or reverse engineering of binaries etc. All that I care=
 about
> >>> is discussion of the hardware itself and which boards need this and w=
hich do
> >>> not.
> >>>
> >>> Applied to riscv-dt-fixes, thanks!
> >>>
> >>> [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from S=
D-card.
> >>>       https://git.kernel.org/conor/c/42c57c049054
> >>>
> >>> Thanks,
> >>> Conor.
> >>
> >> Second NAK to this being applied, again, do not apply as-is.
> >>
> >> As you're not interested in the technical discussion, then you won't
> >> have one.
> >=20
> > I am interested in technical discussion of the hardware configuration. =
I'm
> > not interested in reverse engineering of binaries, GPL compliance or
> > whether Starfive want this to work or not because I don't see how they
> > relate to the correctness of the hardware description.
>=20
> The commit message suggesting "...broke booting from sd-card..." is
> missing information or should be clearer i.e. "The bootph-pre-ram
> hint(s) allow that following the SD Boot mode of StarFive loader in
> MaskROM the U-Boot SPL will have all necessary devicetree nodes to
> initialize the MMC driver and continue booting U-Boot Main from SD
> card". It has not to do with booting Linux from SD card, and is for want
> of a more generalized description affecting any SPL that filters on the
> patterns of bootph-* hints but U-Boot seems to be one-of-one the only
> consumer of this that I am aware of.
>=20
> Placement of this bootph-pre-ram hint in jh7110-common is (probably?)
> not appropriate, as SD Card is not valid on all boards or even at that
> mmc device, namely StarFive VisionFive 2 Lite eMMC, Milk-V Mars CM, and
> requires testing to know if it breaks existing functionality on boards
> with swapped arrangement of mmc0 and mmc1 with respect to SDIO module
> and eMMC (i.e. OrangePi RV ? It has been awhile I may misremember this).

This kinda comes back to the point I was making about it not changing the
configuration, just the point at which the configuration is applied. All
boards get this configuration eventually, it just seems to be that this
particular boot method needs it earlier?
I'm not sure that applying it earlier would break any boards (although
of course it could), I'd be more likely to think that having the
configuration at all is probably harmful in the cases where it is
harmful.

The other thing I don't really get is why the clk-pins node is needed at
the pre-ram stage but not the mmc-pins node. Surely both are needed? I
suppose it may be the case that the latter matches the default
configuration for the pins but not the former? If that's the case, the
node mmc-pins should get the property too IMO. I've added Hal into the
thread, maybe he can clear stuff up somewhat in that regard.

> The functionality of adding this hint is not even possible for more than
> half the boards, and no new boards will have it.

Ignoring the rest of this for now, these are the supported boards and
inferring sd from cd-gpios:

jh7110-deepcomputing-fml13v01.dts

Looks like sd on 1

jh7110-milkv-marscm-emmc.dts
jh7110-milkv-marscm-lite.dts

looks like sd on 0

jh7110-milkv-mars.dts

looks like sd on 1

jh7110-orangepi-rv.dts

ditto

jh7110-pine64-star64.dts

ditto

jh7110-starfive-visionfive-2-lite.dts

looks like sd on 0

jh7110-starfive-visionfive-2-lite-emmc.dts
jh7110-starfive-visionfive-2-v1.2a.dts

looks like sd on 1

jh7110-starfive-visionfive-2-v1.3b.dts

ditto

Would you be happier if only the boards with sd on mmc1 got the
property?

I'd like to say I will read the decompliation, but I look after this
platform as a favour and I just don't have the time to dedicate to
understanding it. There's a reason it took me ages to even circle back
to this.

>=20
> Repeating myself, Hal offered a description of the boot process but I
> find that does not exactly match the hardware based on my
> reverse-engineering effort. More eyes should be on this to explain what
> the hardware does in context of the patch commit message. Are we
> correctly describing this hardware, or not?

> The "reverse engineering of binaries" is the StarFive loader in hardware
> MaskROM that immediately precedes the supposed consumer of this proposed
> bootph-pre-ram hint as stated in the patch commit message. It is the
> hardware specifically the functionality that we are purporting to
> describe. So there it is an excerpt and if you want an explanation of
> what that all does to save you the trouble of reading it I am sorry to
> disappoint as I don't I don't understand a line of it. What are we
> describing and are there more bootph-pre-ram hints needed?

In theory, the state of the hardware prior to the boot loader stage
consuming bootph-pre-ram shouldn't even matter, any node needed by the
stage should be marked with it even if that node matches the default
state of the pinctrl hardware. What the prior stage is or does shouldn't
matter, although of course people tend to only add pinctrl nodes or
annotations when software requirements/expecations don't match the state
it finds the hardware in.

--XGIKtqsdaLV2K/Bw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamuKiQAKCRB4tDGHoIJi
0pnYAP0eZc5ITM2q9B1D5VwtvQqQnzQQJW5o1r6FHHXYY88VBAD9GNRQPP2lMtlK
v7kBYqJXlEV9sOZkwRDGGK82oiyT/gA=
=y0/s
-----END PGP SIGNATURE-----

--XGIKtqsdaLV2K/Bw--
