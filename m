Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A772C1595
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371073; cv=none; b=t6ll0zv/ee3D9pKFCd2xsyD8UNr2N+oqGJAIRuYLsc33VuW0XoVY8eJ7C7SY0AroHDDu0hXnoPNRPi5at4fdt6LPHo6qON5EL4M+W4SKPNaByFz9Gn3Pxj76pILB6865F9Pv3gMYUjvlB8dRsFZQftqlEOSlOdzFuhp7QwpzqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371073; c=relaxed/simple;
	bh=ClnSy/OHoFAdCG7n8SYbmsK2TUTcbYBti3P/gnO9JXw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KDnSe+G9sCU2wPyKbkxHiLr9wkPa9Fjy2wzl0FIR0d7ioMHzaDxdRtKdewVJUN42PWU+ZGLCO897lfscfai3njye3a8/Y1sRx8zhYZ3hR9LnmBScJGHcT5Ccwm+3V4dEaBssXglnX2JIeJuMjBK1snxsKHSqTTya5wEhWl4DpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVXGMiz5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVXGMiz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B151F1F01559;
	Thu, 25 Jun 2026 07:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782371070;
	bh=tFWX8PBJelrLHRphbkgpDZhUjsCQO0mTiSy+aTAOC3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kVXGMiz5bcRLey5rsgrnCZ75iHjhvArU0nsul6cRboG443PSZzMbE2ru3RltjCAmY
	 apw9IwXODFxonsdRXt2FezFFQErnQoP9q5wlG3PaIpjl0ybPkbeOdDuOiF1IG+b6Ik
	 39m8mTkTptPVDa3oZe7XK30lVIJwLBwYaxKt4ObDyMm/CCVWILdnYsb7bV7YvoRA4t
	 jixE85UhebpxEqpABfXdtoSP5kRUQG6tFu65KF1qczslizaqzA4iBo3WFycEQuozGe
	 J9FOf/Kn0A31fNdDfB+lhc9Ger64lCT5r8JENw63rvRpcJuKupyDKTV7Y/KEvOu5uW
	 JNYpYcqYModVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: socfpga: agilex72: Add initial
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625065329.20274-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260625065329.20274-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260625065329.20274-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 07:04:29 +0000
Message-Id: <20260625070429.B151F1F01559@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing CPU topology and relative capacity metrics (`capacity-dm=
ips-mhz`) for the heterogeneous Cortex-A520/A720 cluster.
- [Medium] Malformed reserved-memory nodes for firmware regions mixing stat=
ic and dynamic properties, and improperly exposing secure memory as a DMA p=
ool.
--

commit 24c23f8ecc00caa97660929277c73ae2d495bf92
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: agilex72: Add initial device tree

This commit adds initial device tree support for the Intel SoCFPGA Agilex72
platform. The Agilex72 SoC features a heterogeneous CPU cluster with
Cortex-A520 and Cortex-A720 cores, and includes an SMMU v3 for memory
management.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi b/arch/arm64=
/boot/dts/intel/socfpga_agilex72.dtsi
> new file mode 100644
> index 0000000000000..c29c2afcaab70
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
> @@ -0,0 +1,156 @@
[ ... ]
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		atf_reserved: atf@80000000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x80000000 0x0 0x100000>;
> +			alignment =3D <0x1000>;
> +			no-map;
> +		};

[Severity: Medium]
Does this node improperly mix static and dynamic allocation properties?

The reg property implies static allocation, while alignment is for
dynamic allocation, and according to the bindings, these are mutually
exclusive.

Also, should ATF memory be exposed as a shared-dma-pool? Secure firmware
memory generally shouldn't be exposed as a pool for the kernel's DMA
subsystem to manage, as it could lead to exceptions if the non-secure kernel
attempts to map or allocate from it.

> +
> +		service_reserved: svcbuffer@80100000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x80100000 0x0 0xf00000>;
> +			alignment =3D <0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a520";
> +			device_type =3D "cpu";
> +			enable-method =3D "psci";
> +			reg =3D <0x0>;
> +		};

[Severity: Medium]
Will the scheduler treat these heterogeneous cores as having equal compute
capacity?

Without a cpu-map topology and capacity-dmips-mhz properties, the Linux
scheduler may default to treating the Cortex-A520 and Cortex-A720 cores
as having equal capacity.

This could lead to suboptimal task placement for the big.LITTLE
architecture.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625065329.2027=
4-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2
