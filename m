Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793890154;
	b=byw8L+jhx8PO9p+zQbddINgpZtVDqS23yzgB/0eSdapdq7ebt3MKGgRbG4YZziweWAsU
	 ktiPrsDDJBQjqzruHUeA6vgPfRrSuGA2TUekOkpPDyoBa9oN+pbc+Lhz2Bdwtynm2fEqB
	 MPtnee704+t2rB/t9uy9Q3lSrncL1IgVJW5Ny6Wv7bsEmik/o5sMG5+IdG3Dj3yUpCFlU
	 rTjiQDL396L5ORvF5h95sk9+Vx9UH2OoNcuFGTrMeuYEDpTQ3ITw/+3wBk2JPaI/5Wy67
	 0jADUzVdDzp82Wwy6wBl8bG5IoNN6w0Ow0YLVkyi3Eb0upDqzfmjSDdbY0umJkXMd2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
	b=0qT1m7eLj/H648sO7zwAK/PNY72DbEtzw8/1rD8fR7XXmeoeVaTl8h9M09Zp0j63wMqI
	 XlO59idLK3BFoztuQAEiMWhJNy0jm64fi1KL+GBTKXGsEDZ+WpCCn8WUk/ijhF6gLO4yY
	 0uaui6encsL2Xp2s+fwjFzQvcmSF10tYEqy63NmkKYQkNSlfy6iRn3luofW9uncKdDhAz
	 AB6JHlVfHkVyhIUUtK67BrGgfeEX/PsP+UgmAHcG07DP60qgB17mca5MFkB85i8feDWfx
	 QRbMLOZQYYfKu2beBxUdpwz4k6asNYpuJCLIaz27AfSUdOzwt/nYMK+yZXhyau0RjoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtCH3TRq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D26606A332
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D26606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtCH3TRq
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677d35fd1d2so2243836d50.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793890153; cv=none;
        d=google.com; s=arc-20260327;
        b=RayJFFBCQEsqQDSScFEyapyIMiNwP+0emfAOlr+hCwVkVgqQxnsk2ARRGa4tXJu4V2
         WGDS+lYP4mfEiwo8XjMu5Cjw66l3BG2WecXcB4bPYjmNOnm1B1npg+VHWaKZNJmygSbv
         QTaJqs4wxyyRyJElfdMSzq9sBpokefA7lCg7RvwcfBzp7JF1z8VGVaBp8b1y2mwm+znN
         nLBAnEEik/7liEuP+mXQTqhb6bM4OQ60zfdTrEFSKTx4YJuV5dWmItdM0OSsE6d94JyF
         NxUZfGGcWFLwtvYM3ZexpdoRNI9r8p+u+ycelnHR3wJJvthy6L+2EyCHF7rZTmcw1YX6
         YGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        fh=98uIrIaCzMCiDTA+on1+JP9z3nNgrI+HdYHgvQTKO4o=;
        b=dkCT7kzJpyU05nUSoCCPN85ProMlv/iYeDvEBPQuD4xq3yT14tFk7Kt7n+UBB6bY2f
         b4x0I4MhA2j6ig2FKjPKd3qCnKNRaPorUsdtkoOvel953kihTs3/su6yVvOb47Gv3EXX
         r8EXTunoZZ/0w4aQzesN9FMmhlyQfsbqLtkIayLa8NJ3Qt/NYFSl3aqPjWjrLToMhBIa
         sBoh07O7uufLC+Sh/isQmz1y7kWBi8D5t97EF6HAJrrOXH7Fu2r1lydBmg9KVvgz0tnL
         YehAMXuPobJ4Jdp8CjiB5TqHBZUjWvqnbFP0X0bMTYFa80/+LH6ImtyHfB6VE903WSfd
         Qjgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890153; x=1794494953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        b=WtCH3TRqFTYythzQ0H1Y/8kQGCd68gJBEz3yDB9QLQZWGRY4Kplm155FR6u2KtjeV/
         pUVI3hoIhYCRDOR9kuu9ty/lSZqKBrls+8ValTsxkcy/gQM2b91Pd/VKZMoJ4GbIFODx
         E9moLGE4AosxcDPl/R6QUfpumW2EM1BikvniNbrb1h+ETNrJtKQiHEVkm7n1UfB6/k0w
         RKjX1jBm67t3t9yanWu1KjBBzWB1HQDM5UpiMZHKsNtBDJt1d6wEPn4ErrV3XwsCfK+B
         gQELKq7Eg6aZTaDfhho3gAeSn7RgGqstT/KkwcO9s0IgTZDrCW7B5gXyTf4vdXZh/SnN
         jIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890153; x=1794494953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        b=wyq6PFQ+kC+PZvjIrMFXyv37ObFXqi4m2ewJBwRHabE2B5fo2GE/tinT36O294vdlV
         BsGheYHkfZPeHS3suhe2EeCLTh1F6KZEOo/BKoHdvfUg4QKPvEbP97UkZ47KWeSjK8tR
         l8JywivTea1TXxL9tjZmjAjr3P3Lrok9M4ydqk/+P2Xp0y1EIP/dsiU/6eEuvdaf9EYR
         lDB4ys0pw43w9jk3ICYoeIXOANLQ2uzxpTa13eYneNSt/7weQx9la6H7H4iV7rq9Ju8F
         kO2MxTHNcUo5r1GYximl/g1tc11hlMxdlzqRCVb5N9P4TSTlceGA5COAggV9JVhWXKxP
         RecQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXjCLTg5OxRejpbjFyLe6MgEFhmhYGpWRj1uD2Xyit8R8q0mlri0Y8fBpkCWUvqnOcPKKTXvWap3h5@vger.kernel.org
X-Gm-Message-State: APuU4Z97WNPs+2nlRWEWfgUDcIqWyd1bFaGvY+RU+lvit6wtt9E+Uvu1
	dqX0nSIc+Al6wWULitg+nak4wLhO+UsWsIy9RdWEEPUWZVd6tTr3Nu/lwYxloNsENdUxQj+qKWB
	gCU2ao7TF41/4cKut0sGK6g34amMO0A==
X-Gm-Gg: AYBFou1YRNXXl0UmPysm3UtQZuGbuMETARz+10Ys1YC2QJZFNlvgLc9AwxtPtnaMs5I
	nGXiMnqiWPdv0tq+1iVrSz1xJsaSQ056ZHSuTSYZBB9tzgCQqSVd+VvV+1w8jX3Q9T5rTzjAYru
	EYqWbsNKliwYsrH55hsoIj/mEY6Fiy9MkPm4n+J2s8thZcT9WkIwjtIAM4iGZmLdFzuxNeorbCo
	9oZgOAjAELHtzzX+oVI6ms91jPYmNVA7mVcb5J8grvfwYJvJS4zgOs02zaI2BWgmBun9C/WomyI
	iTr6tc6XlZwp1mBQ9mhkcg0JWxKfFI8wZSbS/Rsjz1OlpfReWTID8BhA5BTA55ATIz9mRg6SVe2
	Gz2FyNEWzbBMx+19BP5zDcwOLDyeDdGCjzEMDZretC+/xj1EtaHmV5U9WkWfQRRmxCmF7rjabPV
	hOk13dzgmrVnccH5o=
X-Received: by 2002:a05:690e:450c:20b0:67b:31a:9b7b with SMTP id
 956f58d0204a3-67ba4fa40b1mr7256109d50.33.1793890153050; Thu, 05 Nov 2026
 06:49:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com> <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
In-Reply-To: <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Thu, 5 Nov 2026 08:49:00 -0600
X-Gm-Features: AclHuK-SbGVRFFZQFk2Ozvq-Gg4EdtItrFF8Dqsp7Ze5suIdv9U1RHoClLmzyb0
Message-ID: <CANxy8yTiJoGJe5uz_R5hTdmT9A8ZsxAphB6qWSB4_SDuLSHSaA@mail.gmail.com>
Subject: Re: [PATCH 0/6] sunxi: A133: Add CPU speed grade detection and OPP table
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Cody Eksal <masterr3c0rd@epochal.quest>, Alexander Sverdlin <alex@sverdlin.org>, 
	Paul Kocialkowski <paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

Thanks a lot for the quick and detailed answers!

On 11/5/26 12:30, Andre Przywara wrote:
> So I read about the 1.6GHz somewhere, might just be a marketing claim
> about some max frequency. If the common speedbins do not support 1.6GHz,
> that's fine, but apparently some do, so I'd keep them in, for people who
> happen to have those SoC revisions.

OK, v2 will add 1608 MHz for b0 and b1. The SDK table stops at
1512 MHz; 1608 MHz is only in the table of the factory firmware on my
board (its kernel was built in January 2026, the SDK import is from
October 2024). I compared the two tables entry by entry: the factory
table is the SDK table plus five OPPs, all other values are the same:

  1608 MHz: b0 1.18 V, b1 1.13 V (max 1.14 V)
  1416 MHz: a0 1.18 V, a1 1.18 V, a2 1.13 V

Should I add the 1416 MHz OPPs for a0-a2 as well, so that the table
matches the factory one?

> I think if we can be sure that the current mainline OPPs still apply
> with this series, that's good enough.

They do. The series does not change the A100 code path (patch 2 only
moves the cell reading into a helper), and on the K5C the patched
kernel with today's A100 table gives the same OPPs and voltages as
before. A 6.18 kernel without the series and with the new A133 table
falls back to the A100 selection (with 1008 instead of 1080 MHz).

> Regarding 1008 MHz: This was just some frequency close to 1GHz picked by
> U-Boot, that should be low enough to not cause any trouble, even with
> the default voltage. How critical is this "unlisted initial frequency"
> message? If it causes trouble, we can add a made-up 1008MHz OPP with
> some safe voltage, otherwise I'd say we just leave it.

Not critical. It is a pr_info, and cpufreq switches right away to the
next higher OPP (1080 MHz). With the A133 table it does not appear,
since that table has 1008 MHz, as the BSP does. So I would leave the
A100 table as it is.

> So like for the H616, please just use the SoC ID call, that's a clean
> solution. Maybe just make sure that it can fail somewhat gracefully
> (read: not crash).

That is what the series does. Without SOC_ID the driver warns
"SMCCC SOC_ID not available, using speed grades a0-a2", falls back to
the A100 selection (plus the BSP's a0 rule for normal parts) and
continues. I tested this on the K5C with a test build that forces the
revision to unknown.

> I think some of those handheld gaming consoles use the A133P variant?
> Maybe there are some tables in "their" source code?

Good idea, I will look for those.

> Thanks, I will try to get those logs, I have the Liontron board and the
> Teclast tablet.

Thank you! I will wait for your logs and the other reviews before
sending v2.

> P.S. Since you mention the KickPi: can you please work with Paul (in
> CC:) to upstream the DT for this board?

Yes, happy to. Paul, I have a K5C DT that I run on mainline kernels
(6.18 and 7.4-rc1): eMMC, SD card, USB host and the PMIC work.
Ethernet needs a PHY driver (Maxio MAE0621A) that is not in mainline
yet, and the Wi-Fi/BT chip (Seekwave) has no mainline driver. The
"kickpi" vendor prefix is not in mainline either. How would you like to
do this: should I send the DT with you in Cc, or do you already have a
version I should build on?

Thanks,
Rajan
