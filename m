Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16BE3D813C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001396; cv=none; b=nKkNrmkyeYT/uDYWXD9vNjZf2mD4e8KKqoRH+A9UFD6MDRqmpyqNrEb3luhSLLe5C/Kf2qzCH5naaSawIjEQK6rTpc79SaOhN0VInIPP5JgO5ruqSIqETLMvzoK5CpI3hUOlsxIm8h6aZPzEdKGT7IMtej0eKVxb3D8SFX7X2LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001396; c=relaxed/simple;
	bh=7dEfZ/MO7PfWW2b/sX7zrZr06DdtfX/8meGgTZKq7/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vDdSYYSH2Ai4/+GGsF7TihAtTupVrl9bcBzWQEK/DGqMydXkYeJ2x8JXp24oDdrWrAZAQFniPXbUtBbpepDbLGnU4ACjW89jcd9dqTm8j6sgODJy1YhRA7ZDknLIZmoCVwCKjJ9m+moDYtXMyIvlXhiIFnynUt/4kfhyCr6o6MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YEjbvOkf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YEjbvOkf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956242332dso14479335e9.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786001392; x=1786606192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WpTrq3KT7PoBd2S/V9sh/mcnOd8WakjPdDWB72Qu55g=;
        b=YEjbvOkfFlDE9imkFug9UsYlkxTiLmFiOey1stQrLHIxF5q9MjBPSeOUlEMqCH5VlF
         lU7u6eHm/LZ31qsWOJSqju0OLvnLL4SWfc6rJ2Gh5eFAo+ZrTd40oRMdGporK13+Gxuf
         tK47hRxFUVNTWQ/pl3xa33AZq3MyKT8TK0H/5ARhbqJupxMQIIVazOChV9xyPqNguAc3
         qPFKfyo4rLHCbQXDb11/gaGGUfe39EFuUQUFXfJeSAa2Anr4ZU6qqp3Ypn2QyIpzrcs8
         abNZQBGZX6uIsamsubjq6+6fBut7zY6CjcWim5sc6M3gCJR4n/uapOrqLg/kzxEn2awn
         Km9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786001392; x=1786606192;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpTrq3KT7PoBd2S/V9sh/mcnOd8WakjPdDWB72Qu55g=;
        b=Wsd6oejKCSp0jJN4n5lKharD6lq3B38b+o9RJz/8Oraylip32MReeiFtIkzUNSIUf3
         b83P1xY+Eje3KjOgk+/F8vYyOW6HWznvdEAhjsHnhbqCR1DbmE9g86FFpyaiN5gSvuL4
         falCuMxQgdiOMDm6VDiez3pjQDv1V8VZElPz3IB5AMaHXeOUfKVn1P87oy8qFnZ/j1Bh
         5ksJYYd+YtcHs3jWB24O5Z/Re70LygUVYl5AXtFkjyY+GbL6J29fb+53ljxYFfQdKixR
         cV7x+ZcElWSAr/KDYXSLvg2a/vbFdabIV4AM1SdXI1ZcFCZRJsvEkzS3EqMQrrDq7pOn
         iwVw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/bZLO2D52iOJHMRSL5KHwhM6r7ZVrKzwm153m//b6W5ti+aeCVWN1lLsyaKV5DyAvjnHkr7BIgT9A@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6sjbgz5emsBspLniY/SOGjQndwyLa/lOs9183FOOzzFr0JCU
	DyPiWYaQVcp5WfMmvAoNhjprvl5ajhfA2TmmRPWEnvFEtXfZX+kKSC2pssAG28g2c+Q=
X-Gm-Gg: AR+sD13Cj75DIu0+oHqp7fh/9mWxAgRhZ5tCu/f9YfhFfMHDw4au9ZF2w/xq5mX6PLW
	kRcknWgjg/icLCIUGpXtswbzueFO0q0CCwe9/iUjD4+1PbJu/3ZOKy2EWjuZ6n0Sb/bDU+X0bPd
	pgWqQT3qO0a99XvoyEFyfKuUpIxRcjBVzDXrOO1oi3GwhwscNSS5Gf/r4mrACzi0PzpLEO1qF+A
	caiIEMPyrVyYOUh+Mi+ijOz35/qaMRKPxo8BvHEYj7kI3allwIvxi1sBQ5oPH0leIg/NCswDW8A
	vtppP/5Fp3x9vMtqRDju3YPr7he7sh/pcuZRE1C1ci0SIC1YlwjGKzpZfRwSXoSJZpYQnvCO3Zx
	iFruakAxmYNPOA+T6DsLXZihOEjx5zYPVbAy1vzeHgpADKe7agY4cfozyoIaRjlN1VmuH1ak3C+
	DGKAbmsoTzo8D9Pi8ILx2uLfY65Rk/Q8ZrztX0q4iNU9eo3LVAl9XQYPdKQ9E=
X-Received: by 2002:a05:600d:6446:10b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-4994e7c5d9amr144919805e9.13.1786001392307;
        Thu, 06 Aug 2026 00:29:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fc32:5991:4f4b:f361])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499542135cesm41789625e9.4.2026.08.06.00.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:29:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
In-Reply-To: <20260805210739.6da82d16@ryzen.lan> (Andre Przywara's message of
	"Wed, 5 Aug 2026 21:08:27 +0200")
References: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
	<20260805210739.6da82d16@ryzen.lan>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 06 Aug 2026 09:29:50 +0200
Message-ID: <1jpkzvln9t.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 05 ao=C3=BBt 2026 at 21:08, Andre Przywara <andre.przywara@arm.com>=
 wrote:

> On Wed, 05 Aug 2026 15:53:26 +0200
> Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> The A733 has six SPI controllers with the same IP as the A523.
>> Like the A523, one of them (spi1) also supports DBI mode.
>>=20
>> Add SoC specific compatible strings, falling back to the A523 ones.
>
> Has this been tested? Can someone confirm? We should avoid adding
> bindings prematurely, not that it bites us again as it did for the H616
> DE bindings, for instance.

Yes it was. There is SPI-NOR on the cubie A7A. I did a quick sanity
check on it to verify it was functional (writing and reading back).
I should probably have added an note about that.

I have been submit a few changes like one lately. I'm doing that so we
can get on with DT as soon as possible, without waiting on the bindings.

I would normally submit the corresponding DT change at the same time
but DT is currently blocked by the main CCU and pinctrl.

>
> Cheers,
> Andre
>
>
>>=20
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 7 =
+++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-s=
pi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> index 6af4ff233158..be47c6e00409 100644
>> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
>> @@ -36,6 +36,13 @@ properties:
>>        - items:
>>            - const: allwinner,sun55i-a523-spi-dbi
>>            - const: allwinner,sun55i-a523-spi
>> +      - items:
>> +          - const: allwinner,sun60i-a733-spi
>> +          - const: allwinner,sun55i-a523-spi
>> +      - items:
>> +          - const: allwinner,sun60i-a733-spi-dbi
>> +          - const: allwinner,sun55i-a523-spi-dbi
>> +          - const: allwinner,sun55i-a523-spi
>>=20=20
>>    reg:
>>      maxItems: 1
>>=20
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3
>>=20
>> Best regards,
>> --=20=20
>> Jerome
>>=20
>>=20

--=20
Jerome
