Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18637DEB2
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017852; cv=none; b=httRSw9Anj/JXlcxa0m8Qg0iQJdYkOJPiOI8C+LI+CCJPU4mI9G5od8xJG76YWcpzBF0W4AV9AXlMohvWLmeJoEzDmCbEAcSvl5fM6LrrSCUDWxy4ejX814/n+/fUWW5Uyc5M/IbSo/S61rre7OI78YpAOMGgYgAEnDB5i5JtfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017852; c=relaxed/simple;
	bh=A746bdNcUJkfA/tJvXGw7GsSsywrS1dVwUX2pIcB8Ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfPkTVBMIhFDr9vu338nlxcJoSk5WEJYiK86tSZ7aKBBrvIk84nLTW8bh3CqUHServQIYABKDK6/OpR/bTg2Ovh8QQwXLk8gAia3aUbNmZrdPLfQf88CdW2+NWfkMTU0n+rx38A6igdumnG2AkdCHj0B1gZYSYLZobEETCZx9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0tKFkWk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0tKFkWk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49557167508so15402505e9.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785017848; x=1785622648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkfPWhGxyd5bYr7NDTgv1M/DacfMUW8wNSZdGPCFOtM=;
        b=S0tKFkWkcUdgGyd3j7agqK6qU0PjsxvD8cB3W5wS5siTfjtO98Mq6LzHB69SslTfOM
         oO8q0YXWhGhJnr1OHOQT1JtcOHi9Br0dLli07EzrExgknHqDOkGzbEpUoCzzLTQcfxaE
         +lkSSBuZaF0TyOlUXw/Z0TgBoFbc4T9YVMKRTE8LyMNCVnmD6/KXHnSQNsAy4aiIHDWu
         z8XlmHkWOvXm7s4CMf2Wpqx9JWxX1DQG4G/DfZD6ye39fkB2Mnv6Gvz6XzT8Kp1mD4gg
         lYt3uO4BuDItyZ6p+lhhipj3Hgb7JbmMnHS2BQFhdf+8AbRePKvhP8554vKeScHmfqVn
         d0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785017848; x=1785622648;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkfPWhGxyd5bYr7NDTgv1M/DacfMUW8wNSZdGPCFOtM=;
        b=e7gYAtIbkXcybTg5cXxwNsYOJs78zeleV4vPjVcL3S4PMfw5byquHad/mTBYO1aKge
         Msf1VJc5n6WLicAq4KZ4mZ0FSSAtujXomZeLxWgFlJjDYE3S0zMlz/uwT4RchEYG/X/k
         eBDHgDtwGoA2ghIBvKMHqEm3ukx+jsfKcLOm8x57WkbE0iHJZw5Of8gO6nUOZ17QsXzJ
         WFv0qBo5IOgSuHAKhf9mgfnoUJcG4YQLr3Sp3ROkvv+rLwWnr6r7uoAVWqA69RuqGUlq
         E6MS3cI30POZS4Rx7Z4kqb9s25lKWbGsjPEwM4nLMz1iv0osarG7wIb+GOTwE4yy2asa
         JQcQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+tHaCwMYZkZ+hRXJBNJN7nUhZ/lbFrPLtsB8vUp4y8vy1ZTjb7R7RleOtkXfbB1qN81cd9V9EIffg@vger.kernel.org
X-Gm-Message-State: AOJu0YyQs7eP/vn/O/KmHJ+Y+be6/LbiB4+yWghMDi0BvvBo7hfHASwK
	tNu4CA95qD7gawUN9Igc6vcvEYPoUYfMwQGgW5oooAmu4zVs1B8gd+z0rxHYNns+noI=
X-Gm-Gg: AR+sD13upC5Lx55074vKwfg3lZcYqF36lJYXNOXBe8cAuzJ8obw/CRH860RLgyNORRX
	zQ38oH0XGZi1cd+/pRV/7BMQlaSZVGlH79pWykbGdGKNg1JA+OSYQFfbDD85DMFZUXrX+lw0VTp
	KYMzyF+8gQRK8XrZwnFCdOIRSpGdCXQRerI2kNxkEerx6p8QWu0+6ECRs9QWAsN8XrHOyhRBHa5
	J2UECg1rNtKAOMhqxWth4b2VZBH4HU1xvG9LTG2E0laKKLOQhfMvUA5foGU5QT8otbwiYcAolUG
	LCB4I89z2/wHn8G/O/etczk3/5JajncFJzyOgnAcvS6+zskjIPzNKaEENeo1I/LL77K9sK2ahIA
	bhbEMnquLdJKR6g8vgyeYCNn9JBn/CLqrTnsBhF0jI6yfQfx2D+GTTdqKcuaekOt4TfkLBTWZcs
	bU2mxgEUSMrxw7Y1c=
X-Received: by 2002:a05:600c:8b08:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-496b56da86dmr39749995e9.17.1785017848221;
        Sat, 25 Jul 2026 15:17:28 -0700 (PDT)
Received: from [192.168.0.101] ([78.152.215.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfd1a60sm133988905e9.2.2026.07.25.15.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 15:17:27 -0700 (PDT)
Message-ID: <08bb8736-3a10-4038-b4ae-b188fb655601@linaro.org>
Date: Sat, 25 Jul 2026 23:17:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/6] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-6-f8588da41f16@linaro.org>
 <c52fc21e-ea58-43a8-a5f6-937ea108fc2a@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <c52fc21e-ea58-43a8-a5f6-937ea108fc2a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/07/2026 15:46, Krzysztof Kozlowski wrote:
> On 08/07/2026 02:07, Bryan O'Donoghue wrote:
>> x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
>> legacy CSIPHY descriptions.
> This looks like breaking existing ABI / users.
> 
> Best regards,
> Krzysztof

Yeah - I need to detect if the CSIPHY nodes is available at runtime 
instead, true.

---
bod
