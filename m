Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4251A39FCB1;
	Thu, 13 Aug 2026 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627519; cv=none; b=ftOYSAzCIXeHOGGRIHYwLyvZ6PbiWUEVW4xNJhvgiP4TCly3MFAQuCW7PI6oWXNXc1m87hVVMYn1P1l81tEcb8XYEIJCq+w4G4hbWRuiZ7Q8VcSzMq38heyVcVDDMftdGRD+ktxMAaxs5mS/opbslrpU2vEvGPvxjh7L2v1KtyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627519; c=relaxed/simple;
	bh=xBjF3xpWXAJq3XwhO7jlMFr0s3VJ3Q+3i82lgwmm6rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7U3ACNh28YSKB3XBcjyK1M6w5nNbrwpfMKXQoxyx2BAo5Rt9rVlL3FlUjIQqe8/ADyr8c121rLu13it1Dr9KfqngCa2GNxKl5o4wMjNZfOipGU1RsV462HeByYcmHGd1tV1BgWzQh9wRjEKKksNkOLoGxVswAf02vXAgaONWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJWrGwrR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJWrGwrR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C74D1F000E9;
	Thu, 13 Aug 2026 13:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786627518;
	bh=wpTygh8GG8cF5Lks7dQEJrLp/2oKCcg4sDqmYOYRj9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oJWrGwrR+BH4AeTUWJm1oZW17uiBg9lrTcqJxdw54/SNaRmHaHKa1Y1VXSRW5Zvzb
	 sHWDJzBM0+EdWZpSLyKf5YSJsZx8oWzOVu5WSlBgPKYAEiw+cR9yjOhtSGqhBNTgsW
	 UewZeG5iJoeqBaVZZJ9M/3/WVdIpxdLyPc3HIQ967/lpCIZJZqp55ZYKmF29LsPwOp
	 nf0KtInriqBLnrXKKp7mb8jEBmQl9SzYrWAiiiVsisaT7ObG/pJnnpqUq9YR8Oqke3
	 sAAUO0AM8NzkDv71zcHn2lGi0MJbx3+a4wDdgsIHacMuIS0Yb6FAxe6hrUrV+Pw7Fz
	 A9445cwwwxfcw==
Date: Thu, 13 Aug 2026 15:25:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanley Chang <stanley_chang@realtek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v6 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
Message-ID: <twfiqpyz3qxxrtjgnjondgtp6uyn7lnt3p24lzlkfad74ru3ng@4z2p5rvitb55>
References: <20260520175728.720877-1-adilov@disroot.org>
 <20260520175728.720877-6-adilov@disroot.org>
 <pu3724you4tqsnuewo2uwqsubtwpf5t7kdd4of33awodjunfb4@cfzd3cmvlpjb>
 <0a4470dbaa381d068f25ebf8041b3f6f@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a4470dbaa381d068f25ebf8041b3f6f@disroot.org>

On Thu, Aug 13, 2026 at 07:43:00AM +0000, Rustam Adilov wrote:
> 
> On 2026-08-12 15:05, Manivannan Sadhasivam wrote:
> > On Wed, May 20, 2026 at 10:57:27PM +0500, Rustam Adilov wrote:
> >> Add support for the usb2 phy of RTL9607C series based SoCs.
> >> Add the macros and phy config struct for rtl9607.
> >> 
> >> RTL9607C requires to clear a "force host disconnect" bit in the
> >> specific register (which is at an offset from reg_wrap_vstatus)
> >> before proceeding with phy parameter writes. Since it belongs into
> >> the vstatus register region, it requires the use of added read and
> >> write helper functions.
> >> 
> >> Add the bool variable to the driver data struct and hide this whole
> >> procedure under the if statement that checks this new variable.
> >> 
> >> Add the appropriate big endian read and write functions for rtl9607
> >> and assign them to its phy config struct.
> >> 
> >> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> >> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> >> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> >> ---
> >>  drivers/phy/realtek/phy-rtk-usb2.c | 58 ++++++++++++++++++++++++++++++
> >>  1 file changed, 58 insertions(+)
> >> 
> >> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
> >> index 16c5fc3191de..69f0f5279b5e 100644
> >> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> >> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> >> @@ -26,6 +26,12 @@
> >>  #define PHY_VCTRL_SHIFT 8
> >>  #define PHY_REG_DATA_MASK 0xff
> >>  
> >> +#define PHY_9607_VSTS_BUSY BIT(17)
> >> +#define PHY_9607_NEW_REG_REQ BIT(13)
> >> +
> >> +#define PHY_9607_FORCE_DISCONNECT_REG 0x10
> >> +#define PHY_9607_FORCE_DISCONNECT_BIT BIT(5)
> >> +
> >>  #define GET_LOW_NIBBLE(addr) ((addr) & 0x0f)
> >>  #define GET_HIGH_NIBBLE(addr) (((addr) & 0xf0) >> 4)
> >>  
> >> @@ -109,6 +115,7 @@ struct phy_cfg {
> >>  
> >>  	u32 (*read)(void __iomem *reg);
> >>  	void (*write)(u32 val, void __iomem *reg);
> >> +	bool force_host_disconnect;
> >>  };
> >>  
> >>  struct phy_parameter {
> >> @@ -146,6 +153,16 @@ static void rtk_usb2phy_write(u32 val, void __iomem *reg)
> >>  	writel(val, reg);
> >>  }
> >>  
> >> +static u32 rtk_usb2phy_read_be(void __iomem *reg)
> >> +{
> >> +	return ioread32be(reg);
> >> +}
> >> +
> >> +static void rtk_usb2phy_write_be(u32 val, void __iomem *reg)
> >> +{
> >> +	iowrite32be(val, reg);
> >> +}
> >> +
> >>  /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
> >>  static inline int page_addr_to_array_index(u8 addr)
> >>  {
> >> @@ -600,6 +617,19 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
> >>  		goto do_toggle;
> >>  	}
> >>  
> >> +	if (phy_cfg->force_host_disconnect) {
> >> +		/* disable force-host-disconnect */
> >> +		void __iomem *vstatus = phy_reg->reg_wrap_vstatus;
> >> +		u32 temp;
> >> +
> >> +		temp = phy_reg->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
> >> +
> >> +		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
> >> +		phy_reg->write(temp, vstatus + PHY_9607_FORCE_DISCONNECT_REG);
> >> +
> >> +		usleep_range(10000, 11000);
> > 
> > If you really want to make sure the delay gets completed within this if()
> > condition, then add a read.
> > 
> > - Mani
> 
> Hey,
> 
> Thanks for reviews, i have already seen the other comments but i have a question
> about this one. What do you mean by adding a read? As far as i know, it is just
> time to "allow IP to startup" and not like a status bit i have to continuously
> read if that is what you were referring to.
> 

So you do a write to PHY_9607_FORCE_DISCONNECT_REG register and allow the IP to
start and then continue the operation. What if the write to
PHY_9607_FORCE_DISCONNECT_REG register gets stored in a hardware Write Buffer?
The write instruction will succeed, and the CPU will wait for the delay. But the
write may never reach the hardware and if the CPU starts executing successive
operations before enough delay, it may lead to erratic behaviour.

So that's why it is recommended to flush out the write before delay (if the
delay is critical) by doing a read of that register. The read will ensure that
the write has reached the hardware before the delay:

	write(PHY_9607_FORCE_DISCONNECT_REG);
	read(PHY_9607_FORCE_DISCONNECT_REG) # flush the write
	delay()
	# continue

This read back is not needed in all the cases, but only where the delay is
critical.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
