Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69253371889
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270983; cv=none; b=Iclq3rICTiI559qJMWCCtu25WyVjDov4jIYUuwNMHKloN6bOl0BFtl+VqMG3VkCqxShBQPQFYSs/LASjI7+n8DmEdgWhINO9tSqd86GbkwCMiSb5SXumhxlEEvSCdrvrI4NCzLH3zHHb2oS4A7ZITJTI4fZ87wHrezb6L67JWWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270983; c=relaxed/simple;
	bh=2w3Nd1zNdgMkm1/2IBkgvm8E9AVorGf23sHpWLdJRNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L1eZqq37nlX1TN8zgSRMEg+sIH1if4B++rrmqIemCU93j70hTQA27DOPqUc+fdnTvWxre+Z0LnxsFjCuVqFdt0D0B2AljFTJv7+xebznE8NF6sO76tch+uTohaYxhzW/Kisw0ANLgY34S1CvBuE1j9DeUTA75KHX1tlF5TdKJuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCc0bzAA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCc0bzAA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954B01F000E9;
	Sun,  9 Aug 2026 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786270982;
	bh=LwI1GuEhqCDTDx/FM00PI+3yU/tQnI9sJCfVzcWdqtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fCc0bzAAIkwR2pJcjEuVr1oJOoFM+f1VlS+K84D2ma49FDD/HgjNA2efgYqVYtkjg
	 ZMLI2ZL0onbKbhLYEOSZstGmMuqt0V2tP7vLwlZ0SSvRQzuVqA4iXgzqKiW3Fsitc+
	 V34qgMufvMO0FT5fSzVZz4TVDF3qVrhcvuaXx2gUWLkpeVGGsAoIUT+08tI8k9eOCF
	 yW32FhMzpIqqM/hcVg69q6US9/KCULBUnoq7sl27XOi2CKtRUUINf0Tr7Dr7n0kGPs
	 Ay+cMgNuXIVdPsI2rnW0eF8bDyjj1X41RStmmqyVsO1V/62So8cs/do9ZOtWv2UIMy
	 SgeJqVaO+QLoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] ARM: dts: stm32: add Ruiside ART-Pi2 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Changjie" <liucj1228@outlook.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <PH7PR19MB6088189B91180CD218008160ACDF2@PH7PR19MB6088.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <PH7PR19MB6088189B91180CD218008160ACDF2@PH7PR19MB6088.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 10:23:01 +0000
Message-Id: <20260809102301.954B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Inconsistent Alternate Function (AF) mapping for SDMMC1_D2 pin
- [High] Missing alignment constraint for no-map DMA pool causes MPU region=
 exhaustion
--

--- Patch [8]: [PATCH v2 8/9] ARM: dts: stm32: add Ruiside ART-Pi2 board ---
commit 7778d903d666ebc7aafa183daaea78a638999301
Author: Liu Changjie <liucj1228@outlook.com>

ARM: dts: stm32: add Ruiside ART-Pi2 board

Adds the ART-Pi2 board based on the STM32H7R7 SoC. Includes configuration
for external HyperRAM, UART4, user LEDs, button, and the microSD slot
with a coherent DMA pool.

[ ... ]
> diff --git a/arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts b/arch/arm/boot=
/dts/st/stm32h7r7l8-art-pi2.dts
> new file mode 100644
> index 0000000000000..ead1418178af7
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32h7r7l8-art-pi2.dts
[ ... ]
> +	reserved-memory {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		dma_pool: dma-pool {
> +			compatible =3D "shared-dma-pool";
> +			no-map;
> +			size =3D <0x00200000>;
> +			linux,dma-default;
> +		};

[Severity: High]
Does this no-map memory region require an alignment constraint to prevent M=
PU
region exhaustion?

Without an alignment property, memblock may allocate this 2MiB hole at a
default alignment. On ARM Cortex-M7 (PMSAv7), MPU regions require power-of-2
sizes and aligned base addresses. An unaligned hole can force the MPU to use
many small regions to cover the remaining RAM, quickly exhausting the
typical 8-region limit and silently truncating system memory.

Could we add an alignment =3D <0x00200000> property here?

> +	};
[ ... ]
> diff --git a/arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi b/arch/arm/boot/=
dts/st/stm32h7rs-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..08f09f5621964
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32h7rs-pinctrl.dtsi
[ ... ]
> +&pinctrl {
> +	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> +		pins {
> +			pinmux =3D <STM32_PINMUX('C', 8, AF11)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF11)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */

[Severity: High]
Is it intentional that SDMMC1_D2 uses AF12 while the surrounding SDMMC1 pins
in this group use AF11?

If this is an oversight, the D2 data line will not be routed to the SDMMC1
controller when initialized in 4-bit mode, leading to communication failure
with the SD card.

> +				 <STM32_PINMUX('C', 11, AF11)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('C', 12, AF11)>, /* SDMMC1_CK */
> +				 <STM32_PINMUX('D', 2, AF11)>; /* SDMMC1_CMD */
> +			slew-rate =3D <3>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
> +	};
> +
> +	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> +		pins1 {
> +			pinmux =3D <STM32_PINMUX('C', 8, AF11)>, /* SDMMC1_D0 */
> +				 <STM32_PINMUX('C', 9, AF11)>, /* SDMMC1_D1 */
> +				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */

[Severity: High]
The same AF12 mapping appears here for SDMMC1_D2 in the open-drain
configuration group. Should this also be AF11?

> +				 <STM32_PINMUX('C', 11, AF11)>, /* SDMMC1_D3 */
> +				 <STM32_PINMUX('C', 12, AF11)>; /* SDMMC1_CK */
> +			slew-rate =3D <3>;
> +			drive-push-pull;
> +			bias-disable;
> +		};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/MN0PR19MB6091DB524E=
7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com?part=3D8
