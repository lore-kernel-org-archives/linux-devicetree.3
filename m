Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A513AD26
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778785449; cv=none; b=qrAuwgtkIkRTJLDQmAPtjZZRfOxPYcUPajudgOCZi+uH2sJfd9byGA5REYDeFcYb4AMpRDXwsbBL4QctECTpNVH0A8wgWBmBbfVBYs5oeoRY+coJR9CDulorly+PNKCLrfNUtxQi/53GfLuOTTdT2YlONzySDBCC8QG2oj7aFYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778785449; c=relaxed/simple;
	bh=H7CzD9khQ39TUAJEf8xoWKI1wpq8IEcH1KzoD67MfxQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hLH7VZ72l8+PYu0xmmf9klohX6XFYvMX42KzQtnjjPhDsTOl45XS0UqfcUDJZ3lK1/Xky/t7bYs5v7RSEkTXeXlxGYvyxEqWMF9UDFJ2cjhZuI1sjjGmqvinc3gkotkwWpX5TQsX4HwCvk5BqaQ04Y5lXy/hxNQX8FMABLNfylk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HC+waF6y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HC+waF6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2447CC2BCB3;
	Thu, 14 May 2026 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778785449;
	bh=H7CzD9khQ39TUAJEf8xoWKI1wpq8IEcH1KzoD67MfxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HC+waF6yfhm2YiOhZxeAbqfEjVs4ZIF/2n7r25h1L+XPnoqu+wpI35WJJK0aZEUUd
	 0ThR46M5FWDnt9gNE0LKarrd6fwF5szknA7Q70nwmqo/AtbAlcrkOifWq3YCiyPTDg
	 XDZCSIrsLsMeUGP0IQNF8KDV4PWiKvnhs5nIzhN/JMDzhbUknJmrCzuxn9EzNyDoze
	 FA5I7f2r9CYZSFKaNIUUwuNuslqWNX7nco55AbbuLVNgdA9lV0rlWwLDbyLwxG3T3n
	 VLN303Z+0eIC69AifOHme+XWBICKa8TbX3u6bErFNabZid2toi54ay5Xalm/aHReWa
	 wwvn9QgLg6pkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: socfpga: Add dma-coherent to XGMAC
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514114111.10574-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260514114111.10574-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:04:08 +0000
Message-Id: <20260514190409.2447CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Other SMMU-attached DMA masters in the base SoC `.dtsi` lack t=
he `dma-coherent` property, risking data corruption.
- [High] The `dma-coherent` property is applied at the board `.dts` level i=
nstead of the SoC `.dtsi` level, leaving `gmac1` unprotected.
--

commit 3e00440f9beb8b27250cd5096c497340a958ee43
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: Add dma-coherent to XGMAC nodes

This commit adds the dma-coherent property to XGMAC nodes in various
Agilex3 and Agilex5 board files. The commit message notes that transactions
going through the enabled SMMU are cache coherent, and this property preven=
ts
redundant cache operations.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/a=
rm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> index bdb608bb30ea6..dd878547c3056 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> @@ -45,6 +45,7 @@ &gmac2 {
>  	phy-mode =3D "rgmii-id";
>  	phy-handle =3D <&emac2_phy0>;
>  	max-frame-size =3D <9000>;
> +	dma-coherent;

Should this hardware integration property be added directly to the base
socfpga_agilex5.dtsi file instead of the individual board files?

By adding it at the board level, it appears gmac1 (which is defined in
arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi) is missed. If a future board
enables gmac1, it will silently lack this property, which could cause expli=
cit
arm64 cache invalidations to discard dma writes and result in stale data.

Also, the commit message mentions that transactions going through the SMMU
are cache coherent. Does this mean other SMMU-attached devices in the
base socfpga_agilex5.dtsi also need this property?

For example, looking at arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi,
several other components are routed through the SMMU but lack dma-coherent:

		usb0: usb@10b00000 {
			...
			iommus =3D <&smmu 6>;
		};

		dmac0: dma-controller@0 {
			...
			iommus =3D <&smmu 8>;
		};

If these physically coherent devices are mapped as non-coherent, the kernel
will issue explicit cache invalidations (like dc ivac during dma_unmap_sing=
le
for device-to-memory transfers).

Because a coherent device writes directly into the CPU cache, this post-dma
kernel cache invalidation will discard the newly written data. Could this
cause silent regressions with active data corruption for devices like usb
storage or dma controllers?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514114111.1057=
4-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2
