Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792454440;
	b=VPklThFOKLyqi/iuwio2Bv7g5GZo7IWNafP8OERSnxbgJHWv6fhxGrbOCUOt92XAlKfO
	 eYe1kLnBUMZPKzTYfJ0PCb7uwp35jWYQBwgmE8nzUUd67rWOlBXc2wkMrZ/hSzJQeYxS/
	 jSuGJqYJq4XkWlNv9HcHqVG3f5f3QWn/N2IRRX+4RIikpeq2gPuEFt2GA7qo4WanYONJa
	 SK2ylyXrEqObic+y9p+/XdKW8on5figqzt3Wm4CcyQdP7ca23hmbPjHmJezAq6nNJBTaH
	 NdEDdXNiD0WXXA+8Ynpv9a8d+9hgpvaiYD/HN8h2382nc5NClNar0KwHvwP8Db7+R6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7fUTkugE/ubN8HZ5/yUbmpM3BNuYlbvQ/qB5I5NZYCU=;
	b=hZasddZ2ABrgysAOmhXNwQyg2bjXABzHO68hWdfTMeS2nC/39apncxcqwMb5edpZy+wo
	 6RXCbiy8ITcuDQ7rLJTb2gA1pCb2kbs84BSivFMlyjaepxo5/4RVL+eTeL6PvF5LJhXAp
	 f3if8UPSH4ApxOPorWZD70xqHJ+BY7EWOY4wIqPi1EYiKVeZMZLMb/hPle8U2NFfCr0P+
	 ZeBDxaIs1m7ydelPxB0lvfJzgWC5/2GsY2kT3A7chO2HNQGBxHhv/vQwSUejbPfgOLsh0
	 iDK5iPZjOfOXtNlPjre/xEDcIVLJ7P0ByaOnGMr2FDsp13NQvqyS2kOc01gVoSiFaCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6oKOtnP;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5283606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5283606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6oKOtnP
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so6982344eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 17:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792454439; x=1793059239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fUTkugE/ubN8HZ5/yUbmpM3BNuYlbvQ/qB5I5NZYCU=;
        b=m6oKOtnPo/2I5um0OGZ5G646AR42YdurL++ZVPDQDojft320mn3aJyVyh3u5bBBnmU
         kItDysR60NNVcj8YojuiQJwIr+506+OxCKCD8z9IW/9/C4IzKMyzES8tyspw7slaGup9
         VnDglr8JS7MzWc6t0gslon1wFa9+cThJO+RH/DZxtCrfMpbGy7MoecQUh5tQ1CQgWRgM
         C1ko12o1URbMQedFODTVXx0KrdztUN1b+ZGRtzziomp8FtWj9OXJpxaNDSEyOgf6Ogvo
         jvOVwEtP/0HITVOBBfjJAgQij5tnGpMpqdl1+0tjBRGFiM1uXG/e/CfQD4oXE2UAW0Zu
         vKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792454439; x=1793059239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fUTkugE/ubN8HZ5/yUbmpM3BNuYlbvQ/qB5I5NZYCU=;
        b=PUf8X9SsfFppKD3fPyeuRCgo4D+lvLYhqC25JktQ4t5ZaTnVLxVzMQRYZkJuQonE8p
         2AtpZyeBouWVAl4XCtR2df7fV1OTLI52aWqDk/JtzZxmbQsNTb/eICppQGsuPT/i41le
         tROY7P0XtHNB2VqdUKlBp4WPOSxh9Au+DeI859k6DIpROqghwva2/YVe3+LRpEdsXcsX
         x1Sx0nFiHEXiT88X5uO8PzLY4Duuyi/AmGgdEom0HxJ5ajmC7aXIVSAKtdP+AbVrMERY
         qCCVfg15XGeQP1D2suM4mWHErRSe0jargHPBf6G/WqK09Z7U4KYYajLf0y77p47AyuTO
         mLaA==
X-Forwarded-Encrypted: i=1; AKwUvBzlo0/MXeJSmhJJKwOPhn+dR7kf0LlnkxOHKCBhYMFgsLjx6DvG/9dd5N6IUy6qfDKN33642XnUfTW+@vger.kernel.org
X-Gm-Message-State: AFq9FYJUlx85dhIB6knxiqBOQvAPO9FwvN4e5xY+PG5fi8fLe4RN6iyU
	767CBB9c6RTBH+j8tnaHrFwm7SLFqZ1sfOCDG20sRvoBXTWspU2DHkM9
X-Gm-Gg: AYBFou2guHERwOiX+kqX0JyV8rTvXne/Zmxar1Jx4q6gdov+x7ivYi2HUL41vZyysQC
	I4Pcd22tMiMNI1cb59r51puipZrLvLACOHAUmnCzOOImG/fIHmt5vds/pFLZ74puQIUpbnC97Ig
	X0iVcNzSXjYJZ3eigix0+LC6zMuwk0t7/GwdPRuNBKfud1sOWmIWaRPnORapr7uI2Uxi7ZBZgri
	VaGyZxUiAyuuYfKHYO4hpZC624sdDUhWNAqoA+Lq8nGiupuQ89kYbRodSNm8u0L4aY5rW41loXC
	SRqSUnmB5qiyJoGXBbYE1R7dqxDqfGzW0fA90PUZSxtrj+2D1UQmaUhn7rBS8pNJ4GH9ZWFr3Ey
	IQZmR8WArr0AWP9ByVecsHh2Rm/2yr7GnBseWFk/BQDCSt0xwGVp5pw2yGfwNIMUEYR8W5yeMZt
	bBFkmOW9A80I2OViWNtayin0YJ9MtywdaATytODXz4d4kHWZ7GLUJMKJnCPgSfCvYc6QhGtkODY
	lGb/hB71we4BC7IkmNQRgwvFgWrG3mb8g==
X-Received: by 2002:a05:7301:f0f:b0:35c:6268:8127 with SMTP id 5a478bee46e88-361a146ee08mr11221357eec.13.1792454438391;
        Mon, 19 Oct 2026 17:00:38 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:dfce:4d9d:7f44:24e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm36155038eec.4.2026.10.19.17.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:00:37 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: Re: [PATCH 0/2] iio: adc: add TI ADS1299
Date: Mon, 19 Oct 2026 21:00:31 -0300
Message-ID: <20261020000031.14522-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atXuGv3esexdRJ4e@ashevche-desk.local>
References: <20261019001247.483005-1-stephanbrrs8@gmail.com> <atXuGv3esexdRJ4e@ashevche-desk.local>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 01:16:58PM +0300, Andy Shevchenko wrote:
> On Sun, Oct 18, 2026 at 09:12:45PM -0300, Stephan Costa Barros wrote:

[...]

> > A question on structure. The driver started from ti-ads1298.c, and in
> > this subset the two are close.

[...]

> Okay, I think you can try to rework this as a series on top of the existing
> code. I can't easily see if the above difference warrants a brand new driver.

Thanks, Andy. I'll do that for v2: first prepare ti-ads1298 for more
than one family (chip info for the gain table, the data rates and the
reference), then add the ADS1299 to it, with its compatibles in
ti,ads1298.yaml instead of a new binding.

Some background: this comes from my undergraduate thesis. The project
first planned a driver written from scratch; I then found ti-ads1298 and
built on it instead. Beyond what ti-ads1298 does today, the out-of-tree
driver that came out of it sets the gain of each channel, timestamps
each buffered sample, reports lead-off as IIO_EV_TYPE_FAULT /
IIO_EV_DIR_FAULT_OPENWIRE events, routes the internal test signal and
shorted inputs, reads the supply monitors and the temperature sensor,
switches SRB1 and SRB2, and runs a self test at probe; all of that is
tested on an ADS1299. The bias drive, GPIO1-4 as a gpiochip, the CLK
output, PWDN and suspend are written but not tested yet.

For mainline I cut this down to the generic ABI. The rest can follow as
separate series on top of ti-ads1298, where most of it applies to the
ADS1298 as well; only SRB1 and SRB2 are ADS1299-specific.

The automated review of this version also pointed at issues that the
new driver inherited from ti-ads1298 too.

I had missed Md Shofiqul Islam's series when I sent this one, and found
it only now: "[PATCH v2 0/2] iio: adc: ti-ads1298: add ADS1298/ADS1299
driver", sent on 6 July 2026 and reviewed by Jonathan on 11 July. Md,
are you still working on it? If not, I would like to take it on,
following Jonathan's review there (per-chip match data, the reference
voltage and the ID register), and I can test it on hardware: an ADS1299
with DRDY as an interrupt.

Jonathan, if you would rather keep a separate driver, please let me
know before I start.

Stephan
