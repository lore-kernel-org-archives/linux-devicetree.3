Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C15E3FC5A4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500029; cv=none; b=E/E92EwwAJnn0V1dZbhMD5+Ja3s4HdBGdXtlt2cUq2FOSXG+xyjSMUF3oNZ0hCSLwPFMM1SoYA+ZWN3VCv7rCjIMLZzUhvLMmFEWTFZDYypDyR00hfTAbPWfSsMjA3MYdgWK+xaWjmGgi/YWGx7jt93nKxgR5rf6Dg2R1h0JjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500029; c=relaxed/simple;
	bh=P/VRpzXwFHKf736VT6IzodE9dnhbNbhpNsxAdRhyuaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dJcQPwngieyrSutlOpl2xkeb90Bpmh144upuNLXiq1UYhg3qxOnO6MsRYqcmCsEVyiERupc6X2vJTjjAmgcebc/uzZs5N3HVpmPv4l/RNHl+Z1wYRsvVT8g4uMUuRbtQTKCZcHClvqh9miOQw4+ylIeOR4532MWEaBJzG+l9NPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6/wTa4/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6/wTa4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE831F000E9;
	Fri, 31 Jul 2026 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785500028;
	bh=LlPcrza8rNAMF/goZx4JJpWt8ynevF/knIiTzF4U2d0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X6/wTa4/QqSpUS11qLTGXAOPvgWTYbURb19VbpkGVFd+e1mYL2sGhLNiXDpH6vg1Y
	 jGcFMvyTL4Gw8Cuoe0QyowRjTqB9zByDNF1xzQSfIUrCtg7Dp3L29AA2K90USfLMhT
	 b9Ku0hTVMvUjXKntc6lrcPTRB7HPLoGf7478SuJ4CqbbMpmkWTPrvDVWh169GT1RaP
	 f2NllTkJdVdXAxjYrhft9J2VPMI4vlzzLe5H4XXzgvglfAAgFa+juwD3WNqG6fEg+q
	 F6ibM4Rdq4G8qcv8uBGCMsdIzwEDdgLdNLILbcCHVDCm+ed1Bv8/GjDX5G3fNr/IZO
	 5iabwTxM0nPCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/5] clocksource/timer-econet-en751221: fix refcount
 leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731120246.1296955-2-cjd@cjdns.fr>
References: <20260731120246.1296955-1-cjd@cjdns.fr>
 <20260731120246.1296955-2-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:13:46 +0000
Message-Id: <20260731121347.7FE831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calculating num_blocks using num_possible_cpus() may lead to a NUL=
L pointer dereference if the cpu_possible_mask has holes.
--

--- Patch [1]: [PATCH v7 1/5] clocksource/timer-econet-en751221: fix refcou=
nt leak ---
commit 7c522e295ecdd52460f4c1098da3b6a65821ce9c
Author: Alexander A. Klimov <grandmaster@al2klimov.de>

clocksource/timer-econet-en751221: fix refcount leak

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 4008076b1a210..1859335345b59 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -181,6 +181,7 @@ static int __init timer_init(struct device_node *np)
>  	}
> =20
>  	econet_timer.freq_hz =3D clk_get_rate(clk);
> +	clk_put(clk);
> =20
>  	for (int i =3D 0; i < num_blocks; i++) {

[Severity: High]
This is a pre-existing issue, but can this loop under-allocate memory blocks
and cause a NULL pointer dereference if the cpu_possible_mask has holes?

In timer_init(), num_blocks is calculated based on the count of possible CP=
Us:

    int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);

If the CPU topology is sparse (for example, CPUs 0 and 2 are possible, but
not 1), this under-allocates memory blocks relative to the maximum CPU ID.
Only one block will be mapped, leaving econet_timer.membase[1] unmapped.

Later, cevt_init() iterates over the possible CPUs:

    for_each_possible_cpu(i) {
        ...
        cevt_dev_init(i);
    }

Which unconditionally accesses the unmapped memory:

    static void __init cevt_dev_init(uint cpu)
    {
        iowrite32(0, reg_count(cpu));
        ...

The reg_count() macro dereferences econet_timer.membase[cpu >> 1]. If a blo=
ck
was left unmapped due to a gap in CPU IDs, membase[1] will be NULL. This ca=
uses
iowrite32() to dereference NULL + 0x08, resulting in a crash on boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731120246.1296=
955-1-cjd@cjdns.fr?part=3D1
