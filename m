Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0321732E72F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101251; cv=none; b=sjH+er4Wa2ynGDGO2kPLSdNmn/RQ5rxssyWYyl2speEkxYJHB/ovDS9H8ucTrUo87rDiV21pRAerqNd8YVC6KY96vwjXE6YPzstxVfmg4AQh9gnMPdTTTR3zDy+3jZQAPC9mdqn5+4TD6cWccNO+bHsJA5ZhktVLs/X9egQKPyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101251; c=relaxed/simple;
	bh=1YD9hruAXg/3mayhsw85wv4dNSNp3/vb5gV5ajKkBoA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HgsvajmR8diSDtJm5GKsBakMbQdvvX6r3Zw9Gk+2xJ4FivvGkMpYFQBcHfGVHSGA+Jy9BAaDI8nCZOYfCyjdk3eS45SJtSVUWA+t8cAzzSW/rPK8aHT8Ur4UkAqqcos5xYDn98YDSRxtFfixZkRbv8o6eYu0N4zo8ugFBl+MwO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPzTxMah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPzTxMah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E0A1F00893;
	Wed, 10 Jun 2026 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781101249;
	bh=dvjH8PpKWuNshDDU8XKeJ/5dsMusVknO63gXe/22Gkw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oPzTxMahDJEGhjYfpz6kU+v5ELp+IlBT4pYjb6apK6LHoe8Mw9mwhXdcbgsxCrB9g
	 GhxxfqMw+Szm8UpeomATPsdoa6JrVIUs+w974yXc6S6A12m2WnSDp8NHF7i881L39a
	 +wmWVvtIgJ7T2wAdIIeho6Pu9pEWo/Rhvbw08zJMh2BexqQGZiTkZJWKjow7snJsRx
	 19utffPy5zTzv0mgdhSiS20yxbaPWZp6bjP45eZF4f8aQZt8eGPEDakWs3R8sP88iM
	 RaOYxMRfo7hl2yeQy6PelF7aau6wtxcMKv90uijoo46wu7iMKWdRYwVeUmP/+1r4Mv
	 pYOvuPEQ3IYfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Yeh" <chenyou910331@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610121026.1517621-2-chenyou910331@gmail.com>
References: <20260610121026.1517621-2-chenyou910331@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 14:20:48 +0000
Message-Id: <20260610142049.93E0A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The device tree references an undefined label `&usb`, which will c=
ause a fatal dtc compilation error.
- [Medium] The commit message claims to add support for an 'Onboard blue st=
atus LED', but the corresponding LED node is completely missing from the de=
vice tree.
- [Low] Accidental removal of the trailing newline at the end of the Makefi=
le.
- [Low] Potentially stale or incomplete copyright attribution in the new DT=
S file.
--

commit 1a0c595fbd52010c818ad842d5ef53c54212434e
Author: Chen-Yu Yeh <chenyou910331@gmail.com>

riscv: dts: sophgo: Add Milk-V Duo 256M board support

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC.

>     - Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)
>    =20
>     Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
>     heartbeat LED functionality.

[Severity: Medium]
Is the LED node missing from the device tree? The commit message mentions
support and verification for an onboard blue status LED, but there does
not seem to be a corresponding leds or gpio-leds node in the patch.

> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/so=
phgo/Makefile
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile

[ ... ]

>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v1.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v2.dtb
> -dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2044-sophgo-srd3-10.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2044-sophgo-srd3-10.dtb
> \ No newline at end of file

[Severity: Low]
this isn't a bug, but was the trailing newline accidentally removed from
the end of the Makefile?

> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/r=
iscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + */

[Severity: Low]
this isn't a bug, but is this copyright attribution stale? The file appears
to use a template from 2023, and it might be missing the 2026 copyright for
the current author.

> +
> +/dts-v1/;
> +
> +#include "sg2002.dtsi"
> +#include <dt-bindings/gpio/gpio.h>

[Severity: Medium]
Is this header still required? It seems unused in the newly added device
tree file, possibly because the LED node was accidentally dropped.

[ ... ]

> +&uart0 {
> +	pinctrl-0 =3D <&uart0_cfg>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&usb {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};

[Severity: High]
Will this compile successfully? It looks like the usb label is not defined
in the included base SoC device tree files, which could cause a dtc syntax
error during the build.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610121026.1517=
621-1-chenyou910331@gmail.com?part=3D2
