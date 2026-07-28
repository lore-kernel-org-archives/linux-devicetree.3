Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632DD3CF69C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265583; cv=none; b=GHoIMvWRuFFkcrl2YOAWOOLitH2A/wdCMZf/578CYVWQZFScF1JINiVBWnjVFmeIUbkYnaDg5bZuFDxD8Z5F26ctdiJ0XhBKqMcLWIpSZ47bvFVzuusrN8BKph93Z9kFCsWsNoDG6KkU36GnwuRhefo8W1otIJjYUvxIPghcbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265583; c=relaxed/simple;
	bh=dpIpGfEGRhJLtz+xstzt9a4eAbdM18waVHE1mTAnNPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Et571NJAmZ+BrUEzzRVlwo/lsM9/HgQ97yaE4ZP0UsoUN/2og5kasPYBo7vCREUBYvk8rjDZmI5q453JUV0YD/ecSTPXnVzVcFUr/olTY7DqoQaOJrHTGdMAxQy/Ep7iHm3zxyC8totk5slbJ0UBAYs4gSLeljs/FtSm8msWbQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HU2b/Yll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HU2b/Yll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD601F000E9;
	Tue, 28 Jul 2026 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785265582;
	bh=RM98yW+DE9emF+0SjYFPPF9Caoj0trllYP9DFp+4OT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HU2b/Yll8q17mFvqnv6VucWpu27+LzP3oGGDDR3w04ZAljXhHJO3zxzJW8rZVKi8Z
	 phHBS/N184dCF7iT9Z3FcNjTET74eyPPZNY1UE2llrQPIPK6zhokgula5Hf3/b+00x
	 BHtgvl9qL++UBcJZHf5QQU1ENqnJwugNjJfP1Ce0DONEtyNooN3oNraxgMsnTBUSDy
	 Pn2pivpiX+joBu6dfzJYsGiO429PeOVza4dpjq7ucx+cifQm2w1/SrnJ/e/SKHgbuF
	 zu+0VNv1HsR33CIgqpdG7xrt+GtmILBI6BxnB0/p8PQ1sPhnalZPhS7+Hjws6cz+43
	 h8PnbHIk5NV0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mips: econet: add multi-vpe capability to EN751221
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728184959.102441-2-cjd@cjdns.fr>
References: <20260728184959.102441-1-cjd@cjdns.fr>
 <20260728184959.102441-2-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:06:21 +0000
Message-Id: <20260728190621.CCD601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditionally masking hardware interrupts in en751221_init_secon=
dary breaks the secondary CPU's timer if the system boots with VEIC disable=
d.
--

--- Patch [1]: [PATCH 1/2] mips: econet: add multi-vpe capability to EN7512=
21 ---
commit 29d4bfd90711d72516d1c7a3132dda2ae50742fc
Author: Caleb James DeLisle <cjd@cjdns.fr>

mips: econet: add multi-vpe capability to EN751221

This commit registers SMP_MT on startup and overrides init_secondary with
CPU interrupt unmasking required by the EN751221 VEIC intc hardware.

> diff --git a/arch/mips/econet/init.c b/arch/mips/econet/init.c
> --- a/arch/mips/econet/init.c
> +++ b/arch/mips/econet/init.c
[ ... ]
> +static void en751221_init_secondary(void)
> +{
> +	write_c0_status((read_c0_status() & ~ST0_IM) |
> +		(STATUSF_IP0 | STATUSF_IP1));
> +}
> +
> +static int __init en751221_register_vsmp_smp_ops(void)
> +{
> +	if (!cpu_has_mipsmt)
> +		return -ENODEV;

[Severity: High]
If the system boots with VEIC disabled (e.g., falling back to cascading mod=
e),
will this break the secondary CPU's timer?

By registering these VEIC-specific SMP operations here without checking
cpu_has_veic, en751221_init_secondary() will execute on the secondary CPU.

Since en751221_init_secondary() clears ST0_IM unconditionally, it masks
hardware interrupts including the timer interrupt. Could this lead to
boot stalls or RCU hangs on non-VEIC setups?

> +
> +	en75_smp_ops =3D vsmp_smp_ops;
> +	en75_smp_ops.init_secondary =3D en751221_init_secondary;
> +	register_smp_ops(&en75_smp_ops);
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728184959.1024=
41-1-cjd@cjdns.fr?part=3D1
