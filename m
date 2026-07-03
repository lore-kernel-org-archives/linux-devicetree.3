Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42712307AF4
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096739; cv=none; b=J+zxlkJv66rAe8rlVnSV2fXU6ryB0+98sZoIRKs2XJz0dDUnOPYPEUE+JVOZsRm1wUI0nD5wGoZ41KMA8FATVCz401PbRydswcAjsxRqDovtL76LY5T92xB7dCQRzz2shjM1Qf9+cQOFq5V62xu32CaXNtqsEfJHu6Y+LnFtooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096739; c=relaxed/simple;
	bh=nrFUeTISsssZEEKhYbH1QGl9yO+vtAmYijszoSwDM+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaPRWZmvhTxwiJ0rPynGve8riY/WutyUNipK9j35RG+CgO8r2aaDdzaMj1/1a6LtXQn1Xnv8xia6BC4zoggeZollfVri3hF2vgStDcfYMUNyROLX2r2bFF/qTYDOfffJStudF9u0NU96Bg9BlSNsfitoxKXNU4+2nUz1gi+6biE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ggyc7vlG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ggyc7vlG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso7322205e9.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783096737; x=1783701537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Dq50xUh9vnokWwn/2MgFrw6Bt3+wGtcUaeVmHV+z9uw=;
        b=Ggyc7vlGYIbSvGqthNUShze+DJZAsTFUaDbHlq36g348Cdb5niXyXxp+sUWKHgjZWW
         eAktUxb/FEeX2zjqolnvhIFfjnsSUM6IF+vE0DeFqf2e2MklvJ8S24i3B6z6IMQ+ZY57
         9fHaoxM8umqHAHCrQ/dL+d7M3gZqPtFvsf6FWe0+LEzGlVDNpXdJsP7zlzGMXwogqbPm
         6El1qBPJ5EOA+2SusUKKkFY+eO2ZuhsElxh+wP4lOQu4/Rqad1xhZUlR1/P9B07S/iw0
         dos78O+MNfgcRplb6Pal03bPOllpnhKNakd0DUCNuEPonPvHYJHLGjmZ25GfyhNZJvfH
         9QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783096737; x=1783701537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq50xUh9vnokWwn/2MgFrw6Bt3+wGtcUaeVmHV+z9uw=;
        b=ShXOQStsxZ0W/FtQ39WswZeAJ1/uQaVaGSWrOdFkY7s/cweDKaZrEehkimcKtLSVJN
         MHlGXY13mLEQJsbhYWXmeb9aBFEJlUJqdBOY1/AMBZGbdzGksX63iJEvrKe2tCdQO4aN
         J4d0jbtz44JKj6muXLlIPq37vc1HNZHXSWUnXKzIvgWtDx6Oko8sY3NnBRtDnegsjPal
         +fyZc6sThYjkqaxP14OAe2so3MEFiu6Puuco2kiQqVI+uakTo1q4jhozuZfJWInf1YgZ
         NwMonofy9PIn5WOmFNZ6APfW9y6llVeGooHblLnuQmeDw92ECAZ/xzJfnN+L772yVa5E
         zL3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+UtimvATHnyItYvpl42zELY4PGRJyzzaX7v6xfv4eEeYWvgWvRLrMGKwn2loMl5qnAUXH7nAO7L2og@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhz/6NncpzhVRY8t1Ud7AD1Tg52pJxEut++T8Qw99PwjXOu2xD
	vWMIpK/J36/32nMODqau/H8Lnz6oIMzteGVFe26CKJzLI0wwNYH5cGBo
X-Gm-Gg: AfdE7cm34QwaTkUfphQDdYDnMYdTaf5cpNoRrqGq0zgI6JCckJchga5p1R5Y6ymWHcu
	7QzAiO4M3SMIkBNvroP8IFN0eXhraclwdkbgNICG1t+EiWRCK0xtlSunIJ2difl6xbOPzq8Kcwf
	h8LqCYOiEJMF2gm+xQh6MCl88ZwWW37Bfe5NSQjH4GX+3jh56UMD71DnoQii5ukLMBsJ5FeNaxx
	swmxeieop5vlS0O0BqhpI/NQ3obRJ9ah+4i0z59XtdzH6+vP6nVrERhzSejz0uUafoW1H4tIR9E
	Yy7qL1/ypXdsHTH27t6vgg/hjMQmROGLGdAhW9zK296FkBwGLZSccTtHpllibwXwBXlCYpZQZr/
	NDCJeAgEKNyHkZ1OL9QGiAIf1S7NpbGUfAZ6ccKflBkBFrhCZDZEi7z43EUaVvUb6Zp0SPF7feY
	1BFzVZviiJEqCw4/fe/WR7zpK74F6RrOclVPSITdkXiwChSHSoWvesjYf0HqNEcYpbEUS3KGSzl
	d/WVPxb
X-Received: by 2002:a05:600c:8105:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493d11f6cfamr400035e9.26.1783096736053;
        Fri, 03 Jul 2026 09:38:56 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm82259395e9.10.2026.07.03.09.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 09:38:55 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c4c658e5-9c67-4e19-aeab-39d98aa71f45@gmail.com>
Date: Fri, 3 Jul 2026 17:38:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
To: Andrea della Porta <andrea.porta@suse.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
 <0b6a7f41-b753-48dc-b46e-77aaf0e999f4@gmail.com> <ai-dNlC1_nbQTy5Z@monoceros>
 <6babbdea-fa93-4cd7-8198-5cd3accc34cc@gmail.com>
 <akfNrGoa0bitVSu9@apocalypse>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <akfNrGoa0bitVSu9@apocalypse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrea,

On 7/3/26 15:56, Andrea della Porta wrote:
> Honestly I don't have a strong opinion on that, but documenting is basically
> the same than just selecting the option (well with the addition of the #), so
> not really a difference. If there's no major concern about that I also wouuld
> prefer to expicitly declare teh selecion of REGMAP_MMIO. 

My preference seems to be unpopular, so I've adjusted my reviews.

- Julian Braha
