Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF4B3955C5
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349117; cv=pass; b=YPRWNAk5Eu6a014ixl/UaiVK7S4t6UsufnNIQFpPVtKc1Dv0LSYulvrynfIxuFj6oyFrAy0hKtBkKzW9ebo3e5vJiZTxBqDtr/RSNNaDpuWKZ8LGVdodxBcQS50psWlZEyYM2Ak39++atjkCoJ7rkFENa75FA2xAhkJq60Dxe6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349117; c=relaxed/simple;
	bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeAJ26KtRx1Wo8NUshWEV9/95YWesXTEiNw5EAyqxrLt19gEshTWIOFPvxRLWM0qSDUbaXNM1g8wyyF4gf6pqdCGQ9Zxvf88MC5UIxXACmwNWiQifq0Pil8R7ZWuRVi1owAVrJ4XPMQmwJ3P9JPB6szSNG7KQL6ncqitEvv/LBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tt3gzNgO; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tt3gzNgO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso12571187a12.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779349114; cv=none;
        d=google.com; s=arc-20240605;
        b=EEgFr7cgC9XwEcaJ5PIGk1wbcy0A1jHIrOJIqW2BX8lCwBCcCnKMPIk5LBKpaeSkwE
         i7z4JMn8JH1VTt/lVs6e23wDNmG1utL0ny0Myo6M6AeMELwI46t0rL9fiwoAFxpylkrz
         yimR8L0B9VpqpEF7/D/+pn8pFnAPce6w6/0eVGHVTfKhBW+vKnSZcjTC73e5oMnkbo1z
         Pns7iM83R2CDVjVlYaHbG2oZiL2GfDN+kLCHvhkpFD4iJnqoWR4uUB17vsj9PbU/Mkps
         nOY1PyX92Scyj4cjVACgSf8QgUMh1efYgAHRehKKCdjl388SsZOT2DQYmhZxEEYOo23D
         DVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        fh=eqXVphhkjjSr/vUzn/lRBZfm7j30c5NAk4qjnExJ8Bg=;
        b=g2iFEzv1h4TGmj8jx8ydD9RVsfxvdwAO7y+EldCcDrE9cSVF/BV85png2zk478njt8
         MgCvBiR6c6VyfdHRqwU4qD593jyLZW7H+9JaakmYRBhO9Wx0IMg9l8Pn+CYGx/tYIpyx
         i0yuL52ebeMnz3/DIsWeZQMtf5TwwoEJdd/gHJZd3mz/wmyh50ktRgGEO/YEmoSNrsSK
         8UGR7YkH+V3GCJO7sUNQ0/6JWmqspVv0uXtAv/SzBIiKpE3auF4491WaLl2tcX4WdgxM
         4/GF2lIL7+58NpLw22Ftc0dqubCsp/fYwgexkgXZlcSmBxJKLHY5vno/WUJUiShQz1L8
         IFfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779349114; x=1779953914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        b=Tt3gzNgOzpz0jD1f1eM8A91r7kCnmW+W/Qa9gPngeXqXwdih4R26qe8jOTh2W1dFYv
         qksCU8eWaBfPYEzRrIHjgMiuZyCa4VNZUG3AIGj3QutRaKLu6ruuB8sLRsdhsJ7IgeDq
         872eev4Km1kxcrRvNFyS8xHAF92EX7T1Qq3nVvUDYumwTPjEvE09XTbTXlljiXmUlq3x
         YXZ3iqXe1wthTwWBYEM4YYT3ihPRKqjq9kfo1WXsxd66zcU2DQY5VXfMvJnPzoSGtBMX
         3nv7fi0CNI7xXY9VhfCo/1hZzwYTEC/hgi1sgyglXVTpRl+iANLDMSjyb39WJecqcY+R
         6uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349114; x=1779953914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        b=DsY4yREAQyI7weCNWWnq7ZllN1thIwXrx14eDT29Y0v8ShOgdrXfSWaqwlwGc8Qv5d
         X4FZjmQ/AOCLQ4+CutICYbry5WgN63KXQqAqTEUXm6edKcmkQ5B0IGPs4fsPZPXFmk6M
         x61S2If1zJj2tJtK8NsXE8bHB8qGQDHtuELqB5q2gRaKQ6wHc9UqDh2V1aD2HU8MWRRO
         Hi88EcX6UWCXEK0sga/3UYUKJqcjOjE5ChwjNEZcyalWd4lXMLMaolOo/Z0+ObqzUxfN
         I1Y4866zHyufDlGraHMb0LyMqKWemBX+vC18cu/2Wjo91yJ9mtCWuSfIIegMt6tHPImA
         3hRw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ff+uRdG0CqbPgaU/Qva19DPhsEZP2ZCeRhaYheu7nnIHPXC5akftt6tfPTt3Y41KvNF7wls04jHNs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/E1zesTopzq70gbKP7a+MUTNLUCHD2k0dEPzZ+PhmRHlStN8A
	B374Q/7SkpsY2RNkT9b2mloh9QqNK5MaDJszngPQubyUNDp8tAECCGWfXr4Oxq5VNM0+3l3qOno
	BqaqeLkmWnjNkLtlovhQzm4Oe2ffu7j0HIVndj9kiHw==
X-Gm-Gg: Acq92OG+qPIWeXiN7ukzBLYoeAFd6LdciU5QAT1Zfj1m62GlISb7BYRpk70gkhFKrtk
	EqIJYtKbUWX/48uEp49Ewj4+I/W4jhvI2XGTXTPy9qUM9RbEyfcGpPeZQG26p9R9jRr+JVjvffK
	63KQEXzrSV9qVzak9FirBUzJcao+K7n5pjIiS6Vqccjjk55gsNWZfez2UX5hEvuNegCZdrOoUqH
	WgCZQx8tn0ciDCIKJesE/phKADNczVMD7YezyqFhOrJxbk4tM3zKLczBdB2fhkgDif/3ELVotN2
	OYsAffuUxLqgbHGdzzTdyRsd1IGdM22S8bZItYthSw==
X-Received: by 2002:a05:6402:34c3:b0:686:d801:96c9 with SMTP id
 4fb4d7f45d1cf-688367cfeb0mr797381a12.14.1779349113964; Thu, 21 May 2026
 00:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-exynos850-cpuhotplug-v4-3-54fec5f65362@linaro.org>
 <20260514053037.BB9A1C2BCB7@smtp.kernel.org> <DINMSL1LPPCF.1U0AO6MYUFTN2@linaro.org>
In-Reply-To: <DINMSL1LPPCF.1U0AO6MYUFTN2@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 21 May 2026 08:38:22 +0100
X-Gm-Features: AVHnY4IWx-1LpMYkHNMVlV5-A-NXDPnKWwrYcqsb3AhsVZOrTUQ92kJoyqXmTRQ
Message-ID: <CADrjBPpBJ6cZYnGRkSVDA4BVKC_rh=KKvSWq2VjCTDMo5nMmPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] soc: samsung: exynos-pmu: generalise
 gs101-specific cpu{idle,hotplug} for Exynos SoCs
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, 
	linux-samsung-soc@vger.kernel.org, sashiko-reviews@lists.linux.dev, 
	conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Wed, 20 May 2026 at 17:06, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> (adding samsung list and other folks back in c/c)
>
> On Thu May 14, 2026 at 6:30 AM BST, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> > - [High] Hardware register misprogramming due to incorrect CPU index from smp_processor_id().
> > - [High] Use-After-Free of device node intr_gen_node.
> > - [High] Missing teardown of global notifiers on probe failure causes Use-After-Free.
> > - [Medium] Missing of_node_put() on error path causes a device node reference leak.
> > --
>
> Sashiko reported quite good findings. I'd say that most of them were
> present in the code one way or another before my series.
> They look fixable.
> I'd rather need then two series: first one with fixes and then
> generalisation of cpuhp for Exynos but first one will be listed as a
> dependency (but dependency will indicate order of how series should
> be applied). Is that okay with you to proceed this way?

That sounds like a good approach to me; then you can use Fixes tag so
it gets into stable for gs101.

Peter
