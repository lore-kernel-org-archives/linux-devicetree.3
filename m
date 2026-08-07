Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD821383C86
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121455; cv=none; b=txh0j0cJ7dMXxYZyp0Pq4vrvpb3/B85zbeZg0My+n1Fc2OjEbPiwa4sD4WHYGMyW2+cSsVgTn1eA5IoIIH7BJj6yNHYb0Y0LPRgwls5xq5HwQk5lR0oD0lVgqw0vzJ0mwpfh/hyl4JzQELWKrfZ5nRL21opve+iplUlTV5Mpj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121455; c=relaxed/simple;
	bh=vq2jEr24qz7iRF1GnW2wsPOndDckkaO/06Ie0MiXIBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RNlDP/1+pr4U600QZKtwBaGZZuzQn+mG4ntyrtRKCXzNktNmmW3H6gUCgBY6cFs23Xd9FAxohM4DlJa68m/7K7zDmRdaFkiW8s2Foehfs6ug1OUfNoxOHRRLJBwmVbRcytyu9aOViKxBXvlKeIdrdjuEQvYr1PGX3/NG37Jt4WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnjpuSsV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnjpuSsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4F01F000E9;
	Fri,  7 Aug 2026 16:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786121453;
	bh=pQrigaqJOyfn+EC3wfgHT+T6J4VTEQe2ZwzouRGakeg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LnjpuSsVub9OUAh0PVMhBAvrCRmOySwrUZYO8lwgw711ytIB/fLjUQXmj1xmh1sgt
	 x+DNeLR+RQ8Fk11Cz/uhb1IWAGhC5a0QkP1QIq9uX9lFXzBFEUngGD0/nQkD+nclMF
	 /ulD1QQO8tCORnsFzl/zHeK+K65s3DTCbMJizNj2eoa6TfOdBROnMEfyoy10OcQqqz
	 6lrg2psyejQju7F7j/S/yaSeCAMQzyK4Kyo2932iXWkLBnXM+Rme89VZ7gBzyp1bLR
	 T71wouILsFtrWOLygABp/wBBo+/EzhToFobgtxG4Ie+syQuTDKlxekyiN1igmq4gTl
	 ftfwJuXMx1uqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad
 SPI mode for SPI-NAND
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Sadre Alam" <md.alam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-quad_dts-v2-2-6f578d4152b7@oss.qualcomm.com>
References: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
 <20260807-quad_dts-v2-2-6f578d4152b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 16:50:52 +0000
Message-Id: <20260807165053.4A4F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Enabling quad SPI transfers breaks SPI-NAND page writes because th=
e underlying qcom_snand controller driver does not support quad write opcod=
es.
--

--- Patch [2]: [PATCH v2 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad=
 SPI mode for SPI-NAND ---
commit 1fa4c052f14795bba0cdda5777b6df317a26eaf8
Author: Md Sadre Alam <md.alam@oss.qualcomm.com>

arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND

Enable quad SPI transfers for the SPI-NAND device by setting both spi-rx-
bus-width and spi-tx-bus-width to 4.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boo=
t/dts/qcom/ipq5424-rdp466.dts
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -257,6 +257,8 @@ flash@0 {
>  		nand-ecc-engine =3D <&qpic_nand>;
>  		nand-ecc-strength =3D <4>;
>  		nand-ecc-step-size =3D <512>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <4>;

[Severity: High]
Will enabling a 4-bit tx bus width break page writes to this flash?

When the SPI-NAND core negotiates a 4-bit write variant (such as Quad
Program Load, opcode 0x32), the operation appears to be rejected by the
controller driver during the actual write:

drivers/spi/spi-qpic-snand.c:qcom_spi_cmd_mapping() {
	...
	case SPINAND_PROGRAM_LOAD:
		*cmd =3D SPINAND_PROGRAM_LOAD;
		break;
	default:
		dev_err(snandc->dev, "Opcode not supported: %u\n", opcode);
		return -EOPNOTSUPP;
}

Since qcom_spi_cmd_mapping() only maps the single-bit SPINAND_PROGRAM_LOAD
(0x84) opcode, won't the 4-bit opcodes hit the default case and return
-EOPNOTSUPP, causing all writes to fail?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-quad_dts-v=
2-0-6f578d4152b7@oss.qualcomm.com?part=3D2
