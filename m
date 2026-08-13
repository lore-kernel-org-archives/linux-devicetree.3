Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF09212550;
	Thu, 13 Aug 2026 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786606993; cv=none; b=eQew32rFJ0nEpuewuH2IGxiZ22sjRQra1qBHGkO3BZEKeAyFmlomuL7EeB+iSwdrWP4BfZ3N7OdmnXMZHqh8FedTqL30lVBDDhxT32vUtKrcjhst4QPvl4p6gRXjvF2bRayMxQr0XAJGMMSCe/1yiSCQp/ngBRik+UmBjBwTCF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786606993; c=relaxed/simple;
	bh=o7oQ120cRKz8pQDmV4rpfvZOecYhDm/Tder6gaKxyUg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=PeuXhJDbBzZCJ3i1Pb9tG+FuhcdENzIa03loe0XguhH7LiUEnFjxTqJz7PlOW1fAZ1U4P+iGVcpdawtfevm+ygg+TILIjyWOfsoyNkibPd4jc4Amo0LhMxNvUuzjQLOco+s3z0f1CLaHuU+ezuKCreMLNIVzzEvEhI17fj2sOqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ko6zBtWt; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ko6zBtWt"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3022188245;
	Thu, 13 Aug 2026 09:43:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjodt6I4clMI; Thu, 13 Aug 2026 09:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786606980; bh=o7oQ120cRKz8pQDmV4rpfvZOecYhDm/Tder6gaKxyUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ko6zBtWtelktE8JEZ2WCoSsDSKHGJh8sIUBdIRmYP+8EU4oJgB/KcRZkthSXEFUvX
	 Nou0iPXPibDnaq9pPM88d2TFWZ4ctgdZuE/2pvJiVbkwgSxOyGdn1hUl75EaAFUP8m
	 FnyehN0DhNynpKm+/x5dOWJr18XsK6Ph7+9/JVnbEtXTglGZWqtr8V3wMeaBMxHd+z
	 YB/4C2Jo10C6N9kZwO/AwS+QvMKNGispUuVsy+lItcl6SRMz8pjMzAkTUnKtws42uX
	 RNFzZkFBX04Id0RWcukygDAERv2bvJvBhuIXRdh2pyJktu8MIuP3qXqLQyxX0F1bzj
	 WkpBc+Isw9Feg==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 07:43:00 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v6 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
In-Reply-To: <pu3724you4tqsnuewo2uwqsubtwpf5t7kdd4of33awodjunfb4@cfzd3cmvlpjb>
References: <20260520175728.720877-1-adilov@disroot.org>
 <20260520175728.720877-6-adilov@disroot.org>
 <pu3724you4tqsnuewo2uwqsubtwpf5t7kdd4of33awodjunfb4@cfzd3cmvlpjb>
Message-ID: <0a4470dbaa381d068f25ebf8041b3f6f@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


On 2026-08-12 15:05, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 10:57:27PM +0500, Rustam Adilov wrote:
>> Add support for the usb2 phy of RTL9607C series based SoCs.
>> Add the macros and phy config struct for rtl9607.
>> 
>> RTL9607C requires to clear a "force host disconnect" bit in the
>> specific register (which is at an offset from reg_wrap_vstatus)
>> before proceeding with phy parameter writes. Since it belongs into
>> the vstatus register region, it requires the use of added read and
>> write helper functions.
>> 
>> Add the bool variable to the driver data struct and hide this whole
>> procedure under the if statement that checks this new variable.
>> 
>> Add the appropriate big endian read and write functions for rtl9607
>> and assign them to its phy config struct.
>> 
>> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
>> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>> ---
>>  drivers/phy/realtek/phy-rtk-usb2.c | 58 ++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>> 
>> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
>> index 16c5fc3191de..69f0f5279b5e 100644
>> --- a/drivers/phy/realtek/phy-rtk-usb2.c
>> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
>> @@ -26,6 +26,12 @@
>>  #define PHY_VCTRL_SHIFT 8
>>  #define PHY_REG_DATA_MASK 0xff
>>  
>> +#define PHY_9607_VSTS_BUSY BIT(17)
>> +#define PHY_9607_NEW_REG_REQ BIT(13)
>> +
>> +#define PHY_9607_FORCE_DISCONNECT_REG 0x10
>> +#define PHY_9607_FORCE_DISCONNECT_BIT BIT(5)
>> +
>>  #define GET_LOW_NIBBLE(addr) ((addr) & 0x0f)
>>  #define GET_HIGH_NIBBLE(addr) (((addr) & 0xf0) >> 4)
>>  
>> @@ -109,6 +115,7 @@ struct phy_cfg {
>>  
>>  	u32 (*read)(void __iomem *reg);
>>  	void (*write)(u32 val, void __iomem *reg);
>> +	bool force_host_disconnect;
>>  };
>>  
>>  struct phy_parameter {
>> @@ -146,6 +153,16 @@ static void rtk_usb2phy_write(u32 val, void __iomem *reg)
>>  	writel(val, reg);
>>  }
>>  
>> +static u32 rtk_usb2phy_read_be(void __iomem *reg)
>> +{
>> +	return ioread32be(reg);
>> +}
>> +
>> +static void rtk_usb2phy_write_be(u32 val, void __iomem *reg)
>> +{
>> +	iowrite32be(val, reg);
>> +}
>> +
>>  /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
>>  static inline int page_addr_to_array_index(u8 addr)
>>  {
>> @@ -600,6 +617,19 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
>>  		goto do_toggle;
>>  	}
>>  
>> +	if (phy_cfg->force_host_disconnect) {
>> +		/* disable force-host-disconnect */
>> +		void __iomem *vstatus = phy_reg->reg_wrap_vstatus;
>> +		u32 temp;
>> +
>> +		temp = phy_reg->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
>> +
>> +		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
>> +		phy_reg->write(temp, vstatus + PHY_9607_FORCE_DISCONNECT_REG);
>> +
>> +		usleep_range(10000, 11000);
> 
> If you really want to make sure the delay gets completed within this if()
> condition, then add a read.
> 
> - Mani

Hey,

Thanks for reviews, i have already seen the other comments but i have a question
about this one. What do you mean by adding a read? As far as i know, it is just
time to "allow IP to startup" and not like a status bit i have to continuously
read if that is what you were referring to.

Best,
Rustam
