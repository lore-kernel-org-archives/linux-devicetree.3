Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337E637E5E9;
	Wed, 12 Aug 2026 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547160; cv=none; b=Q22tr9KLoPo++BC2T4uZxHWje2ZC+NyISKuehaHI/lK23wuCQIkI5HSuSg6Nv8kjUSEy/rrk+X+SG0iWc17gZcNhI9PoZKuCDeR9XIyUUneps9socNU2OJPCSpJzVeO+5uOUxAPpf1JsZzPNIa+6rj7SvtyOHpb52EbXGa2KWqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547160; c=relaxed/simple;
	bh=WG7a75Wsk6XUknF7YT/hssBTDFFFOgXKOpoJhGFqIOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nA58cQY8ESyHqMpsoaGhdV0NEcapJGIEbCMnJjLBTFrl32nV4d2knCICU5VEue5967g9xCNn+8e+vLVFX5hJFZ+CZ6olyUP4xSMmAushPcv9/gg/vzSqacEY660+w1+OdkZqgWkxdCYWHDlIClN3BtPwTHDGGOzBgXl5lomqJ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MG0OA/9F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MG0OA/9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128791F000E9;
	Wed, 12 Aug 2026 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786547158;
	bh=Q4eaJ4j3ced9vchu5jBJg9BjbKF7STbIADqdyIE7nMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MG0OA/9FuKE9FXzHemZLfl5IzsqfCs4lcs01MMblSfsbdUWWkUf+oB7z/Uv1MvKZF
	 BmH4ogPXVuHlJLO/jQCWAtaNkY2lcI4hYHRG6KULCjfw+EVC1YJwyzri2p7Uy6amyN
	 fZKSDqP2KYiT55hMRo38Yy3U/wpWlCkRdY/RpjEsXYIzKBO1p1PXLeiIEtpSkSJzed
	 KWE7ewj+Zpd4Xgt4ZvkGi2a+pkl+3ZT6ntv7O9VCtSUxb6bitKNYiL97osTbCyjH3C
	 HTo9TYBV1izx9cJiq9o5WubB3Qu4HA9nccrVLw2rqS/nGmAmBgL4t7b9lJO+bRfq/w
	 hJOmsEwUzuP3Q==
Date: Wed, 12 Aug 2026 17:05:50 +0200
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
Message-ID: <pu3724you4tqsnuewo2uwqsubtwpf5t7kdd4of33awodjunfb4@cfzd3cmvlpjb>
References: <20260520175728.720877-1-adilov@disroot.org>
 <20260520175728.720877-6-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520175728.720877-6-adilov@disroot.org>

On Wed, May 20, 2026 at 10:57:27PM +0500, Rustam Adilov wrote:
> Add support for the usb2 phy of RTL9607C series based SoCs.
> Add the macros and phy config struct for rtl9607.
> 
> RTL9607C requires to clear a "force host disconnect" bit in the
> specific register (which is at an offset from reg_wrap_vstatus)
> before proceeding with phy parameter writes. Since it belongs into
> the vstatus register region, it requires the use of added read and
> write helper functions.
> 
> Add the bool variable to the driver data struct and hide this whole
> procedure under the if statement that checks this new variable.
> 
> Add the appropriate big endian read and write functions for rtl9607
> and assign them to its phy config struct.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  drivers/phy/realtek/phy-rtk-usb2.c | 58 ++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
> index 16c5fc3191de..69f0f5279b5e 100644
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
> @@ -146,6 +153,16 @@ static void rtk_usb2phy_write(u32 val, void __iomem *reg)
>  	writel(val, reg);
>  }
>  
> +static u32 rtk_usb2phy_read_be(void __iomem *reg)
> +{
> +	return ioread32be(reg);
> +}
> +
> +static void rtk_usb2phy_write_be(u32 val, void __iomem *reg)
> +{
> +	iowrite32be(val, reg);
> +}
> +
>  /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
>  static inline int page_addr_to_array_index(u8 addr)
>  {
> @@ -600,6 +617,19 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
>  		goto do_toggle;
>  	}
>  
> +	if (phy_cfg->force_host_disconnect) {
> +		/* disable force-host-disconnect */
> +		void __iomem *vstatus = phy_reg->reg_wrap_vstatus;
> +		u32 temp;
> +
> +		temp = phy_reg->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
> +
> +		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
> +		phy_reg->write(temp, vstatus + PHY_9607_FORCE_DISCONNECT_REG);
> +
> +		usleep_range(10000, 11000);

If you really want to make sure the delay gets completed within this if()
condition, then add a read.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
