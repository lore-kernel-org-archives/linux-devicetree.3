Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B244234994
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181932; cv=none; b=GSsscrfUJrsv+9dy0M4fXcZzS7w0ya6x18CWue0lZAEU4JYfPSRPMlbgD5kGzFv39Yd8mv6pBWYorZVuEeG2QfeSMRJapZHee+BWB2pJ0o5LFTl86hAPyqjm37jg+PenZTQw7o72nRqxVg1QEglNJWtUUzqJSVukKVMo856Fb78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181932; c=relaxed/simple;
	bh=H1VbI8LK2IOJPaoqXHAIVbVvzHqtMk+lvwXEkCWZxdM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SwUc3EUaDKuLJojywK1QUWt2yGmgbhiciRzzCKuNoD52KvESLIMIzQeRyvIkjBocCSNkIyb5+Ht+/+WaoyyoIrky2bJgaHOXbt9Uz/1OW6c3X7AVeuo/KaTDHubcv4K2YFcY8nVKthcnVCq3YLcORQ+mH6BsUr2pyDdN8edo934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HctHUCPz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HctHUCPz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925091F000E9;
	Thu, 16 Jul 2026 06:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784181930;
	bh=EFGJr6m98JKT1ewVUGhNkFOtESxFtSZnnIjhrZOT/TY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HctHUCPz5sL1DMNXH2cFFImuroOTDmrTx7UCV9u3PCT3FmmWDTRNlYdsTkSu09AJA
	 lKOgilu+RNAsIwnPjNp3vAQtlgXqkvJuUKJQ0QLclvefwrWPDTni8XmOc+14HTtQpM
	 xVG4+QfCnatHFQBYsC60h0St2zEK7rOh+sP52uhuM9WIODWXRfXPIL4UWGoFuIY3ji
	 zcDM5uq+mRN2WOF9EM9OQDVRbDIZEox8v8sQthi8iHD6DBcC76Hxa5oc+TXa9WlHag
	 F+0WOZ+kEoXFxk3NW0xPpsX4s9W6e6mmGqNoq4tOPOi0BgOBqBfzf7RT1r8e7so8x8
	 2eBoq8bcP98vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI
 mode for SPI-NAND
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Sadre Alam" <md.alam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716-quad_dts-v1-2-74d86792944a@oss.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716-quad_dts-v1-2-74d86792944a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 06:05:30 +0000
Message-Id: <20260716060530.925091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding `spi-tx-bus-width =3D <4>` breaks SPI-NAND page writes beca=
use the underlying QPIC SPI controller driver does not support quad program=
 opcodes, and `spi-rx-bus-width =3D <4>` silently fails to enable quad read=
s.
--

--- Patch [2]: [PATCH 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad SP=
I mode for SPI-NAND ---
commit d94d344a7a9d7f1e09d33f7fca995cd1adf27026
Author: Md Sadre Alam <md.alam@oss.qualcomm.com>

arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND

This commit configures the SPI-NAND device to use 4-bit bus widths for
both transmit and receive by adding spi-rx-bus-width and spi-tx-bus-width
properties to the device tree.

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
Does setting spi-tx-bus-width to 4 break SPI-NAND page writes on this
platform?

The SPI-NAND core parses this property and will attempt to issue quad
program opcodes during page writes. However, looking at the underlying QPIC
SPI controller driver, it appears to reject any program load opcode except
the 1-bit 0x84 opcode:

drivers/spi/spi-qpic-snand.c:qcom_spi_cmd_mapping() {
    ...
    default:
        dev_err(snandc->dev, "Opcode not supported: %u\n", opcode);
        return -EOPNOTSUPP;
}

When the core issues a quad program opcode (like 0x32), the driver will
return -EOPNOTSUPP, causing all write operations to the storage to fail. Is
the QPIC SPI driver missing support for quad page program opcodes, or should
the tx width remain at 1-bit in the device tree?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-quad_dts-v=
1-0-74d86792944a@oss.qualcomm.com?part=3D2
