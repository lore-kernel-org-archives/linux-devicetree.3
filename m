Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5EC1A6800
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489613; cv=none; b=Td/4Q85kuAQFkvqPp0Rv8DYCdQYSM5T52NneEJC4o0qLFW75AQxuQWbHwYCM2fyVkVOu6D1Vt+Zedpr/aqdsFEJ1XeUb9uMlwcjXZCAZUyQg9V7nqpjH4k7e7ZaqaD4J6ylHb3BrJLw/rPRXs/UbM0rygJSzij9H0pJXJTcoSHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489613; c=relaxed/simple;
	bh=LZk5cZW3bH8ZeCdiZB2UcOefqzowAg0bXKH6He0rBoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BTlESDTkjgsaGCclePD/RhM5edhbRdHGBnym+jiqFWiWsc46JL8SAAz3cnYT84/BIJlLRTkSVpMRNtl8klJs2zt6TYeEzY3w6LZbnhQsj3aJp3ATFDOvjFNBob6H20J3JL8YAst+/pi89c/AyhZ7BsA0P2R56/1Sl6P6ZY2XPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDKOz0ib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDKOz0ib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331981F000E9;
	Fri, 31 Jul 2026 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489611;
	bh=f02xA1VOWhh4l04v2UrSR6HiO+WdAgJSKe1Cz90pXH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WDKOz0ibesHO4rFUJUc5C38TFqZQ2sWD5UoV1YxVpDtBaTDh4hxpFFLYz6TLgtxfP
	 JUJ1lk9Z8C6YM25nj+E5H/4YhMZPUtWa7Z2gy+5hy3cMQBT9BB/VbSlqvM0Det2mcW
	 LEHJVWv29bnO+zHkF2wmeTJpCht7aKUl3hiU9lAbEtwHj4y7SdabPaRa3YuoppCghd
	 pu8lM1PVuIG9gSg5so1bVNbjUjP1B3AnFP27lsm1NASs9Fo8/4bkUJTEBVd6TwrwAU
	 0bR4oXcn1v1irXBW75ZfcVBS+Cf8PHLAfZyZmaOtmZtmD+TsmfqfOaQQQ4H39Y5maf
	 FxLVo9UOaqWzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] spi: amlogic: spisg: Fix the incorrect keep_ss
 of the last descriptor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-a9-spisg-v3-3-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
 <20260731-a9-spisg-v3-3-a15da3f70029@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 09:20:10 +0000
Message-Id: <20260731092011.331981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DMA descriptors are defined using native integer types and lac=
k endianness conversions.
--

--- Patch [3]: [PATCH v3 3/4] spi: amlogic: spisg: Fix the incorrect keep_s=
s of the last descriptor ---
commit b9d6f07e79dcd1e9c5b73de8be6904945ef9d97b
Author: Sunny Luo <sunny.luo@amlogic.com>

spi: amlogic: spisg: Fix the incorrect keep_ss of the last descriptor

This commit fixes an issue where CFG_KEEP_SS was unconditionally
cleared on the last descriptor, causing the cs_change setting to be
ignored for the final transfer. It records the cs_change value and
applies it correctly, even when a null descriptor is inserted for
cs-hold delay.

> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-sp=
isg.c
> index a6123975a37cf..2d66f00dccd45 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c
[ ... ]
> @@ -539,13 +542,17 @@ static int aml_spisg_transfer_one_message(struct sp=
i_controller *ctlr,
>  				       xfer->effective_speed_hz);
>  	}
> =20
> -	if (cs_hold_in_sclk)
> +	if (cs_hold_in_sclk) {
>  		/* additional null-descriptor to achieve the cs-hold delay */
>  		aml_spisg_setup_null_desc(spisg, desc, cs_hold_in_sclk);
> -	else
>  		desc--;
> +		desc->cfg_bus |=3D FIELD_PREP(CFG_KEEP_SS, 1);
> +		desc++;
> +	} else {
> +		desc--;
> +	}
> =20
> -	desc->cfg_bus |=3D FIELD_PREP(CFG_KEEP_SS, 0);
> +	FIELD_MODIFY(CFG_KEEP_SS, &desc->cfg_bus, last_xfer_keep_ss);

[Severity: High]
This is a pre-existing issue, but since this code modifies a hardware-facing
DMA descriptor in aml_spisg_transfer_one_message(), will these native integ=
er
assignments cause failures on big-endian architectures?

Looking at drivers/spi/spi-amlogic-spisg.c, struct spisg_descriptor defines
these fields using native integer types:

struct spisg_descriptor {
	u32				cfg_start;
	u32				cfg_bus;
	u64				tx_paddr;
	u64				rx_paddr;
};

And native values are directly assigned to them without endianness conversi=
on,
such as desc->tx_paddr =3D paddr in aml_spisg_setup_transfer(), or via
FIELD_PREP() and FIELD_MODIFY() here.

On big-endian CPU configurations, won't the hardware receive byte-swapped
values for physical addresses and configuration fields, potentially leading
to DMA faults or memory corruption? Should these hardware descriptors be
defined with explicit endian types (like __le32 and __le64) and updated
using conversions like cpu_to_le32()?

>  	desc->cfg_start |=3D FIELD_PREP(CFG_EOC, 1);
> =20
>  	/* some tolerances */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-a9-spisg-v=
3-0-a15da3f70029@amlogic.com?part=3D3
