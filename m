Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998489;
	b=gNY0X3aU9A6jjKHut1kb92ZoCcRCm/oeVXeKboq5onlci1Rn98PQFqh5TfDd6Rpnjdm2
	 9ro/rg4wgkliD8bKYOG2wBJ8fO2pSAQH0pvkwr3rYXArEedZmic0it9mgs9x54R3cguKK
	 xw3gTzHzN7uSIi5ZO9Y0TSF0nllZDfyRiB82JYrTP9rB+5mpy5+cHOqYfpBrl+u10C+qU
	 +BCn0wty2Z6QIR9EPKPXsrKR9ONc4Jbl1dZP+m5aj71U4l2A99OpdBRJf03Oi2/L+KlFY
	 x2aIUcREMdf9WpXunaAE5ykmiO9C/MB+jkEp+qrDalmIC+O7CuqHW1szkiPcixoDjIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998489;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wtOLIIGy2V2qdHSm0s3wSDnD9BTWQqmLjRaYH3bZpf0=;
	b=zpM2LLy+edQ+MvzQV1ZumIUNruEqEiA2LNOGEJtCndF7z2uWUUJwJJnBmAsDYC9Ddv21
	 ru77PhOZFguAORxh/YxN/cxyzrnBCI8IVb4Z8mCU5fFet1DSenTv5cCFAhzSvGiGvpYAK
	 ct9Hx/GzDJjOV9ka1du7ig3HttkypzR1CytADqcp3TW4VHrEaqduESOgXtMjJsnHd/XL2
	 V/g1cXoig6IP0uFFhz1O4NVeci3NdCbL374+lNQbJL8vyAgJqv+R9C6GJCqyGbfp7gsHg
	 Ulyfx2txjgn4Zzu6u3lRNDJjhLjV8LE+ke1qqAN6NxRXaidmPc4axhXexkVxaQfc3fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7MKf6u5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7FF60A2613;
	Wed, 18 Nov 2026 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7MKf6u5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AF91F000C4;
	Wed, 18 Nov 2026 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998488;
	bh=wtOLIIGy2V2qdHSm0s3wSDnD9BTWQqmLjRaYH3bZpf0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=A7MKf6u5BHKVv1R+Sujt5r3gCGRPLDpsQh5UyGBQWLTwhrw3HU8TlJiyxwPrUE3mN
	 Huj5qK6DeLVXVLYA4MUu6uJHwaTzAeA+CEXzTZNAu2UhXHdjFUHRIgu8HQrEvGmcEH
	 OBlCpLIIxDmCKpsZGWhV9kZD+3YGtisvctqk2/zqx21lL5Kl7XEBE/EiCYfFE5Mf3W
	 Mv+wRB9fNsgyp1QBEKvscVcTygexfmL0BQqXcGhxQh+OVks8SezcqxTi9vLPCsALop
	 2e37kfKZM7MZLokOefBdu8+tkkdC8OQtDqVyUQGZrbtO7vjktfCYKz3qvR+lrXdGLa
	 f3FGIt0Qr74/Q==
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-rk: Add RK3572 support
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, david.wu@rock-chips.com,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 18 Nov 2026 10:41:27 +0000
Message-ID: <179499848737.3136.8604402338812509621@kernel.org>
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
References: <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] RK3572 RGMII delay lines get fixed values that the DT is not
  allowed to describe.

--

net: stmmac: dwmac-rk: Add RK3572 support

This patch adds RK3572 support to the Rockchip dwmac glue driver. It
covers the register layout for the two GMAC controllers in the PHP and
NVM0 GRFs, plus a set_to_rgmii callback that programs the RGMII delay
lines through the IOC.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index a37df5767d84e..c9d8d8bf51f7b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> +static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
> +				int tx_delay, int rx_delay)
> +{
> +	u32 val = GRF_FIELD(14, 8, rx_delay) | GRF_FIELD(6, 0, tx_delay) |
> +		  GRF_FIELD(15, 15, !!rx_delay) | GRF_FIELD(7, 7, !!tx_delay);
> +
> +	if (bsp_priv->id == 1) {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
> +	} else {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
> +	}
> +}

[Severity: Medium]
Where are the tx_delay and rx_delay values for RK3572 meant to come from?

The companion binding change in rockchip-dwmac.yaml forbids the legacy
properties for this compatible:

  - if:
      properties:
        compatible:
          contains:
            const: rockchip,rk3572-gmac
    then:
      properties:
        rx_delay: false
        tx_delay: false

That means a schema-valid RK3572 node never has them. rk_gmac_setup() then
falls back to the old defaults and logs an error on every probe:

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_setup() {
    ...
	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
	if (ret) {
		bsp_priv->tx_delay = 0x30;
		dev_err(dev, "Can not read property: tx_delay.");
    ...
	ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
	if (ret) {
		bsp_priv->rx_delay = 0x10;
		dev_err(dev, "Can not read property: rx_delay.");
    ...
}

rk_gmac_powerup() passes these defaults on for "rgmii" (both delays),
"rgmii-rxid" (tx_delay) and "rgmii-txid" (rx_delay). Since bits 15 and 7
are set from !!rx_delay and !!tx_delay, rk3572_set_to_rgmii() switches on
the IOC delay lines with 0x30/0x10 taps for every RGMII mode except
"rgmii-id".

The 0x30/0x10 defaults come from older Rockchip SoCs. Do they match the
RK3572 tap size?

A board can't override them without failing schema validation. The driver
also doesn't read rx-internal-delay-ps or tx-internal-delay-ps.

Consider a board that uses "rgmii" with PCB delays, or a PHY that adds its
own delay. Could this leave the RX/TX sampling skewed, with no supported
way to fix it in DT?

Would it make sense to either zero the MAC-side delays for RK3572 when the
legacy properties are absent, or take them from the standard
*-internal-delay-ps properties? If not, should the binding keep allowing
tx_delay/rx_delay for now?

> +
> +static const struct rk_gmac_ops rk3572_ops = {
> +	.init = rk3572_init,
> +	.set_to_rgmii = rk3572_set_to_rgmii,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a%40qq.com
