Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED754A2630
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752626; cv=none; b=P0H1vVpjdMVY4gd+c3w92A1reHX8Kj6pzAe0XpzMTfvrNi3TcHFX0+9bhg2HUHyVxWpRgaZuTMNtGxcHQuhFUxXbFtEaGvoAPjEIhLgU9ZXfYrPi5FeCqQJd8xgM3KF5anwG7jif96Xu67RUd1wVoODbT/MGhMKH45zMsF5Ku8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752626; c=relaxed/simple;
	bh=Cm2NMQCx89UMDVtgN8FqczOwNiBlbCdE5NyxRoG5AiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXsZrxl4eAea8SiRsX4NEF+fTlVzBOANYMZ8PQV9PCf82K3HO443BwIbFDk0rNzBQFl3N00WBybIVpcjJhZVF/JC7B0W4j5ARGxtNaMrt6qYw7U9RcGBMSRdjhg90ZbyVKWuD7NA/LLsEw+wiM/bV7E0SgmSzhqalJrA4IfissA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFOWlQK7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFOWlQK7"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fdc579daso11437265ad.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789752620; x=1790357420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCaqfjYXY7u/ZFZD8Iz49PhiKKj9ZbiaFOLNIBWhhNc=;
        b=NFOWlQK7vBkjNjwnyeHcXQxDpKntE45isQMurUu+tHXSnFTWbhUin5mS7MlsDCx5NM
         97Xfhk+LpofgqW6H7NUR2vA0rnhjv07Qf6wP2dqRajCnKFdc+E7bh1k1vWqfWCI/Jwco
         nnz6Q20M34AP6pe7gGAqTBUmC5/i2sIebxQtE0BtPTWpY8MaLuFfb35/a/rh/MO/WGmt
         AmtUvA7+7iLT0zQWCnQbiu8LhxnVNez5xxxGuKbVoDTfoKfmHpi68DBkOWvNqWaQOPd/
         FiwitUZiAyqWC7iHgx+RFOWttPUZxHqClz1mE+NL2ezd2ng0lGsIQwf6UBuksYe2QfA+
         /KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752620; x=1790357420;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCaqfjYXY7u/ZFZD8Iz49PhiKKj9ZbiaFOLNIBWhhNc=;
        b=xbTHX6ShNy3vrJLG1hCS7nL0VMhCwgtxKOpszowB/DuXg4zr9J69tUi6uBodL2d4Lx
         ah+ijGHYpj2ATOmOYpbY/oJ5pw44U99gLgXevU8gLNgB4N7hCOWsXWUaixHaAxdG3mgB
         UmD47djKjnmSFNBxIzQTcbcEKXa85AX6J+abOmngYO57h34P3oTGBlhi0G7Hx3gqp19c
         e/8DfPS60y0JIA0tjhGlVZ1tLdpfH8I0jej1UjcV+ogdmkJD3dnSbENwcXY4ci8J9vX0
         A7KVmOWnOLUA8JaiBS6wXEwCvcgvxTEC9LreaAXegsvfvjC2HiVEIyIGYazryCwv5bFY
         I7TA==
X-Forwarded-Encrypted: i=1; AKwUvBzxnfrpRLoD2ptLNflv3C4iWochBNW2sA56oXkjWqFbdhhxghI7fwt3PU00NLvoyOcpFXeN2HwMPceP@vger.kernel.org
X-Gm-Message-State: AFuF++l5SMXbrju5NvXbCg+iFML13rPZR2/XZvrOZxBBqEJ7HOKMVcI9
	QQ8rWaxyLpLjNMfYTWo0eXnuYDGiy80O/hzjvVLJgJ+HIXvmyPGX8cra
X-Gm-Gg: AYBFou0452P5bQN3gZqJq7Ieoqom7ntkTAvOYhXS/j4Y1Zki8aEjZSZx8k76HV0FtoY
	Nzq0VaaM2oBF/roGME/SwiSra/xOVFhlylzRDgGX9GXDZOxsQQ/sjhYYf6I8MuzobQe+CcgXg2P
	La83Crm4+hLUNB+r0+cSHIxpvWDabQCNp7stm6NUn/IVkGR6qDcKSDInxUKJHn2+DP1FaCAAYJx
	i7bkOndOZCHzBwWnj6EH82HU7yBKRzW7oo8KKBFprQOO2g8b7cNO1O07ZGjkT5NVd+TkQY9hgZ4
	XDMKP3iXJP0YkCNBdDLh6SCHLU4D8qOoLAj0PB5DCOmpdrEyWeDby6wtOGicnuyx+MlZfrK+3q8
	aRG/wYqdZImeSLjabGCreoiuBNYhxs4NRKBSEM59E1qhbngAwODkT5ZN751oRTIRjWVd256YFI3
	+9qqk+1tUQRdUHscGsWJahfHfrHbVykGgQ0Q2/Eww6eXk4396JO0VkiW2DIBe7Yvett0XE1TzM8
	y+LjS/4bJfVYdpLaqZDdQZePtNclxtDWTM/KGn2xVPAwMAh
X-Received: by 2002:a17:902:ebcb:b0:2dd:c054:1981 with SMTP id d9443c01a7336-2ddc0541cd8mr9489675ad.38.1789752620130;
        Fri, 18 Sep 2026 10:30:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17c4d58sm183265ad.58.2026.09.18.10.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:30:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3a107337-8e2c-45b2-8847-6b4fb7b0405e@roeck-us.net>
Date: Fri, 18 Sep 2026 10:30:16 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
To: Conor <mail@conchuod.ie>, Colin Huang <u8813345@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, colin.huang2@amd.com, linux-doc@vger.kernel.org
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>
 <dbd0a721-898b-4524-a0cd-c9751fd4bd68@roeck-us.net>
 <2646A11E-8D13-4587-8027-1370E0007F36@conchuod.ie>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2646A11E-8D13-4587-8027-1370E0007F36@conchuod.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 10:24, Conor wrote:
> 
> 
> On 18 September 2026 17:02:38 GMT+02:00, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 9/18/26 03:23, Colin Huang wrote:
>>> Add a PMBus driver for Infineon TDA38740 and TDA38725
>>> single-voltage synchronous buck regulators.
>>>
>>> Signed-off-by: Colin Huang <u8813345@gmail.com>
>>
>> For my reference (waiting for DT patch approval):
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> I'm on holiday and only have my phone, and cannot find the binding patch to reply to.
> I found it on lore and it looks okay.
> 

Hi Conor,

it was copied to "Conor Dooley <conor+dt@kernel.org>". Is that the wrong address ?

Thanks,
Guenter

