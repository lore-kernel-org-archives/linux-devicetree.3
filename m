Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D312FE056
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246966; cv=none; b=NaaT7ESmjw6uo0OEznFlv6vPbVEiEjVdPXsZ3XiGe/hOJf7nVa0mIoW6Pggi/oZCBKl7k3OjQdIIv5a8jLPs3kUP0PB925uFmT/Ucp7YMHoEGr/Fg3Q2rpMvkNGclBHjbZZa9q0k4IOdNLECsTlAinoU4Y75r7zC1KnqLAK6qsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246966; c=relaxed/simple;
	bh=GHufoTvjdV/q0YSPANTPsP9Q4n0CjQGSqnJg3y+BKdE=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=i1dMfTPFj5CQ4gWjDD/+N5EF0kI3dcd7qtTjptmxmVKdOXqiMrqhQNRKFXnMMiLDmBO+mZ7BAE2sjP8cLboviCGD5oRJWrdSS9Z+8KMjWtGx37JhonheKuA3BbJW5a1wqUxAxO8lsEk+Yti42M0W5K/f4vqLyTx5n1mU6H0iBtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wCwyU-0008Gi-E6; Wed, 15 Apr 2026 11:55:58 +0200
Message-ID: <382d28eb-557c-4cae-898c-8ed5c8cd7843@pengutronix.de>
Date: Wed, 15 Apr 2026 11:55:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
To: Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: [BUG] stm32mp135-dk: DT uses PA13 used for LED and button at the same
 time
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hello,

I just noticed that barebox built against the v7.0-rc1 device trees
reports following error:

  ERROR: gpiolib: _gpio_request: gpio-13 (led-red) status -16

This is caused by the combination of following two commits:

57012d79fefd ("ARM: dts: stm32: add UserPA13 button on stm32mp135f-dk")
31f0d9a486a8 ("ARM: dts: stm32: Add red LED for stm32mp135f-dk board")

Both reference the same &gpioa 13. Linux didn't seem to mind, but
barebox fails the LED driver probe, because the GPIO had already been
requested.

Assuming it is correct that they share the same GPIO physically,
does the current DT description make sense though for actual use?

Blinking the LED would register a button press, so it feels that they
should rather be mutually exclusive?

Thanks,
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

