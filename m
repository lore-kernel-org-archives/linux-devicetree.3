Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794856927;
	b=bzlqsP9DVm3YSgIkhwPkJVEkyON1hM9+SurImGS49dU1+MFK14dQrHJg9iD157NAPkHe
	 68DRc0by/4Vmk6CW0nLwhEKGucwYfK9xlVyWH9JJi7vk+nDFXr5Ir4tQ3cjFeeSyzfUQE
	 cDH36feCieGVnCxP+Xexgd/OrBiB3zdhptvixJe+5lAIILfEtk4F+JbeUYw/ABfUT7C1u
	 bEhtgGe5p6wfkMObTuzkVrWb9Sn2t6qPVzXQLXh8VFaiHWorTFrxSRi4WgEnYACINv8T1
	 +PbpiuUzeRituxpRLr73+JVnlSPPdi918XSqXmS4gpNDGMFPrg+X0M2uqq5v/qYa7GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EweSUMm4/P5BAq0haWY7BiMzFOHYazFTSCELjkONQrs=;
	b=1ZRKhHW+QOMg6Yr/MkNYr+2juZFSiBLUwDbCsTOVAVjVDW81Bux5IwKTey7EcP00XM1g
	 uPcDqcblo1wIRlrncW3nLk42BhUVKrhxz6l3PhRqdiMNzHGiBiYlj9gHo86NpoBIajCfT
	 oCQFK1l7MPcP6OoTl7aDCQbxdBJ/ytj4P8Lq8fcrVJJ328HGYoUc1b6WnSmVymefdRyEG
	 xGl8mBqjYj1gCgeixOqgLaXSQebLLtiigQb0pNXPj+FZCYEQCnNWuAsRxSJ9ECi4oFE6p
	 qmqdeHcxFD3zFToeVe7xHkrlMw/hCp6csTxN+oJGFEm2gfKuuUBUFNbEWwpMZ+0HNbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nRMS7S/+";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A11606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 19:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A11606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRMS7S/+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5016716eec.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794856926; x=1795461726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EweSUMm4/P5BAq0haWY7BiMzFOHYazFTSCELjkONQrs=;
        b=nRMS7S/+s2Is0hyBZzp0u0FXGwf3uGVRM53Rnx6JBxjL18C39IVe8tfqvxRbjadSNK
         WUioEZPqrBNefjqg6vGnQg89ClP/bpuUyPvN9pF6ydLpc9SmQDEvwH75UlY4CUUq3jFN
         piaRj6AKYi5LkOXB+e5Dbz2l8jO4vvVkIw+WO/YJacySO2wPyu9IYH6/ZYim+TXEAVji
         YMoZqDc0ll/DLm8VfyP3YG5x9wbKxYJWKQJyKKSa03bADwy2nHK+ZNuP6Tp3vBlKXO8c
         qJKNqWqw+l3KUbclJP4S/YG3mCssdy2kOT75XLkYFx1XLfoUPFyJTGQuNEapvB6eIiJZ
         Tlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794856926; x=1795461726;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EweSUMm4/P5BAq0haWY7BiMzFOHYazFTSCELjkONQrs=;
        b=ZDwhq+UJPPC4q7G/tjQEuDrIdTotz959dDxwwUeBC6jJxKO2W2ADScsChvA927bb79
         KE6LavYzyMysD6otTHGuVqS328M4y+qWRwneYgO+IFKSyVBb3Epzat12Mzkv7e5mhEGl
         URP0E7kVuN/NqQea+6vq5Am5buKmWU/rxHiZiRp7G0ywF8UJQ1pXX7TmwSlybHu4G+ns
         rFKU4VyCbz6SuCl0BuUyMUs3AEQD3AEMqnfyiEOiVFC9PnBBgUH2qOwNhVx/Qdj3Hwl6
         4SQcpAcVJ/Jy+2C57xPeHsh7Wsd7D/kHnPGg6F+LZ1ZyitZwgIYCVYLOrm0SUR7cqGbh
         YltA==
X-Forwarded-Encrypted: i=1; AL+hErHDVdgItj2RQqp53tSsy4qM7Oi9mkacCUB66UTss7v6EdJ6PRvHmCU0O81CXjQEZpH2tsEhG0psCVY1@vger.kernel.org
X-Gm-Message-State: APuU4Z+AhtZG/zwfB0cJhf7y54JH3ff85K3gHc2w3aIV40Y51FzpxDnK
	odm2RYZyDSqDNOReIgda+fZFaoMKMqjzDBLjTFixDCU0g5GJGKK3/em6trg9KXLB8R48NA==
X-Gm-Gg: AYBFou1WgNWB622x1jB2UucXnAaDKNJEVHeAe7g7v5SiiE0YswzEg+0Yk2KySClur3q
	trojIuc4isbOSibTdam3vo7iCCy7a2rrL/sPrIxrKviDHiGDdvOZNuOWNtNnH4OFx4KVC203Iy2
	ZE3SbPkYH3o0ogWnuO3tMXljivQYV4FW0UKWF3rwh2WjAqQvRDtbTqh5qSnVZFFZcOXr0V6hYXJ
	3LKoTwY2/n2Cs6J9y89AMJak+ztTcZcmDQhmPJpStEufErKGAEi20Cvmc/2U7z7F2mXWaLalOit
	Gfx8ls8JNN99iLQb1LWgapyYPST5uYHy3wPU5NnXdzkBmOSdj0kCqtGAjPc3wQypXEov1IdKzKz
	956fX1vo9plCb8wAthY50piGdDcXcTYWhWNaLxgqJL06+/DQ4HcIn1jX1iL14QdI58X+0cJuZP2
	CC/qfQ0qdOFhNtVajFO05zYICJ51YZ7u6v88rTLFT0G1Zi13/z0R91/vlXtgiisstKlUqzOX6Dj
	Kjwi2rTEwxwcFN9nj7ZeNQOdZyPQPxsQrfw5JmBkyi8/AupfQT3jvTvTDSUmpZUCPvDIlNAsndi
	UY/JF3mD9G31fkAeGvqOO22P+W+mPCVCFz4G1K8pALC5Cbg+hll0axUOOGg5kh1NlaWBk1pc3fD
	+XF42hbJFYkbc2NIe3srjbO3W8ZoHe+lHUJScNWvxVthuhufJHVxAfmE6Gn4EnDdocK/BMLph1L
	Nv3ownML+kh/XBoxHaFlTZdZ4/58ZoU/522XlRAn+n/g==
X-Received: by 2002:a05:7301:d189:b0:36f:a651:d649 with SMTP id 5a478bee46e88-37964b08e64mr11776840eec.4.1794856925787;
        Mon, 16 Nov 2026 11:22:05 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm34908993eec.22.2026.11.16.11.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:22:05 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor
Date: Tue, 17 Nov 2026 00:51:56 +0530
Message-ID: <20261116192156.33333-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115083741.62140-5-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com> <20261115083741.62140-5-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, Nov 15, 2026 at 10:37:41AM +0200, Svyatoslav Ryhel wrote:
> -	if (test_bit(0, indio_dev->active_scan_mask) ||
> -	    test_bit(1, indio_dev->active_scan_mask))
> -		mask |= LTR501_STATUS_ALS_RDY;
> -	if (test_bit(2, indio_dev->active_scan_mask))
> -		mask |= LTR501_STATUS_PS_RDY;
> +	iio_for_each_active_channel(indio_dev, chan_idx) {
> +		const struct iio_chan_spec *chan = &indio_dev->channels[chan_idx];

iio_for_each_active_channel() walks the bits of active_scan_mask, so
chan_idx is a scan index, not an index into indio_dev->channels[].
The two only match when every channel before it has scan_index ==
array position. That holds for ltr659_channels[], but not for
ltr501_channels[] (also used by ltr559) or ltr301_channels[]: entry 0
there is LTR501_LIGHT_CHANNEL() with .scan_index = -1, so scan bit N
maps to channels[N + 1].

On ltr501/ltr559 that gives:

  scan bit 0 (intensity_both)  -> channels[0], IIO_LIGHT: no RDY bit set
  scan bit 1 (intensity_ir)    -> channels[1], IIO_INTENSITY: ALS_RDY (ok)
  scan bit 2 (proximity)       -> channels[2], IIO_INTENSITY: ALS_RDY
  scan bit 3 (timestamp)       -> channels[3], IIO_PROXIMITY: PS_RDY

So a proximity-only buffer waits for ALS_RDY and never reads PS (the
"if (mask & LTR501_STATUS_PS_RDY)" block is skipped), and pushes
zeros; intensity_both alone gives mask == 0 and also pushes zeros;
and enabling the timestamp makes an ALS-only capture wait for PS_RDY
as well. On ltr301 bit 0 is likewise lost.

> +		if (chan->type == IIO_INTENSITY)
> +			mask |= LTR501_STATUS_ALS_RDY;
> +
> +		if (chan->type == IIO_PROXIMITY)
> +			mask |= LTR501_STATUS_PS_RDY;
> +	}

This is what iio_find_channel_from_si() is for, as Jonathan suggested
on v3. With the export patch you sent separately, something like

	iio_for_each_active_channel(indio_dev, scan_idx) {
		const struct iio_chan_spec *chan =
			iio_find_channel_from_si(indio_dev, scan_idx);
		...
	}

(it also returns the timestamp channel, which matches neither type)
would keep the type-based check working for all four chips. Since
this patch is the export's only user, it is probably best to fold the
export into this series.

Thanks,
Arnav
