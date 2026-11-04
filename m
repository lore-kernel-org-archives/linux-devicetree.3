Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832073;
	b=16hRK6GKjY0OfxeTAYOoC+ydaLm3sSvTqIEXQ71z9YBjrr5dhkppx0ELMzEFTxqzbmsU
	 NIGJq9XH6hmStleZHjpDc+XVlf6NDPs2Bhwv6HFMwew2joqBu/JRdeGPkQy2XUxIrVw2I
	 jXyoRL1koZZXZwolcm6xrPbFegupnWF5H4jbmjdYnuDb6NDlyFa331CH1W3xroB+DZaef
	 5PCNYxlXfTZuEjVtz7PnMVuizHm/r0HaNUK2xHdzVZisUzYQfXbwGG9UJggOcVzh93016
	 lpnNn3HHs+1poxSrEmSPQ40OmcbO0r041Q11h5qLYkMQiQch7S81JOHczE1EDlZpY9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
	b=Q6hu17nI2dqAYnAvoFREijQJl9OnYRR4cASLxRECmndg7AjhYL2bcGZF3tVwblC1UiEh
	 CVbk74gZF/Rb6xSat+xssaZx48BtlHKg0+1zEHwo6r1/VmJBCoi37uKvH6QweBl7/A4YS
	 x9tA/pN7hrHxhPAnK43WRLg/tTddobRowsm58M2v4FpKIS5S8llEDJk4MAYa2IMwUrNyL
	 kW8uDQp/KSHsindZX0P93979USWfF/B2GosfEQCVlNP9BTLH1C5MLri/rSHUvgrNz/Q/q
	 n0j/Qik6OqAzqZU8yvsFIGXM7ciy6zR2BRegwgyAtLz0ICwtqYEgQVbiQSrQJtNHHXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VblTHW8t;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795B0606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 22:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 795B0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VblTHW8t
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9722845e9.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793832071; x=1794436871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
        b=VblTHW8tFX/DEh57e325ubcAiELluEymaW2vTWJuEEHyAuM3tm7KpOyqmWbQG/Op3f
         Msw0b1pJGBWgfSh66KmwWzwckkRp6IePhYqHGIkYUFna08m/hgJZd6QQDswNo0PXVObu
         3CpiTQiXj5E4+WZdskOIi7h0GjU40neX6tFnJ8NY1Sd2YVcZ12618lqLKskZg/T6dbYn
         mYxG36peURPv7BA0Mr/ughxR+KzpZXsw9r8R5fYIME9yNHAVdz8a9PRP1fQI38oKuPrd
         TvSa2T9416wZnCTTXJcP9uSG4Dwf2kTo0XZoaNmbIxIBmJpoHEd7hhkaTpqcR0TqdV4M
         46Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832071; x=1794436871;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
        b=2BzPZ36bBnA94LX7QWsJvCt+WXRFHXei//3c1lBQ8Tej8ioR2K6//MrW0B2WJkNbMl
         XhNk3Fid+mlxbDFznyCJR537Gj8sR5Dl7NTLfIJFN/OPkelUaiGFupnH7ACbBlJuMqW7
         Zf5fBvNMh05+48dI+Z1pkEN5fS/3rB/JC6VRov1coKXDFUm/yR0ix53sL+s2LjJkIs7X
         VetU/f9tby9HcXmi+guHzkyYxpRd/Z3pQbycI2X+WQbePLzZWEkzhaHlV+3FQmU6GgqF
         i1RmJDHIbv2OFVTIvho23lYNcZ9Mu4xXtlnLNpwpbjJ4KeusNunQur44SEdhbHpSPyw8
         M7gw==
X-Forwarded-Encrypted: i=1; AKwUvBwb/beNGF6FHvoDfI5AdMA8qtauCWafS2sOu2wxzwge9ubTqcjfsCBMs4Du0nZZTCYLuKQosfSvVyeg@vger.kernel.org
X-Gm-Message-State: APuU4Z87rIb2g81EOJp2YJwTCrDtUAGW69RbWld4PjjhRvRBuh98yaTx
	ZInHfuIJzfPB3PXfQH1ESeQ1VDFKd0YMajXjuLYqdzXq2MTTWLr0F+oa+MG1jxTLEKc=
X-Gm-Gg: AYBFou1sq7uWwKGNQ97RLvU4FC/bfNPi9chq56rbhrMO0qGyUUyxevvqeXGK2+ZLdlh
	9a4rt6H6sfjDgg1RHSs9OsdpHwOCAUXJpZRixT0UTzCURmO7AjunBlZzzvqqDm2iby/td5dnAx1
	KKBc7cyLwUB6dP3obODKacuYKkph5hFT9N4XD3j7v2kSItoXHv/c/8K9WuKBYgiHhf3J5UpeHz2
	GKq+XPvQ6ajbE8rqIu/YEK8Yc4tDKb79Db5qF9LF+ZSKL3ozEn75qArkpOWUBuRQ4dWpWSaNPhE
	QH3hJjSQSRczrJjYFY8cmWuJ0rPwNLoaMJ4GwD/QsspjY9QuXjHzuIC2401KBLPiLlkTTYxtFWH
	puVR5Pta1cY/JFOUQK7lO95qG5O/C30jFl2Dm+a8CR5hRnEfTIslulthgk677aiOb4hSoTMOjiV
	L5HFfObyjwpyevR5xExz4YgJFPZ4tVzqzZWlVML0RAZyDlOnnkZqmxc6d8q3PWsa0Yvrx11dWdJ
	j8X3Iz8hkzVy5nFYNcxulIq39zVSUGL4yVBsQ4wTI0ExVeR+A991BbXuYRSUutQlT6QzIpKGbrw
	2Mk1Ve3GV4MPDaEayWqpnvBc8eH9YO22nAnqdsKIejyI+wJD5sT+EBzJu0RX0bk=
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4ac175669d8mr428288325e9.14.1793832070829;
        Wed, 04 Nov 2026 14:41:10 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65c8sm16013915e9.12.2026.11.04.14.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:41:10 -0800 (PST)
Message-ID: <ca9d806b-567d-41fd-95a6-daa6aa14d7cd@linaro.org>
Date: Wed, 4 Nov 2026 22:41:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..b545fd2378da 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
