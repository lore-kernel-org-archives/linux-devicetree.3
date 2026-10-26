Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005046;
	b=AUbbp3h7Qs3rNmwINA8ELt/xUu6Cfhg9uOxtmU0nOrBJpa2iHUPJvWhxTbl3Kxl9ZN+k
	 7HFCmWnZygpjtzxVXSvUiSI/DVaHlOwjbh28wcGzyx7gRbKfC1tzLo5zlGYOj0Dtw6I+Y
	 qH9yAEa9Y4UqsioYcUFhFMV/m7XDHGXyqu7LjkbgCparKKOMnoGOw+nak4hwcSxwSwseR
	 RDZ9Tpgi0zPmJPga0nYEvSmLfz9ujCp8p//RK4jwizyVWc0q0fqV3Ej8GgleFbLct/Uyw
	 Dk5fBQOvyx5+XOzY/0CMfhOP+z6aDc4xX/Jk4TiTbI6bu5UoAP09YTS2Nb/OJjl0Udw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
	b=WXr4H+C3C8dUyr7uXr2Cu4R2MOySmIF5LtKan9xZMOgq25mdpGOG3CaT64Sr8HZ7+LS5
	 yVquk8TnHJeQ9bs2MwVLEVg0JzM0x0Bs4pUb88QcuDjbsjFnIF2VLm7RTSf9wVCqDH7SW
	 i74vlNpqLBSypvN+kovy1ph6vYZQrOtz8icA5Q+rmGTvGgTcMpqKI5V/Cotb9qbGvJxKV
	 uRuGIf1geAUbH8aNc1fUqdftN9wiekx+2zkm3owAJth4tKIUuNUyvunM+jXTxXumZDHq+
	 Crzk2mg/ZgiV7qgMW9XgIb9r3nWKx1tmYfQF0gU6kNESnQscBCGvaICj22qo9hAqVDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nBILM34N;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7105606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7105606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nBILM34N
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214af2076so18663925e9.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793005043; x=1793609843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=nBILM34N+DQmcQaiOwhhjAIBvLE1X8GiwMvy8mC6GThNPWRS1nnLAFrtY3hnyPSVNE
         Iw1wUC/FrAKhdk2E9Rv+/IZ3Uc/lKsrmo5Mo8o81Pcp3wYgTBWsY/iK1KyOY8+ku68Gr
         tlMyY4cGuHGGSdUUxuJ7RZ3eZanC3KZDVNtmShz+O6nzvpD7y+1eqGYHNXl0RPRK9FO5
         U1h5UehATB6b4SpLQbkpIAIfNmrGn2Y81XswDvMZerQClesyMtP3EptTEVYYe/0a2oLo
         PM/pYmxmaKVN2IGHCumdecvCMaF1hsrQQpghaWKBGPX5Aozb9IqHi1j1Ihl8WKCh6LDx
         cEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005043; x=1793609843;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=T3qp3eapt2l5Mppnqqi+285sQzxVQdZJ8s5gcF20E10noBgeksLHwJtTYUYlewCr6U
         9K0iywcJwYSleZ+Dms9G2LUWdWsTcE1CqzJqZZnb5UHMEwnQaHjQE1LT6M3Zj6cs7wEt
         BmmqjRuoaZ6rR4HSuIdt6oj+x4BcgUEHCzI1CoMGLqB9c609xvn9oW31jdYAi8SsDdnX
         gfhlyEnVXt/laztsUZgY/IoijbqXDeWL3VRoSDJMEVd6GnaJzFB883M/xX+tBvWz4+AF
         y67n3FzQWq0ix1TVXr9Zhf9JmJkKnyfLqvlVYzQ3ZyW/Ubek7bdRnCSJBSOA+rUD8If6
         V1fw==
X-Forwarded-Encrypted: i=1; AKwUvByY+dzRh4p9ecypYymG7JZWju7d8ZNXqI0b2X5EMHbvFUsd/YyBpmd8p+FDqAK4DUrOcCgXe0ObFRn7@vger.kernel.org
X-Gm-Message-State: AFq9FYK/C0JdBSKltI85hLRVHehjdpEhTFq8Z3FaBrh/o2G8K7oqMtZd
	nq8noG+PRtBROTV1i1tpDbpm5gm5g7f2nhjWfoTKOXshh8EEGRKbX8rx8Fu7shylagc=
X-Gm-Gg: AYBFou3l/E0SiInCl1UDg8F7/x9ECQGkiykgU2nQBqXMWJTMZIcYRsGAzRwucDJR2LI
	7McMkHBDQBMwaqBJRt/9bxRP8yV/kkr0LJXy8dUyzogJslETmQVuO5vCWjq/6l5qITbYmTReW6H
	2yOCox4rI9qqRGOaNpu9MbBQ2WCBUo2JISQWFSaN3sBAuenkKFxiDf7nMbBKTZzMnhlIvJp6oym
	KAJLYqW9MxKzhUCO1n3pM+Z38fQdly0BscZ3kVCQRxCllqOxQIXl64sP9LK1TobSaGVHIjYQX/p
	AqUv+u+mfEQ+GjV/6J5WGD9xo0UDVwE5XubRB6hYfYqQUnflrdb9jOLuELAVHQu5D5Fjg1tJwyx
	HEZCeuQnbfaCL9UU1VLE8n+uGsJ1zNCaQQumD8pVUhlqQw9QtTmKdzw8vLgdlMtuWUM8rNP3rz7
	FDkvvbq0lHeGoWd6yGvciCmsx/QIJZ2ObGg6TkEwwHjJl8iVtVvdbrUSJErspDt/ZVi+iEwQmHM
	SqnIxNuRPyDomNp0i1KsLzjDpL0BfeeuZZqRvsegqP1EUQ4BY3CpnKx4R5Xm25fbxiunrYxdR8=
X-Received: by 2002:a05:600c:3b25:b0:4a2:1a:a128 with SMTP id 5b1f17b1804b1-4a35ac9f1ecmr118305925e9.19.1793005043279;
        Mon, 26 Oct 2026 01:57:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm187484365e9.15.2026.10.26.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:57:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4?=
 =?utf-8?B?bA==?=
 <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
In-Reply-To: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
Date: Mon, 26 Oct 2026 09:57:22 +0100
Message-ID: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
>> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>>=20
>> Every S4 speed bin runs the same CPU frequencies but needs its own
>> voltage curve, and the bin can only be read through the secure monitor.
>>=20
>> Read the bin from the firmware, select the matching
>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
>> on the SoC compatible and needs no node of its own, and S4 is added to
>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
>> the bin has been applied.
>>=20
>> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.d=
e>
>> ---
>>  MAINTAINERS                          |   1 +
>>  drivers/cpufreq/Kconfig.arm          |  14 ++
>>  drivers/cpufreq/Makefile             |   1 +
>>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>  5 files changed, 202 insertions(+)
>>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>
> Is it safe to apply just this one ? I can take this via the PM tree then.

I would advise to wait a little for Amlogic to chime in.

Patch 2 is something I already rejected back when S4 support was
initially introduced. I suppose AI just unearthed it and did not bother
to mention it.

Amlogic was supposed to migrate to SCMI at that point, and possibly
handle CPU frequency scaling through the secure fw entirely.

They did on later SoCs, I don't know where their FW stands on the S4.

>
> --=20
> viresh

--=20
Jerome
