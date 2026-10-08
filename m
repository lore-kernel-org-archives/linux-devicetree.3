Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F44F7CA5
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486007; cv=none; b=cFAmnRddyvD+/RZhw2MOeOk9CTeUWR06KrqVq8vNdCYD678mKbIBhOZdqUJkrmbe1iTYXRhTgbQhHGJ7/SFmouOJ8Tfb3O1fZXV2gIxbntwIy299egOhIeMvySQukVUgPuF+lsG5dKdjmBesPQqukVygiY1WPm0Gh4b6yJlg3ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486007; c=relaxed/simple;
	bh=Nou3+WRNou8vBSOZq7bzk1E8miXoHVpbZcARx5TiMdY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eP2V8yd/kHpHBabvVhRfyRRw1pUCt9rvOJrgYYlPSZYckXmHZUhdA7lGVPXyOY/RUbK2waUMnRGWxEIABkn+k2oW6yF+JlFBdZTWhiq9pnJa6hj0zkdk4qQ/bD/0pYkm7Rc9x1r1vMtUucFe/rc8Bgpkdcp329cYQd4Y01RGMn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbknOHrZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbknOHrZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11FD1F00898;
	Thu,  8 Oct 2026 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791486006;
	bh=yPhpYlRKP54lqDgRzrJwxjcfYWpYonDN/R0W7qloaFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hbknOHrZdu+lel8O0SOYas4vFK0vpROi7B9nN76x3Pog86nciUk6bjEHD+p/e1qT6
	 6n4+ZMh3HymJDY5hnfB/MUUimTV411rAGNXCMZHI34whAXq9VxCNKPEmk6Y2nlFq9Q
	 eisWDCe+fC1CY9y15aRMn9kHEPAqln8auCCgtPcQau2cvqSXOrsYkLTvNgHrw7Z8sK
	 V4jLIq62C78ss95MgInYo+A47qVOL3jvgnhEjDAa6qa4xOgrzYYWv0YIuUSrNV4efd
	 LQOh6ZmI5nWU3jYkG6Vss1aQoZHwHwUoKyU1DC7VmnVQVOE/Ao8zmOa8OsC1adKPuM
	 W78DcIppjorbQ==
Message-ID: <sashiko-outbox-164486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261007185920.4042783-4-niklas.soderlund+renesas@ragnatech.se>
References: <20261007185920.4042783-1-niklas.soderlund+renesas@ragnatech.se>
 <20261007185920.4042783-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 19:00:05 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: overlapping memory regions for gptp and tsn0 cause probe fail=
ure
- [High] dts: shared reset line between gptp and tsn0 causes probe failure =
and state corruption
--

commit bea10c72449c59315d90e1e324663f9ca4760bf4
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

arm64: dts: renesas: r8a779g0: Add gPTP node

This commit adds a new gPTP node to the r8a779g0 device tree. The gPTP modu=
le
is intended to be shared between the RAVB and RTSN Ethernet devices on the =
SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 8a291447b9045..7430b663cf92e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gptp: ptp@e6449000 {
> +			compatible =3D "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> +			reg =3D <0 0xe6449000 0 0x500>;

[Severity: High]
Does this memory region overlap with the existing tsn0 node?

The tsn0 node independently claims an overlapping memory region starting at
0xe6449000. When both devices are enabled in a board device tree, the driver
probing second will fail with -EBUSY because the kernel resource framework
enforces exclusive access to physical memory regions. This could permanently
disable either the PTP timer or the Ethernet TSN interface.

> +			clocks =3D <&cpg CPG_MOD 2723>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 2723>;

[Severity: High]
Will sharing this reset line cause probe failures or hardware state corrupt=
ion?

Both the newly added gptp node and the existing tsn0 node specify the same
hardware reset line. The rtsn driver exclusively acquires this reset. The
second driver to initialize will fail to acquire it, leading to a probe fai=
lure.

Furthermore, even if the drivers are updated to request a shared reset, the
rtsn driver unconditionally pulses this shared reset line during hardware
initialization:

drivers/net/ethernet/renesas/rtsn.c:rtsn_reset() {
    ...
    reset_control_reset(priv->reset);
    ...
}

Since the gPTP block is shared across multiple Ethernet devices, pulsing th=
is
reset asynchronously wipes out the gPTP timer registers, which could
permanently break PTP synchronization for the system.

> +			status =3D "disabled";
> +		};
> +
>  		tsn0: ethernet@e6460000 {
>  			compatible =3D "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethert=
sn";
>  			reg =3D <0 0xe6460000 0 0x7000>,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007185920.4042=
783-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
