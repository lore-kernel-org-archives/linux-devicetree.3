Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C2466AF1
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620302; cv=none; b=FImRek/ECTiQvWIjc04XNTDnPlVM/bjVW1oYfI75ebHAgMGuZ4uytNTjNjcjBKuS67X/Urroce3n6by9mzOePu9JFlO5g5HyPdSymlUVFtC2O91RTPyiXc3lzFFZijmjWj7TF6pdmAIfYrvSECnsX+4LsJj8mtap14Ll4uSYGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620302; c=relaxed/simple;
	bh=cbuL62jVJR93tfZ6jSmbmbJNDYn6JVPpz5svom32UVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TAW09oWphxQZ3050gRjgAswfLaZDDV78K+tlcWrn/pQ6ZvM8KLDH+HGoLNj/2GQucVEZdI9GbCfhWSa+Xkn+kvmJMq23AvAsRyyfPdrORHt+EokNpvphZmpeiisvtDP443rrKvBWaPvrjdlRh82iLlHJ9VNbdivCgmuipQCDGbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdfgQtxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdfgQtxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9481F000E9;
	Thu, 13 Aug 2026 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620299;
	bh=FWzGlvvRe9Ha0O/NpYm9nCRYsii7F3cXCdemI8Osgrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fdfgQtxqt6fClMyc47+ewuPrdDCDVU2G4IVg5SZZJY/C8hx5ibIHjiKpyodebqKzS
	 MmWD530HKPqktd03CGYI6DmPdIVqlbyCb5VrLAank5Cp7WVFDaLxXbb1MeoA+P7Xb7
	 fakgZ/skWt4qGqVsFbEvBzALRD14Dqcw3kan1vkRfnxZbnWx9oPPvPnjwHEMMolp1t
	 82Q5h4NCdeBJ8St2KJv1m61naHaBy7HtI8pW96s6noUFrTcBp2swhFki2v9lRtwyWK
	 ai9NIolIS8GxYZefVfX7b5BgnQkmiDG6LFs7JJbQgTe00gdkrtRaRcRgP4Ite8QCsF
	 Ih7Q3mSU4aoaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins
 as OUTPUT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813111238.56892-1-francesco@dolcini.it>
References: <20260813111238.56892-1-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 11:24:58 +0000
Message-Id: <20260813112458.BA9481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Setting MMC clock pins to PIN_OUTPUT disables the receiver (RXACTI=
VE=3D0), which breaks the internal clock loopback required by the MMC contr=
oller for read operations.
--

--- Patch [1]: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pin=
s as OUTPUT ---
commit b7e315f9edd8f485234748a2f8e267539b5b0f30
Author: Francesco Dolcini <francesco.dolcini@toradex.com>

arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT

This commit changes the MMC clock pins for the K3 AM62x Verdin module
from PIN_INPUT to PIN_OUTPUT to match the TRM documentation, effectively
disabling the receiver (RXACTIVE =3D 0).

Link: https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O S=
ignals [0]

> diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot=
/dts/ti/k3-am62-verdin.dtsi
> index e97b2b047d104..895b1b7dcac71 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> @@ -573,7 +573,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0)  /* (AB22) MDIO0_MDI=
O */ /* ETH_1_MDIO, SODIMM
>  	pinctrl_sdhci0: main-mmc0-default-pins {
>  		pinctrl-single,pins =3D <
>  			AM62X_IOPAD(0x220, PIN_INPUT,        0) /*  (Y3) MMC0_CMD  */
> -			AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */
> +			AM62X_IOPAD(0x218, PIN_OUTPUT,       0) /* (AB1) MMC0_CLK  */

[Severity: High]
Does configuring this pin as PIN_OUTPUT disable the receiver (RXACTIVE=3D0)=
 and
break the internal clock loopback?

TI MMC controllers generally rely on this internal clock loopback path to
synchronize incoming data for read operations. While the TRM documents the
logical direction of the signal to the external card, disabling the input
receiver might lead to eMMC read failures and timeouts.

>  			AM62X_IOPAD(0x214, PIN_INPUT,        0) /* (AA2) MMC0_DAT0 */
>  			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */

[ ... ]

> @@ -589,7 +589,7 @@ AM62X_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0=
_DAT7 */
>  	pinctrl_sdhci1: main-mmc1-default-pins {
>  		pinctrl-single,pins =3D <
>  			AM62X_IOPAD(0x23c, PIN_INPUT,        0) /* (A21) MMC1_CMD  */ /* SODI=
MM 74 */
> -			AM62X_IOPAD(0x234, PIN_INPUT,        0) /* (B22) MMC1_CLK  */ /* SODI=
MM 78 */
> +			AM62X_IOPAD(0x234, PIN_OUTPUT,       0) /* (B22) MMC1_CLK  */ /* SODI=
MM 78 */

[Severity: High]
Could this change similarly break the SD card read loopback?

>  			AM62X_IOPAD(0x230, PIN_INPUT,        0) /* (A22) MMC1_DAT0 */ /* SODI=
MM 80 */
>  			AM62X_IOPAD(0x22c, PIN_INPUT,        0) /* (B21) MMC1_DAT1 */ /* SODI=
MM 82 */

[ ... ]

> @@ -601,7 +601,7 @@ AM62X_IOPAD(0x224, PIN_INPUT,        0) /* (D22) MMC1=
_DAT3 */ /* SODIMM 72 */
>  	pinctrl_sdhci2: main-mmc2-default-pins {
>  		pinctrl-single,pins =3D <
>  			AM62X_IOPAD(0x120, PIN_INPUT, 0) /* (C24) MMC2_CMD   */ /* WiFi_SDIO_=
CMD   */
> -			AM62X_IOPAD(0x118, PIN_INPUT, 0) /* (D25) MMC2_CLK   */ /* WiFi_SDIO_=
CLK   */
> +			AM62X_IOPAD(0x118, PIN_OUTPUT,0) /* (D25) MMC2_CLK   */ /* WiFi_SDIO_=
CLK   */

[Severity: High]
Will setting MMC2_CLK to PIN_OUTPUT clear the RXACTIVE bit and prevent the
WiFi SDIO from properly reading data?

>  			AM62X_IOPAD(0x114, PIN_INPUT, 0) /* (B24) MMC2_DAT0  */ /* WiFi_SDIO_=
DATA0 */
>  			AM62X_IOPAD(0x110, PIN_INPUT, 0) /* (C25) MMC2_DAT1  */ /* WiFi_SDIO_=
DATA1 */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813111238.5689=
2-1-francesco@dolcini.it?part=3D1
