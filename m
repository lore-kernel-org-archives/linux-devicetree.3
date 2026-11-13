Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563275;
	b=YPtB75Ap0S3duUae4c3Oxc5vYUd4rOLOItv3XFg65ZbEEiUiwWHAXJyWgA0ewvGlXjEq
	 niFRJs/nRA8PuJZRFZ7tPNKKA8P05ufPcfznfYhaO3itaJydZpOARZK7VRhbfyjwm9Y4t
	 4uSQ+7DgfYdt3BPjtE6wkWZhdeoIc62fafqrY7beVfRnaP+RkPGf0MMt+1fUeeaON1z/a
	 u2MV0s7W13PpZlafzDDWJlzCwZmnyKdT+ffWz+qSU3B+BSfHkHDZAZsjfWLzkKiGU+g5E
	 mBPHqbD0NbyOLxGL3o3XIdh0HM0VzpOruWscmOnTBUBIfncIi0fClgZdWhcIOenMGGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4osRCpBUwVbAVXzsmKv+OVrPMoAzVjh03WXG58X+e3k=;
	b=yxsrQBNqZrM52ZzqltY1rlrrEduBkbS/g4c6Gyz8bmHZ62OATHyIcVH1l87lHzKb3BLm
	 K7JaarMcmc9yRKzZElVMxBI/G6AvC30qCjUOxjRW+HPdkXjDfzURcWt3E7XHoIVnFdCNu
	 o0x6MKv0/40hXtqX9njVgmbtR2XpLti0bW4W88AcgyOGmmgnPksInVSMep1wqui53HO/u
	 YkXUbxYBN8nzbDc+GjG+u+AGhzMa78yP2HfX/H5RsDHFaNfNR/EKRFoCkTFcvX+6+moD2
	 Ii0p3ELmkH7AELhND7ZGys5yknzql+Hs9JXO7NlIDvApCnAIqmwTj+WSM0OE37MJ/2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J2SGBIlh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C14606A335
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J2SGBIlh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478ED1F000C4;
	Fri, 13 Nov 2026 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563275;
	bh=4osRCpBUwVbAVXzsmKv+OVrPMoAzVjh03WXG58X+e3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J2SGBIlhfMAPKgkO3hveoHlL2XaEpDZdhitQjdDsyc6GZeZU7J0JqxUWjNT8ixJsG
	 rlPkBUMHO6V1/vOUiH54rmkwpYC3D4o7rlAUu4Yv/DfZB1iJVpeHXOHrPd9lLXhtDR
	 tw5GwErG6+mdBSpw5ZvFEoW5iNblMgvdqhv6vIfil8pARVZEsS1DqIfmtUaeuRSSeo
	 oJLkyAkHL9h1SrMNE4Ilz/lthPmwPuUKTqZzTEuWZHwvXG7DwHNrAWtwXOp1bC2C6k
	 phdlKd5ElehOgfYDFLC8M7i4Wpa/WBD567NF9DoaUpsW9hKmfPtVORitwX5z142UpE
	 sjYwM4wtrI11g==
Message-ID: <sashiko-outbox-212570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-nord-gpi-dts-v4-2-e4a1510687c0@oss.qualcomm.com>
References: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
 <20261113-nord-gpi-dts-v4-2-e4a1510687c0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:47:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: nord: QCOM_GPI_SPI DMA properties added to
  UART nodes
- [Medium] arm64: dts: qcom: nord: missing GPI DMA properties on spi4
  and spi14..spi19
--

commit 9c6fd2386259cb23b0a0394993d22bac655549bb
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

This commit adds GPI DMA channel phandles and dma-names properties to QUPv3
I2C and SPI serial engine nodes in nord.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index 68787db708f61..818f6054bcec8 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

[ ... ]

> @@ -1244,6 +1272,10 @@ spi20: spi@898000 {
>  				reg =3D <0x0 0x00898000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma2 0 6 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};
> =20

[Severity: Medium]
Were the GPI DMA properties for spi14 through spi19 (on gpi_dma2 SE 0..5)
and spi4 (on gpi_dma0 SE 4) accidentally omitted?

All seven I2C nodes in qupv3_2 (i2c14..i2c20) and all six I2C nodes in
qupv3_0 (i2c0..i2c5) are wired up, but among the SPI nodes in qupv3_2 only
spi20 receives gpi_dma2 channels, and spi4 in qupv3_0 is also skipped.  In
particular, spi16 (spi@888000) is enabled on Nord Ride and Nord RRD, so
spi_geni_grab_gpi_chan() will fail to acquire the tx and rx DMA channels
when FIFO_IF_DISABLE is set and fall back to FIFO mode.

[ ... ]

> @@ -1309,6 +1345,10 @@ uart0: serial@980000 {
>  				reg =3D <0x0 0x00980000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma0 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};
> =20

[Severity: Medium]
As reported by Konrad Dybcio on v3 [1], should these QCOM_GPI_SPI DMA
channels be added to spi0..spi3, spi7..spi8, and spi11..spi12 instead of
their sibling UART nodes (uart0..uart3, uart7..uart8, and uart11..uart12)?

Those eight SPI nodes are left without GPI DMA channels, causing
spi_geni_grab_gpi_chan() to fail to acquire tx and rx DMA channels when
FIFO_IF_DISABLE is set, while the UART nodes gain dmas and dma-names
properties that are not permitted by the GENI UART bindings.

[1] https://lore.kernel.org/r/6e91b34f-367e-4835-a7ce-e899953a5bd1@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-nord-gpi-d=
ts-v4-0-e4a1510687c0@oss.qualcomm.com?part=3D2
