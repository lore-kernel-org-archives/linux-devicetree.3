Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E467B4418F2
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484602; cv=none; b=RDeVRKC2KkFWMkxoGysHgpGSkEVARyi7JQlf7moCGh021uGpk6IRsc4+H4IgUxJhJ+k1qLF1mUJqFxVTKRa5vYacyy6o+RD5mlP1uXKB8/sNogXnHDyrt6yzIB7Ka5lFxdLCPND/bteXcwUxNn0HZsPXUivFi3UXMFQZ7Eej73U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484602; c=relaxed/simple;
	bh=H74Lq0TSr0QOVoOeuu9C+dc+cedTm6HEOLOz6/S1OMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qc1ImSbsipJLpRMlUJWFVohzJqL7jt0mXBOpuL7Q7T1X998RnZIIJF+eOUzFDZhFQ858bWDsjcFHmivM2TgpyC5gCiDW/vkr0zQB1fFsm16KK0MhRPbQSGvX9fRr1tktfnKkZf4rthCHH7aSX5F1psoOvLXGGX2kJRTjYJIg8b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pV+sCvAP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pV+sCvAP"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c3315c5dso37133425ad.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780484600; x=1781089400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RASJEjVAR9afFVw3X7mPRvBm05E0D//IY850D9FxOG0=;
        b=pV+sCvAPNd+F2pOBCQDATO019HfByIj0hFlrY05FdCo0SJaKv5vqzH5opLD9/6xXWH
         W/pPqzZoOlmQhf7QpKXqXUHXfoZHKNHGK0ZSoLLGy2KXFq1hMsDJOlGMf9fhhTKmvrfl
         sBeKPoohO7ekqqR8N3777CusurQkznM3qV3MIinGKGgoYF/PbYqx+lsmz1LVVMypm94y
         LMCvHteAVLGiVsd0gJGYKW6GjMMFYP9ahrTGhcpQrJjQ9LLSiVSc8xI6KESze23ZKL3G
         LRoCIV3RPCT3FvnW1xbQsk3KxAGMALRQfXP8P58XKA8w0ZV7L1Iu31d5bXcjUJDvp7l8
         THFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484600; x=1781089400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RASJEjVAR9afFVw3X7mPRvBm05E0D//IY850D9FxOG0=;
        b=bDOnmnVPKjXdZRawkC/rfubcBDTrRKDgFqlfMPzFCIEeB1BJcheUbcYuNQGSFdrfq2
         d4c+v/HR4Pv6HNi6zxrxoB4u86CwSW3Vx6ub0tfVMjdiaYvrFFvxIKMG5xn7j7jcKM6x
         EpdHDfZM325RKY7WpcDDoli6yX0edpBKjMJwTN6tn+5AhLotysriTX0Y1A/ZL9qrxOyR
         bGZurDTseN4cCGnBbCy/nLRSuO1OM5yotWtA9b5GwDB/un0MTVY+8nqIhObA/6vtnLAK
         lFu/mJBZ0Bio9JMsIgj3LkneUTs9V4uELU5ZmAKehvbGYRC1MueH14tOfdCmtOSGnIAQ
         UudQ==
X-Forwarded-Encrypted: i=1; AFNElJ94y41M8VB4ccTBQCe1V09xNZaZinwnJ5Syo91NiyA3iZraGnaRlHGekiZlhxft4knVesUP+k4Rq4ua@vger.kernel.org
X-Gm-Message-State: AOJu0YzMG7uTxkB105yjUc5jLihRwKQ1TkgWsgAbj5anERmRgFEkwwYU
	7XLthxFk7WtdHMPukODoU7OWlRb6L6Nd/f4qmmKouUTnw3Oft4ei0ZDd
X-Gm-Gg: Acq92OFqPE4BoBV+6NoppFlH643iyeKkWEw8s9iWDVTlhYQH2gHOElwTdunMjZ08KJf
	8/G7bP2hUbSiJQPSRpFoRuHa0GDLR4O8q2ZmkNDzV6AwCQ71aZ640ffsq6Fh0pKtKR0nGbuaJLB
	j/L8MIcIHyNH3IARwISDgvpsVEkCJebGDw86wL9VL9x9UTDSLjT/j5ESA3H/v5118VtJrZbIjSV
	aqhxNqsSDns+CphGHaek8PMGKRYf8bO0HhoqOculLBoaTlbak3pqJH43glkiZ0Qi7qWRdLBBPdP
	deFg3iANvbz40WtjDXZTR3KqSIJr9xCa+tHWlI00XXRJULZclHg+BxQUYS/iAkBZIye1aM7HdLl
	6Rpv0yW+Yj3/N1qHHzZSnaMM/QywvXSR5YH25bXGsQRdrek93AJB14R8iZDfIctJ/AE57ogweLY
	l6CHomosbljLtZQkT0Qe6GLeUfyAeBklYHxHmoEW/09IcF3dnUJ1rSXHbTvW5NunXbvB7MJOJbX
	ZKP3nQmPb0UOQ==
X-Received: by 2002:a17:903:1252:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2c163a24976mr28261115ad.8.1780484600180;
        Wed, 03 Jun 2026 04:03:20 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e1b6sm21738805ad.38.2026.06.03.04.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:03:19 -0700 (PDT)
Message-ID: <5d6ecdf7-1987-4ecf-ad59-06595742cc8f@gmail.com>
Date: Wed, 3 Jun 2026 19:03:16 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: Add Nuvoton MA35D1 QSPI controller support
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-3-cwweng.linux@gmail.com>
 <d32634eb-4eed-46e6-b378-d42df0b1c75e@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <d32634eb-4eed-46e6-b378-d42df0b1c75e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mark,

Thanks for the review.

I will address these in v2:
- add "depends on ARCH_MA35 || COMPILE_TEST" to the Kconfig entry;
- convert the file header to // comments;
- split the low-level CS register update from the SPI core .set_cs()
   callback, and make the spi-mem direct CS path handle SPI_CS_HIGH
   explicitly;
- use op->max_freq for spi-mem operations instead of spi->max_speed_hz.

I will also fix the subject lines in the next version.

Best regards,
Chi-Wen Weng

Mark Brown 於 2026/6/3 下午 05:30 寫道:
> On Wed, Jun 03, 2026 at 12:35:51PM +0800, Chi-Wen Weng wrote:
>
>> +config SPI_MA35D1_QSPI
>> +	tristate "Nuvoton MA35D1 QSPI Controller"
>> +	help
>> +	  This driver provides support for Nuvoton MA35D1
>> +	  QSPI controller in master mode.
>> +
> Other drivers for this SoC seem to have ARCH_MA35 || COMPILE_TEST?
>
>> @@ -0,0 +1,579 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Nuvoton MA35D1 QSPI controller driver
>> + *
>> + * Copyright (c) 2026 Nuvoton Technology Corp.
>> + * Author: Chi-Wen Weng <cwweng@nuvoton.com>
>> + */
> Please make the entire comment a C++ one so things look more
> intentional.
>
>> +static void nuvoton_qspi_set_cs(struct spi_device *spi, bool enable)
>> +{
>> +	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
>> +	unsigned int cs = spi_get_chipselect(spi, 0);
>> +	u32 mask;
>> +	u32 val;
>> +
>> +	if (cs == 0)
>> +		mask = NUVOTON_QSPI_SSCTL_SS0_MASK;
>> +	else
>> +		mask = NUVOTON_QSPI_SSCTL_SS1_MASK;
>> +
>> +	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_SSCTL_OFFSET);
>> +
>> +	/* SPI core passes enable=true when CS is asserted (typically active-low) */
>> +	if (enable)
>> +		val |= mask;
>> +	else
>> +		val &= ~mask;
>> +
>> +	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_SSCTL_OFFSET);
>> +}
> Note that the core deals with SPI_CS_HIGH, the driver doesn't need to...
>
>> +static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
>> +				    const struct spi_mem_op *op)
>> +{
>> +	struct spi_device *spi = mem->spi;
>> +	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
>> +	u8 addr[4];
>> +	int ret;
>> +	int i;
>> +
>> +	ret = nuvoton_qspi_setup_transfer(spi, NULL);
>> +	if (ret)
>> +		return ret;
> This uses spi->max_speed_hz but spi_mem configures p->max_freq which you
> should use (it might be lower).
>
>> +
>> +	nuvoton_qspi_set_cs(spi, true);
> ...except where you're calling in directly at which point the driver
> needs to figure this out.
