Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509716;
	b=yR3nNi1T95jacZMIYaONDIn6x5QZMnZEu+yLHRFCk8YZqt5dSWjf5KfQMLeAky33WowU
	 oh/c1E01z64Ew8g7uqzzEx2E0dHCuSjBkZVzbLVapWCyHinHMNU3xaql63yXgnn/dIPmJ
	 kqUGtHmY4zMoe9yOqXSpppRAyD1bZzsZYSn3o8GBmjjZ9Co0VyBfucDtud+JsUiNlGiHu
	 nsw43ui/29nBMs0dZceMm35ov/A0llR4URPd5WF5yqAKpryHIixkkUlNs//uVFESz1sg2
	 yxnw9cMlXE7O+7Gibm39a0ZOEWj3KSaidyAAa6py/d4Gs36rwS94ZTuZs45dSpp8Qmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=;
	b=B7ILPwAqlbm6HBk8OpjOwOkSr97T/VQJOfulFaJJwOcmefTCvYT/kZozFu2GRJv1JcaB
	 ZeprcuEhQiGJpQIFFoDN/bSaVYJ3e75EmBIPg91ZkjOmdWmzsEVtjFzzEgYUVLT77jTr1
	 TmZqP1NSNfNaavM+rQLN5rkN58vCIpdZ0ghVLC+WnbwohMWPUcLKtAfWPUGFEiaOHf29t
	 FVcG+ahBk534cw33s1V8BhXtHGw0SlPcQ17MHRYJrFDuP0MPgtJQvby2JAeQn6szgvxAy
	 IYnc9Gki0tSi/kCLCNO2m7frSV1siMORBAfmLsCbWMO7KWUon+Wjdf4hZIgUwV4w95g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EpuxjjND;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C32606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C32606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EpuxjjND
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1785178a12.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509715; x=1796114515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=;
        b=EpuxjjNDpv8P/TaKIGvDrghu6h29YD9v/Ow2khz3TFEhVVUlhELGmYhcihYvRqSTOB
         ucOI6LuN+ktO6hQJa82SHMUX9PK3Rw97/65XpXoHq615v6hnbDp3EHh4difyb5PpWlMZ
         sc5dH/3DeTkKDzXWTfEp156NQwATS3O5P2lchbyPU7ZO4wMLz+1X4Ky/QnfGpNdiCdrh
         Ui9OR+4YellgZy878gCtG+p2x7RyZwrBbQgrbLoX5EgzNJoAuVvSOTqDSXObriVLf5dB
         lS1RUgpH273WxkYJ9LOxbmhzL8BPmYapKqA6W8kd5Y8JsBoGfAHq4cIZyQ8ru04hgMQ4
         BYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509715; x=1796114515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=;
        b=HudQPhL93O06pbVIdL64ILy5m0QyeW6SiabrvwBBbmLHJ3lzlbPU8EsQMdOPzLJyI7
         lt4/qFMRpyY1wCjL6oZSPd+rLVEP8nf1kUAhsaC5auL9k134R85iKuRVUIM8Z5JHLsi3
         3D9dFSHqoCZBUceailF5ggwk2Di38ejIqhCkb1fz01cWad3aQMVIzDL4HCJjMyB+eXoO
         jK6EHYVIHyTM9rlBO83SzK7ffVSSPXISon5AYZBxptjSdUS7n0RdDlPkuEhQ+/p2oyVx
         5jv0/1sNCYq5r3/qIf4RWde80Iu2DtgUVkucG+9smForpVnuOA++eDM006j9cKNM4ibw
         rbqg==
X-Forwarded-Encrypted: i=1; AL+hErENjLCyWTh+IcCAb49HRpE3fMy6duz+VSfhKspUr42xpm1Z7huC8OuwCkVmenVvF5pevfepMpsoavJ9@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rr3bH07Mno446L5nzt6YFJP1T4kW3jd0SyrSdvmHMCYLw8nc6
	L31WPXitZqwq7wFqPV8aVpPM3UGJ7R9VOs9kFVBtLZ5r2NJfg6C86r5nW1k8uQ==
X-Gm-Gg: AZFdTZdhvirsDYH95RD/DmfuFELjOi78cvxH4Dp9U6e/m+L4ZLA/CMfuKPd5N97Sk8g
	mKTY9utwtUr2YfQTGy7uX7ELt1e6QsjwpgJ1YPyY3JrAbwkD5BaQIDizDs5uifnsLakcSWm8571
	HXv5qcs0sWl1byFRXT2yK47HmNf8oRVYN41Lg3deLnBiO7IJ7ZJWQ5eNPii3jC8mE2bzOzGPnDA
	KMUDWQ9CfAM4p1cmllSD8TbxzcjLykcnGQ7UorL7KHO0uyq3eBzVKk6p5E+SIU48KJ0Sh9WM369
	tAWUemdwFjLPTrHL2YzSLBshDxciiaYidEZ974iRyNI5A/IFEX4p8Vg6GrrwHclhMZ1tCuS0pzi
	vLPnygTlaHTZ0kyEo00sCGPRVoIChJa+fYNJhMmj91z8lMf44WLJaQyFYfT90x/26YPy/VgmGLi
	+TB1BBK34ylF4rI1nQ0YeFRwaDgqrBEyq50m309ZKWpSqcCBQqY4oKLDw0hzxT/VDv9diozSxFA
	PHpgBzvhtw0sGZ2hsumswByrCbpiMiXUTAtEeIInN3A+3S0XeKrZMMzcGp5du+O5gWZL5nHQqa6
	eHE97sI0B2SG2m4DAkt0/fmAYqSDPwJTsKs0T23m0JR5MO0/XLFqmHRem0hkrrQOCnBe8YYp0R+
	armcahw==
X-Received: by 2002:a17:90b:1644:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b41caef685mr10503851a91.45.1795509715146;
        Tue, 24 Nov 2026 00:41:55 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm24432973a91.4.2026.11.24.00.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:41:54 -0800 (PST)
Message-ID: <c88fd429-025a-406d-ad80-ec464db7d1cd@gmail.com>
Date: Tue, 24 Nov 2026 16:41:51 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 chernyakin.victor.j@outlook.com, cwweng@nuvoton.com
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-4-cwweng.linux@gmail.com>
 <20261122030647.70b41b61@jic23-hlaptop>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261122030647.70b41b61@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Sun, Nov 22, 2026 at 03:06:47AM +0000, Jonathan Cameron wrote:
 > > +	/*
 > > +	 * pollfunc->irq is not initialized until the pollfunc is first
 > > +	 * attached to a trigger, so only suspend and resume triggering
 > > +	 * while the buffer is enabled.
 > > +	 */
 >
 > True enough but isn't it also guarded by if indio_dev->pollfunc
 > inside the iio_device_suspend_triggering()?
 >
 > I think in the case you are avoiding it is a noop anyway.
 >
 > disable_irq() nests fine so it shouldn't even matter if anyone turned
 > it on yet.

I checked this again on v7.4-rc4 (b6a9fa34ce41).

iio_alloc_pollfunc() uses kmalloc_obj() without initializing pf->irq, 
while iio_triggered_buffer_setup_ext() allocates the pollfunc before the 
buffer is enabled.

The PM helpers check whether pollfunc is non-NULL and pf->irq > 0. If 
the uninitialized IRQ value happens to be positive, disable_irq() could 
be called with an invalid or unrelated IRQ number.

This is why I added the iio_buffer_enabled() check for the 
inactive-buffer case.

 > > +	if (!iio_buffer_enabled(indio_dev))
 > > +		return 0;
 >
 > As above, I'm missing why we need to protect the call
 > to resume_triggering. The pollfunc can't change between
 > suspend and resume so there is either one there or not
 > in both cases and the guards inside that call should take care
 > of the rest. If I'm missing something we should look to
 > fix it in those calls!

Agreed. The same uninitialized IRQ concern applies to the resume helper.

I also noticed that iio_trigger_attach_poll_func() does not clear 
pf->irq on its error paths. If request_threaded_irq() or 
set_trigger_state() fails, pf->irq can retain a stale positive IRQ 
number after the resources have been released. The normal detach path 
explicitly resets it to 0.

The error propagation from iio_trigger_get_irq() was fixed by 
dff701806ab6, but these two IRQ state issues remain in v7.4-rc4.

Would it make sense to initialize pf->irq to 0 in iio_alloc_pollfunc() 
and clear it on the attach error paths?

I agree that fixing this in the IIO core would be preferable to relying 
on driver-specific checks. I haven't reproduced an IRQ failure at 
runtime; these findings are based on source inspection.

Thanks,
Chi-Wen
