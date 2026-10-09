Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56F356A0D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558943; cv=pass; b=I209DeiGPSG9xwD+PuFA4bAh/r4EUjK2Zbq6s8lIpulUem3EFccoW5tFVaEjMEZFIt0xN1RTXXFC4HIrEb2iIL37tbU+OykxE3fsiLbcYVxPHZNdW9cwjGKRXTNo4NQz6Lr/YrgE9ipvcbp4jbFtOogTBlR7LyR0nC83Asu2L+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558943; c=relaxed/simple;
	bh=xvA8DTirzMNyhS52A8f+1loxVqPpu9nQXkLXOqerews=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3ofcYgTIH59V+9D/iM/dvbqxz+IRNs4YmZoZsSpEgWBiV1+tQdrwhsl+31FiOtv6t1wyM6M8z+XR7mrKPHhOuvPM646kcVqw2skEJtldEiGmEQkOPYp7rJGanWXTt9bmQIzPHIX2F85b8v5wd0NJFE9nhJare7cACn2rhKGeAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYVvTc1H; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYVvTc1H"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91791ec1b83so49640076d6.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791558941; cv=none;
        d=google.com; s=arc-20260327;
        b=TiMfR6jmcEL9nZeTkcXcvDa+noyBQf3/CXFOgqfgHfvk7zHakKhPTWlYXdSVq5abX8
         M8PHq9OOMRduLkzFbWZx3pjMTm/QGdCtK2OLMzDNCyiZkH7GtPHBchvpcJOO9S5BVg8m
         Y6b5aTNDcE9UfvUSB2OTqY+f3ClI2e6dusKvdC0yeFK+ZZWq9KPdiJ1PM7KIuwAr1KbK
         i3AH+tSG/Eg0u/I0aGtZgvSafIYt24QN/xHFGLAZN+tdAQE5Y+1+zneUppjUAreUdBnD
         uP02VRTtpJHUWEPZSThAujgVsc6myK6W2Nl+Gq+i0rwpKsw2IDEI0XVIIp6Xp3zS8af4
         qckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=liSfgm3aLspZBk/EvQTw5ZezUOYb7ES99ZZ1K8Pg3bo=;
        fh=SWUsj1gACV1K+4fJ/CujbcQl/5TQRBXkArB9xyIOTEM=;
        b=Z9ogtUf3MNwag0E6FnGkgnP2tC+0A1WOqMmk6k/doPSDp9EuzEmHdaZcwZeXhqg0Bw
         ED/KlNntEkfganQ6z0ARW0fKznYkS6OHqujyCFcSk6abV6CEahSJDCdzIhE/KjJhIIGP
         zvSoMKH2kBina4gNzV3md5nZ4v6kx1bcKgXoDZ6nWDYfZVH88dIDqqy+SYpi5HbReuR1
         Anrm9jmdKHQTPUqMFG4qTwd/uUDjEokSdy5CKajtL5GMsgaCOOJfwVIiG2o7Na3CUT1f
         Suvnt8BcWsusFYh1ZB8ijckHu8YLfnIg6cnli4YU/0CbUItFazsHtKUCOGMssuGhDIO/
         xRAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791558941; x=1792163741; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=liSfgm3aLspZBk/EvQTw5ZezUOYb7ES99ZZ1K8Pg3bo=;
        b=gYVvTc1HAv1GJYETcIWnG6sJrHeaO2yVkq/jA5JpDnvcmzCDtIxWtzkhE04kuBJMzw
         oPTITqRxv8L6ZqrGjdtHT2xI4NyMZ/ZS38wh4tZ/KOjrk4EHt8NAYAkhd/3oIkXI88iw
         mXaGKfMTbwj65C6xD6u6z1+udIAwV8woLg898RiqBFPYFyQfsjKoYlZX04LUfEICd3bM
         J5b4/rACNEdwtzlwCIFRJN31REabD/cpzOvcORgxL8w4z1WXArRO5dSC1OLCjUXHXHq0
         SVg8wLFsk4e3k+laNInWMFrl5JVZQU6LUhISMWx3VH28kuS7UIZKyqd5hCJT5KEEQXf7
         Yi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558941; x=1792163741;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=liSfgm3aLspZBk/EvQTw5ZezUOYb7ES99ZZ1K8Pg3bo=;
        b=BaUxxgre0vFUY1jxSzHpjkkQ5B/BbtUxCV2IZkduKuJk1Gi7Twt85GSTnuDtzZqp/w
         qkP/J5jp0l9QiewTzJk57143NVwl/blgf2uUGjgOFVzTqA2WEZyvuoxLNbECttLSSmHx
         8prvn2lvPXtCD7gtAiln4lJrrX61HQwh3hrch0E9X+cOmje1fxAFa//0a0Oam75eCSb3
         95+dyLby6bOvvGRsuH5onMFR20t1XVz1YO/BiXOcCIsbehHeKkJiOMN3Z99JXu8oI2BU
         tFKFUg4g4IF+s30OTRhIcrc20Eg9irEas3iEqHKFedKw9jKiSUZuhvvUlfAUcQ8v4N7z
         LczA==
X-Forwarded-Encrypted: i=1; AKwUvBwfnwzG35n5pWUjzrmrOIQR/hPHqXs8WjpiiLiqMGoyimDcvzPq0+V6DLv9ubV4o1GZ8LzMBvVSm5fN@vger.kernel.org
X-Gm-Message-State: AFq9FYLdRiEz10wCqBpXnjGkQG0TUNtMBtLxgBjqNxA3xHed4ZJ2e2LD
	mLWKJUsBhJaRdvVhenCDYqwyVufJXxYD43U26O3fGicObC99itXyWoOyB45eWTrrH/0fucmoDzr
	LqjZISZTsbtIZysTRQiuwlms04SzZ6m4=
X-Gm-Gg: AYBFou39xLD8DSGQpzhjBgVzRxvR+AEyqqvVY3ZqDrpyuUfhzidcLU0yryy4HDbnmPM
	nriri6eoJ6xqKyMTF3FFhJtcPnAfYBEIKNRlMQ9v3eEu2ou3JgZdwH/wYn45JFN/KeP5ZPNAe1p
	957yRRq7NLc9IjKP+oFI3f/9Z4eqgjoZZHofdiEzP4II+hMfXbCtOD+RHGDqe/p2oTQdHx3N+D5
	nOs2paMA+G2JBX9gkuKAVbVHU7JwWYmF2jujB/+How4TFxU6ByVSqO3/TELYm8Ozb1vZb/9rY/l
	wFECKSNYEJxHFKpdhmS7CqLPy/KWkVyD2RwiIWPp6EMpq6l1B+9fCGeVh8kAqCcdgUiRLJfKKtE
	ppbKSAcDHeNx3B/6+0gFbO87T/A+z3roCCg==
X-Received: by 2002:a05:6214:4e82:b0:91b:5d3a:510a with SMTP id
 6a1803df08f44-91b5d3a56admr20534886d6.56.1791558941026; Fri, 09 Oct 2026
 08:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009073330.18175-1-ansuelsmth@gmail.com> <20261009073330.18175-2-ansuelsmth@gmail.com>
 <20261009-7326174694c52ccce16615b2@squawk>
In-Reply-To: <20261009-7326174694c52ccce16615b2@squawk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 17:15:27 +0200
X-Gm-Features: AclHuK_TaWQMRaZGsQ3qxEM8_zEYr5bmwxiSK0Zad2EZWuG4HWavWzZ47j3MGaA
Message-ID: <CA+_ehUyP35PF6cm17dzeLcREVFEPv=89Do-s5-hm-T3mKveuKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: devfreq: Document support for Airoha
 Subsystem Scale
To: Conor Dooley <conor@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 17:06 Conor Dooley
<conor@kernel.org> ha scritto:
>
> On Fri, Oct 09, 2026 at 09:33:28AM +0200, Christian Marangi wrote:
> > Airoha SoC contains multiple subsystems that are scaled to a
> > specific OPP taking the CPU clock as reference. Such subsystem
> > can enter idle or performance state based on the system load
> > and power consumption conditions.
> >
> > Example of such subsystems are GSW (Gigabit Switch), NPU (Custom
> > Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
>
> The device you document here does not appear to exist at all, since it
> just consumes a clock without any registers or anything. Why can't these
> operating points be added to the actual consumers: the switch, the npu,
> or event the bus itself in one case. In the bus case, I think that's
> exactly what simple-pm-bus does?
>

Can the consumer be registered as a devfreq with all the other thing?
Isn't that problematic?

Also one big problem is that some subsystem are used internally.
Example SOE and BUS. (and also NPU)

How those can be configured to follow the CPU frequency and
use the required-opp and opp?

> >
> > Document all the required property and provide examples for the various
> > subsystem OPP + subsystem scale nodes.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devfreq/airoha,subsystem-scale.yaml       | 114 ++++++++++++++++++
> >  1 file changed, 114 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml b/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
> > new file mode 100644
> > index 000000000000..2cf7f23a926c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
> > @@ -0,0 +1,114 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/devfreq/airoha,subsystem-scale.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha SoC Subsystem Scale Driver
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description:
> > +  Airoha SoC contains multiple subsystems that are scaled to a
> > +  specific OPP taking the CPU clock as reference. Such subsystem
> > +  can enter idle or performance state based on the system load
> > +  and power consumption conditions.
> > +
> > +  Example of such subsystems are GSW (Gigabit Switch), NPU (Custom
> > +  Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-subsystem-scale
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  operating-points-v2:
> > +    description:
> > +      OPP table of the related subsystem supported rates that referenced
> > +      clocks will be scaled to.
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - operating-points-v2
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/en7523-clk.h>
> > +
> > +    npu_opp_table: opp-table-npu {
> > +        compatible = "operating-points-v2";
> > +
> > +        npu_low: opp-400000000 {
> > +           opp-hz = /bits/ 64 <400000000>;
> > +        };
> > +
> > +        npu_high: opp-720000000 {
> > +           opp-hz = /bits/ 64 <720000000>;
> > +        };
> > +    };
> > +
> > +    emi_opp_table: opp-table-emi {
> > +        compatible = "operating-points-v2";
> > +
> > +        emi_low: opp-400000000 {
> > +            opp-hz = /bits/ 64 <400000000>;
> > +        };
> > +
> > +        emi_high: opp-540000000 {
> > +           opp-hz = /bits/ 64 <540000000>;
> > +        };
> > +    };
> > +
> > +    bus_opp_table: opp-table-bus {
> > +        compatible = "operating-points-v2";
> > +
> > +        bus_low: opp-200000000 {
> > +           opp-hz = /bits/ 64 <200000000>;
> > +        };
> > +
> > +        bus_high: opp-300000000 {
> > +           opp-hz = /bits/ 64 <300000000>;
> > +        };
> > +    };
> > +
> > +    gsw_opp_table: opp-table-gsw {
> > +        compatible = "operating-points-v2";
> > +
> > +        gsw_low: opp-200000000 {
> > +            opp-hz = /bits/ 64 <200000000>;
> > +        };
> > +
> > +        gsw_high: opp-500000000 {
> > +           opp-hz = /bits/ 64 <500000000>;
> > +        };
> > +    };
> > +
> > +    npu-subsystem {
> > +        compatible = "airoha,an7581-subsystem-scale";
> > +        operating-points-v2 = <&npu_opp_table>;
> > +        clocks = <&scuclk EN7523_CLK_NPU>;
> > +    };
> > +
> > +    emi-subsystem {
> > +        compatible = "airoha,an7581-subsystem-scale";
> > +        operating-points-v2 = <&emi_opp_table>;
> > +        clocks = <&scuclk EN7523_CLK_EMI>;
> > +    };
> > +
> > +    bus-subsystem {
> > +        compatible = "airoha,an7581-subsystem-scale";
> > +        operating-points-v2 = <&bus_opp_table>;
> > +        clocks = <&scuclk EN7523_CLK_BUS>;
> > +    };
> > +
> > +    gsw-subsystem {
> > +        compatible = "airoha,an7581-subsystem-scale";
> > +        operating-points-v2 = <&gsw_opp_table>;
> > +        clocks = <&scuclk EN7523_CLK_GSW>;
> > +    };
> > --
> > 2.55.0
> >
