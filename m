Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C36313E30
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779991313; cv=none; b=lZILA7+AX+5nYM0Y9nEcpCOoIz/6fq8kZt49NRdIoStTQk5IaoEp91rf2+k0wxSXFlMaTy8xl8aVP4i6zIizFml6JECHapcgWY/g1QS0jH9X4NiNC0gJVywqUviKOwFKwW2bp+G3aGJ2cUDFpJpXzj9e+E82WB3lMJKRDm69Y0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779991313; c=relaxed/simple;
	bh=ENntxdKLEkxmkad2GmE//ws+F2+O7i19ytCBXN58xcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UXCtvvqiTKjYrsgGHgC2Z1Qq86iiVKg8MGHTm9cMSzz2NcZv0ZLPGNKLVUWFbdTsU76aeRjveQdPq6rSNcJxIa39cpee8w+/89exAqwRHnO9Ej5qezPmDKYtfw96dz20ANNbs4BWGKTYEWCrpKNtS7bYAI43w206hI6pzIINGr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuXfg6P9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuXfg6P9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541CB1F000E9;
	Thu, 28 May 2026 18:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779991311;
	bh=P05Zekml6cGZvqPn17PsUbAnAjWKkFzZbRJptfWhkHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AuXfg6P9q3FwtQL3qPUWbREeXWqalykPkXNUDzEnsJwikCz9P9eV+4mdlpgsyroCe
	 xLWfV4888fbHDz8a550dzmqP6R2JZm8FHWbJTCiGbwTVsQLdNXa1d3mrjvN9fFWree
	 RrY/cLKpJB7w6DR6Fd6IG8g7qWt/VS/AypWr+/67TWlAKooQmQNav8ugjSHSkpwsWZ
	 S79O/5VBMz2Q0R9xMZkjNRG3JkLWsHFBuS4vHkjLwrP6LKL7qyJGhLTk7k0gYB7ZPc
	 +VFo0VDjiA3D58RMY0APb46iVFsrAqCkflr65KrGgXYp4Bgszjrr9HZ2oARoI2TguF
	 9wjvNxQXXHr2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH PARTIAL-RESEND v3 2/3] power: reset: sc27xx: Add
 platform_device_id table
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528-sc27xx-mfd-cells-v3-2-25cd685d2743@abscue.de>
References: <20260528-sc27xx-mfd-cells-v3-2-25cd685d2743@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 18:01:50 +0000
Message-Id: <20260528180151.541CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing Module Remove / Use-After-Free
- [High] Atomic Context Violation / Deadlock
- [High] Broken Logic / Deadlock Risk in CPU Shutdown
--

commit ddb1fd2073d7578736ac515089bb37af98d9e3d9
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
Subject: power: reset: sc27xx: Add platform_device_id table

This patch modifies the sc27xx-poweroff driver to use a platform_device_id
table instead of an of_device_id table. This allows the driver to probe
automatically when instantiated as a sub-device by the parent MFD driver.

Link: https://lore.kernel.org/all/20251002025344.GA2958334-robh@kernel.org/

> --- a/drivers/power/reset/sc27xx-poweroff.c
> +++ b/drivers/power/reset/sc27xx-poweroff.c

[ ... ]

>  	if (!regmap)
>  		return -ENODEV;
> =20
>  	pm_power_off =3D sc27xx_poweroff_do_poweroff;

[Severity: High]
This is a pre-existing issue, but does the poweroff callback sleep while
executing in atomic context?

The architecture-level machine_power_off() function disables local interrup=
ts
and stops all other CPUs before invoking pm_power_off(). However, if the
SPI-backed regmap executes spi_sync() which waits on an asynchronous
completion, won't wait_for_completion() hang forever since the SPI completi=
on
interrupt can never fire?

>  	register_syscore(&poweroff_syscore);

[Severity: High]
This isn't a bug introduced by this patch, but does the syscore shutdown
callback actually offline the CPUs?

The sc27xx_poweroff_shutdown() syscore callback attempts to offline all oth=
er
CPUs by calling remove_cpu(). However, in kernel_power_off(),
migrate_to_reboot_cpu() disables CPU hotplugging before syscore_shutdown()
runs.

Will this cause remove_cpu() to instantly fail with -EBUSY?

>  	return 0;
>  }
> =20
> +static const struct platform_device_id sc27xx_poweroff_id_table[] =3D {
> +	{ "sc2731-poweroff" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, sc27xx_poweroff_id_table);
> +
>  static struct platform_driver sc27xx_poweroff_driver =3D {
>  	.probe =3D sc27xx_poweroff_probe,
>  	.driver =3D {
>  		.name =3D "sc27xx-poweroff",
>  	},
> +	.id_table =3D sc27xx_poweroff_id_table,
>  };
>  module_platform_driver(sc27xx_poweroff_driver);

[Severity: High]
This is a pre-existing issue, but can unloading this module cause a
use-after-free?

The driver registers a global function pointer (pm_power_off), adds
poweroff_syscore to the global syscore_list, and caches regmap globally
during probe.

Since the driver uses module_platform_driver and lacks a .remove callback,
wouldn't unloading the module leave these global structures pointing to
freed memory? A subsequent system power-off or syscore traversal might then
execute unmapped memory, and rebinding the device would also fail because
regmap remains non-NULL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-sc27xx-mfd=
-cells-v3-0-25cd685d2743@abscue.de?part=3D2
