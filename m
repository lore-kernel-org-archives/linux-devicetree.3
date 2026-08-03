Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1797540DFD5
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781063; cv=none; b=rKgY4OaaLHxpCp8T1ZKOnfjJ8+1O48zLd8dILTGl+bAxloEGilpUvtTj4HSBQRt3w73i0i3Msh4CEWI1cZ8u9X8GM5uDoQKYOKgta6iFBF+716Lrn40Jc6EhhMSzsFZp3tDa4HJr2Ufw1mr0J8RbgJBb/+6VE9r/4PM5kyoDmA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781063; c=relaxed/simple;
	bh=zHnK76eYZt/jvFOiyFF9xye2OlMdxoJKYVaYI0rCF/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+zeMcNM8+LWHN31oIZziPGcq4qJ5s2LX5Dv9Fj03p+KeFIdvJ4qJYAQiagL9ZJlJDSXhYRIa0bTR7k70EG4/4uPQStN00Bl6apu0Banl+m9aTKX8OOPvOV57ZNdRGZwOsVs6Z3CWBL1zEfpQyuGncpW+8D6FRkn+975ZTIC6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=sUy2tzkB; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="sUy2tzkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1785781059;
 bh=48pATyxGPcKiHdKzUijPovZ+zH3w+9sc05TXmUj+Rdw=;
 b=sUy2tzkBg10BhkARk3hQytyluMWkjuk/YbcUJRuv+TDg//2P4B903A9Mn7LgiGPv+h8TbtphD
 NmhKpoXLZIhUAvZkDEhHdEoJaq32S83nPRGy20xNVuk/ikugQ9ftcUge+D91kIG5YAnGonIhCH9
 ISr+Ehxs2mN/Zb8WPC3WZbo0oCtKzItkDYWTAUEpLAzTl8xEeW93nj5rV3UXr5EsliACuU6oLG4
 3Fh7mLsUOl0+XbtkShSprLR1tjmh0uHPK9pEOCaK9CegOdb/h1T6snUVFbDZVjxZ+lyC0tzhET3
 ShOldSpe3Yg0RExWh6pXhjBSGXt3Pa7lHeqxfipl2s6A==
X-Forward-Email-ID: 6a70daef13b6196e87497e5f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwiboo.se>
Date: Mon, 3 Aug 2026 20:16:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
To: Zhyi <zyheihei_123@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>
References: <20260803104646.26836-1-zyheihei_123@163.com>
 <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zhyi,

On 8/3/2026 6:42 PM, Zhyi wrote:
> arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing
> 
> On the HINLINK H28K (RK3528), the RTL8211F reset line (gpio4 RK_PC2,
> pin 146) is left unconfigured at power-on and reads low, holding the
> PHY in reset. The PHY node's reset-gpios are only acted upon after the
> PHY has been found on MDIO (fwnode_mdiobus_register_phy() reads the
> PHY ID before it requests and toggles the reset GPIO), so the first
> probe deadlocks and eth0 never gets a link:
> 
>     mdio_bus stmmac-0: MDIO device at address 1 is missing.
>     rk_gmac-dwmac ffbe0000.ethernet eth0: cannot attach to PHY
>     (error: -ENODEV)
> 
> Move the reset to the MDIO bus level: mdiobus_register() asserts and
> releases the bus reset-gpios before scanning the bus, so the PHY is
> out of reset when its ID is read. The PHY node no longer declares
> reset-gpios for the same GPIO (a second consumer would be rejected
> with -EBUSY).
> 
> Fixes: 145d4af4b204 ("arm64: dts: rockchip: Add HINLINK H28K")
> Signed-off-by: Zhyi <zyheihei_123@163.com>
> Assisted-by: Codex:gpt-5
> ---
> Changes in v2:
> - The root-cause analysis and this fix were developed with the
>   assistance of an AI coding assistant (Codex, GPT-5). The resulting
>   DTS change is minimal and the hardware validation was done by a
>   human on a stock HINLINK H28K board.
> - This v2 supersedes the accidental duplicate of my v1 RFC sent from
>   my Outlook address (Message-ID:
>   SJ2PR04MB851017E50140354C2F5B3FF3B5D52@SJ2PR04MB8510.namprd04.prod.outlook.com);
>   apologies for the duplicate.
> - Use the standard MDIO bus reset properties (mdio.yaml reset-gpios,
>   reset-delay-us, reset-post-delay-us) instead of the deprecated
>   snps,reset-gpios on the MAC node, as suggested by Andrew Lunn.
> - The PHY ID is not hardcoded, so boards populated with either the
>   RTL8211F or the YT8531 work unchanged (as noted by Chukun Pan).
> - Thanks to Andrew Lunn and Chukun Pan for the review feedback.
> - Validated on the stock HINLINK H28K board with Linux 7.1.5:
>   eth0 shows "PHY [stmmac-0:01] driver [RTL8211F Gigabit Ethernet]"
>   and phy_id 0x001cc916; both eth0 (GMAC) and eth1 (PCIe RTL8111H)
>   work.
> - The U-Boot side (generic RK3528 DT does not configure the reset
>   line) is out of scope for this DTS fix and may be addressed
>   separately.
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> index 0ec50e9..7ba3fa4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
> @@ -200,14 +200,14 @@
>  };
>  
>  &mdio1 {
> +	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	reset-delay-us = <20000>;
> +	reset-post-delay-us = <100000>;

This is not really a correct description of the hardware. The GPIO4_C2
pin is used for PHY reset, not to reset the MDIO bus. The device tree
should describe hardware, not be used to workaround issues in software.
Please see [1] for my prior analysis of this software issue.

Please add the rk3528-hinlink-h28k board as a target in mainline U-Boot
using the board specific device tree. That should help reset the
Ethernet PHY before Linux is started and solve your issue, as Chukun Pan
already suggested.

[1] https://lore.kernel.org/linux-rockchip/47d55aca-bee6-810f-379f-9431649fefa6@kwiboo.se/

Regards,
Jonas

>  	rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
>  		reg = <0x1>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&gmac1_rstn_l>;
> -		reset-assert-us = <20000>;
> -		reset-deassert-us = <100000>;
> -		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
>  	};
>  };
>  
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

