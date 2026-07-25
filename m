Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023B53BD241
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784974656; cv=none; b=ZY7c9amg8FuNL+FHp7FvgWqjgjuRP61pzJUfiYmnOzTSBiu4in9csf/HxOTojXcro1ho51juDpIZKX2iK1wovX9iPnwjMPCpH/V2hiJQNpJ8D61A9BmMls/FxDFkUVxa8ycb2URTNsnqz9HVi3GWFibqJxKPSCvoqCmVI7O1iEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784974656; c=relaxed/simple;
	bh=hUTIi7rEN+TKBmQFeMTDf1+g3Nll6U1TsXrepLKO8J4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LKN0eufHHtEWPZO09q0IMGiN0P9oo55PsWY3BQU2Lv6JHCp50NlZzATEmv8wZC+7OY/P9LJKPCOxREgrshrpDf6fh/Qg5VAoOQM5Jp5M2GJINZA7crlEMIP6gyQoEoOnRAYy1wcj4gnqYRpXDG3sfokEQZdZSMXq10NKNRAbiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0fTqNT9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0fTqNT9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so12961925e9.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784974651; x=1785579451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ACsh7R4wzS0nLindz0m3mh8kPJzVM/jAPB4GBMMFA8s=;
        b=B0fTqNT9QyfapWMQztNf/O0DVzbZsZHT75GWEDmi9wrMh1fxujQmk6ZJt9jo55vdpH
         SEVOG7YPGGdQhjO7ItSAj+Bwi/M1GX+0LucOYVRpm3RULAeuO7RQSwGVyml14iGKDU/8
         0/LFzrP6+8GPRTE4+CePPjiQt+XpdCAcltWl9Dcidk4wTOsNDBnvkVnpG1BgAaQ6hlS0
         y1aRIfvpm9hL7xf8aQlLDNjDuuo9yQ5pelZAP31AJKSJsR1i3s4nUlaT09FKVQo40x8S
         olMa+ii4eiVULbgJ0In733tXuVWJfodWTHwLQL45XS86ijsa4OKlm3i6qWHw5QK4Mlxm
         Tj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784974651; x=1785579451;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACsh7R4wzS0nLindz0m3mh8kPJzVM/jAPB4GBMMFA8s=;
        b=aMohunJ18HJVlqzxa/Z0bI/WnGCe33z5h/nlRePUGYBfyd9adLULUL+VvbhzOd6CxQ
         xGz1vtvgnuWcAQb+iyjK9XJjTBnBpuTxuCBn5oUCBf1WHcirBLQ0pg2aTgD1p/eD02i9
         kRdi+NJO/eSLPG1+02JOJPlrlbI0HpaT+imHEC/swvQnFsxSo54PZ1duungvUyLo2aiS
         B7MTQF+mwIW8RDfSSKZXHQrUIeuJ6HrZ0AsXBBYBJfLk2/0Y+zy8ng9C8vew1LfzzqIL
         C0QC/mY0Sdq6xk/Nilsx0QmtbBvfpuuKRnF7yJixBWTGdNdIZHmUxlQlxQrp9lDQzTlx
         S1iA==
X-Forwarded-Encrypted: i=1; AHgh+RqEE7jXL5DGQpSCRmZM3tG6GkkaASZSNRhrRIhUtqXFwHU0qNzhf0uJefh8d6ma7l3ON5HtNow5uVXi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7c+fvKm5gsD96AHFKSGjE3nM7oNvDSP9HMuSsj8WcTl513B0G
	8HJAn8RPuFUTrq4WAoCe/SnLeAbBt4tAM2EVgbPahLT5PGFqZpWFeHnZ
X-Gm-Gg: AR+sD12hVfzgqeZJMbSf2GatO72JLZ94bbMAY0IMYzXbhCNPUxzIsUeGJjbtM2+3VCH
	n+E0YfpKCF4kbuGbT+i7ZHlF/1FY6wtkOa1K7KQnkQp9hticyGrH5XeFnJedy3OYZ14vir5F7cr
	TraWwozgYqacve+oJqquSQUixaGaeO2yayyxvEawpHRQ4XaBtZevY5qAjUfgsHhuo0CefQpPMNs
	o3gmg7xsg8UpGzRRcRcuU6GD0t8b12i3KeJ4UANujdcmBg+BcN6SLHQkdEtQKcqd5PyfKAzO3Cq
	Gx4dr0ClbzmxN89ja6Vd0k85sQ1GX32U9gWruDpzY3K86NKHNzpkZdXezfkfSkTl773v3zFvheI
	F1dFAHejdyHG/tqHmeyBT6zZDBmvGrwrAg7oe9JSzvvpihgA1iF+HSVGQcHJ9iCqxojbV43sCh3
	R4VhJDfNF0Tg6cbqjVzTYVdCxg5Y4lsbxhua8WI1nwnj/hy+gW5aHvrZ1iK+a6fS9BoW8ZoQopB
	kJHMheA9l+qMeIxAB55aVvox9ev66MOIPTRGApSGmOBp20epzupSnzFuMIB9Xp/WOepRX13KoMM
	/Utf7I12HfWjMehFPm3BlrF2whasvOdx5RKCjF2+AxUoUfOG/CnsUqAVjpujcUtMKu071INN0Wm
	qhD1Bu15jzso=
X-Received: by 2002:a05:600c:8b75:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-496b56e6efemr25132735e9.2.1784974650564;
        Sat, 25 Jul 2026 03:17:30 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b49a6e17sm57067605e9.13.2026.07.25.03.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 03:17:30 -0700 (PDT)
Date: Sat, 25 Jul 2026 12:17:28 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: dac: mcp47a1: add support for new device
Message-ID: <20260725121728.17ddbc7a@systembl0wer>
In-Reply-To: <20260725001417.159653b8@jic23-huawei>
References: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
	<20260721-mcp47a1-add-support-v1-2-da045a2567e3@gmail.com>
	<20260725001417.159653b8@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 25 Jul 2026 00:14:17 +0100
Jonathan Cameron <jic23@kernel.org> wrote:
> Given the really small number of registers, regmap does seem like
> it might be overkill

My thought was that regmap is preferred over i2c_smbus_* functions,
but that is a simple enough move.

...

> > +	/*
> > +	 * This is a volatile DAC which doesn't have an ID register, instead
> > +	 * the value register is set to 0x20 every Power-on-Reset (table 4-1).
> > +	 * Any other read value at startup could indicate that the device is
> > +	 * damaged etc.  
> 
> or some earlier software wrote it and the all the regulators are stubs
> provided as they can't be turned off by software.
> 
> I'd drop this test - it is a bit too flakey as a way to tell the chip
> is there and working. 

Yeah, fair enough, there's a reason why it just reports it as dev_info().

-- 
Kind regards,
Joshua Crofts
