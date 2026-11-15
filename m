Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794762861;
	b=s6EFpambJCtBpTaLBDHGtwJJE3HgeHk68YgZS9d/Rah7g/yezDKDFDfPoTYeReSiMbfp
	 k7YikBuu02/R1sNUfiWx7iczEK8BMvzu/C4oeXsAsPHlWsNSnKTUOb7o2/4k0Ix4w4xaJ
	 HzPBa6b3+DRakNt5vHq/egGfQ4Rwx73d7OzzgM4gkVyBc+jNZETbVRcv7yGMPCyJt+ZkM
	 xTEFa6quz2xMEfAzkdiTPfg93X3mUajztd2t6tdoOO4NBAZhdJ03vX6YnnFBy2aWWJHiV
	 Mg6aXZRYeP/w2+BgOoOKWu4gFh7ufqEMkrOSQBiyH8HUiXHyks628mayjqI/PV4f+FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
	b=Vrr1K+48n016cFbXuIH14kSDeOv84TJJBSsFMB8jnrsxXyUWJUcHszHFf2vkj6MXnKV7
	 peJxomlFHg1eZsV3zpORUG2SUgnC/odAIaX7oghp8AdteHPGFCt1JDVI/VKjnu5aHyEnJ
	 bzX6UsDwRB2ji+YP0n64/wjga0ReFaE0ttC16M+Pdpq68QAMOZHpeXFyiKbxK/H9fSCP/
	 KFMTqbz6hY3VNj8VWLPu5NWopf3j9ZxP/Hqbqkd9SGmymeFLPxhYB8tglJiSxm1TWg9iF
	 9jchfN/XcX7qui/HtYFfghWDi7IWFmkmkOm+FFUyDBrtlB+9uyhtPZPR1zboMXog0Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+n7pyFg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F34606A31D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F34606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+n7pyFg
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55be673e029so197481cf.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794762860; cv=none;
        d=google.com; s=arc-20260327;
        b=bGwWP6JytOV8e3b42I1655padxrAlOp335SlZ+HEA4MWVZilIN8UxjjIqb/yk7D3mp
         xb4P1UtYOsoZBA44FyCfFSANJmLXQHsmvA0jKDGgj7M4xBP8shLh+DfRiqyYKQhsHl4z
         Tu9VtYE+zcNjXdAqxWKAm03lvu5hicEixFNylofpTSDswt33uCqFwjM72Cm/vF5+pNyD
         Yjhs+eYwLZaCQ5Az7vcBWSp/wrEtSXDnEws47I7HetDb7Wjy06EaXQgLcFdKT6qfdU8W
         QYLyov92SPaGhggYzSw4fmwT5Mi56SuVrgkH5uxWS7L4P2N7jlDBIQ0XRLiyrRdxiFu3
         KOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        fh=frKF9jADVu/lXi9tEj2O+/xrqNhyhCj6br1Q+aK1/EE=;
        b=EkWA8ugPKQ250vP8VdQ+emssbTMT6KPb7PFd+S73Tz2oH9R3fVmVRfiIEObWJQcR2l
         d8nrvwblTGU8EC2mWcfYnFHSEj8bicr3++rimoBXB4A4kTlUYBQfYCHbrFG0qTu6e76d
         +rKqXWVTmJbYg0lqOsV47iriZJXw2/0n2QW1555S1RUZW6ztxTbVyNxsRYxv31AMnbKU
         YoCmLqQHjyMM3um7KUPL4/uFtdsKNs/acjbxZzKbFNcbf6+OLs2du1jOZTokHOOwj4IR
         04T6+Yf5yUzJGMxvxwqBQ5MVIl34RwI4ZREyzHPXWsDqOKiH10Q7XGjmrky9xXX/v3CQ
         IkmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794762860; x=1795367660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        b=K+n7pyFg4BiDZzLhNlpFTGENkK5vRoZX6N2Vpd6Vp/EnuzX3L/S9y9Z/R0Ll6dCPq5
         6qoGuF8xVg5dyp5cIDJaJYYUAYrnVlkwYaTc8DfA8Xqav+SE/e1GjI/ubaYgyGKKO8kL
         HP90cXMh3SRoIr9PonX/RoiJpTlTZ7aLuw8pSBFTKrmrekGstAfxouYn7pJD32CyssvP
         WDLs74Efi7RKxt/HME+WlAXpWCrjKEM0JkvbO2VaRi0vcKCXTwyx2uNm0gRj5WGYKbvy
         +8NFL8lNgmIc84zr/A4E7NYikHtKHz3/L5GNRiilDh8HVnaGqBso1lcdQ4aBol8KrgAy
         cOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762860; x=1795367660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05mNmZaatL0CORPzQTX8nQUpPIvU0TyMgu0JPcvJLqo=;
        b=c8J+V4LFCRXc1nmQuBhf3seq/mV31uOlhL2PX6lsKNLV1vRc/spyT/FKQNf+3zZpGV
         soVpVXCIq+2A/WoD3zAqt2GQ9gI721urPHuw19WaB0U0P23LEeSlPs1T5F2PphmSVN7B
         kpAEuKk8koR1APTA3Vd1xW5FKCq/jGNr86VhjJN7mUfSunmExVEkcPG9jTGaZ+yJLOOI
         LMae5gYAQJgSHY7eAZ4QUWoGO/zjCcVe8cIudshTl5ae+Tl7gmG+TN3yWalicShf45FU
         l59IdeCQUeakvZcMK9TXwTSdArTbRpYGYAPVY6l/kaWzTjoplU+6mMjH44W0TtQrVFu4
         uMBA==
X-Forwarded-Encrypted: i=1; AL+hErGjA5KtUiBsEIIk/ZTPghM8hwlYOLX0e4yqARykN5R9lHIV7QT7/5xH/D+IpvYWFa2j5WU5vKxbwnF5@vger.kernel.org
X-Gm-Message-State: APuU4Z/E/dpvaL2RiUgXdD6K/CVKb0UDscueVgNZA2pP2391S7RQwW6b
	9bpLf2hKTjBk/erDH/BJX2AiR2AJ2dGFtVHMmuYYPHZznJdKQIqUMPF82GEn0PuA6mtOf95CcEe
	fueYLpYfyBZg0nUfIJ/IyXRevDdMTxDkY6sWrskuv
X-Gm-Gg: AYBFou1k2I2nP07JK9smWxHe/+YKUR1Fjc0j0iYzOeO9VwgW28/y0Zhic9H4fBwDUFP
	sIoTWbuqZ1ixQkaWEpxksOhYtSzvHCEFYX1KCo2nUaiVWn+UnPJG/l1OKBEfcHmU+MmsdylCHvF
	dHgmW/5gXxFUAdJaa0i6YSrfVDP6C8F1lhCo0D8eL+mTDqgu9Y/D7weVq0vYC6MC1KgtztJB283
	g/NUMxh630LQKY1w7IflxpXjan7rBQhYpkqxo7RmEQqtkYqevXj+nqg5sKeSLYVxV/EI3VByEo6
	jFFBj/8rurvgBlVNVu3TdYU3u3fDts5F1veXBxC/WSoBjZFnsWzH8Dal77SQi5iVoNVhAagrraB
	Si0jvbpRqwMSvMhE8c+HEV3zBMEsNn4kmQX0DjqudaxddhOm8pmlmomJM4yk4cvQpI7okA1iHbL
	//LboxmWGP9frk/7UPFC4Ub760RkoFZ1ag9bsx6BURH0P/Tw==
X-Received: by 2002:a05:622a:53ca:b0:536:78de:775f with SMTP id
 d75a77b69052e-55c69c2ff17mr23222831cf.15.1794762859662; Sun, 15 Nov 2026
 09:14:19 -0800 (PST)
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
 <20261103042608.387626-3-vamshigajjela@google.com> <20261104-colossal-illustrious-guppy-87efca@quoll>
In-Reply-To: <20261104-colossal-illustrious-guppy-87efca@quoll>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:44:08 +0530
X-Gm-Features: AclHuK-yTkRrUncnurNuyi5Wl2ro-fglUcoEeHi8NCW7Il2Q9Y6sBXYKy5bfL-s
Message-ID: <CAMTSyjoBw6uL3yT2rEr8LUsoO-F22v7nSKiD6sOLhDwVsi=fvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
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
> > +          - const: smartdv,spmi
> > +      - const: smartdv,spmi
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
>
> Don't repeat constraints in free form text. Just create proper
> constraints.
>
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
>
> Why clock would not be described in clocks? From where does it come?

Agreed. Even a free-running clock should be described through a clock
provider (e.g. fixed-clock) and referenced via clocks. On LGA the
controller has a clock and reset line, so in v2 I will drop
clock-frequency, keep only clocks and resets, and mark both as required
(removing the redundant prose from clocks).

>
> > +
> > +  smartdv,master-arb-enable:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      Enable master bus arbitration phase (0 =3D disable, 1 =3D enable=
).
> > +
> > +  smartdv,master-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Master ID for the controller on the SPMI bus.
>
> smartdv,bus-id, I guess

In MIPI SPMI this is the controller's arbitration ID (MID, 0..3) rather
than a bus index, used only in multi-master configurations. Since LGA
runs with arbitration disabled and none of the smartdv,* parameters vary
per board, I will drop this property (along with all other smartdv,*
properties) in v2.

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
> And why would that be board level configuration?
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
> > +
> > +  smartdv,arb-scl-delay:
>
> Except Conor's comments, some of the properties here should use proper
> units.

As replied to Conor, all smartdv,* parameters do not vary per board on
LGA. In v2 I will drop all smartdv,* properties and the generic
"smartdv,spmi" compatible, move the LGA controller configuration into
of_device_id match data keyed off "google,lga-spmi", rename the binding
to google,lga-spmi.yaml, and drop patch 1/3 (vendor-prefixes.yaml) since
no "smartdv" prefix remains in DT.

Thanks,
Vamshi Gajjela
