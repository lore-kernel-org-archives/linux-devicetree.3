Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772044;
	b=RPawTUcDpSV4uSKousdAFTy4vXddsGeLEF5FgL8yLbBi2YIcsGkV0Gw3aw1dCz3uuxbC
	 HB3enpYn20XQbCXAlcrj3piFHcLUbyREb9AtUnvofjZAjidnIvX7hHLdihFXoBkJ+TOpc
	 D5+/Oixo6Fxcs1U3OexaASYrxHfIHauSyblpKLdZU7G/OYYk1ezU1KjhwcUD1pa6izK3Z
	 vuMnEOnvpgb2v8VeDUy6KIWhvc/c+5kTLhQED43i+0BJ8Z+Yn5HE8vXQbcnqfbV8Q8Wmd
	 yA0x8ywzvLSJhEwEBlL9Di3uqcdYOfEWRav3Fsc7SlAcenUNJGVtpIir4e01P0K5fxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
	b=W8AIVq8DZBmsl592XOAC7GEiQDeBL/WAo6M1Z7wwQ2DsaCV8O5M9qFQHpWD1UqRCVOFo
	 bMblNY9jUA+n57KrtAQIGfzz8Y+gogolBJzCtnbjQR+5oPUyDZ3bHIQisMp22JvfUOeSS
	 Tu+J+FUD/GxMPBp1eFYAG5fHyt76Rij+hcxS9NOOoKjashlI49ZdAuOmZK31p26MRDl0P
	 lpy85QdHkXpXqMl1JSEMMBDYq4ysdYjjvUGEDGvdp+GLjuTNUWIIpSbgiFOaD0yzFpItW
	 zovr7yUSpwwoTc+rTD/g7NMtBi3Ni49C0qGA0k4c+j+1J0LuXQoQNDgzFoEDQXXD9Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="nV0+w/3z";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B0A606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B0A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nV0+w/3z
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so10208424a12.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795772042; x=1796376842; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=nV0+w/3ztlgeQuzORjR2dnh44aZed2JE8zRP22/HHWUbwHP+zSm1yZyM8VjGmh0pNQ
         kjgnWkZOEo4Be5y42ZWPGrgkicDWr7bVoeAwh2GR49W1kMDsigxuermYl6vAzk3cRpuW
         vhyvhMMGyLGeokT2gf9bj0QB8oOhXduFm6FeAYvxU2JHEmGleoKRr8frBc4L/CiOqYMX
         BOKdGePRDWlR6j7RUiCLChrlNjzmO38Bi4G6uBzJ6KTcKSTw3ZytjyCoaCNQBu1tEz/7
         YTWaquLX7Lx4SbfCUasGbgcOwmegnpDSBOOEFvfYiXdL7flbNy+npJeL8c/rzjRsUbjO
         LZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772042; x=1796376842;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=MUjZMTtN+7QWB7o0c5xLF6TO3I4GxnzEN/aOJbAJLdTkD9lfqda9op16ip0jNbGu9p
         iwUSmUTp3Qk1uPcTwxI3Qvb7LEFc9SkTXrvKvjzh7dTuZtREjVll2+dN2kdPBUUDFqPA
         dt8UvlTrlnQlpUIw029AGNM9wL9D+eNwOEXpyDhQmbYdEs8EyofgPig3INMH7nWbsgtn
         HT1w1bCqQ+wx3mdWrcB81ATukhcXWk5B3sRwjMcnDUHGewdFluIrFcQTKCHULEKGusKv
         H0YZlrnH+v6+L98KcqYCJfWVGsch09jEz5TaNBIJrvjAAAXNhEpkegDEB1gXSNaoDK5e
         pwxQ==
X-Forwarded-Encrypted: i=1; AL+hErHCwVoH86RtfhxJ588Pu2BUnwyYGjf9jq9xTXet01i3CfOCh15xRZqWSj29e01TM3wEjq1f1T9p6AbR@vger.kernel.org
X-Gm-Message-State: APuU4Z8N/qcAbHLhqbeb+O3PAZJPnTm7+vdE6x9ulPfLVn+VaL0GUwtA
	KfFwemREfT5GC3pz6kq0GwL3XTHXKhRki5TNVzwgQWywLobAPbANYqOIodDaJxZ0/HM=
X-Gm-Gg: AZFdTZdLxcpVrd13uzxdRXMBtAxWjSR48CnfZgjQnXwOI5oMh4g5UkbErh2qcVF63rR
	Ho0ePpxITR9UcE/fr7ggyGmmeppBSSduDjzfIVvUHd/Od+SaVUIaaE5pTizZD0lEnHgcZL85ZVJ
	ch+/gwl0bicSQ849eThuh0yjD5eEgfcfzIWrFKAnCz9e2rlDj0BTLVvRZX+OjQqmIw5SFT8VhGO
	HtRsKagHN9FW6wkSn1qjuV5Y26D8swr7yRChavqQPQJ4kmpkkpyaV65EXBRTxmy1SLsVB1lSq2N
	ycoMPVRP5jQfkMomIyrpSpfWx4u5I8ZGc6wddRWAG6RCTmw4fowggkB9LnRnpJJKPhL6IH6EGlX
	GmhDxnBktrvwzRd64yrZWxA/QFNwROUDljYGzw+tiYKUaZiMRcUtRDm7m7pQGVyisZopD1MvsQP
	k5OIBH9h0cbURXmj7BQaFCLWXk9YCHhNDWfQoKPqXGJxffq0eLVRT4Xr8vMI/1w++66tdzEtnQF
	AZ3FyalnBceacljpEvWbocNncKreKgO7GHKqK1pCF5rcHKQR4FcR0S///IPZm0uwn/VzkuLdf1X
	SRs25v8hqZamj86s1WPTSI2wqmQQBU5jga97MGb8qWvGB5QKF//nsg5DgIGQIka0SDZdTQ==
X-Received: by 2002:a05:6402:2403:b0:6bb:aaf:5d94 with SMTP id 4fb4d7f45d1cf-6bb0aaf5f7emr8353882a12.25.1795772041771;
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm10607522a12.25.2026.11.27.01.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jiebing Chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH 0/2] Add Amlogic S4 audio clock controller support.
In-Reply-To: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
Date: Fri, 27 Nov 2026 10:33:59 +0100
Message-ID: <1jmrquwrco.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 27 nov. 2026 at 17:11, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> S4 uses the existing AXG audio clock driver and reuses the SM1 and
> G12A clock hardware. Pad clock and data selection is done by pinmux,
> so those pad clocks are not registered. The controller has an internal
> reset line, like G12A and SM1, and an audio power domain that must be
> enabled before use. The new compatible is amlogic,s4-audio-clkc;
> power-domains is required for S4 and forbidden for the other
> compatibles.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
> Jiebing Chen (2):
>       clk: meson: axg_audio: add S4 support
>       ASoC:dt-bindings:clock: Add audio power domain for S4 soc

This title is messed up - Remove ASoC and proper spacing please.
Also you did not collect the trailer given on the v8 by Krzysztof.

Next time you send something like this, keep the series numbering
please. This could either be a v8 RESEND or v9. Like this, it looks
brand new, which it isn't.

>
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  17 +++
>  drivers/clk/meson/axg-audio.c                      | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+)
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20261127-clock_audio-76eed7ee7ca2
>
> Best regards,
> --  
> Jiebing Chen <jiebing.chen@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
