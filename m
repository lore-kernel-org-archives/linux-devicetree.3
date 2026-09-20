Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFA82F7F15
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 03:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789874756; cv=none; b=ZexrMxweXVUg2oST4w9EimrYsd1mpCzWj26HAQ69pPu5r68qUbBfrtr3Db/tr/V00/LYOSgEUSFCykpbncVSdRSwBWVMTFrwqNNeUCpaXjQO581ZOuwyTZNB8dbbiYMHItjmPkjo7c4iTQmCHPL9e4P9FrqLZgM4c9dnSq9B12Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789874756; c=relaxed/simple;
	bh=XkBYilVA89C+QGMxXK7Ww2JikhsVC9Yu6uBIDeEcwWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nVgaC9QwWaX60rKz3CVuKAeu4p0tCu0nhshMOUetxbPgv6ZO8CU932I0S7hfspGnnD3LhJ112+ZMC7qIE5YsDQD1cvK9a8YvcMBJwQZYSkhdlho4AG19n43M/a9XML5MqiHj/6ZBnC8invlaazCrKBEVZ0QaZuT7maWQ91+8cNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WETO+WH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WETO+WH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 027781F000FF;
	Sun, 20 Sep 2026 03:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789874755;
	bh=EUqve4WGGJKt66nZtC2Wvl8S2UiA5rUk0TcuQAbLaAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WETO+WH5kZuUjpu5tGiIJk/TwQxFy452WxSeYlhe32czuPqJVk0J6iOiwmOz0pHKg
	 i75jSf9zKR5eRTzmO5TZ0nBGYjnSDw83tsy/skisCsY5cFXXKz5mV9Oo8B3fsEIQ0V
	 MsZMTJ31YHE88xEIY4OSdckhloOoBGB8hWLjMZyLYMXUwKD0f9sQPUTV9iv1dw1K93
	 TeBNKY4LoMI4LFMCEHQZhs5XKTqbSRRKNblV8MFWYm2a7uHzatAR1rA7Jx1SZjcZqN
	 UFyhoVj92bE71ZSUcmnHxp1Dki/4ta3KqJhn1XXJAJUM8PccxwF7nOUukJKEqvQA5s
	 zp4bRMyIMNbNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] arch_topology: Add a die level to CPU topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-riscv-die-topology-rfc-v1-1-071c0bf61d5f@linux.dev>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
 <20260920-riscv-die-topology-rfc-v1-1-071c0bf61d5f@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 03:25:54 +0000
Message-Id: <20260920032555.027781F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arch_topology: missing generic die topology API macros
--

commit 6649d6f4ff943b18e39749fa5d7c01258bf6f28c
Author: Troy Mitchell <troy.mitchell@linux.dev>

arch_topology: Add a die level to CPU topology

This commit introduces a die level to the generic CPU topology model by add=
ing
die identifiers and sibling masks between the package and cluster levels.
Die sibling masks are built when firmware supplies a valid identifier,
otherwise falling back to an unknown die.

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a3..ee82827be3351 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c

[ ... ]

> @@ -824,6 +836,8 @@ void remove_cpu_topology(unsigned int cpu)
>  		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
>  	for_each_cpu(sibling, topology_cluster_cpumask(cpu))
>  		cpumask_clear_cpu(cpu, topology_cluster_cpumask(sibling));
> +	for_each_cpu(sibling, &cpu_topology[cpu].die_sibling)
> +		cpumask_clear_cpu(cpu, &cpu_topology[sibling].die_sibling);

[Severity: Medium]
Why does this access the raw cpu_topology struct directly?

The surrounding code uses macros like topology_cluster_cpumask() to retrieve
the sibling masks. Since the patch adds die_sibling, should there be a
matching topology_die_cpumask() macro exported for consistent access?

>  	for_each_cpu(sibling, topology_llc_cpumask(cpu))
>  		cpumask_clear_cpu(cpu, topology_llc_cpumask(sibling));

[ ... ]

> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index ebd7f8935f969..2a5591bb95075 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -63,10 +63,12 @@ struct cpu_topology {
>  	int thread_id;
>  	int core_id;
>  	int cluster_id;
> +	int die_id;
>  	int package_id;
>  	cpumask_t thread_sibling;
>  	cpumask_t core_sibling;
>  	cpumask_t cluster_sibling;
> +	cpumask_t die_sibling;
>  	cpumask_t llc_sibling;
>  };

[Severity: Medium]
Are we missing the corresponding generic macro definitions for the new die
topology API?

While die_id and die_sibling are added to the structure here and computed
internally, the standard generic topology accessors (like topology_die_cpum=
ask
and topology_die_id) are omitted from this generic header.

Without these definitions in the generic header, do architectures utilizing
generic topology (such as ARM64) silently fall back to the dummy defaults
in <linux/topology.h>?

If these macros are only defined later in an architecture-specific header
(such as RISC-V in a follow-up patch), it leaves the generic API abstraction
broken. The newly computed die boundaries would remain functionally
inaccessible and completely hidden from sysfs and the scheduler on other
architectures like ARM64.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-riscv-die-=
topology-rfc-v1-0-071c0bf61d5f@linux.dev?part=3D1
