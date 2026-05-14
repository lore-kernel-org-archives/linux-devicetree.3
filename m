Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0CB397323
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793793; cv=none; b=rrYKSMfXGe6i6bixcKSc9axrwk0Ck+TqvwZT3qp3547Td7ooxHn/XP7QxrK2/x6I5Or7nMvPZsKR+gCsLPvHOLndSw1tm4l8h8iUNWu8qjKZVkKD6LC4WvP/Gh0ujUknytkhPVQFW/hxXyEEg8/ZDOP47nMEhFzFn1CTsFB5TOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793793; c=relaxed/simple;
	bh=QSJ68tQufrPqJTcM1WMEZGWFTD6Vrfn/cYLZrF1A7os=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HsTBqvAM+0YE991GfbEUqvnApNZJthZXpGCK6mOIYZUNBCf6d5L5+P0wUud1CLIJhihwAJzZhRjpdxcbc94ZN0B+TnS53xWu7hY2CgsZf1oI2f92Hx2B6vyKVSAxOw3uan82Gf/XINZrfebM0QdgwUEmpi0A7DJ3dOWjhv8f8RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltfgtHWY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltfgtHWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC29AC2BCB3;
	Thu, 14 May 2026 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778793793;
	bh=QSJ68tQufrPqJTcM1WMEZGWFTD6Vrfn/cYLZrF1A7os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ltfgtHWYHHJrx1HXhUHeCsWRyrq1fD4llkzYY2CxfwmTgtKt6h6gkAqdxEPdIZLHk
	 THIF5aluPWqCJ58+3RlNKg+rBRn8u+1bFR5VYdkBNvmHuowOjKfgxxW39qSFnsZNxr
	 a0KgRfSWMK7UO5dOeHA3cCbR+hsZ+d3b/Gzq5Y95UPUEq9FOeqM/XO/3Tl+GYpD0L4
	 QLzU4W4qLgO90iknxKPVYmN7h3GCoIaJXEUjr9Ri1MJirr3So/l18sx61be8wpCG/o
	 5sjIoWcKaFOv830TRU/VO0NhrZQnTgWN3mBRfnNcIV6qvZ65RrgJ+RjZWInsEEMUe3
	 x7fH4G45fHfTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/17] clocksource/drivers/arm_arch_timer: Default to
 EL2 virtual timer when running VHE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Zyngier" <maz@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514150945.3917510-4-maz@kernel.org>
References: <20260514150945.3917510-4-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:23:12 +0000
Message-Id: <20260514212312.BC29AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kvm_arch_ptp_get_crosststamp requests the physical counter from KV=
M when ARCH_TIMER_HYP_VIRT_PPI is used, conflicting with the virtual counte=
r clocksource.
--

commit 46b3cf01730c13b97527ab1495a76cb40a0bdad8
Author: Marc Zyngier <maz@kernel.org>

clocksource/drivers/arm_arch_timer: Default to EL2 virtual timer when runni=
ng VHE

This commit switches the arch timer code to default to the virtual timer
when running in VHE mode. It ensures that the system clocksource utilizes
the virtual counter by treating ARCH_TIMER_HYP_VIRT_PPI similarly to
ARCH_TIMER_VIRT_PPI.

> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/a=
rm_arch_timer.c
> index 90aeff44a2764..e3eb527650ec7 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c

[ ... ]

> @@ -912,7 +913,8 @@ static void __init arch_counter_register(void)
>  	int width;
> =20
>  	if ((IS_ENABLED(CONFIG_ARM64) && !is_hyp_mode_available()) ||
> -	    arch_timer_uses_ppi =3D=3D ARCH_TIMER_VIRT_PPI) {
> +	    arch_timer_uses_ppi =3D=3D ARCH_TIMER_VIRT_PPI ||
> +	    arch_timer_uses_ppi =3D=3D ARCH_TIMER_HYP_VIRT_PPI) {
>  		if (arch_timer_counter_has_wa()) {
>  			rd =3D arch_counter_get_cntvct_stable;
>  			scr =3D raw_counter_get_cntvct_stable;

Could this cause a mismatch in kvm_arch_ptp_get_crosststamp() where it still
only checks for ARCH_TIMER_VIRT_PPI?

When ARCH_TIMER_HYP_VIRT_PPI is selected, the clocksource is backed by the
virtual counter here, but kvm_arch_ptp_get_crosststamp() will fall through
to the else branch and request KVM_PTP_PHYS_COUNTER from KVM:

drivers/clocksource/arm_arch_timer.c:kvm_arch_ptp_get_crosststamp() {
	...
	if (arch_timer_uses_ppi =3D=3D ARCH_TIMER_VIRT_PPI)
		ptp_counter =3D KVM_PTP_VIRT_COUNTER;
	else
		ptp_counter =3D KVM_PTP_PHYS_COUNTER;
	...
}

When running as an L1 guest hypervisor in VHE mode, could this pair the
guest's virtual clocksource with the host's returned physical counter
timestamp?

Since the host hypervisor (L0) can apply an offset to the virtual counter,
comparing the guest's virtual counter cycle with the host's physical counter
timestamp might result in an incorrect time offset and affect PTP clock
synchronization for nested VHE guests.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514150945.3917=
510-1-maz@kernel.org?part=3D3
