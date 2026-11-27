Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795768565;
	b=Bb53CfNpc0QPKhOkupzGaILL32k8AYhVG6xCjd+2VXoqrLWm2gdTbqT8DddnrLhqg4zl
	 b9yxo6iShRhkvYx1v4Y+bNnV7NyW7Cr7sJ1xb/op5Zbsv/yP0jL+o67SK8fOYBR4A8LvV
	 mlM6ztiBoigmkFPMCOBq0r/M70lSpyrf5izfxRtiFJuioY5UlMaPK9yDiTTn4lBlwRX8U
	 Xv6JjW3bRggQ98yg27TZb73NkvXBadw6YypmUkdF9sCO0IdJwb10H/nTz+7pLcMj8apnW
	 svFb9fCkXKvLNkougiLvcERj+NyM+HeB0taThlNez72xep0XIUOf3mH6HJTJRtIEhlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ej0zu0sGtkHApVwWa1kXVFV7LIDw/KTsfibG0hxrVG4=;
	b=kzPBTFVWtGJJiXBDCp0FEPt5bgfCx3+iSSWvuB/G9s7hLMTfcteVXxZWBjlIOL+NWhHz
	 LCnC9X+BIRkQB9p7yfrGxuvtRKCMbAvgYfsYsFp6B7ypvTHNCNOUvTVSajMrxzzGH8QDw
	 7Q8w5A3yuQfE1z4cM+9UWwHUJ5PGFoDXU5KQZrRcFKElqjNs5oBG/guPJz0RP5JNhs+ZP
	 t7Mz2VKXFmgdJgC6sbPY/2guOczRAF7gfEVmYFHbOIG/7uGz1i4NMos8n0IyFhJ40+MHM
	 6fVsN4J2uDXHMaTVysCNB4ewWUoyDyg3ifSSreBSvEr15DtmC+H0IvIsUOM90Kxk1lA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSN4+2hn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47085606A68B
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47085606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSN4+2hn
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6bae06f2b8aso663703a12.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795768563; cv=none;
        d=google.com; s=arc-20260327;
        b=pdXJlMHloxfZjbzL9nAZVFE2hpCY+OHkaCJab5M5KzKRBgsPl0oJ5sIqlB1+ADvq/u
         4mBuBEUeSN+MWf3kwsjJuF+KlPIohMQb+MkgwbQK2sMUTUZN9geOcP/TLI978LODuYlw
         +RT+G/ig2HiPc3AYi1FB2dmDYkfWEVVvhJViTlhKjVslxT8PJlC4XbaqN2LyY/EsdXoP
         Y2wrmTk0ndgChdhcR/NISdLuh+7sXLGU67ng6wBAnQo7hjH4Xw9xDPP/IxiMmnABUwO3
         EcnL7tSImQwzB39WayElJpZFx0ksYLG3p0rbf1cVMKb/tBWKIbX32LZHlX+gMo9hpMPt
         AB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ej0zu0sGtkHApVwWa1kXVFV7LIDw/KTsfibG0hxrVG4=;
        fh=mGqMUn2Oe1WGqSks6uB2daACl9i8XFbXEM/CA9w3NTI=;
        b=jI6qLCbE++tmeh6YthufrJjYXgAOvHzCrEqolrFLV13yU2H28ZwCYXw99Dm9TQRsfV
         YcOQC/vOBIEJDTiLYkLErk3Sqf0VlISylsUxiV2w/MJ0vAQLaq21Co0U52PvCJ36YHxI
         ZvAEZ2fvS5QXOlMgclBUQN9yCjXqTFhbYrgxOzSTkURq1+YPH6qdhavJBhcuMGUbQI6+
         flHojdXU/+yo2shwVCBpfbMnjxmtQ+1ftur4ImYiu1iSDoLZbAIXuvHncMIBUy9Ft7SE
         ZdPad/IF7qmu2OFk6MoFAQxCMi2KW7/BPodPnQ8+yn7YZoDTV/3fjkOGhDr7IRei25N4
         c9RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768563; x=1796373363; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ej0zu0sGtkHApVwWa1kXVFV7LIDw/KTsfibG0hxrVG4=;
        b=hSN4+2hn9jB3YLXoQUX/C8LlGmof/bGxhxK125dMbE/TOuNJqbAHSrgdfkDRYXeeaf
         KAlSUFVhiKrr7o3bANxveqeVGUuP/NaQzOLk9R/IDyUBzc6hGUU8+8VewJ/HHwCPWX6r
         IfM/pIoJegzD+hmFzB7ZlWL1vSvnsLvsHicv4kfc2dmUuYUg+VXTHex7UyiuZuBYJiTY
         MZVrGeHnNHj/dDJQ19NUWbYftByUa01Bg/aXlIYAKOkMA/NBReZkqoiEvjJqgyvpxxAi
         IldG4PFaNpZz5CoAyw2b5rwsv4iQM95fa8EVN+O7AhxCwDJxwK9BeLGfqtDjXOMhPwvS
         nAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768563; x=1796373363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ej0zu0sGtkHApVwWa1kXVFV7LIDw/KTsfibG0hxrVG4=;
        b=u2FblKCdrB9KONiGdJyi9Jq2VhBj7vbDzkTreaskOH6gE0Af2tgkQKupRqgymXzfxT
         v4fQjmrVUfUx7stgQeo8Q1tSn3A8XjXfAFzadhMXqBiyXokRECD2wmMmU7gsoT7BUPuy
         WQsdHuB/Jj/wRHsKQ2T0zK7JHyK3wOflOazjQstGq9M+HzD+D7Y6EIll3akocucuLyTp
         +zj/cS6OfrDDaOBBxRDHGdqEmS2R97uUD0RMLAriwF7tXQJzR2Hz6wnm6/jM8q8pk+x1
         BeSuQVy7jM4dpllkIxSqAeg4RL5G9FykyC66+XIJBsWj7Om84paF6FF0Oovsv4qNDxIj
         AkEA==
X-Forwarded-Encrypted: i=1; AL+hErEVAYm9MeUAruKxKBmqbd3cg0dE/9ZaljBm3Et0uRcT+lrfVxEoAq9a9e2413t5WznLSkVrezP8IJ6d@vger.kernel.org
X-Gm-Message-State: APuU4Z8Al7ygVb/ziMuw6wMv9Mwwq98kZsRS5HHEAFmIgtSmi6LPHcc+
	7o5IwmTvXc95eIrWlky1vtmf9bpkmD3Xcz3l1J3HgV8NpMZ0U03F9QdLFlxOBnopq2oqBVxubI/
	kjofIAo9SNoz+PdlGLD9gqzHBe3pXb+gOYv7vjYI=
X-Gm-Gg: AZFdTZfSaNKuH2lm3n4w6F0aKOVMdH9jyDUE7ybR0/9nJYMBrNyr+kaSgDVZrLHG57j
	eT1QwQtP3kpTqH5DV7lg9Y7osBPjUNVZ6Sf8sgxXnOa4UsJ6cMDiqnR4rotrcx9NpUaHyAmkFR3
	6um0rlfVTFP3cNMaMQajzF9sAw4ppoznN8xS9SiStHTW2wuEz/YLLAcl1HE6fj+Cm9WU5S2AOKh
	cCPcoLs8iKx6hHHV/FAHE5e2dTzgw7JkT8z26uS51d7nbGIHbDzhf4SIEQhBAxjp7dRnYM9yBXp
	tyuMLGOpLeD0heqHSToajYIWO/2fzsz6CLTL4lcUeTDXaUUiPn7WtZEZAAfK6SZO/TERBbQU36z
	DKH6NGKHJyfHkOTne+4+9THfDNOCP+PYl71d6KRLTdeUS/Qbn/lVYaPI6K8TCLKsvW4IeOgU=
X-Received: by 2002:aa7:d349:0:b0:6b4:602d:f1f2 with SMTP id
 4fb4d7f45d1cf-6ba37d52e9cmr15809735a12.3.1795768562917; Fri, 27 Nov 2026
 00:36:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
 <20261127-dcphy-rx-v1-v8-5-9ddfef99221d@gmail.com> <sashiko-outbox-236847@kernel.org>
In-Reply-To: <sashiko-outbox-236847@kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 16:35:50 +0800
X-Gm-Features: Aa3M54ovM32g7V-SSPNRX95l4DBsAa-yp18pNqVZFJQDxNZ-uXS7aZWkl2Kvurk
Message-ID: <CAPwA33J87MAF7hLvBE3_03_jQU=CrKB1ppc6QqLkksuQTB2Q7A@mail.gmail.com>
Subject: Re: [PATCH v8 5/9] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Can removing the APB reset from samsung_mipi_dcphy_power_on() leave
> spread-spectrum clocking (SSCG_EN in PLL_CON4) enabled when the D-PHY
> transmitter is reconfigured from a rate above 2.5 Gbps down to 2.5 Gbps or
> below while the device stays runtime-active?

It stays enabled with or without the APB reset: pll_calc_rate() has
never cleared pll.ssc_en, so pll_configure() sets SSCG_EN again after the
reset.

Unlike 3/9 and 4/9, which fix problems that moving the reset would
otherwise introduce, this one exists without this series, so I leave it
out of this series. It can be fixed separately.

I also cannot test it here, as my panels stay below 2.5 Gbps per lane.

Best regards,
Jason
