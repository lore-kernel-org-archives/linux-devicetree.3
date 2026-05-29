Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66698366DB4
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066751; cv=none; b=duULU+ViRTiw61xK5H0+rp+k+YWeRoSfHpuA1ZKkWrJ2vFShS8Idqb2L6H5an18MC9H06NoI0G582EHihAh+AuxwIx0R78p7MPCoHK1T887LnTa0JG9zahIU7NET2BzQL4sZ1lVjnJRRC+zWjA0Vph9ns8FBa/HTWsu5mJVb0Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066751; c=relaxed/simple;
	bh=P5zhO9i+2OJiBk9hcHZftkjk49FMNVG1+13spVIdT1E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IJzJY9gfvEF4FE9BPuhQCXN8S7L8W+2XR3xNYJZpZzEkqY+U7zopAWID1jy2ZB3G7WErRkprMr64bAYzTrYyWADTiRMh/UZFBkVwWFMYCM7qFczY8Evc+WnbzLGw9kzGlOsbdQ3GaxZSJPvRJD9zNngF6f/8m8GtJNWz4LkPBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rq4iW622; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rq4iW622"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA681F00893;
	Fri, 29 May 2026 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780066750;
	bh=2MNdCNZjjpzBCFFTIgJ7Y7BdpUO1WMOh18yjcVSFT+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rq4iW622OWHiE850iny+S5g7UY439H3LsUFwbI60oTr6rNr2PuF0EPvSkOPq7CPKP
	 okASQKsQsJo0ZKMhnRh4YFcoSfY2UdlvfawA8T2ujvTkWt8CUeUSxxjT094tXb7gl/
	 MHDdDJ/hZuYDKMB4oF/H1Ifnq6NFDL8KcUBWn7JLAd9v29Z9FnxNhnxOmpOndtSbJu
	 McdU5mn5b3/nsUHWV2eASkJhsBZZWV+DRz+Cc55HkRm38zLtxp78l7cjcfTGM3RHuo
	 pk9ZEGXNwooIoRUjEb6iWdorCyVB0070jmJ1vT0C2WBKjLnEAcUdeUJyURbK6uIAL8
	 BgE212GMmoXRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: zynqmp: Switch Versal NET to firmware
 clock interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <60222042a1c46d28b9c00a8128d270937f97d997.1780063921.git.michal.simek@amd.com>
References: <60222042a1c46d28b9c00a8128d270937f97d997.1780063921.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:59:09 +0000
Message-Id: <20260529145909.BDA681F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect clock identifier assignments for GEM (Ethernet) controll=
ers due to using legacy Versal IDs instead of the new Versal NET macros.
- [High] Untested power-management node introduces a fatal hardware interru=
pt collision.
- [Medium] Missing `resets` properties for standard peripherals despite add=
ing full reset controller bindings.
--

commit 0cc079ca7fe5612fdd8dc6e417a47204046c354d
Author: Michal Simek <michal.simek@amd.com>

arm64: zynqmp: Switch Versal NET to firmware clock interface

This commit switches Versal NET from using fixed clocks to the firmware-bas=
ed
CCF clock interface. It also adds device tree macro headers for Versal NET
and base Versal clocks, power domains, and resets that are required by the
CCF clock dtsi.

> diff --git a/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi b/arch/arm64/=
boot/dts/xilinx/versal-net-clk.dtsi
> index b7a8a1a512cbd..dead487539cde 100644
> --- a/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi

[ ... ]

> +	firmware {
> +		versal_net_firmware: versal-net-firmware {
> +			compatible =3D "xlnx,versal-net-firmware", "xlnx,versal-firmware";
> +			bootph-all;
> +			method =3D "smc";
> +			#power-domain-cells =3D <1>;
> +
> +			versal_net_reset: reset-controller {
> +				compatible =3D "xlnx,versal-net-reset";
> +				#reset-cells =3D <1>;
> +			};
> +
> +			versal_net_clk: clock-controller {
> +				bootph-all;
> +				#clock-cells =3D <1>;
> +				compatible =3D "xlnx,versal-net-clk", "xlnx,versal-clk";
> +				clocks =3D <&ref_clk>, <&ref_clk>, <&ref_clk>;
> +				clock-names =3D "ref", "pl_alt_ref", "alt_ref";
> +			};
> +
> +			versal_net_power: power-management { /* untested */
> +				compatible =3D "xlnx,zynqmp-power";
> +				interrupt-parent =3D <&gic>;
> +				interrupts =3D <0 57 4>;

[Severity: High]
Will this interrupt assignment cause a probe failure?

The interrupts property here is identically claimed by the zynqmp-ipi node
below.

Looking at the power driver (drivers/soc/xilinx/zynqmp_power.c), it
requests this interrupt via devm_request_threaded_irq() without the
IRQF_SHARED flag, while the IPI mailbox driver uses IRQF_SHARED.

Because the flags mismatch and IRQF_SHARED is missing from the power driver,
the second driver to initialize will fail, which could break either system
power management or critical IPI communication.

> +				mboxes =3D <&ipi_mailbox_pmu1 0>,
> +					 <&ipi_mailbox_pmu1 1>;
> +				mbox-names =3D "tx", "rx";
> +			};
> +		};
>  	};
> =20
> -	clk200: clk200 {

[ ... ]

> +	zynqmp-ipi {
> +		compatible =3D "xlnx,zynqmp-ipi-mailbox";
> +		interrupt-parent =3D <&gic>;
> +		interrupts =3D <0 57 4>;

[ ... ]

>  &can0 {
> -	clocks =3D <&clk160>, <&clk160>;
> +	clocks =3D <&can0_clk>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains =3D <&versal_net_firmware PM_DEV_CAN_FD_0>;
>  };
> =20
>  &can1 {
> -	clocks =3D <&clk160>, <&clk160>;
> +	clocks =3D <&can1_clk>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains =3D <&versal_net_firmware PM_DEV_CAN_FD_1>;
>  };

[Severity: Medium]
Should these peripheral nodes include their corresponding reset properties?

The commit introduces comprehensive reset IDs (e.g., VERSAL_RST_GEM_0,
VERSAL_RST_CAN_FD_0) and instantiates the versal_net_reset controller, but
the resets property is only added to the usb0 and usb1 nodes.

Standard peripheral drivers like the GEM ethernet driver (macb) actively qu=
ery
and trigger optional device resets via reset_control_get_optional() during
probe or error recovery. Omitting these reset links might prevent the drive=
rs
from fully resetting the hardware, leading to reliability issues across warm
reboots.

> =20
>  &gem0 {
> -	clocks =3D <&clk125>, <&clk125>, <&clk125>, <&clk125>, <&clk250>;
> +	clocks =3D <&versal_net_clk LPD_LSBUS>,
> +		 <&versal_net_clk GEM0_REF>, <&versal_net_clk GEM0_TX>,
> +		 <&versal_net_clk GEM0_RX>, <&versal_net_clk GEM_TSU>;

[Severity: High]
Are these the correct clock identifiers for the GEM ethernet controllers?

The xlnx-versal-net-clk.h file introduces new clock IDs for Versal NET, such
as GEM0_REF_TX (0xA8) and GEM0_REF_RX (0xA9). However, it appears the legacy
Versal clock macros GEM0_TX (49) and GEM0_RX (48) are not undefined, so this
node compiles using the legacy IDs.=20

When the GEM Ethernet driver attempts to enable its clocks, the dynamically
queried clock driver will request ID 49 instead of 0xA8 from the firmware.
Will this fail to enable the correct clocks and break network connectivity?

> +	power-domains =3D <&versal_net_firmware PM_DEV_GEM_0>;
>  };
> =20
>  &gem1 {
> -	clocks =3D <&clk125>, <&clk125>, <&clk125>, <&clk125>, <&clk250>;
> +	clocks =3D <&versal_net_clk LPD_LSBUS>,
> +		 <&versal_net_clk GEM1_REF>, <&versal_net_clk GEM1_TX>,
> +		 <&versal_net_clk GEM1_RX>, <&versal_net_clk GEM_TSU>;
> +	power-domains =3D <&versal_net_firmware PM_DEV_GEM_1>;
>  };

[ ... ]

> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h b/arch/arm6=
4/boot/dts/xilinx/xlnx-versal-net-clk.h
> new file mode 100644
> index 0000000000000..f894d044c6f94
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
> @@ -0,0 +1,78 @@

[ ... ]

> +#define GEM0_REF_RX	0xA9
> +#define GEM0_REF_TX	0xA8
> +#define GEM1_REF_RX	0xA2
> +#define GEM1_REF_TX	0xA1

[ ... ]

> +/* Remove Versal specific node IDs */
> +#undef APU_PLL
> +#undef RPU_PLL

[ ... ]

> +#undef MIO_50_OR_51
> +#undef MIO_24_OR_25
> +
> +#endif

[Severity: High]
Should the legacy GEM0_TX, GEM0_RX, GEM1_TX, and GEM1_RX macros be undefined
here?

Since they are not removed along with the other Versal specific node IDs, t=
he
dtsi file silently falls back to the old identifiers instead of the new
GEM0_REF_TX style IDs, leading to the incorrect clock request discussed abo=
ve.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780063921.gi=
t.michal.simek@amd.com?part=3D3
