Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B45A4483B1
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114132; cv=none; b=YoVqjNOO/vI4J2SAQcP8M36O2O1POErfRFVKBMq08cZZpBvl9pzvR7UMQzbbR4227TNI7X1YTJgtUuoMJ4+lsCzQBBLvfNzJp7oaugK9u+T7f6rDjfYuuTS82RLzYi765Ci6pfKeNR7QU9008NBhGbN6J7vRC4WyLx9yMzQSxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114132; c=relaxed/simple;
	bh=4909ZvzqE/qBkcTGctD2aEwJFWkjePdcil0/KSV46/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3p5vcfm7ialdNRAMM4IEy0id7erqHembA4uP7cdXDeJdOT/Q76atxea+dgjua9jm1L/47dCjilk/X5IUTr7Gwi8v7L3fX2KY1EJo0v90bMiX4yrtopapQZ329kzgMz1bgdlR1KYWlwZVCkn62hx6D6ye3sR3AfwrZVaGe00C+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bzUt7K+j; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bzUt7K+j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C9724E40DDF;
	Wed, 15 Jul 2026 11:15:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28C9D6035C;
	Wed, 15 Jul 2026 11:15:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 382CA11BD1518;
	Wed, 15 Jul 2026 13:15:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784114126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4909ZvzqE/qBkcTGctD2aEwJFWkjePdcil0/KSV46/U=;
	b=bzUt7K+jxAzqnf65ic/3Zie1qUXtfMBGduxbcKwUfBdB1KeAAZfgZ/B7xaRDidQOL2PpN4
	yqdRp3nwCPDU1UsC51v/JUPSWtl6syPTBbMZesdWBiW8crQ7Tn5NG2pzEAgQEoa736/qlg
	6pgk8z0Abu7J7saLFLyPNtIvH5eufO7hAgGl9F8cFkTDLW+9DiziKVZovPCqzYVibM9h+9
	uR7FlrzvlVezzkPZ9llu9KcYfSjuv0KpAJ8p23dA4G3z7pw6l++foLmhk6BV3U+eBhLSTk
	UBZAUdFnCQM1bSyWnheRIsBLKNr9VE2INnZ8TJ1TrZkcN2oSRwBPvOL7GziK2A==
Message-ID: <f81a233a-ad96-499f-8a79-c3418dc99ac3@bootlin.com>
Date: Wed, 15 Jul 2026 13:15:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
To: Christian Marangi <ansuelsmth@gmail.com>, Coia Prant <coiaprant@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, robh@kernel.org,
 krzk+dt@kernel.org, heiko@sntech.de, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-2-coiaprant@gmail.com>
 <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com>
 <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
 <6a574873.3027643f.39eab0.b4c0@mx.google.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <6a574873.3027643f.39eab0.b4c0@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Christian,

> I think the idea of Maxime is to test that series on most Scenario as
> possible to verify for fragility or regression on it.

I've tested your RFC on a few boards that use the .select_pcs() callback,
and didn't find any regressions :)
> (but just for Maxime the feature is getting actively used on OpenWrt by 3
> different SoC and no complain for now)

I have no doubt that the fwnode PCS registration works, however there's no
user of the .fill_available_pcs() path in this series. You may not have access
to HW to test this though, but this is my main concern that we discover issues
when using "internal" PCS with the new API.

I _may_ have time to play around with is on mvpp2, hard to say when though, but
feel free to send another iteration for review :)

Maxime
