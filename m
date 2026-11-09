Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239007;
	b=AnY/2Uvv4oOkTt4wr/oRmVtz5KzTNQwahu2qcDyqD1ExobgLa2eXUA9tX3xVvqQNex+m
	 JmH8OLMr+zYj29JrWXNhaGgCx4doBKMU6cJE6i5pIOPuVTD//h7XZq+6VLAqZqcnBb8o2
	 CvszlP3+Mxbq0e2rd7Mf5fs2Yta9iSURhkkJAbnFRw1hvo0KV0nrPRJI7s36DdLVIXU/3
	 Ovo9ULNgMS1ppAp1La/C3LqSGJOfOD8HvLbPmUWQ8KnXuHrDXDBqSCkZgiAw2XQF7nR8R
	 mHbXH/nT2uI8KzqgJfQPdLlJAlRRp6tyfWqSWmlNXkLd9QIJjB4doeATW1Fhc8OfszA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239007;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mQ4LVrS7TAycIWuwYP6nLPokX8EbBu04NF8VpAWRnUc=;
	b=Z+9nGm7rPWrWTwEji+ij8KlHhL7iH8JS7sX2eTcuII3hqDDT9eNF21pNIuiAEDqY3HmQ
	 s0D0xg3AKciy3KWNPY1B+I+UddOCvW3mluTfYe0ydFCLX2WoSn+rEtAFaewcf0sR+GcW0
	 h4zD7M/oboCk7pBowngGuixlr9Njy4E86ItevBAgwnyTWmx7h+gVxcjJx5Xu10mAlADSe
	 77PUi6BpAAsCizchK0v7vkxtw+KtFmGqWHkL7WGMZKpmNtFyt5vYe0gPMppw2AH7/GRkO
	 BXXCguUpF98LgQ1WyExLVvAqj+yZGrENhKuLBNTrhuPDKQqwF7hznJAqfqnSqs8MERw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECD8606A331
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECD8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b354d27917so7771297b3.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239006; x=1794843806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ4LVrS7TAycIWuwYP6nLPokX8EbBu04NF8VpAWRnUc=;
        b=0paZv8TP5yy4jbdZI69lRBio6UJWWS9J63b8LOvjVjrCSQQDmnWamoyV0jr6WHDuim
         XI+JCEOcRhgK8GOPms7k0BuyWUs47iNHrLavjcH9hk5IqiB5j11Oy1vd9cgIwhKeS3rt
         k2cMcjU9bM8oHfXi92J3XCnGDuMbpaLKB4h0k4ptZOUN0IDcaPvgil0JO3fN2qouJ+OJ
         PUvTj2I3Gs2sISURzePYs9bxjf70/Wdhl4Y3YfFR7CUEbPjrLPv6IgN0GWckuBrVRA7y
         GkbT5i6VgybeWA7EnAIQNKMFCS1Pjoxe4+C4Qfn0TQOKHJ9m8Iull8NvKEAcAadBSNdJ
         ZVuA==
X-Forwarded-Encrypted: i=1; AL+hErExjqNWn15aXuecyljC6fIRFaEZafSpaWR9NzGVm0xzyaczY6Jxfq2ilgl8K2OmW5rnbo8OuQZprJLR@vger.kernel.org
X-Gm-Message-State: APuU4Z9eh4TWGgd7q6BfJr2yn6/S3G67qZvkBWuIG57OHDhrDL6rbO+6
	RafRBRoBdJHwKDLE/j3knyzYF/hR/0X4YfV45Zb0YhYs6+oSfsU26MXbMrY6l1nRHdc=
X-Gm-Gg: AYBFou1p7CsTRQP/a+5mytzoDNUtRRLgsvV6uKEXV9OvUdJp5fd3LBQATCjDu2wtQxG
	H659cM1PKHpgyocvK4802dOp9lFAgjRE4KwCMBUIImHI3FyxrUHb5Q9JXX56uCwhDr5qnHaQ6yN
	hRXF9G4mwc1W8G9pCTQBIj4wwIHuhR3294/8/DX5EMBhMdWNbeignA54L7RRZGEkVvY4PXrOTpD
	+UGiit0z4ufhPNyOteMa2DAi1LHcXmveWEjCPrDNx+Cme6mZ4P7PugeaciUJcerpPpPgJdSpJqq
	8p8ECAwslxJ2TE4hrhc+TPT18lSWJ+vowCgJSQKfc1C/xRzq3rJVnOVAL6XeoXYATc2XyTGpHaf
	sSTVbnWlxq7p4NiQV30PArbavCKTOON5uHivhV9/fHpoAFzVcg26Mv6LGnjEUAGfl9i39Xj2okx
	D3xrJ3BIf86dP6K3QhbayonvuCOKUWkcg73GCvJaptBYZSCAZWa+ty64EqYT6dm26J4F3Nz2Y9N
	BFIFGmV6+19uVDeqCxfpcxBy0QGI6bN/YbdIlAGyvbRIdQCNBXVQDHGq/DCNBdy6CRe47H9RKvB
	5Eq7cgCA4D+eQXH7MkEcgqYyuHAppvZrETc2laazW1vd7vmYhOedGnBTS2hytZ/MvyjewYO13eF
	kOsjJ2UWq2l+pBJKIXyrPB34kC8zmEdWA7P+gbzgR4wwsH6aFU9QG088C
X-Received: by 2002:a05:690c:6e85:b0:88c:b863:e405 with SMTP id 00721157ae682-8b36ca659f3mr27858127b3.38.1794239005854;
        Mon, 09 Nov 2026 07:43:25 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc3ff7fsm37995077b3.31.2026.11.09.07.43.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:43:25 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b305d38bafso7076397b3.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF6TT9BolCPEU+iflr9Im6KosklvPTS6oXftxDItQHl5Pbu677Hjf3pxY+7Rutjmq8ahsGpJAbNo8i0@vger.kernel.org
X-Received: by 2002:a05:690c:e3ce:b0:8b3:56f0:38d1 with SMTP id
 00721157ae682-8b36c854704mr28695777b3.3.1794239004423; Mon, 09 Nov 2026
 07:43:24 -0800 (PST)
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
In-Reply-To: <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 9 Nov 2026 15:43:13 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
X-Gm-Features: AclHuK8i80yCCEWCPsmXh9g28kddZ8mRpDlp24I5tNty5i0jlojD6mTpEXhkklk
Message-ID: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
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

On Fri, Nov 6, 2026 at 3:16=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> wr=
ote:
>
> Hi Krzysztof, Lucas,
>
> On 11/5/2026 7:57 PM, Krzysztof Kozlowski wrote:
> > [ EXTERNAL EMAIL ]
> >
> > On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> >>
> >> Assisted-by: LLM
> >
> > Drop this one.
> >
> >> Signed-off-by: Lucas Tanure <tanure@linux.com>
> >> ---
> >>   .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++=
++
> >>   1 file changed, 59 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac=
.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> index e769c9bb70d8..6de013e3e8f6 100644
> >> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> @@ -23,6 +23,7 @@ select:
> >>             - amlogic,meson-gxbb-dwmac
> >>             - amlogic,meson-axg-dwmac
> >>             - amlogic,meson-g12a-dwmac
> >> +          - amlogic,t7-dwmac
> >>     required:
> >>       - compatible
> >>
> >> @@ -57,6 +58,59 @@ allOf:
> >>               - const: clkin1
> >>               - const: timing-adjustment
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: amlogic,t7-dwmac
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: GMAC main clock
> >> +            - description: First parent clock of the internal mux
> >> +            - description: Second parent clock of the internal mux
> >> +            - description:
> >> +                clock of the pipeline stage inserted in the bus path =
between
> >> +                the controller and the DRAM. Without it, the controll=
er cannot
> >> +                complete DMA transfers.
> >> +            - description:
> >> +                clock of the register block holding PRG_ETH0 and PRG_=
ETH1.
> >> +                Without it, the block reads as zero and ignores write=
s.
> >
> > This sounds like you take clock from other block. That's wrong, that
> > device should take its own clock.
>
> I see that the clock in the dts patch corresponds to <&clkc_periphs
> CLKID_SYS_ETHPHY>. This clock provides the working clock for the APB Bus
> of the ETH PHY controller, and this clock will affect the register
> reading and writing of the ETH PHY (including the ETH_PLL). See section
> 15.3.4.2 RegisterDescription in A311D2 Datasheet for details.

Thanks. That section is the PHY block at 0xfe028000, the region of the
mdio multiplexer node. The registers in this description are PRG_ETH0
and PRG_ETH1 in eth_top at 0xfe024000. On the VIM4 the same gate feeds
them too: with it off they read as zero and ignore writes. My datasheet
revisions do not say which clock feeds eth_top. Can you confirm it is
this one?

Thanks,
Lucas

>
> >
> >
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: stmmaceth
> >> +            - const: clkin0
> >> +            - const: clkin1
> >> +            - const: pipeline
> >> +            - const: pclk
> >> +
> >> +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.=
yaml.
> >> +        # The RX delay line of this glue is fine tuning in 200ps step=
s,
> >> +        # added on top of what phy-mode describes. The TX side has no=
 fine
> >> +        # tuning: its only step is a quarter of the clock period, the=
 full
> >> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> >> +        tx-internal-delay-ps: false
> >> +
> >> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> >> +        # properties instead.
> >> +        amlogic,tx-delay-ns: false
> >> +        amlogic,rx-delay-ns: false
> >> +
> >> +  # Delay definitions for Meson8b and newer
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - amlogic,meson8b-dwmac
> >> +              - amlogic,meson8m2-dwmac
> >> +              - amlogic,meson-gxbb-dwmac
> >> +              - amlogic,meson-axg-dwmac
> >> +              - amlogic,meson-g12a-dwmac
> >> +    then:
> >> +      properties:
> >>           amlogic,tx-delay-ns:
> >>             enum: [0, 2, 4, 6]
> >>             default: 2
> >> @@ -106,6 +160,7 @@ allOf:
> >>             contains:
> >>               enum:
> >>                 - amlogic,meson-g12a-dwmac
> >> +              - amlogic,t7-dwmac
> >>       then:
> >>         properties:
> >>           rx-internal-delay-ps:
> >> @@ -142,6 +197,10 @@ properties:
> >>         - items:
> >>             - const: amlogic,meson6-dwmac
> >>             - const: snps,dwmac
> >> +      - items:
> >> +          - const: amlogic,t7-dwmac
> >> +          - const: snps,dwmac-5.10a
> >> +          - const: snps,dwmac
> >
> > I see no such hunk in the code, so not sure how to review this.
> >
> > Best regards,
> > Krzysztof
> >
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>
> --
> Best regards,
> Chuan
>
