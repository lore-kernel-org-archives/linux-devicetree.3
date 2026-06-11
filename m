Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D84E367B8A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210013; cv=none; b=ID3kpe+zfq42Ist1PTf2x6eyFCvVp5GFgXhBvemfxq8nzO6LyOQIM/aIHMTBNlvhgoj48K8fTw8qWIZhPejvGQowSs3qNfIqe+xmQic+k8mzsx7UZSnendt5WB+/SiFtaYnu0aDTG+GVnPoI8N41Mm1WeK7Ab/qui2D+MbGQsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210013; c=relaxed/simple;
	bh=1qkBv2E92d47Rqyk4YGIoLhMolxSgS2WPmawO0zUeBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5xdhu3YAha0WY/x9S/2qPL4vASi1NngdaD1XuXfY4Z8/GYLJ3qXG4mlew+cdgOsDrLwPhiWKhJzfKvCA68Ugnv9DqIwUdP77mBskCzVPlbhqtFkdozfgGFyoA7tV4H+D5U9iiOaa4tef6DyxcdN+8BwSYtnmqXdx/zK5KPWQQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXm5Y-0004Tb-Hd; Thu, 11 Jun 2026 22:33:20 +0200
Message-ID: <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
Date: Thu, 11 Jun 2026 22:33:18 +0200
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
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20260611204341.147f1afb@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hi David,

On 6/11/26 21:43, David Laight wrote:
> On Thu, 11 Jun 2026 20:12:32 +0200
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> The LXA boards are the only STM32 boards that set stdout-path = &uart*
>> instead of explicitly specifying a baud rate.
>>
>> This would mean the default of 9600 is used, but it goes unnoticed when
>> booting normally as barebox fixes up a console= line that includes a
>> baud rate.
>>
>> When EFI booting GRUB however, GRUB will not pass along the console=
>> line and thus the board ends up with a 9600 baud Linux console,
>> confusing users.
> 
> Is it possible to determine the current baud rate (by reading the hardware
> register) and default to that value.
> Then if grub has initialised the uart the kernel will use the same
> baud rate.

I think so, yes. In addition to the register divider configuration, one
would need the input clock rate as well, but that's not a problem.

Do you know if any drivers already do this?

Nevertheless, I would like the LXA device trees changed, even if only
to align them with all other existing STM32 device trees.

Cheers,
Ahmad


> 
> 	David
> 
>>
>> This series fixes this. As the device trees were added at different
>> times, they are fixed each in a separate commit with its own Fixes: tag.
>>
>> ---
>> Ahmad Fatoum (3):
>>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
>>
>>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>> ---
>> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
>> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
>>
>> Best regards,
>> --  
>> Ahmad Fatoum <a.fatoum@pengutronix.de>
>>
>>
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
