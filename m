Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894521;
	b=przERLj1H/fa1aGwCdqUcJuQ0KIyi/uuIVWgOiP00/MG+zfnH+y4qaHKeevznw0qPrBp
	 M3XvvNKJK84sHBB906IJDiyY604NhwDX72fIm9wCO6FFMiMUowHCLkcoGH5SWyOWc8+db
	 /WuCOrhrTxGmY40+6JZ+RPqgz6cZp/F5PMr4DtrR76mMtCLGvEYQgqkK+E9iDPcpxegt+
	 TAh3svTYNXGITU53MT0GyUq0zR4OQT+fjTYRB7ylt4UNUtlLyPBAD2O+dpZEV7/LvaZg4
	 p4wP9c7eRN3MKF+FMfIE0ukaonZS9EOMC0/N08Bq1wwID5ct3QrLOBFaxBHURWzQaFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0FXzSzLADqbA1mkd9FIgUiV5sLPN4BXKO5qvNgWsdW0=;
	b=H5zVEgUMBIJib0JZoNLNlBtWSJ2Ho40VMfPK7pV8qznE1HPJB7MnVTITYnVoiXbpDyoD
	 OeM0Yo52k4vQRHOKJ2GvHJvCw4jH2vxLBwSD0BGsrZNYcOIlYUOsf6trVRCcob6sCghHC
	 U/WwqPckyrpwMP364UuVCTVne9+JexjEAFV2xUccntVk+wX1M0v5UvCw6NjllMqy3fzNq
	 zRVFvoHTpimTR2o4eVcE2W1YKvyL2DqmYxiZz3L24zt33ufecsGTYmkWIYW+zaB3AhqfQ
	 Elq2Ri5F1oKF5XyZ0meKhVnK4qIk9kh5Q1XfSJQ500zS3trS29zgMf+nNgT8sHIXrEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHwsP+Nz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F60606CFA1
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHwsP+Nz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156201F00919;
	Thu,  5 Nov 2026 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793894520;
	bh=0FXzSzLADqbA1mkd9FIgUiV5sLPN4BXKO5qvNgWsdW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mHwsP+NzqDkiKUSDxwEvXfkdJ+Cs6W4cKaay6g9IVNOkqnsHQrK/QzNSBuG51JxvD
	 3diL8fedGvt2USBCZ/LTLYLyfFcpWbmxC8ZD49vdBZewHoAaaWWKVG5qPXFI0S/tI7
	 kG+kwxm955LyNqA7HbJV4wBoY5TDlkSyFNONsRf1WnqgFBv89XBRvgoLZdomwF8VIL
	 luozC0o2vaISDqq1sby+huQaCKnoTuXyPFsCajVq8LF5Nw05yIuVgV2XRD6BT/YnHW
	 fcvecr9kuN+u5nUGdQ/RZTiPFHAgzsiMxUaDyB2ik4JBGcfitzlxYn4l87pCW7A6vA
	 f5+VMughyDMkA==
Message-ID: <sashiko-outbox-199396@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev>
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:01:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: siflower: undefined Kconfig dependency MACH_SIFLOWER_MIPS
--

commit c44d6ed3118eced71fa2b4f04b0e4dd618bdded3
Author: Chuanhong Guo <gch981213@gmail.com>

phy: siflower: Add SF19A2890 USB 2.0 PHY driver

This commit adds a driver for the USB 2.0 PHY of the Siflower SF19A2890 SoC,
handling its reference clock, power-on and PHY resets, and sleep mode regis=
ter.

> diff --git a/drivers/phy/siflower/Kconfig b/drivers/phy/siflower/Kconfig
> new file mode 100644
> index 0000000000000..5ae1f83d14494
> --- /dev/null
> +++ b/drivers/phy/siflower/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PHY_SF19A2890_USB
> +	tristate "Siflower SF19A2890 USB 2.0 PHY driver"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST

[Severity: Medium]
Is MACH_SIFLOWER_MIPS defined in the Kconfig tree?

Because MACH_SIFLOWER_MIPS does not exist in arch/mips/ or elsewhere in the
tree, Kconfig evaluates it to n and prevents PHY_SF19A2890_USB from being
enabled unless COMPILE_TEST is set.

Should this depend on MIPS || COMPILE_TEST (or MIPS_GENERIC_KERNEL) until
the platform Kconfig symbol is introduced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
usb-phy-v1-0-db0cad937614@telaak.dev?part=3D2
