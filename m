Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64927434994
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145532; cv=none; b=r0xWt9EPelwsy+vdPSIZJoEsQnoVyjqNqp7D/nvGOMYnRLhvv5pZl1MDbE421I5O155DHBGJDemQ6PMzvuHOXt5LQfP9EA+zUFu/mxvqqJDxWDfATj9AC52hdLVFb92Pqui+qREUNexPy2HHdpSQeUOk/CDi0xYs/mVYpgRSBtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145532; c=relaxed/simple;
	bh=owzQsOXehJxIAsEAyOPE90XJOW8YyWdQMNkAdh+YYFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lx46LWloYnShs9oEkPdtzSZvyAZzg8IpXVvKLKrhtg6OB1Z2KEdVuwcalMy8TVoczKAnhg/DzpXglczlwRlM+vOhl43VFMqOAD7825OILOjRfcNCGfE1C0IyYJ6rsdOvItANDXc20uvIg7+cG4v7Utze/C9kEcqCoGqR6F/BsO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nw9A0XTp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nw9A0XTp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CE11F000FF;
	Sun,  4 Oct 2026 20:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791145531;
	bh=HTu4fq2LoeS5aFXZ+BwihQuwbeWy6ULImsmWdHgV4KA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nw9A0XTpJEK3wdSEr9MrU7mR9nJ83A5fUIjXtQgDzhmvTAfRzi4vActXf/YAaobZj
	 p+9BjFxqXMx6daKKzj7uNL2yr8/58tmlpuz66nuIxDhxB0k2Xm7TTrBORH0nFQZ36l
	 FdctaJfUi6el4RcpHWTeQZ5Hzt44L8uBzYbu1t+UU+dWODHKCX/AD96U2IQ9SxXHXN
	 nYggHUCdRgdt5QLGTb3MlRv2pGYkAXY0tINptfGk75yOV4PyOHO7PON43Ig4SWC0J4
	 QKQ6QzTyumjU1YRnd41uvaJQ6p6/MMZW9woNRRKvQTewyHv6GyVDqSLJfjHIfrLUWs
	 RnZc731mWSEZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/17] ARM: dts: samsung: exynos4210: use
 operating-points-v2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Henrik Grimler" <henrik.grimler@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261004-exynos-arm-cleanup-v1-8-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
 <20261004-exynos-arm-cleanup-v1-8-45e435353c56@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 20:25:30 +0000
Message-Id: <20261004202530.B1CE11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: missing opp-shared property causes conflicting cpufreq polici=
es
--

commit fcba4068b9646df5bfbec161d06e3521379f32ed
Author: Henrik Grimler <henrik.grimler@axis.com>

ARM: dts: samsung: exynos4210: use operating-points-v2

This commit updates the exynos4210 device tree to use operating-points-v2
instead of the deprecated operating-points (v1) format. This resolves dt-ch=
eck
style warnings about continuation-alignment.

> diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dt=
s/samsung/exynos4210.dtsi
> index d37ac0c97dbcf..4981bbb7cf311 100644
> --- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi

[ ... ]

> @@ -263,6 +247,46 @@ opp-200000000 {
>  		};
>  	};
> =20
> +	cpu_opp_table: opp-table-1 {
> +		compatible =3D "operating-points-v2";
> +

[Severity: High]
Does this new node need the opp-shared property?

CPU0 and CPU1 on this device share the CLK_ARM_CLK clock. When migrating to
operating-points-v2, the OPP framework relies on the opp-shared property to
know whether CPUs share the same clock line and therefore need a unified
cpufreq policy.

Without this property, the framework assumes the CPUs do not share the tabl=
e:

drivers/opp/of.c:dev_pm_opp_of_get_sharing_cpus() {
    ...
    /* OPPs are shared ? */
    if (!of_property_read_bool(np, "opp-shared"))
        return 0;
    ...
}

Because the legacy v1 fallback logic is bypassed for v2 nodes, the cpufreq
driver will create independent policies and governors for CPU0 and CPU1.=20

Since the cores share the same physical clock line, will this lead to the
independent governors issuing conflicting clk_set_rate requests, potentially
causing chaotic frequency switching and instability?

> +		opp-200000000 {
> +			opp-hz =3D /bits/ 64 <200000000>;
> +			opp-microvolt =3D <950000>;
> +			clock-latency-ns =3D <160000>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-exynos-arm=
-cleanup-v1-0-45e435353c56@axis.com?part=3D8
