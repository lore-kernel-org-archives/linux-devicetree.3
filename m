Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414DB26E71E
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 03:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901712; cv=pass; b=aLxUuj3Ao6j9T0fduPVKOOHtsRqFodeQ62TWautSK9KyYSqW+hvafq5ZqJXq5pA7PgB4wVulfL2rGf9F37x8QNiK1B9m8ulikZBYd54Y7CFhfjMtHq78a2aT/mzpZA0OKVjSrt0Rt3xKXFO4t6MHsGAMbFuITWR0bhWjwRB26cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901712; c=relaxed/simple;
	bh=IC37ysMh6ZKiMmXZQoVdT7RLjzLigmBICjngmFTmRM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CegOhTeGKesb4ttXnE+137XWVzZmQqg0TUDDIKWT2MK3ASdj7P7PGnkNVHnUWL/4fZ9SLMOYfcB2fjsHu7zPEuE1s6+wtAfB2lH2Wo+yQXRfksY88lGq5wuS6GNZmlJXcacrW4BbEDAAyVyuI6ImXjW0seTJCFaK0SELtywuzvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbukQXL6; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbukQXL6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f6609c657so202341f8f.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 20:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785901709; cv=none;
        d=google.com; s=arc-20260327;
        b=Wv8Blu7DDDKPhmairibUC36o66V4MOQT8lp3jNHNBcVFK5RA4Z2CDDRPLK8WqvhYEY
         TdHN30rAcY8zWR5BlV4BL/nUIQzfgV78eMQyYaey0XonFONceMaj/YRla2OlI6MPZ2Wq
         fhXtpgM8/6b9ywLFtaeXEiSACDki02zIBB0gwhANP+RcH31TwyyrfmHTOKlaK3Jupeol
         OFgUsCpUi8J8HPf3m927JgoAhaTjfANNvsq25Jon/R7Gu2lrGIhn1Ila3sP+onnqDnDR
         2/8LD5bw2ECCEZyWQASy+hAHx9YTF8MJsiNz2jvMEk4u+z/+9ks+GYgllDAATfS/khjX
         ilQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IC37ysMh6ZKiMmXZQoVdT7RLjzLigmBICjngmFTmRM8=;
        fh=mC9l1lyv0PK/jh5/UJR4oHy60KKsbMQaBHv00L6ZYFg=;
        b=h74qFAvt5MGfMFZ1TmYfT94a/K7MZVe+Yw72qmyjUD93gZQlUnUEDSnVyJrS8ikvJs
         gJsImxdkGP+ceX/0cn3V+aOmsxq7oFTFBGX1Y6lFBRTyExp8sKC95ecmRR1xXyRJVwJg
         TkYlZ1SkQL0JOq/Vs0sM7c8wjpJB3E9YNGr11CCn72ructUi0rH77tex+fRK3JgSuBOR
         h8YWC0QXfGqlTXMNTn17EUAk/XjZhxLbqihKDyUCPakKJKfKCDmtTL9gd+SWh5t3fmrs
         k8KNQpGdPgamsxBq4mPdiTOKDOj2JnodmPTIQkUy51Mr58BkRTjbIfZpKQphIUCrla6H
         Talg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785901709; x=1786506509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IC37ysMh6ZKiMmXZQoVdT7RLjzLigmBICjngmFTmRM8=;
        b=AbukQXL6JY06PQ55M87qJvKRSGPZCqOgxWtx2RNSO5Kk6BxCSjjmkfybz7CJaacsIY
         8uDmy+Ynk8eUeJ/xY3tSpjbbQDXwE5EUu4Vcr5bLAav37xixMCFoy6IFKVH5+cV7do8K
         Ra6ywTLkRhACCUg5vZQ59xrJ8lWMJL09RDsIeBf38OmIS9wKDAfPw3vDGZjHE3Ble9UA
         vW+xL01L+VSBFgZCUvP/mH+TGIF52iZl1wU/vVT36e7qj8THjymBrE/QQoLgs05WqexX
         Z7TqFY6Uzy+7/YdC3F2j/2z3+oasw7tB62AOxDp0qb5K5b0uqjrE+u7Tu+enOVZmcY2f
         nvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901709; x=1786506509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IC37ysMh6ZKiMmXZQoVdT7RLjzLigmBICjngmFTmRM8=;
        b=L9T/rnti16wXJ+TZ3FCN4eh/V5pXAPF4OsCfUWeQjBGncJlq7Raz6QznOBsNKMs9q0
         df+tzUruKWpjs3dtoP0YbNlVC/gDE2h+s1nFu23y/P1w8WQhrZIoSd6nnn7bRtcFM9GP
         QgKeiVocCRd3nnIuv9TCive0NMGDZb+XlqceMfAZW3AW41/GDQC4eXGr/DRjKJ3IsXls
         8cueIb1SI4OiNl8yIg5BNl9xR8nM39Psqwe4AIf5AUwe7wliOveot/cZxCkhccqfyX9r
         jlA6umZ6IPzbF1LPzD9SaqfHZYyROtpfLno1aUjaGmCQGzZ0sRKTSDX3Lvza3XWh84bK
         Q1Rw==
X-Forwarded-Encrypted: i=1; AHgh+Rol87pzPX0mjaO3rfO03qj0DgKLolhlHfbopo2UevtD1klTmZF6tjlyYSORbb8Mmb37j8EWk2SMEkKr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzizv9pHHIEBplAKFT/zjwJ7IOn/ewvK1f7Tx+oWWNl8rCMINkW
	SsKnTvq+4GD9qjx68drVoRUuf5vOBsa050g3SyjouYHk5K9HcYd8DYbY/Wbp9rNLG+gKw35c8C/
	0KD5nj8t2DNvKgoWR9sg/PJvPKWLrV+gtIg==
X-Gm-Gg: AR+sD12CJsWmTejtu0nRkgpUGjTS6wpaLEv0QeM4rpsHXKERtnW1r5ezbu+x77ecfgn
	SlYuB29YU4rWiHnspuN0ExQXcc+ffhyxzyaRSqdhV7W0MPhh2mp33qh8Z4uDvigwOIDzMYjIBi4
	gMUEr7Jz2rs3PfJM5SKhlFeji8mLsZWO6vHTRSvXp5B6IHfJEXTZHPHnYE2cyq4rrHirvaaDmgq
	+HP1ka2vL/ksTuJycQ30qummhN0xRHoRWUo1tT4c6rs8Q4WV4mFMprMGviXxlqT1/7/AqPSeR+3
	vnS9DkE/YAnqTYRlrMDehd6Jpv2BWBU6UQcOZRoDlGxWNzAiBrXhnQIVcUqbpFLWvBYA4pGNoeT
	3AiAvgiBIx+Ok
X-Received: by 2002:a7b:c408:0:b0:498:ee7:e403 with SMTP id
 5b1f17b1804b1-4994e7db010mr23612565e9.19.1785901709391; Tue, 04 Aug 2026
 20:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com>
In-Reply-To: <tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Tue, 4 Aug 2026 22:48:17 -0500
X-Gm-Features: AUfX_mw42ZkfMvaqB3cDywMHwxabaZ-q76T8alcxd9P7DU-SEanTaAyKauHIg34
Message-ID: <CALWfF7Ly=o85=ZQ3Laewe5VwW6agHLvqqSPKFDzcf75UWYnP4g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable the NPU on LubanCat 4
To: Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 9:49=E2=80=AFAM Pufan Jin <2254650260@qq.com> wrote:
>
> The three RKNN cores and their IOMMUs are disabled by default in the SoC
> dtsi, so the board has to describe the NPU supply before they can be
> enabled.
>
> This board feeds both the NPU logic and its SRAM from a single RK8602
> output on i2c1. The vendor DTS makes that explicit by giving the same
> regulator node two labels, vdd_npu_s0 and vdd_npu_mem_s0, and then
> handing one to rknpu-supply and the other to mem-supply. There is no
> separate memory rail to describe, so npu-supply and sram-supply both
> point at vdd_npu_s0. The binding requires both properties.
>
> Neither property is what actually enables the rail: the rocket driver
> never requests a regulator, it only takes clocks, resets, register
> ranges and a power domain. The rk3588 power domain driver marks
> RK3588_PD_NPU as needing a regulator, so the rail has to be described on
> pd_npu, the root of VD_NPU that the three per-core domains hang off.
> This matches what rock-5b does.
As you mentioned here, the power domain will control the regulator. So
please remove the regulator-always-on from the regulator.

Jimmy
