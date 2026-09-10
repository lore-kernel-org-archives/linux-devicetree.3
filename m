Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A9131195B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039670; cv=none; b=Q6admu7n8AF6EW2wrUKJ88THgyoCt4MyPg3LJW5L9qT4H3ih4IUbW9/YlDImdRvHj/eAIY2fUJpz9UEwwG4f1fLRXBDU7qN/6SABEnzSWCWmEst1A9h+1Hwa4AphflcVeyH/oaujKT8Sr66KhAfnnfADWsjs8p6qZ4jVezNDAoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039670; c=relaxed/simple;
	bh=4CrwJ5iXW29xR1B9ic/OTu6MoVXyZPeG0uhyIiSglP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6l5PFbXdH1hbfakttoy0Ep9Ikb2NR1dtAXojj1CldinKNCdt8yOAXRZOhV27OHA87ARjT9LWd+Zlbcxdb3U4UWqvq/s1NH49UKre5xaXo/kXvGrZYDy7PRyvn5z3fSazjNLvO3MDdPmu0/DYU7XK4z5hyEOy3K4JN6q1Y5uyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MJCXj8WS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=izux76Sz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MJCXj8WS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="izux76Sz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789039667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CPMSwBIbKMNx+ykYOgoG6podj5+4wemD8bUPdP/A1E=;
	b=MJCXj8WSkdJOU4kBrcYrtNh5iZ3/9EPbh3m+TCroD/mG+yyEGfIygEBbYNdWdwZsqsNL1g
	rPZFMoica5ikNQ//JfZFbDA3+NHymVCaHZgH1QR+isaMRx3Q5toiDyWIC6AcDKRjYg8+lb
	0x7iBWO4xzMRCSsV4DQnJ/aX8eU3vXY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-8XLV0aKNN1a8TLAiwrDVGA-1; Thu, 10 Sep 2026 07:27:46 -0400
X-MC-Unique: 8XLV0aKNN1a8TLAiwrDVGA-1
X-Mimecast-MFC-AGG-ID: 8XLV0aKNN1a8TLAiwrDVGA_1789039665
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so51899315e9.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789039665; x=1789644465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CPMSwBIbKMNx+ykYOgoG6podj5+4wemD8bUPdP/A1E=;
        b=izux76SzTENHbSScXgbbMmRTlrqgdhguBEAikDl4vkPnICRo3adFI9u86//LjMm33q
         DKiUX0a55TYWClXDZ1xZ3rn5HDrHwDnBbLxILzJRmRyCe41Wnly7QDEHoiIAQSCrveo1
         mSBH2XtJe+2h3FiSM4n9muKLZYvGTDTwkq3i/ZiXKlLqQav1ebmkfft59OHyIoWpJSSA
         vRb3fQxpdPYOfecic7kB5GG70aAFiDFJR/lINDdLwToB9fSR0+7yZLkRKZEkB74pPhe8
         1XOxviH8qyGzo6MKES0Hf3o/6cJofGZMra1J/Af+23ZQkvpgHlIvKvUsRcxqX4E7Esj1
         pjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039665; x=1789644465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CPMSwBIbKMNx+ykYOgoG6podj5+4wemD8bUPdP/A1E=;
        b=UXyJjl0k7M4CFQq8k4e/f8jOFQVa2rbJH3lxwZbs9U0C0V2eXXzW34JixpceKmnlej
         KFKA9DZiTAmygfMMDX/buOzfLNpwg3XZ7PtB2FvvW3P/RWSoekb7hLxg1DXmXUOdSpYn
         YTAc4XJoCfWSs6viCu8nmrdZxK2L2BSauW1BTUymRSxzMrfwJLSQB2Qutfk0RskEClNG
         7nmHNiedGAL3AuXBPJIpdkiGgL0YDCM2NzpTAOJ9kAvWH5yMXxSfOnSQbc3f/YA5wzi6
         4tdzjdqkWArx5NvLUtd3bsRAwMTe4fwMs+Ku6aZ5ywCgMQ+BNCg9nlCLclu/Ctq3RqHK
         GHdg==
X-Forwarded-Encrypted: i=1; AKwUvBwIRWxqgjgoiQEI+GzGUi52z+Dzxk1pjZ+lxVftzMGNhYLX5RnO91cZl9luNmKrKWO7m/AMiM7yMJuT@vger.kernel.org
X-Gm-Message-State: AFuF++mnQtlBf9DazDiAMbyDF9ip31dRVKGX2lpstbsHnTorp41RSidA
	blXHQt8luawC/JxTmsRY2+GWdaAZ2SU7xzPRTuYvS1XeH5pMDSZqjx+XCWA5PS3AL58JZFLg9Hy
	un8uKbM2OeFLQBLKfEUszaCLWHcyD0PqbI1dJ6XDKCA1Iwq/bKKp/4/BrQu4SlFwSUGHmkck=
X-Gm-Gg: AYBFou2L/mKU1oYKGLKwUvPJFZamUZT0yIjj+jur6XjbPpcoT2UhuPz0ZNlLftPbwNS
	gKD/OyRLjzhsGTvP4uONgpaP45hPqtFvnvgtyRdKqbZyDB8pjBIBRHkfUE2dLN8Kvqo011Psk/h
	THPnMDKNtipVRu3dCgP6fOZRHJlrO32dJ5bTX3QIzxhjoWCVdAut5jFirtgPP+KB3U/5wZZQyoL
	JM6uCCdVq/Pbeka0eJH+ZyIqmoW1U+3fpYYXr5DEASuy97H/mZYiuSnBYtkrXP77g8MsgP65zSZ
	J65ZjBB4zVsPsujX93RxqA2oZda0PlY+7YHf50PGHwMG3tg5ztwsgHKXEayfdDSzUL+jHvhephz
	HNJkqnDrkKrl0VcYvicGGP7KIn25bXFVLLfMMOJoVH3KUTJtfkmKf2xNTHYFIts+s/2255VzhwA
	==
X-Received: by 2002:a05:600c:1385:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49d258d85c0mr59112765e9.8.1789039665433;
        Thu, 10 Sep 2026 04:27:45 -0700 (PDT)
X-Received: by 2002:a05:600c:1385:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49d258d85c0mr59112385e9.8.1789039665038;
        Thu, 10 Sep 2026 04:27:45 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm53665292f8f.10.2026.09.10.04.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 04:27:44 -0700 (PDT)
Message-ID: <013fffd2-6d59-4e99-8214-1377b1cb46bb@redhat.com>
Date: Thu, 10 Sep 2026 13:27:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
To: arthur@marmottus.net
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 arnd@arndb.de, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20260904-wiznet-link-gpio-v7-3-69f01b70c96f@marmottus.net>
 <178895754151.219967.10801079239966954315@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <178895754151.219967.10801079239966954315@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/9/26 2:39 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 1
> 
> - [High] On w5500 the carrier state is now sampled exactly once per ifup
>   (and once per resume) from PHYCFGR, with no polling fallback and no…

I read this one as 'with a bad config/devtree the eth could non functional'
which does look a big deal to me...

> - [Medium] `w5500_get_phycfgr_lnk()` returns a tri-state value (<0 on
>   SPI/register read error, 0 link down, 1 link up), and its consumers…
> - [Medium] The carrier state is computed and published by two
>   unsynchronized contexts.

... but the above 2 looks relevant to me. Note that ordering the irq
enabling and initial link detection is not enough, you need explicit
synchronization.

Finally please note commit c82ff94592fb68f529afe63ca7f5ddb7dae4ba83, you
should explicitly handle sashiko's comments.

/P

