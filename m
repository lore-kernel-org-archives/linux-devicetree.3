Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775560;
	b=L0huoicNiqYErwhTHCQelB9MdeFxsVDb5M1hnY/RLsMz1oGAe45Fy+vp5OQZaD36VJC4
	 9Zk/lymZ//Pho4mtneZbzkuYgFUHT2gm8gj+5k9vuxhi7x/awuzk0NLHmTLwS3lb+1YJR
	 bN9Hg72hxlX5jti/ucxSQAFqwwUaTqw8TkvPs8dcz7swwbU9QWM3ykACcG++bR8R6qSrG
	 bS/TzH/0SxX1YiXUZ+83EanTAnwkRJHXaBU94yHvzjbnhYyXWeR6RA3k3ifxGZyjsmf2H
	 4njUBh8RYBsareKEOs6Hup9rQ7CW/w4gPmoy9Ok9deMk3LDWbTRGxq5vHtez9EfzPPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775560;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ohnzUxywd9wY9o2b/cspF31VE29YIxnbl6OZymtpXGE=;
	b=WMlZjlgdPcVdxXmos0vuj6bfZVNDE8e5pwVvh44KcBG7iBPNFtfAmnTedJnVNn0F/JSn
	 iATNgM27p7XsBshNEyofl/BMWyRZOGJVIC+sIRcNwAyuTymz9xHNa4bP8fKeoIf1+kzU3
	 wpS6Qu2rV9mp+LaN2D+YzeM0C6ackOOPaPVIVlxpazUpkNif32NbpcmWRPl1MXOlWl1zO
	 pB+MwcA78A7D8zY63AcCG06iF1Ob47/S1Vi2TLztUscTY1skXCkGIqD+jpgO0LnEKNgYR
	 QokttBdYNvUWItuQD2ho6Mm8ty9KmN9jDVNUPMz6M2UI8NgzKuFN6hY7KOw8eHaT6yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WKOQ/ZC9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EC6606A337
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 20:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKOQ/ZC9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47E31F000CF;
	Sun, 15 Nov 2026 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794775560;
	bh=ohnzUxywd9wY9o2b/cspF31VE29YIxnbl6OZymtpXGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WKOQ/ZC9gIWVkf9hd0kALmzAC8VELIry5ECpoSsJYkjH+QTMv5MGCMn+mWqmQ/z6V
	 LMO6lfOsZo+R5TgRRSSGqL9oNEEN7wQhNWDvwnvORSuqmOFGRe+QoIT4IJzFuB2Vqx
	 D5+cAQbvcMPXwZmf6FBvgHPH15O9UjDPfYBLWZTZAi38r3GkduawDuTGIfOGxeoj85
	 hZQZzQH2J1p2l74sj56o0aU7Q/MJsjmxrUklh7389/Zo7oVDzBHiy1Gj50wZWOq5lC
	 qLdSNeZRbpCjmaHewvRmREnH0u9g9Vhk3VAhJdaRJEyAQznDVWsWvFWsINScicqehz
	 ifUj1UsiDdTHw==
Message-ID: <sashiko-outbox-215854@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] arm64: dts: qcom: Add Motorola Signature
 (vantage)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-molokai-soc-v1-11-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
 <20261116-molokai-soc-v1-11-3b2ee920fa3b@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 20:45:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] arm64: dts: qcom: vantage open-codes B_E0 PMH0101 as PM8550
  on spmi_bus0
- [Low] arm64: dts: qcom: vantage defines serial0 alias for disabled
  uart7 node
- [Low] arm64: dts: qcom: vantage places firmware memory map comment on
  gpio-keys
- [Low] arm64: dts: qcom: vantage static reserved-memory nodes set
  alignment
- [Low] arm64: dts: qcom: vantage nodes and label overrides are out of
  sort order
--

commit ec19559277a19246b45ee197f04e140dbe0920a8
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

arm64: dts: qcom: Add Motorola Signature (vantage)

This commit adds the devicetree for the Motorola Signature (vantage)
smartphone based on the Qualcomm Molokai (SM8845) SoC.

> diff --git a/arch/arm64/boot/dts/qcom/molokai-motorola-vantage.dts b/arch=
/arm64/boot/dts/qcom/molokai-motorola-vantage.dts
> new file mode 100644
> index 0000000000000..c3a0fa5f4e0e8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/molokai-motorola-vantage.dts
> @@ -0,0 +1,737 @@

[ ... ]

> +/ {
> +	model =3D "Motorola Signature";
> +	compatible =3D "motorola,vantage", "qcom,molokai";
> +	chassis-type =3D "handset";
> +
> +	aliases {
> +		serial0 =3D &uart7;
> +	};

[Severity: Low]
Should &uart7 be enabled, or should the serial0 alias be dropped?  uart7
has status =3D "disabled" in kaanapali.dtsi and is never enabled in
molokai.dtsi or this board file.

[ ... ]

> +	clocks {
> +		xo_board: xo-board {
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <76800000>;
> +			#clock-cells =3D <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <32764>;
> +			#clock-cells =3D <0>;
> +		};
> +
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible =3D "fixed-factor-clock";
> +			#clock-cells =3D <0>;
> +
> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> +			clock-mult =3D <1>;
> +			clock-div =3D <2>;
> +		};
> +
> +		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
> +			compatible =3D "fixed-factor-clock";
> +			#clock-cells =3D <0>;
> +
> +			clocks =3D <&rpmhcc RPMH_CXO_CLK_A>;
> +			clock-mult =3D <1>;
> +			clock-div =3D <2>;
> +		};
> +	};

[Severity: Low]
This isn't a bug, but the unaddressed child nodes under clocks are not in
alphabetical order (bi-tcxo-ao-div2-clk, bi-tcxo-div2-clk, sleep-clk,
xo-board), which triggers warnings from scripts/dtc/dt-check-style.
/delete-node/ &adspslpi_mem at the top of the file and the &label
overrides at the bottom are also out of alphabetical order.

> +
> +	/* Memory map of the SM8845 firmware shipped with A171WVH.21-16-16 */
> +	gpio-keys {
> +		compatible =3D "gpio-keys";

[Severity: Low]
This isn't a bug, but this comment describes the reserved-memory node
further down rather than gpio-keys.

[ ... ]

> +	reserved-memory {

[ ... ]

> +		qdss_apps_mem: qdss-apps@82800000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x82800000 0x0 0x2000000>;
> +			alignment =3D <0x0 0x400000>;
> +			reusable;
> +		};

[Severity: Low]
Should alignment be dropped from qdss-apps@82800000, oem-vm@f7c00000, and
lcp-dare@880000000?

Static reserved-memory nodes that specify reg without size ignore
alignment in __reserved_mem_reserve_reg(), and the reserved-memory schema
requires size whenever alignment is present, so make dtbs_check fails on
these three nodes.

[ ... ]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id =3D "B_E0";

[ ... ]

> +&spmi_bus0 {
> +	pmic@1 {
> +		compatible =3D "qcom,pm8550", "qcom,spmi-pmic";
> +		reg =3D <0x1 SPMI_USID>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		pm8550_gpios: gpio@8800 {
> +			compatible =3D "qcom,pm8550-gpio", "qcom,spmi-gpio";
> +			reg =3D <0x8800>;
> +			gpio-controller;
> +			gpio-ranges =3D <&pm8550_gpios 0 0 12>;
> +			#gpio-cells =3D <2>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +
> +			key_vol_up_default: key-vol-up-default-state {
> +				pins =3D "gpio6";
> +				function =3D "normal";
> +				power-source =3D <1>;
> +				bias-pull-up;
> +				input-enable;
> +			};
> +		};
> +	};

[Severity: Medium]
Should this include pmh0101.dtsi and reference &pmh0101_gpios instead of
open-coding pmic@1 as a PM8550?

regulators-0 under &apps_rsc declares PMIC B_E0 (SPMI bus 0, USID 1) as
qcom,pmh0101-rpmh-regulators, whereas pmic@1 on &spmi_bus0 describes the
same USID 1 device as qcom,pm8550 with qcom,pm8550-gpio.  As a result,
pinctrl-spmi-gpio registers 12 GPIOs instead of PMH0101's 18 GPIOs, and
the PMH0101 thermal sensor and peripherals from pmh0101.dtsi are omitted.
The commit message also refers to PM8550 and PMK8550 even though the board
uses PMH0101 and includes pmk8850.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-molokai-so=
c-v1-0-3b2ee920fa3b@yahoo.com?part=3D11
