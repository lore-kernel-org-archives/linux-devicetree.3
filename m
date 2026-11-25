Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638378;
	b=vLK7HgCB04Gk4BpL92lFNRowV8zCSKWfNSaY8eQFs/tfJFUvypk/lJOLBeqfUVSV6nkR
	 iLzC/zgQBiMjMQcS8LtYgpZfBPwglHONuG6KqJ+8J8jlzC0LSIJQyQAUFWtni8XS2VGsb
	 XzEZEqIOmDJIuKqtP9kGFbdZ2GUhST6BY5D+rhSBcA6aPE4qKY1bmqV4bbcVr58JjP39D
	 me+O0RdSK+l5H2UqI3w17oHTljeucPO1ZIZQ12d/SJE4eOtl8QQK3qVltTIHgnHUC/577
	 PVV3Vx5Tw0r+cGzqAAyYYo9r4tkp4YxdOb54GlpwnoIcNpFwZDJN4zmeCWdcOgB9GTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
	b=mmyOLOe1Qti/JjqdV4PVADaVwbez/XA4k4EX6vqs5zhNJQ6l2yYL1gBPFJnspIbMyBDm
	 0GIFf9eI3RBU7zqpueL3aNL04nTOKmrw0cFmVkB2ToyZjHZLQhsWR6Su8Dy5vBLHWP/Ih
	 hslHXRqV9GVhRCX7t3zamr5f/MxPAUqmwf2zZROTd92dmEKKxLfKyJ8lvcnqT228nvZbA
	 qm/60gau48rIeaL8FHQdo9I7X73nk4g+sm5mFRGDxp1o7irUC6NgmbFNRBXSKoQqvilnM
	 emVGEz2vmMmFYRj8zKwTg/E6eRFWotlzDCoSweG57ihQK7D1grGVv57cX48BaqwaKSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nkRrJQnT;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8083606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8083606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nkRrJQnT
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so7234038a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795638376; x=1796243176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
        b=nkRrJQnT1WgvmzwjV0OIZ7nBjc6lhyDgnK9OotNoaRgfsrUYXkXm2SWBSQJ6zbgYWE
         nFWwgNYo5f9Y2OghKer+9eaX7edXntO+VzHggkI23dIpM4gfsj1OO/djNK7Li3c21IFh
         fI0+ifbgf0xaodDPFlzfhxyaO2amWRUptLwuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638376; x=1796243176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
        b=0VPTpaosmt52vWgS/rjUcf7JVHULIhX4T36IpVDohJ83WosEmkgAQ+z2IvwOKYK6Qu
         7AWNiaJTgJ47g+IROYt8Lr8HCiYMgFeoxV6czFoDAunOzAxDVzBWSnfAS+uoajVGhHIw
         W3nmV+wpO5n3mnxP76/exSMUEVWgOf/2f7lLa3IyvKN/PkEXmv8CMMv9lPo7I64zpiLc
         0hnRQtCv4rUPXBGSKxuNzWjQEQiiScevCF7JtxXbFQDSMhN02luGWFr9DMChcibbmWQT
         xDhIZ/ZZzyMn5Rf6cmJv+PigVve/ruF3cFiC9aWWkveDqjUSJ5sX2tXwa0EiFwmql6lu
         fqXw==
X-Forwarded-Encrypted: i=1; AL+hErHFgYL2Wzr6s5tJbFPu50aYSt3DPm1dQbJJDETQaSTa6dB85i6zkk70dfKcXg9J6mV5YyABXzLzxSom@vger.kernel.org
X-Gm-Message-State: APuU4Z+HzgnFDw1Cex7wK8/X/B4YW1V8zuXNQ7i3WeS+UJ9euSTbEjRU
	+jXO5MjFUGCMHK46XbwSJGzQPtQLGG8oTNbcKZ/L3ZaJ+pSmySXYGgYs6HGWgHLkjUFpq82OKc+
	zUrq0EMbx
X-Gm-Gg: AZFdTZdeWnlmYSl1CXT40LFo/nBMAP002wuKeaFOUqWzO/OjgPrMWRMb4D4ZM70bO6Z
	noNSKw5Lekhho2Px4TgtOGCfkPbNc7sKbQHqNfOT1Ua9oAWPMVoy1aiVkHHBonF9x77XT84o/No
	R7smbr+DFJI+2jL6/a4w/lG/ZaIZ4aCOpgdspaQglvKP0DPYbAsuJrJ9UmOSU9rRURa5Hb+nOqc
	kOwZGcLSwl2nttr2ewdvsQ5tJyNSO+kYallrQMoPoNmBO14SdIZztrRtm8ylY1K2umGykZdQ1bd
	qUVPBCGNSY6potQOga7umHQZ5OytmH0oA/udUs0IuqElR58mwDzuQU0eGm6gKDWbTx8Hh45rgwd
	ezANsmo4VIGXGmB9Uq2LXKPwt6UzLYJJ/whupgAl4rqRLhCUqv/9SOEJY3tBlpeIXbb6Ci8ZB0s
	Pmnww9mhMMPNHbOGz4Udczqx7xb3WARMX/0zWAZM6cR/X8A2uW1G8XMFeWdPh6cU/UGyUrTZHxN
	5Ytzlq9hijkpEKNCPK8bIvD2EooYNplcGcZo47ymFEEOzgFvJVy895wXg5kBU8Yd7eCaTUUsU7D
	hTmyNcFCzlesyt6FkaOshZ3j3XR0cBv1WM2DoUVigtLtwoYsaCfgNr02vCzwIOF/uLGf
X-Received: by 2002:a05:6402:400d:b0:6b3:f891:c2d4 with SMTP id 4fb4d7f45d1cf-6ba37ea5360mr12589367a12.29.1795638376279;
        Wed, 25 Nov 2026 12:26:16 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1aca67c8sm2003368a12.0.2026.11.25.12.26.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:26:14 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso33925565e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEh77ozU9IwZjpzRLzx97a+jaOdvWVqi2wnetTd+Tbl9CMbASV51GwdyMxF/fjq6M7o2r6A3kNWSgx2@vger.kernel.org
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id
 5b1f17b1804b1-4bb88806292mr393435495e9.15.1795638373083; Wed, 25 Nov 2026
 12:26:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-2-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Nov 2026 12:26:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VLjPe1U_6LOtxZO=Zkc0sRHH+28PgYVqyCGckEJ=nAtQ@mail.gmail.com>
X-Gm-Features: Aa3M54oEC-In_bkVrLr1h65W2jhYWlRAtlpUDztwO3IbOK5jMmWhEITpomu3qyE
Message-ID: <CAD=FV=VLjPe1U_6LOtxZO=Zkc0sRHH+28PgYVqyCGckEJ=nAtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, google-soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 15, 2026 at 10:02=E2=80=AFAM vamshi gajjela
<vamshigajjela@google.com> wrote:
>
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: google,lga-spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false

Looking at downstream usage, we may also want to add:

power-domains:
  maxItems: 1

Since at least some instances of this IP are power-gated by a domain.

We probably also want to add:

interrupts:
  maxItems: 1:

Even though the driver can work with polling (and I guess that's what
you do now), the interrupt should be wired up and the DT should
describe the hardware.

Neither of the two should be listed in "required".


> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi@14853000 {
> +        compatible =3D "google,lga-spmi";
> +        reg =3D <0x14853000 0x100>;

Should the example address match an actual instance of the SPMI on
lga? From what I see, it could be:

reg =3D <0x3a1b0000 0x200>

...you'd want to update the unit address on the node name too, then.


> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25243,6 +25243,12 @@ T:     git https://github.com/cschaufler/smack-n=
ext.git
>  F:     Documentation/admin-guide/LSM/Smack.rst
>  F:     security/smack/
>
> +SMARTDV SPMI CONTROLLER DRIVER
> +M:     Vamshi Gajjela <vamshigajjela@google.com>
> +L:     linux-kernel@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml

Instead of a separate maintainer entry, maybe just add this under
"GOOGLE TENSOR SoC SUPPORT" ?
