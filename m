Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4A735F199
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734479; cv=none; b=tLC/X7PT7ZMxgMO5dsdonmBEvWGb2PtiYJCE4HdIUAv1nORVgTcL8XMTx9JZfhNnxY8aOz5qkNt2dhJbET+gshHD6PqQf9e56PhVUrYt7PPdgBRpOIAqPa0kQoqvKXg5aVq5JYMgjtKOdvwr/Zhqp+TX+BfdfxOj2nziUZE6Pbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734479; c=relaxed/simple;
	bh=t3POaM/CaF8PxaX7pfwknp8vkU4vupOikuM5MTF/ytw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H/OaYv0jS+I5RDOcGNWIqpbK0cPz9Oj6F6burJZwcOsQVS4VkUufxtnr6/Ba5/zdsAJNdwNly9v5LfT3YHy2FqhN2NntZ9K9I3o/Yu/fC1APThqnbQpgA8Zo32OLrjlS3gLEN4ql9i6Neyb1i5WopeZYsqKm5JslmzpnVe49bNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUbTE9gA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUbTE9gA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24061F000E9;
	Mon, 29 Jun 2026 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782734478;
	bh=R/hSz7RKV92wMGHM/JiZDXMNi25Q8XLV9LOb/D0iyuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XUbTE9gAanSkjxD7ctTGL9VNFN3MVNunn/HVSOfywWgfm/cfsOxCaqbMoRY9/hN/m
	 JWoNHGvaiqgCbfH+cHmpxwFW7VkCgwZabJbjpdBa5aaphNf6fyTbGo2uOFWJDAxACV
	 9w+HOPDE7/4VB1RVr1nXHCuGmYqu9GvhNpePfLjdglBd68aef4EiXVWKgXShhMKEac
	 bmk8ws185m0Moq1OZP7TMb2NCMLzJIfgrcIeMf1i8ZyzDZFcY2QNHyJOHcVvUAYUYy
	 6yDxJ05watNZYviTb+HKadmq5u5m/1jOr923Qv+vdoJJTUMhX6VHGR06mcK2edGApT
	 FRX+CSaObHK1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/2] arm64: dts: socfpga: agilex5: update channel
 interrupts for gmac1 and gmac2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629114818.1746410-2-dinguyen@kernel.org>
References: <20260629114818.1746410-1-dinguyen@kernel.org>
 <20260629114818.1746410-2-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 12:01:17 +0000
Message-Id: <20260629120117.D24061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds 16 additional queue interrupts to the gmac1 and gmac=
2 device tree nodes, violating the strict `maxItems: 1` constraint in the `=
altr,socfpga-stmmac.yaml` binding schema.
--

commit 40c2d176bae16fd4cc692701cf60a99607edf61f
Author: Dinh Nguyen <dinguyen@kernel.org>

arm64: dts: socfpga: agilex5: update channel interrupts for gmac1 and gmac2

Populate the gmac1 and gmac2 interrupt list to support 8 TX/RX queue pairs
in the agilex5 device tree.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index 02e62d954e949..140e4bf9fb155 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -670,8 +670,40 @@ gmac1: ethernet@10820000 {
>  			compatible =3D "altr,socfpga-stmmac-agilex5",
>  				     "snps,dwxgmac-2.10";
>  			reg =3D <0x10820000 0x3500>;
> -			interrupts =3D <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names =3D "macirq";
> +			interrupts =3D <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,

[Severity: Low]
Does this expansion of the interrupts list trigger a dtbs_check warning?

Looking at Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml,
it strictly limits interrupts:

  interrupts:
    maxItems: 1

  interrupt-names:
    items:
      - const: macirq

Should the binding schema be updated concurrently with the dtsi to allow th=
ese
queue-specific interrupts and avoid validation failures?

[ ... ]

> @@ -783,8 +815,40 @@ gmac2: ethernet@10830000 {
>  			compatible =3D "altr,socfpga-stmmac-agilex5",
>  				     "snps,dwxgmac-2.10";
>  			reg =3D <0x10830000 0x3500>;
> -			interrupts =3D <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names =3D "macirq";
> +			interrupts =3D <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,

[Severity: Low]
Same question here regarding the altr,socfpga-stmmac.yaml binding schema
limiting interrupts to maxItems: 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629114818.1746=
410-2-dinguyen@kernel.org?part=3D1
