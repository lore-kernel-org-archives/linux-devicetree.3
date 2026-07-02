Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A062E54B6
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024874; cv=none; b=D6aeZhpc3VjDG2MXyVSpCiHXlH8NZh5XfPx8BKKdBl4+WYjuhkMi57urJf5EV5NDje79ehdfKHfjpoWJhkcsS9CsJl5XtsVhvYjX7hlw01GGXtb7vcROweVhZ1R4laRIS12fw1xPIiBP+/jqC9aRysF13e5mDJOZde2PSxVSJuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024874; c=relaxed/simple;
	bh=4eQ1/IU0eTL5LtVIWHHhNZt7lYvfo9gSEn02EEHvxYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I/sDpETOYWSAn700yeWe6F7yKnGNEIsN6m18nYLWpeeGhtfdA6oJSHOgyl2vuw+bQ+6hslaAtdWwWcft9/RAWl5eLk51qoNlQWclImLF4JFXxqxSD5ccfiJCXUyyJc9On+4z91oueKbuAHKbtV4m3bV7bYfd0EqcZ/JnBA4g1tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrrG+UCK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrrG+UCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478D31F000E9;
	Thu,  2 Jul 2026 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783024873;
	bh=e+EwLlsqtkqHFsdM1rHa7zT5lBvK0C+YFZhVWoR7H/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hrrG+UCKL/gwr8Lza0np8vYPB8PLDSLSDwRXC4x+eZspcBax6CcvCXu9d6/vtr8wW
	 5hjJxdGyEoJ/QPvzDy9kz8P1ioxOv7LnyaDeGZbPdv8Gn/8wVxk3czBTo+Azjn8AWj
	 d+ujnxuC9wA72vwICOwlId1XC79XWU3Cp70Yp7E8lRhQe6jHrddOOsiimo9vMB6KO0
	 Vc55SLG2Ft/dG3yFyZ4BV4VDY6i5nnd3O6fk3MMgqicxG9buMHPEgG7V+NEdlnD4ny
	 Y9qhkBDV6hcKRblieGrrQ6vFJnaRLfDmxjpd+V1Wsr+qi86tBv/4cPfgVY7wCg56z0
	 IWUP2wqph/b1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702-zx29clk-v6-8-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-8-377b704f80c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 20:41:12 +0000
Message-Id: <20260702204113.478D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The PLLs `unknownpll` and `dpll` will be improperly orphaned by =
the common clock framework if the hardware boots with alternate parent indi=
ces.
--

commit b48ea22652716b42ff4252581eeabf1b55dc958b
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 top clocks

This commit introduces a driver for the ZTE zx297520v3 top clock
register space. It provides clock control for core devices including
PLLs, the AHB bus, timers, and the USB controller.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..6fc98f98cf9c8
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> +static const char * const dpll_parents[] =3D {
> +	"unknownpll_d2",
> +	"osc26m",
> +};

[Severity: Medium]
The comment further below for dpll mentions it accepts parent values 0, 1, =
2,
and 3. If the bootloader leaves the hardware configured to use parent index=
 2
or 3, will the common clock framework treat this as an out-of-bounds index =
and
orphan the clock?=20

If CCF treats it as orphaned, the parent rate passed to the recalc_rate hook
will be 0, leading to a 0 Hz clock rate for dpll and all its descendants.
Could we expand this array to include the alias parents to prevent this?

[ ... ]
> +	/* Default value 0x4834902d. Feeds dpll. 46.08 MHz. Bit 25 can be set, =
so two parents are
> +	 * possible. It looks like both values select the 26 MHz oscillator tho=
ugh.
> +	 */
> +	{
> +		.id =3D 0,
> +		.name =3D "unknownpll",
> +		.parents =3D clk_main,
> +		.num_parents =3D ARRAY_SIZE(clk_main),

[Severity: Medium]
Since clk_main only has one entry, num_parents will be 1. If bit 25 is set =
by
the bootloader, the hardware could return parent index 1.=20

Would that cause the same CCF orphaning issue here, where an out-of-bounds
index results in a 0 Hz calculated rate for unknownpll and dependent device=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-zx29clk-v6=
-0-377b704f80c4@gmail.com?part=3D8
