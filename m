Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849810;
	b=Cr0cps2L3JqOrGknK3/GWP3QjTsM7us6uS3GrfGkQ5O2yDXMeEPeBbF8ho4dH3Hkx99K
	 gMaBC6BSgYXXw4jLKp+O8ATUcxSFs4aqhlZf+y0ngmY80efwRj1TEzWBTgkaHLJtneAwr
	 WCJVuHT+Gp4U/bXoDx6rbVXb3e5Lenw/vrQFloYrIfDOjgjdF8PV705OzRXUzMKqRZnIs
	 qZhPqsOm8cwRwZBq/u9uFAFSZVQ20iCBmjA9D+n80KGNVDIpAbcdOTY9eRABgGmP+gDO3
	 MKRamcCBiIC10mYo8Ij6xqToWRKRx6Hfiwzk8y16nSDRirWMH60SfTwlHqSXXB87dWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849810;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KEYl2+ZqCMxiysnAC3YpcFAk3SWbJokq1H+MOmHhqxg=;
	b=qaI83EkMCtIDY0grEzYRA/oBgVmnvr7KDZ5t9fXW2Bpnl2SpFDKOE8V2clhfyb0znMny
	 UalSsl6xGzmOGh95QCbiYxi6S65F83+5EptjmYCCkW4aMzjD1p7p3Ywl88n+Cm6Q2QlzI
	 dm0EByKqWQuMgfx/JiUvWWAn92RSxvE28HeFWuKBrtJb/YjjuWdbxVyclmQnGTiUMhSBl
	 8q2N6acBkLVXzo9ZaSCClM8gRTXGSvAgEIM7f8isGoiM0Ugi4plKjjZU8immfoNWmv2tM
	 iS3s3W9k/dIQBqTK+pT2aSoF9pj2GTvH/vlpQ/2YtVVJqvgHWRGglCVALqAIU7s82RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749BE606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 03:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 749BE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so639321a12.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 19:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849810; x=1794454610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KEYl2+ZqCMxiysnAC3YpcFAk3SWbJokq1H+MOmHhqxg=;
        b=C+oFWaCPaX0b5ZbmrKvqgSFppAyfNYRztMvYss1KC8/qxKBbmKS3JWVCbj4XnuXDt6
         elpr3wRRkY0LpHM8J/xs9nofeluHBAJRGuIu5ApWgmeMTTbcvA9S02LtGSXXyFkKI3zW
         ZtJU6hNz8aLuGKV13b1hXltHB12DtN3sS4JTQcYLVSNStk4Zx5JmEt19ovPAlpygwRrw
         89v7UVgs9E1WNivBu6y99QL9JeDhw2AA7JENlOIuEDZcSUr6IprrI1S2mFV59PLnndPK
         op//dP/6/6yTck3WB1xYR9NWhba0GjKz546uokX5BMX8c0o3+NxsJkU2ASYJwdxDROfu
         +NwA==
X-Forwarded-Encrypted: i=1; AKwUvBzzO/1KtqF1Bg1mGg24FF/xr/TNyCXg1HkaiFarksHlbPfxNIq5YP09n+JLYD8Xgysx86p0+fr9UNay@vger.kernel.org
X-Gm-Message-State: APuU4Z8ln3CuZvxq4Hw+WcqQVjdfk7YkLYJouUQjKbC4bEMlDjnVp9La
	eKE3iaFn9qef/0c8ikC1GRWAnYgkD9jKAT2d5KNkrcHPeiet+QQjPKyKoqy7xzMf
X-Gm-Gg: AYBFou3yitWEL2KNZHknTUeXVsb75HMmy9SVlEEGjIe+1lmObjOzpBkRYcS7ALc/XR7
	Ztnry4l8QmIG7QN5TUhpWpcMmQLdzcn5XQyWaoBRRRcuh08nppG9/nPF2ULFIVfT6wJcLByfUWh
	DyDc4CSi2jCbjhaiEPPy+5nZuziSEqjb92hZYcHi1BXBWTzlpZ9S9/IL8oDN6YzoXWBCQN7J+YN
	ZgRS1HDGyOZvdW6XTPnMQFJIfvpEZkj678m8FY3zq/Mxaxzoq3s4Zarp2ABR7t5PJFxY0YLd90T
	Ey7pj5Gc+aZlhyUrGtBx48GI2kR6vpC/7Y7WoBNDZVVikPx4nyERBcD9bSQDzg0kF+imfAl9Top
	N/g3aAN1Fg8pMpKqUoRXtMIHmrxHkBoGY2wr5RlTsCgaL4QiRe4MLAgM8Bj76dWABenuIqtDQbW
	XbHThe6SlTvoC2KIwLsc8YCXSEId3G7hGf24b9Uv8GJ7TRFl5Qvl6O4JXaQAiSkY3mnn4TkxckE
	G3ER3GLQknQvx7SosLBNJDxxbrmDAjbSaq3eMLJAU+Koxex49QnHlAmicvHgCr8w6qLaKZktcHy
	40k0SYOf53NwD4B6iSgYGRcJYwvQga87SmSirLuocptdtr7KOWKGvViMhYzQXMKpKJ7QkTg9O3Q
	GsBO6mOttirPa8SdtAICdbGwVJsIyu+/uQlTbpAw=
X-Received: by 2002:a17:90b:534c:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3ae897f5d26mr14512720a91.34.1793849809665;
        Wed, 04 Nov 2026 19:36:49 -0800 (PST)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3280378sm1423817a91.12.2026.11.04.19.36.47
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:36:48 -0800 (PST)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14fc585291cso1433412c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 19:36:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwvEJt2PlKWhk3pmqgXRRwwDz2zRptGsArWtxwLJ/vNTf0poAH0nQPmHDlzQI/QzemDvlidkSSYIxXT@vger.kernel.org
X-Received: by 2002:a05:7022:b05a:b0:19c:c396:37aa with SMTP id
 a92af1059eb24-1ac5d1d058amr26264865c88.22.1793849807402; Wed, 04 Nov 2026
 19:36:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261104-remote-festive-1e6d807ef014@spud>
 <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com> <20261105-dreamily-quicken-31e2b446a942@spud>
In-Reply-To: <20261105-dreamily-quicken-31e2b446a942@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 22:36:35 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4Kb57AJK1mOxiv+z1qAbOiAD2e3srf7Q1knd3-11nLhg@mail.gmail.com>
X-Gm-Features: AclHuK-3idFUv5nBVANz40sgPgySfpizpIMP20bnEM1ST-bN7ItPz_5x2_r8WXs
Message-ID: <CAPY4CJ4Kb57AJK1mOxiv+z1qAbOiAD2e3srf7Q1knd3-11nLhg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Just link me a tree somewhere with the dts, I;m sure one exists ;)

Here it is, on v7.4-rc1:

https://github.com/The1TrueJoe/linux/tree/sf19a2890-dts-v2

and the SoC dtsi with the twelve managers:

https://github.com/The1TrueJoe/linux/blob/5aca36c1b028fde1794eacda4cb6c1a5f8e9b96c/arch/mips/boot/dts/siflower/sf19a2890.dtsi

The branch has this series and the dts series, with the v2 changes from
the reviews so far; v2 is not posted yet.

> > If that should be one syscon node per block, providing the clocks and
>
> No probably not.

Thanks. Unless the dts changes that, v2 will keep one clock and reset
manager per block.
