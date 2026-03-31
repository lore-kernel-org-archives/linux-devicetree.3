Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372C30C345;
	Tue, 31 Mar 2026 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974413; cv=none; b=CVBBaXvWz4MXX/ZzFGRtOzQnMvDGPvG/iruj7vGtA7VxwATe0fYLTHIWXFhLUSVOmGh+Yo21iibnvoa/juiKSECR11k07ts0mYNl7XMNmTdojg+QD93K2+D/Iy3eyD2uDHLX+5BFeZ0bsCp/OOyWn8JILvrqFEJjHRCBZ1J368g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974413; c=relaxed/simple;
	bh=4/KOV5r9948VYhuiUcfo+u6YJ2ubFSTwMYYsK55YSNI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aUGQc+ewONc9NcuPa7p0SsfNlIeyjjroatykAbx48kOJq6WjVfyJuz2sXRSAcxcG8sHKhOl2EGrA25MckVMbDH4Ifc5dfZ+M/KqQvfOlfVa/s0yfo05H9GssQyTtuNSiM0QYhtfUnc8rC08jyWGJo21tP70HyztA2j21hv5zl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=mkl841Yf; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="mkl841Yf"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0546225F3F;
	Tue, 31 Mar 2026 18:26:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEFNASaRFbob; Tue, 31 Mar 2026 18:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774974409; bh=4/KOV5r9948VYhuiUcfo+u6YJ2ubFSTwMYYsK55YSNI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mkl841Yf5Uzpm0YCBamFprdHBM9aPwhUAhzqkP7JGPqLeP92X4/qMAoRmqvZEIZQZ
	 n7LMpw6OHGQN5JV/Uw2qDbfoE+q1deCWNtflgVJJ5SlkUVA5LnkC0oFpn8rFMfGrla
	 sDGyhyO3NJ4JGc/IR5A/7Niw6Fdr7pLn/nZEQngg9z4dvpYoSs7B42Pg8Zp5laeliz
	 lIPdM8bx5T5UWBlTB4aURf3JhBrZQGberYWaQ49ZSrqyF1kxqnvgfE+b7Z3992bnug
	 AGtF2QhvGQXxAY/broksmc+3uG6Uk0jxTqdakr3/7F+jOe8NSZWwdwMqRFiKfxS4Zr
	 ffLn2fZyAvstw==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 31 Mar 2026 16:26:48 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Zavertkin
 <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v2 2/6] phy: realtek: usb2: introduce read and write
 functions to driver data
In-Reply-To: <20260330213227.zujvcvsxdfknzltz@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-3-adilov@disroot.org>
 <20260330211918.y7su36j47e3uelcv@skbuf>
 <20260330213227.zujvcvsxdfknzltz@skbuf>
Message-ID: <4663266d3a7d428d9d28edb96227cb8c@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-03-30 21:32, Vladimir Oltean wrote:
> On Tue, Mar 31, 2026 at 12:19:18AM +0300, Vladimir Oltean wrote:
>> On Fri, Mar 27, 2026 at 09:06:34PM +0500, Rustam Adilov wrote:
>> > +static inline u32 phy_read(void __iomem *reg)
>> > +{
>> > +	return readl(reg);
>> > +}
>> > +
>> > +static inline u32 phy_read_le(void __iomem *reg)
>> > +{
>> > +	return le32_to_cpu(readl(reg));
>> > +}
>> > +
>> > +static inline void phy_write(u32 val, void __iomem *reg)
>> > +{
>> > +	writel(val, reg);
>> > +}
>> > +
>> > +static inline void phy_write_le(u32 val, void __iomem *reg)
>> > +{
>> > +	writel(cpu_to_le32(val), reg);
>> > +}
>> 
>> Please don't name driver-level functions phy_read() and phy_write().
>> That will collide with networking API functions of the same name and
>> will make grep-based code searching more difficult.
>> 
>> Also, have you looked at regmap? It has native support for endianness;
>> it supports regmap_field_read()/regmap_field_write() for abstracting
>> registers which may be found at different places for different HW;
>> it offers regmap_read_poll_timeout() so you don't have to pass the
>> function pointer to utmi_wait_register(). It seems the result would be a
>> bit more elegant.
> 
> Even if you decide not to use regmap. I thought I should let you know
> that LLM review says:
> 
>   Are these double byte-swaps intentional?
> 
>   Since readl() and writel() inherently perform little-endian memory accesses
>   and handle byte-swapping on big-endian architectures automatically, won't
>   wrapping them in le32_to_cpu() and cpu_to_le32() apply a second, redundant
>   byte-swap?

From my experience (and also understanding), readl returns value in native endian
and doesn't do byte swapping. The same goes writel.
Thus wrapping le32_to_cpu() and cpu_to_le32() around them correctly swaps the
bytes from big endian to little endian, without the double byte-swaps.

The comment even mentions it "{read,write}{b,w,l,q}() access little endian memory
and return result in native endianness." which was provided for reference later on.

>   On big-endian systems, wouldn't these double swaps cancel each other out
>   and result in a native big-endian access instead of the intended
>   little-endian access? If the SoC bus bridge implicitly swaps and requires
>   a native access, should __raw_readl() and __raw_writel() (or ioread32be /
>   iowrite32be) be used instead to avoid obfuscating it with double-swaps?

The __raw_readl() and __raw_writel() are indeed in native endian, and for
RTL9607C SoC it is in big endian.

The way Realtek did it is by using the volatile and wrapping them around
le32_to_cpu() and cpu_to_le32() respectively, which is certainly hacky.

 static inline unsigned int ehci_readl(const struct ehci_hcd *ehci,
 		__u32 __iomem *regs)
 {
+#if defined(CONFIG_RTK_MIPS_SOC)
+	return (le32_to_cpu((*(volatile unsigned long *)(regs))));
+#else
[...]

 static inline void ehci_writel(const struct ehci_hcd *ehci,
 		const unsigned int val, __u32 __iomem *regs)
 {
+#if defined(CONFIG_RTK_MIPS_SOC)
+	((*(volatile unsigned long *)(regs))=cpu_to_le32(val));
+#else

We did a bit of debugging with usb some time ago and and printed the value
of the readl result from the base usb address and got this
[    1.327473] ehci_setup:694 ehci caps: 0xb8021000, value: 0x10000001
[    1.334478] ehci_setup:695 ehci regs: 0xb8021001
[    1.339706] ehci_halt:187 ehci regs: 0xb8021001

"0x10000001" is supposed to be "0x01000010". Otherwise, it would take 0x01
for the cap length and result in immediate halt from timeout.

Even though it is for linux-usb and not the phy subsystem, it was worth
mentioning as it is very much related to this issue.

What is surprising, the ioread32be and iowrite32be functions actually do
swap bytes, thus resulting in little endian (ironic). But using it here
would be just incorrect as it is intended for accessing big endian mmio, 
not for big endian CPU and its little endian USB phy/host.

So, that is a conundrum we have here. Let me know if what you think of it
and maybe even how to better solve it.

Will hold on posting v3 until this hopefully is more or less solved..

>   Also, does passing the __le32 restricted type returned by cpu_to_le32()
>   into writel() (which expects a native u32) trigger Sparse static analysis
>   warnings for an incorrect type in argument?
> 
> For reference:
> https://elixir.bootlin.com/linux/v6.19.10/source/include/asm-generic/io.h#L184
> /*
>  * {read,write}{b,w,l,q}() access little endian memory and return result in
>  * native endianness.
>  */
> 
> and yes, your patch does trigger sparse warnings:
> ../drivers/phy/realtek/phy-rtk-usb2.c:153:16: warning: cast to restricted __le32
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:16: warning: incorrect type in argument 1 (different base types)
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:16:    expected unsigned int val
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:16:    got restricted __le32 [usertype]

I can alleviate it by creating a temp u32 variable to hold the cpu_to_le32() and then
using that temp variable for writel.

> Furthermore, please drop the 'inline' keyword from C files and let the
> compiler decide. Your use of this keyword has no value - you declare
> phy_read(), phy_read_le() etc as inline but then assign function
> pointers to them. How can the compiler inline the indirect calls?

Will drop these.
