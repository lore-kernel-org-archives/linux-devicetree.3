Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8EA4AC17D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002651; cv=none; b=N49JVISfoPbgnBdzOC6TC7J4p9iLJD5kjqrE2IKFxM8VKK7k1ZZmiS9SI4sIBiZtBGOwgkhAtr1/2LFjLpSeFzBGlXTVrJLBfW4/xEfG9BoLG2ppTUAye21jeScQXw7mxS7TvvOLWLKIzYrRRTN+M2ZwuzelfcEr8Kmm1P5jB30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002651; c=relaxed/simple;
	bh=BygMtSCR/ezjRX27IMDu6CPvswuhLjOj+dMRXGlIdYU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xvk2O3P/VPVUSVCcaso1FRjYbVWNrWLK+EB5F6G4baZkcbkq82AP32kDOs7hH5ir+9ebAu1RAgSxlW29U0C+OYbM3gKqVc3UEKnd/kl8zQdWuEOVNaZL7EjoMUdTNcaOsR0L1qxwVGPoskOb9aHCOGvIRH72oaSI/KVuKYqa6Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgAJMm5a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgAJMm5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692791F000FF;
	Mon, 21 Sep 2026 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002645;
	bh=UBJgVOvi3AeJKa/O8uQf4T9QkJ9QWJIyMtqUI4AeeJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YgAJMm5ag8YDfsI+1rhm5H3SIMGihcl/KbWM8TXeT4S+T0zhzssCdErM1IQDOEeTm
	 H8M6KpNeQ8bsSezG8iq/ZviVvb95+263HUtIKmewSj0OqlKC+CByOphM9q4mStMbLc
	 DxkJBWHIjCTO8kREDT+Tj0xHBgJlokgQasjvJk7C3D5QMYDZKqXCIyH7eZggROCWDf
	 P4tPx2Ed1DIWm1XbvndGGfP6qwPOMqjqYL3oRT+pLwbYUOK89vLS8cTfDYfsNZRAHR
	 9v/EfSg4fr2Ub8rcCRdWzWwz48lPopcxb8aGLTmBc/f0BgNIppjulIf+82oP84xxal
	 l9Nbztw7mrLiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-nord-gpi-dts-v2-2-4f297c983b94@oss.qualcomm.com>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-2-4f297c983b94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 14:57:25 +0000
Message-Id: <20260921145725.692791F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: qcom: SPI DMA properties mistakenly added to UART nodes
--

commit be91916b8a47fc6278b780bd5f1d5c34e90bd488
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

This commit adds DMA phandles to I2C and SPI QUPv3 serial engine nodes
in the device tree.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index 9f4e0e1498c32..906e4e67f03c7 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

[ ... ]

> @@ -1184,6 +1220,10 @@ uart0: serial@980000 {
>  				reg =3D <0x0 0x00980000 0x0 0x4000>;
>  				interrupts =3D <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +				dmas =3D <&gpi_dma0 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
> +				dma-names =3D "tx", "rx";
> +
>  				status =3D "disabled";
>  			};

[Severity: High]
Does this mistakenly add the SPI DMA configuration to the uart0 node
instead of a spi node?

In the Qualcomm GPI DMA driver, gpi_terminate_all() determines how to
terminate channels based on the protocol. If the protocol is QCOM_GPI_UART,
it terminates the TX or RX channel independently. If the protocol is set
to QCOM_GPI_SPI, it assumes a synchronous protocol and forces both the TX
and RX channels to be terminated and reset in lockstep.

If QCOM_GPI_SPI is applied to asynchronous uart nodes, won't this cause
data loss? For example, if the UART driver terminates one channel to flush
an RX timeout, the DMA driver will silently reset the other active TX chann=
el
mid-transfer, dropping characters.

This same QCOM_GPI_SPI configuration appears to be mistakenly applied to
uart1, uart2, uart3, uart7, uart8, uart11, and uart12 later in this patch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-nord-gpi-d=
ts-v2-0-4f297c983b94@oss.qualcomm.com?part=3D2
