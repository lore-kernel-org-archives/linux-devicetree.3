Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB8136A03B
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043724; cv=pass; b=iLx1JRWmT566wu4uym+OT9VtKPGqA4bMOsmhjSxlPOki4phREEsG2jkXDl/WTL2vEhnVdVT+Ge6jeCTHLkTeJG4lXDbzffJan2rrQy6rCKack2T2+4PUUaNxreyEhdS7dx15sCjqHiLTH/cAvrgxfm+LiyzZPyEXdrWAH7vUkZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043724; c=relaxed/simple;
	bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiZC+ZPt8ld/4UOOlwp46pevfs+VYxwr6nvqtVvJh8WXRKUjfd53dTIZPLJIUEX3DbEONLoqCxIAgiU2wS1K2s3MXS/QroO78xRumDSV4NLf2iedoQ08Rv/pS/dz6c1Pk8dQBPcpGJLENu3lSPqo8nRRlZsBaU51UkKR/9e2cpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BR2R1v0e; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BR2R1v0e"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38ad12fb595so7686851fa.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775043721; cv=none;
        d=google.com; s=arc-20240605;
        b=fPTjutK0n70iog18ecL0Ui84fD8I4Ef8SYpJutRZfkJR1bdA09B+gXGGRHfq8nFafE
         f7JUXdkzxunPYPUSH4tI3HzbXdoykbFLitYXA5z+sQESCeb8Pdw6XMvx67BoKbQQ73VA
         j8H2bYhRaFfaYTBpRQMDdv613bk2m3tkiuMV0BFpVylt6tIm9Ccu5Cob/ZQ5ZEwWaGxb
         yfgteUH3kfFOiv7T9OKJKQWgj54BOnOzwcZXZKwwrSI6p4cm97+LDFYB77cxBve2p0Re
         NjLbtxHFeXeSfA8kyw6Vi2exaU14PVJwkXj0qNH/FUKuahehu5P4p5gBOFvh6KYCBqLD
         ATSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        fh=rYZ2iLOzSfg1VEQNJkqu2VW2e7LUzE0SyY7i3u8hNvQ=;
        b=ApeTcwvXPnRcL6rBoRKwmK3tUBoUK8kF4dbvsZCLxu1ynxYZ0y52OzhdqLG28MSJuj
         nhYd8tCsKo5CBuN7PA/8ctQjw377bZTVqTFjTd+deiIVF8E7q0igsm1KEhttq/hDz5OC
         Ui89RoT5bsCaN3f53LhFTX/HLNBT4StknrOS2Ow4kUIefJEw+HM9wtUG+qmTW4Yp5yj8
         MA85bmaDSQLAARbtlRegb8Zg96UEQ3MfFtcZSg5UlNrmauz3dp3yj94WNANSWbZeIv6K
         iEQj9G7oz9lWfBLU8sd3or861vxLasFTr/WTkbXPPbq3pmsoHAcfsN4eysgRHl6Lyt7x
         EIqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775043721; x=1775648521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        b=BR2R1v0e0PaGNJeS1VJkA2AzBVblBa7e+P4LYXlp/xUbfOh4B4zcznrJuYV6FlyDGM
         +DoPIdY25DO9uBhPM0tCiaxh4WS3ohjSsBt1i3/0yeIpcOHMXBPNG6qWNLriK7fOUS/w
         U+YFVGRqPoDicGKLXANVVHkrxU85qIZxxJapMlU0Ezlc5lI6UKzkiREo4r+PXTHdy9im
         WwWI5rYjnVTb6YOmGEVGu5l4slMQAgAne8qAk1p4BXhanDYgzp4xBH8XArkzR3UGs8Hu
         YwJoDivTehJGoyn/pPPF6BeObx8Bau9C6fbVhMWWIsvSlZcW2VUWtRX2RzEWGPUU/lpl
         mPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043721; x=1775648521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        b=E3Epw026nFkdqltSgGkAZXdlh09MznQxuzOYixLsw2ftvV1OrNIhhFfbQWMmvt31iy
         vesyxRnl9IlR5gAX0e706UcGIYV+LRARDBgg58XljOjBLTWBzqxHllNSZP+JYAGnSEkW
         1vhfTgZya8MKMnejc+DllWVFLqDFKtL5AOelwKd2BOej4TZqNJHvuhGeibFhTVnmrsik
         U4B0suKvH2z7GqB9H1lZoP2dk2Rgj9zdNp384hizochsK1Pb9hVfg2Td41YNniT+maiV
         WPktOHA/nrTMdHxhXHFvfOSaNW4C7bLjIfUB0LQ/Cbx+12ASSRnyG0CCCCaTHXseADyt
         uHNA==
X-Forwarded-Encrypted: i=1; AJvYcCVP7LwtfmtIQ3oayysbSHnxXmHHiO246Q194/c/G91+zQVbE9EFNI6PWHuMiKYqEGfst8U333ex6wwD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6PUBGCBXeBWiRWVzXAkUsQa+XULuj0H8a5CD31D0u2M2SVwlH
	3xkMQq451mXgPZxD38bVbiYlZu84KWadanZwGGvKWZ75C4i10m0v8nYdK8msybTYuVpV7SEG6yY
	Z2IWJStCz+5oR9WNHWdXdVPaf8iLsygHH/oVi6WmXtA==
X-Gm-Gg: ATEYQzzzLe+gtOfhIf/QYHkVxkqKC7CBkVcimzTtkr5lFfbfOEn3zHb6La8OrMEi4is
	6OV4LbzVcQtaKkf9aqi2FsP4Box4ayfUDn9111ERAwgF15JBI9jcWgiqr3Iqt3KE1vSHkJp/fk+
	/NXsZ29O8RII+rKa3PEUhCzTMUtDe/Gtg9oT6R5C5yu2+R+U/gT0ozSISfzocCwpmZkpBfTynZw
	ILVDkD4qqy/41yuhc0dubikQVQFMCjnqRN144jyDz5ppsS0SniB+DQsXLLlFBv9PaG5eP8ERJOg
	Zby/9akq0eYpTBw4DuU=
X-Received: by 2002:a05:6512:1048:b0:5a1:1de6:bc66 with SMTP id
 2adb3069b0e04-5a2c2204c2bmr963346e87.18.1775043719389; Wed, 01 Apr 2026
 04:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com> <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <gX7v5Lyaw6K_7HLFrWAPRIukMU5BJ9bGDg4RNePhYxZ4A9KcMe1HWULG-XqG1czNCzN3e2BMPQV85a2184NwPQ==@protonmail.internalid>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com> <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
In-Reply-To: <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2026 13:41:23 +0200
X-Gm-Features: AQROBzC6yQBtymEM8RF6AwP2-8_VypiX8OajhW6JswzQtD6SYu97waxO7DoNljg
Message-ID: <CAPDyKFrkVbvZcnbhxbLqFySn4V+USCKAjooT3yXN56jq+D9XGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 at 12:58, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 01/04/2026 11:46, Ulf Hansson wrote:
> >>> The intent was for this patch to be part of v7.0-rc1, but I failed
> >>> with my pull-request to Linus.
> >>>
> >>> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
> >>>
> >>> Is it possible to drop/defer these changes until v7.2?
> >> It would be very sad.
> > Right.
> >
> > Since it's my mistake, let me reconsider. If I rebase my branch and
> > share the necessary commit through an immutable branch that you can
> > pull in. Would that work for you?
> >
> > Kind regards
> > Uffe
>
> Yes. Please go ahead.

The patch is available for you to pull from the immutable branch:

git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git pmdomain

Kind regards
Uffe
