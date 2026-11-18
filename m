Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794988019;
	b=FcS4nLfwIMnUji0maWz9iWwxO+MKxmP4baqYWo+2mk8MRrzIfYD7KZ7otCIBafEu53nV
	 xbx9NBynkdWYmUDAzpBaATpMin4Gk1AJkVXWYJx0iLLkYop7xXHO3NJdpvaCyNim8Za+H
	 I1AUaXlamMjjKhUs6qV3BwJrS4Wo0JJ/DIKNyU6MVQ7lu4QNco0NPEZ2hKUjiP6U6gE3o
	 8Bb/Id5y1F6b95qIoTpAbXnlUSxor/tLSU/aFouTa6lNBZN9J7EVI8zfoZF5Gd45OAUuf
	 AUFizadgG0ut1nu2D2HGm5iA6NdMCWoJrGggsLYSQvY0qOy/zhB+b+8vt+am65EO76g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pnx/XKeGh94aieoFZrCY2NwwXx3i4N4YVNZK0i3sHOs=;
	b=1uaf3s7IfY0tXJ8RdSDJFx9tocrdBUlSBVVkqTzijIWq5xBqkJPJNWgquXr4UVBPPNq/
	 ke3S3m0eNnFUbsiWuxNbkNasl3ofhReWmikUeYt1jH3ySNjEkCTz0ewkYN6uSD0omU76h
	 HcdMRIaN4htV7s3eBujV0ycVLi+O1UA7fYthuiMaDrHYuFiss0GsFlYI3+Mn9nPxEDmN3
	 uhnZe2DNVSHL4MnEhJEwMc7gVp+SiQm+rTbiErdOTqb7iIQme8gtvov6JKL8NyPSpQ2GS
	 0BABM6p2upmTISrAr2yc1un+EaOQ5IxUaT20oMv+W0/PkoiLAGL5R6WKXKk2y+xhMRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=KwxIBuS9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35155606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35155606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=KwxIBuS9
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50aaad19fbso66687866b.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794988017; cv=none;
        d=google.com; s=arc-20260327;
        b=mHcUEmwsyzPYf28H0CwXgCg24cfna349Uei0fzkh/DFf99tiE6UsDodubu8qQ7118j
         LRQyxy3bNH/8lGOAs2h92u5nMrZiV1kEZwsFUrvRfoQkVP2MyhbtjSOgzRqaakS9g0+g
         L21ec1lLPUgcQ7jru/z6fciEA4hzXDdncaMDYN9DUrDPFFETUTa+B2WTlrgwooh+fUoQ
         ygbkMh3nCXxeFkMu9Qx6g4Zcip63zzlOu2IQ4xxuoq689tQSNy4hj/1dtAZjwkbK5nJF
         CLmkRHv+SjgDXZnV4tYCf5q11wfyGE3y6qXhr0MctHIu5+nyyHnJZGjFX5BdQw4SJkw1
         uN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pnx/XKeGh94aieoFZrCY2NwwXx3i4N4YVNZK0i3sHOs=;
        fh=M89f9fNEPHwATUWSWNqeiauW6fCciH5Ryl45cxl1Tq0=;
        b=fV4Ab8N9a94+IGDUZEtYeujbo3aDw4gCfOf/5NFJUKy7VcDtTqYm1YWfE3j193aAwG
         b33UipSWjYaQeNQnWzLHOWDcLC5Th2KHX995Yw6WDUPggNGDo7TjosnAs1cmm1jSiNEf
         9B49HQ3ba9b1Btvb5T6JIMEtPa8W2f5Ttw23j9ersHoyF7dNhSluWIU4DXOaO/MgsEYn
         SwyWUR1aj9rTtspwraoh7K09aLZqH+fk6jG1PGDzt1MmHuzPWjA5mdbSJ67CM6MwH1o+
         1MYXViwyb2hIrDMroDjhkWTmZXU81QxW2ZNIRv3Z+UxaXVJH9kjgC0sGeSE4mQPmfLM/
         HkPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794988017; x=1795592817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pnx/XKeGh94aieoFZrCY2NwwXx3i4N4YVNZK0i3sHOs=;
        b=KwxIBuS92KiVES7EPspJTIkt+Vyfny/uZgiUrllnoPC8h5ws2iqgOx6IGqU3bdxpJF
         dTh+jwl6pe/Mg2vFUsOi2NsXr//POfNQZwoZGHxLw8YE2AypIZN05YQ++EvnjV5+l1NT
         +NATB2riwpwfALaIqHaZQcMqilv4NY7h7Kd93KIg1VEqkvhv9rwn/bFvmZomybfh0gk0
         dxSxiw2IovXsuFbv+f5Qhxzv2Q5O4vL3W/pYQc9KJe02/JYqpLW7h7bxxzji6Z2SsDLR
         Ul+uqGPAIPJHrYy7FkTC4ddPTvtIgQQ6nMTZCUHj0DGq1S9fjp9CUECwLscDn+TXP/oJ
         8b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988017; x=1795592817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pnx/XKeGh94aieoFZrCY2NwwXx3i4N4YVNZK0i3sHOs=;
        b=rT6BlN8D4LgK+rPQRqa82OTaB2FqsQcP8U9xTDxVSG0gwbV2F//5SJ3YO+h0evxIHr
         qbos8l3QHGqbscfPhUfW+ArYzv5S4H40JFeAGLDFPvTMQJHmm351+KkKj8RCinPaZnYj
         oLyieX/yuUMcg9aRTphiAFwDjDhrPwHJ3q4qOhrcD9m8roOPqqOpSJ7Lt5Y7a4CW82co
         1HoFVoRZkXju62NrhPRJ8Q6CUUhDBinYLj74SIqjQ9V8vKQnfjGOBGsJ/0uIQ3QEP6BO
         5NifKoeWwi59GjAFWz4RadJZr5/DZYRTLsAgG15tDEL1kaOOtsDWArl7YnTFiHhU/8C+
         jMUA==
X-Forwarded-Encrypted: i=1; AL+hErH9BOS62ITGzE0+brR6hBRNL8ZtwZ8jML9qo2yiv8G28k8QXnWsPWYVVXubJbk8RWawQwAq0zLQqv34@vger.kernel.org
X-Gm-Message-State: APuU4Z+JgPqubmljouLqYLmFh9KoIUKof1hCYwO5Xs+m7STc9e7d4fD3
	NDx31AFu9QoGr7iUuV2ScGVl4UzXgqWdd41okEabCHSscmDiH9PviaXKZVI6wxsE5oGRvQA9yk9
	VEjVNivuf7NL7HilenGG2mNJnK6Zo1SzghdDZKTIruw==
X-Gm-Gg: AYBFou0zxijYJ4Kcs6Pb2DXNKHyXu2foLPedPo/BrnOh2ctr8Z9mnerib33nDaUAytb
	yJsH1JuPJCTsRnqFMD+wBPlAy3SaSyL/5v1h5wB2SczRZryuB0buC2jEr5Ej2/AfxkWGmL9XbLo
	A1/j/V5IEkdWCSo/LnV4e0wQSyCYukIEA3Yvkldn4pYoB0wKYCuIRhUdNPvQHGFmsrsj/6+Tu8V
	ccYoVBN+zvnNCKdutHgWED9/9NauslByda28zthXMSMu+8DG3vB/AR9c3j/PCv5GmpLqJJtGOji
	6JYw3hPj2G2rPLBGtxnGdNlE51oml6+s6BvO15mrHYHfI8z6rkjs44DTFYEKZ2+ipV7sgEfZ0wE
	clfggMvUJcN0358QW1pLkAfnqRwCmgPjmZNfvhLbGufJVfJArp0CM9MMIHeL2iOyUPCPEiQ==
X-Received: by 2002:a17:907:9446:b0:c4d:456c:4a29 with SMTP id
 a640c23a62f3a-c510e16a720mr128985866b.14.1794988017524; Tue, 17 Nov 2026
 23:46:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
 <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com> <CAKTNdwG5XA_chr2ZM9qTnr2RaDMzOjdb85bRdCr4aJCr1EGy7Q@mail.gmail.com>
 <398a1d12-c28b-418c-bbcc-170d781223d6@oss.qualcomm.com> <CAKTNdwEzbYAqM5ABxU+tfh4juU=wgYp=QXyjvdA1haanU0e8tQ@mail.gmail.com>
 <861b48b3-32e2-459a-a6e1-75d93f10e1c9@oss.qualcomm.com>
In-Reply-To: <861b48b3-32e2-459a-a6e1-75d93f10e1c9@oss.qualcomm.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Nov 2026 11:46:46 +0400
X-Gm-Features: AclHuK-mzUUyPR_nvHlWIkQreDiwLH9wtGyUE6yWiokuHebhGdjJ_j61S1Ijpdw
Message-ID: <CAKTNdwEOiPzvziW5VsNrHcFXEr1E7YjbabMfC3fsG6q+5-TnzA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: connector: Add PCIe M.2 Mechanical Key B connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krishna,

On Sat, Nov 14, 2026 at 5:45=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
> On 10/22/2026 2:56 PM, Alexey Charkov wrote:
> > On Thu, Oct 22, 2026 at 8:27=E2=80=AFAM Krishna Chaitanya Chundru
> > <krishna.chundru@oss.qualcomm.com> wrote:
> >>
> >>
> >> On 10/21/2026 9:14 PM, Alexey Charkov wrote:
> >>> Hi Krishna,
> >> Hi Alexey,
> >>
> >> Thanks for the thorough review, this is helpful.
> >>> On Wed, Oct 21, 2026 at 5:51=E2=80=AFPM Krishna Chaitanya Chundru
> >>> <krishna.chundru@oss.qualcomm.com> wrote:
> >>>> Add the devicetree binding for PCIe M.2 Mechanical Key B connector
> >>>> defined in the PCI Express M.2 Specification, r4.2, sec 3.2.19.1. Th=
is
> >>>> connector is used to attach WWAN Adapters to the host machine over
> >>>> interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB 2.0, selected by =
the
> >>>> Adapter's configuration pins.
> >>>>
> >>>> The connector provides a primary power supply of 3.3V/VBAT, along wi=
th
> >>>> optional GPIO signals for WWAN-specific power/radio control:
> >>>> FULL_CARD_POWER_OFF#, RESET#, W_DISABLE1#/2#, WAKE_OQN_WWAN#, and DP=
R.
> >>>>
> >>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualco=
mm.com>
> >>>> ---
> >>>>  .../bindings/connector/pcie-m2-b-connector.yaml    | 146 ++++++++++=
+++++++++++
> >>>>  MAINTAINERS                                        |   1 +
> >>>>  2 files changed, 147 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-b-c=
onnector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-b-conne=
ctor.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..a7f4bcbc5119
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-b-connecto=
r.yaml
> >>>> @@ -0,0 +1,146 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/connector/pcie-m2-b-connector.ya=
ml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: PCIe M.2 Mechanical Key B Connector
> >>>> +
> >>>> +maintainers:
> >>>> +  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>>> +
> >>>> +description:
> >>>> +  A PCIe M.2 B connector node represents a physical PCIe M.2 Mechan=
ical Key B
> >>>> +  connector. Mechanical Key B connectors are used to connect WWAN d=
evices to
> >>>> +  the host machine over interfaces like PCIe, USB3.1 Gen1, SSIC, or=
 USB 2.0,
> >>>> +  selected by the Adapter's configuration pins.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: pcie-m2-b-connector
> >>>> +
> >>>> +  vpcie3v3-supply:
> >>>> +    description: A phandle to the regulator for the 3.3v/VBAT suppl=
y.
> >>>> +
> >>>> +  full-card-power-off-gpios:
> >>>> +    description: GPIO output to FULL_CARD_POWER_OFF# signal. This s=
ignal is
> >>>> +      used by the host system to turn off the entire Adapter. Refer=
, PCI
> >>>> +      Express M.2 Specification r4.0, sec 3.2.13.1 for more details=
.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  reset-gpios:
> >>>> +    description: GPIO output to RESET# signal. This signal is used =
by the
> >>>> +      host system to place the WWAN Adapter into a power-on reset c=
ondition.
> >>>> +      Refer, PCI Express M.2 Specification r4.0, sec 3.2.13.2 for m=
ore
> >>>> +      details.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  w-disable1-gpios:
> >>>> +    description: GPIO output to W_DISABLE1# signal. This signal is =
used by
> >>>> +      the host system to disable the WWAN radio on the Adapter. Ref=
er, PCI
> >>>> +      Express M.2 Specification r4.0, sec 3.1.12.3 for more details=
.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  w-disable2-gpios:
> >>>> +    description: GPIO output to W_DISABLE2# signal (default functio=
n of
> >>>> +      GPIO_10). This signal is used by the host system to disable a=
 second
> >>>> +      radio on the Adapter. Refer, PCI Express M.2 Specification r4=
.0,
> >>>> +      sec 3.1.12.3 for more details.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  wowwan-gpios:
> >>>> +    description: GPIO input to WAKE_ON_WWAN# (WoWWAN#) signal. The =
Adapter
> >>>> +      asserts this signal to wake up the host system. Refer, PCI Ex=
press M.2
> >>>> +      Specification r4.0, sec 3.2.13.3.6 for more details.
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  dpr-gpios:
> >>>> +    description: GPIO output to the Dynamic Power Reduction (DPR) s=
ignal.
> >>>> +      This signal is provided by a host system proximity sensor to =
the
> >>>> +      Adapter to trigger a reduction in the radio transmit output p=
ower to
> >>>> +      meet regulatory SAR requirements. Refer, PCI Express M.2 Spec=
ification
> >>>> +      r4.0, sec 3.2.13.4 for more details.
> >>>> +    maxItems: 1
> >>> This seems to be missing the four CONFIG_* pins, which are quite
> >>> crucial in these connectors, as they define which interfaces the
> >>> module asks the host to provide on the respective pins. Without those
> >>> module type detection is impossible.
> >> Agreed, thanks for catching this. I will add a config-gpios property  =
(4 GPIO
> >> inputs, one per CONFIG_0..3 pin) to v2. It's optional, not required - =
a board
> >> that always has a known, fixed card type in a given socket (e.g. QCOM
> >> glymur-crd's WWAN-only slot) can just describe that fixed wiring via t=
he ports
> >> property and skip CONFIG decode entirely; config-gpios is only needed =
when the
> >> host wants to detect the card type/host-interface at runtime. Kept it =
as plain
> >> sensed GPIOs with no decode semantics imposed by the schema - the prop=
erty
> >> description documents the full Table 3-18 state table inline (all 16 s=
tates)
> >> so the binding is self-contained, but turning the sensed 4-bit pattern=
 into
> >> "this is a WWAN-PCIe Adapter in port config 0" is left to driver code,
> >> consistent with how the rest of the connector's sensed straps (e.g.
> >> viocfg-gpios on the E-connector) are already handled.
> > Agreed that the logic of turning the 4-bit pattern into
> > enabling/disabling interfaces sounds like a driver realm, although we
> > probably need to consider if the connector should accept pinctrl-0
> > through pinctrl-15 to hint the host about which pin muxes should
> > follow from each of the 16 4-bit CONFIG_* pin states. This mapping is
> > hard to recover outside the connector's context.
>  I'd put the pinctrl states on the connector, one per CONFIG_0..3 value (=
Table
> 3-18), selected after the driver reads config-gpios. The CONFIG-to-mux ma=
pping
> can't be recovered from the interface providers, as you said. Providers w=
ould
> keep only their own default pinctrl. What I'm unsure about is how much is
> SoC-muxed in practice. The high-speed pairs are often fixed by PHY or lan=
e
> routing, so the states may mostly matter for GPIO_0..11. Do you know of a=
 case
> where they cover more than that?

Thanks, that makes sense.

Regarding the high-speed pairs, the Rockchip based boards that I know
about route one PCIe lane muxed with SATA to the connector, with the
SoC combo-PHY managing the interface muxing (including the polarity
swap for the SATA-B pair). I don't know how people deal with the
second PCIe lane vs. USB SS muxing though, or if such devices have
been made available at all. Either way, it sounds like those could be
modeled as one port per muxed pin group - i.e., port@0 for SATA+PCIe
lane 0 (as two endpoints), port@1 for PCIe lane 1+USB SS+SSIC (as
three endpoints), etc. A PHY driver for a dual-lane PCIe interface
would then have to figure out whether its OF graph has one or two
links and configure the PHY and the controller accordingly.

Best regards,
Alexey
