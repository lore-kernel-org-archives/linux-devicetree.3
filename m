Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB841D20E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451922; cv=none; b=NkbfnYxp0SesUrD1dEwJKuf8LY0aCqHPMqF8xd+AqZh5kq/ereJhyIqziRk6iCFS9CnrL1qMmd3GDgSbwabww3dwi3oVELLqcYBJtlS5g8Tg9/PpPRutJ19ADV3SBkIKJzCMyKDHGArwwxFXawUMrjLZeAwB2mM0wmG+IW2gKcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451922; c=relaxed/simple;
	bh=dzYxbkLFEycEkYWay7Y8N2KH7s+XAb0SBQBIxhnme4M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=L3aCY16KaZ44OC4xHbNkrCpp/TK6q4y/adbyjixW8zzXPYkaeJyB6j4Bpbv4d0IHw0Ti9vc1zk4ixu/1E1zsnG/0u/NEjj1pETDC0Cv9yaAru2gNHiloTh0MyMUmqDwej0ax9aQpAHRYdNJLxsKEuJfPY86BPaUFJDyLcZIxX4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMjVsHNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMjVsHNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CB11F000FF;
	Thu,  8 Oct 2026 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451915;
	bh=EcfIjdrSBluG6+Jn/6nZxyox6TJEJ4nCX8zT0bFGbMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SMjVsHNf6RjklrHoy85VKyzXt7rvoLUUZBpVfCD3HAS+aDVee2qUHdnG8jP5jQYks
	 8fiKsy8Xsa3xsPhoKZ+bpNoXYKB+3RJq60QtvRAM+mUvOuZvrMWETG+yTEA14VU3+X
	 MEK3GOHpjwfakk8KbNnnXxgWNjGXHrnN6Uw8w8gbfuzDbfjMIf7wO6COFY4HSqZ6Fk
	 OkNEuxeBqHAyb+2z2wcqFV5/MYafQLqBq0sM07tw+fy+Wj1yx2Bx4FN1vWcFaApacz
	 blLSGIIgeuL5wZDmUQaerEBdXH4ZsJ7apm5Y7o9ngaIKFnlRN2alFsvQju5h2K4yWP
	 JU1kKcVjOcqzA==
Message-ID: <sashiko-outbox-163941@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/11] arm64: dts: qcom: ipq5210: Add nodes for
 multiple peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-08-dts-v6-1-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
 <20261008-08-dts-v6-1-f9c4ec8664d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:31:54 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: Inverted PCIe interconnect mapping
- [Medium] dts: pcie memory ranges mapped to child address 0x0 breaks ident=
ity mapping
--

commit 5d6163228edf9eef2412de146956df64b5bb5d49
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals

Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
can enable the hardware they use.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 20e8b240642c6..161b5bb5a7f74 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
[ ... ]
> @@ -307,6 +619,287 @@ frame@b128000 {
>  				status =3D "disabled";
>  			};
>  		};
> +
> +		pcie1: pcie@50000000 {
> +			compatible =3D "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
[ ... ]
> +			ranges =3D <0x01000000 0x0 0x0 0x0 0x50200000 0x0 0x00100000>,
> +				 <0x02000000 0x0 0x0 0x0 0x50300000 0x0 0x0fd00000>;

[Severity: Medium]
Does mapping the PCI outbound memory space (0x02000000) to a child address =
of
0x0 break identity mapping here?

This allows the Linux PCI core to allocate memory BARs starting at PCI
address 0x0 (since PCIBIOS_MIN_MEM is 0 on arm64). Many drivers evaluate a
BAR address of 0x0 as unassigned (!pci_resource_start(...)), which can lead
to failed driver probes. Furthermore, breaking identity mapping often
conflicts with bootloader expectations and endpoints that assume the PCI bus
address matches the CPU physical address.

Could the child address be set to match the parent CPU physical address
(e.g., 0x0 0x50300000) to enforce a 1:1 mapping, as is standard practice for
other Qualcomm IPQ SoCs?

[ ... ]
> +			interconnects =3D <&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>,
> +					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
> +			interconnect-names =3D "pcie-mem", "cpu-pcie";

[Severity: Medium]
Are the interconnect-names inverted relative to the interconnects array?

The pcie-mem name is listed first, which binds it to the MASTER_CNOC_PCIE1
interconnect, while cpu-pcie binds to the MASTER_SNOC_PCIE1 interconnect.
CNOC typically governs CPU configuration accesses, while SNOC governs high
bandwidth DMA. This mismatch might cause interconnect bandwidth scaling and
power domain voting to apply to the wrong NoC paths during DMA or register
accesses.

[ ... ]
> +		pcie0: pcie@70000000 {
> +			compatible =3D "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
[ ... ]
> +			ranges =3D <0x01000000 0x0 0x0 0x0 0x70200000 0x0 0x00100000>,
> +				 <0x02000000 0x0 0x0 0x0 0x70300000 0x0 0x0fd00000>;

[Severity: Medium]
Does mapping the PCI outbound memory space (0x02000000) to a child address =
of
0x0 break identity mapping here as well?

Similar to pcie1, mapping this to 0x0 allows the Linux PCI core to allocate
memory BARs starting at PCI address 0x0, which causes issues for drivers
checking for an unassigned BAR.

Could the child address be identical to the parent CPU physical address
(e.g., 0x0 0x70300000) to enforce a 1:1 mapping?

[ ... ]
> +			interconnects =3D <&gcc MASTER_CNOC_PCIE0 &gcc SLAVE_CNOC_PCIE0>,
> +					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
> +			interconnect-names =3D "pcie-mem", "cpu-pcie";

[Severity: Medium]
Are the interconnect-names inverted relative to the interconnects array here
too?

The pcie-mem name is bound to CNOC and cpu-pcie is bound to SNOC, which
appears backwards and could lead to performance degradation or QoS failures
when NoC bandwidth scaling applies to the wrong paths.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-08-dts-v6-=
0-f9c4ec8664d8@oss.qualcomm.com?part=3D1
