Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17FC3DE429
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354503; cv=none; b=MZi4i1f4cWeIPky5qZn7O/ktFc9MU+QxE8gQs9j5+CQ+tQwvZ07m+p14MChfwUH2Tc7WogOANCxcDBRDt4JOgd6CBH+GoJyGp7Hisrk6e9/OC50PvWrkMTU/wFQxFIE1Y9E4rmH02AFRm1IqDuBsK8kaRj2i48qeZKhsNdgXd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354503; c=relaxed/simple;
	bh=mxXJ4Y2d397RTKz2lw4ZKQYuEMR+BXt9rxf81JVnGCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WTfg1LohFhHWNLQBWN6ZUINhP8QOEb0s5nAd84hNF50WWNzu5f9JD02hHBPEI2ixF4UNwD18qPWLH6UZ+0tqHcXIJyjBSsVqgpBCsRBtVEelRVYagt1JKbzTHH9LiETjimRtYBhNqFlDlpOOvEuD3EsGPqbhSROBgYbVJYN+/0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ky515B6C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ky515B6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073221F000E9;
	Sat, 13 Jun 2026 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781354502;
	bh=S931pEF2sMfFZNF9qmUDJeV6IDhmgbrFq1VE7v0/29k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ky515B6CDSfZxCNNiff51ihL/IQhUG4sCkkkp9JaxL6+ttZoJvrRm6z2SWUKlVCf5
	 +yAnl6KnVy658glaOcDmoh4IYaUl/NILNC++/ughvAKXWwl5269snE3QyEeMYzXTam
	 teWMymuRlKFFhwb8kNMF+kbhjviEY8QVZKfNpOA9gbmyZGnrDs18Rby8SyttwmIyQw
	 i5aMiRlSVuIz1sjin48OTTNBmWOpMsFA/jV5UMQAD1TF5zW33nQ1oToJ4jUk8rsFo3
	 m4ErWF0B2TDKzfuNJ34+/CbyxlEQ0V7z4VYXrMT8quzRxmL3shlTYvccWIf0JCIB8D
	 XkVVx8QWRhN/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Reply-To: sashiko-reviews@lists.linux.dev
To: "Denzeel Oliva" <wachiturroxd150@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
References: <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 12:41:41 +0000
Message-Id: <20260613124142.073221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Reordering a clock parent array (PNAME) to change the default cloc=
k parent falsifies the hardware register mapping.
--

commit 053886a8fb5adfd1285c3768f792e89fdc6baa21
Author: Denzeel Oliva <wachiturroxd150@gmail.com>

clk: samsung: exynos990: Fix PERIS gate clock parents

This commit corrects eight PERIS gate clock parents to match the hardware
clock tree. It also reorders the GIC mux parents to make mout_peris_bus_user
the default source.

> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/cl=
k-exynos990.c
> index ee3566b8e57c9..df5928833b232 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -2551,7 +2551,7 @@ static const unsigned long peris_clk_regs[] __initc=
onst =3D {
> =20
>  /* Parent clock list for CMU_PERIS muxes */
>  PNAME(mout_peris_bus_user_p)		=3D { "oscclk", "mout_cmu_peris_bus" };
> -PNAME(mout_peris_clk_peris_gic_p)	=3D { "oscclk", "mout_peris_bus_user" =
};
> +PNAME(mout_peris_clk_peris_gic_p)	=3D { "mout_peris_bus_user", "oscclk" =
};

[Severity: High]
Does reordering the mout_peris_clk_peris_gic_p array break the hardware
register mapping?

In the Exynos clock framework, the indices of the PNAME array correspond
directly to the hardware multiplexer register bit values (where index 0 maps
to register value 0). Reordering the array to change the default parent cou=
ld
cause the framework to write the wrong index to the mux register when
clk_set_parent() is called.

Should the default clock parent be configured using the assigned-clocks and
assigned-clock-parents properties in the Device Tree instead of modifying t=
he
driver's hardware description?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613-exynos990-=
peris-fix-v3-v3-0-2b230db78ae4@gmail.com?part=3D3
