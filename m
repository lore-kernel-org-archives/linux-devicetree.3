Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8044C37BE86
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813106; cv=none; b=R2HSDrc+/L9XtqlmkqopUstVy6x8fud5OPZlcQfPlktb9Fn9WqmVLNuTzIh1sr2OJzqJN3tshkQ767wFe671vvXw22UJjWGCvAXjzaQbtALRP4Vc2qAFuwMueYQ9CY0Mj+soEUyBzItbyiPVDUTh7k5MUy1oIEYizA2dFuTkF3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813106; c=relaxed/simple;
	bh=JNLvSKsWbpNpU+kVfR1ZUgo0qtFkPeJnN9n/3eiEcSg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CbIYg3oinnO6XMqTelbZ2nwv20TXZosh7Bjub+/EY3JI/jKsyNkIUWjWmS02iHECewKH35ki8nkrFW/5Ee7ekeGkYmDODvPydeazWmGoyComtdUifKTbugKVww8ycMXI1yLtTkbXlrKmZXpAbRSfxtk0oda+qV6X0vJlPjG6Ww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWW/dfsY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWW/dfsY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso15046185e9.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813103; x=1792417903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLOrbPkiMwYxELk182ZPfeiCmk/lFJpYO2IK6N8cvrs=;
        b=kWW/dfsYmSuWUUAmOtu9ANV87tPPKXFs3Wu2Zf4c9BjI1gxqJUEUYZR6eDFV2eSFzZ
         9IkrgEcM0UNHqTeDzb/fi3vsTrHLpX8HoUz5MUT/ec4oVQM/Hn7YR1hQKx2S4bXHnt8x
         HZxqhhXXxfOQHbq0nRBwIiB/iVLkCNWky+C4Nztk3wkwVLqubb1dIZgHm8VrsCgo0+l1
         +QBbPfQpacUPyQXJpH8kkT9EOWM6v+WRMqagJdpxEPH4lyd2x0hXl+3tEGACJyTaAZYQ
         ejnhHfdKYevn5S4de9Sl/q+i/lSmbVR2Iqwqep7Rwp95GrwKUTAE8N9A8EAhFoiIpmOl
         LFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813103; x=1792417903;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLOrbPkiMwYxELk182ZPfeiCmk/lFJpYO2IK6N8cvrs=;
        b=xFmbNfTCMm9q6u7ZNBk0TQ0IwKFNZQEGzcanOXjFk2JWTDg7DodbLFPZ8S9vw+24Ip
         z9FwlF64rUeWPxYfqMCnjObbnIQYGhw/Yb1GxDMzDqA9QKPMnmzydXHuCPRX64XEO0rM
         9qDW7RfhcgiuX7Qq1OdvaaJIV862yYN87PaUYv0FjQfbvcgMy8JM4q1O0FnSZbDxbneC
         hFJJKuUWh/nV3UpsGOOCCQwg8xrxPhhttnYuIXJo+s/oS09qYpAQ1Br8AEku1nS4ZEyz
         ix9qw5OjNoUsNitjYp8/SGt2/DXsxS+xG8peLBzQlJXCoS0D3od9mMG7DbqjKDOQmYZb
         cJxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgiqgmNh2OQMTqGsoJZdfxT7gJWgIcE1kJaA6Zy927spIFrgkRXNlTEUOE9Cc7uo5YtaQr1GflxLAs@vger.kernel.org
X-Gm-Message-State: AFq9FYKKRsRngfNy3CNN4paPAR5a1d8PkTIBPH8sN66CtH+2oGqSoavn
	4vb5xfZjDlfhY/u6aia38md0RS0kLtIr5HBQgFjMWaU1eYNJlTIYeAIQ
X-Gm-Gg: AYBFou0v9COAqHiDXxFHKRkllY6vyUzJTZwOuZ1Q+CH/YPwbvve/IN/Pt5goTjR+cye
	bx/aK8AhtAb41vLu0bfCsK+hAQJpCAMasS0Dv4WQA2MolZi5l/8oqDzYRFdFWAD5FEx13pokxDE
	2tVla/fvzeuk3QMwfRVZphIzj4mlWwisR22MGZDXGNoy1+BcrquzDhQz3RPsKWEWAYlE3KOwYGw
	deelQSaTXA98eRfuR5Wh5RzU9rkbDLksFiO1h1F/3jf6C/bvP2+dxYTvFbcJvOfcSlSym1cAojz
	4Pdj/JdiCXsF0RHwHU6X/U3/tpK5/8zAGP43VeaULf8aItLlE4ZD756PBA0No+SbCnfPZYsKn87
	FuwTZdJ69jNaCGKQQTk+v5CJoaTsuYnU2SRRVjks7kbykQlDwNQUr0xJHY41FET1ELTVpnazi4R
	kjPZ+jFcLUiAIVYV6Y3U4GghiLtl43flXVJL0Ze3SK+RaYsTz/3x30QWMNfXRi/elphPYjtlOiz
	6tqUECCWmZENLxqtUAHdfYIMvj+STM2W31zE8o0Ca31N9yN0OnuDMUedHQKGk3A1332QUa4EjVF
	Z7MQvaaE9Ek3WR7V5EkdZI0t27zU3jP84N4IzrA+4+WC2ODvJRDwugtwv6GSLZ4ZBKyOBu7+Q7z
	YY6sBhf9Fgm2U/cva2+lJ2+aq616qzpGUdi8tVvywQyFmyeY6QyReOl0FouwBxGJB9TJjKog/5W
	48h5HUiogHtQMghcg=
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr179122395e9.26.1791813102687;
        Mon, 12 Oct 2026 06:51:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c3a13sm19399336f8f.25.2026.10.12.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:51:42 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:51:38 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Radu Sabau <radu.sabau@analog.com>, Janani
 Sunil <janani.sunil@analog.com>, Salih Erim <salih.erim@amd.com>, Jishnu
 Prakash <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 1/4] iio: adc: ade9000: parameterise the reactive power
 channel
Message-ID: <20261012155138.0000726c@gmail.com>
In-Reply-To: <20261012111342.48040-2-antoniu.miclaus@analog.com>
References: <20261012111342.48040-1-antoniu.miclaus@analog.com>
	<20261012111342.48040-2-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:13:37 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> The channel array is declared once by ADE9000_DECLARE_CHANNELS() and
> specialised per part through the altvoltage_rms argument, which lets parts
> without dip/swell hardware drop those events. Some parts in the family do
> not compute total reactive power at all and have no AVAR register, so they
> need to drop the reactive power channel as well.
> 
> Add a second argument that selects the reactive power entry and introduce
> the ADE9000_POWER_REACTIVE_ENTRY()/ADE9000_NO_POWER_REACTIVE_ENTRY() pair
> for it. The entry macros include their own trailing comma so that the
> variant for parts lacking the register can expand to nothing.
> 
> No functional change: the preprocessed ade9000_channels and
> ade9078_channels tables are unchanged.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
