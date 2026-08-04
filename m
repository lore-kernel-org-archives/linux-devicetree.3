Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734F42AF96
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837195; cv=none; b=hpj54hXItewFGlqQOWKZmVd0qDn7Cz0gQ32mptEeothF5bNfbRkEukeWqG6RE67yBEhdRdCA7M2+8OuJ0sfkNTMco7e9Fdg3vfAd1k0a/bjHNHtcqS0uJqJe6DZTtTDi97/jhEg0iqOgcAf6LRH0YLlwWCnJG8Brnm6MZesyag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837195; c=relaxed/simple;
	bh=ZvmXH4jD376JOZkngep/b/WPY9vxRzbzEa3nqPr6gPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JIi8vft7mgWeNhVITfacLamGHW51UuslvSnjXDGy9j/U4McwO9hE60ZP4Q6BZ4wLttcXb/GmXB4pQze8yuUYaXPKoPQ/EjTpbLJtvRvVAwkd8l2olyLhAqoufdvGhyVwPrAfPLbkTKZ+GxZzPVSktWaw1fBjeaBmlmWN+weNDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZE74cyeM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZE74cyeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2881F00AC4;
	Tue,  4 Aug 2026 09:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785837190;
	bh=MlX7QdQ4dSTNp3lJWBW2DNEeB/txChg4d8KbBDUAjik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZE74cyeMqRcP1LtLH+jW7vjSj/SR6dP20+YWGR9QT1TX8kxHEy2adglg0RXsmFWhb
	 9+8ZRgYZx+Y+kGVdH5mazyGTrbZk1tLg/XMAPpAN5x1APbLnvYvASGT69OTvYJsAEC
	 N/yXy2gnPYNZbf516NdHSh95xFrGNKEteCAO5Q/k7SJ++Ro/U9Pvd9cLrMZWawpMuz
	 NIl1GJJwAm2/xb9cTQ7sM6IwKezXp7kmNU3aq5J73qw5F3J30hHhP6if7anacmNaj0
	 OaY6cztXqoOLlkitEpjK+E2E4aCbRsQMdnzam+wV/iUYJ47JGZvgk72C+ntuOSe5Xm
	 9HKD+KzFbwDVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 3/3] arm64: dts: renesas: r8a779g0: Add gPTP
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260803095232.3527111-4-niklas.soderlund+renesas@ragnatech.se>
References: <20260803095232.3527111-1-niklas.soderlund+renesas@ragnatech.se>
 <20260803095232.3527111-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 09:53:08 +0000
Message-Id: <20260804095309.7B2881F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Device Tree Resource Conflict: Overlapping memory regions for gp=
tp and tsn0 nodes will cause -EBUSY probe failures.
--

--- Patch [3]: [PATCH net-next v6 3/3] arm64: dts: renesas: r8a779g0: Add g=
PTP node ---
commit bb4e1d1111c141906839e9f11b82a931aa6c6fd6
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

arm64: dts: renesas: r8a779g0: Add gPTP node

This commit adds a new gPTP node to the r8a779g0 device tree, sharing the
module between the RAVB and RTSN Ethernet devices on the SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..b9b860ef70351 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi

[ ... ]

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
>  		tsn0: ethernet@e6460000 {
>  			compatible =3D "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethert=
sn";
>  			reg =3D <0 0xe6460000 0 0x7000>,

[Severity: Medium]
Will this overlapping memory region cause a resource conflict during probe?

The new gptp node maps the memory region at 0xe6449000. However, the existi=
ng
tsn0 node directly below it already claims this exact same region in its reg
property:

arch/arm64/boot/dts/renesas/r8a779g0.dtsi:tsn0: ethernet@e6460000 {
            reg =3D <0 0xe6460000 0 0x7000>,
                  <0 0xe6449000 0 0x500>;
            reg-names =3D "tsnes", "gptp";

If a board file enables both the tsn0 and gptp nodes, whichever driver prob=
es
second is likely to fail with an -EBUSY error because request_mem_region()
enforces exclusive access.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803095232.3527=
111-1-niklas.soderlund+renesas@ragnatech.se?part=3D3
