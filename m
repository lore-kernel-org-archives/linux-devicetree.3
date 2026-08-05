Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A25233924
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 00:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891576; cv=none; b=WsMVHI46uCDafKY3uJl5FddiG1KhKcgmRmrM+QUKXc+xndw+mnoeL0ua15mHb+6jXGAzpB/BJIGBZ1mlxhhDE/JW1SNmGjDt92K5YSzalEoRsrJsXSAcqilF7w4KkdboyDzmurxczCUZBlXwq7AWssNZ56RAhpnKhCJNhm/yxvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891576; c=relaxed/simple;
	bh=jlTjpwwPzgqIEqsUTM8CEP+mT2oM2eLclLXHF3u4O+w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cF/mTET83t64qRgB8gUS43LU7nQE2NpHq0l49yUbktOlx1se9qvlIdvpJejGZS/IZewjzL2QCvMdQMr1tRoh+YG2nMBm7LY3Iu5sfjbjsKhqfIlsFTyz3jI213hDVc7nFgBQoLBXF81lSAsBn1dTyt2t0TlXwjA3w3jiXAETqw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeS3vVal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeS3vVal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD3D1F00A3A;
	Wed,  5 Aug 2026 00:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785891575;
	bh=1+vY0oGKKZBnaJ0d+FA2v3Od/r1iqGjNWR+nSecOEg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AeS3vValfQ60hEN4wJlb0hpWjtdi5jQeBaekflLYMBh52W8khHpRB+mIFYMoX56F7
	 N3z6D9hCygWo6ia5TFp0opElGofMFKlgrEvSuVCMFMMhy8aDJ3Agzq5LHJi1LR/AzP
	 DTe88QKN/KuKmDQIHdHtsIf13Dvj2B6hopGo3LfXktdQd6RUr2+FAAgQjxsL+XTgFZ
	 ZKeXL0+nVcTsPp4P3v8U10rkP6d5GfO368AmC3BwD12JJjar/SJSJysvVCULK8LiZ4
	 hlfKnnqTdyxBDmFtJbq3CcYjES+NWsBDLYHNzpmRYtAqOu/l+mGkXbcsj7hKWdgOm/
	 j3v+rYAmJoYyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: k3-am64: Enable IO expander
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805004821.416613-2-jm@ti.com>
References: <20260805004821.416613-1-jm@ti.com>
 <20260805004821.416613-2-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 00:59:33 +0000
Message-Id: <20260805005934.EAD3D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Dropping the internal pull-up on the PCA9538 IO expander interru=
pt pin on the SK board may leave the interrupt line floating.
--

--- Patch [1]: [PATCH v2 1/4] arm64: dts: ti: k3-am64: Enable IO expander i=
nterrupt ---
commit 9cfc964128ea9c7e025ee14807e51340a913a87a
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am64: Enable IO expander interrupt

This commit configures the MMC1_SDWP pin to function as the interrupt line =
for
the IO expander on the AM64 EVM and SK boards. It moves the pin out of the
MMC1 pinmux node and assigns it to the expander node, setting it up as an
edge-falling interrupt.

> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts=
/ti/k3-am642-sk.dts
> index d28a38c87f32a..aa87845d77598 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> @@ -198,7 +199,6 @@ &main_pmx0 {
>  	main_mmc1_pins_default: main-mmc1-default-pins {
>  		bootph-all;
>  		pinctrl-single,pins =3D <
> -			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
>  			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
>  			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
>  			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* (#N/A) MMC1_CLKLB */

[ ... ]

> @@ -210,6 +210,13 @@ AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MM=
C1_DAT3 */
>  		>;
>  	};
> =20
> +	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */

[Severity: Medium]
Does the AM64 SK board have an external pull-up for this IO expander interr=
upt
line?

The original MMC1 configuration for this pin on the SK board used
PIN_INPUT_PULLUP. Since the PCA9538 interrupt output is typically open-drai=
n,
configuring it as PIN_INPUT here drops the internal pull-up. If there is no
external pull-up on the board, could this leave the line floating and trigg=
er
spurious edge-falling interrupt storms?

> +		>;
> +		bootph-all;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805004821.4166=
13-1-jm@ti.com?part=3D1
