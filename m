Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B8369208
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878918; cv=none; b=r/snhs4NHMHERT3WxIfcEcNUs/Il63GXhsMAPl7CoVkVro8h2vLa53C8iQ0qtdruvczkL+ni/7GYx3HMTiQGbrGgvOKu20C7XgIWM/KhKte8D/4tbZAz3qRfEH5D+P/hUXeWJZD39WCmuB0A3AgyLf+osSTNIEjSYKazIDYvvuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878918; c=relaxed/simple;
	bh=I45Jwk9+2vfqWVLFvIPP2Gr62VVGBw+PMOyqtfLWmaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrRlOPcIiYcJ7DwdFZJf4aApp1UDV13ZmBrwdVYGWE1AAUIoTdCAm4RbQA3xtKDcGveGqU7kaaq0JDuS66YI4alwnF/EZAmjrsrwecuzi2nJPvyJfy7AyaTRdyNKT7y1YAfNwczSdQrHBdvX9lvm9oHP4hoPSLUm8yj4RAqK/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=DNHGo0Pf; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="DNHGo0Pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783878909;
 bh=+cz4TC7FYuAA1MNLgolPmcFRysJt6pzD3nfMB9W3q7M=;
 b=DNHGo0Pf3IxE/au/Zj2MUyDlK36qOPDhbz0bPTt4/NqdHcAP/kPVAZx3x+/sj/hid8+eL35Ya
 67YcojP4kicQvp+1YtJu5tiDbHkO9gyOdGDFMVNafO907fgZFEhXJJDmaY43dh5eRCHmoQZ+8bs
 e1OQtgQ4lQx/caFlIzXZ4sT+6J/xzehKh3iFCMHrOFwJggghZqWxy8J+NL23PrLTbvwhHpBw/tu
 FpzsrzJ2xDHJlJx73d2FBsqpMjVcrv/er0C/V974kh/KHe+yQSYwOJSmOMmMXpCssSQ5A2AmXMU
 YxVhhQzQD75w6DhCfAztqQRJnoPSgGkcv6Z+jZyMvfYQ==
X-Forward-Email-ID: 6a53d4f81f631853be4f2d47
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e2ed95ee-8044-4a44-9775-9f36b10e727f@kwiboo.se>
Date: Sun, 12 Jul 2026 19:55:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Jeffy Chen <jeffy.chen@rock-chips.com>, Linus Walleij <linusw@kernel.org>,
 huang lin <hl@rock-chips.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-5-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-5-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Simon,

On 7/6/2026 9:58 PM, Simon Glass wrote:
> Add pinctrl support for the Rockchip RV1106, taken from the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). The IOC registers are spread across several
> blocks, addressed through per-bank offsets, with the GPIO0 block in the
> PMU. The drive strength uses the RK3568-style exponential encoding.
> 
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
> 
> [1] https://github.com/LuckfoxTECH/luckfox-pico
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 208 +++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.h |   1 +
>  2 files changed, 209 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 7e0fcd45fd26..f9cbcb955853 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1725,6 +1725,166 @@ static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
>  	return 0;
>  }
>  
> +#define RV1106_DRV_BITS_PER_PIN		8
> +#define RV1106_DRV_PINS_PER_REG		2
> +#define RV1106_DRV_GPIO0_OFFSET		0x10
> +#define RV1106_DRV_GPIO1_OFFSET		0x80
> +#define RV1106_DRV_GPIO2_OFFSET		0x100C0

This, and remaining offsets, should likely be from the related GPIOx IOC
base and not from GPIO1 IOC base.

The regmap_base should likely only cover GPIO1 IOC, else it would cross
boundary into the GPIOx+1 controller regmap space.

See my review comment on pinctrl dt-bindings, we likely need to define
the IOC reg space for each GPIO controller for this SoC and adjust this
driver accordingly.

Possible something like following:

  gpio2: gpio@ff540000 {
	reg = <0xff540000 0x10c>, <0xff548000 0x8000>;
	reg-names = "base", "ioc";
  };

or

  gpio2: gpio@ff540000 {
	reg = <0xff540000 0x10c>;
	rockchip,grf = <&gpio2_ioc>;
  };

  gpio2_ioc: syscon@ff548000 {
	reg = <0xff548000 0x8000>;
  };

Regards,
Jonas

> +#define RV1106_DRV_GPIO3_OFFSET		0x20100
> +#define RV1106_DRV_GPIO4_OFFSET		0x30020

[snip]
