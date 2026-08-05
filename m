Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16693A0E97
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785957154; cv=pass; b=OwH5mazj62iLZvvoacy3yFwCIYgrlL7ViGw8wHab7BQVoMr5Gq80s8iM+5KKESE/APH402j7p4XDAXT6HpVGyUoKvNe/jJUslrqtpzsR7z1N+czwFurfhXSmPkWAeA8iUXsyJJVUqPSY3ZYLFuf+ymsZRyB35chM5tOrZJ9N0xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785957154; c=relaxed/simple;
	bh=Jj25GS/khGhFswCC3+7Qo87FpVSH8NsCUQcKoqvRGgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7jnmawApf6MxfAhZVUwwS7H3L9y7F0eDEvgdNRj4qwK5TER2xFAdPxyL2TpGpOVbYNzV/gbc2FAgHnZCKLX+11qbs7ffNmIlQZgMQYjmXYFiiDzSLt0m3Og3anFGs2uijB3o4gctCH35oN1oSQaVgxNv2kqQ2DaNLSZKOb0vuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJwdv4bJ; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJwdv4bJ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c74c469e8so10131101fa.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 12:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785957151; cv=none;
        d=google.com; s=arc-20260327;
        b=nHF3IU4AM3jr9ZRsyo8CInPPUBxQ4Wr0MoyU9JpMUevEN+Y0VKEy8fZprI6SWW/TeC
         slQBKztjiwClGbFYlK19DIqXjWa40mafr4Ij0SRsi/h/MDiECIbnllxmDjexHIdLSpY1
         FFlZTSzn6SGkWnNUbXXaZfMhkrg0IDF2AfQURZ4aKNjYyDrp8MyouZN0s3HodwCodKY0
         q9qIsxhBNcm6y9AE94nnw6oc1ikq1/rMttSoUqIf4v8TaPKyXkPuAkfe1MEv2aOdmmyn
         gFak1efZ9s8k17FUGXqo2Fe3usRVdO/r/FNrII9+FC6yRMjPa1OMojqHofoTUHJVMQwP
         J3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jj25GS/khGhFswCC3+7Qo87FpVSH8NsCUQcKoqvRGgo=;
        fh=ee0XZBCxMZ8IIROf4+zlqJeFBDhyoRjPXzqPH9v0014=;
        b=UJGpz5TZAQzpv40m9fQcgOmPbo5/uOnVXECToGBgmP7mE0HpjkGzjN+4yJdUu6crRN
         a44mcshvCAlIVwDjIRRkGDkxmkGGyF/xbQoP7TMaKOfzBRP+Mzf++oeFWU7sKaTql7k8
         irqvyeDs2x2iye4orUEjaPzbAffh9YErTbrtY/hYeUL9UYib9KPER7EUCtaGqGG560oI
         kTfxJY1rd4RAiegjFKpbZU7YAyG4UBCLybqJmohquh623m1BcDwK4Xh6LL4UM9KtrHD9
         vhCxMrxcF7DbG0j+L3lGBBVaP1VfPuVsHu3BVaNNe4A0k8hbWwvEOFEFycYYS1sWHsaK
         QpoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785957151; x=1786561951; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jj25GS/khGhFswCC3+7Qo87FpVSH8NsCUQcKoqvRGgo=;
        b=qJwdv4bJGxylViY/wDCJJ3uZWKc+nk2oW0DhAXFWveKf/useEWJOcbh+oBS35pefY6
         iU6+tBzrEMCCEQeFb+SjlTE/BAcWyd+wuJ0TLmjJrqb3bSCqUtSiqM/7unx/2kPXwr21
         z3tsZxJyh/nuX25vZZgzgVK9X+Dw3WRiSIDDXFFp7KB+SDRPyZrH/PWIup3sXEUsBIwP
         hjt8LQtF4wFpuFwbamrDmdHXMetn+CUm6jM0x0QGESRD9RXBLEUN0Sb6Sv6nzCx5S6hk
         YNwRWXVXKvFNzStGAe30bqngcPEk6bCIbJ2qzTX3QK8ZS7Y4+av7dR0q5itT40JjUbCm
         Q4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785957151; x=1786561951;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jj25GS/khGhFswCC3+7Qo87FpVSH8NsCUQcKoqvRGgo=;
        b=W8P5Qe/+3ZtitfXmAL2xrE1GZntN9A2DBIfbXj5CKDoTQ2ZitckXvnWkQ1qz2cQsjY
         W7NoM4G1bECC0b4QsezjssjZcf/cVhbV+dQ7CWW+xvTm8iP51f5IltDp8qFUKETMIy0w
         mqIcm4fVbdrbwvbrUUPZbDB2gxUhKNNYb9XK0wzQ+ejWsX/hj6C9ZUmsX8MxOz/krsu8
         /eMp2c2jAJ+7UUHSnZc35eBTAS4ok3iDmFopfyxA0tj3CJS8tBUcR3cj7Hn/3wlQ2J0k
         Yska0fqvfzasRvwBUG40xoDku3OhY76Rxb1cFRpe7LMhOuGfpSg7tmhyiVeANxKyhcUP
         qAJA==
X-Forwarded-Encrypted: i=1; AHgh+Rrwn5O2Ja5lANuu4jmCpiScv8vsf/75WTxPjbaX/17KBm9pvkSzBolyR0k5T4YNQzZZQC+7wkvzRHZA@vger.kernel.org
X-Gm-Message-State: AOJu0YwAC4uWOHHw0es/gO7VciXhvQ8j4FPIpKSu+3egFbnmGyVaLeSf
	MB15Kb77q3Z+dLLE+yZxoWxxi2owxJiuu60CbpONQ2xEyPgPZNO7uBhlFWeMK6iYDckS/EDIcmU
	yYm0JZvmLMVfRyIV/xqeMuI1RjYgybc8=
X-Gm-Gg: AR+sD11mme5Ve3qBbn2335fNFwLTYXk5nw0mQLFgWjVAVJkatm6XoAJ7HH9X1d4fr5M
	mr5a1Rww1hPhJ69T6uBBgPZhvP8Iycjqs/I4IQnLZPTrGcB+tH9BZ5XgeB6WHA5Hb0ucHAU5QuY
	a/GQIRdt3Hkw6IPlvgsNbL/q9FFKp8PYVZIXfsKkjHrO3zgSsAHZAEM4e+7S1kFHrvmRtAnu3KF
	LJDsoFDi5b0x1xeiVstdH9NkVEoPx4n5YXf4IJMr4c7oomTk9UDZifrO8alvQmCdVArZGcIve9A
	CNNJXjw03VbF/oxLhrJtuY5Tyg8ru/cRpq0nH5LQrww+yLPzv373oX4V5RxhhrSOGUZHlrYaQkt
	D/tqEALyKpzXZOWoPrzIFpqrbui9gi+yPavclTrHrlfWHHpk1/KFnZ6NqQ8Gi91A=
X-Received: by 2002:a05:651c:2108:b0:39f:bc94:eba3 with SMTP id
 38308e7fff4ca-39fbc94eca4mr10172201fa.16.1785957150335; Wed, 05 Aug 2026
 12:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730173643.256052-1-kieweg.leander@gmail.com>
 <20260730173643.256052-2-kieweg.leander@gmail.com> <20260731-petrel-of-fascinating-finesse-cd10ae@quoll>
 <CAMwcS0hupV50NEOX1Fsi_tzRYXBecaummjAm=CFHO7xOT1uUXw@mail.gmail.com> <c5f760db-2235-44c1-899c-b6ac023b3233@kernel.org>
In-Reply-To: <c5f760db-2235-44c1-899c-b6ac023b3233@kernel.org>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Wed, 5 Aug 2026 21:12:17 +0200
X-Gm-Features: AUfX_mzKfgNk_kCeQMYfzhq1km2lC_2cZiboke2CNUawh4-Ik77RzF-dE-CyGAM
Message-ID: <CAMwcS0jTwpigztHBTLv_sgFNLK0ERHDMzMGsBdi7josLHw56-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add GlandaGPU binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

> openrisc is arch.
> opencores is entire org. Are you saying that "Glanda" is this one:
> https://www.glanda.com.au/
> and opencores releases entire SoCs, thus they integrate their own IPs
> there into final product. I agree though, that opencores should not
> define standalone generic compatibles.

Fair, those precedents don't really hold up then.

No relation to glanda.com.au, I wasn't even aware of that company.
This is just a personal hobby project, not a company or organization.

Given that, what would you suggest instead? I'm open to using a
board-specific compatible as the primary match as discussed, or
whatever naming scheme you'd consider appropriate for an individual's
hobby project.

Best regards,
Leander
