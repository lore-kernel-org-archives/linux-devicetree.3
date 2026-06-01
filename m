Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3CD39BFEF
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308329; cv=pass; b=EMRwAEvhmt2j/HbKAfojrpcWMkG/C5JkTh/wEh091CNBaCTCNWYOYqiJXTI3BZa3iZJ2lSPWIxGA0bDo6xgXlWVcqbOkqAW7vSjnURiNUjKI0Ges6+1sAIgD15WeJcnWJIIa5TagoukFJMLqWwX/1ifYv1Pw4hRMgcQ5qnjXAak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308329; c=relaxed/simple;
	bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ip54jvlpaoIT50FXBiwxkrCtN+7V/TZSfqZjUWlasEHRw7ztCc14H+ny3DjjBm1WHp34s+yIevIFc+2vMMoYfux70kw6AyeIugsxugQ/kcVQC4t1hWMQgv9N5l7Cx9THLKS1iEIFvZyzI/10Lif0zmKfUVpIeSeXCvU6qgA4bwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK/5IGOw; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK/5IGOw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso7635285ad.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 03:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780308323; cv=none;
        d=google.com; s=arc-20240605;
        b=Nww5oS6acdStpb+5Y03QrtMBqId90s31aPmNBv5jvNHq/uRP+mBne/ZTf3eYhpiBWI
         o8JMRvoqqHg0/K3q7V3gH+niVieJRVCTQ344f7MX2nRkOEF4nefjo0YYcwnpGdBZipk/
         Lj5wDyBtE91UFfgTmodUSxYCYXEaEBcJsy6Py1zWuLuPjf9xr2zucBBF7ta3AABGSCkp
         QG+oR7mMhbfrjXimaucVL7I5Drb/Dc3N6rOKf6s704cGygJr7OqIl01+aKnoKOcGodE4
         3mVmv+8K0Bx3BnqV6EK1nxb+mME0jMmZr+1t7btAsqcVGQw1cfT6PeFcOU/22bg2yhPK
         1/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        fh=lUibVxKEKmP/elHQX2VZhS/YlvPcTXgrzx7Yuys+6j4=;
        b=G3GSZW5wSXrxKmNLaqEfFZfp5OVYjyJPbi5p4pe9paSx/ZrjXVQwAtnPGKHUDgPW5D
         UWYkF5hvE0p+MCjoKf0AznifWomtEDs8Pwvtcbdz6g3C8RJf0BIchXEi4ygcPzNCavEz
         WFwgvj8mXCJKq4YybQBBgzc1AirgMI92aPZE0mK6g1LMZh234SC8kkzHP7LFH/NMc/Wx
         jciRc/Uy1bCEXm5wWLsjVIJChnlXXSmzHouFkhxb25p/eQ6fr1Dw6+QT7wwxMr41fqbv
         6YWBxJDRtZ0T3EuiPzCryuT2/fvnw9Qm2JXvGA+b7q8xwhJOXgqSp0uu9sLy8NISdvol
         QG9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780308323; x=1780913123; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        b=cK/5IGOwSQuxlxt0HchblokCewI3gvi+x24drbm5aVXrP9WZ7w7exDF+phC9WBgVXl
         yCbi4X4oJsEp66B+qTxc4rmAHsSwSXLX7JO81BOiVlVcJxAB0rQi838R4dpn6Uc7+Yqv
         M2wH9nY4OQ2RlqkgIp+MDHAu5ANkAP25iM760mVmBIwJC72PoKNATlpLR6NkSwspLy5u
         H5nvleLpI7QMONpkmoWi8Z7MLuqHFVcVfHU5PwEnfsqgUQl7vZHHx3kpoYFxCX4fU1S7
         mCSLHSnvBnsDiewDYEPics9GJg0Qfj2E3db582asltRXGKqsDo4di19V42pJY/3eO4UW
         Hn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780308323; x=1780913123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        b=RTxtl/4ALFu0do7d4qHF+vudrsxU+k4u+GgpjPYAvf1l9YTgDrcO/NsMlgbCNniF1f
         zPEMBtug662IcTtwH9DDm0zfMXti3frRJ9TBMCBUIPDE3gEvpTZK6b2mdY87DexhOkR6
         GEM0oiIxQC4SyM0lkAKt38LwPaKFonxPinmEF07qfgUGBgxs8oi4UpkV2Mrfd9dyARuE
         7TZn/m+NX2DIY3UskOBKiWHA4nX7Q4Vln2q1xIuXN1I8BZ4XRy/Cbr1eBGSL/+Fj0lh9
         XAQ7ep41gWaCltkbBPqbN/MlPGeAulaT/dD8jQ/oqC2wKy/QZrTx7OcUSSgImcRidmTG
         2cmA==
X-Forwarded-Encrypted: i=1; AFNElJ8rZNcdZ1TP+247TQr3hfr7GYJM6fmYbKM8DXzlVX89C0oWfkowhrKniczsmI8YIUVYPw5HFj5kemsR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8y7y8/hQEthCDNXw8mFLpqQ0fHVPVVh2SZEbvKFiX4u5narAn
	tXoggLmtgbFXm2zW4sSybd1dEibD1e6xyw6gGqruYGyja+yK+aum7reeXRu5USAHBToMBHzb2gj
	PPfTLJn3rL4Lg6Ul1fRjhdm3XQVC93aA=
X-Gm-Gg: Acq92OFlICWYnW0urHoFwVRH5HdVN/O2mJmMRWASG1WVTcDkVmWGjpKfl8sNRLAYBYG
	sd2LnXP66h1BY9KwJ8pzR8OjBBH1ztStTiJlYffb2A4qiUZ9PxuoS8RkNauJ1G25Jpk/clBu7IB
	8fIeTN/1e7fAYy54XQC91+dFNkGymVVQpEcPPVTD+ZxjSFBhxNDXY2BeT0a3naJW5mQgY5Iwaxp
	YrTnRxeMZn2i7+96qQl2Ir3dQHstmfj372+xEV6Ib+vQyj5hzzD727DRWbkrfBkTjkNl+lljGg2
	JhKk0AyGdd9ejrw4mxUaBZizGXoaOu5wezam5Z9q3H54Z/8H
X-Received: by 2002:a17:902:d483:b0:2b2:4260:109 with SMTP id
 d9443c01a7336-2bf3684aeb9mr121794295ad.23.1780308322810; Mon, 01 Jun 2026
 03:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522100318.73474-1-phucduc.bui@gmail.com> <20260522100318.73474-2-phucduc.bui@gmail.com>
 <20260530-adventurous-basilisk-of-happiness-def6fa@quoll>
In-Reply-To: <20260530-adventurous-basilisk-of-happiness-def6fa@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 1 Jun 2026 17:05:11 +0700
X-Gm-Features: AVHnY4K0HX288K_cD5Sf10SY7BujkeLaPeGOHP02VGsc25wWrKbaxn-vW53Y2o0
Message-ID: <CAABR9nHh5WbC+A-7KV9jKEUbmK8WHgpf=VUk0DJqFrhhQFRpwg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF
 clock descriptions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your review .

> So example is wrong?
>
> What about all the users?

I only updated the internal description text to match the existing clock-names.
The clock ordering (mclk followed by hclk) remains unchanged,
so external .dts files and the example section at the end of the
binding are unaffected.

> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>

Thank you for the guidance. I will address this in v2.

> > The clock descriptions are currently swapped relative to the
> > clock names used by the driver.
>
> Why would order of clock names in the driver matter here? I do not
> understand that explanation.
>

I inferred that 'hclk' is the bus clock from the driver, which uses
devm_regmap_init_mmio_clk() with 'hclk',
and this matches the description found in several Rockchip datasheets.
However, I understand that the binding should be described
independently of the driver implementation.
Therefore, I'll drop this description in the next revision.

Best Regards,
Phuc
