Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2B3515D1
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784861652; cv=none; b=Qi8Za3VOBraDnwltQ4ukJIMmxfSjpjazg/zkKX0Pd/7QyJmW4gXuHS8evWKg0Sja/MLnuq7OASlE9r7EaZImW07xLpiDWXR5NqnK7h4daeYuBtECcqoeVtNdziNEn6Zv7H9qjtiUe8P0W/hVkvpMWRnRLlRVeEP3vY7bW2ObpkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784861652; c=relaxed/simple;
	bh=3YNhJa3B7BJ+5/hGFL9dz3h9OwH3cAo/rRkf4mBqYck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NE+685rXqMpUvALTxOJnCDMoNLiBdbbgPV+enC6w5diZJOC9eySsDyAobUSTJypfmwxawWnjT1DVSHJmH+g/9QWw2hfeQByPJlww+PQc+oP9DbJNB/Lt8QQW3Lqq/8akbs4a1S9MBm2xNXu8wOv9HT14DM8WhzRD+CnZBJMTybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYLBfK4X; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYLBfK4X"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848595b338cso1421284b3a.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784861646; x=1785466446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPCe44TL9Lu4Q6XqOnCQ1df/GtP84+ufX9r8RseyaR4=;
        b=oYLBfK4XIgQhxAUYYOk/xS2wM5lD+EDj99dAz2vsWUcPuABexuBt6yR/e6BhHb3/wF
         4unqI0tGjwrmninMsbWdh+KDoDZp2y8NYy5e83OjNYeYnzjqycGxyoN3I/qmyK09382P
         fnk2aUD0s6VCVrt111JnQSdS8zyosCQ+/qOHeUJp1PFKDiQG0f/zlBHQhgoct2WjU3py
         SGibogHymnziE62mnm/yPSvCnDkpx7gylE+0w8DqlmCq77rs4G0uc5sA/0JFjT8QJuwa
         LTUZxe8ffDcvLcJXGz+qiKDYgqnOwM31TrXuqXeI+qTzV6QCOGeyIGTirD8BhReL2uo6
         TtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784861646; x=1785466446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPCe44TL9Lu4Q6XqOnCQ1df/GtP84+ufX9r8RseyaR4=;
        b=kOxabf3zKqui2kG2bkaoXefnKM89P/vLkUTgazeSjA/lvec6UZCc7K5YKuGBCd48i2
         62yGbw/i+7Yck9hiVJHM8SFXyzAAWAYdbLI8b+kdK7WQqiZ3mFzWysyqzIDaS3jReBC9
         LCjqRWC2Va4FHnZJx+hdn5kKzW7CqvoEjPLVYsnIsoExkzpoJvxRUZljHtx/3Qswn1+V
         wyQE/2/G7f6G2H8wf3QgFk7k8q9no9gyEcrwoeqFAJ4c91el2ndvaDTMS+7gtwIcbRcK
         9+cNCL6xSGH1bJk0uOVkNpLGXnt2AaNkNk0B/q23j1MBbEEscqkNB2ICg82VQEJuoT7N
         5PqQ==
X-Forwarded-Encrypted: i=1; AHgh+RogZFHkPfALCfG8vlbbxdo3r/7UCtbQIrkiHGeOMystzHktKFIwc+jPgqcOQdcWlyvgShr2qJw+rKJo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8NITciZBuk/kQTedKlz5iFCeaApWlMx62hDGJhCIL6eprAyis
	nfO8KKegqq+aRDoh5L6ssmPhCMuzQkNuoFN1006aUR4p2UM5Gj/baDsS
X-Gm-Gg: AR+sD11ASz8SCYoAqYZtqQirhLIBy7lzDd3VBWkicewH0doEQl1VHCxEskqYEU2znD6
	glURF9naTfraC575ivmvuGG6DXxodqMHM/N1+eENodQJrVkExvXtBCY1VxzHeNeV1K3k/GLyl7k
	5O4StpnZ8vRRuCmh8vcny5EAzcz3K2THQcseZH1EV/qZIKDUu/Qy2dXrMZ2BR2UciRg2qeHicQK
	nIj6XJRYEnoz/3qKQvqziKJZKheSi00r8Xp5NE+rPm9HaD2iw8cSwJK0AE8aryhIo6R6aVv29Bv
	REc8xxmGAOqlWSy6aO9a7j5Gjsp2e2ibl7IdVJxOEhgDiWccgEobwvmJNTYf98BwwfICMyvex78
	fciPEKX3O69osXDyPeKs/6Kh2hBkt9Od7q883mOodQQV9LCZUw6t0n6Z9QA45yUuLGY00Da3mZv
	VE8WZGd/TyzmhFEY1U7xMI9hqNgY2bQKAo1gAVw2bYhE1NALE5vw==
X-Received: by 2002:a05:6a00:230a:b0:845:4928:8655 with SMTP id d2e1a72fcca58-84e2bb3733cmr6297375b3a.39.1784861645606;
        Thu, 23 Jul 2026 19:54:05 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1757852dsm3919741b3a.28.2026.07.23.19.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 19:54:05 -0700 (PDT)
Message-ID: <1c930200-11b1-451d-a7a7-170b42aa30fa@gmail.com>
Date: Fri, 24 Jul 2026 10:54:01 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver support
To: Guenter Roeck <linux@roeck-us.net>, sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org
References: <20260723060755.1596858-1-zychennvt@gmail.com>
 <20260723060755.1596858-3-zychennvt@gmail.com>
 <20260723062030.B20F41F000E9@smtp.kernel.org>
 <a04cc256-4c60-4e92-b196-47aeed1d5453@roeck-us.net>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <a04cc256-4c60-4e92-b196-47aeed1d5453@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Guenter,

Guenter Roeck 於 2026/7/23 下午 10:07 寫道:
> On 7/22/26 23:20, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 9 potential issue(s) to consider:
>> - [High] The `ma35d1_wdt->dev` pointer is never initialized, leading to NULL pointer dereferences in logging functions.
Fix in v2. Switched to using wdt_dev->parent and direct device pointers for logging functions.Remove redundant ma35d1_wdt->dev>> - [High] Read-modify-write operations on REG_WDT_CTL inadvertently clear W1C (write-one-to-clear) status flags.
Not real.The W1C flags (IF/WKF) are only utilized by PM callbacks during the suspend/resume window for wake-up event handling. During runtime, clearing these flags via RMW in set_timeout causes no functional side-effects. Furthermore, RSTF is already consumed and cleared during probe().>> - [High] Missing clock domain synchronization (`ma35d1_wdt_wait_sync`) after writes to `REG_WDT_CTL` can lead to dropped register writes.
Fix in v2.Add ma35d1_wdt_wait_sync() after writing WDTEN to REG_WDT_CTL in ma35d1_wdt_start().>> - [High] Driver overwrites `wdt_dev->timeout`, breaking the software heartbeat extension.
Fix in v2>> - [High] Missing cleanup for wake IRQ allocated by dev_pm_set_wake_irq(), leading to a memory leak and permanent device unbind/bind failures.
Fix in v2.switch to devm_pm_set_wake_irq() in v2.>> - [High] The driver fails to check if the watchdog was already enabled by the bootloader, causing unexpected system reboots during boot.
Fix in v2.Added a check to set WDOG_HW_RUNNING when necessary.>> - [Medium] Unsigned integer comparison against zero renders IRQ error handling dead code.
Fix in v2.Change the IRQ variable type to int in v2 to properly handle negative error codes.>> - [Medium] Integer overflow in `target_ticks` calculation triggers unexpected system resets for large timeouts.
Fix in v2.Add a check to skip calculation for large timeouts.>> - [Low] Unnecessary dependency: selects `MFD_SYSCON` without using it.
Fix in v2.remove select MFD_SYSCON.
> 
> Please fix or explain why the issues reported by Sashiko are not real.
> 
> Thanks,
> Guenter
> 
Regards,
Zi-Yu Chen
