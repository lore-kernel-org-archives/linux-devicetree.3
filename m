Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC8931D381
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138236; cv=none; b=JJmeIvyOtAhWDvjN18oGVBnAW1tXdZ89CY52YzWd5h3gFSGBi5TOB8eGzsMGfXJbod2IZ4f7L1S7aObvj4mxDgdySmKKhNc2P4ZH3wji81qluflOK723kQsTzQZcr6jIesIF+9Ghecb2hbwegNivTfKqLYnP8y1UeoqBONnYQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138236; c=relaxed/simple;
	bh=FW6ux+5Npv72H+2EYDVr7T1TV5Jv3vXfaDQl4sqmvUM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=E5yskqqlopuZJSLV1sfC1RDXqYi4AyX89QACYlTWj2wHoL9kk+xUK02oGEdDbd6Jfj4qWiERr3FwirPIfCIoRRNO3iWRml4T+2W5gzTqHDSK5ntSgZ9lnea15IWJmfoDNGdadMbQZZGlFBtpVErrg5w2ZUOj5oSlgM9jQBRT89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wOLUQV9h; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOLUQV9h"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso8207245e9.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775138233; x=1775743033; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlqXtAWJ1GByy64qGazEk71FC5c2hQMAqngLM9hJtdA=;
        b=wOLUQV9hNeSqlDvI8/v7gcHCkJWi/Q7V/JdagLubvKDwKLyy8H8CjOFGzIP//tdjJH
         Oi1c9rPzs9W5dJOFN0U5AyTFt9lsVg232obxLjrIErcdYn2KpauetjjciO7hu8l40DaQ
         ZfjFXdaSMjDcp6/NQdeI4GG83o6oVE0c6TxRUCi5I+fKy/BzRy0mzDj6pbBiFoJePTB3
         35DdoVIeec5S9A8IKNUP3wvsds/Trqbir1VUj834INQ4VF3tTo6FlKh1n4Bo6oMhCIWu
         RQMD4of5pds0ofS00SQhwdOiZ0IUhfzuvsmzNi/YbTxW9Yj9NJv8sdFElkjBdhcD1/E5
         tD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138233; x=1775743033;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlqXtAWJ1GByy64qGazEk71FC5c2hQMAqngLM9hJtdA=;
        b=mFsD6pBtjBYph2WrFAWcR2B+92Ae09ZXiV3rOkbGroCm3qRNHoLdDJXYJDZkJAQh/o
         RBc5ax0IPnf4c/gxoxvmHmxMwAAfosWAvYs1dXARprtfN9NQx154wOeb3zMf1Nz/tqHm
         F7Xysbt+4hd0aAuLqhBxXqDYmGc4kzak5+1RsrKHRNjaNTaw/CTpr5VWA4iXvbB5O0pY
         A7iA1ci8mA2dRMuulicDKIMbLwSpz8+KQ2OP3Ln0TvobeU0wuu8P98TD6uYTvsG/sNWr
         xwDgwCIjlXQTCb3X23i5pYktJpLYj7NsndWJTuT7Eepig5+bNvHO3QieNBf0dYdiPhsC
         orxA==
X-Forwarded-Encrypted: i=1; AJvYcCWmgIRX5k39nFP3+IcyQmRHqNl7izR0ZYMgl2XdCpS8JemqRhUDiGycfCyOLBg+p1JSWK5tKa7vfcA+@vger.kernel.org
X-Gm-Message-State: AOJu0YwEMW00wUHn26Qr18y0ZKKWOa54Kkktcv2gqpq2QM4shGbLrn3O
	bDncYAzgrAtw8bECdWhM73Ac02631+tFVqWvx+Gnm/qLL9AbaS//zFigxwIAmuCz7/c=
X-Gm-Gg: ATEYQzxyBz3bDJsn3g8cwF+8IOe1w/vXqkRhtO1Whqvv/K5PXloUx7v9C863SuP3LvJ
	LDklIdi1VqfG61Te4kQGnfapWoPut+aCNpbXRyE5ZkTGblTwsM1mQNT5kYjNjY64q/YAJGY8itf
	Qn6LIzQDMmhZWhAZYloRI6uKoApAN/AteaATST4n/HfATljDtUYzM6dPZI7v4jhVbLUhZDYvjtu
	IP54mTjfsrLcmAhhpmJb1tigrngce/n2Q1IjxxKHJc/Aw/FJpVFfLdT5FQlpgISKYzJLF1NGfL/
	C/UfRHrCZfCfO0FjSywFMkU+LZMpQHW0l2jFRTeE7GrCu+rzCkpGhutG958017A//sZa6Fcan8N
	+P2qkM93dSc2nIcdQeox97SWsDWFxVfFagkonWyd1lzFDhOQ2dpTzjZ38WRjEQmiF3j6/ckjkQp
	RsCy1efBYlaF7ShssPNelJ+13CQjyoBmAYfFV/xhAa00h7hMmD8tzJ4siSGkeo3AlQbYa1tjpdZ
	tjMzJR4rNj26WBw
X-Received: by 2002:a05:600c:8488:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-488835682c8mr136632325e9.13.1775138232539;
        Thu, 02 Apr 2026 06:57:12 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:a0c1:4037:aafe:5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm7388752f8f.9.2026.04.02.06.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:57:11 +0100
Message-Id: <DHIPZHI8BC0M.1GLYIDLUP5SF5@linaro.org>
Subject: Re: [PATCH v2 6/7] MAINTAINERS: add exynos850-pmu.c to Exynos850
 entry
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-6-c5a760a3e259@linaro.org>
 <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
 <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>
In-Reply-To: <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>

On Wed Apr 1, 2026 at 5:16 PM BST, Sam Protsenko wrote:
> Hi Krzysztof,
>
> On Wed, Apr 1, 2026 at 9:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>>
>> On 01/04/2026 06:51, Alexey Klimov wrote:
>> > Update Exynos850 entry to include new file
>> > drivers/soc/samsung/exynos850-pmu.c. Add myself as M
>> > there.
>> >
>> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> > ---
>> >  MAINTAINERS | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index e14e6f874e05..4b28e92b4d9b 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -23601,6 +23601,7 @@ F:    include/dt-bindings/clock/samsung,exynos=
2200-cmu.h
>> >
>> >  SAMSUNG EXYNOS850 SoC SUPPORT
>> >  M:   Sam Protsenko <semen.protsenko@linaro.org>
>> > +M:   Alexey Klimov <alexey.klimov@linaro.org>
>>
>> I am surprised to see this because I did not find many reviews from your
>> side before.
>>
>
> It was me who advised Alexey to add himself on the list, as he's doing
> a lot of Exynos850 related work nowadays, and we expect him to
> continue doing that. If you think it's too early, let's get back to
> this once there are more patches submitted under his name.
>
> Thanks!
>
>> Please first engage in reviewing of this platform, before assigning
>> yourself as a maintainer.

Okay, so it was done after Sam's advice. I can do one of these options:
- drop this patch;
- move it into separate entry in maintainers file;
- something else, please suggest.

I don't fancy having loose files (first option).

Best regards,
Alexey.

