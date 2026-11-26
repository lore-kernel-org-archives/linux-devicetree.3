Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697335;
	b=jbIykJANYDuOQtojkJu25hAqWnFIGa2nzM9CW6JxHgLU6AmjMBbgJRmsYpijhslOCKXE
	 fKJxDJRZCIw+c4v0cKkwCT+52Y1EUz9cOyJbnTPP+KY/KgVH1enJSeLXFA2qEsiIEAtt5
	 PbQoEKPvhKohtN/NdGRwlCELFq6wr1+bep1o0Yj7V9u3AeKbsEPA07MJRyrsxbG2kTRAG
	 qoVgP0aSZyHaDdGdRvIwhgbKsdzVmKgyRe0R8l+Mt5D0SLYUe/F+2250xjx0YXpifBij9
	 S3FpMM079UTBGrROmr4uxIRk8pf1rDX677Is8ITinymKi4whdTm5ZNFiHHW+qv7iIUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697335;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=REOzMMTPDLDlLUvCKX/dzO9sL/SNpW9z3fgnSLvxTe4=;
	b=ytt/y0bVjp5ckN7CnIGll6udDcUn479Qu7gX7HCkOcM9CBRaXlQM49K3GPTOWbcBGq6v
	 aeh5u2Ax+mP2Q3oXkQMWn4wC3fjnxs55ea6sWuTTXk5z3Jc3IkEPcGL5Dli/WZuaR4KE1
	 ibsOigq1kQOC0RVIISmhZprWaH9aY7g5fISCUD+44Z8wBaxEdaHb/hR77PRce+UceFBKd
	 83tnXsMVBACIAKJqhBokAwWdY2BqqmbPyuriQoplvF1P2kr4Zgx7uNET4MF55solda43Y
	 R+jSx8czvG5AC5JPs4wDAQzaIeG25nAR41nFtDvxodz2mS2f2tCcLAWpcnqPsV6kSPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1B606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db1f6f50eso7167113d50.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697334; x=1796302134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REOzMMTPDLDlLUvCKX/dzO9sL/SNpW9z3fgnSLvxTe4=;
        b=tu+8uEAam2GZfiXD11eIhX0lzY9aHR5PTvME23TxHUgNS3bNRKSR6vcV/cnLLh++pB
         8flInqedoZTiPWTEWA4VjVeWj+Rvfzsl89ZLbUXcE7dzv0aE7Se0Kz8jRk1H2dHI4xvN
         VXJVY8gsGM9ikzKSfNaYG03YSg5IuD0Sxl/Fq7LrO+Vkbbt9Tmc1MeLAk/K6CuVYnBxZ
         DJn9EqlKWbcknbRU0spBr02kWQ3eGCAdoDEW0VUtoiik7zotwGJDJG2Zb/XE7lvimI+G
         7WlcCqYW1mdsNz0gZikVR9RkiqDnD5yx4gGjsL+UTqT0K9crMgv5pdrRUpg0PrTDOP2G
         kxsA==
X-Forwarded-Encrypted: i=1; AL+hErG93wb1Tkq/7hDd5dqMlF4SZTj1vxFYbOBst9i8M8Gin3+DUrpYQFdqe1U84RgZK7apXBEfF0iFOqSF@vger.kernel.org
X-Gm-Message-State: APuU4Z91PCVsyMRA8rnPFPqe9i5dd2yHh/8LuCxpaT/D2DERYL2jPzVa
	7SNsMJLzUhUJ0+tqbh89W0/eOt8rqw0f4UI5hegwihOI5/41Y5KGmhRbtxhMNLz+AGc=
X-Gm-Gg: AZFdTZeIWApMSPicPBE7sscmSejvqB/bW3wXgjb5opwYdJ9l6fLmeEqR/CZtD/R07DD
	M0gH+tv7BUlVl9vpdNF/4rC4s4MHWYYsry4ST/JQ6V57T/3Qydh1FqZRUH5RcocOzFdOxTdtZ4/
	RFuMQI+OsfL/2qKQ7aehqFZxUSHV3AgylyRZK89WZo20bt8Y7iUULlD3iT+TD7M0Q8lB6+sb9dV
	cxQ43FBw/zWNiIjczPfp0lOE1LdLvxGn6Bh4nsYdfTAJOKhWKTi/+rrEKQ2h8uR7aDh2ChrsrfY
	vAnIQkr0oJdMU/p8ilWZjWSJhJW0vkc3QTzSO1nZSIxCTUmRkzAtjEARn8xBhG2sPiDcndIP1t3
	TZ67O0KKn0Gv+NtyrvbpvT+nnLkJnZ49tfZev6wZtc7UysQKvmHt3ucXLBI4MMPC+jJSOxQt6Sm
	GYbKpRWK37bpTJqZmd5SdZBzOoAFSW8bABwoxKx4yOnJ6UBS0ZcGsNqD3w07EFYZerngbH7dlKS
	N+jbxmIPYLtgCkowBpDvqG2XcHPFZeR//s9VRCuBuZByV1+q7hfTPZWwSQK0DPi/Ggt5lDWmwFZ
	OdvNXdt20zC7eCnlFjd8BIzMTbDrziEszIV6Ce9qEdMBiXuDr9nH4420o7duvFe/9bVSSWYOpnb
	vgTX/LbIubQmIATDEeZErxCvL6ddk+xtYJatsnt2r3t9UocL0/t9zepLuSQ==
X-Received: by 2002:a05:690c:3610:b0:8b3:2250:aed1 with SMTP id 00721157ae682-8b52045fff4mr87868377b3.26.1795697334082;
        Thu, 26 Nov 2026 04:48:54 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520354be4sm83372927b3.43.2026.11.26.04.48.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:48:52 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4e246acc2so49812767b3.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEQzJan+kDp4qoQK/1qQ2j7XixUJSkFOeqUGXh0E1ne2J69ZsRA1yQF7oDV4aB4oMil6Qm+7OA02DPN@vger.kernel.org
X-Received: by 2002:a05:690c:c15:b0:8b3:27b8:2bd2 with SMTP id
 00721157ae682-8b52042f569mr88911427b3.10.1795697331984; Thu, 26 Nov 2026
 04:48:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-4-tanure@linux.com> <179561837659.3135.6655031502321722558@kernel.org>
In-Reply-To: <179561837659.3135.6655031502321722558@kernel.org>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:48:41 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0MtVhPHAW_DSHJQMXSPgtJ=H1mKqGSR_09UOqAkgLexQ@mail.gmail.com>
X-Gm-Features: Aa3M54pUuxKwHlhmSM8ws03XH7rNC1f2K4BBc-Hnx_WBDraHYgmAijaXPXLQFsA
Message-ID: <CAJX_Q+0MtVhPHAW_DSHJQMXSPgtJ=H1mKqGSR_09UOqAkgLexQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: netdev-bot+sashiko@kernel.org
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:53=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] No driver or binding in the tree accepts the new ethmac node's
>   compatible pair, "amlogic,t7-dwmac" + "snps,dwmac-5.10a".

They are in net-next since 2026-11-20, from v7 of this series:
18029931478b ("dt-bindings: net: add amlogic,t7-dwmac") documents the
compatible pair and the five clocks, and c4c851a3325e ("net: stmmac:
dwmac-meson8b: add support for the Amlogic T7") matches
amlogic,t7-dwmac. The cover letter lists all four commits. This
device tree patch goes through the Amlogic tree.

> - [High] The commit message names two problems and claims this patch
>   handles them: 1.

Same commits: the driver claims the pipeline clock with
devm_clk_get_enabled(), and the stmmac core takes "pclk" in
stmmac_probe_config_dt() and enables it in stmmac_bus_clks_config().
Once the MAC probes, the node holds both clocks; the multiplexer's own
reference to pclk is no longer the only one.

> - [Medium] The T7 MAC is declared as "snps,dwmac-5.10a".

It is a 5.10a core. The A311D2 datasheet (section 14.3) says so, the
version register at 0x110 reads 0x1251 on the VIM4 (User ID 0x12,
Synopsys ID 0x51, printed by stmmac at probe), and the GMAC4/5 DMA
and descriptor layout moves 941/944 Mbit/s with no error. The S4 node
describes another SoC.

pw-bot: cr

>
> --
>
> arm64: dts: amlogic: t7: add the ethernet controller
>
> This patch adds the T7 Synopsys MAC node, its PRG_ETH glue registers, and
> a g12a-compatible MDIO multiplexer to amlogic-t7.dtsi. The multiplexer
> also gets an internal PHY bus. The MAC, the multiplexer and the internal
> PHY bus are all disabled by default.
>
> > diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/b=
oot/dts/amlogic/amlogic-t7.dtsi
> > index 7bd53ec166071..eb7f46c98b0b4 100644
> > --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> > @@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
> >                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
> >               };
> >
> > +             ethmac: ethernet@fdc00000 {
> > +                     compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.=
10a";
>
> [Severity: High]
> Which driver is expected to bind this node? I can't find anything in the
> tree that accepts either compatible string.
>
> meson8b_dwmac_match[] in drivers/net/ethernet/stmicro/stmmac/dwmac-meson8=
b.c
> lists only the meson8b, meson8m2, meson-gxbb, meson-axg and meson-g12a
> compatibles. This node has no G12A or AXG fallback.
>
> dwmac_generic_match[] in dwmac-generic.c stops at snps,dwmac-4.10a. The
> only use of "snps,dwmac-5.10a" is the stmmac_gmac4_compats[]
> feature-detection list in stmmac_platform.c. That list is only consulted
> after some driver has already bound.
>
> The later patch "arm64: dts: amlogic: t7: khadas-vim4: enable the
> ethernet port" sets ethmac and eth_phy to okay. Wouldn't the board then
> end up without ethernet?
>
> meson8b_init_rgmii_delays(), set_phy_mode() and meson8b_init_prg_eth()
> only run from meson8b_dwmac_probe(). So the PRG_ETH registers at
> 0xfe024000 keep the bootloader's interface mode and delays.
>
> The stmmac MDIO bus for mdio0 is never registered either. That makes
> g12a_mdio_mux_probe()->mdio_mux_init() on mdio-parent-bus =3D <&mdio0>
> return -EPROBE_DEFER forever.
>
> The node also looks like it fails dtbs_check against
> amlogic,meson-dwmac.yaml:
>
> - select has no T7 string.
> - The fallback contains list only allows snps,dwmac-3.70a or snps,dwmac.
> - clock-names is fixed to stmmaceth/clkin0/clkin1/timing-adjustment.
>
> The commit message says the multiplexer "probes after the controller has
> programmed them" and that "unless the controller holds that clock, the
> writes are lost". No driver in the tree does that for this node, and this
> series only adds a T7 binding for the MDIO mux.
>
> Is there a dt-bindings patch and a driver match patch that this depends
> on and should mention?
>
> [Severity: Medium]
> Is snps,dwmac-5.10a the right IP version for this MAC? The string is in
> stmmac_gmac4_compats[], so stmmac would drive the core with the GMAC4/5
> register map and descriptor format.
>
> The S4 node in meson-s4.dtsi seems to describe the same block. It has:
>
> - the MAC at 0xfdc00000 and the glue at 0xfe024000
> - macirq on GIC_SPI 74
> - the same rx and tx fifo depths
> - an ETH power domain
> - a g12a-compatible mux at apb+0x28000
>
> But it declares the core as 3.70a:
>
>         compatible =3D "amlogic,meson-axg-dwmac",
>                      "snps,dwmac-3.70a",
>                      "snps,dwmac";
>
> If the T7 core is also 3.70a, then once a driver binds, stmmac would read
> the version register at the wrong offset. It would also use the wrong DMA
> and descriptor layout.
>
> Could the version be checked against the hardware version register (0x20
> on 3.x, 0x110 on 4.x and later) and stated in the commit message?
>
> > +                     reg =3D <0x0 0xfdc00000 0x0 0x10000>,
> > +                           <0x0 0xfe024000 0x0 0x8>;
> > +                     interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "macirq";
> > +                     clocks =3D <&clkc_periphs CLKID_SYS_ETH>,
> > +                              <&scmi_clk CLKID_FCLK_DIV2>,
> > +                              <&mpll CLKID_MPLL2>,
> > +                              <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
> > +                              <&clkc_periphs CLKID_SYS_ETHPHY>;
> > +                     clock-names =3D "stmmaceth", "clkin0", "clkin1", =
"pipeline",
> > +                                   "pclk";
>
> [Severity: High]
> The commit message says the pipeline gate "is switched off as unused",
> and that the controller has to hold the clock it shares with the glue
> registers. Does listing these two clocks here keep either of them
> enabled?
>
> Nothing under drivers/net requests a "pipeline" clock:
>
> - stmmac_probe_config_dt() only gets stmmaceth, pclk and ptp_ref.
> - meson8b_dwmac_probe() only gets "timing-adjustment", plus clkin0 and
>   clkin1 as mux parents.
>
> The only "pipeline" consumer in the tree is meson-gx-mmc.c, and it claims
> the clock explicitly with devm_clk_get_enabled().
>
> Also, t7_sys_ampipe_eth is declared without CLK_IGNORE_UNUSED:
>
> drivers/clk/meson/t7-peripherals.c:
> static T7_SYS_PCLK(sys_ampipe_eth,      SYS_CLK_EN0_REG0, 20,   0);
>
> Even after a T7 entry is added to dwmac-meson8b, wouldn't
> clk_disable_unused still gate CLKID_SYS_AMPIPE_ETH? That would cut the
> MAC's DMA path to memory.
>
> For CLKID_SYS_ETHPHY, the mux is the only holder until a MAC driver binds
> this node:
>
> drivers/net/mdio/mdio-mux-meson-g12a.c:g12a_mdio_mux_probe() {
>     ...
>         pclk =3D devm_clk_get_enabled(dev, "pclk");
>     ...
> }
>
> That reference is dropped whenever the mux probe defers or fails. This
> looks like the same ordering hazard the commit message says it closes.
>
> The five-entry clock-names list also doesn't match
> amlogic,meson-dwmac.yaml. That schema allows at most four entries, with
> index 3 being timing-adjustment.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261121213102.143130-1-tanure%40linux.com
