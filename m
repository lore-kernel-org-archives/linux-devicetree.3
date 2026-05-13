Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EED3C0A1E
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708551; cv=none; b=uYJ9MjQeteTsmYglfdRdupOZWgn6Sgd6EPhwHxHrNK1RhKcWsRwXtXHrQE4PvCuDYONwPJahxv5Tmp8175/+/t9pMrmhO2y1znAtDDssPXOG0sRW6sgZpQViZrrOZGA3DNn6ntCQ14RCdvqC2S0J+0QBmH3GFdwABbIoa5l8yyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708551; c=relaxed/simple;
	bh=rjj8Bdklo6UmIE1qoNEoR1HnWNuagq4cOumsnUUpnIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z1qsuMWA9z2P3Ks0MZhcT5n+5PwzvrP6lY7QparvIUiST177khJkeucALKBgUpDHkGmFv1w30IlPWyv+rSsfyWrRqx9z+8U0tEuNKhOXCh7w4wsHgnCut7QvNXGvcRgbA605tIgO07wQd3toX1XTUkCykwdXW03ONcp/FNCzAes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trKbagZq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trKbagZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EF6C19425;
	Wed, 13 May 2026 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778708551;
	bh=rjj8Bdklo6UmIE1qoNEoR1HnWNuagq4cOumsnUUpnIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=trKbagZqyy0cTtpW/d9Vs9PaNdsVgIK6TwRV3P+fC1EiGzUCdCnrP4daFQCUiKzPH
	 TipZSKGMCc/5h7KbF9/L5hMmbly3QNy8okkELJhkCwlEKpkGyeh4PBSLTXXyJj5l0O
	 Wv1MXP75RZRY/3+m7AKXSGdGpSiHM/lk8U34diSAYxa5lcywu1w+zxsvfviODiNkpT
	 w7HagMnlLoFjl1O3hfqY6IUlcrZETMaaxNhgx27UxA0qcgdTVteR3dk/spAxXguyKp
	 rwc7BiSK9ZENtQfluhkIJjcvEAA9MWlRLwFCEDqitHicSZ6JRIQNtNcBpFiKdkjdpp
	 Xhk2WcjXULUVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-rzg2-sr-boards-v3-3-f033fc96c906@solid-run.com>
References: <20260512-rzg2-sr-boards-v3-3-f033fc96c906@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:42:30 +0000
Message-Id: <20260513214230.C9EF6C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The eMMC and microSD standalone overlays are omitted from dtb-$(CON=
FIG_ARCH_R9A07G054) targets.
--

commit 2aa4e018f2033b5a47eb3f69fb35447ebe753d2f
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb

This commit adds support for the SolidRun RZ/V2L SoM on the Hummingboard
IIoT carrier board. Due to similarities with the RZ/G2L, it shares most code
and device tree overlays.

Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-v2l-som/
Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 38163ce845e7a..cff17cb8574a3 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -188,6 +188,17 @@ dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-smarc-=
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

Are we missing standalone dtb-$(CONFIG_ARCH_R9A07G054) entries for the emmc
and microsd overlays here?

> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D rzg2l-hummingboard-iiot-rs485-a.dtbo
> +r9a07g054l2-hummingboard-iiot-rs485-a-dtbs :=3D r9a07g054l2-hummingboard=
-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-iiot-rs485-a.=
dtb
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D rzg2l-hummingboard-iiot-rs485-b.dtbo
> +r9a07g054l2-hummingboard-iiot-rs485-b-dtbs :=3D r9a07g054l2-hummingboard=
-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-hummingboard-iiot-rs485-b.=
dtb

The rs485-a and rs485-b overlays are explicitly added to the build targets
above, which ensures they are copied to the output directory during make
dtbs_install.

If a user compiles a kernel exclusively for RZ/V2L where
CONFIG_ARCH_R9A07G054=3Dy but CONFIG_ARCH_R9A07G044 is disabled, will
the emmc and microsd overlays fail to install as standalone files?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-rzg2-sr-bo=
ards-v3-0-f033fc96c906@solid-run.com?part=3D3
