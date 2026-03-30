Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE993A543F
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907441; cv=none; b=KsJpH1CWx0H7p1fSeFo/tlMhdyxIIj9pFD3mmjxsG19gMehzUtbkUMjcgGhpASrelsFTrt5v3aTtwEc9+0fYcFgTdSXFAEnOr6V2DffNgiRXgRSyBGUXZ4i6jdXs1AaqXjJ2yjDdStgV6LKduDULas2Y9esG/VI5DTp2pGEPgE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907441; c=relaxed/simple;
	bh=892Dex4+6n7c+srBxz1jVKknV7GNsNEBw/hHHSzXRGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lkcv0FboEOdficFRAen3wgYqEw5HRkxhG6gMh4O48jbGZu2d2Y30xYrbd3ZYDfMNNEIZyH8zY4UQzH4CQsUcSfaxoUzF4MD+n/pIq38JyENSGxV06kFdkW2dliVtKHxbkRLCm5ofNKO/lYZsd3II0xwnLiJPfzOVbHJb/yD617g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK8iudL+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK8iudL+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fc3ac9fdso5747515e9.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774907436; x=1775512236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rvOVfipuNnH/UivVwc7De7z6zvsPeKLD3Y+JlWhA4s=;
        b=kK8iudL+3UtHIl2AF7CpDL3RfpN/t+vM8tWyTkiumRKtFA+FZRvznAx+TkQm6a6FOW
         0dd6bnNi2WAYp0AdOx9vz2qINUrpKN8XgolTiK7o8CMMa9nWupl9uHaQm1PkRCFHLsSs
         CrqDg/etre7rlWh2fkDF6aOgwIlC/PzAULxcLieCSnVoBBfyg5MSRfQR3X09UJ9VWqoi
         Y22s5YxZFezM7jU17qC6XIY815UZaGVZGQ5nsKLLhCA5OSsfeeZI9tRINoRi0vgHUanT
         BObThGxNmRqim3j9e73Q1SdYyojXhFiimKxm+WxlbEjsXy3tOoFcBbwEPlbXE7AlGanx
         79NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907436; x=1775512236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rvOVfipuNnH/UivVwc7De7z6zvsPeKLD3Y+JlWhA4s=;
        b=DQUyIHON3DqvRJ/wyMjQw+s6VosDZrtG8S4Qkhwjn0jYHUFD1Is6T7ndAuj5rtCqvI
         U6uEI/WESuXizZKmxhWP8dFjNbrwcvK3dQjgB139dFnWwsICKpe2d9zPrghqZXMDY8/o
         qQjtYDm6orXXOMnTUiFf5DZjc5ie4vkv1UdkDp4vs3hOGQiFeNKGf5l3NdYmKi+x3WLt
         vUj5lGrdJ1fJqNySXqGkrxncR2SWehAWqq5W/nH78hxE3yWuJQQHoIqxofH/327gvOp8
         WOAj8S0Q/L7qIJd6GOL033LRe7Dq1kwBcPHW383c0lQ4iGhPdar9ozW2JBMJ3rhK2yJN
         u0sw==
X-Forwarded-Encrypted: i=1; AJvYcCXgA/y7d2EU/g7nQORMJmuIxYcA6Xnv5UqykOvKfFWERiX7Qy4MMPB7d4nd376cImvXLqFqOM4DDbkU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqn3H2EvBKed4RkMEn7ZfJomUrjm0wRKlOePHC1jLpbDA+ijO0
	YYEO8l3OvoI//hYFbTDUvdhMgxPd1jvXip+rBZDfNg4C9FIP4EMKZV8Y
X-Gm-Gg: ATEYQzw75GzREidm5qIJbmgDXJOlbnqQv9u0z5fdnuNyJ3W0WUnUHYjLgTkU62GFnG5
	UzCKxk4dncEnRZMyniGA2DzYDVuzapIqaDfesoJg5I9eCiv3WlvNByeX0wFe9WDw+o5nfNakWYW
	ReZ/SjvriLIR7CGUPZP56pjLkwLwG+7rg+I+Ztf9jWNoYUd5jtIIMcxU8q7YO9enPZxcPpKGpyV
	tD7YE/CmLCyN0p/tJaeKtJXFa/6BPyjfAP7KAJHtQnL5EcApMJdLC5AyzyXcWnOoGd0a48BkpDy
	wANhde0NiW/n/jRHl+/GBBUoqpzuYlZAO+3cRubc1z6gxIrvcK0PgedsTBNytBh/jsWsn2w8rRx
	Z9c0H33X5/Qs1pwZJKSKPC0ZU6tmZx/Har4MDtN3L2khp2keVfxFEBu+TGRNZkj5BrNiW4LKOz+
	jSnqss9/IcrkTSJrw=
X-Received: by 2002:a05:600c:8b41:b0:487:17d:d0bf with SMTP id 5b1f17b1804b1-48727ee0e73mr119411695e9.6.1774907436457;
        Mon, 30 Mar 2026 14:50:36 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:fc92:d05b:3301:b722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm22792835f8f.30.2026.03.30.14.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:50:35 -0700 (PDT)
Date: Tue, 31 Mar 2026 00:50:33 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v2 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
Message-ID: <20260330215033.ven3bllyw3jverfg@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327160638.15134-6-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>

On Fri, Mar 27, 2026 at 09:06:37PM +0500, Rustam Adilov wrote:
> Add support for the usb2 phy of RTL9607C series based SoCs.
> Add the macros and phy config struct for rtl9607.
> 
> RTL9607C requires to clear a "force host disconnect" bit in the
> specific register (which is at an offset from reg_wrap_vstatus)
> before proceeding with phy parameter writes.
> 
> Add the bool variable to the driver data struct and hide this whole
> procedure under the if statement that checks this new variable.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  drivers/phy/realtek/phy-rtk-usb2.c | 57 ++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
> index 070cba1e0e0a..bf22d12681dc 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -26,6 +26,12 @@
>  #define PHY_VCTRL_SHIFT 8
>  #define PHY_REG_DATA_MASK 0xff
>  
> +#define PHY_9607_VSTS_BUSY BIT(17)
> +#define PHY_9607_NEW_REG_REQ BIT(13)
> +
> +#define PHY_9607_FORCE_DISCONNECT_REG 0x10
> +#define PHY_9607_FORCE_DISCONNECT_BIT BIT(5)
> +
>  #define GET_LOW_NIBBLE(addr) ((addr) & 0x0f)
>  #define GET_HIGH_NIBBLE(addr) (((addr) & 0xf0) >> 4)
>  
> @@ -109,6 +115,7 @@ struct phy_cfg {
>  
>  	u32 (*read)(void __iomem *reg);
>  	void (*write)(u32 val, void __iomem *reg);
> +	bool force_host_disconnect;
>  };
>  
>  struct phy_parameter {
> @@ -614,6 +621,16 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
>  		goto do_toggle;
>  	}
>  
> +	if (phy_cfg->force_host_disconnect) {
> +		/* disable force-host-disconnect */
> +		u32 temp = readl(phy_reg->reg_wrap_vstatus + PHY_9607_FORCE_DISCONNECT_REG);
> +
> +		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
> +		writel(temp, phy_reg->reg_wrap_vstatus + PHY_9607_FORCE_DISCONNECT_REG);
> +
> +		mdelay(10);

LLM review:

Could we use msleep(10) or usleep_range(10000, 11000) here instead of
mdelay(10)?
Since do_rtk_phy_init() executes as part of the phy_ops->init callback
with a mutex held from a sleepable process context, spinning the CPU for
10ms wastes CPU resources and increases scheduling latency.

> +	}
> +
>  	/* Set page 0 */
>  	phy_data_page = phy_cfg->page0;
>  	rtk_phy_set_page(phy_reg, 0);
> @@ -1141,6 +1158,7 @@ static const struct phy_cfg rtd1295_phy_cfg = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,

You don't need to initialize rodata struct fields with false/0/NULL.

>  };
>  
>  static const struct phy_cfg rtd1395_phy_cfg = {
> @@ -1170,6 +1188,7 @@ static const struct phy_cfg rtd1395_phy_cfg = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,
>  };
>  
>  static const struct phy_cfg rtd1395_phy_cfg_2port = {
> @@ -1199,6 +1218,7 @@ static const struct phy_cfg rtd1395_phy_cfg_2port = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,
>  };
>  
>  static const struct phy_cfg rtd1619_phy_cfg = {
> @@ -1226,6 +1246,7 @@ static const struct phy_cfg rtd1619_phy_cfg = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,
>  };
>  
>  static const struct phy_cfg rtd1319_phy_cfg = {
> @@ -1257,6 +1278,7 @@ static const struct phy_cfg rtd1319_phy_cfg = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,
>  };
>  
>  static const struct phy_cfg rtd1312c_phy_cfg = {
> @@ -1287,6 +1309,7 @@ static const struct phy_cfg rtd1312c_phy_cfg = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,
>  };
>  
>  static const struct phy_cfg rtd1619b_phy_cfg = {
> @@ -1317,6 +1340,7 @@ static const struct phy_cfg rtd1619b_phy_cfg = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,
>  };
>  
>  static const struct phy_cfg rtd1319d_phy_cfg = {
> @@ -1347,6 +1371,7 @@ static const struct phy_cfg rtd1319d_phy_cfg = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,
>  };
>  
>  static const struct phy_cfg rtd1315e_phy_cfg = {
> @@ -1378,6 +1403,37 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
>  	.new_reg_req = PHY_NEW_REG_REQ,
>  	.read = phy_read,
>  	.write = phy_write,
> +	.force_host_disconnect = false,
> +};
> +
> +static const struct phy_cfg rtl9607_phy_cfg = {
> +	.page0_size = MAX_USB_PHY_PAGE0_DATA_SIZE,
> +	.page0 = { [0] = {0xe0, 0x95},
> +		   [4] = {0xe4, 0x6a},
> +		  [12] = {0xf3, 0x31}, },
> +	.page1_size = MAX_USB_PHY_PAGE1_DATA_SIZE,
> +	.page1 = { [0] = {0xe0, 0x26}, },
> +	.page2_size = MAX_USB_PHY_PAGE2_DATA_SIZE,
> +	.page2 = { [7] = {0xe7, 0x33}, },
> +	.num_phy = 1,
> +	.check_efuse = false,

Similar for these (+do_toggle_driving, use_default_parameter).

> +	.check_efuse_version = CHECK_EFUSE_V2,
> +	.efuse_dc_driving_rate = EFUS_USB_DC_CAL_RATE,
> +	.dc_driving_mask = 0x1f,
> +	.efuse_dc_disconnect_rate = EFUS_USB_DC_DIS_RATE,
> +	.dc_disconnect_mask = 0xf,
> +	.usb_dc_disconnect_at_page0 = true,
> +	.do_toggle = true,
> +	.do_toggle_driving = false,
> +	.driving_updated_for_dev_dis = 0x8,
> +	.use_default_parameter = false,
> +	.is_double_sensitivity_mode = true,
> +	.vstatus_offset = 0xc,
> +	.vstatus_busy = PHY_9607_VSTS_BUSY,
> +	.new_reg_req = PHY_9607_NEW_REG_REQ,
> +	.read = phy_read_le,
> +	.write = phy_write_le,
> +	.force_host_disconnect = true,
>  };
>  
>  static const struct of_device_id usbphy_rtk_dt_match[] = {
> @@ -1390,6 +1446,7 @@ static const struct of_device_id usbphy_rtk_dt_match[] = {
>  	{ .compatible = "realtek,rtd1395-usb2phy-2port", .data = &rtd1395_phy_cfg_2port },
>  	{ .compatible = "realtek,rtd1619-usb2phy", .data = &rtd1619_phy_cfg },
>  	{ .compatible = "realtek,rtd1619b-usb2phy", .data = &rtd1619b_phy_cfg },
> +	{ .compatible = "realtek,rtl9607-usb2phy", .data = &rtl9607_phy_cfg },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, usbphy_rtk_dt_match);
> -- 
> 2.53.0
> 
> 

