Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F2388873
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182215; cv=none; b=lCwnsC0rQ69ZCIsm9i+w84YipMjvwuzDUPhH3J6/ZbZmIwy2Du+XPhvfpDGFl5xGHC+E8bq5qVaBfYHxpnNJ5GpZFytwr5jT4sVjfoeUCKj8sbOsHlB0MD+h8P8fhkPdvJZ2yyfsV0mGtYF2LLm9QmORivjsSlPZIyt/NQsUKCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182215; c=relaxed/simple;
	bh=lJI+qosgeo3CjrxWmQ7X2FuKaIOOj76wxQwWDSyw1+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U8igH8JJigb9KAtoATyqmJS3UzQx91FsjHiZtNL1vAIjrvxOHGh84TbIwZTa4qqE0qE78TP/faV6LwCtuzLSmheIkKex2E5/lkMAumBt/odFsOheckejodR9R3lzaY2xxN+dqESVwQed+s3XKV9KPPYczloe69mUWGQ3DGzHhwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2r1lWsH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2r1lWsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0B41F000E9;
	Thu, 16 Jul 2026 06:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784182214;
	bh=7Y8eug/xe8Uwf5nHwth6Wtx8g3cAktjmFFMynmMrbcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a2r1lWsH7TOtcKgF7V7ZCmwoYzpUa1EPjMEUf9q3Sh1U2+lY02O7UgEUG3/TIci+H
	 2hrkFh0dllbCErNTLRAJK8vIwNxL32xVcbFrzKQ/mksxloMcNEG71q3+tHiPH6E/Po
	 cazEb5iaVKfdU/ZEcJGQKRQfGHs2PIkdYwvT6p8dr3iMcHviKlCLmLAbK2xSev8bp0
	 srWaKcw8Upohgf+HG4nDFzW2id45di0bTXhFgtsJJtWythoPupaGYA26tzMBakdTb5
	 Gvp7wcYY7yZCqw52+B6Fy48MmiXmvtdZ+wLLuz4/JWvivs4Z8RItTXmkJnNrwzWIjG
	 sdAcF6dJlr6fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable quad
 SPI mode for SPI-NAND
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Sadre Alam" <md.alam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716-quad_dts-v1-1-74d86792944a@oss.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716-quad_dts-v1-1-74d86792944a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 06:10:13 +0000
Message-Id: <20260716061013.CF0B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The device tree changes attempt to enable Quad SPI mode, but the=
 underlying controller driver hardcodes single-bit transfers.
--

--- Patch [1]: [PATCH 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable qua=
d SPI mode for SPI-NAND ---
commit fa94f9522a125598be3f36fef708de141603218d
Author: Md Sadre Alam <md.alam@oss.qualcomm.com>

arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND

This commit sets the SPI-NAND device node to use 4-bit transmit and
receive bus widths to enable quad SPI transfers.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm6=
4/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index 62877b46f9b3f..86138529ba77e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -249,6 +249,8 @@ flash@0 {
>  		nand-ecc-engine =3D <&qpic_nand>;
>  		nand-ecc-strength =3D <4>;
>  		nand-ecc-step-size =3D <512>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <4>;

[Severity: Medium]
This is a pre-existing issue, but does enabling the 4-bit bus width here
actually result in quad SPI transfers?

Looking at the QPIC controller driver in drivers/spi/spi-qpic-snand.c,
qcom_spi_cmd_mapping() intercepts generic SPI NAND opcodes and hardcodes
SPI_TRANSFER_MODE_x1:

drivers/spi/spi-qpic-snand.c:qcom_spi_cmd_mapping() {
        ...
	case SPINAND_READ:
		if (snandc->qspi->raw_rw) {
			*cmd =3D (PAGE_ACC | LAST_PAGE | SPI_TRANSFER_MODE_x1 |
					SPI_WP | SPI_HOLD | OP_PAGE_READ);
		} else {
			*cmd =3D (PAGE_ACC | LAST_PAGE | SPI_TRANSFER_MODE_x1 |
					SPI_WP | SPI_HOLD | OP_PAGE_READ_WITH_ECC);
		}
        ...
}

It appears the driver completely ignores the bus widths negotiated by the
spi-mem framework, meaning transfers will silently remain single-bit.

Are there companion patches to the controller driver to handle the wider
bus widths, or is this device tree change ineffective on its own?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-quad_dts-v=
1-0-74d86792944a@oss.qualcomm.com?part=3D1
