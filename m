Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8543F3F0A8C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500087; cv=none; b=Aj7G1vkrZtim1xDLqm5vCSJPXrdXPEJprc3kU27uOdwqCMLITHSyMKU3pnkht9IpOoT0tgI6ZUy+TUdKDHAuIbOFu17ucytOolhgyqwrRKK1XAYzUVVO/6ugxUAY39gETUtXUoydlz9erILUmvQOoUvTgM6NKDRd+YNYPvT6dOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500087; c=relaxed/simple;
	bh=T/d/QqXeHN7lk8PDYLXjfqZBJGTuylaGfFrL9cSpWkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DMADqUpUBkaoN2Mn3pJCQUdiYnqiXaJU7kvzHHw1kEyXnSdfQ9zn8z7+o4Eo4mX/Bx7VseYAUjiuVMknQx4bKqwxtqXslieSbD/p/xGwjQ5/y7zJWj0GiN5I3hIo9rmwf6BjinrwJjMUYpisHJBo12P4SGQiuuzx/WvbBNH3R0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVqs1VvO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVqs1VvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABC01F000E9;
	Fri, 31 Jul 2026 12:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785500086;
	bh=m/ZM83ADlRwOfGW6XTSQl1KbzcWFmJyt2dIvqZGj2WU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XVqs1VvOc7QAZr638PLgD5Dw+TYB73dOjytGRhk1ecKWSgq+XFlTzfMQq4isZkFbA
	 7EogCEib/r9ysL2nvh/QTPcN8U8prEfYPn+/fnw4JG2SWFQpSxvkZxOm8dFAArD2Ef
	 n5u9qyhHTuGaX79Xtkn+Yoe1yTOSP5hgBsrUAjI2Vty+eroSDlZHuSsWW8bqM01xvT
	 Ig5uRSXA2+2tGyGrh9Sn+qLdfhkTwcqPHbf99WZEc5m30zUnDUMtRlzibKMxmuO6rs
	 TedOmBeed8SV5pzGIf0UOwOafGGCWsIFRHcGo0WgWJuP3Q9coNoF0yp2pDcudT3Ujm
	 wHy/7ujlqgfqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/5] clocksource/timer-econet-en751221: Init teardown
 on error if possible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731120246.1296955-4-cjd@cjdns.fr>
References: <20260731120246.1296955-1-cjd@cjdns.fr>
 <20260731120246.1296955-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:14:45 +0000
Message-Id: <20260731121445.9ABC01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] On systems with sparse CPU topologies, memory blocks mapped via nu=
m_possible_cpus() are out of bounds when indexed by absolute CPU ID.
--

--- Patch [3]: [PATCH v7 3/5] clocksource/timer-econet-en751221: Init teard=
own on error if possible ---
commit aa21baac1fd919824fefec289b6741bdd5585304
Author: Caleb James DeLisle <cjd@cjdns.fr>
clocksource/timer-econet-en751221: Init teardown on error if possible

The commit converts the init process of the econet timer into two phases,
moving IRQ and address resource mapping before the point of no return. It
adds teardown logic in case of an error before this point.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 1859335345b59..714702b9ef128 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
[ ... ]
> -static int __init cevt_init(struct device_node *np)
> +static void __init cevt_init(struct device_node *np)
>  {
[ ... ]
>  	for_each_possible_cpu(i) {
>  		struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, i);
[ ... ]
>  		cevt_dev_init(i);

[Severity: High]
This isn't a bug introduced by this patch, but could this loop cause a NULL
pointer dereference on systems with sparse CPU topologies?

If a system has sparse CPU IDs (for example, CPU 0 and CPU 4),
num_possible_cpus() evaluates to 2. When timer_init() calculates num_blocks
using the popcount of possible CPUs, it maps only the first block into memb=
ase:

timer_init()
  int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
  ...
  for (i =3D 0; i < num_blocks; i++)
      econet_timer.membase[i] =3D of_iomap(np, i);

However, the loop here iterates using for_each_possible_cpu(i). For CPU ID =
4,
cevt_dev_init(4) is called. The underlying register access in reg_count()
uses the absolute CPU ID to compute the array index:

reg_count()
  return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x08;

This calculates an index of 4 >> 1 =3D 2, accessing membase[2]. Because
num_blocks was calculated as 1, membase[2] was never mapped and remains NUL=
L,
which would lead to a NULL pointer dereference during hardware initializati=
on.

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731120246.1296=
955-1-cjd@cjdns.fr?part=3D3
