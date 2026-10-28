Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153994;
	b=uqnQJbNeJFADnywRSeU+RYDc/yXBiKxGX7lWvChbH3E22JexAOw0B4odsE8yJBw6tRWT
	 Msyga+DM7tuTF5xXijDAzOO7+1csNXmjuYhjWdd1ngP5FPn50ZiSE11cxLEUx3NCseCiO
	 oCSbsq5mETdM63QR92gCOgdMgRZfs9Buyg72YpjRa8K/vW5JWcUbmg0wHif/KMeBLliDc
	 VSPynQE6iTgBXkahWuh5YbmARJDmb2sgX1ntMlq9IGA1pCleI/bmW2DGUyEPF0dn+d0o8
	 6kbbi/BEmWKAF39CUYQ6NvzcFj0GZeGFJ6Hb7cRGINl8bqIdjpPSTxhZLK2vU07eBkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ll9NzBFV0AYwGYRot8ioCuniDijkW2mX9UPa4oGfP3Y=;
	b=ul/JN1bZUWOUAKYi3b20UK5pnqi4Nr5gG5oogLX2udSD4JIWP+ONsW+5d4WMoV2GDuTk
	 smSFZ/94hmWSSD1vEio4wptRegmrnbt7ijXsnzTnDKN0EJJF4oMLEsY5Ena5jZ/HgBBVe
	 L0YBEpvEnocM1ikcqiHLM8YoeTCKxAabSwQYRoZRn7L2lOrl8u9JfU7/kAcZIDNh3exUg
	 Wc9yUmvFKK5aHSV9v1gz9YkPksEOfTTb1tGXjsz7naZBP9O53GkYkk+BULLKPrT1AQdyW
	 2ijQePFT/sIaqMR5OfKhFLLaSqMQ10DKP0wpQOLxmxxttnZcT4vjXhmA98hEGr/Ft7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWBIHSsE;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E8606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 770E8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWBIHSsE
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so343153241.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153993; x=1793758793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ll9NzBFV0AYwGYRot8ioCuniDijkW2mX9UPa4oGfP3Y=;
        b=oWBIHSsEZV3Kytyp+sDKojVHfHeiz3N+K7zF0XXNsjkLsLuXCOpg0UFpiVFKtFjqfD
         c5fQQdlVLtFwxWBOqFfCcwyLN5eeeceB+4qcgkQurhmG3DBdgKLgn2xVVojApePswQo6
         K49lLpF+aKm64vbkSbTHbgdLjVPeVrmXWmU3kLMzGiAwovLayHJexaLfbAzI5tdUsidQ
         7kNuMlLqLqXnEUxvCzOHpNQ0tFr77shWiSn29AqnkaCGqrzWGxGtQgfifME0qu62SubW
         zWpT/5h+ulVBnhTUlC1uGsc5KGUmKajYwfYu1Qjpw4aiaFB5+otr/YrYK5OGDVF0zSe7
         2orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153993; x=1793758793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ll9NzBFV0AYwGYRot8ioCuniDijkW2mX9UPa4oGfP3Y=;
        b=Uxfqf2JX+1psaz/gM1wvknW+33Gsq/0Pca/528zyR2/y4RSs53jDdNybcp/whAdguV
         +AGpN0C6XiX7SNOJZoLd/ihTDCq3jMMQLISYHULUESHAxZr/HnG4MIUF6mx8+5ywLZhS
         qUyQsjYtPWAc7I5lPL0t0xkPxV7vzbb8l4c8UISPyluDWW5py6i7R8ylDcjuHyJEGrjQ
         cQpTEBOOM8wdmai9LOXazXYZ5XUIq/KZ7qclx9WLW+a1BEuJ/PFSoE2XQveU6184Odbs
         5JLhEL6QBFWk9V4hJrEI7T/cvgHt0hRP2UNrEeRp76FD0PVYgqUpojJt8I4177E5BRJm
         rTeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz12iIz3e1r3MHWRMRW5+Eg6y+8GbK6LZ+xRSeLOnkusqdphEE3vqsm1GckO2NRsu6Fp8Mp9pFbWVJv@vger.kernel.org
X-Gm-Message-State: AFq9FYKlNVTQfLULAbefZZErX+jaVR5tdYI7Q/X6ERD59KYvgSooTfTH
	1lYuddagn4SZUpROd0CyR/5hUYpxJwKhgTnnZkUtqTvQR9i9UxLi49mW
X-Gm-Gg: AYBFou0NmcWrLY/v/VsNSzyVYtHtjqeSIyw6rOxBK9aLWJ4PEGxK/A4mkuIeSH5qpaD
	iKxOXoU+puYFucdj1jPvl9gXv7nwzyFCNGuKJxD8iIkuB5KfHfXkVOZfYyYKoJqbOM0Zct0vCzr
	8cDRdffIjXLzHJyZ6zMewILSWc3zV4ZF1Kve2gYfDfB86lug527DuYcjJO3L3P3MGn6lMDJCJDS
	ZVt8rlXlO8BuwMvW6tuQVEABmWBs791AiiLaENYESvj5z8Jn3u5tcGLNetX9l9dgoN0dOyglR9w
	dRtLuIjDxHEdH5/o7JxUBuzJafFRdDt0jWAwfttbqqCJZnDGZrDqXy3TnMify1KgaqY9blbEPzF
	UDsx0p9UdUHH8ymOm2PN4d3SaUdWoGBnK9Bs6UmxrBGeahcL9Cfwb5Igxv45WHds6yygYxFX1Bw
	7NQZ3GHOZX6b2SJjJtT2KueTohVeDrP5sqAb9g7g86WJK5uUr/Ipply/SpgqpWqQKFa/kTjtgVw
	nl1DdMdhzDtv2PwVLIO2jKRtxaVSIbMgxni27aSPPF4wmVUxteSrF/ptjIFxdathVGtCszA4Ptt
	MXwhgUoBX2UVld73aPbxvIRE7hFDw49SDjN1CrnGluM5hzuRTurUTQ==
X-Received: by 2002:a05:6102:448d:b0:7cc:1967:5e3a with SMTP id ada2fe7eead31-7d03a5e4ca7mr537509137.32.1793153993457;
        Tue, 27 Oct 2026 19:19:53 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f6ffce4sm428432e0c.1.2026.10.27.19.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:19:52 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] iio: adc: ti-ads1298: fix the data read path
Date: Tue, 27 Oct 2026 23:19:45 -0300
Message-ID: <20261028021946.29877-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025230601.6a2eae34@jic23-hlaptop>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-2-stephanbrrs8@gmail.com> <20261025230601.6a2eae34@jic23-hlaptop>
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

On Sun, 25 Oct 2026 23:06:01 +0000, Jonathan Cameron wrote:
> This is a lot in one patch.  Can we break some of this
> up into smaller changes?  The whole thing is probably
> to complex for a stable tag, so focus on the most broken
> aspects.

Will do: one patch per fix in v3, the most broken first.

> This I'd like in a patch that does just this and allows the commit
> message to say why simply using a single lock for the data buffers
> would not be cleaner.

OK. To check the argument before I write it: a driver mutex around
write_cmd() and the regmap accessors would also stop a register access
from rewriting a command. It does not help with rx_buffer, which an
spi_async() started from the hard IRQ writes, so it cannot be under a
sleeping lock and still needs its own cacheline. Separate buffers fix
both without a new lock. If you would still rather have the mutex for
the command path, I'll do that.

> Complicated sounding solution. Can we claim buffered mode instead?
> That would ensure the update_scan_mode and this don't race and mostly
> would be taking an uncontended lock.

I don't see how to do it where the race is. The sample is pushed from
ads1298_rdata_complete(), the completion of that spi_async(), which the
SPI core "invokes in a context which can't sleep".
iio_device_try_claim_buffer_mode() takes mlock, and the core holds mlock
while it calls predisable, so the completion would also wait on the
teardown it races with.

The driver starts the read from the hard IRQ, and I'd rather not change 
that in a fix. Did you mean claiming it somewhere else? If not, I'll 
keep the flag, as small as I can make it, and explain it in the commit 
message. (The automated review found three ordering bugs in this code 
in v2; they are fixed for v3.)

> If we get a timeout, we'd not normally worry too much on old data
> on the next read. It's an error case that isn't supposed to happen so
> if we are talking stale data that is often considered fine. The
> second part may make sense - break that out as a separate patch
> so we can easily analyse it on its own.

Agreed. I'll drop the stale data part, and the unbind wait becomes its
own patch.

> > - The return value of spi_async() and the status of the RDATA message
> >   are ignored: a failure leaves the transfer counter stuck, and a failed
> >   transfer is reported as a sample. Handle both.
>
> This is fine but not burred in this giant fix patch.
>
> > - read_raw takes the sample out of rx_buffer after releasing direct
> >   mode, so a buffer enabled in between can overwrite it. Take it while
> >   direct mode is still held.
>
> This one seems valid.

Both become their own patches.

Thanks,
Stephan
