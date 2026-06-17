Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6598481666
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713069; cv=none; b=MGYvrlBueU65G1+T/s0Tza6t40W1Hnv1YHwvMocteJASwYCnkxf+WVdIJ/b99IHT0BJcqgMXb1QiIf0ML9JFSDmHiS9BhJecYqGd7DX4bk0cE9Z5urA964G597laEOI3WIoxO/rbao0pyXEg26UgQ1OeHrD2uyZLSBQGPo/iOGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713069; c=relaxed/simple;
	bh=nKda00S1poT2xNV4nGGH1Wqx5kxvVBmxnAtBXAq8V80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWsthAwD+LP5BG5tS4EgGpp0M8lSlLIOMMAjpckjUOcnK4aMFstlVAcC3n6rhxtY7ASBOkGa31rdZc6bBeKj/pTp6dC/kFiBAT9sPZmRwtZWb0JogugXQdwaSnvZgHFTvbaVpYQeMIXwJ022EpKCXBhlhQ9ZORLVaL/u3TxAzu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PT2Jqfol; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PT2Jqfol"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so41511315e9.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781713060; x=1782317860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=00BSHQd1j4XWZK2YFSucxAoO1q8dCKrhXt7//WIy4nI=;
        b=PT2JqfolULsVGFeaqQROmAgvvc9U7Lhy5c4X1XNgTGepKpC+8vz+3vQqvxOUzR9261
         /dlmdLPnjDbztf7UdYyTys3wvCa5orrFYQIXYk64f2ty69UXXzC4U4rPhmXmHe/Q302R
         LjXSShnIwbzSk7yuxyUqHcMYQ+8upx+/r8wJ+hHQPQGPD3YzxmdI+sPEE5AQneJEdiJK
         TQr0RksHD+gXXZB/qNqdrC/YC5IurFONLJ48JsNpCdfqQg4kABnbAq+iuFn0IokzYK6j
         Ek501l1uq64ecDN66hhlwx9hOO/myGh4VdT4TvUMTyndRO++JwcPHAcB9W1kUTUC6ewZ
         rvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713060; x=1782317860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00BSHQd1j4XWZK2YFSucxAoO1q8dCKrhXt7//WIy4nI=;
        b=KW+ZCY3qbFsaM0D7dw7uenC3kxYW4ykvm+pLbIH3tjlH5zvXn24ERr7pNvTkM0WJqW
         vugPW2xbo2UP57YMq7TnFHIUFFeMB6PlTa9pM45kASKPk/lPWeDPHcxenp/dxX+z2hlH
         gsRpYj/2ZTmJyf0B09y3hxppTLXnKbNqRYtseekiWRCkCCjJWwppzHVHaXDDjgFMpyNA
         7ahG37TzJfaZGrAWHFeisrII9xIB4BLdKr5Ow/cJjsu9oyewb4UF4YF0Rx3ENmfKhAI4
         URZ9NyVW5utdo/HC3wUzn4VOLSyXTw9Mgs11yA+vvjExHjFWGTzK72g4KAZZe1PlfphN
         UAUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OhtmIqLmLg768EFVyaH8VHSRB+exuALPe3Yp8gBGSsy1NG+VENvg6cGrEtTku/+0Kv/ihxptK+tPu@vger.kernel.org
X-Gm-Message-State: AOJu0YyMYNVSVOFsHdJqTM2nH8JxozJWT1SmMsYdtAFn+nEt1It8+Z5M
	kl1//SSRvsPOtFoc1/zjFciHmk3uxSrDF4XEkZK0XUwNRk2tzeYpQXX4
X-Gm-Gg: Acq92OG5mU1Tv8QT2RbZS8BW4IpG1TBD4l6sboIF7y3q2cGlemrCo9tWNfwZeUmpaT2
	4xzvUg+j+YOKjC+9OYiQQ3YiWNeRKfrqgm5h/TuXYCg5u7d/1XJTWlDjUVImzpnl4zpSMZiZ6DR
	8GFUcavT98TA6RVt7zkWF4VKRmayY7fAUJJrsepMOX1OT+I/NRUFXAc9fGjyKMc74+JWGrFayHu
	jrOU45jOrQPXkkHlmN7COz3+PVRZe6r7CWiL16S8c+a83ypfYxCMpm5Elx0BU/g5NX9FuYNrqf/
	xBxYSFRK4861OBDKkAxu7R6y7E+BEAUyxePvIIVFm3+J4X2/Tl28qYNVZCKLZ80s/g1Fz+U3hLb
	YLyzQObLx810oFXxZy1OkEtP14f4Sk/3H78+X69fTkKIKbevUew1o7PlgALLUKLuOXu2017kVB9
	uUsGwZdvSVCgz9pRgo7iZjrl5t8fIvFchWPn6Gq+iVkCBM6tgPJE0UJsutxef21aANHpCN56qLR
	1c3/1VKyIerqrAlnA==
X-Received: by 2002:a05:600c:8889:10b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49234139bdfmr51405045e9.28.1781713059719;
        Wed, 17 Jun 2026 09:17:39 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d4fsm59746373f8f.24.2026.06.17.09.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:17:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d515b780-84ff-4854-bd77-e98247d62172@gmail.com>
Date: Wed, 17 Jun 2026 17:17:36 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] riscv: clocksource: Add p8700-gcru driver
To: aleksa.paunovic@htecgroup.com, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Paul Walmsley <pjw@kernel.org>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>,
 Chao-ying Fu <cfu@mips.com>
References: <20260616-riscv-time-mmio-v9-0-03af7bc8f2d8@htecgroup.com>
 <20260616-riscv-time-mmio-v9-3-03af7bc8f2d8@htecgroup.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260616-riscv-time-mmio-v9-3-03af7bc8f2d8@htecgroup.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Aleksa,

On 6/16/26 17:03, Aleksa Paunovic via B4 Relay wrote:

> +config P8700_TIMER
> +	bool "MIPS P8700 timer driver"
> +	depends on GENERIC_SCHED_CLOCK && RISCV && RISCV_SBI && 64BIT
> +	select CLKSRC_MMIO
> +	select TIMER_PROBE
> +	select TIMER_OF

You don't need to select TIMER_OF here, it's already enabled by
TIMER_PROBE. You could consider using a comment there, if you'd like.

- Julian Braha
