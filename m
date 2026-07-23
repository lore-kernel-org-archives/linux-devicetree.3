Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE647DFA4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808158; cv=pass; b=e9ChWM2WjzO+51vzY/A+FEvdeKDNwQg3VO0lYMVnQPU+45m/pH9rpRKQ1vGHIX7YmBGQT+wF8Rfq2n30FsjQbCmbro2XnVNYdKiH3nLc2NBPzoD1A5Vl5CfFlzNBEQFS8XnbgxRPI1yfhHCrNbjYD6a3PSXSQSlw+n+mykdUuXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808158; c=relaxed/simple;
	bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISIYRPmOlkNEy5TVJKY/zYiDnG19CNBTBxOnarT10V/HLYwEjz6MJklvoAiujDVxLzewa/Ffmd3j5YFd26MLf1yZrpCrC9aWyAVsfIsEkYPQQA/XoGJi3dWNISddzMmQjQ/hHy6O2qUyCkYJc98grPHySVMajchvqGPEogEnszs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v+AyHx9W; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+AyHx9W"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69eae037da1so825561a12.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784808146; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9cdEybCA2igp98bkmPHkN7KvjA6SWGln0u0f2nT8iuhqpsxAj+nLtWjK5l/rs+6AP
         SfeDPfmYvsst7huwiEG3EUsKnHR7kAjspLKYAWZqhULRIQMLzFrrH4GYI2vrVhHbI54Z
         6sfJPsX2qcN+hAKLDF/YQIHMx8b9PqdDGvPRqz24WQQH04s2ZypGinFuAvvQU1uoXJRL
         as/JlH1fSE51Yd4JpH3wzt/IBnk0lmShFvLdP26RUdiu5RX8EcIc7GcGvlzvwx61qLuW
         6KXBbvPhZweLBPN7lA/KDPr6ghitUhCPRtlH+l/7cWj5dv2Whrx3KyXcZP4zJDhw9gGd
         M9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        fh=kcfcGPnp1qscg5QtObsIvqjAIcBeMTJ7RBDk7P0OJjU=;
        b=LZYE1LQ/MAP9cWw+EXnx8bcwpuHyMhlSBf39rYt0cKYibAvNs5ACx7KnPzwptyd1u/
         UdRfV6dhZy+8BAVlQC35ej0cKBgw3aL901oBnGlRBpQDglU97jJGqTehxMUmMCQJAJer
         x7IZJiQXdq82JG2madUxwbf4lJJsJQEhnVHGXkLIPAlxbpBfJr9zqYWYH6SzU0z5RmP1
         ggYy6zZuHdky3mQosZi6YPmB9LFmZtwP1/bxq+HJG+c+QnHMR3A8d/X/klWsWFNKATyO
         W7YwosdUAKWSXWjzZ/Pq3yq6lkAYmMFeMfg6hJujloNOPSzhuHekqx9710LyCdPDLpCg
         2gzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784808146; x=1785412946; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        b=v+AyHx9WSDmiTYs5ZMYZcSIOJhG9HHngHhft25qdCmJnS9LNVI39tdQOJQreSXqB1j
         5VGsuYMRGQTWCpVhiZyw64xcOcxFgkHo5p/RYVVYU3c8hgOjnBigCiWuz2cqSg1KHc4Q
         SmPrVi8Mwnmq9/o07WPSWVLZpfrAItCjFodr9vtCc8CTECGumd1L2wU459np45EEUadk
         2go9EF73CGn/GV3V64TcnAsSn2c4MbnHx8OLTtRp/pcwmZcNpXCBqRk8PL3XN2kSLr+m
         7rDdE+YsioHMWh0JwvS3rwK0DHxdyYSkmmhVRC8jGO/TZ+MeQS0N0+W0s0TsxTLKplmt
         OqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808146; x=1785412946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        b=Gtf3FZ0lobaCVl5/vYEbX64gZD/45iPAM2Vv/CGG2ami1nCLpwxsSl4yULa0silh7V
         oIKymM1Olv6hWnndwClH8it7Lb5/h3/uHQ1JZUtfeBCxmt+mWTamd/wYjbNpC1RJl/Mx
         MA3SPqaS9a+5U+awPAs7SUZIgowla5vzSjZfLYbCTMOLZgZH+/Owe4yyLTwNDmgpYi8A
         IMDWzXbwBqEFdvWeRnaUbyFveDY206Edeu8F708BI++XgZZTEW6wCHnBJS+00IjAhC6J
         SlmZ89Nm1e9EhC7GdvAPZJN2fS5ztJiAhs2K07Qgle32cslPMtAGQ4e0+xg9eLBp1GnN
         8hRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2q7PzCufhogfXnTUc7Y9/SQwnuQKB4lJyH3u/sM4wNFYEw+wH4GU0P2ewn4d7iJUKU/2s5Vl1tRUs@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXGGRCtyKHIDf/u7M6NMXGQAxJX5Wh6yL+qRnPg61dAmIGWUL
	z2VTY5nGv8BfszoaA9ghGMTJMYCdvVnXpoCJyPpxDRXFec3IyNeDIXXndpJPbzes4OG077bQyBM
	Nxj90JvxeMGya5laJloxTfOssV2o0n2fdxfNCJFf4oQ==
X-Gm-Gg: AR+sD10OtLGjq4t+PapWp/rK44bv0Nj4WXmef9nR1Rj9y9/q9LJ2T4VpGYtYC6Lm15Q
	lxFZLA2u4Gj15prl1VqNCjNkOgs77NkNsJEjrbqrR6BF8T4HisglJIZC3w6HzDXm6mQYP1DnR5y
	10wGe+9sEhxDsWf/GBoH8tQGIk52vFPDl3mpK3ilx0UQywgJpefOTN3WaJJg3AUSow3xYwFCGs5
	sSPOsluovqKmDPSUXt3CNbIfiKHnbrq8san4yQe3zFfGSIJiLSZHduLhRKVCRr6dr6pyQRFdjcr
	zLhsuhr1kzDZp1MtQpe3
X-Received: by 2002:a05:6402:3241:b0:698:a9de:16e4 with SMTP id
 4fb4d7f45d1cf-69f6bf1f611mr861984a12.20.1784808146288; Thu, 23 Jul 2026
 05:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro> <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
In-Reply-To: <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 23 Jul 2026 13:02:13 +0100
X-Gm-Features: AUfX_mx4AjbYjM6fZT-ntJeRozz1HqK4uJ3kqrvaInoQuZ9gHqexg1gg38S2Mz0
Message-ID: <CADrjBPqSc8kuC7AUg34CKrVSbRWjO7i90Bff0b0P7nOc+m=PCQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
To: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 21:44, Alexandru Chimac <alex@chimac.ro> wrote:
>
> Add bindings for SYSREG nodes (required for ACG), compatible with the
> standard syscon driver.
>
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
