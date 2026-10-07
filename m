Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F239D3FD
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368461; cv=none; b=gzNctKym6pplZO7vjbF4hr+pSZLcXr/81c+vl5Q4jT1IePoQcSAEzFIS62cxCKE44dVaXrE3NCd5v109qrDRlQam4nx9ZqtndttxKgO5ZGpKjDoKs7JnphdwVVtYZLTOWVBTCTOpcQPvezi6CUVAkfVXJOT9yB1X02aPRn8cPMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368461; c=relaxed/simple;
	bh=UNIKGS1w/o9uITv+TX8T1Jcps6D+3XfpPQ9R6iwiV6g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=P2mFtpbZEr3vJ4Y+CQ1Qenv78KjuGw6GSJ7wdq/O5uBPWeEmmz2DMKtLx0CGeOhxYd0mKy3pACTcc2111b1GwkdRpEWVLALq30E77FIpsMcjM7fDhBC24fj2nGsnrr+5QLLpmd0nShxt2szDGIBYedvisx+lAHoA0GQX5bDpvYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNZpFI2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNZpFI2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F2C1F0089B;
	Wed,  7 Oct 2026 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368450;
	bh=0WyzbuOJtbzmf4jOWQcLjayGjAXr6ATyNld+3FNFXJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNZpFI2EX4TR8FYh2dD2BIKVm+ZxPkip5hkE6CX9aJV+kwKuJ/Uk7BJmyk3ouYPb7
	 vp//JIdjLjU1c0clghjXNTUxOMowNR8adMZmtIQNAytvhzIOznye48JUr1TIivMUNN
	 eNNJmOZk6hm5XohKm9g9/grqucqZ8F42R3UZU8JWWb6OVhOfe5FaQ1a/kYto+4mwrS
	 k+a7hOaVCxPXCQMAmcZsPuBNqec3Uxn0JULWVTbuVZh0kc1AivK+IdRdNjKsqb3IkN
	 CrxgeW9Z4t8iCh5No/eVHAR+zU/Su/DDH4hqSX89j/wfIh/1dRQRoh4yMP0Z5Bz9MC
	 yg7sFGqaWv2Sg==
Message-ID: <sashiko-outbox-162854@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swamil Jain" <s-jain1@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261007100707.1065564-3-s-jain1@ti.com>
References: <20261007100707.1065564-1-s-jain1@ti.com>
 <20261007100707.1065564-3-s-jain1@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:20:49 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: ti: missing reset-gpios for sii9022 HDMI bridge
- [Medium] dts: missing gpio-hog for VOUT0_FET_SEL0 hardware mux
- [Medium] dts: ineffective bootph-all properties on HDMI endpoints and pin=
mux
--

commit 67599eb578ca3fc87e07bad393a95787a31afca5
Author: Devarsh Thakkar <devarsht@ti.com>

arm64: dts: ti: k3-am62l3-evm: Add HDMI support

This commit adds HDMI bridge and connector nodes to the TI AM62L3 EVM device
tree. It configures the DPI pinmux connecting VOUT0 to the SII9022 bridge, =
and
hooks up the DSS output to the bridge input.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/d=
ts/ti/k3-am62l3-evm.dts
> index 84a0cfaaf196a..7733a0d265ab4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -44,6 +44,19 @@ usr: button-usr {
>  		};
>  	};
> =20
> +	hdmi0: connector-hdmi {
> +		compatible =3D "hdmi-connector";
> +		label =3D "hdmi";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint =3D <&sii9022_out>;
> +				bootph-all;
> +			};
> +		};
> +	};
> +

[Severity: Medium]
The hdmi_connector_in endpoint has a bootph-all property, but the parent
device node hdmi0 lacks it.

U-Boot's fdtgrep tool extracts subnodes structurally if a child has bootph-=
all,
but strips the properties (such as compatible and reg) of the parent node
unless the parent itself also has bootph-all.

Will this cause the connector driver to not probe in early boot, making the
bootph-all property ineffective and dead code?

[ ... ]

> @@ -192,6 +205,37 @@ exp2: gpio@23 {
>  		bootph-all;
>  	};
> =20
> +	sii9022: bridge-hdmi@3b {
> +		compatible =3D "sil,sii9022";
> +		reg =3D <0x3b>;
> +		interrupt-parent =3D <&exp1>;
> +		interrupts =3D <20 IRQ_TYPE_EDGE_FALLING>;
> +		#sound-dai-cells =3D <0>;
> +		sil,i2s-data-lanes =3D < 0 >;

[Severity: Medium]
The sii9022 node is missing the reset-gpios property. Does this allow the
driver to probe silently without a reset line?

The AM62L3 EVM hardware has a dedicated reset line (GPIO_HDMI_RSTn) on the
exp2 expander:

	exp2: gpio@23 {
		...
		gpio-line-names =3D "BT_EN_SOC", "VOUT0_FET_SEL0",
		...
				  "GPIO_QSPI_NAND_RSTn", "GPIO_HDMI_RSTn",

By omitting reset-gpios, the kernel fails to actively manage the reset stat=
e,
relying on the bootloader to leave the pin de-asserted.

If the bootloader leaves it floating or asserted, or if the hardware loses
state during suspend, will the HDMI bridge silently fail to operate?

[Severity: Medium]
Additionally, the exp2 GPIO expander defines a VOUT0_FET_SEL0 line, indicat=
ing
a hardware FET switch multiplexes the DPI/VOUT0 signals.

Without a gpio-hog to actively select the HDMI output path, does the expand=
er
default to inputs (high impedance), leaving the FET switch floating or rest=
ing
in an unverified default hardware state?

Could this cause display signals to not reach the HDMI bridge, rendering the
HDMI output non-functional?

> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				sii9022_in: endpoint {
> +					remote-endpoint =3D <&dpi_out>;
> +					bootph-all;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +
> +				sii9022_out: endpoint {
> +					remote-endpoint =3D <&hdmi_connector_in>;
> +					bootph-all;
> +				};
> +			};
> +		};
> +	};

[Severity: Medium]
Similar to the hdmi0 node, the sii9022_in and sii9022_out endpoints have
bootph-all but the parent sii9022 node lacks it.

Will the missing bootph-all on the parent prevent the driver from probing in
early boot, rendering the endpoints' bootph-all properties dead code?

[ ... ]

> @@ -321,6 +400,24 @@ AM62LX_IOPAD(0x0004, PIN_OUTPUT, 0) /* (AA23) WKUP_U=
ART0_TXD */
>  	};
>  };
> =20
> +&dss {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&dpi_pins_default>;
> +};
> +
> +&dss_ports {
> +	/* VP1: DPI Output */
> +	port@0 {
> +		reg =3D <0>;
> +
> +		dpi_out: endpoint {
> +			remote-endpoint =3D <&sii9022_in>;
> +			bootph-all;
> +		};
> +	};
> +};

[Severity: Medium]
The dpi_out endpoint has bootph-all, but the parent dss and dss_ports nodes
lack it.

Will the missing bootph-all on the parents prevent the display subsystem fr=
om
probing in early boot, making the endpoint bootph-all properties ineffectiv=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007100707.1065=
564-1-s-jain1@ti.com?part=3D2
