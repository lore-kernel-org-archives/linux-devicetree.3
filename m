Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E731A3F5BC5
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 23:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971176; cv=none; b=KyiCfMadA0NRzZ45jixhc6vjuY+3cEx+/J1O3QODCodEqlwtiN4SRVlPuskxBuQpl46FCA8NyFxSQxHpe8F0BTqWPtdzGJaIQc7Hna7hytKk4njhhCYiuhtlbp+8AIAh3tdpgcxLS0jXJdoY6qTfylIU6SLgnUPK60txv077JHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971176; c=relaxed/simple;
	bh=LDpstRU26Uo0UhLOf+DW/ksIqaNhEyuLMHNMDZvBgEw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jhZQZ7flKGH3F2IpPDDLPem0WMD4ufhgxlBdY0DH02dHEQf5kLA4+p0zHRQydp9xBDRgd1B9ArM8ZysdrdFFmsVj2AVQrPuea05AacFVoj0IFHLyv5NoodCIha/lk4yJem/50ZSF1Zg+wy0GL0KNN+N03fbQAmy74rSvPIN58hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jl68Fm+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jl68Fm+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521AC1F000E9;
	Wed,  5 Aug 2026 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785971174;
	bh=wxxteWKlXMt8O2AfB76u1LLOqG/GE4mlfh8/E7+j1bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jl68Fm+VrFXJDXUGPIqf1EH5qrMGojXR+JRSrSK4uLenSVMDewjzpo9vu4OMypAPY
	 CcP7ysZfj3QAUNCd8NNVn751YctUtCbounC1NClhORp0mSZZYbfAM18b03d/9d4c1v
	 YiyHzJxSOkPuCxWeJzAw/R3Cub9nxUWpOjUSht2E0V+RruZBiYYuTe3UmqJXouCCih
	 yYN5o7iQZtq+iNS8e/wf3RQ2v/Br6h/F0u7tKNonFzNSgsFED3kt4jGRnuD04RfTdC
	 /7IBA5pCnbtGuKY3QNjxhs0sHJWnMUi4hvh3C6VT34/ONjoc7XPOCVYcmUPCfz3m9x
	 c6aH/zuWrL9vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: ti: k3-am62a: Set MMC clock pins as
 OUTPUT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805225438.464184-3-jm@ti.com>
References: <20260805225438.464184-1-jm@ti.com>
 <20260805225438.464184-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 23:06:13 +0000
Message-Id: <20260805230614.521AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix for AM62A TRM MMC clock pin configuration, missing =
the phyCORE-AM62A SOM.
--

--- Patch [2]: [PATCH v3 2/4] arm64: dts: ti: k3-am62a: Set MMC clock pins =
as OUTPUT ---
commit b38183ead6a0951c2fe280be51beca049f7e3062
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT

This commit updates the device tree for the AM62A7-SK board to configure the
MMC clock pins as output-only. This matches the TRM requirement to disable
the receiver.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dt=
s/ti/k3-am62a7-sk.dts
> index 826fff38cfb77..9b120cd9b0c37 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -324,7 +324,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPM=
C0_CSn3.I2C2_SDA */
>  	main_mmc0_pins_default: main-mmc0-default-pins {
>  		pinctrl-single,pins =3D <
>  			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
> -			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
> +			AM62AX_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */

[Severity: High]
This is a pre-existing issue, but since you are fixing the TRM MMC clock pin
configuration for the AM62A, should we also fix the same violation on the
phyCORE-AM62A SOM?

In arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi in main_mmc0_pins_defau=
lt:

        main_mmc0_pins_default: main-mmc0-default-pins {
                pinctrl-single,pins =3D <
                        AM62AX_IOPAD(0x220, PIN_INPUT_PULLUP, 0) /* (Y6) MM=
C0_CMD */
                        AM62AX_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB7)=
 MMC0_CLK */

The MMC0_CLK pin there retains the receiver-enabled PIN_INPUT_PULLDOWN sett=
ing
instead of being updated to PIN_OUTPUT as required by the TRM. Can this cau=
se
signal integrity issues or MMC bus errors on that board?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805225438.4641=
84-1-jm@ti.com?part=3D2
