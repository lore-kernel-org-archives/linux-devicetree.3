Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5332228CF4A
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 00:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790901954; cv=none; b=k1nEILSmJrxUCm+sKuH/C+eQ4CWBvZ1q0Ve2LX0DvoJRM6GTIDuGFoahsmyxYiWgOeLHCgTm7tUqPkdZDQTgoRzGb7XAkiepZ090AO6Kz5Ma99qpaWaoYfVNW2DHrKiOXa0VWshX7Pl069k+Be/JPzwASEQ/lpA2+k7u/MCJnLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790901954; c=relaxed/simple;
	bh=/iwqoS+4JBREJtu0vFODIucYw38WpkRGJE5KP67yLnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnParPFarE2kr5xTSHEjucw3iB7vgmvLk7bb29vzAn73hV03hnl7Tsp4QHnChN0SYKMHpa3oJnNOW8uoJGXYgjxxWnm+XiW4UCzWvowCpfu/HHQ4ioup8E9tarDAYbo8Ku5DPP7a+LK//CLOiQr7LRcsUSd8yY2b9lgpLsOisEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxNvuI16; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxNvuI16"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso3058589a91.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 17:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790901953; x=1791506753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLMqQrPjrg6i/NUynUbUXMZpVXP2BcgIqLfTW2Lyeoc=;
        b=KxNvuI164HSy1cBTxI+AcxeJIVlVlY4zCursji+4DjRhStqe4cWKUJ+rSve3VtkVN+
         P3gZIuhBfI7JmCFfegDUsD1LSHoUzchTSWvQF0XgoQlnpmp4vARiR0E9jMfeXLWz9Uc6
         V7cKUG5SVJVWeG25SR1ao7qAj51pXoCMlj0nWoEl/QLkW5bMIoKx1cmkBWURSTvTrz2V
         z7QbI1sqeJoiRtidjj8ARYxkrqwErMfmfVgLNY6sBOe5MpBU4IhkqBXPbt6ZTZfytGEN
         c9YdJ/1pV/Vwg6gWm9N30sjKnnYeEwXeOSdDzevkQsjVSIrobyY3cs7/VBjzPwbePehF
         8xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790901953; x=1791506753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLMqQrPjrg6i/NUynUbUXMZpVXP2BcgIqLfTW2Lyeoc=;
        b=fpT+WHR6REUdt24ZpzBfYwRFaVBcJrrjelvK1lcrhBBv4UGAR4xZ6SC46IZ7m29YVl
         rUuOwfX/zZq/VQI/lIFWV1kkHpL/JTrL5rpyv/5xbkDD/FhihNpR5lWU8wx/ehOKY1TG
         CuJgKqzKsMvSka+YpAP3VNbejN8HsEsMkSfV15dJ9KTH9erNn31v4yQ+bW6iLSgrnQSI
         k2pFDlK9NNZOschLn/dnaoTpKH+0zg1OYIknJbYqMkZxITDkBqZZqZ90QhBCroJr/cnV
         ydJ3zy76lq9sAuCCODJ1+qz0r4yxD+AFLFgoxvWFXblAVkTH03ziGgYvFAl7Qhq8RPOY
         eN7A==
X-Forwarded-Encrypted: i=1; AKwUvBzvhyl7fBvqTppWYlwa4mInzFfkHsykaf133Lbq+xfIdU76P6+6SH1UAnMmfiRpH+ZSk71a4gWKYPkd@vger.kernel.org
X-Gm-Message-State: AFq9FYK8KmyPYBeCupVXGYf+TGSON1GwaST4660zgvj4wcX/XclXbVgW
	D6Ju106YLfQAd6RNrwBPSOExcwbJPNvor6udx1gheM4f06NOqG1RU9OT
X-Gm-Gg: AYBFou1+j/MHHV4rxZuSmNPwu/Usabid+oeW2mHZMCDmz8w+FkbeM3dJDE0iVEw19wE
	apdrDfraD8qUNAi7lleNZWA2jyPXPnSqECpBcCSq0q+Eabzr8wdszhYIW0teKWYcTOPwK0KYYDk
	H+r3mgkroXLejrlL6aRsR61WKuxj5Ps6Nu5eZqOamtERMbpjxjLT+4kVkSuyXTnlTHy8HLts/CM
	Sc6uL0rg8T71jiUWVuZioQSOTz9MIPtPg3nAkGaMUNM6pfuui0xBQpao1JEzE+LPmg39yipTenM
	0CxgtAH58qM+tTjtw2Ebb4HafqveyaLtbes462mbzy6AZYdXPuWx8N1Y48U/lNNs4KoDhcw7kNi
	BetJtszk2t46BnhKRbQ0ZjBQIftkYrt+AFh11l5XSxkpR+17Aaie2YjnFi/Eda7GPsMXAsUEcUt
	kzdXFoSUX0JRg1yvvafBlX2DwWyiXlL/PaHjA3JDIBH/XINtLIY9D2vCAE2qUsIdMQLnssyIszW
	59nJI5N4MU/faviuWqKw5FtgPuLcluwP6A8YVWJbsNlVnJ2Qg==
X-Received: by 2002:a17:90b:4a91:b0:39e:3554:4d0e with SMTP id 98e67ed59e1d1-3a6ce35748amr495330a91.1.1790901952575;
        Thu, 01 Oct 2026 17:45:52 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f471b16asm6642130a91.9.2026.10.01.17.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 17:45:52 -0700 (PDT)
Message-ID: <9987c7a0-efba-4f9d-a3fa-877cc9d189ed@gmail.com>
Date: Fri, 2 Oct 2026 08:45:50 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: ma35d1: Add Nuvoton MA35D1 SPI controller
 support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
 <20261001131818.110028-3-cwweng.linux@gmail.com>
 <20261001133705.7C5A71F000FF@smtp.kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261001133705.7C5A71F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/10/1 下午 09:37 寫道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] spi: ma35d1: probe fails on valid DT with num-cs > 2 when using GPIO CS
> --
> 
> commit 297501e7117bfad68b786ba4098b2489480c1405
> Author: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
> 
> This commit adds a new driver for the SPI controller found in the Nuvoton
> MA35D1 SoC. The driver supports SPI host mode using polling-based PIO
> transfers, standard SPI modes, and natively controls up to two chip selects.
> 
>> diff --git a/drivers/spi/spi-ma35d1.c b/drivers/spi/spi-ma35d1.c
>> new file mode 100644
>> index 0000000000000..7560cb7e0b099
>> --- /dev/null
>> +++ b/drivers/spi/spi-ma35d1.c
> [ ... ]
>> +static int nuvoton_spi_probe(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	ret = device_property_read_u32(dev, "num-cs", &num_cs);
>> +	if (ret && ret != -EINVAL)
>> +		return dev_err_probe(dev, ret, "failed to read num-cs\n");
>> +
>> +	if (!num_cs || num_cs > NUVOTON_SPI_MAX_NATIVE_CS)
>> +		return dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
>> +				     num_cs);
> 
> [Severity: Medium]
> Will this check inadvertently reject valid device tree configurations that use
> GPIO chip selects for additional devices?
> 
> The SPI core correctly supports expanding the total number of chip selects
> beyond the native hardware limit when using GPIO descriptors. Since this
> driver sets ctlr->use_gpio_descriptors to true, a device tree could specify a
> num-cs value greater than NUVOTON_SPI_MAX_NATIVE_CS (which is 2) in order to
> attach a 3rd or 4th SPI target using GPIOs.
> 
> Because nuvoton_spi_probe() checks the total num-cs read from the device
> tree directly against NUVOTON_SPI_MAX_NATIVE_CS and returns -EINVAL, could
> this artificially limit the bus to 2 devices overall and prevent GPIO chip
> select expansion?
> 
>> +
>> +	ctlr->num_chipselect = num_cs;
>> +	ctlr->max_native_cs = NUVOTON_SPI_MAX_NATIVE_CS;
>> +	ctlr->use_gpio_descriptors = true;
> [ ... ]
> 

Hi,

Thanks for the review.

I don't think this check prevents additional GPIO chip selects.

For the MA35D1 binding, `num-cs` is limited to the two native hardware
chip selects:

     num-cs:
       minimum: 1
       maximum: 2
       default: 2

Additional chip selects are described by entries in `cs-gpios`, rather
than by increasing `num-cs` beyond two.

Since the driver sets:

     ctlr->max_native_cs = NUVOTON_SPI_MAX_NATIVE_CS;
     ctlr->use_gpio_descriptors = true;

the SPI core handles the GPIO chip-select expansion in
`spi_get_gpio_descs()`. In particular, it updates `num_chipselect` using
the number of `cs-gpios` entries:

     ctlr->num_chipselect = max_t(int, nb, ctlr->num_chipselect);

For example, with two native chip selects and two additional GPIO chip
selects, `num-cs` remains 2 while `cs-gpios` contains four entries. The
SPI core then expands `ctlr->num_chipselect` to 4.

`max_native_cs` only limits chip-select indices which do not have a GPIO
descriptor, so the additional GPIO-backed chip selects are not rejected.

Therefore a DT with `num-cs > 2` is not valid for this controller
binding, while valid configurations using additional GPIO chip selects
continue to work through the SPI core.

Thanks,
Chi-Wen


