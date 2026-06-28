Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF0313E07
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782677332; cv=none; b=SVsfONrY0iYsv4Av1+6uks6C2JKGfgueXhkpUIkVCRdfFTxADKZwir3vyxigLfQRZ10z6B9zFnOCPnjzJ8LGJnvQtXxSpP1WwChnS0aHW8Pf8ykIe8Mzn/PXviTE1G4N65tMdrND58mcvtMGdW2D78cnVnwAeAf4DVYSQcKU9vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782677332; c=relaxed/simple;
	bh=mmds2X2Em6lCz3bqq0WzaqRt2V3pOeaMlOXBTMEKAwM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=akttolrpOVvQIVW3o3BRzVz5/w7KeTL+6xtiwnyOfU+CDydHPfWhpt0Wme5K1iS0hudaX+UXPwsDqwANbXKPgJ6+gEH2S2BBuPeN0G7LPQJcWMQWx/23udT1Q6P5AEPBwpZYwXN41+GzsgRPZGUX4tYAqtczgn25/smGEyJq+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rq6rg1wN; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rq6rg1wN"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-73503bd83b0so1555720137.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782677330; x=1783282130; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmds2X2Em6lCz3bqq0WzaqRt2V3pOeaMlOXBTMEKAwM=;
        b=Rq6rg1wN/+Z44xsstj9trPKJSqx4zm72BFWAOasbkCuHpXm76pCm/pKTL5DDmf2sT1
         ae613HUUTMVTtrnFetB99eyev6EjF9llqYo1qWcNNQGBMOX9aSDLIx0MZwdA1vq2zXD4
         bkx+94pMcbRT1Wb5ARK9havml/7MpqHzwsKQOAqpcPLOPnMVapC0GGqS0bcHj5KAWuc1
         uI6HKNqxWND6xKj5Flz+6MPLf0kbVxqTL2oBjrkJWeRaUv0xMKmDblhN69q3YEaYpXcZ
         Q/5J5RMvJ8vB5+D/T5K7k0z7DQDTYbts1mVqlHcbIxHVKL+KnExKp6H3xKiFC19lmIKg
         q2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782677330; x=1783282130;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmds2X2Em6lCz3bqq0WzaqRt2V3pOeaMlOXBTMEKAwM=;
        b=F4CRG5hpy+Y0+vvwHXYG+t+szh3v8KhEDMljcjIo5U8rQQOW0KOH3NAZDwsxYYuzWg
         Ps/LKCW023Ore2xt3YyJOfORWanLr26oSHBTtnm0jG9YFaW+dFISQU0tbkzD2XTiD4oI
         buApa/qstiURpgcfBHMiLpZEFvz6A4o3yF/XSYRqDfuxsKbl6jQoouqtFjO9vCsic5HQ
         ph5hp80HD7o2adZibOMsfYdVsdFxPh/MRVvNtZhncb5fMrakaaQPEWQWlFqfQ6JbPzqV
         uxyQe6NFS9Xb/LHXhDRwE2pq+yPAs8ygvtKesR9KPZsjWlaQCM505DkTv0kO0jvnt1x7
         1Y+g==
X-Forwarded-Encrypted: i=1; AHgh+RrFTumIbkn5QrI1MEieKzWQW0e2cVGEKCdOTZTf9xkmJefrHWFsODcrT7wXkMpHPC9WSQDLJaQMoW+C@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWD7KuQ4g8Y554Fn0JzdvWsEZQOtdOVBNrswPKhNWKQasS5of
	wfdNi+/NM6ZouuK/GtKT3YDYy3UsdrsLTcIV1nVmSVGCUAgkrJXt8PqPnYQmqg==
X-Gm-Gg: AfdE7cnx9j9tYHdxrFKzfmOjls5cpI8n6twtl/V44++tTK/qjqzqPfjBwaykMWp5DYt
	eKnZdeDDd3196DqyDLdGzdfjm6UBsbjIWgBZDIEN5PVM1MmtvyePcSnJw6Q6tjwKy+k7ei06UOQ
	uMJbZHUCthTizlUGX9xJ8Eij/3G7Efl1BDCCvkHNNqAzkAj9GyEe14pFgd0hfsb6hBshDkU8VR7
	ezFu9DaPsQGs46RAO/VgFA/TtKyoARXSc6go4M4u80+DrzlvpHPb1ZeEz3hdL3Yo3vdVHN54z5T
	LdZCgC/rYWLujBJDjpZ3GA/pBcYj6a0z48Y31bjFxXDIk/peErDvjQxiv7L+qZzGsU0qwVRaRqZ
	xwLDpqJNa4V1sEtd7x9ZpMUXL4f12FxDdq48ZNSm57IZMuxKFU3lvTMBNVRXgaCVBn6QCdm6OaV
	+CpgYVNdA40nUQuw==
X-Received: by 2002:a05:6102:c4b:b0:738:9c79:750c with SMTP id ada2fe7eead31-7389c797932mr573999137.15.1782677329944;
        Sun, 28 Jun 2026 13:08:49 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9691f84fc71sm3745321241.8.2026.06.28.13.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 13:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Jun 2026 15:08:41 -0500
Message-Id: <DJKYDBR2CR3V.JU80TA4QDQLT@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/7] iio: adc: Add ti-ads1263-adc2 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
 <20260628-ads126x-v2-7-4b1b231325ba@gmail.com>
 <caf89e08-6ce1-4dbb-adc1-7fbb2a60fd7b@baylibre.com>
In-Reply-To: <caf89e08-6ce1-4dbb-adc1-7fbb2a60fd7b@baylibre.com>

On Sun Jun 28, 2026 at 12:22 PM -05, David Lechner wrote:
> On 6/28/26 12:36 AM, Kurt Borja wrote:
>> The TI ADS1263 embeds a second 24-bit delta-sigma ADC (ADC2) with its
>> own input mux, reference, gain and sample-rate selection.
>>=20
>> Model ADC2 as a separate IIO device on the auxiliary bus: the ti-ads1262
>> SPI driver instantiates the auxiliary device and exports a small set of
>> TI_ADS1262-namespaced helpers for the conversion and register accesses
>> that must go through the shared bus. ADC2 channels are derived from the
>> parent's configured channels.
>>=20
> Can these just be additional channels in the main iio device rather
> than a separate iio device?

I guess we can do it, but wouldn't it be quite a mess? I think doing it
that way adds a lot of complexity: channel naming, available scan masks
(because both ADCs can be sampled at the same time), optimized software
sequencing would only work in ADC1 channels, ADC2 doesn't have a DRDY
IRQ, etc.

IMO separating both drivers makes everything simpler, easier to
understand and easier to maintain in the future.

--=20
Thanks,
 ~ Kurt
