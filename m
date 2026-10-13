Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3160B3FF1C0
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887780; cv=none; b=rql6eSfF+POB+bYapypip6M8S/dM88sEX8wLRjRJZO2lJGCRFT/4RfDk/+hWjr2PcMkPn+rzDdZ9At8R8yaQ8XgIvvDAGK1EX357X1M3osEne/qoNnqDR/Shb6esELn2FDtVyR2eLioBoiiX5FLiZduqhboP0hwS1zzByThlYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887780; c=relaxed/simple;
	bh=KSrqgKYHNu7H1TZ937u52A31q7NH56ftxDn0RHEZWEk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MA4kEvJawjboD74P8Z2L3WGocrMuFOaIi7hsUpBXOj9NI1PBjx1Hxd6Ioj8LJk6x8t4Uhpco20WcC6ezxfRfqMkTvomSYjead9kQumK8HSp9nldlSxM4efhuY5bteCooHK1pLpUZEeUqdSPRm9BYwPFk8dOIsUZQN3FUpa1E+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFs8NPN1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFs8NPN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FDE1F000FF;
	Tue, 13 Oct 2026 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791887779;
	bh=cF/h+BXNqz8LaSRb+B28fmkYWniKV9I9FFQuq1bV3xQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFs8NPN1hh5okT+qysuhS0CGHqw3m3QbSSRrlKEQEk5IASrnNLVVjT/x49aMqhOd8
	 JqatT86Z4BeDcLl5jLgbqtkBaSoDiIzxyfnyDuHWLmqltV+RrBcldVmwYDI1tPh90Q
	 CGrcNhZ8lkNWKW2PRPqvCXQa/+ZCxZEt21XG7CqxvU/QUSnVxuf6fJAtGZEGdQtIwV
	 nb3F2cWCMkDtqBwp1ZKTzYMrxjfu2rjK6eCjkpNSzuFKZBzYFIkEEbdL9fw3+RSP71
	 86oSKl6UzNFrCjwGw1E3WZESU/mKg7L4lu1ouEZi8RcGi1wh6S+pSvjvBsOMq0ImbK
	 LiSdqoHeAIzOA==
Message-ID: <sashiko-outbox-169523@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xincheng Ji" <jixincheng@ultrarisc.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-ultrarisc-dts-v3-5-5ff3ebb2a90d@ultrarisc.com>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
 <20261013-ultrarisc-dts-v3-5-5ff3ebb2a90d@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:36:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: L2 cache nodes are incorrectly nested as children of cpu no=
des
--

commit 72d6d58d85f9aab9e46d9c7167175451c2551346
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000

Add the base device tree for the UltraRISC DP1000 SoC. It describes
eight CP100 CPU cores, their cache topology, and essential peripherals.

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/=
dts/ultrarisc/dp1000.dtsi
> new file mode 100644
> index 0000000000000..86d7f5533aa84
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> @@ -0,0 +1,899 @@
[ ... ]
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		timebase-frequency =3D <10000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "ultrarisc,cp100", "riscv";
[ ... ]
> +			cpu0_intc: interrupt-controller {
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +
> +			l2_cache0: l2-cache {

[Severity: Medium]
Does this incorrectly nest the L2 cache nodes as children of the cpu nodes?

Standard Devicetree topologies for CPU schemas require cache nodes to be
defined as siblings under the /cpus node or globally, rather than as direct
children of the cpu nodes. Instantiating l2-cache here can cause
dt_binding_check validation failures and break generic kernel cache topology
parsers that expect the cache nodes at the root of /cpus and referenced via
the next-level-cache phandle.

Should these cache nodes be moved outside of the cpu@0 node?

> +				/*
> +				 * L2 cache:
> +				 * cache-unified, block-size 64B
> +				 * 8-way set associative, size 512KB
> +				 * per-core.
> +				 */
> +				compatible =3D "cache";
> +				cache-block-size =3D <64>;
> +				cache-level =3D <2>;
> +				cache-size =3D <0x80000>;
> +				cache-sets =3D <1024>;
> +				cache-unified;
> +				next-level-cache =3D <&cluster0_l3>;
> +			};
> +		};
[ ... ]
> +		cpu4: cpu@10 {
> +			compatible =3D "ultrarisc,cp100", "riscv";
[ ... ]
> +			cpu4_intc: interrupt-controller {
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +
> +			l2_cache4: l2-cache {

[Severity: Medium]
The same structural error appears to be repeated across all CPU nodes in the
cluster. Could these cache nodes be moved outside their respective cpu nodes
as well?

> +				/*
> +				 * L2 cache:
> +				 * cache-unified, block-size 64B
> +				 * 8-way set associative, size 512KB

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-ultrarisc-=
dts-v3-0-5ff3ebb2a90d@ultrarisc.com?part=3D5
