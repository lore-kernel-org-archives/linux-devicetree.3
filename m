Received: from send146.i.mail.ru (send146.i.mail.ru [89.221.237.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD543E95A9;
	Tue, 31 Mar 2026 16:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975789; cv=none; b=bRi2BepeLUCmQ5jyczT3AacJyOVaSA502OJHD0hPDi4S0wMDTSTNzFHDQ1JQfwnZZZRPsupTvLu4SfgybJmm8nNs51+qqjrqeFsSBkNq7spzFVgykXzTB0WkP5Znn0oW7alyxxqVDUNPYAvAtiiF5Lo5sSxvi8DI5fCDA8HkHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975789; c=relaxed/simple;
	bh=5jjHLHFJWCV5wKCRtCn/u3Bd5mKXxEhDnMuZIk6TF+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwO6zZhMiO6OTWJGD49qKGBK2BF1XcnRECddsGAd5ZAM6DumqtI/ScY+TjugKUricK6Dg2YAkGxtTay+qZglqDbEG0ajH67ijZT7OGdYRksQYy8+Niuw8yhpOegKLzMXYtvLn/NkLWhtNWagain5TTyI0KyOyQVLdTbLUt2UHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=IYgWtsH8; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=BLohMlQM; arc=none smtp.client-ip=89.221.237.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="IYgWtsH8";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="BLohMlQM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=rAaDBLFGbDgDwpMbp6AM9FCRPRn76HBbM5qhVpKBBIs=; t=1774975785; x=1775065785; 
	b=IYgWtsH8NsgMWeu+pSR4meAEkk6reTHJ2ctfI7eUFCi8OtuK7BgstQot4YVciv6zO7le+gN9bid
	trsBcqc9+E0SdcFD0Fs0/iqVBIpd/68+BUp3eMaSz98hwQ5VAF/qmOsGTvAob3HSjGlI5YLbNrY1H
	rHufX2tDQmp7qJwlRuGKH7Ux6bBayBZ0LAVGgSmKFncbPw3982eEOvk3VFORsjgb8rc0pGFYcNCkO
	KhzRxcZq7Rly4Nyrjj9MLc2AWI80Nf1xO0sPKPDC90nyIV0bDtch1GHNbv5R3ZuL+zYg/5fK6L0X+
	1X9k8o0gAEQCKddt+qCbXcSFcQmQRgsz8ivw==;
Received: from [10.113.73.96] (port=56458 helo=send104.i.mail.ru)
	by exim-fallback-85d8c67f99-z275w with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1w7c2u-00000000JH4-3Rvv; Tue, 31 Mar 2026 19:34:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=rAaDBLFGbDgDwpMbp6AM9FCRPRn76HBbM5qhVpKBBIs=; t=1774974868; x=1775064868; 
	b=BLohMlQMvb729/OxVRgbK75Npcs+gszzZ8zYvwMFkpb401JdJYbfERP0yeJuxyIvX8PUkUcAMBh
	rETWw3Lskr0devIW66KTLWryovJiVZYJlPAK0lvckiCkueZSIwrxpigc78cn2phfX5lIpmSjH6Jd9
	mN977ziYE4mCRXsjCqlBvsQ7k3G6ZMX/U6yG+TtvTvBKDgv863462kTrAsa2pJWS+ZPSnms8d21M/
	Qs0LbyKqMV07xHTEbwVQFO343MWxVGRYHhMGgEEqJNEKjOk+arilVoxWVbwu1p3sDpsU8nBG6G8Me
	YZqrzSx8Fyf143fGyiJLKqk9xaGPNiEAX4uw==;
Received: by exim-smtp-68896ccc7f-qcddm with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1w7c2b-000000001md-1Zfv; Tue, 31 Mar 2026 19:34:09 +0300
Date: Tue, 31 Mar 2026 23:34:06 +0700
From: Michael Zavertkin <misha.zavertkin@mail.ru>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Rustam Adilov <adilov@disroot.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] phy: realtek: usb2: introduce read and write
 functions to driver data
Message-ID: <acv3flrlq6Xyj4-K@gamepc>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-3-adilov@disroot.org>
 <20260330211918.y7su36j47e3uelcv@skbuf>
 <20260330213227.zujvcvsxdfknzltz@skbuf>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330213227.zujvcvsxdfknzltz@skbuf>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93432C92265B16DE3069DC17F4E542D512A26A9C19AE2CA2B182A05F538085040056865465EAAE1F53DE06ABAFEAF67053999B9D4B634943E12E446C9798DDA4255A617483E1C9283
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE757F64E7FD849EB4FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566B07F865632A72584F5F2A5C0554D38F2A6FDB833A64FB3C036763828B3BF5D168EEF46B7454FC60B9742502CCDD46D0D68E4D7E803FA7AD5F6B57BC7E64490618DEB871D839B73339E8FC8737B5C224969875440691429F6CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0565C7A4E90E531F78941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C096C9B5BF839F39F6D8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE35E3BF8C76DC23F74BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C31A4B083E4A08ADCF35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5DE4A2B59CDFC69AF5002B1117B3ED6967508C4A6C3BDB41ECA7E60A991436CA2823CB91A9FED034534781492E4B8EEAD09122B91796FF21FBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65975E4AABDD25FC00429104C0354BD85653875F558B95EC2B311F705F0514A01C44D6741388894635BB8341EE9D5BE9A0A30B07ADCE034CB6615D1653FBED1FDB7E29774A152264C1B52EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVdx/hWl0/CTm+faR23t6Pkg=
X-Mailru-Sender: 53225E476262CDFB4708A4528C9D2A7B15691F1C80FD27683DE06ABAFEAF67053999B9D4B634943EF544F87C5664B7A31DBC9D26A80DBF048AFC883BAD50DDC9AB8642342C2B65EBADBD92A00C77E0473057BA2287F227EE22B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B45B7BC1C949D967D8793E282ADEB5EC08D66795C6A0794595049FFFDB7839CE9E3DD1BFC800EE732FF455884ABB6C7A83C1B395D6691A195969F9657CEC75FF63EA9E26842ABDDA0F
X-7FA49CB5: 0D63561A33F958A5916FEED918D704E05002B1117B3ED69661ACC46F601D2CAD1E07975B9DF403D702ED4CEA229C1FA827C277FBC8AE2E8BB69D43C377C0EFE9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZR0vB+y7p4MROai/8RbPKag==
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok

On Tue, Mar 31, 2026 at 12:32:27AM +0300, Vladimir Oltean wrote:
> On Tue, Mar 31, 2026 at 12:19:18AM +0300, Vladimir Oltean wrote:
> > On Fri, Mar 27, 2026 at 09:06:34PM +0500, Rustam Adilov wrote:
> > > +static inline u32 phy_read(void __iomem *reg)
> > > +{
> > > +	return readl(reg);
> > > +}
> > > +
> > > +static inline u32 phy_read_le(void __iomem *reg)
> > > +{
> > > +	return le32_to_cpu(readl(reg));
> > > +}
> > > +
> > > +static inline void phy_write(u32 val, void __iomem *reg)
> > > +{
> > > +	writel(val, reg);
> > > +}
> > > +
> > > +static inline void phy_write_le(u32 val, void __iomem *reg)
> > > +{
> > > +	writel(cpu_to_le32(val), reg);
> > > +}
> > 
> > Please don't name driver-level functions phy_read() and phy_write().
> > That will collide with networking API functions of the same name and
> > will make grep-based code searching more difficult.
> > 
> > Also, have you looked at regmap? It has native support for endianness;
> > it supports regmap_field_read()/regmap_field_write() for abstracting
> > registers which may be found at different places for different HW;
> > it offers regmap_read_poll_timeout() so you don't have to pass the
> > function pointer to utmi_wait_register(). It seems the result would be a
> > bit more elegant.
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
> 
>   On big-endian systems, wouldn't these double swaps cancel each other out
>   and result in a native big-endian access instead of the intended
>   little-endian access? If the SoC bus bridge implicitly swaps and requires
>   a native access, should __raw_readl() and __raw_writel() (or ioread32be /
>   iowrite32be) be used instead to avoid obfuscating it with double-swaps?
> 
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
There is readl() (and family) function. For most hosts it returns native
endian value (because most systems LE nowadays).
I don't know all context, and don't know exactly why... but for MIPS readl()
returns value in native endianess.
Reference - https://elixir.bootlin.com/linux/v6.19.10/source/arch/mips/include/asm/io.h

So we are in interesting situation, when readl() returns native-endian values (BE in our case),
readl_be() returns BE too, because cpu_to_be32() does nothing on BE system, ioread32() returns BE,
but ioread32be() returns LE because of unconditional swab32(). Using *be
to get LE value... kinda weird. That's why we ended up with these two
functions.

Not a perfect solution, so it would be good to hear others opinions and
come to a more proper solution.
UPD. regmap looks like a pretty good solution for endianess stuff, but
it seems to interfere with current register handling (using struct
offsets as register addresses). So it has to be a big work.

For example, Realtek solves this issue that way -
https://github.com/jameywine/GPL-for-GP3000/blob/5090fbcb6ba743dd7b1314811ef557bad0460147/linux-5.10.x/drivers/usb/host/ehci.h#L742
> 
> and yes, your patch does trigger sparse warnings:
> ../drivers/phy/realtek/phy-rtk-usb2.c:153:16: warning: cast to restricted __le32
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:16: warning: incorrect type in argument 1 (different base types)
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:16:    expected unsigned int val
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:16:    got restricted __le32 [usertype]
> 
> Furthermore, please drop the 'inline' keyword from C files and let the
> compiler decide. Your use of this keyword has no value - you declare
> phy_read(), phy_read_le() etc as inline but then assign function
> pointers to them. How can the compiler inline the indirect calls?

Thanks for all other review comments, going to be fixed in next patch
series version.
