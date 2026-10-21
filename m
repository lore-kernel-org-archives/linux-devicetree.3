Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792597473;
	b=1Uq5oPOdpVlK6+EVAu54TJaSp1r8werDOTX3Mjmn26Mczsmfr06mGbO84aEV0SGI90gF
	 IMaADj6oNUqNTIHPBqCq3mkB60Xxd8b++q7e1audXju6GPmzvgabiaZ0nNsiXgGbMYH6n
	 Fr0PFsrbsaDDAnTReoQ4V+fylMediVpGIf36vmjdf57pmS4MKvBX0JUz0LYdKV8j7Spp0
	 ul5WNKlWDnDTJ87LGOOuf8aJMXlxCmx5I86zzZIUXYHj/1RwalHfGTMx0ToNBUBQTz1hZ
	 0Yx0f0UEhPQsRBCG/RN2afy4Qx9xf2P8PtD+B6wkMx8CIZ4LeannmbI3SLG1OJXp74Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
	b=OFtDTUCMUVBbmgDRUmZe5PAxX0IV2II2iw6btefwA9Adzqip9L9OuUUXC9jwQB8ftpSU
	 wzbBXLMsMlm0lD+9yYW6WCkg1e7ii55w/GtB+nT0EFPvcLsQ6IgaDexXiY1vl60jnFjRl
	 S4boimbLXFQQxnkAHxgdiH5C6vea7kNjvJIjTkI2N6uelUoDBivYiRuQuO5UGc8FiYMay
	 1jmunjR9INql9wXpXnIslA1m7RC0KJ5HKe2SVLuuVBNi9JGawgEEpI95SQL0EQpB+fmAp
	 SH1z+BPUZKRyb3wjdmAWhGH5t4Rrj4QQ11/nuXOA9UHH069czD6X+VcRK/aC/ypYYLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="fT1Ejq+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF00B60A2623
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF00B60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fT1Ejq+/
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c450ab1483cso147726766b.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792597471; cv=none;
        d=google.com; s=arc-20260327;
        b=WLANQ6PbHTPI3wEcyaEsJBefW9TZNPRdbeI6qk+FZ2cs042Cjkt8fQA7KoloFu7HmA
         PPMjN3cq1um1xWeLc8jmO8rl5aGjWC+igzgsX+IP4fB6MPeJWm4+UWuT+NWsGDEd1F3b
         rWv2OR2ChMt1Q/Tc6zsQ0cYw7m12I1WF17lFdItJ1jwKDRIxUMf8bXEiJq7iaE3ab+iJ
         +OZbqH8j/Dwc9eZQs/hqtk9CUrm4xVDwqru1mt5/7hbNRUNgJbC9+gZNpPJvX9g5MOA8
         vuFp3K0P29JEoiVn5R8fbvv6yoy4Qeweljr1aLn1zSfue+irCcDzF35p4zDoo89m40St
         GU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        fh=aV934My5Cz+CmUzD+sEeZlVpDu0vBESVZluiH9EMqbY=;
        b=FUKw4sO7zfq+ZFwPrixLlapkZt5bKOPTSStq3mvWXTLsIx0fcX41J+B2tfMFw1KrwG
         1YufaKfcJFfkyZEUlHfAebiqSMfKmLzYYguecYncY8KY1MuxVUscjDpgc00QN9HSfet2
         juHLveq3Ly53QgywSOpGgNoyZCSWp+7yZbPKVeXgYJfsAZosJ5z0XB4t57PjEP07QRs9
         VnN8HrLhZbJ0O8pucPIQUeO5b0EOprZKWrcjp6ZQMoc4NDNW3PWaekPMSYJIFiJyDT3s
         yr50PvRWh9eRTGcEr/0uX5gwSr0aoq7/Eji4Lb3Dsa07X9+EaKXvUU3d9ll5vY89K/tr
         1LQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1792597471; x=1793202271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        b=fT1Ejq+/L56l79ie+PNmdQbxUE9/wPpsUh5WzFCARRIo7DhXjRMQdSMvNzHnT/eXUK
         U1uG49UybtIek/3tGTHsFnortB7I2Ud3eqM90D/fcwX2ZoNpWpLOYqIySWj5tZGiVmo5
         A8c4weGoCSi9qGxJAFMQK7fltmLgJitKz6b5FZvPv8IhrMLbQUQ3XkwLPLN4X5zIAw7V
         jDdMr7FQo9B1Jxu6a/lEtrZm7yUThf57nza2x9rNdhhjVZ2bCwn+ycLxa1LDU2+7gAwM
         c4w3om4KynnPQ8oVYNL8wqUCw1p0MtaOC4BAZXAZdu98lWHTUOJYF6I9QRNLwZnlW/9S
         b/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597471; x=1793202271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        b=e/mYBvNPihwMvO5CmqKcIs/n8SQPWbtSFkjbO1zYq2pPOzb321lzro5e30hitCk/hS
         wpQxektUK4yGyvxFyHUmuETBufv9xNbY57D/aPjl30ZWF+Mnw2a3Fcqyxhk9EOEDQlC1
         loYhCknj62fW6trm/fnGhmCWBv5JPAzX2Di015u2bQETYRWIWmABuAKMsweF/K9dz2LC
         h22Hu0cNRsZFN88PeVmJ/CEOZhPBw3ntKwrBTLYzc8ROFSl6W0fY0fieakopeLHyjbji
         rELlKDK4GEEH1vWRO59WQdJgIiDf6wsj1NSxNRCUmHShtm0kvPgKhEHveVY7eEe2HBvm
         cVmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwudGBAY/SYWPjvvkQF7+7AKNOsCj2cYNoIJgE1QBmamRg7KQyxbcPn8j89Oyi+0Gpv7uFYuqza0LST@vger.kernel.org
X-Gm-Message-State: AFq9FYIGz6mgSfODUxoj2723qGX7Cuu8pa5rtB/4MEPv/sVcMVeEbYwD
	5I02VEy80GhOe5ERVXoHTHh8zU+5GykqGVb27P/ymgtSZ1J2TDfuoe13irWNy28ULxu1hsjUmyc
	d29jTQaqiasoO558l9xMjnjVfh3bXIs3JX5dtYtCh4g==
X-Gm-Gg: AYBFou2P/CaPZy/0amUTV5qW0z4xsrYoVN7yuAAxhLdw21L3nWKjRoDl5rjGx1dpr+e
	gtWQoH6zVHv1eMxD5fqepcTcrLxLN8kXfmVp1immOtbN2wZvFhcJl8fWhU8b+1F3ca0ZNK9EG8C
	WZIctuXDOsKniZA5pZDNwjZ+97zonsskBUTmeiI05jFU1TpIw0G+YwjRz0dNwio/wpXOmAszBr+
	rn26jeUBwRbF5OoZyoJ7l7SGXYkNf2MOb9SYTIkvfsJW1GnR9VJ2EJ8rzy78ZeNSb5kNcnbqxr7
	gTFwGhiYuUF/ilsHYL/ZYLmEpoBBxsjB1EnMc2lEsy/09Kotngu4rvbZQuft+51EUQi7ubpqGih
	LeykWRxrolJIlLhGZE53590+FmuqQAFX/4jFttMZN0O8Vr2aIS/t+aGPtUVZKAXPlc6fyFw==
X-Received: by 2002:a17:906:4fc8:b0:c2d:ca32:2176 with SMTP id
 a640c23a62f3a-c467961d9f7mr245660266b.8.1792597471151; Wed, 21 Oct 2026
 08:44:31 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com> <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 21 Oct 2026 19:44:20 +0400
X-Gm-Features: AclHuK_OzLUc98RwVb-VyZ4la1jnJworigni-GUiOSt1W-ytIr-eQQIArUmgwS4
Message-ID: <CAKTNdwG5XA_chr2ZM9qTnr2RaDMzOjdb85bRdCr4aJCr1EGy7Q@mail.gmail.com>
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

On Wed, Oct 21, 2026 at 5:51=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> Add the devicetree binding for PCIe M.2 Mechanical Key B connector
> defined in the PCI Express M.2 Specification, r4.2, sec 3.2.19.1. This
> connector is used to attach WWAN Adapters to the host machine over
> interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB 2.0, selected by the
> Adapter's configuration pins.
>
> The connector provides a primary power supply of 3.3V/VBAT, along with
> optional GPIO signals for WWAN-specific power/radio control:
> FULL_CARD_POWER_OFF#, RESET#, W_DISABLE1#/2#, WAKE_ON_WWAN#, and DPR.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  .../bindings/connector/pcie-m2-b-connector.yaml    | 146 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 147 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-b-connec=
tor.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.=
yaml
> new file mode 100644
> index 000000000000..a7f4bcbc5119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yam=
l
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/pcie-m2-b-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCIe M.2 Mechanical Key B Connector
> +
> +maintainers:
> +  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> +
> +description:
> +  A PCIe M.2 B connector node represents a physical PCIe M.2 Mechanical =
Key B
> +  connector. Mechanical Key B connectors are used to connect WWAN device=
s to
> +  the host machine over interfaces like PCIe, USB3.1 Gen1, SSIC, or USB =
2.0,
> +  selected by the Adapter's configuration pins.
> +
> +properties:
> +  compatible:
> +    const: pcie-m2-b-connector
> +
> +  vpcie3v3-supply:
> +    description: A phandle to the regulator for the 3.3v/VBAT supply.
> +
> +  full-card-power-off-gpios:
> +    description: GPIO output to FULL_CARD_POWER_OFF# signal. This signal=
 is
> +      used by the host system to turn off the entire Adapter. Refer, PCI
> +      Express M.2 Specification r4.0, sec 3.2.13.1 for more details.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO output to RESET# signal. This signal is used by th=
e
> +      host system to place the WWAN Adapter into a power-on reset condit=
ion.
> +      Refer, PCI Express M.2 Specification r4.0, sec 3.2.13.2 for more
> +      details.
> +    maxItems: 1
> +
> +  w-disable1-gpios:
> +    description: GPIO output to W_DISABLE1# signal. This signal is used =
by
> +      the host system to disable the WWAN radio on the Adapter. Refer, P=
CI
> +      Express M.2 Specification r4.0, sec 3.1.12.3 for more details.
> +    maxItems: 1
> +
> +  w-disable2-gpios:
> +    description: GPIO output to W_DISABLE2# signal (default function of
> +      GPIO_10). This signal is used by the host system to disable a seco=
nd
> +      radio on the Adapter. Refer, PCI Express M.2 Specification r4.0,
> +      sec 3.1.12.3 for more details.
> +    maxItems: 1
> +
> +  wowwan-gpios:
> +    description: GPIO input to WAKE_ON_WWAN# (WoWWAN#) signal. The Adapt=
er
> +      asserts this signal to wake up the host system. Refer, PCI Express=
 M.2
> +      Specification r4.0, sec 3.2.13.3.6 for more details.
> +    maxItems: 1
> +
> +  dpr-gpios:
> +    description: GPIO output to the Dynamic Power Reduction (DPR) signal=
.
> +      This signal is provided by a host system proximity sensor to the
> +      Adapter to trigger a reduction in the radio transmit output power =
to
> +      meet regulatory SAR requirements. Refer, PCI Express M.2 Specifica=
tion
> +      r4.0, sec 3.2.13.4 for more details.
> +    maxItems: 1

This seems to be missing the four CONFIG_* pins, which are quite
crucial in these connectors, as they define which interfaces the
module asks the host to provide on the respective pins. Without those
module type detection is impossible.

> +  clocks:
> +    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host s=
ystem to
> +      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.1=
2.1 for
> +      more details.
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: OF graph bindings modeling the interfaces exposed on th=
e
> +      connector. Since a single connector can have multiple interfaces, =
every
> +      interface has an assigned OF graph port number as described below.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: PCIe interface for WWAN
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: SSIC interface for WWAN
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: USB 2.0 interface for WWAN
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: USB3.1 Gen1 interface for WWAN
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +      - required:
> +          - port@3

This misses SATA which shares pins with PCIe. PCIe second lane also
conflicts with USB 3.1/SSIC, which isn't captured here. Should it be?

Should the graph also envisage connections for the I2C bus (GNSS),
audio (2 or 4 wire), re-muxing of W_DISABLE2# and WAKE_ON_WWAN# into
HSIC functions in Port Config_3, GNSS interrupt line and the such?
Should the connector node also define pinctrl configurations for each
of the 15 interface configurations?

Best regards,
Alexey
