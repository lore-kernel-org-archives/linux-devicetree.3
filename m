Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0C2BDC28
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783773438; cv=none; b=cB2OsOYdYxP1aax3eujo6+WFrXZ5tVskg23qNcY0F+t1ZvpMsdnqAnH+LEz9Xf9hd3yj87WzWRR+X+ENgA20MTi/LgTg+yZMKg7Eq9T5VoPpGkOPRjckoYt7OOoZQQ4N6Z83q9gQvisqO8amGNloXXXsxp4ubsqyNE6KaKJdnvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783773438; c=relaxed/simple;
	bh=ler0GzfWUTyNFlLtbWwwKBYDR6wTO+FQxowU5or1aQw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tme/lxjI9eFsNhcvrYqdb9Ys+dI5g1xmzOAnSsz49mTMKFqg0zgljjOwxbr+raqAJ04uCPnwAcT/A+qplYsudhwp9vFKDcJECvJjp/3pB1GMuudEun9xFQmsOwZrx3ciAC1LICjIW3kP1I7UJiHKZAAju/zjoBXsVT0tuSsK9Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fxdcpi4i; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fxdcpi4i"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b1710405so8389855e9.2
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783773434; x=1784378234; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=657uWlKxYcjOrN1ZXHDJlUFUQIWJmQtJufOMVNxlA+g=;
        b=fxdcpi4i7FjwCmco+jnDh8SipaouenBpGGu0QHIlwVUxNpD3S/RzqwR5LW/CThwqf1
         NQutWwt2M+X0Q/TaYpfr2QvRbnLHO43AedkRk5awaOR5R1CwxjY5+Ivp26hWXRv+11BP
         LTuLXNoUUtqRHmx1pIujx6uTbiGxNlsnSwcx7wuNhvooFKbLnb/LfQf5Dnm0AqdGlIGG
         uhDGyeoxV4CKdXFiVLEV9Cbbq5hSBhzsTp8kRPzlDNb4qNHmGENiQ789/aN9xJiGJnZi
         /n0ZXvw3aEgYbAHsS8pK7d/iZ7gj0/fAx27okS94bxFknCY272R6aZPZGU6ijSlyR29t
         QcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773434; x=1784378234;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=657uWlKxYcjOrN1ZXHDJlUFUQIWJmQtJufOMVNxlA+g=;
        b=CYxcL7CR1TC4qApkVqCGkwMeS1WiGyNLZrvkc+L+GXgglw8CVOhfp+HQ5oKDZclbHK
         wchVR4WR8EZd/vxLAyStB+GfgdRBh8Mfho+XF6WKot+SqleKsfZSYvxayLNWgcgSp38v
         Gm9rFjHx9W5FiL/Y0Apse3OWJMYYxiTwQ1kcGg7YMGUUqyN8GXr4P+lQjMq4MIXB/HOO
         pRBWKZ25Gs3L3BMqS0T8IR2sKOUgJF4tbH4bXpJ77euwBJT47Mjtv2j/oDqK9dMAnMA2
         /eVdCrgQ3wZDMOOv5KRH+1ipLsQ0uLXG0dDAEzUkRBD1V4A80O4TbUhW+CQ2IMHO4+g1
         nNFw==
X-Forwarded-Encrypted: i=1; AHgh+RryfCbQj/nvVLc5/4AclNMwqT/3Ax+0NcC1odUXTrTxhs1f0EazjueybJAT2WCW2S98a6vvHrMvLdvf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0FQdOgAbSz9ZGEW/tr6KW9VU/ph1sDjKZaV8ryPFOo12xQOJj
	Tntnl9pE6j2wCj7x04JlttKhV0ibrpLJpLYdypY3vKdARLmiKUTO8zlrgm/pTVDa4pI=
X-Gm-Gg: AfdE7cn2wvLyN7aWS7mLpAdPxzmTOWTj6Y6g96/XnFO1lcgPeMygKCcsFU8moqdMNfb
	krNoijl8adwR231ADhBYP0uJfLaLuXVWWOer2LwV5n1xRk4eCh/cxNaM9nBqmqPz4igNFUvD4gj
	YPUGqwfvzyV97aZ9S8uxvPtHd6c4U3zeYUaF56Alg5p236oxylrcPnxv1LUTDG/7KTumBXXOdlE
	Y6x6yBaNTU495L4jyzhXDt2tNC4722AR3U+dOA98Uw2QYPjK2gxTAccCrCsvidUsN9VpU/fAq6P
	ouH+JuHaoVqPcs1+xz6hmBZb7J7vwXqUZFaKjS1q1kLzpJ1GFYBP9GaaU7De2YrU2q8C1sessWC
	igThD/Y+y82VLXyHgnF9HEtnKlpccA3IGCkB2IkkVjEpITTwO8/huG1k1jgCzXTGMZTeoL5iV0C
	9hYgZ3oNzz8xc=
X-Received: by 2002:a05:600c:a31c:b0:493:fd5b:2d5c with SMTP id 5b1f17b1804b1-493fd5b3043mr44175e9.22.1783773434236;
        Sat, 11 Jul 2026 05:37:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:36f6:4178:92a5:91bf])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f2dad65fsm87890305e9.1.2026.07.11.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:37:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Chen-Yu Tsai <wens@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Andre
 Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 3/3] regulator: axp20x: add support for the AXP318W
In-Reply-To: <befcd3cb-3452-48f5-93e6-03210981bd76@sirena.org.uk> (Mark
	Brown's message of "Fri, 10 Jul 2026 18:00:24 +0100")
References: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
	<20260710-axp318-regulator-v2-3-ee5f1c56b49f@baylibre.com>
	<befcd3cb-3452-48f5-93e6-03210981bd76@sirena.org.uk>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sat, 11 Jul 2026 14:37:11 +0200
Message-ID: <1jmrvxg0so.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 10 juil. 2026 at 18:00, Mark Brown <broonie@kernel.org> wrote:

> On Fri, Jul 10, 2026 at 06:19:27PM +0200, Jerome Brunet wrote:
>
>> +#define AXP_DESC_RANGES_DELAY_OPS(_family, _id, _match, _supply, _ranges,	\
>> +				  _n_voltages, _vreg, _vmask, _ereg, _emask,	\
>> +				  _ramp_delay, _ops)				\
>>  	[_family##_##_id] = {							\
>>  		.name		= (_match),					\
>>  		.supply_name	= (_supply),					\
>> @@ -436,10 +481,23 @@
>>  		.enable_mask	= (_emask),					\
>>  		.linear_ranges	= (_ranges),					\
>>  		.n_linear_ranges = ARRAY_SIZE(_ranges),				\
>> -		.ramp_delay = (_ramp_delay),					\
>> +		.ramp_delay	= (_ramp_delay),				\
>>  		.ops		= &axp20x_ops_range,				\
>
> This macro takes but ignores an ops parameter.

Indeed, completely messed up as noted in reply to the cover
letter. Sorry about that. Tested something, sent something else (and
other mistakes ...)

-- 
Jerome
