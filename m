Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F393AEF2A
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676020; cv=none; b=GZZ15b6KGy679r0SXLh37/OKBq9N/SJQV6w4Iajcaah+3BRW7/PwfMKJhWC/wHe1p+1XFDvKzKftO5fAMO5ox1yzNUyq2jKTv8xwHxoZcw/11YGq9nxOa8p6VN1tJZjAPLffwVZYwa2mJ1O6loLHVn9QNBN4kdDhezZMcUmxDs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676020; c=relaxed/simple;
	bh=EPp3+y8U+wDZQ2t1aRvjrkpD6kQKVPXuQaessSYJEI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yz+C/6t52xDCiCGYM5GQnBECKCfCZ1T0zrgUH+SwoHxHJTTfMZk9SnSeHgTmKeMDG0lD72nCMwHKeHb8HtKEXI5UQ7mogUsSvbKDivcLHSGJOHtSUmXIkZ2rHjSKni3zjZy5R6P2sSbb5WrK6Ce964qjpv82DMrEFULh49gjc60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnWLM3gZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnWLM3gZ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39676ff4674so45965081fa.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 23:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781676017; x=1782280817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cs8qvTgnQoJy3gVauu2STPsPcaY4YlG12CSyBpLnw6c=;
        b=mnWLM3gZtYgSJyNKkcRBKGJie8Kedc24tj2wZrcL9WedQl4NSDo621lrdduCydgdUf
         bLWA+jLhBU6esj3Afwuo52GS/FbjkgoYyAQNe/T7BsPXHlPTQN29+IhSeZgK0Xf/Z1Oh
         VAjN+61NVecQPz5Dllkhm1+CQSTVpT9sqXmyMJ9dBR2HKJHdAsDNHV0OCzjoKsnxZpXf
         GRDS7kMi5yH7QB8bm7zoeXzEVYHfGyt8FT0sfnKrCKcRJ3qSJxFJQX48rGiJZzSesV8K
         nJ3hWN2O9bE0UidR6v6FREPK+suDtH/S05lQ/al7/54i9woLhbAF8otArLhSK9mzsuXO
         BuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781676017; x=1782280817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cs8qvTgnQoJy3gVauu2STPsPcaY4YlG12CSyBpLnw6c=;
        b=RjeJI+7RAFyQMIf0h3YxicWsnp1Jl0nxjPlmHq93RVBeB2vnONwzk8JVu3AYktw84q
         LvjCFwaX8u1P0J6eXqiUP3vcHzHk7jG/TrfZM+FauvMtGTT4SeaMlGd2uYFKoQoZHeF8
         43hziTCnljiaYlsPh1N13tH1lCW6Hyhw0Kqb7Z6SkCmcphuxHBYkrxBJufI7LWfCVFKT
         n1IUe/vVAyYp8/DpWmRo+OZIxo4mOOS7y8BSKfX5IFJCbOAPMg7gW1++vdS3ERJexa2f
         wujxaVDooHdxzHIRfxPwFy8FZLYPGiprXpiWDZ11gYOOFUn8a1mMKzWrkx4VwEqfbIW8
         L9rg==
X-Forwarded-Encrypted: i=1; AFNElJ8kZdHuEsR6he4lbeHorDyDBVj0DXQZrTg1oxG4CEscq39qlUMUXJZSiexRfp7Dj5QcJ9i04tZVFCti@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0MrhcmZ15EMZSjkEsYa+9W/P3n+IDCvkVlhxbKfhk9DCHBvpE
	jxq93A/7N3km1CjL+WrYuUXc50arfxso5axGOjieSZKqrtRrU8OvKsj2
X-Gm-Gg: Acq92OHfhtpnGU10LnSnpBjXVPkN/ZoDQUH9y7AIpizsastqmlgyL3++Xypeu9B/Saa
	3oPAt9AwUSaQumA+fNJLQXvGVO+1M+FolzcGFeLLlxJd4yXwL6nYECdRuBPEvrYFfSr1gv4tYjw
	614TB+V46Ur5EgqIXE8ONwS0zOrOlYSuPTGnPdoLloUs73Q52C2OyCd6VB9tpwgnlhkR0O5lRQr
	m+fTt5jvlI5Z+DC024P9x/lDjrEUa6pJ6MwETYuKJa12PyQRJxRXcpZRdFQ7TTYAVHddSlL2fNB
	WX/qFtFaObVI9YQ1qwM2+L9quFp2X9ogKkVJdGnucXr0kMv4cK8hw/HJT4cZGHVlaDMLxvQxwgi
	8wW1JCKsrL8WIo9cPl5NPWMGk9ZeJlkUroA5+DoV+jBgX4EUHM5cQG0mipJQtJcdA/Va8mm+G+w
	lJddEl+gBEZslikxYUwTUzT0aN1b02vc6Q1YnNRF3G+BjTGjcYkkRg/m2kXswn+n9GDxOwAA==
X-Received: by 2002:a05:651c:2124:b0:38b:e464:f047 with SMTP id 38308e7fff4ca-39969ad94b1mr4694531fa.12.1781676015350;
        Tue, 16 Jun 2026 23:00:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c04d8b2sm12250531fa.2.2026.06.16.23.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 23:00:13 -0700 (PDT)
Message-ID: <f3562874-1c82-4ba3-b37d-dbb50bb54977@gmail.com>
Date: Wed, 17 Jun 2026 09:00:12 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] hwmon: adm1275: Support module auto-loading
To: Guenter Roeck <linux@roeck-us.net>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <634e76680ed93e58ebeb35db080138b791cb6c27.1781591132.git.mazziesaccount@gmail.com>
 <f080e20e-6ec7-4744-9794-0a92d03f48d8@roeck-us.net>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <f080e20e-6ec7-4744-9794-0a92d03f48d8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/06/2026 17:04, Guenter Roeck wrote:
> On 6/15/26 23:47, Matti Vaittinen wrote:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> Populating the spi_device_id -table is not enough to make the
>> driver module automatically load when device-tree node for the bd12780
>> is parsed at boot.
>>
>> Adding the of_device_id tables causes the driver module to be
>> automatically load at boot. Testing has been done with rather old Debian
>> system.
>>
>> When inspecting the generated module-aliases with the insmod, following
>> entries seem to be the difference:
>>
>> alias:          of:N*T*Crohm,bd12780C*
>> alias:          of:N*T*Crohm,bd12780
>>
>> I suspect these are required for the module loading to work.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>>
>> I did not add of_device_ids for other supported ICs as I can't verify it
>> doesn't cause side-effects. Please let me know if you think those IDs
>> should be added as well. I would be glad if I got more educated opinion
>> on adding the of-IDs :) (I can squash this to 3/7 and 6/7 in next
>> revision, and add own patch for adding of-IDs for other ICs if
>> required).
>>
> 
> I don't know what those side effects might be. I am much more concerned
> about side effects of having some of the devices in adm1275_of_match
> and some in adm1275_id. So, yes, please add a patch to provide
> adm1275_of_match for all chips supported by the driver.
It's nice to have an opinion on this as I was really unsure what is the 
right way forward. Thanks for all the help this far. I'll do that in v2.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
