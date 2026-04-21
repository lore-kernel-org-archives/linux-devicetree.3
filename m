Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21AF3D0901
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783474; cv=none; b=J7ICC2gKrYZrjl8cLIcTBQmwFL7uWJulu8KsrZVN6X/ff2Rs+XKstHrU0yse9OfkH9WiciOihD2KovdC/0tFqCTIfCW26mCpTDiCFVSxkG2d9+TYMIx1oSswhlA/o8BImAKQewUGTdIGofvAWRC4RqMRr3MlZKTvqRGuzji7niw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783474; c=relaxed/simple;
	bh=sI4tU695bTV6TvPOEAsLoW97lOBDjDwkIEx1VlCb8sU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OhWRuYHBUR1l+zOgpZMbnfEfIDsCeUOrUybv5+WduCLLeFTzqT8r8o8LJvqcQ12o9DTZudvnutruT24cMgKQ6MewL0Nk9X9U47ryTMgvtvW02K2GpVIVVot2ackRb5ObuuXXs0/9QaQtXL8wvvhmFBjGX+7z8JyU6qMpi2qABvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=NqmGB8xJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="NqmGB8xJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so2022636b3a.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776783472; x=1777388272; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mjuJmdvwe7PzDVz8q3vHSG4MYXWlbBcdt3fOBIwOXE=;
        b=NqmGB8xJ5atxCZ6ANMHcZ7HWjhaOT3MghDb/266say1LCjumu2ASpVKA/Pxfo/Rm5e
         05qcXey7B4aDxUZazeYqcCzdSuZWfmwJoMGW5zH7lHuDCfuUk/Zu4ggFgGCGovFw0ViZ
         d6qn8KbDUlenmVvUQVFq9LetKA0Fqp1+Z/+UTi7PdBtS8RRt+sedLQss22HSnbvX8/+z
         YECJ30Ulk7L9QqlpbnANw4T3qTuM9ZDQvdvCiE+Tr72LUJ/zSXAE/iritYuuCX82OsNm
         SVlqAk1ypEtCF2TvfNHdKV8GnfBpH//mKlUHvWksvJ5MMMWtB8R3u2SHfS3zsExQOzQZ
         SY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783472; x=1777388272;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mjuJmdvwe7PzDVz8q3vHSG4MYXWlbBcdt3fOBIwOXE=;
        b=mkwdc4Eb066ytGmWePZi1BWC4CnyLWvUa/yrHRw9TAHgsdJKRr76YGDEilJ9UNrNUs
         aoDEBeF8lmjiWYEUsGotZ8oBWK63KRzgIiYvbrY26Uz5/JRZ9w6wLfAACdCp21O4UsK+
         2WM2IUnQzwK5ReWFocZyz32WP7p/irgwzpIfwkvvQX0mpHXz4wVCXG+j4pd/plIcebsd
         aVcfbbN9tVHN7aRypIDkevivls2uP5JpnUBGJ5G7H58YwQdhEeRrM+bp1+daktl/Nj42
         u/hK25jaNY8g4xluZvSY/VdXzIuJbBmuESiO2JxlHKmgJ1cOzMaAqTtIpJuDrFiPaVn/
         JaBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zDB9sCYee7oXzINjzNAFKovcHO85rlfErA7WFlmqyXVKTJEeO3poH6sPcOR0capLirqmrfmI27lMp@vger.kernel.org
X-Gm-Message-State: AOJu0YzO5oRgvzg0iwd+qlCemth/xlFaCOpEsCV2S0bJ3MEEycYfzk+n
	jh5/qhrA7FlfuSuEAXTxFX8NBpXBZzfa0hCky1MGu1q8AdcR9VrBGd3Y95hGK7BOw/tY+kYoMEy
	veRpzxp0=
X-Gm-Gg: AeBDiesJyT1s+JoliFOfBq4WJlrufZotB3+1Y3ScIdntH9RtCZM6gOm8x0LVqRmftbc
	D9WQQ6ONV8snfabInqi+mdIUDhHBVymd9UvmhC8F5kKhoJmdtYUewTL2W9lLis0WOWlMtvTPg6w
	KyJbIm1HwF13stlqc/80z/9Cl6XxW49g525USMcHFTOjpoyf+34GHztwRpQpXTGIrnsemYRj9y8
	ECOSSXSQQV6LtzRQq8NIiGAYBnkp9hYly4cpd06EAcOCietPO9MB+Dxyfm/qnnfEx0zc9+7jM97
	sCJo7m3TaIADk5onMO1NkKlIGJZbi1eYnebyt/T28AaLJ6x5GZHysvle/YiaofCozJIm2UeHdtY
	/fWgC5SuUIJLwZWd9/0iB9ADR+o3CbEjL0jjlfp0+0rVvKk0qLuo9gtiq9M/OL69tzNrgPKSlaF
	45nWKm0sM2a0AElic8ZGx2ap0M3ZYNtw==
X-Received: by 2002:a05:6a00:3c86:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-82f8c8bee9dmr18805718b3a.32.1776783472262;
        Tue, 21 Apr 2026 07:57:52 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819fesm14280551b3a.4.2026.04.21.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:57:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add power-domains-child-ids
 property
In-Reply-To: <20260421134949.GA1045294-robh@kernel.org>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
 <20260420-topic-lpm-pmdomain-child-ids-v3-1-c2c40bef238c@baylibre.com>
 <20260421134949.GA1045294-robh@kernel.org>
Date: Tue, 21 Apr 2026 07:57:51 -0700
Message-ID: <7hh5p4qs28.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rob Herring <robh@kernel.org> writes:

> On Mon, Apr 20, 2026 at 04:51:17PM -0700, Kevin Hilman (TI) wrote:
>> Add binding documentation for the new power-domains-child-ids property,
>> which works in conjunction with the existing power-domains property to
>> establish parent-child relationships between a multi-domain power domain
>> provider and external parent domains.
>> 
>> Each element in the uint32 array identifies the child domain
>> ID (index) within the provider that should be made a child domain of
>> the corresponding phandle entry in power-domains. The two arrays must
>> have the same number of elements.
>> 
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>
> Missing my Reviewed-by.

Oops, I thought I had grabbed it with b4, but I didn't.  Sorry.

Kevin
