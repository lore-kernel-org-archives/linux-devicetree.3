Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794569167;
	b=FmnJUTcPFFNz/DcRGMaDxUb4gV64Ap2AQOetSdPYBcn6HMXASj1IrjAu2apvvfnz/mGq
	 IFEWCjVsCCY2ZCfpU59w9hp19/1PmvsMtk66dEzEhQztH0O1pp1GYKB6o0C/qtJlcrY7D
	 61tMChjpq75HAFUAgD0rqVMCpuys+4K9A/T8khe29G7SjR9qCDHYdfYY0lp30ZNkSTjRc
	 n2NDoQDR8TsseM45IxFxoq0BACr1U6ivvahLNt5mdGjhch0fR8Qh3XS+6n1GDf9dvIrj3
	 QODhjqXXUelhWNsjeNfJf/kI1U7WVyKFuFRbqheX5LuR21/j0X/oSiRGksH4CVqh7zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
	b=xx+UfAF6PeArXrWlbhOytHiPykXqkS3SA1DmU+BhCHweiTuko+qnn+12x+1TsDIzWBk/
	 qqkOs+aGkemo2GLnrjOohSgop25py0dFz3Ot9ZBwAuNoQYcrD49wXcaeJRCy6Y79pvL8q
	 p7GJoGuyrP08Y7hWbmPo9nnMgiC8hiqyz/eSi/HHQNu5XGbIz3rcaKAx4cWqXIJWAC3/j
	 /YdFThPv516j39hSZ74H31cdZBn8NgHPDJ8aGoLO2f/MuHUm4nBPw9n4wGwQXYFBhpmWJ
	 7+giGyadkf1uOEVv5srk1RcaebHc6Jnr1Pgmo3n41yYDjpjn3FG++l0OzhDOj0isH/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEek9Htp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4569B606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4569B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dEek9Htp
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so184732966b.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569166; cv=none;
        d=google.com; s=arc-20260327;
        b=WkvASmUGDSyUac0b5GxbYGBZoWokoeljLVMwqHrNiBA0njOZThfyQZLrT/ZzbMoE/e
         nflInvfaJ5Nd5tz76IR5SlKWfDWPjTl/jiXAze4vyR7v/4xc9wbGs5xPWBVcHjRN9mD1
         0aHPyx+xhohTuvhT/C5JzMRwk6bDuWL594WwH0MlquvtsUpaKqVlRM9PQpPzp6V1QQsy
         J4gkcEP4WNprJzLwwTZxx5kOY1FAeIm6LB+/96CaRLZgzcks+dWeaJeOtJ7NZCjsqIjF
         nB+vfoYDlIHKD+mQSLfgO1ln4/v9cb9zlvxUMpOVYIHelaB/sZFE5TMiZrnIcUToOKMO
         wmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        fh=FaQqCtWZQEMkYmyJztzY+rLL/NpTMo+9qj8Lf9ds9AM=;
        b=rls5PFmZhvOLv4bJ3NQWvTOymJ04qseYhuVNwhfxKh4naQ6U2fICMO+l8gZ5y+egnG
         qDSL2/1FhaJkuid1fCmCJeA3S6V8lAtOJQJunXtPQqG5rME1n2/k252IA9+boFpj66pX
         g7yMgWuVXVpoJbHCSJXddSsqeUqg446rD3+AAoncPP79LIjYhQtgfMDdk1+veskz+h83
         NQuGk23g/jQ8/5WwwKJrrsjsLoQacxQMErNxErypMeb2dlalwy23YOwLK+fvWQXsfz3Y
         kc+8eX2GFmXXMGGgyixR2xIw6yBVemZhWNr6WdTQka98QXsLVbArdSfryA/Ip5bFPlGI
         NI1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794569166; x=1795173966; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=dEek9Htp2rFd6uu2Ph7g8AxNoYqFVLHVX2mYLl9kLY+HH06kTBXQOKi3r22Mzs9smM
         sagi7bl3+DQo9QkgTX7pFHO93lrrwfHA6SuB0Jwny1Vd/GzwHFiBiOLy6S9zwJfvMoMV
         BKXLBxVHAmkpbgA8o0UpnP/AfJIu1vZfb6RN6XB4+9f2VpfiBaFeZ3JlErhNyKX25LeG
         eXs4P2pgPEqHHlNwFOzF9ojZ32WC+7RCdT30YKCLdKmAlot8Hrf4HxUhjgtdo+bcdj5R
         UjplazmJUwmFyYVBT23xLFvylNJ7TA+SVSzh4P6gk312G6Dekfj7exzocUaakVK7/BPK
         ABFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569166; x=1795173966;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3tR2OcSjEorsGBJ0hdQ03VNuD5JTfTZOEgX1R0TlFiA=;
        b=y6dvdPpNZPsMFoPUQSnV6dogTXEMBH31t1YBUe28eyxHevIoUAx4t/PnXdxK3B5xff
         KYnkoazylIHp+jPcdv8f9SvXeqeuThs3uYjptBY6gk+yqZjhh8A9ONpArbpukBiXDhos
         9fTbGyTWaCMy2jGmLwqByYyYfGMdLtl3ZM7ALh9RNWqyCCfWGGW0bHZyGlkcoSdn8TqP
         dnibilkv3nUlJALuIx530+FzMe6El/zDnmC2kM8fxeVLu+Sqe4Sue0vhWgS3VfcSVzRd
         Lv0lNDwxWW7/KgFwEvkzk4nRRq1m72irYu88lfjjqX/rTswQy7zLdWYpbEFpRwJYKjcl
         lB3Q==
X-Forwarded-Encrypted: i=1; AL+hErG1SDxUlbbyty6mQSFXfB8ZlvQeYmSZWgi1g/1ZcXk4v72o+0Nv+zigC8xl8tb1zkkuYsOAfJ5XMXrt@vger.kernel.org
X-Gm-Message-State: APuU4Z9oqcSJDzl0pfQsK7Ee4YSuaq4pvW8CpcNhpLzYJ58BxqVHmsCs
	vMtDI37lfCK4uFwutJoJzX2wQ0qQwOR/bfK/17CITCZO28jT9NVp0klv1OGTIN08uCwBanCxZZD
	xiZu8tJF3vnusebFXxpGIVEhHOyzId9muywsIKi2U/Q==
X-Gm-Gg: AYBFou1gFAXB5e37U19yRNRKYp06DK1OHwGdLr1I3EyMZql1ku8YeKzklAAQm34PRUO
	rhDgJJ1E2AoS9jOXpEVuD2bth+4UrmJM7Dy3UspZ2P8wIBSh2h/wzDxKmq1/gQwZMSOhMHJuNaF
	bvNnHtnukbknww0n/z8xMrO6JNGOM3/XYYaV0kZFUxKh4Ea/bFdAoWhKqA+JcxK+JWbAVsRuec+
	dyyIgAVK7SCsFAPnKSIiOtbNmb+lCjBzITeYTqkN6PKd/n+q7pzSW2om8n8OMGTg96NEUELQ11D
	avE2zJWHzLmWL3u1vvJHk0wYGNWnt46rIdJ0sT5gqS5oo7th9L452bXdMJmsGnKRoRKDcCr6qXr
	YRSUVh4Yskw6vj9auecQ7cciwuPIy7H2T5/4vWPrVeq1V9n4g1SYgjTQP7L4BJIuwxQxHCw==
X-Received: by 2002:a17:906:c154:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c50962edf20mr170802566b.12.1794569165639; Fri, 13 Nov 2026
 03:26:05 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104838epcas5p2623c7a05b6163954e13e98367063e7d4@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <937773018.41794567482875.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:25:54 +0000
X-Gm-Features: AclHuK-RupDt9op7f4Ges1DbDNx958GvAIMpdcpygcG5RXJOoAuuhRLl1DXJwcA
Message-ID: <CADrjBPqfJTRpsgJza23dup5sB9OxhS+AJ_vzmNtmuuJXQaxOxw@mail.gmail.com>
Subject: Re: [PATCH v3 03/14 RESEND] dt-bindings: clock: exynos8855: add peris
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_PERIS
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
