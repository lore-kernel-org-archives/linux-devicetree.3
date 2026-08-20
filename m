Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2A1420485
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226470; cv=pass; b=Rm6hkoSUo4x9nVwGpAFHz+vO67qFHpjwpaChlxEKA+zWhivmTYmHaEY0zFrupf/EscZBTX/wFtkf5clXxdWNVVhA28+1kLCwFozfDi7eo/23XpYfcM/qzesUR8vpY7hibj5+FgvxvOOc32R703uM/eHZvkDqoY+B5aV+Af9Wfmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226470; c=relaxed/simple;
	bh=aXPojM4SS6RjwPonXF5sYz2ri5h0M5wozHxrhUCcUsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9iS4+euvrfvvuSkGYI/A3ATrW/1ORBMRt1FH/JBvkQvcP6qmN8HrFsuf4OeIbvbOQvPcREFs3D3FpOxw+zCKN9UUqY+rCrhhZzpLLpWCAYCY6cL4wdmT3xmTqPtoIjt0gcukKCdGhzWIuEZjFdZEN7Yo0dbeyV7fBxY3mHqkHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KemYWj7K; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KemYWj7K"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1c52d920b8so316235266b.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 04:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787226465; cv=none;
        d=google.com; s=arc-20260327;
        b=sP/pD0m8ywv3frMDUw+0vUfP/ZB68b0vSO9/+rQkIEqd5T23aa3Lf8oaFhRk94PsLC
         QMb+23D9U8mLBzbP8SI9eWE/6UaK1aCSH+HwGBZIyam3xt9LZhA5Xm1kuXzl8xUr32Lk
         b6+LP0La1wU+wuP8ojBL6XMtK5eTKvnPSaQRzC0uGdrqmez3deGxsgZGLgHEotv/L2la
         iEGHlWVRWyhgJHBaTlJupbKUR0iBIelnlsQhvLifxJMOGCvpEBiLKNgLphK0KoDCm1GV
         0QsG7SgkJLaVmRfOFjdReYqU8m4hsc9SNp54VBP/RrgxB4uKElNT7Id8Ewj3nfbtlv1e
         9oKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        fh=rEX96bYdkoEsjTZ6760XgzJwUnMBHDtAgtnrM9mAIDE=;
        b=Hq56yZlK7PkdEHhmbxVNw+7NIExHWgX0CLK3ZrHK0YfZg9Lgkywj3CJSLlWDPV1eog
         p1RblrHo9oUVZqXtpDrY1/8kd3abIv9ntwoWvGeQP89KScJhFrXXjxrQdOgmzTfuZ/RV
         Oo2BQ62ItApPkksjrsqlZv25V7Vt3kegwEiiDchowNMR5sWvHciPC2GprOBSfrhO6J74
         lXT1RSBeMHEAtcKYsjj4/FurYVWN3QlKQVeRR92WaU9lyERf3vkJFjsV1y/MxY8J0W49
         UXSPo/sCRmQ6L2RtYTTsIleE7+b9ER6eBTx6TFwLStMrDNDS+Sgznb34YjMGDFf4+/cB
         QqyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787226465; x=1787831265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        b=KemYWj7KpONmipbbKFiilT7O9fQwIW6FtjoZLxfIlIgslXNIHByLFcokTd0lN+Gb6d
         gLSyjn8B1huc57L5lPVpXW0DXdQl2vzpHCMI0KGcLQdok2wbs6cNeOsCYIcVVb2CF98Q
         CW0sDE8kQBWGZuR9I0RI5uXu9UuhJ9F3TXnLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226465; x=1787831265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=paOojrCaYfkKAM5OrAXgPdy+BI/CSmLloSHESiLn3MQ=;
        b=kt/jBnjVDxAOC9NpHwh+12lHjlNIkRaTVByh80QKFfAmkIY0i09FiFh9Uxio6RsOXg
         OHFqZX+rBZpvwkLkXCbgj1pvFvcjmLmH9srzAea/9Aex5EKU9hHBRQxymuSLGUu59VE8
         HozxV6nhsbeuDNdQ2sZ6tGoEg35iQUvLV5ca4ajFihEphAGlXVqPFCxz9cYOgYZsj27T
         UXoJ43ofRrESZDwI4GqsR1FcgnMJA0Pvoe5udyhTCi69cTzlZaTVCLW/Z/cpWySj+zai
         VoXE2wEP99c97bAyCJXWaW0HHZcjz78z7idrI8bq6x+OVaqOdrObN1+2wCd1nwE0gsgY
         vEPw==
X-Forwarded-Encrypted: i=1; AHgh+RqBBHTgVRn4IRXTBXodXApAWQgtsW8hgFEq6skcz486F0eLlE1pnEbCmp7HnW3M8OXdu11jG3tB2G11@vger.kernel.org
X-Gm-Message-State: AOJu0YyalgsYNdGbtOJVh+0T73LKGw577nbx5ccvudLSPsb2F2K4l75m
	+T3YdlB117GLYWa8GTxkCld44KI5xeI6v/ubfv0TOLPuGiEexyazXIX2YxBOvJQayQX6tOBheyx
	54JmfPC7NADCUGaFUWEigvbUl9f7I6U25uGl/a+GC
X-Gm-Gg: AR+sD12c0B35ocU6BwfvVQxtv1ZiSO32BiEceZJA16I+erUXyRxPA1JA0XHNdzeOWSD
	ZcQlWOC0QuUy6EAar4+8Gb1I50V2D75/3wtuC/D+McHjYQD3V8pJ7qQFXWyRocYFgXAF321ZdEq
	A3pCNSPBU4UFGlXC96C1FHA/LP/GrGP/Vj6rU0lqTUkFhpogMXwuStdr9XWSNzXZ47boiIgetPB
	a+C6xWGZQ4D9xNTam0u/+3Fcfxe9wjXPzICOjxQ8g5IP4K/1ZzBCHxDMaunKSydGHWcRj4Z1X35
	DqjITDQIRZHOXmHvymrXWjiTN3PNOlZfDoAx36LwVgY=
X-Received: by 2002:a17:907:84b:b0:c20:1c9d:8d4b with SMTP id
 a640c23a62f3a-c23f929e232mr710101966b.2.1787226465039; Thu, 20 Aug 2026
 04:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810121121.210040-1-vlad@zlab.su> <20260810121121.210040-7-vlad@zlab.su>
In-Reply-To: <20260810121121.210040-7-vlad@zlab.su>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Aug 2026 05:47:33 -0600
X-Gm-Features: AcwNN1Wh5n38wXHkJkuB8H7_benVkiW5QlI5gxabpims6DcR7Y_DZnlEoYHYlzw
Message-ID: <CAFLszTiuH7KcvCKcpE09tTavFEWGNMj+C1Og0T=k5MvEZdB-OQ@mail.gmail.com>
Subject: Re: [PATCH 06/25] ARM: dts: rockchip: Add Ethernet GMAC node for RV1106
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Vladislav,

On Mon, 10 Aug 2026 at 06:15, Vladislav Leonov <vlad@zlab.su> wrote:
>
> Rockchip RV1106 has GMAC 10/100 ethernet controller.
>
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
>
>  arch/arm/boot/dts/rockchip/rv1106.dtsi | 62 ++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> index fa5d0d7f4dcb..71dd3dcc386c 100644
> --- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -19,6 +19,7 @@ / {
>         interrupt-parent = <&gic>;
>
>         aliases {
> +               ethernet0 = &gmac;
>                 gpio0 = &gpio0;
>                 gpio1 = &gpio1;
>                 gpio2 = &gpio2;
> @@ -282,6 +283,67 @@ system_sram: sram@ff6c0000 {
>                         ranges = <0 0xff6c0000 0x40000>;
>                 };
>
> +               gmac: ethernet@ffa80000 {
> +                       compatible = "rockchip,rv1106-gmac", "snps,dwmac-4.20a";
> +                       reg = <0xffa80000 0x10000>;
> +                       interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq", "eth_wake_irq";
> +                       rockchip,grf = <&grf>;
> +                       clocks = <&cru CLK_GMAC0_TX_50M_O>, <&cru CLK_GMAC0_REF_50M>,
> +                               <&cru ACLK_MAC>, <&cru PCLK_MAC>;

Should this have a minItems exception like RK3506 and 3528? As it is
it fails validation for me as it expects 5 clocks.

> +                       clock-names = "stmmaceth", "clk_mac_ref",
> +                                       "aclk_mac", "pclk_mac";
> +                       resets = <&cru SRST_A_MAC>;
> +                       reset-names = "stmmaceth";
> +
> +                       snps,mixed-burst;
> +                       snps,tso;
> +
> +                       snps,axi-config = <&stmmac_axi_setup>;
> +                       snps,mtl-rx-config = <&mtl_rx_setup>;
> +                       snps,mtl-tx-config = <&mtl_tx_setup>;
> +
> +                       phy-mode = "rmii";
> +                       clock_in_out = "input";
> +                       phy-handle = <&rmii_phy>;
> +
> +                       status = "disabled";
> +
> +                       mdio: mdio {
> +                               compatible = "snps,dwmac-mdio";
> +                               #address-cells = <0x1>;
> +                               #size-cells = <0x0>;
> +                               rmii_phy: ethernet-phy@2 {
> +                                       compatible = "ethernet-phy-ieee802.3-c22";
> +                                       reg = <2>;
> +                                       clocks = <&cru CLK_MACPHY>;
> +                                       resets = <&cru SRST_MACPHY>;
> +                                       phy-is-integrated;
> +                               };
> +                       };
> +
> +                       stmmac_axi_setup: stmmac-axi-config {
> +                               snps,wr_osr_lmt = <4>;
> +                               snps,rd_osr_lmt = <8>;
> +                               snps,blen = <0 0 0 0 16 8 4>;
> +                       };
> +
> +                       mtl_rx_setup: rx-queues-config {
> +                               snps,rx-queues-to-use = <1>;
> +                               queue0 {
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       mtl_tx_setup: tx-queues-config {
> +                               snps,tx-queues-to-use = <1>;
> +                               queue0 {
> +                                       status = "okay";
> +                               };
> +                       };
> +               };
> +
>                 emmc: mmc@ffa90000 {
>                         compatible = "rockchip,rv1106-dw-mshc", "rockchip,rk3288-dw-mshc";
>                         reg = <0xffa90000 0x4000>;
> --
> 2.47.3
>

Regards,
Simon
