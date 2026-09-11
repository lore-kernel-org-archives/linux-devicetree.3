Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6372369206
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122517; cv=none; b=ozeeMTQ7My4M0RPX5TCFsiyqNUDAEFGlclAX8pKFXxFaWIKm5j4E6ofoHuUZ1zm38Ho/Y4qDdRuYYm/WUbqeN97XY7YlUdvu3rJ0FQQHQAPYO3E3GhODBzUxmN/scMMqPvYZgQv2BQ9qDH12ChFoysky7Wj3IspugJkgm4E5kKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122517; c=relaxed/simple;
	bh=GM1PuozTLYc+z/2c8+lHMS5QELvWyWj89Z2WU0PFXsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M5HDalbHedlWA6JKQGR4KOsTKzQxbW5Kh1f8mASXrdSrtKEmzeZQLPAHkKXQpqYRDINkB2C5Z1l6lZ+w7V1RhFiCOLm0MaUuxjLJiWr9oC/Ly0L1D4Nw/DqXdrBkI46VRbUXsjC59SnHc76RSJXUPCmbZAWQG/wvJtQNaJ/90as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGiCu3jb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGiCu3jb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AA21F000FF;
	Fri, 11 Sep 2026 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789122515;
	bh=h/VeX4BuS4DtvV97f5MWXQ8gNGGKuVV9qTmsjDki7s4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGiCu3jbOhX7s5P87WwN9YtQPWlaA2+jTxpH1m+NvPsFP5vOPakS599FnKVBWn+19
	 0LOa4GGlrzmxZ/vUPnNj+/6rTzrOW+R/eSBVFw1vX9FxArmM8Kn0+RsrPt6VaNV1iD
	 2MgRt5DIrPyc8Rrr2fP9vbON4CmnZTY365SWRhm1O92u3wmChPeLg/u/6TOGQFr1sm
	 i3R1GgefH0eHwtiqWY7OGoWEwoN90wgqmBpV4KKrr4LtrrfeSsGslw6B2edAescpBt
	 1Cqa5KatLZrcg5mo2UsBhkZG/dR1deAMDrf/ewd/23gH0vKWAKrYZDKobHAWjkqISM
	 ydcS/VkHra9fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] arm64: dts: exynos5433: Re-order nodes to match
 coding style
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-8-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
 <20260911-b4-dts-samsung-cleanup-strict-continued-v1-8-9aa55051c42b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 10:28:34 +0000
Message-Id: <20260911102835.37AA21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Reordering device tree `cpu` nodes by unit-address changes the log=
ical CPU numbering, fragmenting cluster groupings and breaking userspace ex=
pectations.
--

commit 42e710983fc6263e0bd5798117a1ac4661f1ffa1
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: exynos5433: Re-order nodes to match coding style

This patch reorders nodes in the Exynos 5433 device tree to alphabetical or=
der
to comply with DT style checks. In doing so, it moves the Cortex-A57 cpu no=
des
to appear before the Cortex-A53 cpu nodes.

> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index d318c87effaa6..3e67d9091a191 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
[ ... ]
> @@ -90,136 +90,136 @@ core3 {
>  			};
>  		};
> =20
> -		cpu0: cpu@100 {
> +		cpu4: cpu@0 {
>  			device_type =3D "cpu";
> -			compatible =3D "arm,cortex-a53";
> +			compatible =3D "arm,cortex-a57";

[Severity: High]
Does reordering these nodes by unit-address change the logical CPU numbering
and fragment the cluster groupings?

During boot, arch/arm64/kernel/smp.c:of_parse_and_init_cpus() iterates thro=
ugh
the CPU nodes in the exact order they appear in the device tree. The boot C=
PU
(A53 cpu@100) always receives logical ID 0.

Before this patch, the A53 nodes appeared first, yielding contiguous logical
IDs 0-3 for the A53 cores and 4-7 for the A57 cores.

Because this patch moves the A57 nodes (cpu@0 through cpu@3) before the
remaining A53 nodes, the kernel will assign logical IDs 1-4 to the A57 cores
and 5-7 to the remaining A53 cores.

Could this fragment the logical clusters into A53: 0, 5, 6, 7 and A57:
1, 2, 3, 4, breaking userspace expectations (like thermal daemons or taskset
configurations) that expect logical CPUs 0-3 to be the little cores and 4-7=
 to
be the big cores?

>  			enable-method =3D "psci";
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-b4-dts-sam=
sung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com?part=3D8
