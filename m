Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ACC38B12B
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478952; cv=none; b=nFR24GeJLlj0iJPLM9QD2dM76juEWAzG1QPHkmO6WZjGYjfO/iVkxo5E1Ua/Z56XwC3toYyc5VP3R5rujd6OZfFPB3WLJiWdXcqgZh9t7I41MSTegFhrhd/zIefafN5ooUGd6Gbc++sFOpKdOGJImYFByJIs3++X0v5EaugemlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478952; c=relaxed/simple;
	bh=b0FwIuZ5pDLAhzbYxcTxm/lAPKiEu/hDBMREzsHSOvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7VAbD7Q03eujOBtnAIMD/vYu7vhru7pUS1vHQ0QWZ47W5yoMCdK4ih+ZI9wfK5L6Jpw9EaxHQanY6w439akeW6HM9AHiHKyQi3zl/2j9SGpLsA5zAv8Lmu6kmbkTjDtVFt+Yv3OXubbF2EnYZd3SPe7euuHNFMSXkbm94BYBAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dkz9MkDz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dkz9MkDz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84229481d44so1580312b3a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780478950; x=1781083750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0FwIuZ5pDLAhzbYxcTxm/lAPKiEu/hDBMREzsHSOvE=;
        b=Dkz9MkDzV8gIFNHcIMILa1pFiIoo+peVWML210SizsPzQTAyUERBvIM2xd1Wpg3wP3
         MKWe0ckiaiHD11pBDoG8PprfXkwePzJo83LqTG8dY4ewLgOv5Jqb+OprOVajNH784lim
         743YtLvWL9QCxx3zuYgO40BnByOROoMxQHlJVB8Kr94AqmzFqWxvju0W8TiX1lUEdfJe
         +3W7JM8T90xB/p5eM1UxiNSTL3+8rl+02Mhef1/wasDmfalC+aAf4SYZXXB17cr/rFVW
         06usqO/v0nbhBB2kia83S8f6y3h/6eNir8iYErEFqDI66cxxoAjYS45i1QWeo3wo7yZi
         hWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478950; x=1781083750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0FwIuZ5pDLAhzbYxcTxm/lAPKiEu/hDBMREzsHSOvE=;
        b=dN+plkeMgIkmO9Urd2TMPfnB3AMeoUUimyOowe+Zhq3PuB87sHaIRH1jARZ3lUxvo8
         1LV4H+PTiUVbxbmZS5fKfGqMjk5hqlxlTxvlChqrelgdTDBS6EWwh26kgaD02C+9mhx6
         7GVZhAqax9H26D+xsoT/Uz46M37PNXw2+X6DspFkB3MKkiVNlLn63Z4AQJlIf2ERFhAU
         nlDWAOdTXiftyU93iL+Ldy8HgXf8FiDiGnI4Ovax66fMIUqkq5hQJMJ1wNzikM8nvz/7
         D0VNNTS8ZcQG1U89TClSeEeTqwTRatqZDuVB/p+iQpOOaVHEOEWLsyFN9EbCt97TewNs
         1bjg==
X-Forwarded-Encrypted: i=1; AFNElJ+RUiql4RfaDgycIIlx0I6o8VT/u8E2UNvvcJPjRnR8jbo72ZNh9R3VdpDGClCCoxFhZ545AZ08BPCl@vger.kernel.org
X-Gm-Message-State: AOJu0YwyuqYf2W349+bDNipK1MI20Zia1xqXFjlP0F5WgVtZ72GBm4+o
	prL0P4R2kz7Gekhn7DdZJW/1JG8GEtgqMLjeNtVj7G+qd0WMzB6HLLHh
X-Gm-Gg: Acq92OF4Q4uwO3vrryVLYkNqMvOtoT7ggNGTXWMPrBSamZcofUTi+6PzTlFhdvYonXx
	gXp8LJ2a9slgpbASEZUCqUWZXIoXvDVSpMh10xz02JpQJEZQ2FDksaPAZLjolt52B2RMeIWxgZS
	Z6MBcvb388PJXIArnMOCvcnn3nZn1lXIs4k8lb4c/eRA5peykHMoC/vHFsXwL0UQkYxaoaij7Jm
	V1Ne2NDZnSgOis1mi/B35JH1iPFSrYUFf3TRavIFyxW4QBHlaPaxCum+O1ZtAD465lZmfgr8dTS
	NTYglhQmlPo8vrZC4q/9MTsGWQMo7PTi++c3GgZrp+D99fpF62KRAEZIjpkwJvLKrZBgOSTxeOv
	epbmaFNb3ZIPi2B+XZwKtLPnORgwa5HLfgoePpXaeL2gBNGPFI0gzXrUtAwZibk/fEDJ1SBW1qV
	JqE2NLTrwKeKxnYebvO+dRDi/WHnSvjvZacORNyQmB3Ws+SXej9oi8ll7Py2N4nDgxyxR5n7Cvj
	UsCg3fnODoNfA==
X-Received: by 2002:a05:6a00:27a1:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84284e3636fmr2479696b3a.6.1780478950133;
        Wed, 03 Jun 2026 02:29:10 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm2370530b3a.31.2026.06.03.02.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 02:29:09 -0700 (PDT)
Message-ID: <a9417d76-eb10-4e33-98b6-4cce7bc3e190@gmail.com>
Date: Wed, 3 Jun 2026 17:29:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-2-cwweng.linux@gmail.com>
 <bc0f42c0-b85c-4239-93a4-429193338f99@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <bc0f42c0-b85c-4239-93a4-429193338f99@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mark,

Thanks, I will fix the subject lines in the next version.

Chi-Wen Weng


Mark Brown 於 2026/6/3 下午 05:04 寫道:
> On Wed, Jun 03, 2026 at 12:35:50PM +0800, Chi-Wen Weng wrote:
>> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
