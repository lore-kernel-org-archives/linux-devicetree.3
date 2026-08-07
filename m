Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B64376A19
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121118; cv=none; b=Enud9qv1LZBG30GGXSnJpRlE4Mwmr400UHf7RbYnPEFNyzObnf/QX8azbsK1B8raqnpkTulkYWhb7Sycozn9M6rPpXia8RnP2oXO/BnXp/GOfsoURLtOzmw8G7i/e++1dLCV+qcXHVJOIoyNL80hIWb5zznHk1Gf+9UK2VW6SjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121118; c=relaxed/simple;
	bh=2vsTg7lnoLQt8WGcwTR4XzTAd5XD74z4/nNNcn4wcX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rH6p4RvrOBdBW4oNCv1/f3HAGPo8dMHaJee0Wje21yIZbcJi8/5Oz6YNTUon5Ke6pMFZLDIB2hraSQhaSS0iYAJS338KmskSAJmO409on1g2H7rnGeG3RQDyDGF1/h+CjJ8eI7Udhzsf3tVE2mxtvsvVKNDBq3aK42CVmCAUMbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOc64mgj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOc64mgj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE181F000E9;
	Fri,  7 Aug 2026 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786121116;
	bh=qg7+7z1jPt2JkHRPch8pDSwye3qFc5dYeHkpFklzAAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oOc64mgjwkJf+QrUVjOz5w8fftQpVU1OIpyI4mMypbHoP00hfHfMd7H8x7GTevJwA
	 RdhMfoU0srZOvClCRzMTdj93j+4LDnnfQyXZROkSO3u/fhFmV0Ri61StMGR3SEISyR
	 HDkliWB5NAQnzKewCs9W/J7bzbXia0k09Jqa1y9lVr4t9iWRnRZxYGec7Km6KePsMv
	 ErwiJGBFx82ERjXuEvHBiYK/hIYwFdYZ5fRRtXQW3W+XvzPC2nHNuqgz5r8AlhfS+H
	 CYh5Mxr5RJQEyDQ5Nyf3mlaQr1OaJg1E1GkMp/Ter+KyRmmh8h5anT2+4aX3L7W7Ud
	 fiCxHwUgeZYQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable
 quad SPI mode for SPI-NAND
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Sadre Alam" <md.alam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260807-quad_dts-v2-1-6f578d4152b7@oss.qualcomm.com>
References: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
 <20260807-quad_dts-v2-1-6f578d4152b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 16:45:15 +0000
Message-Id: <20260807164516.5AE181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding spi-tx-bus-width =3D <4> breaks SPI NAND writes because the=
 spi-qpic-snand driver explicitly rejects Quad Program Load opcodes.
--

--- Patch [1]: [PATCH v2 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable =
quad SPI mode for SPI-NAND ---
commit bae8660983c8ddf15356080523eb2d131962463a
Author: Md Sadre Alam <md.alam@oss.qualcomm.com>

arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND

This commit sets the SPI-NAND device node to use 4-bit transmit and receive
bus widths. This allows the controller and flash to use quad mode instead of
single-bit transfers.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm6=
4/boot/dts/qcom/ipq9574-rdp-common.dtsi
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
[ ... ]
> @@ -249,6 +249,8 @@ flash@0 {
>  		nand-ecc-engine =3D <&qpic_nand>;
>  		nand-ecc-strength =3D <4>;
>  		nand-ecc-step-size =3D <512>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <4>;

[Severity: High]
Does enabling a 4-bit transmit bus width break SPI NAND writes on this boar=
d?

When spi-tx-bus-width is set to 4, the spi-nand core will probe for Quad
Program Load operations (e.g., opcode 0x32) and select it as the default pa=
ge
write operation.

However, the spi-qpic-snand driver only appears to support single-bit progr=
am
load opcodes:

drivers/spi/spi-qpic-snand.c:qcom_spi_cmd_mapping() {
	...
	case SPINAND_PROGRAM_LOAD:
		*cmd =3D SPINAND_PROGRAM_LOAD;
		break;
	default:
		dev_err(snandc->dev, "Opcode not supported: %u\n", opcode);
		return -EOPNOTSUPP;
}

Because the driver rejects the Quad Program Load opcodes, writes will fail
with -EOPNOTSUPP.

Additionally, even if the mapping were updated, it looks like the driver
ignores the data buffer for any opcode other than SPINAND_PROGRAM_LOAD:

drivers/spi/spi-qpic-snand.c:qcom_spi_write_page() {
	...
	if (op->cmd.opcode =3D=3D SPINAND_PROGRAM_LOAD)
		snandc->qspi->data_buf =3D (u8 *)op->data.buf.out;
	...
}

Should the spi-tx-bus-width addition be omitted until the spi-qpic-snand
driver is updated to support Quad Program Load operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-quad_dts-v=
2-0-6f578d4152b7@oss.qualcomm.com?part=3D1
