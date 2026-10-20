Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491529;
	b=Y5ZZhlBo4IoXjj80Ga7Ga214FV4qRAPisNkJfLbZjDtrrW2S8aG2SqU7XWNtskYP9r5b
	 BIEFkXxa5M7JjSY5LFDw4G7GqEWLQEDdbRBunLCdy90sUt8KriYawL2pHaiP9i6x1aDYb
	 EaxIAg/lfUiqw10q3oagKFxiVnI5ZZQ+bzNYiHRLO9BtVfvfYvHfeHNu1TpvEBzA1V3il
	 M5RPyi+L1JNgLxEzj9WEG73XApEWPMNgYZXfGbREiaY/sE+gEE0YYVC9wEu6n/crzwavI
	 1zSKcNwTNoYH7j7VZ+Nv81dNl4l5mjMem55VA5E7GublsB3KEWruyL1s6CYBU7Aqo0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
	b=hb6nJTeXbNlEkqbu5MpGmFXjxw4clXPAdDJnUmtQbE7gyYUUidOyvKk0pmaVKHALjOy9
	 yAujlbFoigZrbtpw8xDhx9QjJzXy/fZM6fYVV2NK+VR2NvM6jXgY1KhQc9JwRxbcUVG+g
	 8ZMTbhfumgzZFswr8xn5ogBdm2T1dY0Ty08GgMjKHKFtLyNTDjWBsJ8tIQHMbdOhXn+SW
	 +YyTHqP3x66CpJjmtg0CkO/r0TPQ37a8fYbjKNkjWR7f8LEClggnRBg/kT5cEBLknW714
	 pRyqCeiShu+K9DRz/Q3AeQ9EXVLxad47xyOmlWSRYxNGEUE4F2QncQN0m6jTz0id+kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I55feIN4;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C12606A328
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C12606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I55feIN4
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso35538805e9.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792491527; x=1793096327; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
        b=I55feIN4tyXGD9Ilk8kOCGKJvDvDZYrSBgvyREUAv+WEFGc9pL0orf7sqE3yL9MNfO
         R2VrpP5SEEvXpTFA9eYMpHEPDHdTlFswXPTsVj45R2gEamEu7POVA/leoyoyB/c5XukI
         2FfuL1w8av4tzC07CKSCGbNI+bExwzy+2zRaeGoonanLy/erO6S/KJnMnrZCWi6O08en
         5tHqGgy/FbguN6/0K5uWtCnmv816AnEER7UCpXMw780MT2isfUN+u2qNQZ3/T2ySqpst
         hp5dBxskeYDNMGJggdOS3fe1GzDte/bRvu1cbJeWi5iyAi30b+S4cO64QX1PQFVwobpB
         q+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491527; x=1793096327;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
        b=qI3KWsBrkOwqr9hPNMfw+krXnyYUF5TQIGWFhlVbM6jHHik/8lhdAO/MhJzdQTrqM5
         A25a8OMuik2pET8eKA+j7kECJxl4ya4wxeXA9OEOHGm1GlDddjqSmgeWZzbMN5I8Nqx6
         E8kOr1CQTci245Bj9b7Mtyd2jnhsWzwHSpOHJ+guPzdS7vdsCan1RJDGIZenorZpQXCT
         xAOEAa+oVa0RkQg6WgH7qaPDELbIGeMyxQirHn+gV6ZONhC9PopZzeKdkpGBxXK4ZrxT
         WvER0LglwLbk1CaVoUrdxLj0SsrsjhRf/hQ4izbab5NlTdOC/zzrp15IJ5c6X+UsOGcD
         pHsA==
X-Forwarded-Encrypted: i=1; AKwUvBw7Tml2j/RIPyDPvu5BfrRu3bsBbD1lE8lJxjVO5RBFOUQe91wa8ONrOdVhtB97+g+JeBv2jccJo7S9@vger.kernel.org
X-Gm-Message-State: AFq9FYL/J5m53g/92mYXp4h6zJ6iM/Z+/XsnGAY9SfCjOmKILrbidwWX
	Q+k+gR5+nmP73uzZhyIjiBiFxiUih/hyutmvjuZAqpVFhrR3EfeyV0e3nS5lluWvtNI=
X-Gm-Gg: AYBFou3lIQH9ndAjBC81HBFQl3QgVWjPzmMRde5SRJ6cvWNaahNkmTzlaJ377KWqfkb
	ZmbOK0/Hz+mexN7oSXKH+PeV1nNNAHm8tid/uEKTZuvgQwLgFYh0kpIrLOj1I1KIbEFuxHuYFgS
	PE2UE47cl7Me63+ZX6AEfyWPYWYaV9RJBUR7vKhYVmrUPSmQgnCpjNoMzM0N65rbRGhy5boju2D
	6th0NZFq1AHf6dy6gYfesLLHbmwj+8JUeCN4x9bxiVE2tijqAT0ZH0ZuF63P030lQNia53cYFDU
	4FRHKWeaFRVGkS9119dl0FhLr4RagmYVxlbbDOoUzfo4JHkVWm2PBxup5DeX+jF7HMBqpgM9dJE
	/f2hfHzxCNDcoJBDmpgwr2ESpZM6oy8OMZaf+yoPF3tzI22X21OXXnHN/PgiOp1cd23WjuXkfQE
	sTP9yR50NCP+Rwcred7XHaF5kxrxDZ6qh/Tb1cV0aCveA3M6gHLS1/FQYwhv8H6lIEGDCd3UJea
	v0wF8pvx4yf4yrqZLfO4wbhoouCdcSEYmrzSoBiAZtkVVEbcYLmMvRkMGdlsSw1
X-Received: by 2002:a05:600d:82c5:b0:4a1:e575:33dd with SMTP id 5b1f17b1804b1-4a1e57533efmr141959155e9.18.1792491526824;
        Tue, 20 Oct 2026 03:18:46 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm63088925e9.8.2026.10.20.03.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:18:46 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:18:45 +0200
Message-Id: <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Christopher
 Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
In-Reply-To: <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>

Hi Krzyszrof,

On Mon Oct 19, 2026 at 8:46 AM CEST, Krzysztof Kozlowski wrote:
> On 16/10/2026 17:07, Ettore Chimenti wrote:
>> Hi Krzyszrof,
>>=20
>> On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
>>> On 16/10/2026 16:41, Ettore Chimenti wrote:
>>>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>>>> Using same definition as OMAP2/3 except pullup/down enable macros, whi=
ch
>>>> are inverted in this SoC.
>>>>
>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>> ---
>>>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-binding=
s/pinctrl/dm816x.h
>>>> new file mode 100644
>>>> index 000000000000..15aa15bca9bd
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>>>> @@ -0,0 +1,20 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * This header provides constants specific to DM816X pinctrl bindings=
.
>>>> + */
>>>> +
>>>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>>>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>>>> +
>>>> +#include <dt-bindings/pinctrl/omap.h>
>>>
>>> I do not see this being used here, IWYU.
>>>
>>>> +
>>>> +#undef PULL_UP
>>>> +#undef PULL_ENA
>>>
>>> Why are you undefining other macros? That's not a easy to follow code.
>>=20
>> Do you prefer to duplicate `omap.h` defines? Only the defines above do n=
ot
>> apply to DM816x.
>
> Not sure what you need to duplicate, but if you add header with bindings
> for this device, then you should not include headers for other devices.

I basically used dm814x.h as a template which does that, is that not
correct?

>
>>=20
>>>
>>>
>>>> +
>>>> +/* DM81xx mux bit defines */
>>>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>>>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>>>> +#define PULL_DN			(0 << 4)
>>>> +#define PULL_UP			(1 << 4)
>>>
>>> I do not see this used by drivers, so why do we need one more header?
>>> What part of SW are you binding here?
>>>
>>=20
>> I added those (DN/UP) because they are not defined in `omap.h`. It may b=
e
>> convenient for future board upstreaming. I can drop those if undesired.
>
> Just add the header to proper place - DTS. These are just not looking as
> bindings.

Sorry, does dm814x.h not look as bindings? I'm a bit confused.
FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
Following=20

Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20

For a better solution, you would prefer:
- Keep omap.h in dm816x.dtsi
- Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
- Replace defines in dm8168-evm.dts
- Add the header in dm8168-evm.dts

or:

- Keep omap.h in dm816x.dtsi
- Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
- Replace defines in dm8168-evm.dts

Thanks for your review,=20
Ettore

>
> Best regards,
> Krzysztof


