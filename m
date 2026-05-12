Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C8A370D69
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778553786; cv=none; b=frcUFXzsZ+6Je+KY41FxmNzoRnJomBx90ck/WspdDb1fapAkbBEOrYcbuIK8vSnZT5o9Oez2T/bQZG6cZi3ao4jQiZmipVzn79/JsnoRMT1aXbzRjX6BoK7zze3lVpTBIzPpHkd31c27K8f5GqTreO16mu7ZJT7oQs5kaa3RHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778553786; c=relaxed/simple;
	bh=78i5b6mLn9djuKgPWWXsfJk3rnM5XlzANMx9lMGD3VA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=czZhJrL8uufQPw3SwQLy9A1cnoUYlwML9tO8C8iPIMEMqc9Rg+yHdK4PW8R1L49TtZbbybVxhxYA0cFa3JmRwRq2+5/dDJFSpqhgoe3D+X8mrHbCPoul5t3oTspak7yCpSq8kXOAOX8r7CDAHXtcWTm8d9YQzz4N2g2+R83Vxmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blyP9FKL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blyP9FKL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF50CC2BCB0;
	Tue, 12 May 2026 02:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778553786;
	bh=78i5b6mLn9djuKgPWWXsfJk3rnM5XlzANMx9lMGD3VA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=blyP9FKLhGxz/HNHNan7hsDOMBlU7SYW4iFxTuNd4lltIox3Wiz2Lleb5wLt9rYJK
	 kw5PDpIs06NnI5Ga9OzM8009ymM9HAF5c/gCQrPd+6758uV8orYDQ9pvtfBrEdVrxI
	 nuP0dtON63ScKAgqybkqheMI0ibabJ3Yj4eP765QcTz0SIRa/U5e2ooS5wvzA879Px
	 oFj4j5Gq7Hd803X+xXFmfNblboSbA84Gv0SgUT98flv2YLQ9w4EC2eWsw2pWCWjzOL
	 SFlcjFFU6MgGVop1Y4dge8uYRJPwNsnaakZNKTEXxPXv70GENo5fxU2v8WsfG66dRI
	 BgZ7WsfOCy75Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
Reply-To: sashiko@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260511-rzg2-sr-boards-v2-3-82aebbd27891@solid-run.com>
References: <20260511-rzg2-sr-boards-v2-3-82aebbd27891@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:43:05 +0000
Message-Id: <20260512024305.DF50CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The composite DTB targets for the RZ/V2L board are missing the '=
-iiot' identifier, leading to inconsistent naming.
- [Medium] The shared device tree overlays are not added to the install tar=
gets for the R9A07G054 architecture.
- [Low] The `-dtbs` composite variables are populated using `+=3D` instead =
of `:=3D`.
--

commit 1346fdf98939d24bedd9085cb7ddffee29247fcf
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb

This commit adds device tree support for the SolidRun RZ/V2L SoM on the
HummingBoard IIoT platform. It utilizes shared code and device tree overlays
from the existing RZ/G2L series.

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 37cfefe66a308..cdf59f3240e27 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -188,6 +188,15 @@ dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc-=
cru-csi-ov5645.dtbo
>  r9a07g044l2-smarc-cru-csi-ov5645-dtbs :=3D r9a07g044l2-smarc.dtb r9a07g0=
44l2-smarc-cru-csi-ov5645.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc-cru-csi-ov5645.dtb
> =20
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-iiot.dtb

Should the shared device tree overlays be explicitly added to the install
targets for CONFIG_ARCH_R9A07G054?

Currently, overlays like rzg2l-sr-som-emmc.dtbo and
rzg2l-hummingboard-iiot-microsd.dtbo are built as intermediate dependencies,
but Kbuild's make dtbs_install only installs artifacts present in dtb-y.
Without being added to dtb-$(CONFIG_ARCH_R9A07G054), will these standalone
.dtbo files be missing from the installation directory?

> +r9a07g054l2-hummingboard-emmc-dtbs +=3D r9a07g054l2-hummingboard-iiot.dt=
b rzg2l-sr-som-emmc.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-emmc.dtb

Are these composite DTB targets missing the -iiot identifier?

The base board is named r9a07g054l2-hummingboard-iiot.dts, but the targets
omit -iiot (for example, r9a07g054l2-hummingboard-emmc.dtb). The equivalent
RZ/G2L targets correctly include it, such as
r9a07g044l2-hummingboard-iiot-emmc.dtb.

Could this naming discrepancy cause issues for deployment scripts
expecting the -iiot substring to locate the RZ/V2L DTBs?

Also, this isn't a bug, but is it intentional to use +=3D instead of :=3D f=
or
these composite variables?

In Kbuild, :=3D is generally the standard convention for defining multi-DTB
targets, as seen in the surrounding Makefile entries.

> +r9a07g054l2-hummingboard-microsd-dtbs +=3D r9a07g054l2-hummingboard-iiot=
.dtb rzg2l-hummingboard-iiot-microsd.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-microsd.dtb
> +r9a07g054l2-hummingboard-rs485-a-dtbs +=3D r9a07g054l2-hummingboard-iiot=
.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-rs485-a.dtb
> +r9a07g054l2-hummingboard-rs485-b-dtbs +=3D r9a07g054l2-hummingboard-iiot=
.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-rs485-b.dtb

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-rzg2-sr-bo=
ards-v2-0-82aebbd27891@solid-run.com?part=3D3
