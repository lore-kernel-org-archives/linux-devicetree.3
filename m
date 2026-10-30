Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793403238;
	b=l89jHDkhir8Ws7NpEaJvRTnMxKKwpDtIXkCXT3b/3GylSICz0skjTCbgPWcDCCOpCCqf
	 dLLtTN6IX93iqGVJ3m8aKbZZUX0j9PZ7yT3X5d46WIDNBI1b+MvkgNEKWNdS0pAna0gcC
	 1DjnZmqJ1ZV+Z2quwMcJkVoMWjUwH/CfXJBxfvJosx2SjU3GgsXp8v1D3iHW/L7cAt4nF
	 A17DnfFhXeXm3LBxua6T2g2qayNtaYF+5hgqs9gAiyd+Hn7DFRdx0nzhoNyCWebCscYFb
	 G9tL22AwuzHIRN3fWPGCFsf/dGDdKuQyCuWhGbJePJ/lKEaffwgZYg5Wu5MYX3vs4fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793403238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uYpqsAQ9OY9DsYZMcCG2ZubulWPZAxVNHKqjmPqUy7A=;
	b=NL6mxagjsUlMbqVU7Py3jHW0LM723iWFkQy10A5FI9SjeHWmGJw+OOJazq3RqIwY0JlT
	 k5mfvK3AS2wAUvoq6Z0FHfXOZXZs90Zp998TzN4C4kdYdd9jl5HM39QcI/DJCe1nitw2I
	 8sj8+/vBI+Hf3MlzNxCBq1B1d5lzEY1UTsZiEpQTweowc1kFgkAcoJOmzufOAdWp8blg0
	 0UgnM469mpMwPLNXjk9c0EIpqeErUZtg0yqlMcv5dcqbytTHMvas75tAiRGHSZEjac3x+
	 dIYOHPCVjsc+TywxYqElPvUkz6R9UnqSIKM1pKq6kCWuhWKZ3xyIqqVNxd4IufNcNvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LjklpEUY;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDCD606A325
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 23:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDCD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LjklpEUY
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso203896666b.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793403236; x=1794008036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYpqsAQ9OY9DsYZMcCG2ZubulWPZAxVNHKqjmPqUy7A=;
        b=LjklpEUYET/A4c0xwT0QNvbW8d4g2RS/qsOsvEMLbC2SjSeecp8Nhq6DRUMH48am5r
         J0XSst+mHEXUbTDijrSxauVCnu7J4uUA43da98/SuUSR63hXqOBt5lSPestHKz+6Kchr
         atWsKA3AdqHP3sQnEgtuY+07rXgomqcFGLqxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793403236; x=1794008036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYpqsAQ9OY9DsYZMcCG2ZubulWPZAxVNHKqjmPqUy7A=;
        b=ZpZLmxRWmIxiVreejTCTZdgj0KFdC20pllmuZUfvlCVj1m2xsPf1zOi5XoMKHt1zNT
         sdAy6uCeTi6wa5HTDP/Illc2rKarbJf94z2rg9/uAXQU7TArI1vDohg2fdtlaDNN5kCW
         fgMnH4+a/0FI8JlNt7BRLmatNddacrroDxdZT8rUIvveL6kK9uH5q6nhe6ZQSiz1NeSm
         LkNDLwxgXMrmg+CxCfida/fby1gS8NSpvo7O5FwuMyE8tIHfUQXb2/rRYIDavS3ZQJrA
         UoU2ngAY4ODYSljf9mKQ3YSJfgIlp3CVFWTZ+uCyVnLU6+bRwi0IaImxbNPp5v3i18Y6
         6vJg==
X-Forwarded-Encrypted: i=1; AKwUvBwZdV4xSA5vZR2z3U/erAQ2rIg9ZFjhhJ7WqtUq4ahP6yWQxjiBH82wqxY/xDYHy7d88Wub6ZFOaLMM@vger.kernel.org
X-Gm-Message-State: AFq9FYJp36+gmplXCp0gGc0kK0oKi4CS3FehxQCqSULMiWuZvQ5HhTGn
	YALqRhcVJxv5D+wgB/YOXdYpKX0YZCyjD66oJrd1beJ3QS7VGz6WffMCmiPy2j5LeFHaW0tvlY/
	E/avqtQ==
X-Gm-Gg: AYBFou2gXmEE9INmKwJzieI1AjYK6OM6fqdIMzgsjq2tGYphJcx8On8O/qePlZp4Irl
	My/WMLnh6iUbcLtSVAQT+P8hxdIU0TQTmkR8THY8nUKOdkP3Y6bBULT9uxbBNRxOdEyquYC1WLD
	PWKmq/5xQIzmatQK2i0EUvMAlHJ/RkHi+wtC5cmF0jiVedZfS4QTw7ccbxxLdSiVOPwX6yT0NgN
	ITIT3pzCU9x+P+9CXBE6vQJhuxUGfg8ZM2BHseF51Iixng2SPjvpwFHapSLrNQlyT+oj90C4yIQ
	4dlFQFYSf3ghvrfcNCqZaOE3Wycxe3AbEe5ds2rj/cfY89Cr/7l4LUVcF0zStxX18g+H0vLP0Tm
	33xLRzgRaMDfW1jPJ2CxHSOeqyLTv8x0IP2ANQOeWZSE9Em5iDno5P7EfE2tYv0RnuGucy/FIyg
	jOZrXJTssbttYVgX+B54ETRa22xCLw00dwq3JwSn4zXG7B37WMP4/H4BjhOcv2HhOTx0PxhllKu
	Sei912XsCKbDWdTLjGKY+T6bzVd8BFfbzlIZ2OiP8N7G7fIeicbXENtIko7gEQ28JOTp1qLk6Zj
	HGJ2o7Dw3Wieq9n5YUw3/7RTtY60IsOqpmvyTyyKNT2e/PwmmXdtTlSOc+VVYCfdQjVpwqxT6Yw
	gCBWNZ3TgeGE49g==
X-Received: by 2002:a17:906:dc8a:b0:c46:7645:861 with SMTP id a640c23a62f3a-c4ca7936230mr335271766b.7.1793403236101;
        Fri, 30 Oct 2026 16:33:56 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cb092c042sm90050766b.82.2026.10.30.16.33.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 16:33:54 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b060ec084so705686f8f.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1+hLxwWL13L7t7fFyPQLuGRV27gnPh2+BYLzPurQi2zTHsKc7jH0FYA1cky0EjQR+5i+P2dIc8BUI@vger.kernel.org
X-Received: by 2002:a05:6000:2f84:b0:48b:69d4:bb35 with SMTP id
 ffacd0b85a97d-48e6e2eb71fmr8424199f8f.12.1793403230649; Fri, 30 Oct 2026
 16:33:50 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023235408.3063350-1-dianders@chromium.org>
 <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid> <20261030-terrific-quartz-bumblebee-e36da1@quoll>
In-Reply-To: <20261030-terrific-quartz-bumblebee-e36da1@quoll>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 16:33:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2tEe53B4AmmkWTZvqvBDNN7K8Q+o+3PHoNuQnfS73sg@mail.gmail.com>
X-Gm-Features: AclHuK-AIJt-7HpT3-PstezQbN3lpub-bPABaJI-gDK7o3ghrvyRXOTdOvBTJG0
Message-ID: <CAD=FV=U2tEe53B4AmmkWTZvqvBDNN7K8Q+o+3PHoNuQnfS73sg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba
 mailbox bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Brian Norris <briannorris@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2026 at 3:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 23, 2026 at 04:52:20PM -0700, Douglas Anderson wrote:
> > +properties:
> > +  compatible:
> > +    const: google,lga-mailbox-array
> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: Host registers (not accessible to client)
> > +      - description: Global registers (not present on newer IP blocks)
>
> That's still confusing. Last time you said:
> 1. You identified 4x instances of MBA
> 2. Each of the instance has global registers (quotting: "Each of these 4
> MBA instances has its own "global" registers."), then why does the
> binding say otherwise?
>
> You repeat here again "newer IP blocks" so how many versions does your So=
C have?

In v2, I'll remove the "(not present on newer IP blocks)" part and
remove "minItems: 1". Both Pixel 10 SoC (laguna or lga) and Pixel 11
SoC (malibu) have the global registers. Newer (unreleased) SoCs lack
these (read-only) global registers and all of the information that was
in them is replicated in each mailbox's register space. There
shouldn't be any harm in making them both required for now and we can
make the change later.


> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      mailbox-array@5240000 {
> > +        compatible =3D "google,lga-mailbox-array";
> > +        reg =3D <0x0 0x05240000 0x0 0x00010000>,
> > +              <0x0 0x05250000 0x0 0x00010000>;
> > +        ranges =3D <0x0 0x0 0x05260000 0x00020000>;
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        mailbox@0 {
> > +          reg =3D <0x0000 0x1000>;
> > +          interrupts =3D <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
> > +
> > +          #mbox-cells =3D <0>;
> > +
> > +          google,tx-payload-words =3D <4>;
> > +          google,mba-queue-mode;
> > +        };
> > +
> > +        mailbox@1000 {
> > +          reg =3D <0x1000 0x1000>;
> > +          interrupts =3D <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> > +
>
> Please make the example complete. Last time you wrote:
>
> "If we tried to represent the mailbox array as a single mailbox with a
> bunch of channels, each instance would have a different number of
> "reg" entries and a different number of interrupts."
>
> and I do not see that. I see each instance having exactly one reg entry,
> exactly one interrupt with difference in RX and TX.
>
> The DTS here:
> https://lore.kernel.org/all/20261026144346.1.Iaf8214205f496225013f482f6e0=
035e89ac624f2@changeid/
>
> has the same.

OK, sounds good. I can give more examples. That being said, I'm having
a hard time finding a great example that _proves_ that this shouldn't
be a single mailbox with a bunch of channels. Specifically, although
the hardware itself is fairly flexible, the current firmware running
on the remote processors isn't taking advantage of all of this
flexibility. That being said, it is not far-fetched that this would
change as more users of this IP block emerge. This IP block is used
_heavily_ in Google designs.

Really, I think my argument for describing things this way comes more
from looking at the hardware register descriptions than from looking
at the current users. I think modeling the bindings to best match the
hardware design is the right approach. Let me see if I can give more
details here, even if they don't translate well into examples...

Let's start by looking at the CPM mailbox array. This is the mailbox
array shown in the examples. The first two mailboxes (0 and 1) in this
array allow the AP to communicate with the CPM. They are high
bandwidth and use queuing. One is for TX, and one is for RX. In
current designs, both happen to use 4-words per transfer.

What you can't see (and won't translate into examples) is that this
same mailbox array has many extra mailboxes. These extra mailboxes are
used for the CPM to communicate with other system components. From
what I see, the second two mailboxes (2 and 3) are used to communicate
to the AP's secure firmware (TF-A) and also use queuing mode. Then
mailboxes 4 and 5 communicate to the GDMC (Google Debug Monitor Core)
and _don't_ use queuing. Mailboxes 8 and 9 communicate with the AOC
(Always On Compute). There are a pile of other mailbox pairs. Though
we don't model these mailboxes in the Linux device tree (which only
looks at things from the AP perspective), the protocol used here is
very different.

Different mailboxes in the array are allocated to different processors
in the system, which is why each mailbox is fairly self-contained.
Each mailbox in the array has a 4K register space representing that
mailbox. To me, this is a primary reason why these are best
represented as full-blown mailboxes, not as "channels". Each of these
mailboxes is a self-contained unit and can be allocated independently
toward one of the processors in the system. They don't look like
"channels". The thing that ties them together into an "array" is that
all the mailboxes in the array all talk to a given "host" that owns
the mailbox array. Yes, sometimes several of these mailboxes end up
routed to the same processor in the system, but fundamentally they are
still separate mailboxes...

Yes, we could try to make these mailboxes look like "channels", but
the hardware is really designed around each mailbox in the array being
an independent/separate thing.

Does that make sense?

From a perspective of "do these each need their own node": Even if we
don't currently see an instance where multiple mailboxes are routed to
the non-secure AP and some use queueing while others don't, the
hardware supports it and we should make sure the bindings are ready
for that.

If you want, I can create a hypothetical example where some mailboxes
use queuing mode (or have a different TX word size) and others don't.
Would that make things look better?

---

To show examples of some of the other mailboxes in lga, here is the
"GDMC to AP NonSecure" one. You'll note that it starts at mailbox 2 in
the array (not mailbox 0) since mailboxes 0 and 1 in the array are
routed elsewhere.


gdmc_ap_ns_mba: mailbox-array@6240000 {
    compatible =3D "google,lga-mailbox-array";
    reg =3D <0x0 0x06240000 0x0 0x00010000>,
          <0x0 0x06250000 0x0 0x00010000>;
    ranges =3D <0x0 0x0 0x06260000 0x00020000>;

    #address-cells =3D <1>;
    #size-cells =3D <1>;

    gdmc_ap_non_secure_req_mba_client_2: mailbox@2000 {
        reg =3D <0x2000 0x1000>;
        interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
        google,rx-payload-words =3D <4>;
    };

    ...

    gdmc_ap3_req_mba_client_10: mailbox@a000 {
        reg =3D <0xa000 0x1000>;
        interrupts =3D <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
        google,rx-payload-words =3D <4>;
    };

    gdmc_ap3_resp_mba_client_11: mailbox@b000 {
        reg =3D <0xb000 0x1000>;
        interrupts =3D <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
        google,rx-payload-words =3D <4>;
    };
};

---

The "AOC to AP" mailbox for "lga" looks like this. In practice, the
software uses most of these as "doorbell only", though exactly one of
the mailboxes here actually gets data transferred over it.

aoc_ap_mba: mailbox-array@b480000 {
    compatible =3D "google,lga-mailbox-array", "google,mailbox-array";
    reg =3D <0x0 0x0b480000 0x0 0x00010000>,
          <0x0 0x0b490000 0x0 0x00010000>;
    ranges =3D <0x0 0x0 0x0b4a0000 0x00020000>;

    #address-cells =3D <1>;
    #size-cells =3D <1>;

    aoc_ap_0_mba_client_0: mailbox@0 {
        reg =3D <0x00000 0x1000>;
        interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
    };

    aoc_ap_1_mba_client_1: mailbox@1000 {
        reg =3D <0x01000 0x1000>;
        interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
    };

    ...

    aoc_ap_19_mba_client_19: mailbox@13000 {
        reg =3D <0x13000 0x1000>;
        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
        #mbox-cells =3D <0>;
    };
};
