Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7B439A054
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309358; cv=none; b=Hstevf/SG8S7F3PDaz1ViTBha/AIrDt49xk/CN8rVH0Q019/eDxL46bZV5SwBAskj6/Hiu8TuCmMrxfDA0vYtwNkNzu87F//sFG8BPQeqNEvtIW/vNNWFEkMcy/JZ171egNrqVCbIiyAItFqoLBaCbwTQsc5ezR3uXorx3Ittd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309358; c=relaxed/simple;
	bh=g3lcVT3E2frj3iZhFfneYuOmXU4BZAnnV9R9z35Z9TA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pHh5lZMgbAlVFdwMfu/0mkfY0GD9ItmXuzf5jas16vHN1N1rza8HZFsbwUfLJfdlyXBhtVcllVmmWiZGjwFXbkMTvMWR9x8Foh0hMj0C+XLggru++iMt85HDVXzw+xHcVVRRvf0AIapHhMMo1yCXVQRLgjVIbT8G4yXXayMAgJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdLgAt+k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdLgAt+k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E711F00898;
	Mon,  1 Jun 2026 10:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780309354;
	bh=7eCr9VVqTGvp44y9pSa/iX2t35Tz2D5C/lfbwnWZxes=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HdLgAt+kA1YFir8XNmPpKWudpV8hjWpOiyPWmO1N+ugnXEDoImPS8b/U2FrvL7hMo
	 GAMtthhBYmnD13yfyiRq5n5a5ilIYJCyTH5aNE/xlCSzrsWFKVwB9xbC8Az6UBvYDE
	 y5Epp9UCHaJkGAdVN+n6x5lmDHebDaEZF5GRHqxbdcWngIRZMszjEavdGoc3Qs3C6q
	 p+t7/2e7UaKDEEvGa7SmxJqYfHq0zmyirr3bpuNXfOc3J70fjAW9JtZC0dNluXe5Gq
	 12K0rHZQeNCJEGNWObFzZtPhPrNK4ZUiUu5WwVZ1oPt/y3NWp2Jsy3IIeupwgP/kHg
	 zO85UIkbCxYUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601-ultrarisc-pinctrl-v2-2-07ac5130a96d@ultrarisc.com>
References: <20260601-ultrarisc-pinctrl-v2-2-07ac5130a96d@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:22:33 +0000
Message-Id: <20260601102233.F2E711F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Kconfig symbol ARCH_ULTRARISC is referenced in 'depends on' =
and 'default' but is not defined anywhere in the kernel tree.
--

commit ae98cd11bdead29c422db358de808560e3f3ab23
Author: Jia Wang <wangjia@ultrarisc.com>

pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver

This commit adds support for the pin controller on the UltraRISC DP1000 SoC.
It provides mux selection for pins in ports A, B, C, D, and LPC, as well as
basic pin configuration controls.

[ ... ]

> diff --git a/drivers/pinctrl/ultrarisc/Kconfig b/drivers/pinctrl/ultraris=
c/Kconfig
> new file mode 100644
> index 0000000000000..a9257dda5d656
> --- /dev/null
> +++ b/drivers/pinctrl/ultrarisc/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PINCTRL_ULTRARISC
> +	tristate
> +	depends on OF
> +	depends on ARCH_ULTRARISC || COMPILE_TEST

[Severity: Medium]
Does ARCH_ULTRARISC exist in the kernel tree? I couldn't find a definition =
for
this Kconfig symbol. If it's missing, this driver will only be selectable
when COMPILE_TEST is enabled, leaving it disabled for its actual hardware
target.

> +	select PINMUX
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINCONF
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GPIOLIB
> +
> +config PINCTRL_ULTRARISC_DP1000
> +	tristate "UltraRISC DP1000 SoC Pinctrl driver"
> +	select PINCTRL_ULTRARISC
> +	depends on OF && HAS_IOMEM
> +	depends on ARCH_ULTRARISC || COMPILE_TEST
> +	default ARCH_ULTRARISC

[Severity: Medium]
Similarly here, ARCH_ULTRARISC is used in the depends on and default direct=
ives
but appears to be undefined.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ultrarisc-=
pinctrl-v2-0-07ac5130a96d@ultrarisc.com?part=3D2
