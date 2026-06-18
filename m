Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D3D258EF9
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814414; cv=none; b=lfk66x8R3icl3Su+diC212SygAjdjqMieiVEf5mU5svmRTw4GW+rle7jK+10RemnApIr91+/dBn2eBZ4fmTFnmcdK7+1hlwLaX178z//BMKx3DfFSeTtKKspriWAo9NdKZVdWAWwN1zJThXkj6WKZkpL2+FN0HsroPFHHAMFy84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814414; c=relaxed/simple;
	bh=76r3kjz+9Z2QMvQAe7Brgp6OaaRZYG9+O1OD/q5LJyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIFO7VOqvqMifutRiprFdepPKiuIMcPR4nV6uulmgF5rLwJ9DEfUfzYMPLY5VidSu71JOTkJjdtu7tWuE87owwglbVNx+ALbe3T7yMc/Uo7opW+mHzPIvEsB3F+cXC/yDSJ0cJCEWOdjko3ropGfSnnxiwwo7Yv7vaujMZ9Ww0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToW8oEvA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToW8oEvA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37cae9b7536so859281a91.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781814412; x=1782419212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0TnOsVUyZhZEFtMn3lxQN/Z3qhDIQt2PMSD3OahT/M=;
        b=ToW8oEvAbSYaGQOck3E8JRJEWzxfPj+6xXdhsrT8tjmyDRkh6NYgO5Ql2pOqqNYRdm
         7BcNS1npsWCLJPhmmV4RH8zzKYOa6fnB5ih9vut8es0YL/89eszFt8Haq73I7W5WbHpY
         FQOJ6G5PzCpX+UnMvy/8aMeotjoJr0jRYUSANViKP6+qDBHaVauvNViXud237ybYzzyk
         Vn++kMlDaqFNJZiEjVEvkt4tWxqdS0i/93Al7le8Lh4FJ6gAqOaE4PqK62S4mVxGMEv8
         B3CUILg5p6RXzz91vyyYkqEXrNPEbPCL2UA+8u1YxZbiEz4ArZuWI+sTq4U6G+BU91JR
         M30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781814412; x=1782419212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0TnOsVUyZhZEFtMn3lxQN/Z3qhDIQt2PMSD3OahT/M=;
        b=JsUHVVCGRnj0CTKOroh6avYDFmjr/clouU4lRgyfr6I6a/HOxi7forK3eXGAeYtkaa
         6UrJfd5TQF9mo9uAhMaj5+NGi/rVx4u628l8LAkmVRFwomW9KvCdMJfKjReN5u9I6QD3
         IDfgeja1zv8pTs+zFoAFJsQkxjSs2bpEOsW9rUzZH9+kmh848jIdQPkpNZwsXiu+JWM3
         tmI97b0pmHAZmXGiKRumMW8Z3KmdpWyfSl1J9wIBATv/SBVaQ+EUzRFb4zrWdP2UhW6X
         XzKFULesrWBHD4txQa28/FPr0LuOsuSvTc6L2Oqz8rJVXqQ4pBevltacQHYRD8erkH22
         f85w==
X-Forwarded-Encrypted: i=1; AFNElJ9VL/ApztHvnMu5hFO6KD95cwmDfNwIhO9kNT4sAMdiHesAON23hXagbtvvWML5vk6Q3mUqlx87dHCn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ct9asU0Gn+xyZOz18d/d32sl75eMtTpB7amdzrY9KIoEk7Tz
	YtffowMybx2WzqFKdaqoqtJQn17h3mKHY0z3wWNwc2K0yJ9N8mNAYAc=
X-Gm-Gg: AfdE7cm3svZb5FfhXR4kr80KHULeb7Hzk0h1ZcTSW5bj4fDZybl2LBbKHe9pG6DJmqR
	YLt6B1TydnlQQV/D+TxuUm1vmreeNMUGP1uZNwWSfoiFj9R+eDmDh8EeJ2SnUWqthaXDfBovtnx
	HSc+NJH9gOq3t01y9lflVFVSxt5ma//Stk9DlEH/4cloGalsFmsQnoekxQfCwEbYIidMfObRRQ/
	LriX+Z6RY3t0rwsqQiaB30qTWphl+wl1RQ1y/v3FH1khARGV+mlb7fLS9C8d/qtfs1n+Ih5LgsU
	ZScaISRSC2J3w6vBpWOw64fFMLZeKb8IahZjnrhozjQkEf+BH2fwsdlZfvOR4hRvz+FAAHwbvmc
	IpA8+CoAtJTwltIU8905yI9QP48Y7XbzevXVK7dxS3FRDccfIVL4IAvaI4h9isNnycR/cKB9/+P
	wsOTfndWR5PpTfIBEOGc31LNR86Iw2jLwz4rkzJr1IOhtUjhbJGD03l2VLFA==
X-Received: by 2002:a17:90a:d610:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-37d13cc9b69mr1245175a91.0.1781814412328;
        Thu, 18 Jun 2026 13:26:52 -0700 (PDT)
Received: from [192.168.1.45] ([101.0.62.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d153601e3sm573269a91.1.2026.06.18.13.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 13:26:51 -0700 (PDT)
Message-ID: <9ef6ef71-e2a0-416f-8b49-b8b446f76b78@gmail.com>
Date: Fri, 19 Jun 2026 01:56:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] iio: magnetometer: add support for Melexis
 MLX90393
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618160141.11409-1-nikhilgtr@gmail.com>
 <ajQ_9uHMcTY2Hnmx@ashevche-desk.local>
Content-Language: en-US
From: Nikhil Gautam <nikhilgtr@gmail.com>
In-Reply-To: <ajQ_9uHMcTY2Hnmx@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 19-06-2026 12:29 am, Andy Shevchenko wrote:
> On Thu, Jun 18, 2026 at 09:31:39PM +0530, Nikhil Gautam wrote:
>> Hi,
>>
>> This series adds initial Industrial I/O subsystem support for the
>> Melexis MLX90393 3-axis magnetometer and temperature sensor.
>>
>> The MLX90393 supports both I2C and SPI interfaces. This series
>> implements support for the I2C interface while keeping the driver
>> structure transport-independent to simplify future SPI support.
>>
>> Currently supported features:
>>
>> * Raw magnetic field measurements for X/Y/Z axes
>> * Raw temperature measurements
>> * Configurable gain/scale selection
>> * Configurable oversampling ratio
>> * Direct mode operation through the IIO subsystem
>> * I2C interface support
>>
>> The driver has been tested on Raspberry Pi 5 hardware using an
>> MLX90393 sensor connected over I2C. Magnetic field and temperature
>> measurements were verified through the IIO sysfs interface.
> This doesn't answer to two important questions:
> - why do we need a brand new driver?
>    Can't one of the existing be updated to cover this HW?
>
> - where to find the datasheet? Any Links or other means to get it?

Hi Andy,

I looked at the existing magnetometer drivers in the IIO subsystem,
but none support the MLX90393 or a sufficiently similar register map and 
command protocol.
The MLX90393 uses its own command-based interface and device-specific 
configuration and conversion logic,
so extending an existing driver would require substantial changes with 
little code reuse.
Therefore, I chose to implement it as a separate driver.

The datasheet is publicly available from Melexis:
Link: 
https://media.melexis.com/-/media/files/documents/datasheets/mlx90393-datasheet-melexis.pdf

I'll include the datasheet link and clarify the rationale for introducing
a new driver in the cover letter of the next revision.

Thanks,
Nikhil

