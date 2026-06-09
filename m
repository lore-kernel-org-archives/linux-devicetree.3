Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044994C0427
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031780; cv=none; b=IkfIEpP28j+qerNP1ObmCiq50F5h3Ix0QyjC3P1LPGJNMgvC64PvoORt81ynvLMuAP5MdEelIgEuA/t+MTJWOIakhMA0i8IUJ+qDfrlyRtMHObbaDjN5AD6QvOMGGizO+n/PBaf5bMyufdEvuHDEsq3kCXBkQoEWCVhN0v4+nY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031780; c=relaxed/simple;
	bh=EJk7BFb0mYcKEzbj1uXJieOAG824d3hZuSPEHyyHZY0=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TaKMkl0no8Mtz3fZ1eg88t8Gv7rSfta8UqcOTcBPTZiatB/nq0qYY2d29zPtBqTn4tNpz9okBPcUrhd0q+4HDlyFvzJ0xjgzG1kIdCca7FUDN1f9xgw/V4qIKj3ZAhjdRoa6IlXJzxgli/yXlTPcoS6KQGyfUJnV+9ZeTYTyU+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGowtne7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGowtne7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7564D1F00893;
	Tue,  9 Jun 2026 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781031778;
	bh=yGwWaWdsjXDBiV6S3Covo50UWnLTACyy74VXb8rm5jE=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=VGowtne7ofCUA1M+DPivl8Z+jx+GkxFtJIAJ/VJtqAJDf/cbjcs4pm1IeYcHkgrkC
	 nJJ6gU8/X4tRBwH1iBcSPsvN5ZADDzI2B/7Xu5e0CY/48Co+E6PsQRG9NvUXsv9p6+
	 kBK/DEbUWwwIKQ0sxDFoFbuLQjT9x7VGhoy3wHOAAilnNUDaiXWcmyg7esNp6Xwnms
	 qYggk0E77WUeES8LR055bEhNPq+205omUpyQbI16EfdAwW/dx5tZZKkLz16IwEcXcI
	 QpBqTFHlf5bUCZRhyS8WSW7dW+ZEfRCg1/2qYBBCHcHnaqxPWgat1EUVyTAKfWo/Gl
	 LVhohzVkSvK5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: var-som-am62p: Fix wkup R5F
 memory region size
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-6-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-6-16afba97fbe0@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 19:02:57 +0000
Message-Id: <20260609190258.7564D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately describes the prior state of the=
 code. It claims that `wkup_r5fss0_core0_memory_region` was reserved with "=
only 0x0f00000" (15 MiB) and implies it is being increased to `0x1d08000`. =
However, the diff reveals the previous value was actually `0x01e00000` (30 =
MiB), meaning the patch is shrinking the reservation rather than expanding =
it from `0x0f00000`. The commit message appears to have been copied from an=
other patch.
--

commit f780a29b02dfe26af92ddc65f0520382d3c6c8e7
Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size

This commit updates the wkup_r5fss0_core0_memory_region size in the device
tree for the AM62P platform. The size is adjusted to match the MCU SDK link=
er
expectations for the wkup R5F firmware.

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/exam=
ples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-a=
rm-clang/linker.cmd

> The wkup_r5fss0_core0_memory_region was reserved with only
> 0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62P defines the DM code/data DDR footprint differently:

[Severity: Medium]
Is this description of the prior state accurate?

The commit message states the region was reserved with only 0x0f00000,
which implies the patch is increasing the size.

However, looking at the device tree changes in this patch:

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/b=
oot/dts/ti/k3-am62p5-var-som.dtsi
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c8=
00000 {
> =20
>  		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>  			compatible =3D "shared-dma-pool";
> -			reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +			reg =3D <0x00 0x9c900000 0x00 0x01d08000>;

The previous value was actually 0x01e00000 (30 MiB), meaning the region is
being shrunk to 0x01d08000 rather than expanded from 0x0f00000.

Could the commit message be updated to reflect the actual previous value be=
ing
replaced in the device tree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-topic-am62=
a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com?part=3D6
