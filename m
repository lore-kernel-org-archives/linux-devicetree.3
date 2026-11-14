Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690104;
	b=Bzl05ZWq+j1TjYBolOrZ6eY+59s1DsVlHSY1lb+uJX1CP1/CWOANootOeMWKPDvPVi7U
	 PKk0g5HNhv4f0ye6fEEz0+KdmzpKaiXPqeaQF/E7ifZC1OH7c3lsKowZLSrdaOJP8upAq
	 tfcr/wDqWX9bxmqdZHeIh5G4YbTYUjNDL+ER/pKHz873aPfwUY9Q5bB7RF9z1vwHTyDhb
	 ubKjRnF60LJETztdTc9J7YRj8EMF4+XRguSTRXYpWhFBQZEv5gCWh4bdoJXTWmjYXcBvX
	 mKLz8m5Qc4drsmf6q7O7eXMreZE84bBCm7KToAqEYl+zPF7gJnM6qtJTYp5vWssOysg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
	b=U1PS6+BTmSIqhxGOde5Rg6QWrQhLB1dOBSQdA3P1+JpV4QI2tMb7jwzfK+yX0FP5zdul
	 OpD/N2n0fYV0bn73gGe+ZegwuiFKb+6PJ4MLpr4nRQ/vZv/dXzoxxiehY8mD28ZVmsxkv
	 YTZLjLvVhhiIdaN76V5Lp7LfIfMCOECtFRiHbTt8p075adeXnmJoJmx2Oq0SJoIEL8BHz
	 +mDQymAiwf1pCYMFRTTDdXOAo2boyM1llm2dpnjkAQJb8ixvBBW3ztXsMn64wLpgtaqqb
	 kZZ+zvpwN6Ca3X5bwpTDWq4oh83a6eODMX+b0AvztXcRC3RYQ3+WQVkLxcbIwPmlRsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErVKCOcU;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7762606A334
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 21:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7762606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErVKCOcU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so2877335e9.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794690102; x=1795294902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
        b=ErVKCOcU84Ds/S6P5yAsvjlHW5ED6oVPBK3r/ouFYhcuz2n/ROUmxaT9uHw4Jy22v/
         lyiifSzSIhKPRtDn3SGYSBs4tjbeoPHnx/QMFTqmsIz7qfpAwmD1PtAqnvwSI9/9L/6W
         dcAg953KhZHdNTUm0AHbUTwLc7qwPzzEijyTJs4ORhfKRKW3+yRWltH6Gme/WLFP+nYm
         8Z8vh6aEDglOT5K8tE8u6bHNB9IDPbZdLepQPHRRL6R6Qb8723yNEBioOUSEj0ekfDAp
         Hy5WYGRYR/BD0lzP0v+1Uu3IjweGYQ//7IdOF385/tfadcHzJmDovFZU0TI99XW/59tT
         IHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690102; x=1795294902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
        b=puiHOaTBcLx3r3O0ewRk0BJUUGlZJ0dbLX9CSQx8MfScoUovaGnc3NZ8wHGFvqNbIZ
         8b/4fEn7ACKQX4B/Z0IrVLOb2yPl2HinywA5+hamzILrkLHPW78wIgP1MjQJVvv5NhjC
         ihPjZxRJS8KZp2seMEby5UqbvtWqDJwxwqJlXcoh09QG+LZ7LgPLanHWMFLEi+oRggdO
         dsjI5SH8pKUiSWF4X2pPAhO9pAODQqAIzZILSyWgoIxKDtn4K/qtfBGXuSBtWbG7kvk9
         KTKnqUfvUa6ykN/ajR5MbDfuq39itxYbBhbiontEyRrawuEQdREhH7eszpvchmBSTU13
         fb2w==
X-Forwarded-Encrypted: i=1; AL+hErGnWQETFiFutx4WuRkSq/aWqldLv5JqY36qAom3mva9l4+79snc51eNnVTrV0Maaaw+tqky3YalhwUh@vger.kernel.org
X-Gm-Message-State: APuU4Z+nhn3VN8WqTqUz6HxH1biGO4sJnGvM5EY2uqpDBEYFhPffoPyA
	G7GhaxvtH39ctCoqp9rxqga2zul8Nn2jo7170SnsBi4HQsclpQJUiiD8VGR+jl72
X-Gm-Gg: AYBFou31LddwO7058YxE8Zp92KhCYd5fGaGWgCS2UeZxbYK8nYgD2+HLR3kqedW4dZ4
	ZIbyKCxPV0ykK3s+xKsjZ8DsWllXQXLzSoep3dd+tGICR9CC3+Frzm+M1kBj4AZ+Msgax7MfmDH
	HeW6E0l08uYT8NV/1+UoVXjKORvSaKtaXiK1IIF9ZxI5e3csEtbaG/ctCA6mHgqRtlkf72N2BUw
	sQnqUGFaB837VFR1F9phuX9G1ZIcVewNQXlCUapIeMKkAGrBEh6wwKOxt7PCRf7vf7IlAHN44Mg
	EYp+TXJVqoT7dSYmlcUe8UVfsLI0gzYi105Ab4Eh+IUBcQgoCHT0VqJ4uhMzZBYGWg6kgHec1gZ
	47N1OkCCeTI7A+TiOQ8ZBKrbrg7qbpMK9x/B0x6mzVheLFIq8wnrsTqq7qq9Ff+i5pICSAjLk5m
	7ZwVwJlWkO3w+q1QcYFFCiTCw7HBoXVPUNbfb3N6uHDOLYedkhTtaOQx2HF689dYxSyzyYR+lsD
	Rk5MxcRJZYSaBX3bWWHyGhO1+eUbaUPFG7oSCdYofjsPhh3DcOulOi6elyqasj332AgPM59Cl2A
	4bFR1YCLoX55smnUXI7aPpAUQbfRJkBb5uoewx/hxsrFrn9+
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb6a5a7a48mr7149015e9.20.1794690102290;
        Sat, 14 Nov 2026 13:01:42 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb666a3ca1sm68359985e9.9.2026.11.14.13.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:01:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Date: Sat, 14 Nov 2026 21:01:29 +0000
Message-ID: <20261114210129.1925778-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112-alluring-meerkat-of-elegance-dbec9c@quoll>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com> <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com> <20261112-alluring-meerkat-of-elegance-dbec9c@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 12/11/2026 12:16, Krzysztof Kozlowski wrote:
> This goes with the SoC/board bindings often. Why keeping it separate?

Resending, I forgot to Cc the lists.

There were similar patches for other SoCs and my DT wasn't ready yet.
I'll add this patchset to DT v2.

Thanks for the review.

Best regards,
Stanislav
