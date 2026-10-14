Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76574DA9CC
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970687; cv=none; b=XvVQMv5JPvcnlaMORpIW+/qNoEka/4RglbyhsBp3KTKFg45uYP1y27Y/It0YVMfi2yQqwFcsHtH6ixoItaIDL28F4bPTMhqsnEkiCY3Nv2HgxbPSwWpwfAF5/p8MiqFQV730oogrpjEXZWwCUmxUrfTIfO1aAPSToDRKObE3RTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970687; c=relaxed/simple;
	bh=JAZDEVVWBpCzIsROIvJ7aOp+s0L8O8CrbhuQdamS+9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrdkIqv2yu6CybTfiPdfiDlmy5SEc9Tf8OLgoAxnFs7PKWRjgB6FViQ7T41hwMcZsm8O8R/CWjOj1gdd3YBVNf2sZNRTf9+/pBoPMm7okVpYDITlc6+JPo9eFFkpVKY3CVSF1ZcOZA4kAnVePNj4fNqBeNpS6Cxnrfh4s39Ts10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9TLTe3L; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9TLTe3L"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so23591745e9.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970681; x=1792575481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnTWC5fZozzSwkHK4q+Oqe31gSO1RQ9RdzCpCj2F8RY=;
        b=D9TLTe3LV0X5U6WrodIJZ4Js9dABg9SPiO5halhg4sMS7y5xRqIJi15y/LSCfW/gff
         3PPz0AbVI8KlZQMI+JMJ0zom3Z184cvYzFHfbRWzVs9fuw3xO47o+Fp/XoJq/BLEWRa8
         GuhozyslteyFWi0slZ1rKsak4hUUaOGJTEdFluoNTO/4Yl+p3OYnm4dkMI/5HKoc+0qY
         El/6gNKTJY3hyOBZIoIiE7jZvHXsvu7fHJVmHWedsjwzyI5M0+WRIVkGmvBDHLuUw78N
         www8t0s04MAsGaGS+3oYPfFZwAZYYVBrW1XTiLUN6m23lwL9Tp+7Zkf6AAPHK1hOBCFK
         BVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970681; x=1792575481;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnTWC5fZozzSwkHK4q+Oqe31gSO1RQ9RdzCpCj2F8RY=;
        b=PDMk3dhYO+HHOHGacsG99qSuglgSb6VXsEZk7Y5fhJgOhfccnbzUZnK/CRuFYvSH4D
         9LcCE2xnXu0f7mFlIWQP7huPj+EQIrJ43Hfwgqfd8lx5WTzYo55pNx4fp8uRG/wJqSaQ
         HVoi2RXFIbp3peE1912XhFCUqtFCx4ZL7SIMno7eWhKCqWYaYaiiiVTsD/+7q7nzG6wB
         34frZmqoV84kNy3vtzyCLfoFuCuyQLcfH2NU0W0zEJYVvRf7r0sxhZby9m2hoqHip+Cb
         i1Q0wwd3LqWt1XGUvKut49ZBKi85EZ1a9biKVjs9FCIRnIHvxhGxodnoSX08RrHgDJEA
         6EFg==
X-Forwarded-Encrypted: i=1; AKwUvBz4baXzL8I7wJ4F6olVhaauFcFGOSRGL4QTyYN2dEktDpyQwvIsTQWb71uAX9pGywTIEIE0k2EM5cat@vger.kernel.org
X-Gm-Message-State: AFq9FYJMV3LZYeY/2H4NDSNnlHQo8/SubEzzfNy73sq5XsUWhk0ecezw
	yWIpwLf4COA0qB9ARvZBqUWfKmhn0mZpN//QM9z+SYJEo56YZzEhQb/j/960PShlypE=
X-Gm-Gg: AYBFou3pY9Cf+7NtIEmljvyI1ACiI2bIwWPtp94GukDmhsDLaQHhtUk0UtMSAspPFTj
	ILwgS+3LDvm+ZOWXusq8PUmD1kuoxg3rOYymhgG4a16pQA6mmmkdv5co8f1nkPjAdB9tLMqcmtN
	Sjj2C0BhBItfgQ5EbX6hwlUhEzJEKtaXMMj7iz7dva4pWiw6QhHwCn1p0hClL7Z6FOtulhkcbCx
	/8Xc/cLaVV0cTne7jB/TUhRkPGYSVTRKenkl9QGYJ7jlrKK7V+BJJSi9YJj9AV3wUIHlywTG/I8
	jFkY2V7p2zcwjRdrSudgTjFvkuBS0kynwrtdqXnWG1HJYmuG/cMuw2sbcM9zDlwWmt6AOH4EroN
	2hujq/6uVctS61Tl1qD8Vddc+4u0yinYyE1ORYeCCU9cyGeQF7q/0r/6MW29Faic/R8fbienHTq
	AAhHK4lTiHfX1XHBDjL6CVxOS8Jbp8MUIGeZ4B/CCMUqQFE8ncbUvXT8YgYxYlGEtpFsZQUp+jn
	t5WOmlgJh5E
X-Received: by 2002:a05:600c:3e0f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a18e4b60d8mr299229875e9.23.1791970680941;
        Wed, 14 Oct 2026 02:38:00 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm6026436f8f.29.2026.10.14.02.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:38:00 -0700 (PDT)
Message-ID: <db980e07-adf9-464c-9fee-401581986508@linaro.org>
Date: Wed, 14 Oct 2026 10:37:58 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> +
> +  iommus:
> +    maxItems: 1

Just the one iommu entry ?

Please:

- Make sure its just the one
- Include a comment to name the one in this file

---
bod
