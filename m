Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F413B5F5D
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395966; cv=none; b=aAl9s1HqJQvdcMQ/qSl2P4pm5Wy2ksdavaycUyKBJ06WHLMJsFg7MIQVL3aJXyXAfwbxnA23LwAW0cbsO54h0dZABexyp8iFnF6bAisoz8FLu7wGpIEK0wdloEQ0DpdaTJWfqm/EBkTUOfQ+IUAaGRLqysZQ1m2HmYq+dsZxI6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395966; c=relaxed/simple;
	bh=o92yQvxUqaTH9jym+90EcVtlkrdRh9f0R3gdaJcI2yY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HCvr7IhILMAfiTMM8qHvIHuuVsEINhnTWe80A2/npJHvkY4PtNjH6jpjcqQhBVeOCjurSgD0cEM2BiF5N26dbRcktgAATaJ1jTgFLl4gLiq+bMkItOgc3DhxRfp8ALQSw8e7dxIL4mAm3PfEkT+h/dqN8CosP5/hdXj7uQBz6Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDZvIC0b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDZvIC0b"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b966dd74so10566855e9.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785395963; x=1786000763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y5QAVeNEbw4rwpIis7dsdZArac2vQn3qNAs9Ae58oc=;
        b=TDZvIC0bfDa4fCzOf7s2pZOBbLaDjH1d8WTo2EM2K6gTfySeO1XAo3bl8wG+S3aLCK
         +D6oJyzgcXIAG5XuRCIF9t151BQ5OEnnA8/unICrufrKxzRf4/675C/yRahW2IilUwTW
         SJ+RvV1TjEuUsiATomvXsM381YjyAK927SHPvI6zwrcS+ObWeypRcrv3eDT7glKB7xsk
         nzJTjktJ1LQWRtvfOgreT2d8sR8GQ6lo7WcQTvh8hqc8edtX1JQEyYaCGZ61QKRx1/99
         ajHZMP14tW1INTJgOeYjF2ua8wroOZF/iML5o6Pf0LfOXmhfLLcE3Jcwy4HfEILv+yXp
         raKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785395963; x=1786000763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y5QAVeNEbw4rwpIis7dsdZArac2vQn3qNAs9Ae58oc=;
        b=YPUAGHQJSh2QWLLOVfABtsDpMnDUDjYhsjXRe57tpq1X5H26Z0h2YFGTA12ipGqfGp
         J0Kp/sHEWp+dcbI3xp05aIYlgDDM6HwXkglnWxR1ZI4rtS843hv87KyV0sm4sUgE+hUz
         QVcw/JBxSa3SZ0HIJiYCmjnm3nmgLpG5FXUksQYcYDPa0esNZAYyf28u8BLr8UmiEKbR
         8YmR2XSia6ONFl6oNheWLtU4aF1D8jF6RGV6IlEfkcM6ouDS8GZakdIcam15JcaG2mnr
         Qv5u2W8wkNCzngZiUTLs55ToYFNXOxWr5aoUro5G+9c2t/TnaLdIutQGechBhbW/+P9m
         9KKw==
X-Forwarded-Encrypted: i=1; AHgh+RpIcw7cMzBYRGvnIoJewf6cv41njn6p/isK8GkHi2QcCjDHvedVf1tFj+MyzI9mbAD7So7x4Zbi37xl@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFYhuzPrX/X9/N5DqC0Jr42moWdLhpoadxRzCPp81LqFpACvs
	fomYsWTdIzcYUcbrlUCb+K9Nmxztzyfuio4fgiqxkIFAyiLWFOs+pU0C
X-Gm-Gg: AR+sD11c0z3g+wMgs96gJ7DH3/AO7g5pmkRyYpFIr/30Mthv47HC//h0KOoFvFnyfs4
	IG/alUQrdsM0pikYCZCvma9g66DlXcTE8dsw0CLU+WV7ScNvA/ZXervAkkh9/i841RyaUFlA9hx
	OUZujmmajPOChBy2aJUNLkbkmPlP0BX6oiLPfohqb5b0g3enjwopmUu6gf4ORWyTrVIpCdzq7qa
	DT6kZYxOtCh3l1ZPWJlFTdpPBF21iNT6x2NbUQneed4XTsiRdHgYPvCCkbEHPjSGRjFz4Yspk6C
	RWN7ojtzrezVTLh9NfCkYOqpIsRoufEOR1vU34NlpW4XVa3uSXS1ME+7h3rVrb398jni+S/2HzU
	LR2jR5sKEuXpq52BJaRJ99RL1Z1jd1u9s3YwraDgD7hmvmMHVo5JE8TipBYIRMWgDjPKL7nDd9L
	ULLN9XMKcocE3OnGksD6CJFsR9UQL6E11Kx7v9B2I+ei3M4gLrAqcDeSAEEs37LpHy3kBw3v79E
	k2HJuE4hWfgaaPOXEBmN5b1MT5v4F574coxcTjbvYUzCjewbf0X3bp+WeYT0ftVjGIpGsq80vty
	/4pVlVnrxDBPTO5CEzD0/0Q0dJJKHhf6b+GRw/wPvrdBkfKp/0NH7oYN9LHaLzxD7QnBsKbbSCC
	gn5EvSFDld+Ce4zXNtuMKRZ9Ik2lqG3Rqv4zggi4nebTtjYoMIk7vm5zESD4Ux9OHuxlKaPGk
X-Received: by 2002:a05:600c:3306:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-49800e753admr10529425e9.14.1785395962626;
        Thu, 30 Jul 2026 00:19:22 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d6e68sm3625182f8f.7.2026.07.30.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:19:22 -0700 (PDT)
Date: Thu, 30 Jul 2026 09:19:21 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Message-ID: <20260730091921.00002d45@gmail.com>
In-Reply-To: <DKB8WW9AK4KQ.2A9KVJWD5ORFT@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
	<20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
	<20260723234439.06411731@systembl0wer>
	<DKB8WW9AK4KQ.2A9KVJWD5ORFT@disroot.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jul 2026 23:23:45 +0530
"Kaustabh Chakraborty" <kauschluss@disroot.org> wrote:

...

> > Please add iio/* includes after the generic linux/* headers. Ensure
> > that there is a blank line between the two groups.
> >
> > Additionally, you're also missing <asm/byteorder.h>, array_size.h, err.h,
> > types.h and delay.h.  
> 
> By the way, is there any tooling to satisfactorily point out the
> shortfalls with includes? Or is it just intuition and experience?

"Fully satisfactorily" no, but there is a tool called iwyu_tool (IWYU
meaning include-what-you-use). It requires Clang/LLVM on your machine
but it can serve as a pretty good starting point when cleaning up
includes. There is an unofficial mapping file for IIO that makes the
output of the tool less noisy, however it will probably still need
tweaking. Here's the link to that thread:

https://lore.kernel.org/linux-iio/20260512073505.1310-1-joshua.crofts1@gmail.com/

Setting it up may be a bit tedious, but I found Gemini to be pretty
good at this.

> 
> >> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> >> +					gp2ap070s_irq_handler, IRQF_ONESHOT,
> >> +					"gp2ap070s-irq", indio_dev);
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "Failed to request IRQ");  
> >
> > Just return ret instead, dev_err_probe() is called automatically on failure.  
> 
> Are you sure about that? I happen to call dev_err_probe() on all other
> places and other drivers (as of late) as well (other than -ENOMEM).

See the comment at the devm_request_threaded_irq definition here:

https://elixir.bootlin.com/linux/v7.2-rc4/source/kernel/irq/devres.c#L94

-- 
Kind regards,
Joshua Crofts
