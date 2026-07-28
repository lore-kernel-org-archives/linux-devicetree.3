Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3613C3D6CC5
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232895; cv=none; b=oGD3flrhy2ZSIAR9KoRCm7CSLluTnJbLsbkzNjhwLn/W/qCH4MR3XZ0Wq6Eyr0OSDYXrWcbjMAyb4349NmE2UsOvEocTHMAw7kRYuMbaLaFdtSDe0SJHiXmAL5gDooDuszKjttP+IHFJjcet+YSjdwotfsGbOAsdn2udM3Fp6PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232895; c=relaxed/simple;
	bh=bKkaqAxKDslyY5tu1jBchfNPLRe2q1WdVkhkvOhTNs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWEmHbgqPpX6S7xQg6LI6k+E1IdES//VWlC/mmk3MG422xAF1o0yMkFohbtWkwzUX+mpT1+aAWoAVaJbHu8PQ8uvjfADd1DeLxveNGs1JhPCDtWxQGrS90Og2t+a+xPcjMj7sZqmShxbakHl80W4E81vhCFX1r8z+P7WRaekrYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EFycYxgn; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EFycYxgn"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69ffbd2a277so3009311a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785232892; x=1785837692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEeoUs3PfQSMgYTm929Uz2Dor8kEgnImRfKTABiu/ws=;
        b=EFycYxgnaaLzuu8+UdsS8MEuy+QZVFARVwpztWYHoCWfWGOW1jm6zU8jAhR5FT2WUG
         F1lCi3kAUBW/chg7Wz/grNokikRnowASZvSogQXGNn9cs3GTZMErZZX+nqmhwJe+Acym
         QWfloI1zlz7E8mCsxMmb5eA7Cb38yt6GroGuAJaq3HjTc/WRGJOrpjTGxjkxGWyCmyUV
         mq6rJ3aObtMD/30HjqclWWdXsch4dQTPgsTdyb4nDBSGMPs+IHcm76kEwXww0fc06wAI
         PZTeII/Yum0JQ4eSljkoCvrRzn49eAPXJxO7ukx2MIbKtELdcUmM55LshBa1vLOScjgE
         C8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232892; x=1785837692;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEeoUs3PfQSMgYTm929Uz2Dor8kEgnImRfKTABiu/ws=;
        b=AC0bPxq5Luy3+2wFC1AU75B5Zlgs3XdG/GvYYrr+M/UVHUJxq/h8aC4dMFltil7zCK
         VPFd8iboJTiPjcz2Pao4biLsoXib0eyv6rDbplgkwQHTOTLGPTHZjmnUDzBPM9pGh/ar
         MUXwpJAkGU/SAp6acbpmfByE57jCPEn/aktkOTlAoxQdKouco2PhgABhDBCZbShjynfs
         w8r4znQxuNUmyXPYXZgk8yrokRJi2Cr8DyGKnX5oQcbN9vxFm0bULf1yPMcUeIVXLgpf
         5dE1pc5bZZZgrPkCAU9zN/+SlrWQkFd1ucikPuCRq3HzTcy3tS6kzgtg5otJPJxAkmwm
         OHOA==
X-Forwarded-Encrypted: i=1; AHgh+RqtvjBIF0ERyf3+UnUe9CDjD/OheHIWMO1f6pvRjPBBCDl6C/PR9iDmbhuA0Xp+ufyg7ftzqmCQgLJP@vger.kernel.org
X-Gm-Message-State: AOJu0YxXpR9TxHIrsw14zphaup3aDkgUpPkuh0NMFOdyt1MqnZAZ7iQF
	2QmOo5TP0zs3p42f5jv1tms7L6nYnl8KM/jX5ev/dJ1odjqD0ZoFnAocPIgTzITEn5MVBA9pl3n
	y4TIP0Ek=
X-Gm-Gg: AR+sD12SJp5XLJVbkEOa2QM4rVrUtJZ9CgFSinyYDisFakV2RfnOnof0p7kpjIadl/v
	y+n+GFksyVrhj5RzbIsoEWKn2sgTAM+jA6C+7i1488XvsLjGHfnDUNq/tZeFimBGp/8Ybw65yT5
	Zi6mvIdB7ubeskq8ppM8ssnKdWpDetePDAguobDqdix8aqf/C7VDF88xQ9uRFxujoyTUatIzhZK
	bK0PwV5PFO/aq1cXUp6BYu0qh+Hlb7OOLTYL16TnvJC7Hc6AhVfA+72Ii2u0D+3TWB2FmhI7/wJ
	u5A3CrrtQXjE4WS/AuKx3Ze61NoMpuVDOGMmTe3zZIjgBzOAwnEehEClFnp/6TCGnoEweMhuqo4
	KGiiej0xrESO2w/5W/u278zu0w7gbGWKt+dS13PhOUCNIYO6FtyYBCgjq797YqY4rsUcSGWuO5m
	aRbQv/n0teSzCKDw==
X-Received: by 2002:a05:6402:5114:b0:6a0:33f6:13c2 with SMTP id 4fb4d7f45d1cf-6a034a5efc0mr809800a12.24.1785232892204;
        Tue, 28 Jul 2026 03:01:32 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bd467sm3697785a12.1.2026.07.28.03.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:01:31 -0700 (PDT)
Message-ID: <328f2c30-b43e-4ae4-b926-7375f5edd5a5@linaro.org>
Date: Tue, 28 Jul 2026 11:01:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/5] phy: core: Add phy_get_by_of_node()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org,
 media-ci@linuxtv.org, linux-phy@lists.infradead.org,
 neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-1-ae811e2f0799@linaro.org>
 <20260728094619.830C91F00A3A@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728094619.830C91F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 10:46, sashiko-bot@kernel.org wrote:
> [Severity: High]
> If a caller uses the new phy_get_by_of_node() API on a device node compatible
> with "usb-nop-xceiv", will it bypass this check?

No it won't but, it is not _supposed_ to.

Literally just doing functional decomposition here. If someone misuses 
that decomp, that's on them, not part of this patch.

I don't see much point in moving that specific workaround into a 
lower-level boiler-plate but, its up to the PHY maintainers to decide.

---
bod
