Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655133;
	b=fNYgJv9nmCM10dTX2OI6fCNhxJIgVSHZnC5dgiOqLlW2vSWHMr2E7qhqbqOTKVQCqhsK
	 iMms6CxHJQh08V2J9PtIjDKROALQ9Td7hjw0hQfLspu6PZUmwo9EurF5p+wMz9xl5BhqK
	 Gs7WuRO1Pd/+VyxPeslVivTQLMoLit1aUmSrwJgbTCqnaeXhNW4mxVB2dLhwdeDeID03D
	 5ebvslO52gdb6OjuwO74eDehJyuKxcz7Z2AG0VTwgMHfupQLxtaoO67kB31XdXOlHkdMk
	 MB2P1Pbv+OOs/s6M8NHT9qlEEgrBkw2xF0P/HoKAMVj6xB96Loex8T6GhKuR6gBiNpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655133;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qRpQAEjbRWH0r5g7MXwq/UpiaEON6BpLBkYKni8ayh0=;
	b=sZygAt2TRM7CjTRjU58mcbze3a1CJOwE4SsoOkI5DyU2c0tezd126B+o28Lqh3nF5lpi
	 mltZDjVHNpOKu+lJeRCGVCpy9az0pVmOvwe9KI6ewYSl/vbHTszRUqDOaleF/tt0AulbK
	 MqXrUlkkMx8hPCZVdXShN9PXOWjvvsD+hGcnOMqABC8QUdbRdu2r/vMlnrEPQHM4n9Cns
	 fGm0rihPiH3zMNTbOXrOqpLlqgl4xCeoMjnHv/d7HfIruFciyBzzCDHOm89PszbL5LNvr
	 1gLJo7s4bx/cfCbSbmJdidHxUphNtenAHW+WSt09vBmRQC3RkOH8CGYY27QeNVsl9wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="N6/cYmSL";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBD4606A31E;
	Thu, 26 Nov 2026 01:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCBD4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N6/cYmSL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9813E1596;
	Wed, 25 Nov 2026 17:05:28 -0800 (PST)
Received: from [10.43.3.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1607E3F632;
	Wed, 25 Nov 2026 17:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795655131; bh=c+M9C5R7IaV7aTw3Nf4cb/CDqUlPqYRMkhd7EMv4HRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N6/cYmSLbhG8aliXW5w93tk/mDSePs79g3T6DAWxzmaBtF1T9+ukEJ9KcOKSjFFAp
	 wqBqXz98NcEPqU/u38jc3cAr5Vi78JmQxnJr88UpJH8Ek1S46gl98t4jNIjLsuIqwO
	 ocCXR0LLLC3UISJ111FRB67rAB5HOWvaPfnjtpUY=
Message-ID: <0750993c-1f37-46e1-884d-a4d2cffc76f7@arm.com>
Date: Thu, 26 Nov 2026 01:05:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: a133: Add KickPi K5C
To: rajanyadav0307@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Paul Kocialkowski <paulk@sys-base.io>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
 <20261120-k5c-dt-v1-v1-4-d9681df67bc0@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261120-k5c-dt-v1-v1-4-d9681df67bc0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/20/26 08:22, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
> 
> The KickPi K5C is a single board computer with an Allwinner A133 SoC.
> Mainline Linux has no support for it yet; its factory firmware runs a
> vendor Linux 4.9 kernel. Add a device tree for PCB version V1.3, which
> has:
> - 2 GB DDR3 DRAM, 8-bit eMMC (HS200) and a micro SD card slot
> - an X-Powers AXP707 PMIC, which drives VDD-CPU from DCDC2 and DCDC3
>    in dual phase mode
> - a HYM8563 RTC on I2C3 (PH12/PH13)
> - power input through a 12 V DC jack or the USB-C port (5 V)
> - two USB-A ports behind an on-board USB hub on USB1, whose power
>    switch is enabled by PL8
> - a blue status LED on PL10
> - the debug UART on PB9/PB10
> 
> The regulator assignment and the pins come from the board schematic
> (V1.3) and were checked against the vendor's device tree and on the
> board. The pin bank supplies are the same as on the Baijie HelperBoard
> A133. All tests were done with the board powered through the USB-C
> port.
> 
> Mainline has no binding for the AXP707. Its chip ID register reads 0x51,
> which U-Boot's AXP803 code accepts, it works with the AXP803 driver, and
> the vendor device tree also describes it as an AXP803, so the PMIC node
> uses the AXP803 compatible.

... as on every other A133 board, so please drop the lengthy explanation.

> Not described yet:
> - Ethernet: the board has a Maxio MAE0621A PHY, which needs a driver
>    that is not in mainline yet

Is that so? In the v1.3 schematic that I am looking at, it shows a 
Realtek RTL 8211F, and also the board pictures on the KickPi website 
clearly show a Realtek logo on the chip next to the magnetics and the 
Ethernet socket.
So what is going on here?

And besides, even if you have a Maxio PHY: how is this clocked? Does it 
have an external crystal oscillator? Or is it clocked via some PWM / 
clock fanout pin from the SoC? Only in the latter case you need the PHY 
driver, with a crystal it should work with the generic clause22 
compatible string. Once we get a driver, the code will auto-detect the 
PHY ID and use that driver, for a potentially improved feature set.

Cheers,
Andre



> - the Wi-Fi/BT module (VS6621S40, Seekwave SWT6621S) on MMC1: there is
>    no mainline driver for it, and in my tests its SDIO card did not come
>    up after a cold boot, so the slot is left out until that is understood
> - USB data on the USB-C port (USB0): the vendor's firmware uses it as
>    a peripheral port, but I could not test that yet
> - the RTC alarm interrupt on PB8: first tests pass, and it will follow
>    in a separate patch after more testing
> - display, camera, audio, the IR receiver, the fan header and the
>    battery connector
> 
> The CPU uses the A100 OPP table, like the other A133 boards today.
> 
> Claude Code (Anthropic) drafted this device tree and its message from
> the schematic, KickPi's documentation, the vendor device tree (as a
> reference for values only) and my board measurements; I reviewed it
> and tested it on a KickPi K5C.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Link: https://lore.kernel.org/all/d4d89cf9-884d-424b-927d-5b6692f50327@arm.com/
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>   .../boot/dts/allwinner/sun50i-a133-kickpi-k5c.dts  | 228 +++++++++++++++++++++
>   2 files changed, 229 insertions(+)
> 
