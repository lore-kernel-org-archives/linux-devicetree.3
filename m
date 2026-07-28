Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EAA41DED3
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233166; cv=none; b=rde9f/MKEQTlXr75T8N95YqQSW1zTQ11luqP1+uXdJQN6aYhAE5FmLHzbDs5eOM622maeY/2M9YLX06WH6Wj5cvjvhYhVREDtX2CpJzVegMY/6FmKJ9OH3fiTvEayJmkfqvfjkXVyAaP+beb6HirKJYUc4Mh+3FOfFMyGUMaJAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233166; c=relaxed/simple;
	bh=Rp6+uTMCabzqwWh7spwIBUTlBYjHvNxnWsIheA7Ukxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmezek1uAJ9m2JBzB0xJkozhGm8Ir6vbA/thEdFWK+phyjLCSF/YhGpm4ko3dGod5Uqv0RfAxEHGZpz9/U8DOjh0w3F8G0bl1amQCW+yEuby/02SlZy0AkhTfI3qjjX8U1HaWumc6kTbsrUM0HIxGaUoWR8adApy9ixTVE8+Tz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RGgKQhgS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RGgKQhgS"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15e592da74so400068166b.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785233163; x=1785837963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YUhY2kLHKMkStru04ihqtiLZEbioAB+gFNR7L1P5RY=;
        b=RGgKQhgSy5hbCKjGqFFIemOkOM5dQmn9Mgp+OPsN2AksZZU2QX5o0PCJjJg6ImnNx1
         s1nQKXFm/a5sJi4xvVEHgOgKtuIvAtZjMks0hVpW2tDPss6c/u5SRpMrPuz9gTBhFHs8
         0GB7hi9gu2UhZ7KAAke6KuGnfo/fuMe5h/Ty+H0ubN944+mHXLxupmIyeBTSQgnDDMK9
         4+SawC2sTjDzOTCoB3Y6ViCpZXhu4WNsDl5kp1x53MTml8ATmCPyoViUYwGy5gsUGIeF
         yawckni0U0EJ/W6X3cLba0ykyh9LNDA8pHaCTynZIEXY5v+1v55iYgeedgLek1hxl7t8
         NU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233163; x=1785837963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YUhY2kLHKMkStru04ihqtiLZEbioAB+gFNR7L1P5RY=;
        b=sjpWYZIo+oSLoQ78CNDpfk72sd8uzjKgKq+ZNPzjh8/sVcb+M+ud00c8g/wlDfWfh3
         yTABrHpASqWLHmifAp4W7GmawKYLOpw0Whf5FC2NKFwokL/YcOKswDbgl/j7urIbgtRQ
         QM+H79o5TaAGqOrlZkc4nevB5ySq7KfPuOb18kR1HQLeEja1LJf0VGXmOGULAIvAzMqZ
         QQBRDUWnKsHc2nOdpwu2nb7BpXeV+ga2U/zn19kExoHFwwLM9VGIZk6Il7l0/43FDoAm
         6xD3KoZLylWevTbPaGK4AiYFDF/ukzT7t/MoAO4CibyKnTE/Jybxrinkq+zxH1YpFXJD
         1p6A==
X-Forwarded-Encrypted: i=1; AHgh+Rqxum7pQi3Y08uf2snQN3HPNjImxiSE4aNLAr5PGXO9SE1wTCCSYHmNBlpzA/OCOmnrPIeJuZF5h2p9@vger.kernel.org
X-Gm-Message-State: AOJu0YwwuqaIIFn1vzr/ijyAcgCGBuoRe/BCQSR4XwnKS0iCplC8kuAS
	+5EaWlBl02mfXah5cjkXXzjax4PvVwFkoNVl3ACq+DlVqFVgZG4Qv8SfFYqeGWh5puU=
X-Gm-Gg: AR+sD11wSJHY+/s+wj+FA4ZulJivU/CBOzPeYdvc20ZH972Ic86S/s/krS6UKgI5PgI
	mJFKePtS3YTGw35Tbjrr9jVv8M30gs6hrdmAFs0tWsZnXluQ78rs/7aNGMlo/PK03PuEIWN0fDs
	/UpruAQwc43G/5RAEm5d0gJpeHBgB8Od/RkqxkucatYBGQMe6uzvWBUsrWOUnnX6+OyFa0q4ukT
	woRHIxbJno/OYnupu+MPNvpNN5qmaj6ijGoH3vbaRWwursr1ihCED5M5UnfgtqzHFxqh8LKQbf7
	NpoVFHN5te+fQuBNfpBhU/Bvwhq7bS/1WFpSgxVyNzhBwaW844VxJwVyb888xerjQ9KFqczLzsW
	5DghfgK9fW2Zk7WCNH8TRduZIlwFxKbvgGeD92r8Gw/Q0199MdcBi4r2AvvBAqK5JFpqbr9w1/R
	hGg6u7uVU8boCkyQ==
X-Received: by 2002:a17:906:fe4e:b0:c16:677b:4d1f with SMTP id a640c23a62f3a-c1f72489d85mr86000166b.54.1785233162679;
        Tue, 28 Jul 2026 03:06:02 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac9d79sm725854666b.21.2026.07.28.03.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:06:02 -0700 (PDT)
Message-ID: <a9eb7475-2682-4b9a-b401-6178282d34aa@linaro.org>
Date: Tue, 28 Jul 2026 11:06:01 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org, robh@kernel.org,
 devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org,
 conor+dt@kernel.org, linux-phy@lists.infradead.org
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
 <20260728094212.0F6511F000E9@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728094212.0F6511F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 10:42, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Since the CSIPHY nodes are being moved out to peer nodes, do other properties
> in this schema also need to be updated to prevent validation regressions?
> 
> For example, the reg-names, clock-names, and interrupt-names in this schema
> are currently defined as strict, fixed-order arrays that expect csiphy elements
> at specific indices. If those elements are removed from the CAMSS node to avoid
> resource conflicts, won't the remaining elements shift and cause
> dt_binding_check to fail?
> 
> Additionally, the ports schema mandates data-lanes on the CAMSS endpoints.
> Is this requirement still correct for internal links between the CAMSS core
> and a peer PHY, rather than physical lanes to the sensor?

A good guess but, no - illustrative of how LLMs "understand" stuff but 
actually don't understand stuff.

If the graph lookup and probe succeeds then the legacy regs/clocks are 
never mapped by camss - if that lookup _fails_ then you absolutely need 
the legacy stuff.

"Dr Chandra will I dream" ?

"I don't know"

---
bod
