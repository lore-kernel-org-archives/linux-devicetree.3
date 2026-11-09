Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239427;
	b=EHIFIRHOZlWampVdEbp8UEXJ1/fiRr/u9JZqkzgPa/w0rBSlqup2abZA0eLvtrT/aCeD
	 oJZ9xC0xXoLPqKXIaitSO2Vgb/pElj4dntbKArgx/PWeaxOvXmBsQdP3X/rV3OrepJ6Hn
	 bjjQ3DBIc9SQVkFqlrxVz5P5rt24Qm2Bp0fECKJajmGT4YqDUfyh6tIZOsT36ObPmjRJx
	 gVXm+U0+VrnKurX0v3qn/Y5cprQkkchoX/+fQg/k5pVLFyBEnFERNAyjt6HJRQj/UJVoO
	 0A4ilgG4kMzCgNbdMcCffCeWLsu3SxY5fzsPxmG2GNvc9UvLzSY+XC0bJjB44ZMKILQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239427;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xG4pMlSywf90fG++ZmuGwd6o+rUWkZppXqxcs9JhM2Y=;
	b=pm5MpAn8nH3/G30BAgGFN+YYsWYdHB0LjOPJQmgUL6n3oqh2ewKQXRZF2wLM8Jl4zxZR
	 fFf1lJw931nQcRIbMjuo0PWDaUxIRC0u7Nuz781+ZdBOqzEXl9ksiuk4MgmR3cHVSLBF5
	 CRI5qsPN6BgolliuoNUkmuBevTxw9jHj/PSoyv9Yj8nGYXdatYKQQJS4o9SAzJ0RPB1S1
	 0wb99hb8/IRuoFjHv5YCJRI6zu7md0J71P/HKPExgHcR6tATsH1F9GHDN2FXdasUUIUHm
	 B47NyrZLl9brEOWamglIewGfO2Oe+ui7qup7EtC1N+k3LkndgXTCaY7ju6oCMR5HnuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2766606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2766606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2e14babc8so573224137.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239426; x=1794844226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG4pMlSywf90fG++ZmuGwd6o+rUWkZppXqxcs9JhM2Y=;
        b=O94MCrmZKXRQ1gA1KUGvReAVunTfW3ymKGsPKanaPbQZ6LUliHa+eP4LMyBK6pB7AL
         e1sUVeJg3rM/SCSt/PWTiD8Ps34pgrmwLFnXzPdpfoeYVYkNrz4wlh7OCw56HMdzX1yN
         a+qYofc8sLcMreYZhK2fi9Eq9nt4HnsqKdFxtqo715gW52exYg9GdBD5sD2Gw6N6XAZY
         kd7L5HQLJdKiJLWxYS0V8bTdpALSiv8kOqUNrq1cvGgXTc53rOS2gk26+DnrsuGnP0e4
         izt3S7iovwF1JFE9moZ+CG+EeqkbI49pxmGyiTr5Cy7jALCIVaqNyQ4VDtzc0iDyn6dl
         oJzQ==
X-Forwarded-Encrypted: i=1; AL+hErGgzI9j815swLcKtcfYpDW0ZKw9GvYebOtSZ6aYigrDBvluWDp0lG7SWng7EtoxJuGZW0yPQe32MF+K@vger.kernel.org
X-Gm-Message-State: APuU4Z/JXowbet3Jf7RzVvw0aVppfPvr4dJE2k9ROUlyWbNeMgQcb8hK
	c48ypJT/GdhOTOHAi1fZkhkmn9XCHvnLASEEsvI8m0STm2dcnCuIkjyr8eSK8cBFCG5zWQ==
X-Gm-Gg: AYBFou3BDipwGQtEv1S2OafBsN6IORr0bCq8eWejCsaUluQh4IjPZV7YRyjrbATpBMe
	VZIgVQYZEWKMxtcLx+JNI7L+fbzlI/0lfTQMj8gp1Miu4puVqc6jt3iNXSt37d6/d1N6zJwJ53W
	+V27MaxC0UOCBhRK3QTbaRiaAIpgNMGcKe3cf+v0j6mGiOpGNRDxdCRwuc02jR8RpkkoK3od2su
	+oztRDLMh9rekdalmN1NLHtefIQI1zAv3TY+zZlZW0fMpFswo7viwPEu/p8wZgVkbj4hBjvm25s
	j6Rhjyl874uPaW0b9wfEFtZ/dly/VJntm3cFlDkdoNI6iJ3IEKab420hiTPfsNcEnWjOzExb4zo
	ACmXqh7/clfFB/6KNBcYXkv3Hiu0NNwFAcDxQgOnt4ZTh8jYrVB4czK3f/yLgU2+r5klJ4Lybl9
	QmMDmdw4MLwPvoxW7UuwL6Il8QbkaIJZ1JUgWI4nLoJcpnbPsFvOkUOX+uxX8yaM8Dsw32EKuWC
	hVyKgwV10dCFoVAv/UkDS1wvaiKWDzeB49xmTeE7f67tww9tdBs6V60ACZZkhF7hP0eP52v48gX
	44PwTHfVRbDS/2W61FpOtYcgMdHq4nIOJqsVPDLsDO+heQc0ZYfT7AtZlUQimKDDHi7MMWjuC9R
	riY4WnsDKVOaCvt1aqacs2n1TYxQRVore4I1uVK2xIKv4gAgukqyY7Ii0NgCurjiocw+AX15EJQ
	QQ/A==
X-Received: by 2002:a05:6102:418a:b0:7d2:7827:c03 with SMTP id ada2fe7eead31-7d2db227350mr1350852137.25.1794239425355;
        Mon, 09 Nov 2026 07:50:25 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2db57903esm4397018137.3.2026.11.09.07.50.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:50:25 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eadef147ffso707107e0c.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:50:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4LWm4FZjFS5w+uJ/BNNyzGj+98rEiLf2eQSiXPrNhppxSkL/YvNd+uCPTPJ2nsJAeiqeCNUuj5L6T@vger.kernel.org
X-Received: by 2002:a05:690c:c4e6:b0:8ae:8d28:77be with SMTP id
 00721157ae682-8b36c8542c6mr28200577b3.1.1794238943160; Mon, 09 Nov 2026
 07:42:23 -0800 (PST)
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
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
In-Reply-To: <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 9 Nov 2026 15:42:11 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1OMHo_VWD2+0RUfF6EUNbLLNZafDuHxCBzU_qALBa2hQ@mail.gmail.com>
X-Gm-Features: AclHuK81wJVzU4rFeRI7sUHF0-2FEAkn5jMEtF1UQ-EscSMzMfyyODCM_UAkaVg
Message-ID: <CAJX_Q+1OMHo_VWD2+0RUfF6EUNbLLNZafDuHxCBzU_qALBa2hQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
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

On Thu, Nov 5, 2026 at 11:57=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> >
> > Assisted-by: LLM
>
> Drop this one.
>
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index e769c9bb70d8..6de013e3e8f6 100644
> > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > @@ -23,6 +23,7 @@ select:
> >            - amlogic,meson-gxbb-dwmac
> >            - amlogic,meson-axg-dwmac
> >            - amlogic,meson-g12a-dwmac
> > +          - amlogic,t7-dwmac
> >    required:
> >      - compatible
> >
> > @@ -57,6 +58,59 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,t7-dwmac
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GMAC main clock
> > +            - description: First parent clock of the internal mux
> > +            - description: Second parent clock of the internal mux
> > +            - description:
> > +                clock of the pipeline stage inserted in the bus path b=
etween
> > +                the controller and the DRAM. Without it, the controlle=
r cannot
> > +                complete DMA transfers.
> > +            - description:
> > +                clock of the register block holding PRG_ETH0 and PRG_E=
TH1.
> > +                Without it, the block reads as zero and ignores writes=
.
>
> This sounds like you take clock from other block. That's wrong, that
> device should take its own clock.

It is this device's clock, the description is misleading. PRG_ETH0 and
PRG_ETH1 are the glue registers of this controller, the second reg
entry of the node. The gate is named after the PHY block at
0xfe028000, which the mdio multiplexer node lists too, but it also
feeds these registers: with it off they read as zero and ignore
writes, and no other gate brings them back. The stmmac core enables
"pclk" before touching them. v7 will say:

            - description:
                APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
                Without it, they read as zero and ignore writes.

Thanks,
Lucas

>
>
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +            - const: pclk
> > +
> > +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.y=
aml.
> > +        # The RX delay line of this glue is fine tuning in 200ps steps=
,
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> > +        tx-internal-delay-ps: false
> > +
> > +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> > +        # properties instead.
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
> > +
> > +  # Delay definitions for Meson8b and newer
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson8m2-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +160,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -142,6 +197,10 @@ properties:
> >        - items:
> >            - const: amlogic,meson6-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
>
> I see no such hunk in the code, so not sure how to review this.
>
> Best regards,
> Krzysztof
>
