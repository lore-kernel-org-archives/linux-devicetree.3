Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77F844A3FF
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794816; cv=none; b=M+9R8b1KaOKywOUNQRSPMEg+qZoim+R1H/PlJbRGAuNvRyDEQe5hN8W3N9hiyY3gft+/IotfIfbhbfcypTrLZ5lpCY38DS5vmsGga97gNpSqXL+KUSM66cWKntfTHRd5hz4eANzbGGnZI7w+0SsUbS2KjaQ4RRXkEcedNHaUEo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794816; c=relaxed/simple;
	bh=yUhk/j4KTwWyLi/Fngk1kQazSSBv9FHxwyYO/4CI21k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hokJXDQB5dI3unQ/EzA/GBxqKyNpwBjuxoAsPGTyXPdKEejXU++XiUGbi6QFz7LvnU3ETH/2d0E3X4eObKijVCGVLo4hXJpUo3rrql62D94mRwbJN0efiguJ5358/Cxq1RqknHbYYDbmal/Abya1LxrKjPjmDEfZgqQnXu+vLVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4HHV0sZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4HHV0sZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6E11F0089B;
	Mon, 12 Oct 2026 08:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794815;
	bh=XKFKxOMJxzI6zO2d9AfBFPyAMU7L6mSEO7V2gRNVE+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4HHV0sZ8UtfQM79F1TohlKTuXTDz2lctgxn9FeY2fVGzi9YRmcHllVkpuoAwgr0q
	 jZVUaKaziUzEcCruPW+TNmkRG9fmbOWK1c0XX7JsDa40nZdFWcQ37v1YSqHHkgqlLF
	 evYFSLWsmiYZPda02qAVrVxHWjulWfWthcyoHieXnM5I8CQuADGvu2XTTJeKS7ijiH
	 GQfpfEQDjVPhkjuuenJgbv5kCGmepiuyHnJQbGGGC32/l7VLIWt2a2TIlnRhD/PZ8c
	 lQ4Sc38aM3QeLr9PGW4v2XSeMSfKvcXol6rpZkIGTX6FNEg1Ag8XgHKCBdRFD6cc3B
	 764+Dq/9Kl7/A==
Message-ID: <sashiko-outbox-167864@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Introduce Maili SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012-maili-dts-v3-3-8b499e7b9a52@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-3-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 08:46:55 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: pcie: misplaced phys and missing phy-names in pcie no=
des
--

commit 25d4f4b51a97698c80eebd846bb1cbf9ae8ec02d
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
arm64: dts: qcom: Introduce Maili SoC

This commit adds the device tree for the Qualcomm Maili SoC. It includes
support for CPUs, interconnects, interrupts, timers, various controllers,
and peripheral devices such as PCIe and USB.

> diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qc=
om/maili.dtsi
> new file mode 100644
> index 0000000000000..0aa5bd4ea21c3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/maili.dtsi
> @@ -0,0 +1,6930 @@
[ ... ]
> +			pcie_port0: pcie@0 {
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +				phys =3D <&pcie0_phy>;

[Severity: High]
Is the phys property misplaced in the pcie_port0 child node instead of
the parent pcie0 node?

The Qualcomm PCIe host controller driver (pcie-qcom.c) expects to acquire
the PHY from the main controller node via devm_phy_get(dev, "pciephy").
Without it, PHY initialization and PCIe link training will fail.

Could phys be moved to the pcie0 node and the missing phy-names =3D "pcieph=
y"
property be added?

> +			};
> +		};
[ ... ]
> +			pcie_port1: pcie@0 {
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +				phys =3D <&pcie1_phy>;

[Severity: High]
Does this node incorrectly define the phys property for the pcie_port1
child node rather than the parent pcie1 host bridge node?

Similar to the pcie_port0 node, the host controller driver expects to
acquire the PHY from the main controller node.

Should the phys property be moved to the pcie1 parent node and a
phy-names =3D "pciephy" property be included?

> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-maili-dts-=
v3-0-8b499e7b9a52@oss.qualcomm.com?part=3D3
