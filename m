Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16E83C1D59
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408461; cv=none; b=c/qvhRg4u+4GoiDDTtD22/GCh+0dc3oMwOT/43dDqUaGrzB5ECJArfvB6OAEOOPuxqUPIt3etJ+HbLSxfHWxL3L5E4KkVh7jrPhFSGrGEZnQ7TenoWIAXtUOtDI80c31uf2fEW6dOSXkTkFC0/r4YJu9sFkSA5gRBLRgea9Sc/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408461; c=relaxed/simple;
	bh=eWPJJyUhu/hI3UrEsWU1lGQ2pE+KsKj8mIl3dUmIXOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EFPTbWNK7jcR8w1shwbf+h1V0OixQVVSkyzR0KIvjisYgs6pilNnvtqPPRD7Uxsjiz6IkHD9fVb43pGj0e2RiMRSBBrGPaHThUkNVbh95/QGIKHaNXgkkFy0Ya2YRc2p4D4qJN2VbSFaLq6hp84M9zqqVDYENc40zRc0wrbWzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwZAH9ir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwZAH9ir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F6B1F000E9;
	Thu, 30 Jul 2026 10:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785408460;
	bh=cR1c6byXUG+QlEmoRQ+lShCfULyibeZGgf2X7rXwjH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SwZAH9irtoF6n9ankIUPUnmlgcEZyJmu5+d1VeBqJKXlIQCnfqT5BsZVJXkhG+l/q
	 VvPNLna+S6ZX4sNNk77Yd9gaav5Y1zsOfz0a6jfKHRmJ2651WCAwOFLftOh1asLCz6
	 h8eUrCYAgqVP435VVKQdrTQLOTzsxc8Xnkxb35+D4N86hMBkE99HaXEAo/502bJVH6
	 MGy/YCsIEQrR/Sy/h5PzGK5Oi1Vupih1fd9ByhLwKsa/XfFM+MO/vquk1E0FWAHlHk
	 VvELdQgGxiE0QjdBisPZXUL71IunNy8agRAKrPV2E6xTHdyyjbvbNL0gCkmrrrsh1s
	 5ZIW2TxN+QDhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730-rzg2-sr-boards-v4-4-08bc459578dc@solid-run.com>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
 <20260730-rzg2-sr-boards-v4-4-08bc459578dc@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:47:39 +0000
Message-Id: <20260730104739.A6F6B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The standalone `rzg2l-sr-som-emmc.dtbo` and `rzg2l-hummingboard-=
iiot-microsd.dtbo` overlay files are omitted from the `dtb-y` targets for `=
CONFIG_ARCH_R9A07G054`.
--

--- Patch [4]: [PATCH v4 4/5] arm64: dts: renesas: add support for solidrun=
 rzv2l som and hb-iiot evb ---
commit e8396d770c29ff4a18cf3e6df93a8aacf55d42b9
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb

This commit adds support for the SolidRun RZ/V2L SoM on the Hummingboard
IIoT. The RZ-V2L SoM shares its PCB with the RZ/G2L, differing primarily in
the SoC and the addition of a DRP-AI NPU.

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index e2af196e18bf6..5242eff76ef54 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -189,6 +189,17 @@ dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc-=
cru-csi-ov5645.dtbo
>  r9a07g044l2-smarc-cru-csi-ov5645-dtbs :=3D r9a07g044l2-smarc.dtb r9a07g0=
44l2-smarc-cru-csi-ov5645.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc-cru-csi-ov5645.dtb
> =20
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-iiot.dtb
> +r9a07g054l2-hummingboard-iiot-emmc-dtbs :=3D r9a07g054l2-hummingboard-ii=
ot.dtb rzg2l-sr-som-emmc.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-iiot-emmc.dtb
> +r9a07g054l2-hummingboard-iiot-microsd-dtbs :=3D r9a07g054l2-hummingboard=
-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-iiot-microsd.=
dtb

[Severity: Medium]
Should the standalone rzg2l-sr-som-emmc.dtbo and=20
rzg2l-hummingboard-iiot-microsd.dtbo overlay files be explicitly added
to the dtb-y targets here?

While Kbuild will correctly build the .dtbo dependencies for the composite
.dtb, make dtbs_install determines which files to install by strictly
including targets explicitly added to the dtb-y variable.=20

If a user compiles a kernel strictly with CONFIG_ARCH_R9A07G054=3Dy and
CONFIG_ARCH_R9A07G044=3Dn, it appears these two overlays will be built as
intermediate objects but won't be installed by make dtbs_install,
leaving them unavailable for a bootloader to apply dynamically.

> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D rzg2l-hummingboard-iiot-rs485-a.dtbo
> +r9a07g054l2-hummingboard-iiot-rs485-a-dtbs :=3D r9a07g054l2-hummingboard=
-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-iiot-rs485-a.=
dtb

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-rzg2-sr-bo=
ards-v4-0-08bc459578dc@solid-run.com?part=3D4
