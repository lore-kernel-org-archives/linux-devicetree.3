Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9263F471D02
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313519; cv=none; b=tWeD8rvChdMUVxyNDTNHcasZFgrYkTHFxUMX0zxcsxWim6z1S6oI/5Ynk0qLBdiRbrdyCJNVUuvHa6sJLKEAQSC/ogOtEANpDtPDpZkd38Twy8EBQMBFgnA+uSSKi3sUK3x+TflF7VGxQDbL9/Rqrh0DVslBn8moi7dvzn/Lqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313519; c=relaxed/simple;
	bh=ga7ewo+bhPZL/Y48rxxz8sC5ayINjETNSb3dQnDXhIU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oOWgoRfVpkdlaAN4R6dFXJfkBNBDnFO5CygqDjXfQ90E8E4Z5/8SntOif9rH5e8RKFb1/p662lU6PAIXJ/xVfgD+YJOoxP+QsZIZKdiyKYXTgXkK3MzvY8F3NGIM4NGCsBRusfSqQarnHTIQtUsTvuBeCqaSkvcZASM3WOPUQlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSSWnFWD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSSWnFWD"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20ce3c118aso168368466b.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787313512; x=1787918312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dn4PV1MwoFGkSkGi3sdTp0WA3nKp7vJn8YF1veXQeBc=;
        b=FSSWnFWDndOKiE6OE8nhkP1/ElhRTDAE2mHGxwy88D4trjwyqz+hstHsz7z+hPGwX9
         Qcr7klQuNcW2INQZGFyirBV+X/cC1+TmlPZkkBUO810a3w1zkz7DDKUDRG8Hdj2kLrAq
         4Ahg2c2P+TPProR48Jkm7DJUHbTufsbrq1C6425smr2YE/cNgENUwHhzjfZXVXCmEgcc
         FCtcn14S93m997zF2iTBZ9O0fHp4PL64CHwxLUFBkfI1P7rYYZvzzLeom27YX1AySfyQ
         0vZhljNFT6uCG5/1tgfYaBqrQ1kgeaZyY19iMKEsgRJjbHnMNF9mQ24DYKzRgFx44pFX
         exDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787313512; x=1787918312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn4PV1MwoFGkSkGi3sdTp0WA3nKp7vJn8YF1veXQeBc=;
        b=dIgkxciwDEwtI/3AoU/Lq3WbLOVZv8c1/INz4D1dgAnTYrwYEQUzOi0e9PNzNqH4z3
         jSQBCUaUIdAF5Eft7STts0sMvg+JMpELTgx/I4yz60mv6p/gOX3EmrVi5USBfDxzyhj5
         yRGXgDilWFIbEpFHqpKOdFjjqOpQDRFAW2g28PRdV6tmJi8dXj494ASgta4BzhTcus22
         ufVhplMC1qr7SQKhw4nRwUCJjY2Bx8vioAkEL4zIvAp4Ce5hKJAN3mVuQMEzwic5nv3U
         hTQw9TxNdA57HbN+6ld7GF0rr70nwl0sLlOyIrp5YZg7Ob1zGH1Fm5yEiJOGtZFZxlAt
         XfZw==
X-Forwarded-Encrypted: i=1; AHgh+RpxMumGkfb4f0AGqShGiJLjDhFLeilYlvdPJyIFh2i7m+zzK+XGtQUDBQVaFlMewWmymPlYejR43vvR@vger.kernel.org
X-Gm-Message-State: AFuF++kUMFFEnVaX23cgA4YDcKEuIzFtiR1Z7BKyDnrFuluF7GX77owz
	h+UNbodjI/obyQ0m3JJiEZVOGhbFS8y6OYtnWBajaV592lKYor7v5hEx
X-Gm-Gg: AR+sD10/NlG7iRs1ZIfscaNSXpNxrfxxTi/8JwJCjg7v7lfoSNfbw2arA0s25UphGqY
	QAXXoCPNsxT/IcY5yLXEmDosJOCETWhHGTBtwCuH7+qN3mbMwAJQkCcYNzhm2tUZS4SwtALqtOI
	OTRq4WlaeDsro8BKLp4j++W/O63bUatVWS8sv9PbkjrN8G/YeF0bLrW9tU1Pxmkm7OG1MbSEyDT
	++Q6kuh8fAYapdaK0qYXCuOFvXzBarEABG3+2UR0Yf2q5DcbPcCrLE2zz22iAqDjRtO/jVS/brF
	Owz3kkZ4L5+dx+ajrA8M2Qq9NDI1O2xCLq50kSHn+QhOtiBuGTd3tcKowBFHBnneoRCPRkfJ+5S
	dqf+aLKncd6hgMqvphD2kEZ4zHJlwK+BN2juJFknWg557xWl4Ll45ywB/UnXGvkZ01NUziauCeo
	Oklq2hkhDNp4DJjKPkq98z3k2i0jbGzr2KFVIIERCM59MQ7vxrExz9tgJNXqfmilPXT/gazjEem
	oOM2+fjHI6FFeKm00mOE8GH99WWANTspWDORJ6VNb1ZWAFnkjOgbvIAURVfqlF6dpTOS/XRS34a
	AE4J7GQ1J/9CwS+epjvL+FegyrR1jqcwFvQbk9MCE9smbPI1L62PDxL5YhhDcWvtsolb5RQMmFE
	96WfZK/JOE8wft9OJL/4tHuYKuehjW46ri2AetwvuwePvtcdcklkoHsu3ujdA7pRuwBrbsA==
X-Received: by 2002:a17:907:c30f:b0:c20:367d:f8b8 with SMTP id a640c23a62f3a-c244d4f05efmr1123237566b.4.1787313512017;
        Fri, 21 Aug 2026 04:58:32 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e1ab3sm483334766b.4.2026.08.21.04.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:58:31 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:58:29 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Taha Ed-Dafili <0rayn.dev@gmail.com>
Cc: Michael.Hennerich@analog.com, andy@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlechner@baylibre.com, jic23@kernel.org,
 krzk+dt@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@analog.com, nuno.sa@analog.com,
 robh@kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v5 3/6] iio: dac: ad5504: strictly separate ACPI and DT
 probe paths
Message-ID: <20260821135829.00001fe2@gmail.com>
In-Reply-To: <20260821114153.58607-1-0rayn.dev@gmail.com>
References: <20260821132021.00000d2c@gmail.com>
	<20260821114153.58607-1-0rayn.dev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 07:41:53 -0400
Taha Ed-Dafili <0rayn.dev@gmail.com> wrote:

> > ret / (MICRO / MILLI)  
> 
> This exact line was discussed with Andy on v4. Patch 6 in this series
> replaces this whole branch with the output-range-microvolt property
> parsing, which does use (MICRO / MILLI) correctly. We agreed it wasn't
> worth changing here to avoid an unnecessary intermediate diff. Let me
> know if it would be better to fix it at this patch regardless.
> 

Ah, hadn't gotten to the v4 discussion, in that case it's fine!

-- 
Kind regards,
Joshua Crofts
