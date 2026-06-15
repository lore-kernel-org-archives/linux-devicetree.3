Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFEF2C08DC
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510055; cv=none; b=GTmFE5SClAEahtWdF1c5IrPQ4682JbV1D6F+1nIC/vn6tnfRt6YetTaUXs6F8vLzz/ZIaDJXODLkOIPVDyce9vbb8eo7j4144NP+pEOQwjmhrCJE0Spp7kSQd0srqO19hOM9TfuL1aXrK+s2EXxIhSkr+hLJ9CAEl5phXDMjHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510055; c=relaxed/simple;
	bh=70MrE+GqOtYKY53lb/LLJT+lENDvwWBtS7yJjdj2Mvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eh4s0bqOz0JV7baYK8DMWpqDTPnk5zOkPqoS1uZ8xi+BEdij+KMSXOlKaGbdB2jTWsDK+HKcXoXz7Esbx1+Cyg8QjkDoPQD0oPyPHNSnniAwsvOmpaWe5zPCdwZBYiDzHg1j9LAKZ8J2SGix67DWhs72fRPDdaWUI6D7xi4DAGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wZ28k-0006Kb-3t; Mon, 15 Jun 2026 09:53:50 +0200
Message-ID: <f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
Date: Mon, 15 Jun 2026 09:53:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
To: David Laight <david.laight.linux@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
 <20260611204341.147f1afb@pumpkin>
 <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
 <20260612075342.6615d66c@pumpkin>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260612075342.6615d66c@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hello David,

On 6/12/26 8:53 AM, David Laight wrote:
> On Thu, 11 Jun 2026 22:33:18 +0200
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> Hi David,
>>
>> On 6/11/26 21:43, David Laight wrote:
>>> On Thu, 11 Jun 2026 20:12:32 +0200
>>> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>   
>>>> The LXA boards are the only STM32 boards that set stdout-path = &uart*
>>>> instead of explicitly specifying a baud rate.
>>>>
>>>> This would mean the default of 9600 is used, but it goes unnoticed when
>>>> booting normally as barebox fixes up a console= line that includes a
>>>> baud rate.
>>>>
>>>> When EFI booting GRUB however, GRUB will not pass along the console=
>>>> line and thus the board ends up with a 9600 baud Linux console,
>>>> confusing users.  
>>>
>>> Is it possible to determine the current baud rate (by reading the hardware
>>> register) and default to that value.
>>> Then if grub has initialised the uart the kernel will use the same
>>> baud rate.  
>>
>> I think so, yes. In addition to the register divider configuration, one
>> would need the input clock rate as well, but that's not a problem.
>>
>> Do you know if any drivers already do this?
> 
> I've seen it done somewhere, certainly x86, but possibly NetBSD.
> That would have been preserving the baud rate set by the bios.
> You don't want the baud rate changing half way through the boot sequence.

I agree in general, but in this case here, the BIOS defaults to 115200:

https://github.com/linux-automation/meta-lxatac/blob/wrynose/meta-lxatac-bsp/recipes-bsp/barebox/files/lxatac/defconfig#L171
https://elixir.bootlin.com/barebox/v2026.06.0/source/common/console.c#L349

Cheers,
Ahmad

> 
> 	David
> 
>>
>> Nevertheless, I would like the LXA device trees changed, even if only
>> to align them with all other existing STM32 device trees.
>>
>> Cheers,
>> Ahmad
>>
>>
>>>
>>> 	David
>>>   
>>>>
>>>> This series fixes this. As the device trees were added at different
>>>> times, they are fixed each in a separate commit with its own Fixes: tag.
>>>>
>>>> ---
>>>> Ahmad Fatoum (3):
>>>>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>>>>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>>>>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
>>>>
>>>>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>>>>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>>>>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>> ---
>>>> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
>>>> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
>>>>
>>>> Best regards,
>>>> --  
>>>> Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>>
>>>>  
>>>
>>>   
>>
>>
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

