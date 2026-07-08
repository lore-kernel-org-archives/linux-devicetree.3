Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33EC3B19A6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496919; cv=none; b=Bo7Ta8wcK7Ge9dmxLBmQlRcAPEEya1/cbPQ1X+CsiqJw7Kt6eFYQVcPv6bsVXOe6cf9ufW7YBomAoiL6arxI5YnqAp7n4nZ+E8BaS8guG1Zm2IpUH54RrkZtH0iqfDBzNieS+9rCXnKccgYzEP+Brp+TaiflC7Sy/AfOR4ytV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496919; c=relaxed/simple;
	bh=q6ZNRg2Wd7Lb9+CYgyFrXm8ulQE0tjylf6bOXGXoIdc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jOWFFO/YRqJLVaiI1jfMNZI/Op2njxgITtLUyqpWOLm1igxqwl+bfLeNKS1YEJ4iZ6d9PcMX0CZEwKFkJKtq2v6iyCKNh+Rp1lXt101F3ViqwXBOKgSZ0HKmYe0ZHeqTUV52TFQKOiTLNMAt5PyTl6pIO0nMAp/pHyySZesCEA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsFbndgK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsFbndgK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513321F000E9;
	Wed,  8 Jul 2026 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783496911;
	bh=6R0ohoShz5t7WS+leKWUSx3Qt3mq6S3G6P5Qs99u+YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EsFbndgKCVK/q9mCSua+/zuhdQw9D2kxqrb6iv7UuXZIbHhw7WYXnHQdcRLCnb4+k
	 0xp3gTlzkJ6c7P31eCcLqUFNN6YzcL44fobSVgDosPZ1srCza0nrAfjD734+NwLSpi
	 oZTvgf+uvUCsQ68jzHehVFBlOAfg129ZDod/uQg/AlpVTEEu0aKBV/VOzvgt5cu9q1
	 tGKVO+8FAiBHQX9QegztBpbg9fjSWA+hXowMe6mohl9z7CgNs37TL+E6UPyHAYG9/C
	 tzCwsD+CHZw8SwEy+dSiJrmrSCrBLrdYmaGcqAQuPMARhWCMCKlD3WOFCIXjHmQ2+z
	 Y6M+py1sumPkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 6/6] arm64: dts: apple: t8103: Add PSCI and CPU idle
 states
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-efi-psci-v1-6-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <20260708-efi-psci-v1-6-9efb3abf0e4c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:48:29 +0000
Message-Id: <20260708074830.513321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] State leak (preempt_count) and corruption (saved_ttbr0) in `arm64_=
efi_psci_call` during CPU/System suspend.

Pre-existing issues:
- [High] Missing Context Synchronization Events (ISB) after writes to contr=
ol-plane system registers in user access helpers.
--

--- Patch [6]: [PATCH RFC 6/6] arm64: dts: apple: t8103: Add PSCI and CPU i=
dle states ---
commit 4618cadb25b8f3f6d74cc463901a493df3b5128c
Author: Sven Peter <sven@kernel.org>

arm64: dts: apple: t8103: Add PSCI and CPU idle states
   =20
Switch the base M1 from spin-table to PSCI and also add two basic idle
states that we support for now.

> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi

[ ... ]

> @@ -185,6 +198,28 @@ l2_cache_1: l2-cache-1 {
>  			cache-unified;
>  			cache-size =3D <0xc00000>;
>  		};
> +
> +		idle-states {
> +			entry-method =3D "psci";
> +
> +			cpu_retention_wfi: cpu-retention-wfi {
> +				compatible =3D "arm,idle-state";
> +				idle-state-name =3D "wfi";
> +				arm,psci-suspend-param =3D <0x00000000>;
> +				entry-latency-us =3D <1>;
> +				exit-latency-us =3D <1>;
> +				min-residency-us =3D <1>;
> +			};
> +
> +			cpu_deep_wfi: cpu-deep-wfi {
> +				compatible =3D "arm,idle-state";
> +				idle-state-name =3D "deep-wfi";
> +				arm,psci-suspend-param =3D <0x00000001>;
> +				entry-latency-us =3D <5>;
> +				exit-latency-us =3D <5>;
> +				min-residency-us =3D <10000>;
> +			};

[Severity: High]
Does adding this deep suspend state expose a state leak in the EFI PSCI
wrapper?

When the CPU enters deep sleep via CPU_SUSPEND or SYSTEM_SUSPEND, it uses
psci_suspend_finisher which invokes arm64_efi_psci_call() in
arch/arm64/kernel/efi.c. This wrapper calls efi_virtmap_load() (which
disables preemption and swaps ttbr0 to efi_mm) and uaccess_ttbr0_enable().

On success, the firmware powers down the CPU and never returns to the caller
of arm64_efi_psci_call(). Upon waking, the hardware resumes execution at
pa_cpu_resume, restoring the pre-suspend CPU registers and returning direct=
ly
to cpu_suspend().

Since the return path of arm64_efi_psci_call() is bypassed,
uaccess_ttbr0_disable() and efi_virtmap_unload() are never executed. Can th=
is
leak the preempt_count increment and leave the saved_ttbr0 page table
reference corrupted, leading to scheduling-while-atomic panics or deadlocks
upon resume?


[Severity: High]
This is a pre-existing issue, but the EFI PSCI path used by this idle state
relies on __uaccess_ttbr0_enable() and __uaccess_ttbr0_disable() in
arch/arm64/include/asm/uaccess.h, which appear to be missing required
synchronization.

In __uaccess_ttbr0_disable(), the code performs sequential writes to control
plane registers without an intervening isb():

    write_sysreg(ttbr - RESERVED_SWAPPER_OFFSET, ttbr0_el1);
    /* Set reserved ASID */
    write_sysreg(ttbr, ttbr1_el1);
    isb();

Similarly, __uaccess_ttbr0_enable() writes to ttbr1_el1 and ttbr0_el1
sequentially before the isb().

Architectural rules require an isb() immediately after each write to a
control-plane system register before any subsequent write or read-back. Does
the lack of an intervening isb() here force the pipeline to observe
architecturally undefined state?

> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-efi-psci-v=
1-0-9efb3abf0e4c@kernel.org?part=3D6
