Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794761022;
	b=qr4CWFH9kHHNVmhxBHpjgyEmvqegBROv9IQYQBuZJ9gyLZJ2Phzhf+/s5wNl+UHPoPys
	 UNVu3jyyB5MoyxCXDRAb+6zGrfdvsQjJNa2EnN0cBQCVdGS3W96nve6aM9VmMVN+L9mI3
	 JDaIDGHVyRmcrmQreWaaJAJgptMPmED2MwQ2EyphNI9vRsWsIsjDguTNolV1t9JOvUzp5
	 ZUMQPJFZiqp+FN/XK8s5FQUMnoaAWE5qliAycVv9ynjcA6ZHGqSYxnp/wuQtxLcR9H9xD
	 rvJ7D8fRtWBSfHuwa71wOOMI7k/L7AKCtgHQaTVtES7SdlAIojBG71pNF7p1iKHC0Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794761022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
	b=PxeMv+QD8+Do7WRllhAq0YuOfBIpB7G4MTZBQ0Ls4ftoKOk/G2GISE6hrsd5Jb/qBghS
	 vtDUmzduDMee3EzGbocghP06nz0IDJkab+cG09bYwEaJBN+cNM8/dICZDq3A4B6xAbg+y
	 kROe7Ha2eHV3rAloANL57rvrXfaSEJi0ZCM82TEnlMfee2HZc6VwNHjiEocYpRjsE7QLF
	 wszrl64KDwvOr829e0DLjnwbSbXZ6pAwMTXs5BqhOpMZTCeD6kxwWiCxKQvu+r8M7y//B
	 EbMc9nNYRYD++vqTBJpl81dN0SydDGHpuTWHFlrTVlYxFwy/yoqbvje5qjXmuhKmNTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="idvliN+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1708B606A335
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 16:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1708B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=idvliN+/
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55c7445cf85so193511cf.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794761020; cv=none;
        d=google.com; s=arc-20260327;
        b=c1e07lW6PUOmXHnv+IxuZrPyNOnen+C3CXoLeCQgZR1t3+IKoWEtQXh+YqtdIhgHus
         8DRdlIkcah4+ARQ3C5SlLy1hfxoODgGSiw1Lbzq2zxPutoKMyxIgnyeJEvMfX51vT26C
         JrsdBZH3YiXqFvsgHV1VCq7B7OAbJ7WS3HwsPSLEeiIkrqNJNUY+6JuZ5wKlO9pG8n9m
         Vvp9czTOnFirEQBcxsOclsHIVZ8RQUKuse/4zAYNrl+SBeAMJEkRYzXfoQNAyQ8VFUda
         xohtvEtVitFZoboqa3ScET/4ltkuXUp8t3THb/ZTlj2gFRKbSWwaiB5OaYrqSm4YyNSD
         jg7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        fh=GGU3M7KecvSwXDkkoHHp0a0xMIauEflA7XkqU3KCl5A=;
        b=EK1xXphDS+M+SXu4h4TjjXXGn91yn7ged5lqVlPn+9rX8UGMMu1d75NRMRxrpPbcxb
         3SQbRigfS8fNOCmP8lA9/yjTRPzRw7CphJFiyhBWcXWZIGhx6EIir9j/nscVYdozfOvL
         WgCR4YYDh5YTALysQ0be2hVkNLejk4oXzlKNSt+I2nqEHOzGtkwMIZJ3EDfGYNkWg0Ue
         ot4OhjIV7UFjEy4km3KibP1eQfahLcsQGcylJ5glNFsv0eLZ0RviubFSIkyi+D8yndnK
         pLWRQdELhHISvvQ2LlcS1ZnyvwRnSMkwx7kGbPVDWv3DJgs6yoSMuUzRT7Ub0p1rqBFT
         Xaaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794761020; x=1795365820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        b=idvliN+/PvmGbeRJsCPli1Y9URCCgOOt9Ys2ZYavWyaS8DgBzjigXYCUKC/iU4AwoU
         VHSr0FwbkvTot8fmdnuI4y1H/mDr3+QNzbM22P+7zzGQNrT+r1T/YNigZqjAJKzwfhnL
         7Y2COlvvnNIad1SDllueZd+28NZ0YGALgfWG/SFZc4XR8SvW2BDFVWeZmqDv6KDQQETA
         ZWzXpm+TXsrfPJ4Rkn+dasO0s52PSVE1x48tBGN4EGkcG3KPe8x7Y89CAADLWUV8s8t+
         6WqxiSd9AlZOonnHp4S8SbOuYlXSHfP7iVPclHzhFAYSCu9m1DyQK6lpmtoqAdSD71d2
         lDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794761020; x=1795365820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        b=wi+3eopqSvCE6wwPOrpY0itFNN+krIo5NplfrbzmKBNlu2wMfRLAyAmcUhnqYu65Ud
         FAeaInPZseboliTglgkJIHQjFycGAA1n2YHO0XvB7UMTB/0SIEBPpmWf4Y8YHIS3mpTe
         k9VABwk5wC+YgIbKg55Xun0Fr+/trKaLtnfeTqx+sgfCC0JVkXqmgdTzdAvx6kbpjT4G
         nPhWAxamKwK9xxfwGC2cOMIpj1bp3PxeUwqJZIDc7LCUJl01eYkd+wrqHzdMmRldLin8
         QHilfFL5CBv1N0Tx8PR6sYJELez8A9HuDId0ysEeXsSeDt1Fz9eKk3ESG/D4u9nBnjHC
         OvkQ==
X-Forwarded-Encrypted: i=1; AL+hErG71cAZD/mZPY3xNVxQmeNt0VdS7OwswhGJyLpZDw6isrVdIpKtO72d1uuptwISVveBhzGkfKpRbTQO@vger.kernel.org
X-Gm-Message-State: APuU4Z9lVXzM7BPWaZvcONJVUESunc+urRmAsi8hWiLsVdy6Zyvgko1j
	D+J8LDqkpzrg8thHid+CGYUto/LnmL+SyUyRFP3RTn6t3CyaJ+iPtZCD67WPT84yqQWQSApTaHe
	yawuyvsM2BR6473xqQZyuL66AdmU8x0n6Kr3HwSQO
X-Gm-Gg: AYBFou0QsBohpCLdA2AQCQeInYli3FSXUmsdPNWLXwzAMXUGU2nwp7HsXfyStC0BBiY
	D81kUl76qKP13a7N0nqbpIX94rIH3aMBT2bAQJW8F7PJHW6uPlROC2K1zVdLf+ATc4bCsOkFt0Q
	Vttxz92UCL9g1heXQylj5s5ia7X3aLJP3eHCRfK+TaMeqdHDLbHVo6EOWYjTXZWYuotIbXL1L0S
	+v5uJTeJv4CsoLIxU8/VQamhzO4obdGGNW6OBwiTdW1bzmuD4QQLXDpkHzCU0aIfxjDmxAzb9Dd
	38gb30xVx3wxbqdFEYiem52Xt3cO/RFMdW/dfi234K01NTHPuc3Hy9jHcQGTOdO9GIUBEbqg1f/
	bikAxsoiwi4Tvu8HHRLIFv/gEf9Teovku/o2JPLZLnU9huiZzaXd5sqr2i6bXY0Hg+fJ17IonKL
	ako0uhb8A6O2Sl05V0j8CZGo9L
X-Received: by 2002:a05:622a:230f:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55c67104981mr23175511cf.9.1794761019198; Sun, 15 Nov 2026
 08:43:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-3-vamshigajjela@google.com> <20261103-handiwork-replace-25efd6b3d8be@spud>
In-Reply-To: <20261103-handiwork-replace-25efd6b3d8be@spud>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:13:27 +0530
X-Gm-Features: AclHuK8MvtFT0aS_Uz-6An9GgpSrSIomZQrTNYNRlPO6FZypoZaZtmFLqNrb5IA
Message-ID: <CAMTSyjrYSzb57w9G6a+JVaZzRHBBV6zaW_Br_UcM7C5REWLgVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:47=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Nov 03, 2026 at 09:56:06AM +0530, vamshi gajjela wrote:
> > From: Vamshi Gajjela <vamshigajjela@google.com>
> >
> > Document the device tree bindings for the SmartDV IP Solutions MIPI SPM=
I
> > master controller ("smartdv,spmi").
> >
> > This controller IP is integrated in Google Tensor SoCs starting with th=
e
> > G5 generation (codename: laguna, canonically written as "lga"), so add
> > "google,lga-spmi" with a fallback to "smartdv,spmi".
> >
> > Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> > ---
> >  .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 132 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b=
/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > new file mode 100644
> > index 000000000000..e0512e60d932
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SmartDV IP Solutions SPMI Controller
> > +
> > +maintainers:
> > +  - Vamshi Gajjela <vamshigajjela@google.com>
> > +
> > +description:
> > +  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) m=
aster
> > +  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
> > +
> > +allOf:
> > +  - $ref: spmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: google,lga-spmi
>
> > +          - const: smartdv,spmi
> > +      - const: smartdv,spmi
>
> I hate compatibles for purchasable IP like this, particularly when
> unversioned as they maybe become effectively useless when a new revision
> releases. The standalone smartdv,spmi compatible has to go at least,
> soc-specific compatibles are mandatory.

Agreed. In v2 I will drop "smartdv,spmi" (both standalone and as a
fallback) and use only the SoC-specific "google,lga-spmi" compatible,
renaming the binding to google,lga-spmi.yaml and dropping patch 1/3.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      Core clock to the controller from which SPMI SCL is derived. Opt=
ional if
> > +      the controller uses a free-running clock and clock-frequency is =
specified.
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description:
> > +      Input core clock frequency in Hz when the controller uses a free=
-running
> > +      clock not described in clocks.
> > +
> > +  smartdv,master-arb-enable:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      Enable master bus arbitration phase (0 =3D disable, 1 =3D enable=
).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?

These parameters do not vary between boards on LGA (this applies
to all smartdv,* properties below). In v2 I will drop all
of them from the binding and move the LGA controller configuration into
of_device_id match data in the driver keyed off "google,lga-spmi"

>
> > +
> > +  smartdv,master-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Master ID for the controller on the SPMI bus.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,spmi-version:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      MIPI SPMI specification version used for transfers (0 for MIPI S=
PMI v1.0,
> > +      1 for MIPI SPMI v2.0).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,arb-retry-limit:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 32
> > +    description:
> > +      Maximum number of times the master retries a command when losing=
 bus
> > +      arbitration.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,prescaler:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 0
> > +    description:
> > +      Clock divider value to generate SPMI SCL from the input core clo=
ck. Writing
> > +      1 divides the system clock by 2; more generally, a non-zero valu=
e n
> > +      divides the system clock by 2 * n.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,read-latency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 32
> > +    description:
> > +      Number of SPMI SCL clock cycles to pause during bus turnaround o=
n read
> > +      commands to allow the target device to fetch data.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,arb-scl-delay:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Delay between arbitration and Sequence Start Condition (SSC) whe=
n the
> > +      controller is the Bus Owner Master (BOM).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> I find it hard to believe that this is the set of required properties.

Agreed. In v2 I will make clocks and resets required alongside compatible
and reg, and drop the remaining optional properties.

Thanks,
Vamshi Gajjela
