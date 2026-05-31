Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A723191D0
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780224524; cv=pass; b=tIuVvdhQhaakXpm14dxQjGp32aq38XSbdg3PoZCud/Xw4GxM5rD88Q1t8H7o4A7990XUWJH3nHiT7QKSMZvWgPivbKzdi15aHrD9t5Bkv0Eas4nfjEAb5G1hNQ6KcAvBn+5QUUb4Hop+Nep0HZynymaWrZyAdyYGd7uaKT2rdSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780224524; c=relaxed/simple;
	bh=080ZLtbxkb/6KxdXJXEEqRAXXjDuug6lWGxwBc3QAbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePuZM/d4QSde7bJHwx9MHpMgAaxpgg6ZP5m3rrMdlWzlTQwzuX9CNcD0huD0le3cBdsA3mgFsSajGiT9UiCnlx8c5TbwMIHAj3cNj8KTuSIupV1ho0Hc/T0x7bxllg3I+FCSWbyLZk3uT9oku7HFkmrol1CehY4pSZIwha23B/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hqq7RIr5; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hqq7RIr5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso2080497f8f.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 03:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780224522; cv=none;
        d=google.com; s=arc-20240605;
        b=YB2l1n04qU0zNu1kpqx1uX7KsY5vYPYJ5LsATZE7cJ6gjK5q1QPMPzpsOV/3eaJ9al
         zVtleXmd67kicGR+kgAZuIvDEb2cOgRCDTK+X6vKa9S8FXmNxaoEDvRi00XkV0gBvNLe
         DCiIxJVdxHyjpxpLU3+gEyc3LgfOGJPIVpMjtSn92UJMJycTJCH2E5DZ8FeElE9cE4Fd
         1IIeZ8qL2T3VxMfUMS7AuuF4NNFwHn9AzLg6WqK4MBre4gN0IoG9POsi9DY79nuc/2Dd
         SP1rAf5r+Af+f2gZoVF2Mpjwn1n1iK5UPcST3UZJ1MNUmXGQvA4kKspaBvUnial0VQwv
         5xCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EeBfqAYEvuPA0edsleUHqYap2vw0ye+zziBVQyVCO0s=;
        fh=idWNchqm/HbEEeIeXBM8HcqaWRXbtt++0MZszI6r0QY=;
        b=DG6exaISwoqXDT5L+ozGheL8zcdBpkng6m6O1lRrnuN1TEKq1EJ1w4+3pQMg4lQClQ
         QbVIVnrQORKqd2BK6VkNoGWXB6UhKVkY/wJCU0tTmmFx1UaN7/WPXirGngQEhyHLMj3h
         1Ahbzv5HbPCm9y7d/lcSGRvu9AwLOPa2s0913zvMpxxSCaptYVbZPOuyI5YTGiH7b8TJ
         Ns8kHV9Gtr36CC23dV1WgWcKXxrAMmsJeNQn44Z162iZnBWQZxLfpmTaSG3GdPpDsKVr
         GnPATE5TlksUtwuw6a1BhiaFrh670wZbFOb6ylCwR498gR3QHxKw6lnSTHhKL+REEr9X
         ywVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780224522; x=1780829322; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EeBfqAYEvuPA0edsleUHqYap2vw0ye+zziBVQyVCO0s=;
        b=Hqq7RIr5FpfAkwUeWVV2n/Qw+/uTRe9rSAtRgyJYjlR106RZvP4E/mBLr9HBq7Vhms
         jnm76ji30CejskZ+MPEAI/w55qwncOwBsppcNYrVm45Xa6ujMWjZsTyXM975s3U39t47
         gJiBhTkk97KEVtcSQpVjqbRjocAYiQhLMGKZ6nAtp2n1OSuujwdPVVX0fTfNtRZR+R5W
         xDswb2y7jE2xbmVoEy/08szDFAOR8uvZ8l24Kt32EmiSsuxb6XiaeauBtmxxtHAgaU5B
         BsVZtlfOMI3NZF136B31m25zOL60ZFAJ6qVQZPip2icJ1k+eeXhtNyQaGV+LqHGr234P
         1TIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780224522; x=1780829322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeBfqAYEvuPA0edsleUHqYap2vw0ye+zziBVQyVCO0s=;
        b=nWX+ZRn9/SLKB2Z66NdAi/iGW6lPD/+YZPej3woJc7/843gBdn3ue+Yunm/50kjWg8
         n8H0Gol8vvB67EQZLciCNZmnr8V3WXezf7zvDLaBGkVRfYTvD6GF+en5N1f7o9pwNfYQ
         qWVl3S9yCefDqnFp48MEEFhgKVtLdGjx6DX3JVJweVVngAbmSNkIZZuFq1Ndch3V1vGJ
         b6DLWcfhVIpxY6DMiKXqWPibVhoY/pqofwSdZCkvdO3zxKAyfHSf1/VicvKxRvoFU0Fo
         SwrNmfko7Z2CxBrpQ3lQksxBtDdlovHOKG9Oo3RH2BkQd2Xj0UysudZ0CXlyz3FLIhX+
         I/JA==
X-Forwarded-Encrypted: i=1; AFNElJ9Zt91v1iCogoqEnQnspymFeeSOLKFwH4nQxUvzQQ1hVwpAQ9gJTu4f9Ejbcozh899GeHnpBOBtU/mv@vger.kernel.org
X-Gm-Message-State: AOJu0YwcE51tthDzgdZ54OleHM64lmAWnay8s3JPjs4d3ysTJUPoG95j
	FE1b76gXHpIZR0eCj8TmT3VhQWAKReNXqicUhonO0vbSnLV5FiO/CWdI7qlvfHchd3/Tl1vFFav
	HfIFDycA8+1SojH5/TKbzc6t1pHviOPI=
X-Gm-Gg: Acq92OGCJtyw4QR6OrEDZFEFbXTf8aPAhRj7EuKjsM1Pc1fsH3DovRQvUqHsCUkjsBU
	6laTNDlNd5cmKxbQPn3ZYApayAN6kmRCUm7pK33ML+ZUKAYt/x/VkNykfBcykIMvfXI92yqD7xO
	ybpD03XPYG0mQ2cHTu280NJJ5r5zoSkt8spcZJ9/gjpV+50sOm2qHrhpgUsMPI88ANAGhb7reZ5
	IvSqyl2BQrG/R+eNDHcPDqZzOnBmcjlgx9ZNYHeRqtOus860KXtv+bgtRp6YITu6fEBG+y0GxEE
	AiTfx565Nk8bgmJ98NRyovxcB8KWRk9yjXZULatlNGMWWbwPmFaNgdPH68HQsUeDduqCORwi/iU
	aztPYyobEDGwxELpHGz6v+M2JM5OM38mWoFD+p4yraQ5GCZ1mNIQfrsJmeZvu/Fay3Li9KLK6y5
	UamAf+Y5qpVtqo+Rkhu2ivSUe5eB51HfTbzxCMCS7XpzdomO7NKg==
X-Received: by 2002:adf:f14e:0:b0:45e:e44b:3136 with SMTP id
 ffacd0b85a97d-45ef6b4edffmr9361355f8f.19.1780224521696; Sun, 31 May 2026
 03:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-veml3328-v3-0-dd562eaee8d9@gmail.com>
 <20260530-veml3328-v3-2-dd562eaee8d9@gmail.com> <20260531101940.037d1d7a@jic23-huawei>
In-Reply-To: <20260531101940.037d1d7a@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 31 May 2026 12:48:29 +0200
X-Gm-Features: AVHnY4JbFdUG64a6zbzX1CpKaQDF0eO1aAPLasW8LWr4MB3wrNFNwt60d-CHFpA
Message-ID: <CALoEA-xLB4Yak82iTdgPgK9riKgLhpN=b3h6CchxUj=B=KRSLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: light: veml3328: add support for new device
To: Jonathan Cameron <jic23@kernel.org>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 May 2026 at 11:19, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat, 30 May 2026 19:06:47 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> > Add support for the Vishay VEML3328 RGB/IR light sensor communicating
> > via I2C (SMBus compatible).
> >
> > Also add a new entry for said driver into Kconfig and Makefile.
> >
> > Assisted-by: Gemini:3.1-Pro
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Hi Joshua,
>
> I didn't find anything extras so this is just some more explanation for
> the Sashiko comments.
>
> Give we are approaching the end of the cycle, feel free to do a new version
> quicker than normal if you are sure on what needs changing.

Considering these are relatively simple fixes, I'll probably send a v4 today
(and hope that it will be the final iteration).

> > +     case IIO_CHAN_INFO_SCALE:
>
> Under the hood, like all the cleanup.h magic, this instantiates a local
> variable - the cleanup scope is tided to that and scope for switch statements
> is a funny thing - it's not per case, but rather the whole switch.
> Hence need to add {} to define the scope for this case block.
>
> Otherwise you enter this switch via another path and the local variable
> is unassigned, but the __free() that cleans it up is set. Hence you get
> a use of undefined variable.

Okay, thanks for the clarification.

> > +     case IIO_CHAN_INFO_SCALE:
> > +             ret = regmap_read(regmap, VEML3328_REG_CONF, &reg_val);
>
> Hmm. The comment made by sashiko on this is also possibly correct.
> The write to INT_TIME can race with the write to INFO_SCALE.  Whilst that's
> not a normal use model (one thread would typically set up all the parameters)
> you could end up with picking a scale based on an int time that isn't the current
> one. I'd just throw a guard(mutex)(&data->lock) above this whole switch so we don't have
> to think about it. (and a mutex in data, plus initialization etc).

Heh, my first iteration used guard, so we've come full circle :)

> > +
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_set_autosuspend_delay(dev, 2000);
> > +     pm_runtime_use_autosuspend(dev);
>
> As per other thread check this results in power down.
> If it doesn't, try moving autosupend calls after devm_pm_runtime_enable()
> and see if that is enough.  Otherwise, you can either manipulate the counters
> or I think just call pm_runtime_idle() to force it off immediately.

Sure, that seems reasonable. Testing pm_runtime stuff on a Pi 4 is a bit more
painful though, as the LTS kernel doesn't support the PM_RUNTIME_ACQUIRE
macros - they were introduced in kernel version 6.19 (which I found out the hard
way!)

Thanks

-- 
Kind regards

CJD
