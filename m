Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498618;
	b=wJTBOpPuwUvJSZeearvQrjIjH0km4zMO/s1apoEl9A10BRDuHCiUnVV+Dx6X4PIPyVPB
	 tA925HGyGsQ5Xb9qHoNCfrYg1uuJUORS4q5DlvFChVHWGBA6jGExHpJfXprITByb0QdzT
	 UkNtfyf3m0NGjvgoblE5mSUFXL3lO/+0Wp1WvTIZAzgByv5p5ZTQmleWzDYsqLcN70fRf
	 DoYPBlDA5Hl9ld4KIL6B3C1j8cAeIYqwJygtNOTHkZyjA3evLBGi9GD/YJqiH5agHJWXQ
	 JyRHEFnoJ96OikoD/Fn0P1ZfbQlxAAh8ADFrjsE+3JJLASHfsBq1CySN7mTERn7dljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=;
	b=M29ybloF4Pg4cZ5fFQZgPD64L54WREM7XqFBTTMTcaV9F5Mwpx6cawO1rC5+lvRPl3eH
	 /ckwfno9rXefjjalygiSwp+iSznijUBDuUqSsS2fBotoP57QMLBydPPnInOYLp5h7wUqz
	 zHB64jDsIIa3AaMLzJ07hz6EWbmkNhk5YwU+sh37jiSktPQZPM4h2wu4KLsFNWLR8WxVF
	 rzBpvdfpGhNputSq9xjUhPIaVhZ1EN2FNfD9lqTEfWN7VaZp3mUaUq9b+CZiVzBAC2xET
	 Z+XaxoZYGkA3OJQZGisdCCa+tUxI8l4tZ+qLhKwjJVpuQvsrrEBYRGTbxjy18uSf/Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XyHuAhl0;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB7606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65EB7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XyHuAhl0
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2025089f8f.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792498616; x=1793103416; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=;
        b=XyHuAhl0Ihg3o9iu+ZV6Mt5r2QN8C7rlBmRSdsYa81fuHYYZSOnxDoWvNIgUGEawb5
         ivqJTz66q91RngbDRNkaw/L6s2z0qhycRZKq/kozmieuzZapGem71jaX7SYHApsfagTz
         4zR2KY99z3O+t8esfmsuWCjBNuGsxl6VUO4nDVrAP8rye7FNOE+vgnPIh50J6KDdzc/k
         Nm89xIfOb0YZqt42r+owb6SzMPvl2ABryPkIwTo0aqTRszI/FBNXH8EQKZJgnPGidLo+
         KWnqS5fdtOfVIkhqnTdhEBTbTZ0aZHJs5bXoFpo7hzyA/qQg/7Ks8sGk3Bgr1nF25rss
         VinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498616; x=1793103416;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=;
        b=sBqyMovoUC3m9857i0LBO61+Yhs6MGiY3I9NNt/1kjqj5mgt4q1jV8pp4FPFjC25n3
         8ojUZqCDdFZCONThhy7DHzBUwLJl0mem0cJCMqN5Hl9eUcLHTkN38ZmBzkJl1odH/p32
         Nvmi7esmQn3lL5MidYQkfMXUA+6Y4J/YddswTSh2CLQopXrkE5v8n6k9jUhihvKyQ+a/
         WGdde2ALx5t4QGAWei0ltNnCzG3SGu4sINnF9/osN56KkFyd24FjMqv/jx1fJnVSfKYb
         C7k/2rwKdLx3TRGmPGlkL05/vxN7cQ2oyzAK/BpgAX3doz2oXfZX5orZAD6DiTaZwhqM
         cw1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxvwOOzoChNsHnt3x4rwZUb5T3/XNLLQHZ9fGOEuLKbfUDLkkZ+jYlWVo5VFiDfsP2BlaLm88M28Ex5@vger.kernel.org
X-Gm-Message-State: AFq9FYLvHE1pltZUFSoPzIRP3kI0rAvUAcLq94BwmJk1Hww7hxWKWzcV
	gURlEClG/8Xyq5GiMv6JWz7N3qzAGFtESwDlfVBFxxutRt0MmXlBOxpXl0gWw1KVoFk=
X-Gm-Gg: AYBFou0Q9pFGhPJ/yEKksqcNOTYZm/uMbfSpsVRg3gWb7g2LEzbK1GWcWCZ77dqyHW3
	1+GpY7uXKDMg2X468FDCqzxiIFWLLP1hgSu/KQK7pSg40Kdes21CBWwTRDIxqq87nfoNAFqm9Nb
	ygVibq3YS9b8+0JbmfX5A1nNfnICeGum2G2iejeMuGKyfFqvzdjhJlnxATdgdSOgcNQCdj5f6Wg
	gAwcNtZeSxisDXrVWOEB3Dr61ViQH9T1PoBN5uBCJ2035Tp6mDhpZRygyzHHGPwB/+QaHEiC8dg
	/9/8bqldBTLklZHAHvPCx0P1QRLTRsMkip68Tat/1UdiXOQdGFg/9qTPVVzgLHmUcXla5PYiTZl
	a9LcHaZiiL5Wavj1KT0PmgW8zciihudJkbkKfdjwZeN9V0dyJ0hLuP2R8C313XWdQYNWPShHqPr
	P/STI/bB1B8uOFVDs6m5OZ2zZJM+5qXj3EJ6w8JBoXxUq91u74g2KkscZSs9iWGXcaguxIdRlif
	Q/wiogBq9Ce7mQtNcCojaYbVjcelnD76mQPw7MJHLsHbcdYLopW8e/S/dk/vNDdB3zUHhYWJIc=
X-Received: by 2002:adf:e001:0:10b0:48d:f876:f370 with SMTP id ffacd0b85a97d-48e1bdf80a0mr5011790f8f.48.1792498615536;
        Tue, 20 Oct 2026 05:16:55 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d8bsm5130862f8f.24.2026.10.20.05.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:16:54 -0700 (PDT)
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
Date: Tue, 20 Oct 2026 14:16:52 +0200
Message-Id: <DM9NQ6MMED9N.3QP4ZDCCAZ85Z@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
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
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
 <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
 <c91b063f-69b9-4e9b-8e1b-af503de672b7@kernel.org>
In-Reply-To: <c91b063f-69b9-4e9b-8e1b-af503de672b7@kernel.org>

Hi Krzyszrof,

On Tue Oct 20, 2026 at 1:22 PM CEST, Krzysztof Kozlowski wrote:
> On 20/10/2026 12:18, Ettore Chimenti wrote:
>> Hi Krzyszrof,
>>=20
>> On Mon Oct 19, 2026 at 8:46 AM CEST, Krzysztof Kozlowski wrote:
>>> On 16/10/2026 17:07, Ettore Chimenti wrote:
>>>> Hi Krzyszrof,
>>>>
>>>> On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
>>>>> On 16/10/2026 16:41, Ettore Chimenti wrote:
>>>>>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>>>>>> Using same definition as OMAP2/3 except pullup/down enable macros, w=
hich
>>>>>> are inverted in this SoC.
>>>>>>
>>>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>>>> ---
>>>>>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>>>>>  1 file changed, 20 insertions(+)
>>>>>>
>>>>>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindi=
ngs/pinctrl/dm816x.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..15aa15bca9bd
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>>>>>> @@ -0,0 +1,20 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * This header provides constants specific to DM816X pinctrl bindin=
gs.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>>>>>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>>>>>> +
>>>>>> +#include <dt-bindings/pinctrl/omap.h>
>>>>>
>>>>> I do not see this being used here, IWYU.
>>>>>
>>>>>> +
>>>>>> +#undef PULL_UP
>>>>>> +#undef PULL_ENA
>>>>>
>>>>> Why are you undefining other macros? That's not a easy to follow code=
.
>>>>
>>>> Do you prefer to duplicate `omap.h` defines? Only the defines above do=
 not
>>>> apply to DM816x.
>>>
>>> Not sure what you need to duplicate, but if you add header with binding=
s
>>> for this device, then you should not include headers for other devices.
>>=20
>> I basically used dm814x.h as a template which does that, is that not
>> correct?
>>=20
>>>
>>>>
>>>>>
>>>>>
>>>>>> +
>>>>>> +/* DM81xx mux bit defines */
>>>>>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>>>>>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>>>>>> +#define PULL_DN			(0 << 4)
>>>>>> +#define PULL_UP			(1 << 4)
>>>>>
>>>>> I do not see this used by drivers, so why do we need one more header?
>>>>> What part of SW are you binding here?
>>>>>
>>>>
>>>> I added those (DN/UP) because they are not defined in `omap.h`. It may=
 be
>>>> convenient for future board upstreaming. I can drop those if undesired=
.
>>>
>>> Just add the header to proper place - DTS. These are just not looking a=
s
>>> bindings.
>>=20
>> Sorry, does dm814x.h not look as bindings? I'm a bit confused.
>
> I asked  which part of SW are you binding. There was no answer, but
> question. So if you cannot point which part of software you bind, then
> we can assume it is not a binding. I did not do any extensive look,
> because I assume that contributor will bring the argument in favor of
> their patch, not me.
>

Thanks for the clarification, that makes sense. These macros are only
used by the DTS files and not by driver C code, I got confused by an old
header (2015). I will drop the dt-bindings patch and move the
definitions locally into arch/arm/boot/dts/ti/omap/ for v2.

>
>> FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
>> Following=20
>>=20
>> Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20
>>=20
>> For a better solution, you would prefer:
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
>> - Replace defines in dm8168-evm.dts
>> - Add the header in dm8168-evm.dts
>>=20
>> or:
>>=20
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
>> - Replace defines in dm8168-evm.dts
>
> I gave you one idea, but feel free to implement it in other ways aligned
> with that platform maintainer.
>

I'll do.=20

Thanks for the review,
Ettore
>
> Best regards,
> Krzysztof



