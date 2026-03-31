Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7589B413225;
	Tue, 31 Mar 2026 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975694; cv=none; b=Ozo+WnRoV8vqzKgaF1C4tVVM7h4tdTgCTq9B+OLcTSDtvBK/VK+T6sOMaXE7Y7sSjutQHlyBN/fcqSQt6WfI0hUImQiBVnZEQzNQAlOeJVROzT1opGGSYOrquud9P9iX2P/F/kRQoP/HLVH9n8UhWuSUJJU6y7fx8UJyZjsoVMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975694; c=relaxed/simple;
	bh=oQVnWLcfPVpq4oy73T6GwO7+A9grr8DISYy08Kii5GU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=SoFfKmrplD+2h5XY6t5Lfc4hKcpBtLagUVA8O5/Lcvx5Zujr4YqPAa0p85t+0ZsTcqCmKzPqGR2pI8BDymIIW7920c8xDbbrVBreCzRrktnsrTAGPuqsVm6jvK9V+ZHqE5ZVblCoPeVXmHRdm5jbTh9iL/xtgbqW3tj88o90tn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Jw9v4wv/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Jw9v4wv/"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F08BB26EF6;
	Tue, 31 Mar 2026 18:48:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fESk11EWd7J9; Tue, 31 Mar 2026 18:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774975689; bh=oQVnWLcfPVpq4oy73T6GwO7+A9grr8DISYy08Kii5GU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Jw9v4wv/H1km3ntJN8fHVEOc5EBgYEwgJusgYGlQvRt5CDL/qm1zhLFn+hT1CLhIc
	 RgzzXPZjNo+0heB1bWuB6EQ/yZSEc4itdJ7+mLNyKVNVYRpDkaGZYfp4xvudqprUo9
	 bsRWIiqEsBLAekx7oFGb593gx60ENQf3hf33+AkgYrczDR4ECeD7JbmAmGu2gNaKy2
	 QcxjdmefcpYbmStxlomqM4how9qnQ4grclOIKki9Xt1YmuVi328LhvmFX+kiSzZIu5
	 5dJ50MnqtXjPPZ51SSMqj5hlmssN7LwHZ8XGMWx51TxhyNalbs5KDY6zwEaF9dYL6o
	 pnAyKKFVWuI8A==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 31 Mar 2026 16:48:08 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Zavertkin
 <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v2 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
In-Reply-To: <20260330215033.ven3bllyw3jverfg@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>
 <20260330215033.ven3bllyw3jverfg@skbuf>
Message-ID: <1884dee6134e1c069e9f68edb2fdcd7f@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-03-30 21:50, Vladimir Oltean wrote:
> On Fri, Mar 27, 2026 at 09:06:37PM +0500, Rustam Adilov wrote:
>> Add support for the usb2 phy of RTL9607C series based SoCs.
>> Add the macros and phy config struct for rtl9607.
>> 
>> RTL9607C requires to clear a "force host disconnect" bit in the
>> specific register (which is at an offset from reg_wrap_vstatus)
>> before proceeding with phy parameter writes.
>> 
>> Add the bool variable to the driver data struct and hide this whole
>> procedure under the if statement that checks this new variable.
>> 
>> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
>> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>> ---
>>  drivers/phy/realtek/phy-rtk-usb2.c | 57 ++++++++++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>> 
>> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
>> index 070cba1e0e0a..bf22d12681dc 100644
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
>> @@ -614,6 +621,16 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
>>  		goto do_toggle;
>>  	}
>>  
>> +	if (phy_cfg->force_host_disconnect) {
>> +		/* disable force-host-disconnect */
>> +		u32 temp = readl(phy_reg->reg_wrap_vstatus + PHY_9607_FORCE_DISCONNECT_REG);
>> +
>> +		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
>> +		writel(temp, phy_reg->reg_wrap_vstatus + PHY_9607_FORCE_DISCONNECT_REG);
>> +
>> +		mdelay(10);
> 
> LLM review:
> 
> Could we use msleep(10) or usleep_range(10000, 11000) here instead of
> mdelay(10)?
> Since do_rtk_phy_init() executes as part of the phy_ops->init callback
> with a mutex held from a sleepable process context, spinning the CPU for
> 10ms wastes CPU resources and increases scheduling latency.

I can change it to msleep instead.

>> +	}
>> +
>>  	/* Set page 0 */
>>  	phy_data_page = phy_cfg->page0;
>>  	rtk_phy_set_page(phy_reg, 0);
>> @@ -1141,6 +1158,7 @@ static const struct phy_cfg rtd1295_phy_cfg = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
> 
> You don't need to initialize rodata struct fields with false/0/NULL.

From what i can see, it lines up with other phy_cfg structs, and thats how they
did it and it did get accepted. You can check the rtd1295_phy_cfg as an example.

I am personally fine with removing the "force_host_disconnect = false" and other
falses in rtl9607_phy_cfg but i am debating because it wouldn't line up with the rest.

>>  };
>>  
>>  static const struct phy_cfg rtd1395_phy_cfg = {
>> @@ -1170,6 +1188,7 @@ static const struct phy_cfg rtd1395_phy_cfg = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
>>  };
>>  
>>  static const struct phy_cfg rtd1395_phy_cfg_2port = {
>> @@ -1199,6 +1218,7 @@ static const struct phy_cfg rtd1395_phy_cfg_2port = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
>>  };
>>  
>>  static const struct phy_cfg rtd1619_phy_cfg = {
>> @@ -1226,6 +1246,7 @@ static const struct phy_cfg rtd1619_phy_cfg = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
>>  };
>>  
>>  static const struct phy_cfg rtd1319_phy_cfg = {
>> @@ -1257,6 +1278,7 @@ static const struct phy_cfg rtd1319_phy_cfg = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
>>  };
>>  
>>  static const struct phy_cfg rtd1312c_phy_cfg = {
>> @@ -1287,6 +1309,7 @@ static const struct phy_cfg rtd1312c_phy_cfg = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
>>  };
>>  
>>  static const struct phy_cfg rtd1619b_phy_cfg = {
>> @@ -1317,6 +1340,7 @@ static const struct phy_cfg rtd1619b_phy_cfg = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
>>  };
>>  
>>  static const struct phy_cfg rtd1319d_phy_cfg = {
>> @@ -1347,6 +1371,7 @@ static const struct phy_cfg rtd1319d_phy_cfg = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
>>  };
>>  
>>  static const struct phy_cfg rtd1315e_phy_cfg = {
>> @@ -1378,6 +1403,37 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
>>  	.new_reg_req = PHY_NEW_REG_REQ,
>>  	.read = phy_read,
>>  	.write = phy_write,
>> +	.force_host_disconnect = false,
>> +};
>> +
>> +static const struct phy_cfg rtl9607_phy_cfg = {
>> +	.page0_size = MAX_USB_PHY_PAGE0_DATA_SIZE,
>> +	.page0 = { [0] = {0xe0, 0x95},
>> +		   [4] = {0xe4, 0x6a},
>> +		  [12] = {0xf3, 0x31}, },
>> +	.page1_size = MAX_USB_PHY_PAGE1_DATA_SIZE,
>> +	.page1 = { [0] = {0xe0, 0x26}, },
>> +	.page2_size = MAX_USB_PHY_PAGE2_DATA_SIZE,
>> +	.page2 = { [7] = {0xe7, 0x33}, },
>> +	.num_phy = 1,
>> +	.check_efuse = false,
> 
> Similar for these (+do_toggle_driving, use_default_parameter).
> 
>> +	.check_efuse_version = CHECK_EFUSE_V2,
>> +	.efuse_dc_driving_rate = EFUS_USB_DC_CAL_RATE,
>> +	.dc_driving_mask = 0x1f,
>> +	.efuse_dc_disconnect_rate = EFUS_USB_DC_DIS_RATE,
>> +	.dc_disconnect_mask = 0xf,
>> +	.usb_dc_disconnect_at_page0 = true,
>> +	.do_toggle = true,
>> +	.do_toggle_driving = false,
>> +	.driving_updated_for_dev_dis = 0x8,
>> +	.use_default_parameter = false,
>> +	.is_double_sensitivity_mode = true,
>> +	.vstatus_offset = 0xc,
>> +	.vstatus_busy = PHY_9607_VSTS_BUSY,
>> +	.new_reg_req = PHY_9607_NEW_REG_REQ,
>> +	.read = phy_read_le,
>> +	.write = phy_write_le,
>> +	.force_host_disconnect = true,
>>  };
>>  
>>  static const struct of_device_id usbphy_rtk_dt_match[] = {
>> @@ -1390,6 +1446,7 @@ static const struct of_device_id usbphy_rtk_dt_match[] = {
>>  	{ .compatible = "realtek,rtd1395-usb2phy-2port", .data = &rtd1395_phy_cfg_2port },
>>  	{ .compatible = "realtek,rtd1619-usb2phy", .data = &rtd1619_phy_cfg },
>>  	{ .compatible = "realtek,rtd1619b-usb2phy", .data = &rtd1619b_phy_cfg },
>> +	{ .compatible = "realtek,rtl9607-usb2phy", .data = &rtl9607_phy_cfg },
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, usbphy_rtk_dt_match);
>> -- 
>> 2.53.0
>> 
>>
