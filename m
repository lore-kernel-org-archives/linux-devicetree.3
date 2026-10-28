Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214278;
	b=W5Rjq7+DgecukPqECoPiq2dL6tWylHE1jig8Qbi5zP3auinyJT/VqJH4GXvB5QOQr7CX
	 Ktno416MmdkpHfMINKMkAFGUxDgSBY9tUsvo7YuUYfiBO6AA+ouGqQI6T6LGv4k5OeoNo
	 y/KrsmCQgztx01xnUOBXGKSafke9pwdeyL5CoqE4utwSmXgDr2q000xbJ8hOUUgK3p0AF
	 CRgI3D1CnJCVn3VrOlFRBgxoVf94VOwamnY2Q8/hu027WVk/msO34zNMMxnkqH7eICP2d
	 67jgfpI5pF23MgxtgY7VaKuUVraa32yXf1f+DTVTc/fk33JgwGvnNKQV/Xb5/9XLl9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214278;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Bc0HfZxtzWTRdv29CMaqfwui9DrY7T5TZbvYfm5LC3A=;
	b=Whn1ve3NAleJpIXuBEnGunWXEYAzfn7Xa07Iyedz+ZsJx76Yn+GwCfgbbDoR1npcqEM3
	 8iZhMZwZHX2NdpVVSEQ6hah0sLLM6NdOND1hUQUp6xaF4KMfkTx3qmE2JJMRg/69fx/8g
	 /AiDDYA+KoBV6yYuffAmVXsPtTPsVbftS3EIXyih0aV6Tpw6lZXJkxzSDF2bJEgU6xsGT
	 TCDJeQfi8BJ4yH5LDGDIYRwF6iVBIG/vl1WYsOmXpjKac620yhucgkM1/PpbQiXRIcutO
	 Ynk3XWRwBr368hU0wMbAGgg/Q2/R38gPbpmTZ5VH1nAL3hdlT5s6mnHMYeimszBJZOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hh/sFhlP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5166B60A5BCF
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 19:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hh/sFhlP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64F31F01828;
	Wed, 28 Oct 2026 19:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793214278;
	bh=Bc0HfZxtzWTRdv29CMaqfwui9DrY7T5TZbvYfm5LC3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hh/sFhlPVVozh+VXBZOFcO5DruA3rgmvnF2ugVGwrgi1gHmfHA5j5g0wuMiTbs9nT
	 9KeoQTBnG3pUQKGT1kIm8qKw7Y3FyNhmwXXGL6s6o2xGgufRZpr43/wr7gD5K8qVBq
	 mu0WtSNBdemPghInAbvsdvvQbrPXPbsarHxErHCbt5o1mi+5uIXB11ml/Dc3oAPuA4
	 ZNZpVqtoObr5tcvOjkqq/6GOOQAZ3bCsXqJO0QzHwGl6RTBOFba6b00NkahAWX8DTd
	 cckk9AMJAkguAjGgB4LfxyA/IGLWR79+ag/kyGagPRwrAq7fajMzFnHXr1s8njw2pu
	 /Lw+74Uu8fvlg==
Message-ID: <sashiko-outbox-188326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] powerpc/dts: Add Device Tree for WatchGuard Firebox
 T30 (v5)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lefteris Koutrakis" <lefteris.koutrakis@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028185407.26952-1-lefteris.koutrakis@gmail.com>
References: <20261028185407.26952-1-lefteris.koutrakis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 19:04:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] powerpc/dts: firebox-t30.dts placed in OpenWrt path and missing =
from Makefile
- [Low] powerpc/dts: undocumented watchguard vendor prefix and firebox-t30 =
compatible
--

commit f6c5f758b9931c759d889087f336848b7b3fbdff
Author: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>

powerpc/dts: Add Device Tree for WatchGuard Firebox T30 (v5)

This commit adds a device tree source file for the WatchGuard Firebox T30
board based on the Freescale P1020 SoC.

>     powerpc/dts: Add Device Tree for WatchGuard Firebox T30 (v5)
>    =20
>     This commit adds initial device tree support for the WatchGuard Fireb=
ox T30
>     board and enables building firebox-t30.dtb under CONFIG_MPC85xx_RDB in
>     arch/powerpc/boot/dts/fsl/Makefile.
>    =20
>     Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
>=20
> diff --git a/target/linux/mpc85xx/files/arch/powerpc/boot/dts/firebox-t30=
.dts b/target/linux/mpc85xx/files/arch/powerpc/boot/dts/firebox-t30.dts
> new file mode 100644
> index 0000000000000..ec6cf911c66f4
> --- /dev/null
> +++ b/target/linux/mpc85xx/files/arch/powerpc/boot/dts/firebox-t30.dts
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Device Tree for WatchGuard Firebox T30
> + * Author: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/include/ "p1020si-pre.dtsi"

[Severity: Medium]
Was target/linux/mpc85xx/files/arch/powerpc/boot/dts/firebox-t30.dts meant =
to
be placed at arch/powerpc/boot/dts/fsl/firebox-t30.dts instead of an OpenWrt
target directory?

The commit message states that building firebox-t30.dtb is enabled under
CONFIG_MPC85xx_RDB in arch/powerpc/boot/dts/fsl/Makefile, but that Makefile
is not modified by this patch:

arch/powerpc/boot/dts/fsl/Makefile:
    dtb-$(CONFIG_MPC85xx_RDB) +=3D p1020mbg-pc_32b.dtb p1020mbg-pc_36b.dtb
    dtb-$(CONFIG_MPC85xx_RDB) +=3D p1020rdb_36b.dtb p1020rdb.dtb p1020rdb-p=
c_32b.dtb
    dtb-$(CONFIG_MPC85xx_RDB) +=3D p1020rdb-pc_36b.dtb p1020rdb-pc_camp_cor=
e0.dtb
    dtb-$(CONFIG_MPC85xx_RDB) +=3D p1020rdb-pc_camp_core1.dtb p1020rdb-pd.d=
tb

As a result, Kbuild never builds firebox-t30.dtb when CONFIG_MPC85xx_RDB or
CONFIG_OF_ALL_DTBS is enabled, and the relative /include/ directives for
p1020si-pre.dtsi and p1020si-post.dtsi in firebox-t30.dts cannot resolve
outside arch/powerpc/boot/dts/fsl/.

> +
> +/ {
> +	model =3D "Watchguard Firebox T30";
> +	compatible =3D "watchguard,firebox-t30", "fsl,P1020RDB";

[Severity: Low]
Should the watchguard vendor prefix and watchguard,firebox-t30 compatible
string be documented in the devicetree bindings before adding them to the r=
oot
node in firebox-t30.dts?

Currently, patternProperties in
Documentation/devicetree/bindings/vendor-prefixes.yaml has no entry for
"^watchguard,.*":

Documentation/devicetree/bindings/vendor-prefixes.yaml:
      "^wand,.*":
        description: Wandbord (Technexion)
      "^waveshare,.*":
        description: Waveshare Electronics

Running checkpatch or dtbs_check will report undocumented DT string and sch=
ema
validation failures without the vendor prefix and board binding documented.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028185407.2695=
2-1-lefteris.koutrakis@gmail.com?part=3D1
