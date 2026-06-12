Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F99E3769F7
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254503; cv=none; b=agNxzv9a+jMAnbpTjEBHXk7AME/dDNM1oM8xZjuBoG8GIf4WEJZT1/u0q8S/O6FZUAWHXXV0UGgRGE9Yk6UoThLVYy7zgdg5dkoNyZblKZuqqVd9BxmWE6kJwlhzQYN0QwTpJcbRV2WwnMoZ22Je7M/YkEG+U3/BX3A91+DVz7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254503; c=relaxed/simple;
	bh=5AIN8fqlSDZzGVc64qWlYm8eiPC0h/ghqyD+6JKAsC0=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NuZUXJLQz26nHPIrDmSUzyfY5c+SxiGU+b27kosaTCV9pyOVJGld5+GcqGeXODJqbHeNoW781lvO+OE7R4+Yj+Zt3CDeMGsxzsdg1FEAvvN9JMC82NTOM6/S4e6qDh13dRL85j1N2YbYCxeqO9xyRAD2UvlHGkbCqmOAybQ4rFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeIkI8zt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeIkI8zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFBB1F000E9;
	Fri, 12 Jun 2026 08:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254502;
	bh=vpR6gCKnULvcFlTDPK6i1/hCuf1nO+Gek7J6slMw8Xk=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=EeIkI8ztS1g0/jw1XzdVa13omMW0PIN05iekKiLQmoHEti7/BIXjieapKr/9ReqcR
	 oDmiEWZl37lRnqB4e5sP0wTNe8EXG+mxu7Eug5AJtZ6ZKMx2Y26znCyKUKefSxhxVZ
	 GJ6Q2WPcjSpED+ekNTYFrwv/lPFvgvP6/4e1jg0sAeucGEJu5VMvekOi+GPoXgyjpZ
	 qBqVLeglGanpBcGTtsV8Sr3aayJHohstG1mtdC3B2YxZZ0BuIq9gyCBAHdpYVCYlMG
	 VeCBoguySbtw0mKoGCu9KKw20L+8OH0mv0h/veeCZAV+AnD4G0i98D4W2yZrqCptIa
	 pgmGdD4OjGd5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/6] clk: Add KUnit tests for assigned-clock-sscs
Reply-To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
References: <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 08:55:01 +0000
Message-Id: <20260612085501.EEFBB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Extraneous `assigned-clock-sscs` properties injected into `u64` rat=
e test overlays without accompanying test assertions.
--

commit 210e00ec864807cd43e4b4e5dca8755417d9ee5a
Author: Peng Fan <peng.fan@nxp.com>
Subject: clk: Add KUnit tests for assigned-clock-sscs

This commit adds KUnit test coverage for the assigned-clock-sscs device tree
property. It extends the dummy clock framework to support spread spectrum
configuration and introduces a new test suite with several scenarios,
including single assignments, multiple assignments, and malformed DT
properties. It also adds new DT overlays for these test scenarios.

> diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso b/dri=
vers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
> index 389b4e2eb7f74..3a717dab2d00b 100644
> --- a/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
> +++ b/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
> @@ -12,5 +12,11 @@ clk: kunit-clock {
>  				  <&clk 1>;
>  		assigned-clock-rates-u64 =3D /bits/ 64 <ASSIGNED_RATES_0_RATE>,
>  					   /bits/ 64 <ASSIGNED_RATES_1_RATE>;
> +		assigned-clock-sscs =3D <ASSIGNED_SSCS_0_MODFREQ
> +				       ASSIGNED_SSCS_0_SPREAD
> +				       ASSIGNED_SSCS_0_METHOD>,
> +				      <ASSIGNED_SSCS_1_MODFREQ
> +				       ASSIGNED_SSCS_1_SPREAD
> +				       ASSIGNED_SSCS_1_METHOD>;

[Severity: Low]
Looking at the kunit-clock node in
drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso, are these
assigned-clock-sscs properties necessary in the u64 rate test overlays?

The test cases utilizing these overlays only verify rate assignments and do
not assert anything about the parsed SSCS state. Since dedicated SSCS test
overlays were added, it seems these additions might be extraneous.

>  	};
>  };

[ ... ]

> diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso b/drivers/=
clk/kunit_clk_assigned_rates_u64_one.dtso
> index 87041264e8f54..9b04d6927f083 100644
> --- a/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso
> +++ b/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso
> @@ -10,5 +10,8 @@ clk: kunit-clock {
>  		#clock-cells =3D <0>;
>  		assigned-clocks =3D <&clk>;
>  		assigned-clock-rates-u64 =3D /bits/ 64 <ASSIGNED_RATES_0_RATE>;
> +		assigned-clock-sscs =3D <ASSIGNED_SSCS_0_MODFREQ
> +				       ASSIGNED_SSCS_0_SPREAD
> +				       ASSIGNED_SSCS_0_METHOD>;

[Severity: Low]
Similar to the multiple overlay, is this property needed in the kunit-clock
node of drivers/clk/kunit_clk_assigned_rates_u64_one.dtso for the u64 tests?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-clk-v10-v1=
0-0-eb92484eda38@nxp.com?part=3D4
