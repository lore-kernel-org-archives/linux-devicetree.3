Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC783EB7FE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983215; cv=none; b=eP7DXxy0aKe5GBoe4QL2IQwcLcoJIOs/O4wmOBfvCKy5pcInQA0bKLK+qWrG5DGYpmS48CSPQr0BvbYjYsmuiQPCziwsT/QwemxI4qNfiG4qIXhQw0RD/ScnJihPnmOc/vjkoDuvMtFA19our3Yv4TQn3rXeXp2xTxgf4uFMC0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983215; c=relaxed/simple;
	bh=m3ZoRQ8XFi4O6c2bDok1nUQhJbi/sIGxJLPW4WcGgz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Joy985jZCPVVZKVJXYs3jWYCjlbZ7kHVKwQ3Xk7Fu6fn42gpFuWpp0l2oLHusG6J40B+mjC/O6y7Qk2QmiSw3lVvvD/PWrDRNxIZJvTH6BT0n1wUHRtgoOU2cI7W9SUh+PbqzH+y5aXc/8rrI+0cs5+xhl3Ct8mFExKBWBgnS9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQF3SWr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQF3SWr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297201F00A3D;
	Thu,  2 Jul 2026 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782983212;
	bh=qPzmLDX3QxQ4GdsnHCWxejMVlk9a6dOmUOtu2sWT4oQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQF3SWr6Bw2ii+KN9MLhChWH6WFvITesXMIk8xoirQhhUV+rehaz9aenfCcM5P0ap
	 B50G/j8kApZfLDRnq/mIy46PKTz+hKl3NHKoj5oKojC83j+v9aMuBsmysbcFVjxXJW
	 Y2Agi1IK6v3pbmWDgxECaTbTXCI4FmPOD4Mc2Mp7g4D61QrSpbuio4d/HRgGEZ50P+
	 ADL0ieScwwDJFeAD5Q6vweaxVDu7ZGhBNATL8Q6oTGnbaqm/IVFS2rbuP7i1FRc9do
	 yg/UY642PW/Ka3Kt9zwitOXBZBlSdpdZrtOkivPQXPbGYzdvv+s3L6Bo5/MDeh8HDm
	 tCnOG4zpfVzWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260701090607.1108208-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
 <20260701090607.1108208-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:06:51 +0000
Message-Id: <20260702090652.297201F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added `gptp` node claims the exact same memory and reset=
 resources as the existing `tsn0` node, leading to `-EBUSY` probe failures =
and hardware state corruption if both are enabled.
--

commit c52da814d390d81d618c033aea857f507bdb9ae0
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

arm64: dts: renesas: r8a779g0: Add gPTP node

This commit adds a new gPTP module node to the r8a779g0 device tree, sharing
the hardware between the RAVB and RTSN Ethernet devices.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..b9b860ef70351 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -589,6 +589,15 @@ tmu4: timer@ffc00000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gptp: ptp@e6449000 {
> +			compatible =3D "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> +			reg =3D <0 0xe6449000 0 0x500>;
> +			clocks =3D <&cpg CPG_MOD 2723>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 2723>;
> +			status =3D "disabled";
> +		};
> +

[Severity: High]
Does adding this gptp node cause resource conflicts with the existing tsn0
node?

The new gptp node claims the 0xe6449000 memory region and the 2723 reset li=
ne.
However, looking at the existing tsn0 node right below it, tsn0 also claims
the exact same memory region and reset line.

If both nodes are enabled in a board device tree, this will lead to probe
failures when the drivers request exclusive access to the 0xe6449000 MMIO
region. Whichever driver probes second will receive an -EBUSY error.

Additionally, the rtsn driver explicitly asserts the 2723 reset line during
interface bring-up via rtsn_reset(), which would silently wipe the hardware
registers configured by the gptp driver.

Should the tsn0 node be updated to drop its gptp memory region and reset li=
ne
to safely extract the shared module?

>  		tsn0: ethernet@e6460000 {
>  			compatible =3D "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethert=
sn";
>  			reg =3D <0 0xe6460000 0 0x7000>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701090607.1108=
208-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
