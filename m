Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740ED3AC0C3
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741544; cv=none; b=d5WRrIpKTHcE0AciVkQ/Z07l3M/KmNJFSGTghaqoMnWv9ntkAqxdXTJ2chDDrX9Tg6Cxn3bKAzER2xACliFtWjcKsxFofnrUsuyObT6Q71wh/RWrzOK0fskStp30ELsFJk0eWwYYNLSC0DJCQB+5bwpsaOu/0iTCnHMZw46lpOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741544; c=relaxed/simple;
	bh=mNfdQ6mH/Fl/WyJmH7mJnq7lSmD+jTl6vBrkxDEpw2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fIzsU81A3GK8TqIUqYygJC0bB8gs056ss6lDKzGHGsxrAl+L7gjCzrw4rk5ZyqOP/qPDLpHk9k31P8LrrutgE2JgHaCVhTNjm9W8FaiJbUI8ABHpLJVoWQOBfICuSSyPRC7YyrmJb8FCJxgHF0FfdeaY84cSi8rbKjxMXJv79VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rI6MBy/h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rI6MBy/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C746C2BCC9;
	Thu, 14 May 2026 06:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778741544;
	bh=mNfdQ6mH/Fl/WyJmH7mJnq7lSmD+jTl6vBrkxDEpw2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rI6MBy/hudioh7IqLHdEdnncX5m8fEzy76eHJTOEayxYreh3WabTgcvwBMdqaCNoo
	 gGetig868+hk2owcuYJQyEr0VGll4HHdlbGq6kiqb9Ew2icaKhiAzpPcxx8SMpAXDe
	 H9U4NWCaTxJMEZm+GWiJUy51UfcVyVcSnkJ8K5yUcS/v6Jhq6gJnCoYY6kkQ4gnU7O
	 KUGcOfmSvZiKqOVNjdJiSpiXX70mue6QhiJgaJ7M083I9QNHIiZMTvuBwXbFHMIhqh
	 XouPWHNt5JXzVBW9qEiiXEQRpMUQAeDBMv2N6a6lUbxll/Rb+u7FACl/0xwPGSEZOg
	 iL4P2Ywr/AQCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v7 3/3] riscv: clocksource: Add p8700-gcru driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksa Paunovic via B4 Relay" <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513-riscv-time-mmio-v7-3-f8925ffc226b@htecgroup.com>
References: <20260513-riscv-time-mmio-v7-3-f8925ffc226b@htecgroup.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 06:52:23 +0000
Message-Id: <20260514065224.0C746C2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Resource leak in `p8700_timer_init()` on the error path if `cloc=
ksource_mmio_init()` fails.
- [Low] The Kconfig entry lacks `depends on 64BIT`, causing compilation fai=
lures on 32-bit RISC-V architectures.
--

commit 4f34b087c1b81aba548d943831bdb092b55bf784
Author: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

riscv: clocksource: Add p8700-gcru driver

This commit adds a clocksource driver for the MIPS P8700 GCRU. It uses
timer-of and clocksource_mmio helpers for initialization.

> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index ffcd23668763f..861e7b8c93376 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig

[ ... ]

> @@ -672,6 +672,15 @@ config CLINT_TIMER
>  	  This option enables the CLINT timer for RISC-V systems.  The CLINT
>  	  driver is usually used for NoMMU RISC-V systems.
> =20
> +config P8700_TIMER
> +	bool "MIPS P8700 timer driver"
> +	depends on GENERIC_SCHED_CLOCK && RISCV && RISCV_SBI

Does this driver also need to depend on 64BIT?

The driver unconditionally uses readq_relaxed() and clocksource_mmio_readq_=
up.
On 32-bit RISC-V platforms, readq_relaxed() is not defined, which will cause
undeclared identifier errors during compilation.

If we try to fix the build by including linux/io-64-nonatomic-lo-hi.h, it
could introduce torn reads when reading the 64-bit hardware counter with two
non-atomic 32-bit reads, leading to massive sched_clock() time jumps.

> +	select CLKSRC_MMIO
> +	select TIMER_PROBE
> +	select TIMER_OF
> +	help
> +	  Enables support for MIPS P8700 timer driver.

[ ... ]

> diff --git a/drivers/clocksource/timer-p8700.c b/drivers/clocksource/time=
r-p8700.c
> new file mode 100644
> index 0000000000000..220ed8efdfe55
> --- /dev/null
> +++ b/drivers/clocksource/timer-p8700.c

[ ... ]

> +static int __init p8700_timer_init(struct device_node *node)
> +{
> +	int error =3D 0;
> +
> +	error =3D timer_of_init(node, &gcru_of);
> +	if (error)
> +		return error;
> +
> +	p8700_time_val =3D timer_of_base(&gcru_of);
> +	/* Now init the mmio timer with the address we got from DT */
> +	error =3D clocksource_mmio_init(p8700_time_val, "mips,p8700-gcru",
> +				      riscv_timebase, 450, 64,
> +				      clocksource_mmio_readq_up);
> +	if (error)
> +		return error;

If clocksource_mmio_init() fails, does this code leak the I/O memory mapped
by timer_of_init()?

It looks like timer_of_init() maps the memory via of_iomap(), but this error
path directly returns without calling timer_of_cleanup() to release those
mappings and other associated timer_of resources.

> +
> +	/* Sched clock */
> +	sched_clock_register(p8700_timer_sched_read, 64, riscv_timebase);
> +
> +	return error;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-riscv-time=
-mmio-v7-0-f8925ffc226b@htecgroup.com?part=3D3
