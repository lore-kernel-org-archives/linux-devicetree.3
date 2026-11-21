Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262001;
	b=Bh1OFWbvqkDWIESvVEugEmIaExjmgTJTj7uoyeUUDT2EEdqirbdLgE7CXVyKgmjelOgk
	 CtiJBq6F+uxm5JBbx0t7URf1at2zmMEK2jtYtr8EacPaMAwbCBjaGRxar04c58D5FuR78
	 W06LbgFL84eU8pt+emzzXNP7DC/QgAJjsE4n0vIZU4pIOmk8xnHrCsnK23fUUpiJHgd54
	 EK4eKSJMoR5QB6A0XtsycAuTXA7iVIi63EP4tY3TjI9OWCbbCgEvnFhb0eT/K7AWjkWfT
	 m5+DuKt80dHx0P/+A7zrdaGtV7cx8Ju/X5bgEnhC2yNiqLUTXSWRRt1bOAI537fZs6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262001;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PmkfQOIWLvNzEKpp7jE4iPX7UIPNLkr4BCbQ2SwRKDw=;
	b=BBC3I6vfp4MuJMNlewkzs5aNXez2DYVWzwxHLuoHu5+pt9Ur5gmjzQWRRAeDvrSk6/rZ
	 Y8FfqJMUKuhPn4hvEPL7w8df358owkgzAT/ttt7A4WjRN1FAyvuHHbsguE65cUij4i0pT
	 d3m7yHyxS6UYivw1CIKyVmzSofOCP356qy5JEguiGqU74nZ3rHFA0PsLTodYWdlZPDBu6
	 CKE8ctMkplLyKrk/jvpbjyGjLAgMwdUDMVe8rXBp/b+oT1Td/z24A6tw05SoxXFMoXmJW
	 lprEdgj5cU2vMFeLkcf9cMWU+gkYJislRRMMsu/MmZnGQRVFLn4w1XDTPoXvfMXu+nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iU/tOLt9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE574606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iU/tOLt9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D57F1F000CA;
	Sat, 21 Nov 2026 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795262001;
	bh=PmkfQOIWLvNzEKpp7jE4iPX7UIPNLkr4BCbQ2SwRKDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iU/tOLt9aBGaVqy75UG12OKRCAhVzlV4MpCa4NyQjAdxxxOVND6vO5lDtiy/hz5Up
	 oFLZsDhzNUXTukHdxyRYbmDvLG1ASdoBKMs+uIublxojxLf7tojKj02o9MWO8YccVN
	 rfpHRJJzsuLO5qcKe4NjPBdR9leffvHUD73HxKZ2MNNu6DO9IPZxApGFsAL3zCuMTN
	 HeJ+tbZFME5BqBHkb0NGytYvZZ2sZIH/vltVMIKOwDyHI8KBvEqgNTB1AZZNpAtUn1
	 khfwI4DrxRNLTN3/Ne9ZxjF49kVr/wvWHeUs6j6DsMMLq7L022RJhntwyC+VNTQz/4
	 BKpuCfDmlkVTg==
Message-ID: <sashiko-outbox-226994@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: apple: t6031: Add CPU frequency scaling
 and OPPs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Reeves" <michael.reeves077@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
 <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 11:53:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: apple: missing capacity-dmips-mhz on cpu_p14 and
  cpu_p15
- [High] arm64: dts: apple: missing cpufreq and capacity properties on
  t6032 die1 CPUs
--

commit bda66cc6e2f0fc13ab6cfd1d52b88625bed8a506
Author: Yureka Lilian <yureka@cyberchaos.dev>

arm64: dts: apple: t6031: Add CPU frequency scaling and OPPs

This commit adds cluster cpufreq controller nodes, operating performance
point tables, and CPU capacity values for the Apple T6031/T6034 Sawtooth
and Everest CPU clusters.

> diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/=
dts/apple/t6031-base.dtsi
> index f62ce0690182b..772af1ea37b62 100644
> --- a/arch/arm64/boot/dts/apple/t6031-base.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
[ ... ]
> @@ -257,9 +296,12 @@ cpu_p13: cpu@10203 {
>  			cpu-release-addr =3D <0 0>; /* To be filled by loader */
>  			enable-method =3D "spin-table";
> =20
> +			capacity-dmips-mhz =3D <1024>;
>  			d-cache-size =3D <0x20000>;
>  			i-cache-size =3D <0x30000>;
>  			next-level-cache =3D <&l2_cache_2>;
> +			operating-points-v2 =3D <&everest_opp>;
> +			performance-domains =3D <&cpufreq_p1>;
>  		};
> =20
>  		cpu_p14: cpu@10204 {
> @@ -272,6 +314,8 @@ cpu_p14: cpu@10204 {
>  			d-cache-size =3D <0x20000>;
>  			i-cache-size =3D <0x30000>;
>  			next-level-cache =3D <&l2_cache_2>;
> +			operating-points-v2 =3D <&everest_opp>;
> +			performance-domains =3D <&cpufreq_p1>;
>  		};
> =20
>  		cpu_p15: cpu@10205 {
> @@ -284,6 +328,8 @@ cpu_p15: cpu@10205 {
>  			d-cache-size =3D <0x20000>;
>  			i-cache-size =3D <0x30000>;
>  			next-level-cache =3D <&l2_cache_2>;
> +			operating-points-v2 =3D <&everest_opp>;
> +			performance-domains =3D <&cpufreq_p1>;
>  		};

[Severity: High]
Are cpu_p14 and cpu_p15 missing capacity-dmips-mhz =3D <1024>?

When topology_parse_cpu_capacity() sees capacity-dmips-mhz on earlier
CPUs and then encounters cpu_p14 without it, it logs a partial
information error, frees raw_capacity, and falls back to a uniform
capacity of 1024 for all CPUs, disabling asymmetric CPU capacity scaling
between the Sawtooth and Everest clusters on 16-core T6031 systems.

[ ... ]
> diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/=
dts/apple/t6031-dieX.dtsi
> index 1624651c1d92c..bce4d677ae4c0 100644
> --- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
> @@ -7,6 +7,27 @@
>   */
> =20
>  &SOC_NODE {
> +	DIE_NODE(cpufreq_e): performance-controller@210e20000 {
> +		compatible =3D "apple,t6031-cluster-cpufreq",
> +			     "apple,t8112-cluster-cpufreq";
> +		reg =3D <0x2 0x10e20000 0x0 0x1000>;
> +		#performance-domain-cells =3D <0>;
> +	};
> +
> +	DIE_NODE(cpufreq_p0): performance-controller@211e20000 {
> +		compatible =3D "apple,t6031-cluster-cpufreq",
> +			     "apple,t8112-cluster-cpufreq";
> +		reg =3D <0x2 0x11e20000 0x0 0x1000>;
> +		#performance-domain-cells =3D <0>;
> +	};
> +
> +	DIE_NODE(cpufreq_p1): performance-controller@212e20000 {
> +		compatible =3D "apple,t6031-cluster-cpufreq",
> +			     "apple,t8112-cluster-cpufreq";
> +		reg =3D <0x2 0x12e20000 0x0 0x1000>;
> +		#performance-domain-cells =3D <0>;
> +	};

[Severity: High]
Should the die 1 CPU nodes (cpu_e10..cpu_p35) in t6032.dtsi also be
updated with capacity-dmips-mhz, operating-points-v2, and
performance-domains?

t6032.dtsi includes t6031-base.dtsi and includes t6031-dieX.dtsi for both
die 0 and die 1, which instantiates cpufreq_{e,p0,p1}_die1.  Leaving the
die 1 CPUs in t6032.dtsi without these properties causes
topology_parse_cpu_capacity() to abort capacity scaling across all CPUs on
T6032, causes apple_soc_cpufreq_init() to fail with -ENOENT on all die 1
CPUs, and prevents init_cpu_capacity_callback() from ever emptying
cpus_to_visit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-m3-cpufreq=
-opp-v1-0-42a0c07c48a4@gmail.com?part=3D4
