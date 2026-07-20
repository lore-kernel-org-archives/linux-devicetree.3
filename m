Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE37D3A962E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527032; cv=none; b=iGJsDxaZxCXyT/g82cdQ4MeBxiVaiY7Iwy/FRHRTAnJCwDdE8JieDn+aQdFAn49CgEYag0ulPR4UCGHiiFiWBwa+TeMeSrnH2gg1AwnhxbwKeAyojQRUk1N1n9/031mUi9AtvNo5bVDSCMMOlR3D1SB3FB5b8yYi1Oo/bl2wFYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527032; c=relaxed/simple;
	bh=aLrUsW8jwtHldeVGvhijtjTuceaprdhc8SG0g2SJfj0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MkXePlZO+qxcpArua9mp2GTb1CB1UgTgmp60qp9exnxcOiL/TRptoOlzSSLpqq1DWfZUoeZ622Wxtw97/sC3Ua0IMWruQ/9uCb5+F5F9SvyGYNhtE4CPmj8dm8bfoiSuR48tWOQjI9jJiSJ46KooWSLnkr3+nA5DltM42hQnfqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COtdtWqH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COtdtWqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33251F000E9;
	Mon, 20 Jul 2026 05:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784527010;
	bh=W9tiU12adFX523XM8iVYNqRGhS0TSBfdQ35YbyIFOqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=COtdtWqHFYGKqw7pCmjWxegzhn/IyEG1oYl8oCoHdicobq6T8c5I/hv43nAoyLpNY
	 h/xyklfUywUDbMIoprj5xvfqt9k9X00BTqhAnPvjaSNegc/YZ7XW6+jbhHROXaYsfj
	 ZTcEWr/gPcO1rQiRknqZTu5RI+wEs/Iqx9Qe42enHFMgOJ+JwXtIedT1Py4nRTph7N
	 cFZCHxL4J/MUV//5Q5oRiXe9r64EDAfZNyXHkD9hMaPXWhzTrBO/7E9gSEOR3wlqti
	 LPSDo04T+EFl+ZXexagOVoTIVYxAIFdFrfATjs3Of606csyUpMvWJA9pJCXwS2Ohgh
	 R3E1suGCUP1DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] powerpc/dts: pdm360ng: Convert ADS7845
 touchscreen to DT bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260719-ads7846-pdm360ng-v2-2-1198bd108502@gmail.com>
References: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
 <20260719-ads7846-pdm360ng-v2-2-1198bd108502@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 05:56:49 +0000
Message-Id: <20260720055649.F33251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked Error Return / Uninitialized Memory in ads7846_setup_spi=
_msg
--

--- Patch [2]: [PATCH v2 2/3] powerpc/dts: pdm360ng: Convert ADS7845 touchs=
creen to DT bindings ---
commit 06fbaa99ffa69ed22e692eeb23d6d33c9a3cdfdd
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

powerpc/dts: pdm360ng: Convert ADS7845 touchscreen to DT bindings

This commit updates the pdm360ng device tree to use the correct "ti,ads7845"
compatible string and native DT properties for the touchscreen. It removes =
the
reliance on legacy platform data injection for configuring the device.

> diff --git a/arch/powerpc/boot/dts/pdm360ng.dts b/arch/powerpc/boot/dts/p=
dm360ng.dts
> index 67c3b9db75d76..05e93ca294ee3 100644
> --- a/arch/powerpc/boot/dts/pdm360ng.dts
> +++ b/arch/powerpc/boot/dts/pdm360ng.dts
[ ... ]
> @@ -176,11 +177,12 @@ psc@11900 {
> =20
>  			/* ADS7845 touch screen controller */
>  			ts@0 {
> -				compatible =3D "ti,ads7846";
> +				compatible =3D "ti,ads7845";
[ ... ]

While reviewing the touchscreen configuration changes, I noticed a detail in
the underlying driver's probe function:

drivers/input/touchscreen/ads7846.c:ads7846_probe() {
	...
	ads7846_setup_spi_msg(ts, pdata);

	ts->reg =3D devm_regulator_get(dev, "vcc");
	...
}

[Severity: High]
This is a pre-existing issue, but does this code ignore the return value of
ads7846_setup_spi_msg()?

If memory allocation inside ads7846_setup_spi_msg() fails, it returns
-ENOMEM, but spi_message_init() would be skipped.=20

If probe continues and eventually calls ads7846_read_state(), it passes the
uninitialized ts->msg array to spi_sync(). Because the transfers list head
has NULL next and prev pointers in this scenario, could this result in an
immediate NULL pointer dereference inside the SPI core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-ads7846-pd=
m360ng-v2-0-1198bd108502@gmail.com?part=3D2
