Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998487;
	b=d6mxaCRU5/+q+NU63fql4ausVUlGEOZDsheuHyejS10DcsyYC483tSZh7Q+VyZ231MB0
	 gH3qYQr4rworTYDg44fVcd9LWB0CngZWwtPamIuvudeL2G5axuR1FL3TT0K6fZS3PD+7d
	 4s+b6V9XqRDd3dF5K7puth+KKIs/2wsgleiSus5spWkiQPC94oiVeM/OQXlKUCUxwGOqQ
	 Q5XzDG1W/9MTX2kOFkGWoR03dP5t4xElgF7XD75a2Au7CUE7UX248LKwPpAsuZkVCJNCG
	 fxh/ldTHDpbCPSGK15hDKuUZSNVMIYQ/qLYvPli454pJB/AxZJ8K0K0Lz/j0+ANC2Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998487;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=eA5bJYl2DX4B2F944LFo8gIjbAOwIGsts+2iJmGpa8o=;
	b=JtIgB0uWoMhcAoltRaA8ZRE2niTz70TzrAtIR71JW171j08Xr1kWc8953cyHNL7g/oNX
	 klLgqycnSjEFNSOHjn+yTvUzmni5cQwfF2C/AvuUdTFDN5ZJuy+dqp3KeUF2ruHjaNu8m
	 h8Uxg2tdZkElK2tsIqqXWPnglsVV45k3P2x7ZzQ+o/l5GLf1fPXkl5CIRN3FeZwaCywiD
	 lBpyO0iQhuh4AsmZvWU0B9XAjLYdJLysWfM+khLrwxc7NUiDem9RsxkKPLACRIaFC3e0R
	 WZmeDCjLXI5dVM5VLII98j1mqCvXNFve1fsRth8ai/N2h8/W7OaMexcbvCbn9huCaEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHzdJmhr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F5D606A331;
	Wed, 18 Nov 2026 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHzdJmhr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050011F000C4;
	Wed, 18 Nov 2026 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998487;
	bh=eA5bJYl2DX4B2F944LFo8gIjbAOwIGsts+2iJmGpa8o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aHzdJmhrk8AvQMP52KBWR3kJhhJe6X/JHFc7uTrs9EDvrY43MMWzcSg5DDKNd2TY5
	 6o2+AfxvyYC0wvWPhtioeeS0TzXrzwWBeqs4qeehRlvKjTFHoihcYFt2rJyz3FOJ22
	 Mdx+krFvoBCZYVDZZo/aZrQMAxJCfP46uOBojDxMd58fnNCzkhB1hUeGBypRZRzuk7
	 ZjZtgXSsIL5Hexl/KsBsLkpP+UD5XrRX0Z+GIhhXcpKvC9oOh9SxGH8qo0vp6w/mYt
	 soRJFkgckm2aA04YpxiUPCsy/LEeKZ+g5LJEkC1NYrxwuiqH7Qfb22CTIHU40+qbpi
	 Yq01+xFRqcPzg==
Subject:
 Re: [PATCH net-next v3 1/2] dt-bindings: net: rockchip-dwmac: Add RK3572
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
Date: Wed, 18 Nov 2026 10:41:25 +0000
Message-ID: <179499848555.3136.11343853995146230295@kernel.org>
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>
References: <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In rockchip-dwmac.yaml, this patch adds an allOf block that
  sets `rx_delay: false` and `tx_delay: false` for rockchip,rk3572-gmac.
- [Low] Under the subject "Add RK3572", the patch adds `deprecated: true`
  to the top-level tx_delay and rx_delay definitions in rockchip-…

--

dt-bindings: net: rockchip-dwmac: Add RK3572

This adds the rockchip,rk3572-gmac compatible, with snps,dwmac-4.20a as
the fallback, and requires rockchip,php-grf for it. It also marks
tx_delay and rx_delay as deprecated and disallows them for RK3572.

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index e8dda1961ab31..d7b7bb0082357 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml

[ ... ]

> @@ -112,6 +114,7 @@ properties:
>      minimum: 0
>      maximum: 0x7F
>      default: 0x30
> +    deprecated: true
>  
>    rx_delay:
>      description: Delay value for RXD timing.
> @@ -119,6 +122,7 @@ properties:
>      minimum: 0
>      maximum: 0x7F
>      default: 0x10
> +    deprecated: true

[Severity: Low]
These deprecated: true lines are on the top-level tx_delay and rx_delay
definitions. Doesn't that deprecate them for every Rockchip GMAC compatible
(px30, rk3128 through rk3588, rv1108, rv1126), and not only for RK3572?

The binding doesn't name a replacement. dwmac-rk.c also doesn't read any
standard alternative such as rx-internal-delay-ps or tx-internal-delay-ps.
On the older SoCs, a board that needs MAC-side RGMII delay has no
non-deprecated way to describe it.

If a DT leaves the properties out, rk_gmac_setup() logs errors and falls
back to hidden defaults:

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_setup() {
    ...
	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
	if (ret) {
		bsp_priv->tx_delay = 0x30;
		dev_err(dev, "Can not read property: tx_delay.");
    ...
}

Could this binding-wide deprecation go in a separate patch with a rationale
and a successor that the driver supports? Alternatively, could it be limited
to compatibles where a replacement exists?

> @@ -141,11 +145,22 @@ required:
>  allOf:
>    - $ref: snps,dwmac.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3572-gmac
> +    then:
> +      properties:
> +        rx_delay: false
> +        tx_delay: false

[Severity: Medium]
With rx_delay and tx_delay set to false, how does an RK3572 board control
the MAC-side RGMII delay? phy-mode isn't restricted, so "rgmii",
"rgmii-rxid" and "rgmii-txid" still pass validation.

The companion commit "net: stmmac: dwmac-rk: Add RK3572 support" binds
rockchip,rk3572-gmac to rk3572_ops. That uses the shared rk_gmac_setup()
and rk_gmac_powerup() paths. rk_gmac_setup() always reads both properties.
On a valid RK3572 DT they are always missing, so it falls back to 0x30/0x10:

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_setup() {
    ...
	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
	if (ret) {
		bsp_priv->tx_delay = 0x30;
		dev_err(dev, "Can not read property: tx_delay.");
		dev_err(dev, "set tx_delay to 0x%x\n",
			bsp_priv->tx_delay);
    ...
	ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
	if (ret) {
		bsp_priv->rx_delay = 0x10;
    ...
}

That gives four dev_err() lines on every probe of every RK3572 GMAC,
rgmii-id included.

Then the set_mode switch in rk_gmac_powerup() passes those fallbacks into
ops->set_to_rgmii():

	case PHY_INTERFACE_MODE_RGMII:
		...
			bsp_priv->ops->set_to_rgmii(bsp_priv,
						    bsp_priv->tx_delay,
						    bsp_priv->rx_delay);
	...
	case PHY_INTERFACE_MODE_RGMII_RXID:
		...
						    bsp_priv->tx_delay, 0);
	...
	case PHY_INTERFACE_MODE_RGMII_TXID:
		...
						    0, bsp_priv->rx_delay);

In the companion commit, rk3572_set_to_rgmii() does:

	u32 val = GRF_FIELD(14, 8, rx_delay) | GRF_FIELD(6, 0, tx_delay) |
		  GRF_FIELD(15, 15, !!rx_delay) | GRF_FIELD(7, 7, !!tx_delay);

So the non-zero fallbacks switch on the php_grf IOC delay lines. The delay
values are fixed, and the DT can't tune them or turn them off. Before this
change, tx_delay = <0> was how to turn the delay off, and the schema now
rejects that. Only phy-mode = "rgmii-id" ends up with zero MAC delay.

The commit message says the goal is "so new designs do not use the legacy
delay properties". The schema does that, but the driver still applies
legacy delay values through its hidden defaults.

The standard tx-internal-delay-ps and rx-internal-delay-ps properties
validate through snps,dwmac.yaml and ethernet-controller.yaml. But
dwmac-rk.c never reads them, so setting them does nothing and gives no
error.

Would it make sense to either restrict RK3572 to rgmii-id (with the driver
skipping the reads and dev_err() calls for RK3572), or to add driver
support for tx-internal-delay-ps and rx-internal-delay-ps before banning
the legacy properties?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a%40qq.com
