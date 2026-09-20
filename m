Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE63CAA54
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 03:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789875937; cv=none; b=T1Y8uY1oR7NG/nD5ooFGM09a/txyQFYSfCz5hq370hyuF6lJW07UgcCaPXV/Den0e4kcGkIe7iJ2oZJnb73mqSdM8i0LD/Y6LfKRlGc+f/awUL0R/Vz4P2wHxoPoUr0KpelzX7o6NkbgJgxx3R0qVlN7avkhKX/26YVtpDbflYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789875937; c=relaxed/simple;
	bh=zxchw+AGLqScYiC+c7N1Lx2xWKasFMFlXvmdODN36go=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KXBpBjZclsCu0fOO1moLbBFIRUMkTox7j10YSbPN7lYpDxkYhh3ZsdCQRiVrsraOFD5q5dGeyiTY/WhwuCiwE661ZXE9Zer+hhyGE46YKHzWaS/JQ0DArpxAeAb0ljC3WipxpicVauHkHfoxch+3XE86gsiaKckE1EOP/jTbXGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ai+kZE5p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ai+kZE5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC581F000FF;
	Sun, 20 Sep 2026 03:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789875935;
	bh=RJPY4dRtqZamgssNeUmrfywhtzvMqb9zarBP3B1gqkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ai+kZE5pZj36FW8VNDTLzErgsUQf0yUjlBBsFhFKkklODMq7RlgwQeXCohJZNGg46
	 aaVQ+b15BapIgRfAWrtPHy3PdzD6jiJTF7b2dfQnqY9EhMRf4loDQzwzG405peHh/D
	 p5yzVaqIfTHSWA+CFU38IIaeAmeearEQY21mPvuquy1/pAcK81h2qieXJJIwUukxMb
	 MXxoudQicJ5zZBL8LvorRmhNwVJ8/im9g8N+Fzr/pi3IO8ZVcX9AV6Ja7048D4pEvU
	 qW/Wq1L7Uz+BalwE6HXoqjp7DCvlXAvdaue615tNm+wt0Z3+yWm1O/QACHcCdpmbcj
	 5KzZaGIQfYKFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Santhosh" <vishnu.santhosh@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 03:45:35 +0000
Message-Id: <20260920034535.9EC581F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] dts: qcom: bam_dmux_pool shares BAM DMA descriptors with untru=
sted modem
- [High] dts: qcom: bam_dmux driver ignores qcom,vmid, leading to SMMU/XPU =
faults
--

commit 29cefe6f8087e49778891d714bb8fb329002f944
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add BAM-DMUX support

Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
to provide modem data channels on Shikra. Reserve a 256 KiB restricted
DMA pool and reference it from both the BAM-DMUX and BAM DMA nodes.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 92d22e3b6931c..4980c125b7e1a 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -352,6 +353,13 @@ reserved_memory: reserved-memory {
>  		#size-cells =3D <2>;
>  		ranges;
> =20
> +		bam_dmux_pool: restricted-dma-pool {
> +			compatible =3D "restricted-dma-pool";
> +			size =3D <0x0 0x40000>;
> +			alignment =3D <0x0 0x40000>;
> +			alloc-ranges =3D <0x0 0x80000000 0x0 0x80000000>;
> +		};
> +

[ ... ]

> @@ -1866,6 +1891,20 @@ glink-edge {
>  				qcom,remote-pid =3D <1>;
>  				label =3D "mpss";
>  			};
> +
> +			bam_dmux: bam-dmux {
> +				compatible =3D "qcom,bam-dmux";
> +				interrupt-parent =3D <&modem_smsm>;
> +				interrupts =3D <1 IRQ_TYPE_EDGE_BOTH>,
> +					     <11 IRQ_TYPE_EDGE_BOTH>;
> +				interrupt-names =3D "pc", "pc-ack";
> +				qcom,smem-states =3D <&apps_smsm 1>, <&apps_smsm 11>;
> +				qcom,smem-state-names =3D "pc", "pc-ack";
> +				dmas =3D <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> +				dma-names =3D "tx", "rx";
> +				memory-region =3D <&bam_dmux_pool>;
> +				qcom,vmid =3D <QCOM_SCM_VMID_NAV>;

[Severity: High]
Does the BAM-DMUX driver actually parse and use this property?

The host BAM-DMUX driver (drivers/net/wwan/qcom_bam_dmux.c) does not appear=
 to
parse qcom,vmid or invoke the necessary Qualcomm SCM calls to configure the
hardware memory protection.

Will this cause SMMU or XPU memory protection faults when the modem attempts
to read or write its buffers, since the driver fails to grant the modem the
necessary access to the DMA pool?

> +			};
>  		};

[ ... ]

> @@ -2026,6 +2065,18 @@ dispcc: clock-controller@5f00000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		bam_dmux_dma: dma-controller@6044000 {
> +			compatible =3D "qcom,bam-v1.7.0";
> +			reg =3D <0x0 0x06044000 0x0 0x19000>;
> +			interrupts =3D <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
> +			#dma-cells =3D <1>;
> +			qcom,ee =3D <0>;
> +			num-channels =3D <6>;
> +			qcom,num-ees =3D <1>;
> +			qcom,powered-remotely;
> +			memory-region =3D <&bam_dmux_pool>;

[Severity: Critical]
Is it safe to share bam_dmux_pool between the modem and the BAM DMA
descriptors?

The commit message notes that this shared pool provides space for the BAM
descriptor FIFOs. By linking this pool to the bam_dmux node above, the desi=
gn
aims to grant the untrusted modem access to the entire pool.

Because the bam_dmux_dma controller uses physical addresses, if the modem
overwrites the address field of a DMA descriptor within this shared pool, w=
ill
the BAM DMA controller blindly execute DMA operations on the forged address?

Could this allow a compromised modem to read or write arbitrary host memory?

> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-qcom-shikr=
a-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com?part=3D1
