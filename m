Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794004067;
	b=oRSSa0muM4VkarVIGyS4GJyl9MaTYnzFUBHdrxN/eeC6zW29zaMrIytOmLZEFhxwexnG
	 WRzU5b+FG1bpGP10gSjuL7ytSQEeS92MWe6QtStfMLc6gl+8gDOE/hZYJyA+aogDYUaJx
	 JfZNHL0hSON7Tj3Iki7ipbwdwPpb1GmT2iqkRpTmnxtHes6Fx3glF3+yuQW6kNDnZDqT4
	 xl4aO0y64es6uJylDauxkNF4FDhJ8IgdWL6HxgMqXJfDDeyuhDiYMH98/bILFFKsC8a5u
	 kqNE0C/xO9sm/8//MrTyu16Ha2oJkimUJIITXAzI0s39gc8HwayTfr8GAsSshaQ3Tdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
	b=yKkzEKBnUeTIuE+G76OIuIbtCYkdboMYLe9kwZ8teDr/NF5XKqf/wg+43GpAAb7Ah5Wm
	 JWeZ9G4MMZinncV1Gxn2PFKKOHJFAlAFp1kzj5IHxvv0OunpG+Hm6zwHp6sDG9R66PdJd
	 GgruQZSVMLIuNCm1nGFzu/Fkuu6UnRM3SdDFHGmWlrKFxFezKvzYhTVzor5R0msI5Zt2C
	 AWwGb7sf3xchNifK9uPuz3ZADY84HhLH2Dg0wJY+BInYh6vhy+efK9Y4Zd/7IA3S9RQwE
	 ULcGNGIY8VKPQbTRuRri0FnS1X9fxH90EPzTgMVOgIuoMA5T8IJ/F9Lz1HNAG6rUq1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LrO6gz3q;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88529606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 22:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88529606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LrO6gz3q
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so658013f8f.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794004065; x=1794608865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=LrO6gz3q3TY5UyCJOUBox/jjNcpxcJ2iAUHSQ0uClQVQf0wM2zRmqenKRj+0+YEWiW
         yV2HOJRF3YA+WPieH13BkTkh7BEKnK040T6AxoBSU/NZTmP6uA2l5fW5B3zeTwH+n6wT
         PBK0Fihz1HLsWmo0/C98BGnDAsRDCdtWZrWElYILBY2JcuYZKOBBVwLZEhNzZVRbtkxS
         ug+KkGnyno3GobtlniguEXtAX/Y7ZSWcbFoKp5v+NeQi53SUrFn9GTu/o4mUslsT5GLs
         0CQE0/7Yi5XJ0jYhQ6kvPCXZIIp6raSkr09c0B64iFEt5q+7wtbJkmvR6BWeM5uRL2Zk
         +VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004065; x=1794608865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=d6Kv678hSdXqvS7dV9zNmC+QLUWjVAqMfOXmFUZ0M4XeeASk7G0pU8A4OlOsrvm4Ya
         iLmX/uBu5+1j0eQ90G7pmDqhgyAKqn3+7s6/bnzpVzK6GH1jg3/NwYF66e5O4nUk4lAD
         MAoKgAqRTD4rzwcaJUmLW7HEPYnnog7FMzg5y7T47jge2FQNOInS9sBPCwhcFaJKIdQY
         zOM2jz985JAT4TbPqv0rd0Fkoc7eAyQF6600XUsarWa8WHLFCCL4/NkPFl+nA52DUD/Z
         XpywbTCnx4QKpE2B5lricdKKiueUGR5oNfS39UxJZzjhQV3chtV5x0lT7w+ufIiotP92
         XcAQ==
X-Forwarded-Encrypted: i=1; AL+hErHfRq0oQ9tYqv2Oduacd6AchD/rgtVFhRSRTz1devqc0CYI8q7Ffl673TjnAcpmf0MB1ecqXwCxV9Sz@vger.kernel.org
X-Gm-Message-State: APuU4Z+U1cxIRsqeInviy6+ud181BsrMVR+6/0v2GE+L4TFI+yWl/rXQ
	+ATVa6qU2dF2PWvxeTUrMav7rruogeHAdbYC1MmNNO2lcop8SOJjlXPLdH+2MCtpGEA=
X-Gm-Gg: AYBFou1zMmwyc4L9IQHPwJqZi9F9FO7HZhGzNB32YZurHJu8WtXNUm2iiTMkpbQ06LZ
	Iy/9xRRg3Dz97rjaLF03dnNBM7QOd9TDcjyLe/pk4WyEFrGFzvpOmCiMS5v0is9jes2wKBpJdiA
	uj0KhoPyf9EMvW2ZWN0zyi8erNwuIHayrQqDY6zEsH4nvNstLqHrqu7QWl8Ajv/YN9R9+qGhpD3
	n0sck+QumXIf2CejulM7jSAkwV6bWNDQJPm0ivClC0Ksv1ueoW09g2G7aipjPaOHA98Gr6lYEtU
	8TUUCz4uZjrzVtc5BFzW+II6PW/kypVdI9RNYIfAY4yz2damwv7zp1XDveHhBBM8fjaiDY9if5a
	vVrzEBLvF1LinRvbn1cg1mWteAnkNx2N1/glJIjVOu5zM7f95yilOqABoJWxyZ1F9cMO4+TWmoX
	Ip2aYf+3yco62Bhu3/IFN2BsJWtZnQ5fWdyHSoAXyhqi8SXE7s+gTwXRle+VV2altCLU0day/yk
	xUqBJ9FvIE6Epgi1RTGDAvHtlPavrYwI5QekQJxIaA/L0VvxHwglsX1h98Pkb/3lszVVJDMgGo/
	QoWo5da5voLDU0S5EYyvlIKa0hBrq/QAJ+SpX9XtHQPJLqDcY4p5f4HmYEnfkrEYI41x7gtWkCH
	Zh/sCeILbw7o=
X-Received: by 2002:a5d:5d13:0:b0:490:ef5a:bf39 with SMTP id ffacd0b85a97d-492733d12f2mr5925598f8f.6.1794004064618;
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm5497080f8f.28.2026.11.06.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Date: Fri, 6 Nov 2026 23:27:38 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au5RoF6BooP14xhY@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
 <20261106-headband-buckwheat-fecbd459ee85@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-headband-buckwheat-fecbd459ee85@spud>

On Fri, Nov 06, 2026 at 20:48:01 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> > On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
> > 
> > > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > > +
> > > > +        clock-controller@0 {
> > > > +            compatible = "amlogic,s7-peripherals-clkc";
> > > > +            reg = <0x0 0x0 0x0 0x49c>;
> > > 
> > > What's with the weird numbers in this example?
> > > 
> > > Examples don't have to be real, but when it looks like this the
> > > immediate thought is that the modelling of the device might be
> > > incorrec.t
> > 
> > The numbers are actually real, but the example simply lost their context
> > because I copied the node from the S7 dtsi (not yet submitted), where
> > the controller sits under the APB bus node (bus@fe000000) and the bus
> > ranges make the addresses relative to it.
> > 
> > 		apb: bus@fe000000 {
> > 			compatible = "simple-bus";
> > 			reg = <0x0 0xfe000000 0x0 0x480000>;
> > 			#address-cells = <2>;
> > 			#size-cells = <2>;
> > 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> > 
> > 			clkc_periphs: clock-controller@0 {
> > 				compatible = "amlogic,s7-peripherals-clkc";
> > 				reg = <0x0 0x0 0x0 0x49c>;
> > 				#clock-cells = <1>;
> > 				...
> > 
> > In V2 I'll use an absolute address for the sake of clarity (PLL has the
> > same issue).
> 
> Before you do that, can you please share with me the s7 dtsi? Cos surely
> you've got it in some git repo online somewhere.

The S7 dtsi is already upstream at [0], the peripheral clock controller
and PLL will be enabled in that DTSI with a following series after the
bindings and the drivers in this set are acked, following the diffs that
will be submitted:

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 2c204dcebbba..5f2a61f42cbd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>

 / {
@@ -160,6 +162,22 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_pll: clock-controller@8000 {
+                               compatible = "amlogic,s7-pll-clkc";
+                               reg = <0x0 0x8000 0x0 0x1e8>;
+                               #clock-cells = <1>;
+                               clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_HDMI_PLL_OSC>;
+                               clock-names = "fix",
+                                             "gp0",
+                                             "hifi",
+                                             "hifi1",
+                                             "hdmi";
+                       };
+
                        uart_b: serial@7a000 {
                                compatible = "amlogic,s7-uart",
                                             "amlogic,meson-s4-uart";

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 5f2a61f42cbd..afc88abea301 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -162,6 +162,40 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_periphs: clock-controller@0 {
+                               compatible = "amlogic,s7-peripherals-clkc";
+                               reg = <0x0 0x0 0x0 0x49c>;
+                               #clock-cells = <1>;
+                               clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                                        <&clkc_pll CLKID_FCLK_DIV2P5>,
+                                        <&clkc_pll CLKID_FCLK_DIV3>,
+                                        <&clkc_pll CLKID_FCLK_DIV4>,
+                                        <&clkc_pll CLKID_FCLK_DIV5>,
+                                        <&clkc_pll CLKID_FCLK_DIV7>,
+                                        <&clkc_pll CLKID_HIFI_PLL>,
+                                        <&clkc_pll CLKID_GP0_PLL>,
+                                        <&clkc_pll CLKID_HIFI1_PLL>,
+                                        <&scmi_clk CLKID_GP1_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL_PIX>,
+                                        <&xtal>,
+                                        <&scmi_clk CLKID_ACLKM>;
+                               clock-names = "fclk_div2",
+                                             "fclk_div2p5",
+                                             "fclk_div3",
+                                             "fclk_div4",
+                                             "fclk_div5",
+                                             "fclk_div7",
+                                             "hifi_pll",
+                                             "gp0_pll",
+                                             "hifi1_pll",
+                                             "gp1_pll",
+                                             "hdmi_pll",
+                                             "vid_pix",
+                                             "xtal",
+                                             "axi_frcpu";
+                       };
+
                        clkc_pll: clock-controller@8000 {
                                compatible = "amlogic,s7-pll-clkc";
                                reg = <0x0 0x8000 0x0 0x1e8>;

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi

--
Carlo Caione
