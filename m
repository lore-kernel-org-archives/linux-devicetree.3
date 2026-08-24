Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD083FC5B9
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587788; cv=none; b=vE0kTd/mOuXC5CoydmefetTIRbQfO2V1B2fAB5g28MTgV2EsGZfYGUIDv/oU9Lv1VKWJZnQwaY28J8njfbm16Nb0dfL75DWoPnW43XO6WPddU6dXJC3Qn5HiKlYgVuoNGnHAmX+0u94a700qCQAspGsEv9Gn8oxYinZRIJB6nU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587788; c=relaxed/simple;
	bh=gKiZO93hxEFOzthXLTp1UcEvpRtWGefMptIbGxTDKcQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cFbWSyIEQPgBwK0A9Lp2rra1DGlMpM1fXZpAGo2Gsk3Nta8q99TMP5xyzXghexbz5DmwAOLfSq8m2mhT/8NMELwKYF5AsgsmbLC2lo41Laj26rt7ZVhDz3D93c3a+5UxW7zG6xI1JnmdrK9Hbw0/8Te0B/V6pyC1wAOjH+YMAtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqlIpcBw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqlIpcBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDBD1F000E9;
	Mon, 24 Aug 2026 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787587785;
	bh=ba14tsp05EZQMI+ucG2GciKkkgclljqMvfAn2wQo66o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BqlIpcBwJ5BlWXMmuv5ycaDAWYjb9MRhN9EQ2wJVzcPCGM9GTg/aAEecQE/AqLOaq
	 dVaS6/Oi4UPVkRImsQGor6+4tFkDoSr2thsE1UC8OQNwlyLvRgmIZwjStor0+nFHh6
	 GQW3ZUgDqTG606tR1uhYajrBsUlacapqUCCNypIQnye1dn6rbAi+qkFBS/fqSGAHxr
	 oJ9P6eoDk2B5cQXYlyeyCX3Faf/GjdRxhLtjrjwcPXvYVZGvPdw5TLQLvChaG4dHrx
	 y+pPxkF0uqtBuHp36VkRoKjfxrliw0A5Kx+We+3L+p7N5xUxuSZ/4UOVfNitUSpk7Y
	 VxUvmnZ0T+HWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] arm64: dts: qcom: sm8550: add UART11 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Hamamdjian" <azkali.limited@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-pocketds-v6-2-370161574ca2@gmail.com>
References: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
 <20260824-pocketds-v6-2-370161574ca2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:09:44 +0000
Message-Id: <20260824160945.6CDBD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The SPI nodes `spi11` and `spi12` in `sm8550.dtsi` incorrectly con=
figure their GPI DMA channels to use the I2C protocol (`QCOM_GPI_I2C`) inst=
ead of the SPI protocol (`QCOM_GPI_SPI`).
--

--- Patch [2]: [PATCH v6 2/4] arm64: dts: qcom: sm8550: add UART11 node ---
commit 367c60765aa391aa9b6b3277a433dd844de194db
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

arm64: dts: qcom: sm8550: add UART11 node

This commit adds the UART11 controller node and its default pinctrl state
to sm8550.dtsi. It reuses the 120MHz OPP table already utilized by the
i2c11 and spi11 nodes.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1442,6 +1442,24 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
>  				status =3D "disabled";
>  			};
> =20
> +			uart11: serial@88c000 {

[Severity: High]
This is a pre-existing issue, but while reviewing the new uart11 node and
its surrounding context, I noticed that the existing spi11 and spi12 nodes
appear to incorrectly configure their GPI DMA channels to use the I2C
protocol:

spi11 {
        ...
        dmas =3D <&gpi_dma2 0 3 QCOM_GPI_I2C>,
               <&gpi_dma2 1 3 QCOM_GPI_I2C>;
}

spi12 {
        ...
        dmas =3D <&gpi_dma2 0 4 QCOM_GPI_I2C>,
               <&gpi_dma2 1 4 QCOM_GPI_I2C>;
}

Does configuring the SPI controller's DMA engine with QCOM_GPI_I2C instead
of QCOM_GPI_SPI cause the hardware to expect I2C command sequences,
breaking SPI DMA functionality for any peripherals attached to these ports?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-pocketds-v=
6-0-370161574ca2@gmail.com?part=3D2
