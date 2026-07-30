Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930273A9631
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429160; cv=pass; b=lcsmZxoht/po+Z4dMJsd9Ua4Kc5BM9EGhzWxkZ05jsx17n/8qMd8Cgr9oC+FCtXGwzuPD5J/Mh75wrdee9WAxXDYsIT2lyvrf6PdSfkr87TzxULWd19XVvmJ2evYMPxorPlt3+Nni485Qakx8CObx01Qf+1hul8BFlmAH9My4qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429160; c=relaxed/simple;
	bh=IPweQa939gd7nIqWfEjM0QcoU+Zhyc9RPuy6U7q0p2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2TCxbEXFHTERFWXmDzm6LHQnRUpxIvaRyBZzMHuhI2PFh68g3oZc6obZA1W3M0l6L7i/JIXgVyTD9KXQ6OvRB85r5LZE+KytLQ8/adIufKUrDTJLbdJDvwdhqjss3r4Dn2a6vU4WVYyFWmaT2KFNsQ7aXouC1oAIzrqCLlWe0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lI+d4iU7; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lI+d4iU7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d004f135b1so31842175ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785429159; cv=none;
        d=google.com; s=arc-20260327;
        b=GciA5p4Xk8+y6I6po1YQpvhbX6GTsmr6s5Xvnc+IYcqEf+iVZf6S73EbtJiFPsHcgB
         uyEN0vTVycyqfzUEtqrOnxPRlP3UvcAPQgIQS9tIgoxsiQalxGBBHquHyXpJ9o0wsp0x
         9gVkv5Ja8F7ydnz8v81TGUAf70Rd0P28Hc5qwLOM9aNF/umNCCRm7kA7jnWucEFOk0Fz
         pcD/3ep7FtOLeC7Z/rDtvV8yaCHDJylGRn81OsJytx10QF9q8SCMELTM7TPygskqtFm0
         OPfrOgh1JbTzJghFsTdRuBZ6whvBisrQPVV41JLiBW1Nsh867au2gcGMFLcT4aH9vL3o
         EY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IPweQa939gd7nIqWfEjM0QcoU+Zhyc9RPuy6U7q0p2g=;
        fh=0QyrSDZv56tsgF8Eew0an6sZcJ+f3DuDBN/nvdGBn1Y=;
        b=Vy9RMuB1ciy0N1BouLul0H47F6+G+5KZGhIwnlwCed0gFHksSvHhXo2Xizq1zOEiZH
         40bjSSrYt1THjZ3q5xUpgoZp/tdvQqLayhCDawDgHYu7tcuTFH/DeDpjGkU4BrJ2UoB/
         8pi+l+HjYE2FTGaRGuouyZbhLm37Ox06emNRkwYPUJnhpdTE6Qh03YTDfuOAlU0ao6GQ
         hdZpkGqFHlo/teayy9iVOB0Y3SeTO8qzyByzK6TGp71InbTbqEftl6x7ZyIic/s3wZV8
         cP01OL4/IPoJtD7gFGjWStetnTo9xvMKv0ob5MDoNh4u/D+BxWViG0uRGAxdXmaPwNnj
         kgGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429159; x=1786033959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPweQa939gd7nIqWfEjM0QcoU+Zhyc9RPuy6U7q0p2g=;
        b=lI+d4iU7n4QzMPjvovE5o4pavwrDuEmPw0kWYZjhzOVal2vgUNdbJ9U8kZKPrLLtb9
         ws766XjCpoRheUY54d4PCT4I3Npf0usqWQDSNmm3eKL/YVwR2MRgmpZjLK0lImFp7BwI
         NK8OHiZiaYFdvsEtit4MU3gTr76AZ1/z+D/0VBB1BjI2qg1zA2XK9k+Ia4y31uhiTNor
         b0/5Gu2I0PtkqozUq8lYiQJicLT5ves91SJKmPjd7KFKYgn0oiPzsBRcJn4kOyWGMvEh
         BgI6fEhqHTLsvhyM+gmS4QWC5Ej8fRfTlmTkyqzb8wnA7Iv9FGQlmy/kRqkQ7xAUB7SN
         gyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429159; x=1786033959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IPweQa939gd7nIqWfEjM0QcoU+Zhyc9RPuy6U7q0p2g=;
        b=c7RPu8M99Nz8Dycrts1wWpqfYXKVqTzFYgjAOnEIN3RlNfXJK9f4dlzFcrFKnN340k
         0Fhzexz50MlMGKWDaHc8ExFoWUERB4avXVs8idJyV9329/FpbIjrc3hUZJzFLlla5SKo
         Zs6Fyf+M9vBBBcIBqgrWtmS2n1zkjg2cICzV+PLQdFdyT8vyZfGUgaMBEZYoVq8jOTy0
         4I9AKpXTdvXXeT5tVa5YiTBsHXggj/HvrJ4BREP24gEJqzFlPfRpumz1WKv/LWxuJ/wG
         FSC+aAlpGZfzFruGtMDfqmbk8E1wlPd84RKdpUDC3z0anjgKtgwaS0K65Kf3G0e/XPrm
         YXqA==
X-Forwarded-Encrypted: i=1; AHgh+RpIs0o8XaBhlZEja8jk5fpVg2YIgGgDkxH84bgBOVdXkwLedwb4bRlWN+CL7KJJU+yZBOFPr1gBprWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwYJS4sXpGd1gcJdhPgygdhHT4/ZhNxeR1WsIcYr953XlXImpjo
	/a4KapKXr8v1Y7kl3rhBAZCB5JwN92Pe6/7yGEizIfGmOCJudL0MH8v52VGlKetI6pI+QYdrUPT
	i11VQoEnPBdIPMcpvBz+BEWy3XE9TkJzLdjLndkYoWoOT
X-Gm-Gg: AR+sD12V3BPt/R7LyqcyeXXoe1V4dW3oaadxowFc5eDRKUKJ4lmOnT6G+P8erUrKyvs
	PgvWjHvlp7gNBI8zJN3HwuSitlsSXIwP/KYDBOUfRoiN/BzXaSOBOaoE9I6Xyw0RLPIC7NSuLYP
	Nn6+i+yyzMtK7qhf/WyCQxyEU5opnyjlbaJYLlnOl6lKGwD4PLxvdhEqRZQ0T8ugCvF8qnA9NOp
	04FgX8x6ypqMmgY7jy4jKHQBO/C7aPM8GWQh6sAHtmRG1Fh5HblZL9AysQPw13dzd36KECiPN8l
	CjBPKXWitObUIMZQzjAG+Eo/oyG0N8arqwY2jqEFuQogyJSRXHpVXnoknj+8xuvLuYZrrXnVFae
	sAw==
X-Received: by 2002:a05:6a21:339f:b0:3c0:9c1a:8936 with SMTP id
 adf61e73a8af0-3c90d6aa817mr1084696637.62.1785429158796; Thu, 30 Jul 2026
 09:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-sensible-flamingo-of-experiment-5a389f@quoll>
 <20260729204308.21562-1-rounakdas2025@gmail.com> <d580900f-d880-4ede-ab74-a83fc0c71be9@kernel.org>
 <20260730-gopher-of-unnatural-leadership-968ec0@quoll>
In-Reply-To: <20260730-gopher-of-unnatural-leadership-968ec0@quoll>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Thu, 30 Jul 2026 22:02:26 +0530
X-Gm-Features: AUfX_mwOeAWKmxBCapFH8OO9BAgQcC-KTiMT2iLqxqLFMwzUP1ftIsgRaivSSA0
Message-ID: <CAPYTKoPQczv-9bcEkNbUitcP91FXqyGo187JW_Ld+DpDfaZJeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: altera-sdram: Add Agilex5 ECC manager compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bp@alien8.de, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dinguyen@kernel.org, krzk+dt@kernel.org, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, niravkumar.l.rabara@altera.com, robh@kernel.org, 
	tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Sorry for the noise, both were my mistakes. These were reworks of Dinh's
1/4 and 2/4 based on top of his series, but I sent them as standalone
patches replying to your review, which is confusing and not parseable by
tooling. The subject didn't make things clear either.

I'll send the changes to Dinh instead so he can fold them into the v2.

Thanks,
Rounak
