Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742D24921B2;
	Tue,  5 May 2026 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004652; cv=none; b=ewcQ/iKtJvy17fWGdw31eLpMLG2s5BS8NcyLenDpN0YHwJ5DqEwNpVNO2iv4L49jN0iBN6WLhBcUu78sa4TSEdVc37j/U0Hf52yqy2t0XaUApa7piEsBjI70v93pTk9h6sj5/rYvrx6fWgUgrS68rr6cxc7kRq3Q/vc8ElFHWPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004652; c=relaxed/simple;
	bh=QftOI+uL3NSXDiQJ4xlx2cTriJ118BztrE1iKu5XB34=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=MzO/uQWhuoWE8d8spvRcmtIGH5xQH/a0amJGsQT65PLMgKBHDyeqz0aH83fvpeQOblJ1FkGnpz6DPTrmh3t/xI1YLWZvKw8cLFgGe/k+XcREfV7u799WjOVVkpTz23xxx0dD5hdQDZHyFqmC7lR50X/MVgYfqeA6v11XtrtWy20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Q8SZQKvR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Q8SZQKvR"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E55A027131;
	Tue,  5 May 2026 20:10:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIWZhtpxwpGs; Tue,  5 May 2026 20:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778004642; bh=QftOI+uL3NSXDiQJ4xlx2cTriJ118BztrE1iKu5XB34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Q8SZQKvRjYWkapLVRpN6pDVHuJILmO+k6UXGAvTJRjkrDnUZSl6lg7aVewQ39Lz28
	 Ta9ynvTw3Am/1w2szGhesIVuVGLqvJBbOL5T6AGCQ4IbtThFZZ4DFGuxAgoVV0CJrN
	 PpsZik3HmPouVW1KfBAQCnjppzi5Crrd3t3EDYfvFrowRUP7QpV/wEsvXePE5Wop23
	 qQg5vdXvbNotdbxh5yHNlveM5hZG+2rOUPjGlqNndPXFIFqVyRa4F+J424Mb3Qa196
	 H2mqqoaaGEkeLkBUsR4RRwuyNatZGtXFuHfvFPGNyky66rvGlbWMxFkzQET8GswP0L
	 AmcnlNoTC/6qg==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 05 May 2026 18:10:42 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Zavertkin
 <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v5 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
In-Reply-To: <20260505113001.idgj7ssikjgcypa2@skbuf>
References: <20260420191941.81834-1-adilov@disroot.org>
 <20260420191941.81834-6-adilov@disroot.org>
 <20260505113001.idgj7ssikjgcypa2@skbuf>
Message-ID: <9de0dcc209eab02d2a4e5fcec25e7711@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-05-05 11:30, Vladimir Oltean wrote:
> On Tue, Apr 21, 2026 at 12:19:40AM +0500, Rustam Adilov wrote:
>> Add support for the usb2 phy of RTL9607C series based SoCs.
>> Add the macros and phy config struct for rtl9607.
>> 
>> RTL9607C requires to clear a "force host disconnect" bit in the
>> specific register (which is at an offset from reg_wrap_vstatus)
>> before proceeding with phy parameter writes. Since it belongs into
>> the vstatus register region, it doesn't need bytes swapping.
>> 
>> Add the bool variable to the driver data struct and hide this whole
>> procedure under the if statement that checks this new variable.
>> 
>> Add the appropriate little endian read and write functions for rtl9607
>> and assign them to its phy config struct.
>> 
>> As mentioned earlier, the readl/writel are native endian on MIPS arch
>> if SWAP_IO_SPACE is not enabled. Since enabling SWAP_IO_SPACE results
>> in boot hang on RTL9607C machine, wrapping le32 around readl/writel
>> should be a good compromise, but swab32 could be also work.
>> 
>> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
>> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>> ---
> 
> Have you considered ioread32() instead of wrapping le32 around readl()?

I think you meant ioread32be() and yes i have considered it. If this is what
it takes to get rid of le32 warning you mentioned from an earlier email then
so be it.
