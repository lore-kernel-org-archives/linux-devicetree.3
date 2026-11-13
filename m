Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570517;
	b=l2wBt0CjD0sPGAok7YjncRi26OieZaArmODWLfeSWa3sXV5F7AyRvy+69BhdtNARTDXA
	 u0jmHQdO2fc/u105pMYE2uOvSPcaSvaHztHBt08ddvcK0XaNcG/js+6b6sSdF2ENX14CI
	 zSbtctS7q30I7fVikb2do2NFoN5yrm+gtHAL2Z3f8iqhcfZULkLAWiip5rpvTqnFQvKeG
	 u2l6zadrJQcj6dxbrwmu0WRbWfTisq7/C1GGviSd58RO3gJyOzjNYbvdmo/wwL4T4x+5D
	 idfhBpNXtBl/jtP73YAABIl6v+CZn+XSm+exFpj/IsT7nFTj+yMQPUSyBhzUVP0X/qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570517;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l1+NgW92VziZf9PgBdzApbIe2BkR1TvVvXtYjUT220A=;
	b=kcj22Xaoo5aaNNAtWzQ9zsy/x7GfGvdgAGZguKvQMMT2IFMU5xJZObxZzvmQwAhoOuKD
	 R5/kfqcRJgiUT4gP/oV+z7Z3ldQFrXNoF65BgxEOeaiOMjKeIH1d6jA9r0GhCumTWQMki
	 Xl0GokEWpR9Q0dPN72tcIuibEw1X59FZzH1oEExj7LSGxZfg73275ZnfOTViRxzzmBcOg
	 UfKg643mz8x3GIykPZLUyqKXeTmG6M55q5OafbQRuZMOtQVjiPh52VyLHyL78hzvBmLhU
	 IywTDO5LF6XKjKA4cW5Jv1I3/XR3pyRxJGsJVLeh8e6q33FxBHLkRFBg6a4ZXuDOaWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70103606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70103606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91f0c4f7a8fso16934226d6.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570516; x=1795175316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1+NgW92VziZf9PgBdzApbIe2BkR1TvVvXtYjUT220A=;
        b=l5onceEnTR6soo0epoNZCA3xPoBSw3h+c9w/Jg6drQehw3nr1ugn46Je0o2BnpxnZ1
         bJiTSdNXtJi29034GsQvAxQUiRWqJ3nBCdDFQ250dRmZl4imjzNbv605zjeVwJiM8wO8
         zkRH3Y3KLl+5ZQrM2BT44ngX6glRYSV+nG/pYvGPymWCFROkyJOXHFXfHm1gPe0ABOgz
         MyEtzocfKbFfOiINfwoA3ZlZhEcAf/5Dm3D1tEo7MmaOtm9/J2+9DapbHLw9HKY6KF/+
         nA0lYa44l5E5FwdFB+Rgdvh90YKkTvS9Q42d5gCbU5/qr50oZxq4Kd0mbJJNS64qtGlM
         7hxg==
X-Forwarded-Encrypted: i=1; AL+hErH0ibIP4imNFAS3o0LcfRu0+Xbpl6PdBvpXv27OX7jnA+AVenh+0XtWHM2Vw6qybm8afHY2k0PDef+w@vger.kernel.org
X-Gm-Message-State: APuU4Z/qEAeR0wFNOaO35oh2XnhNIvgo+VijwiTmON/sF2YCyLTdTVjk
	vzcwynF23EiR/Q+zgBpXiMjxWNzy6CqzfDI2ElsrM3V5xXwJz6Sv0pF5iMzMX4SUkdU=
X-Gm-Gg: AYBFou2wijuAIzBXthTRV66gNoSc+2KmIroK8hJ8jDvtqSlfrrWvUCcWPTLLf9kaxFK
	0XNmeTGlra22gCt0u5go+8ZoxFqLzvIIYyznlyJzjzjBoL2CHXsRKTVzkpbucf5ivOSXMk1XZMt
	ziaJtzIAkYLJ8Xm1Xeb9cGQISCVuUO9hxbm2SjDiBWfWrAfIyGbBMbN+twNGNM8kUs1h22jhc7p
	OIPNsKc0ntwwSyzj+zXa6G/MM7Garj5vYgR93lhyahPmzM6IX9YE8xIRrXv0u1qO/9lf0kdsHCI
	CfUlrPwykzRJJTUCHPGl4uMiKzSRKwtgaXkIs9SXP2rnfoUmpvUsClOBl2dBFIcP+YntXRYcxvC
	CGOOHiKphxuFFMOZEMqBvTu6hpVU2R37hmuT1vLFi2ZElBvzbPa6hHjk9to5rzEacHThsaCprxa
	KMcEwVqEBB4qkarK+gay/B3ZqzlSBVlmm7tXDeEDBocIH004mInKB2rZcn4FSyHW8aOQz5xOYEK
	H1+mfEu/xyJxbpOd4zwRe8vQqBk+mKtAKOigquvXcFYkj86zCAW4TP780z7uzgm/HXcBfoIik6y
	B6322+krLfA7t2+6MKftKTlXxfF4NE8CberYXRzppLzCY1AtSmyw/10kPDiXSx/Foo3uvj1xMnw
	YohtHBXyLWlL4G6j+ed6ggjb69Wk5GrgjofEzkfWKvOr4klibhvfuiA==
X-Received: by 2002:a05:6214:3189:b0:91f:184f:3115 with SMTP id 6a1803df08f44-91f241a7c1dmr28802686d6.26.1794570516266;
        Fri, 13 Nov 2026 03:48:36 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm18729116d6.27.2026.11.13.03.48.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 03:48:36 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e98301805so17307326d6.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:48:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE03v7p19rmpT0f1rvIdYsictQidMdENz7CvNeJiqPX8xNdFv4677hZnA48cThlHDaVcYkAoFmk/eTi@vger.kernel.org
X-Received: by 2002:a05:690c:f85:b0:8b3:45b:a4f3 with SMTP id
 00721157ae682-8b4aa350595mr13731467b3.83.1794570029115; Fri, 13 Nov 2026
 03:40:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103163715.385394-1-tanure@linux.com> <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll> <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
 <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com> <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
In-Reply-To: <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 13 Nov 2026 11:40:16 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
X-Gm-Features: AclHuK9I2BMo6FvBmijHWWypkJRsPu48XUE9NXvVmMxUtTJAFVoacoB_pnoFyzs
Message-ID: <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, xianwei.zhao@amlogic.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:43=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> =
wrote:
>
> Hi Lucas,
>
> On 11/9/2026 11:43 PM, Lucas Tanure wrote:
> > [ EXTERNAL EMAIL ]
> >
> > On Fri, Nov 6, 2026 at 3:16=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com=
> wrote:
> >>
> >> Hi Krzysztof, Lucas,
> >>
> >> On 11/5/2026 7:57 PM, Krzysztof Kozlowski wrote:
> >>> [ EXTERNAL EMAIL ]
> >>>
> >>> On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> >>>>
> >>>> Assisted-by: LLM
> >>>
> >>> Drop this one.
> >>>
> >>>> Signed-off-by: Lucas Tanure <tanure@linux.com>
> >>>> ---
> >>>>    .../bindings/net/amlogic,meson-dwmac.yaml     | 59 ++++++++++++++=
+++++
> >>>>    1 file changed, 59 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwm=
ac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >>>> index e769c9bb70d8..6de013e3e8f6 100644
> >>>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >>>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >>>> @@ -23,6 +23,7 @@ select:
> >>>>              - amlogic,meson-gxbb-dwmac
> >>>>              - amlogic,meson-axg-dwmac
> >>>>              - amlogic,meson-g12a-dwmac
> >>>> +          - amlogic,t7-dwmac
> >>>>      required:
> >>>>        - compatible
> >>>>
> >>>> @@ -57,6 +58,59 @@ allOf:
> >>>>                - const: clkin1
> >>>>                - const: timing-adjustment
> >>>>
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            const: amlogic,t7-dwmac
> >>>> +    then:
> >>>> +      properties:
> >>>> +        clocks:
> >>>> +          items:
> >>>> +            - description: GMAC main clock
> >>>> +            - description: First parent clock of the internal mux
> >>>> +            - description: Second parent clock of the internal mux
> >>>> +            - description:
> >>>> +                clock of the pipeline stage inserted in the bus pat=
h between
> >>>> +                the controller and the DRAM. Without it, the contro=
ller cannot
> >>>> +                complete DMA transfers.
> >>>> +            - description:
> >>>> +                clock of the register block holding PRG_ETH0 and PR=
G_ETH1.
> >>>> +                Without it, the block reads as zero and ignores wri=
tes.
> >>>
> >>> This sounds like you take clock from other block. That's wrong, that
> >>> device should take its own clock.
> >>
> >> I see that the clock in the dts patch corresponds to <&clkc_periphs
> >> CLKID_SYS_ETHPHY>. This clock provides the working clock for the APB B=
us
> >> of the ETH PHY controller, and this clock will affect the register
> >> reading and writing of the ETH PHY (including the ETH_PLL). See sectio=
n
> >> 15.3.4.2 RegisterDescription in A311D2 Datasheet for details.
> >
> > Thanks. That section is the PHY block at 0xfe028000, the region of the
> > mdio multiplexer node. The registers in this description are PRG_ETH0
> > and PRG_ETH1 in eth_top at 0xfe024000. On the VIM4 the same gate feeds
> > them too: with it off they read as zero and ignore writes. My datasheet
> > revisions do not say which clock feeds eth_top. Can you confirm it is
> > this one?
>
> The information I can confirm is:
>    - The base address of eth_phy is 0xfe028000, and its corresponding
> APB clock is <&clkc_periphs CLKID_SYS_ETHPHY>.
>    - The base address of eth_top is 0xfe024000, and the base address of
> eth_mac is 0xfdc00000; their corresponding APB clock is <&clkc_periphs
> CLKID_SYS_ETH>.

That is not what the VIM4 does. The stmmac core enables
CLKID_SYS_ETH before any glue code runs. With that clock on and
CLKID_SYS_ETHPHY off, PRG_ETH0 and PRG_ETH1 read as zero and the
driver's writes are lost: U-Boot's 0xa0000 was still in PRG_ETH1
after the driver had written 0. Enabling CLKID_SYS_ETHPHY right
before the write makes it land. That was the v3 bug, every frame a
CRC error. I repeated it today on the running kernel, toggling only
bit 4 of CLKCTRL_SYS_CLK_EN0_REG0 from user space, every other gate
left on:

  both gates on        EN0=3Dffffffff EN1=3Dffffffff PRG_ETH0=3D00001601
  ethphy off, eth on   EN0=3Dffffffef EN1=3Dffffffff PRG_ETH0=3D00000000
  ethphy restored      EN0=3Dffffffff EN1=3Dffffffff PRG_ETH0=3D00001601

So on this chip CLKID_SYS_ETH alone does not give access to eth_top.
Could the register interface of eth_top sit behind the eth_phy APB
slave? Either way the MAC node has to enable CLKID_SYS_ETHPHY, and
the binding will describe it as the clock of the glue registers.

>
> The CPU reads and writes the registers of these peripheral controllers
> (or Processing Units) via the APB. Consequently, the registers of these
> controllers cannot be read and written properly if the corresponding APB
> clock (sys_clk/clk81) is not enabled.
>
> >
> > Thanks,
> > Lucas
> >
> >>
> >>>
> >>>
> >>>> +
> >>>> +        clock-names:
> >>>> +          items:
> >>>> +            - const: stmmaceth
> >>>> +            - const: clkin0
> >>>> +            - const: clkin1
> >>>> +            - const: pipeline
> >>>> +            - const: pclk
> >>>> +
> >>>> +        # The PHY adds the 2ns RGMII delays, see ethernet-controlle=
r.yaml.
> >>>> +        # The RX delay line of this glue is fine tuning in 200ps st=
eps,
> >>>> +        # added on top of what phy-mode describes. The TX side has =
no fine
> >>>> +        # tuning: its only step is a quarter of the clock period, t=
he full
> >>>> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> >>>> +        tx-internal-delay-ps: false
> >>>> +
> >>>> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> >>>> +        # properties instead.
> >>>> +        amlogic,tx-delay-ns: false
> >>>> +        amlogic,rx-delay-ns: false
> >>>> +
> >>>> +  # Delay definitions for Meson8b and newer
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            enum:
> >>>> +              - amlogic,meson8b-dwmac
> >>>> +              - amlogic,meson8m2-dwmac
> >>>> +              - amlogic,meson-gxbb-dwmac
> >>>> +              - amlogic,meson-axg-dwmac
> >>>> +              - amlogic,meson-g12a-dwmac
> >>>> +    then:
> >>>> +      properties:
> >>>>            amlogic,tx-delay-ns:
> >>>>              enum: [0, 2, 4, 6]
> >>>>              default: 2
> >>>> @@ -106,6 +160,7 @@ allOf:
> >>>>              contains:
> >>>>                enum:
> >>>>                  - amlogic,meson-g12a-dwmac
> >>>> +              - amlogic,t7-dwmac
> >>>>        then:
> >>>>          properties:
> >>>>            rx-internal-delay-ps:
> >>>> @@ -142,6 +197,10 @@ properties:
> >>>>          - items:
> >>>>              - const: amlogic,meson6-dwmac
> >>>>              - const: snps,dwmac
> >>>> +      - items:
> >>>> +          - const: amlogic,t7-dwmac
> >>>> +          - const: snps,dwmac-5.10a
> >>>> +          - const: snps,dwmac
> >>>
> >>> I see no such hunk in the code, so not sure how to review this.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>>
> >>> _______________________________________________
> >>> linux-amlogic mailing list
> >>> linux-amlogic@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> >>
> >> --
> >> Best regards,
> >> Chuan
> >>
>
> --
> Best regards,
> Chuan
>
Thanks,
Lucas
