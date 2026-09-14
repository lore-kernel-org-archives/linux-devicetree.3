Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A3E329C7C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354728; cv=none; b=mUfG+odqQpEJ2shBzatijuvNhTLrrMIEVa1CoHtqZEQ0+uqcPMqEbzifB8vDjN/G9A087EIkk/pzeg8AC7RkkNzSO1dEjfIGcdPnKjGSMdesOrs8tWyscUe+F02/goMtvmSV2I0+S9bRK8oGm0tBoCmWzwnf1G1wf+jp1yJz2Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354728; c=relaxed/simple;
	bh=M+f18F9EdxME+ICWE7c/LEEkxiYxAKB4yWofEVizozc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D3TjrCaOcu0C1ahLtCZNz69o552r9v6W/FMlNzxKiiH81TO24CwQ1ML4aZLscm6nWYdRF4YHkkLO34/1ly85KKzTR8LvkIbruS6liuWROxAREL+hHOdz60vPNRwOWvnZ1KD3ruDZL+jcFmLggs9og7sbIK5x4vxYDci/JSF3dNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJfWEXCQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJfWEXCQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508551F000FF;
	Mon, 14 Sep 2026 02:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789354726;
	bh=jUN70HPt0CS6+aM+FxKhZpM6d7IsbX531D1vD8UMczI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJfWEXCQmGH+FXukfR30cpyocKKKd72XnS4PIkHLgJO1PF4bFPCVn7AL/mKHNBZMV
	 XiNaZg+opcShYkmjkc00glgUiY043DqwvtGvvufbvvWJFKuQp/Ixu+fxuQS/ks40Yj
	 Oi+YXHsNs3wviqpSUXXEKgQfMOG5tDtEWm6SaLBa8sh9hqkdqF1Fh1LJlLBtPOZq80
	 FDSacwCsGrRaQobCdYk8KwRgr+x6YIwNmMf2NcBWL4c2mE7IsKpusoEAt4UFFxH0u9
	 BCsWE7yOU9SoWBf4Bs21TBhRwh6Ii9OXtAJmrOT5R9qdR24fmf2BWfDVh01vJfNmva
	 9pyWCJRHAh5JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: socfpga: agilex: add Agilex7F SoCDK
 multi-QSPI board
Reply-To: sashiko-reviews@lists.linux.dev
To: genevieve.chan@altera.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914025052.14354-3-genevieve.chan@altera.com>
References: <20260914025052.14354-1-genevieve.chan@altera.com>
 <20260914025052.14354-3-genevieve.chan@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 02:58:45 +0000
Message-Id: <20260914025846.508551F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Duplicate MTD partition labels across multiple QSPI flashes will=
 cause naming collisions.
- [Low] Incorrect alphabetical sorting in the Makefile.
--

commit 43a050c9384cc9ad44970b1e567a46311025cd69
Author: Genevieve Chan <genevieve.chan@altera.com>

arm64: dts: socfpga: agilex: add Agilex7F SoCDK multi-QSPI board

This patch adds a board device tree for the Agilex7F SoCDK with multi-QSPI
support. It describes four Micron MT25QU02G flashes on chip selects 0-3 bas=
ed
on the socfpga_agilex.dtsi include.

> diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/int=
el/Makefile
> index 270c70fdf084b..9298ab8b93142 100644
> --- a/arch/arm64/boot/dts/intel/Makefile
> +++ b/arch/arm64/boot/dts/intel/Makefile
> @@ -10,5 +10,6 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D socfpga_agilex_n6=
000.dtb \
>  				socfpga_agilex5_socdk_nand.dtb \
>  				socfpga_agilex72_socdk.dtb \
>  				socfpga_agilex7m_socdk.dtb \
> +				socfpga_agilex7f_socdk_multiqspi.dtb \

[Severity: Low]
Does this Makefile addition break alphabetical sorting?

The new entry socfpga_agilex7f_socdk_multiqspi.dtb under=20
dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) is inserted after socfpga_agilex7m_socdk.d=
tb,
rather than before it.

>  				socfpga_n5x_socdk.dtb
>  dtb-$(CONFIG_ARCH_KEEMBAY) +=3D keembay-evm.dtb

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_multiqspi.d=
ts b/arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_multiqspi.dts
> new file mode 100644
> index 0000000000000..7d444a84fd67a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_multiqspi.dts

[ ... ]

> +	flash@0 {
> +		compatible =3D "micron,mt25qu02g", "jedec,spi-nor";
> +		reg =3D <0>;

[ ... ]

> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			qspi_boot0: partition@0 {
> +				label =3D "Boot and fpga data";
> +				reg =3D <0x0 0x10000000>;
> +			};
> +		};
> +	};
> +
> +	flash@1 {
> +		compatible =3D "micron,mt25qu02g", "jedec,spi-nor";
> +		reg =3D <1>;

[ ... ]

> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			qspi_boot1: partition@0 {
> +				label =3D "Boot and fpga data";

[Severity: Medium]
Will these duplicate partition labels cause naming collisions in the MTD
subsystem?

Since the device tree parses these four partitions (qspi_boot0 through
qspi_boot3) and registers them with the exact same label ("Boot and fpga
data") for flash@0 through flash@3, they will create duplicate MTD
partition names in the kernel (e.g., in /proc/mtd).

Userspace tools like mtd-utils that rely on finding MTD partitions by name
might be unable to distinguish between the physical chips. Could this lead
to data corruption if the wrong flash is updated?

> +				reg =3D <0x0 0x10000000>;
> +			};
> +		};
> +	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914025052.1435=
4-1-genevieve.chan@altera.com?part=3D2
