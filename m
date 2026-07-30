Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5F839891F
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384770; cv=none; b=ROx6wyFTudCLvZdYLGzRVAz/mVKncPO0QX2mV6daVv/I9kmhN790lfYe4kJVzaXyYZqJ+cQ+LA4a/gubq0i3HNgdKiqffM0a3hy8bUNWXj6Fpn4FiU079is4VxTYYThaiuY8ASc++vrzReCdZPpUTmMDEWSWgyqqeSgtoskG2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384770; c=relaxed/simple;
	bh=S05elIAgEDFPxffm6US5XwDiLG3j89Gks0C3PBMYf1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2n2qS11XdDGKgTBGDApGiQNJEjFYRzXpZDRVlb6YmYfKhbGTGx9WzIEe5gTX28amTUT+SF+achmefvhfDSUjYuOJOG0GYz4Yzw6asnQm9YcJWBi5ZA6iyF1llIpFVVblWSA6BVy+z4ReiTVSG/Jujk49OjUEDcXqjGrctqB4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0qntW6B; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0qntW6B"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so1886644b3a.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785384768; x=1785989568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrUKv4UtSvyZWLjf9iBBjhJjTZlyrezq04V3SN/NPFU=;
        b=o0qntW6BNYiSyjwZNjsKF+aysHYaa2EAPe6zaIbcHUBiJjeSyVRfVMDHY+eB8nHa2/
         n4DZ9bin74xD9ky1y0i60kqOtvaEZz/d90j7KmzWtIQx41y9STKRv43BuFg08mdtq7Nu
         ZxnUAbT0BAKd46/zH8cLxbotDi3aWPQUUD2l7UQiZp4fjntC8/7I4frpMmB8A4Lde6WE
         +/nBV3xiWYPKhPIC20DnjaCzWREg1e6TVDZtJjJsPx/jBNwh8DuVsZmRcwDNcxiN75TI
         K45Fp5+L+uzXrDNKxWMxToYy+D0NMuTtisuRDggRs6qBmAljM/NPpnZmOM6JQzmRNasf
         Bk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785384768; x=1785989568;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yrUKv4UtSvyZWLjf9iBBjhJjTZlyrezq04V3SN/NPFU=;
        b=YretKUMw6orQpU8U4CcS6qMhWZ7sjPPkEYU0UciPcS1CQYztvOcm+YrfgsUHutHXG9
         du4++z7xcFAKzOXYVfednENqfezC0NxWJK6zzRN77Yoz9o5zzLIay2ydK7Zcece9xs/3
         hkCSW5DQgLUnDv81t/FbQFFzK9krwTXIEGMA8AjAfrzPxNypdvQfWOJkovv9hD5rHxGK
         0DD5Vsb7t+hP2w8eSIxZ5PRjV8DHqfXYKbHiQtTU3UhrTOdbgRsARFLPeVePOcemB4Cs
         H01U4gIFQeE/tW6qCAKs3oKt/hhMNw7wZrjpFkJSpD1SmpOsqo+qivC1ELEPsHgw2bPh
         gXOw==
X-Forwarded-Encrypted: i=1; AHgh+RpFJnw+EOXu56K6/WzeakVPvxAjO/7OESa0wa80fySOu6ABV/wFzLEKAfbQVQF8oFVKBPeKzmcUgvJe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzns/xsHnCEZp1Z+v8yfW/0YWZ8nRebHEnDckMpEDEPsDr1FB36
	ljqEaOPObMHMdieLPtnYtMVSISdHfQKkUp1xlcyj4A0Fuh58mSg2JQmJ
X-Gm-Gg: AR+sD11B7pq0hg8i0eOnZdbtfMrYQ6jvFz18xbRN1Eq7s5jPVJkyRZ4cQe1QEcAWprF
	lTkqqYRT8IMqGMO3sZHJ6V3YYVatXl3pwAt3lxXw7/FAfWB1KqEFCsvn0rXqgNV/oU6OF5718kn
	GUYKDAKK4VltWX/16VjrVJdf3tXCpINNrWYZ8BYVus1RNoupeV5OJbtm+FkuLbhKB4CNDRnXeBF
	6B0742oXBWbA+i+ltrN+0bzxYY03+h3YUhi3KE902+xfKU5wAL7T/mvP2Eh/BjnYttCaZKu5/y7
	KHRioCIFgcAzIMOuHf8xcfQdc6mHOj1ll7p9SRemLkJ8ZzjcPAivspwmTWYfeIomvm1Bo3zDbML
	WckcPPOKTP9ECOqB3S4eTXJTJxYWrllOqgs9EZqalG76Tr+3Vjhsv7CcsWsPiQHYVlQBbzAUUH4
	egrK55ZF1V9de5Va35o1BK0wPtKFcnIBRGwTPPUsC8Z55hGo+IujHQAeiHRjZfJZv5VGMVxhutK
	/ClD0tdqlsW83aIm/azagRTG56ZVEfBkF4kv0eswlTY50w2
X-Received: by 2002:a05:6a00:909a:b0:848:6c1c:17c0 with SMTP id d2e1a72fcca58-84ebc213480mr1074576b3a.19.1785384768343;
        Wed, 29 Jul 2026 21:12:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0378b18sm2219894b3a.48.2026.07.29.21.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:12:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <53527fab-620d-49c1-a65a-5253a9b65011@roeck-us.net>
Date: Wed, 29 Jul 2026 21:12:46 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] hwmon: pmbus: add MPQ8646 driver
To: sashiko-reviews@lists.linux.dev, Vincent Jardin <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-3-98848151cdb4@free.fr>
 <20260729220547.C24321F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729220547.C24321F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 15:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing named initializers in `struct i2c_device_id` array.
> --
> 
> --- Patch [3]: [PATCH v6 3/4] hwmon: pmbus: add MPQ8646 driver ---
> commit 63fabec4213f8ada1bf01d09967620e66fc9f459
> Author: Vincent Jardin <vjardin@free.fr>
> 
> hwmon: pmbus: add MPQ8646 driver
> 
> This commit adds a new driver for the MPS MPQ8646 PMBus device. It provides
> basic PMBus telemetry, alarm acknowledgement, STATUS_WORD extended bit
> decoding, NVM-backed post-mortem data, and an in-driver alarm-poll fallback.
> 
>> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
>> new file mode 100644
>> index 0000000000000..1fd41d89e5bef
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/mpq8646.c
> [ ... ]
>> +static const struct i2c_device_id mpq8646_id[] = {
>> +	{ "mpq8646", 0 },
>> +	{ },
>> +};
> 
> [Severity: Low]
> This isn't a bug, but should this array use named initializers? The I2C
> subsystem guidelines specify that initialized arrays of type struct
> i2c_device_id must use named initializers, such as:
> 	{ .name = "mpq8646", .driver_data = 0 },
> 

Yes, this needs to be a named initializer.

Thanks,
Guenter

