Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817709;
	b=Ce9OzCgLcaLvxN2rzOK2jzJfD3MgqvdTmAUgEsVaysJQ93wJAkE8lPr3WyPTyFIbyxIv
	 M60orncNj0A2guqLUe6WWKNkITHucBPCN+5Jkoo2JcgLk4I0ttGd+pYVGFoA9/pQHUFRK
	 swyXUh92cIuNqcDkuicFWRLgdgJLyXmtwwD7qD/nDtzL27FHKhDqfybuH8/9UvuaHvfbh
	 RtxNUSVlkuToZmwFgdMTL1oMy+aqrIRjL+2XriNrj3Roo+JVv2hfUb+V/VXBdWxiYmJ3u
	 N7zeHcb/rILldYDAvh4Q9gDhKdkM/HXllp30RewvuR/2lmVIZwZGIs6Uz3Y4qvANy6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817709;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q832vFmT44yWQttgAL/trsGKjGoAr5qZy1QNGwXvu8M=;
	b=xOx3CKH2/6WCG6btxC3noJSEnGP2O6vqFKluHph+Nzn/1ufxVYBLLWTGoUEdlgejG4SF
	 Y5S433kj37cZi1JCa86B3A1E8AKoV3KLI23/m+7lDlbNmx7rrf+N+yP2GISJcpxJUpP1/
	 zzWBuCmss/V2J94Cb2thZRtPybB6RwtXeZ99Ve4WOZXqMD78P6RQjfjnRuUdw1H8PuiVA
	 Y6YOdY3d8rxj0TAenZKfLeXG4EFDSwtlwjfE2QimciqVM1i9N98xAcFvbOX4sgqugdbxl
	 +MJs7AYCt9yNu73ItMk/onw7owJTc6rcaEsop3TVQWgVqOMbqs+OgHpEtyesgSnYMVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oirw1Kyf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC6606A32E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oirw1Kyf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1741F00919;
	Wed,  4 Nov 2026 18:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793817709;
	bh=Q832vFmT44yWQttgAL/trsGKjGoAr5qZy1QNGwXvu8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oirw1KyfKR7tbQom2dioC+8xrDPsJJOOkQ5/DWJiNvJGh1AtKlJezH8vWE3FyUdEd
	 rDd+AUiqztOzqaPD57xEzAaqB92vhUGsftdtaBZLoJbhMRTAZ7ys0cNME0M+dQz1Q0
	 JpxLF2ZSkb4MkfMZUdw6BzSCpPftg2SIJCNiaLexZBtPm4Snr/d7f+ulLU5aTx4ung
	 DUoETiodzKYRsTfe0n3wIU3tr7fcdwJvuBsJmbRo2FOfn7Vo0h1uY/IAh8kHgWWsUe
	 egZTcNWkKppFV3LUgxqjd1k3+WULqxE/QWPndVOMY8tbEz88/K/UypuGNZ1QbY3qXi
	 gDvbjAShsWUHQ==
Message-ID: <sashiko-outbox-197862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] arm64: tegra: Add CCPLEX cluster node for Tegra264
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Gupta" <sumitg@nvidia.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104181521.3003578-10-sumitg@nvidia.com>
References: <20261104181521.3003578-1-sumitg@nvidia.com>
 <20261104181521.3003578-10-sumitg@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 18:41:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: tegra: ccplex@30000000 translates to PCIe window 0x30000000=
 instead of 0x8130000000
--

commit 26a0214ddb9808bcd10d28a93f2871f0b1488885
Author: Sumit Gupta <sumitg@nvidia.com>

arm64: tegra: Add CCPLEX cluster node for Tegra264

This commit adds the CCPLEX cluster node under bus@8100000000 in
tegra264.dtsi and attaches performance-domains properties to the CPU nodes
for CPU frequency scaling.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra264.dtsi
> index 5ab34cd09a3d0..10ea51802e8c8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -3964,6 +3964,13 @@ i2c12: i2c@c6d0000 {
>  			status =3D "disabled";
>  		};
> =20
> +		ccplex: ccplex@30000000 {
> +			compatible =3D "nvidia,tegra264-ccplex-cluster";
> +			reg =3D <0x00 0x30000000 0x0 0x00cf0000>;
> +			#performance-domain-cells =3D <1>;
> +			nvidia,bpmp =3D <&bpmp>;
> +		};

[Severity: High]
Does ccplex@30000000 translate to CPU physical address 0x00_30000000 instead
of 0x81_30000000 here?

In arch/arm64/boot/dts/nvidia/tegra264.dtsi, the parent bus@8100000000 node
defines its ranges property as:

	bus@8100000000 {
		...
		ranges =3D <0x00 0x00000000 0x81 0x00000000 0x00 0x20000000>, /* MMIO (51=
2 MiB) */
			 <0x00 0x20000000 0x00 0x20000000 0x00 0x20000000>, /* non-prefetchable =
memory (32-bit, 512 MiB) */
			 <0x00 0x40000000 0x81 0x40000000 0x00 0x20000000>, /* MMIO (512 MiB) */
			 <0xa8 0x80000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, prefet=
chable memory (64-bit) */

Because child address 0x00 0x30000000 falls within the second entry
(0x00 0x20000000..0x00 0x3fffffff), OF address translation maps it to parent
CPU address 0x00 0x30000000..0x00 0x30ceffff rather than 0x81 0x30000000.

When tegra194_cpufreq_probe() calls devm_platform_get_and_ioremap_resource()
on this node, tegra264_get_cpu_ndiv() and tegra264_set_cpu_ndiv() will read
and write the 32-bit PCIe non-prefetchable memory window at 0x00 0x30000000,
which also collides with the non-prefetchable memory aperture of pci@842000=
0:

		pci@8420000 {
			...
			ranges =3D <0x81000000 0x00 0x84000000 0xb0 0x84000000 0x00 0x00200000>,=
 /* I/O */
				 <0x82000000 0x00 0x30000000 0x00 0x30000000 0x00 0x08000000>, /* non-p=
refetchable memory */
				 <0xc3000000 0xb0 0xc0000000 0xb0 0xc0000000 0x07 0xc0000000>; /* prefe=
tchable memory */

Since pci@c000000 under bus@8100000000 only uses 0x00 0x20000000..0x00 0x27=
ffffff
for its 32-bit non-prefetchable memory window, should the ranges property on
bus@8100000000 be updated so that 0x00 0x30000000 translates to
0x81 0x30000000?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104181521.3003=
578-1-sumitg@nvidia.com?part=3D9
