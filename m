Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4436B93F
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425943; cv=none; b=NMlmZ8gFalV76lh9t7u38dFBk3lbLITZMznHrCu11Bjs0W79+96viMD1+zVihxVq8CT+YFlVsJ+b3WeAAG9lJ5v1s/fqcrfblictuJw+xX2wdvJmtY523fX4YocFF7Fe3faFdf2zp/PZpTGTyHKi+iIDMqnusBrR45bkVDy7B0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425943; c=relaxed/simple;
	bh=FPY+gIPPcmrCvn289zNdj6553+cvU5qRBEcIY3Fobns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sePBLimoJTKTq2v6F+hif65Of4458mGc1bHkxqOQwpWQcn0FVX+j4zgbW6Ftyy/Tm63/cGHlW7Cmxq9hAuP68x8uwC4bmvIFWw6FGmiwhjcfY5ATbbau0U8ujB2+Te6RnLbZ16FDO8KPTp7Kwd00IBswtZa4RuNW63wc6pG/pEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNXGd0Ze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNXGd0Ze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD541F00A3A;
	Thu,  3 Sep 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425942;
	bh=FvHbdynlOcQ1qPX1bWqrLNnrHMx+Xq9NvBsf4ep63P8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNXGd0Ze54H+hl8RDqjw37hzz5/Ei1sHY/BpY0gPTbm0+U0wUPZ50TAFBxnaxnCa5
	 HaVjo6f8W/gOBuRjt5OSr3vjmfnAiCXotT1gH/CCn44n3Lw5eRfV8unnp9kwUn/Vsc
	 0j3NqS257vQRlJ6jGibYq9PIM5J4hut6A3rgdNwtaUrs4IeEytGzqHre8+jrUNXzPN
	 EpXyFQ4gJTHjw2xfX8UITeADvT0tEJe95NXqqJUgpayfSSfyQvehpdd8JOPKwZP/dn
	 G+c7gGSCtzhRMz9PsLH/+h/o98cZYkw2VqpOvc/B7hIIOfiutbGi/lq9XnknjrFuP9
	 cBvTIv5GnEwCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-mibox4-dt-v2-2-fbe7c04472a7@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v2-2-fbe7c04472a7@stu.hqu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:59:01 +0000
Message-Id: <20260903085901.9CD541F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Makefile entries are not alphabetically sorted.
--

commit 70cc330a6bc43bd5cfd305fe463356587a2e4a7d
Author: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>

arm64: dts: amlogic: add Xiaomi Mi Box 4 support

This patch adds initial device tree support for the Xiaomi Mi Box 4, which =
is
based on the Amlogic S905L SoC. It enables the main on-board peripherals
including eMMC, Wi-Fi, HDMI, USB, and audio.

> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/a=
mlogic/Makefile
> index 57bc440fa55cc..9f357df5fc54e 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905x-nexbox-a9=
5x.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905x-p212.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905x-vero4k.dtb
>  dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxlx-s905l-p271.dtb
> +dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxlx-mibox4.dtb

[Severity: Low]
Does this break the alphabetical sorting of the dtb list? It looks like
meson-gxlx-mibox4.dtb should be inserted before meson-gxlx-s905l-p271.dtb to
maintain the correct order in the Makefile.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-mibox4-dt-=
v2-0-fbe7c04472a7@stu.hqu.edu.cn?part=3D2
