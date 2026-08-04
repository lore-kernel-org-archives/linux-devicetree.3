Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDBD46D083
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853024; cv=none; b=UbzIAEgTIAHbUvcUFiZYdRLH/2tSkd8yZwkOK/Dj6iXKQfPv4rN+OQPDzg1fYWXfHc3fyTKXv1/VHI8QVhHQNB0FvH5HQPpKuADTqRdGAyl79eGg3ID6AO8ubsSWyhHsPa6jnR8tK7QdNPynkqSoNuhqkuxHxATfgBuGO5vCFqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853024; c=relaxed/simple;
	bh=CF4JQYiT6iPab8GS3Ok3zSKpq1ydxi01BblBMZFc7Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQuoY0vsvZRopXpqk+M3O85N7fHCnB9M3y59aQ8skk8gn/VcFsgqoSqdav4kXmHHcVVR+xzACXWoj81twdPn4L+3ZLKxltyXVh86ftVgmdb+2XHIQCFFSZ7/nhBVu52uqoNsFLGkifRQgRzQ2A6JUeSi9irH2U+PfG4AQdhyVoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMG/JKhv; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMG/JKhv"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3618649a91.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785853014; x=1786457814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAwaOU6zpTEosTow2YJoyoo65T4Qo1mttVUneF6unqI=;
        b=tMG/JKhvAlwOXy0kPp6CAQ2DWdUDMmvJdH1h0JJBJOcu2tZCIXJhwdTXlnI2jIvpjC
         20WvZ2qCq87RRKChqaHad8XQjayXowILCgFxFCbDyfZSQYPZKol8Itr48lerROso11pv
         xwuUiFfl49hgLGXiz1ZSwnjtw6JzH3AqJzlujejow70miIaR7DtLFDjLJ5vvWSB5kbca
         Hc7jnnvPANYmk6sCBJCN02URNq4P1neAwrRBdX8wlvEK+DO9So8JXRdOvXXdj+KY/Lxa
         v9TIcXM67F+SLRc2r9A8/AgXnVE5lzUsYlmdahh+ZXH/Cy4hvOTujLJOTEcPK453l7xb
         DtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853014; x=1786457814;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QAwaOU6zpTEosTow2YJoyoo65T4Qo1mttVUneF6unqI=;
        b=FzOIHVLcRfAmkBIP7mHh64hUSyOOLd5lDGdNQqHNvEUJ8uExbCCcUm0JBk/uBZHivl
         iopvidwxEdstURYNknDsPg2Ir+9lVZzqeP7sU6EKqDcbZ/8xCELW/abXG1rGWBrt9Fgd
         SVoH2bs9ZlqUeNg9v79rri/PtVOeukxdTrvmNixXmHqlhIJfX0GFeAgMphh+tKPLlV9o
         OtsL0IHC/h4NvrIisTichNhJhPxEsOeLJ7Nv18lrqdsvDE9jRJJqKsBve4aTIXtWq6Pv
         G46RD5l6cxtS2F4MiqLyJ+w2dmMhVqRpCowz0em+D1o9sTeEJBLNlpovuce5lJg/BYQi
         tz1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrP3aSZ8ZX2QRzvdo112i8+77wDmiRPPWd+l5Tdoa9oW5wTCjQTYfHjG8tJHkw/PBa1dTUU40JkiJqH@vger.kernel.org
X-Gm-Message-State: AOJu0YwFufFXawHM7gUviYwZT/n7dX65LVxIGMbd8oxxFrIUtl60OQA+
	x6vx0y1AEkyljp3U4dillzb1/R7AFfKZVbdpYmwooAhrg/6dTpIkxZ5S
X-Gm-Gg: AR+sD12C/VEfUzwbiX+LyUHmWPDfgGueVn2YOOSqg4u3mw0dc/J8qzQxIbquUElanme
	GHaO9T0MlIuRxbVsUGXrPnZMc+0be8RrzA0Wdckb1wA4XrBH/X2p3bfHlWnNQ5UYjy6B/iWgquZ
	1FaZwrJg23c3FuiaEtxHM890ycBe6DRvlntKqjZljG6eGfepiiotVfTvUAr67zyR85SNwYo4SRU
	xkFa+QCLkEX2vV1nOuzHIb6GwIGASR7Ptfv2sfPu8AFj25BDix3wrVOhj+FDDE60tL3YwhoBhtZ
	DlzVdnOj+Vut1DnFhjPzvRUutmko/44I2i3yiO6W3bFxMGR8eLTX62QHUkutm0fsHtaRmUqVAcy
	4RgIepuAwxoiUUI55QzfUjFf1Nh3M82LeX/IjWlD8icxzeEJFMA6XWIhhfXmzmvvj/NN7F+sv9w
	BND1/vUcs3ufzY7YVrkOAaW30z7pcR5AKKkUYpQyguwhddxx8JMv3B8PMwyEd+Aq/4Boc4Cy79h
	cqfs0/wVsp+PRnsl+AUSD3Q0J5YhPt/zKEL094ZBM3kEeaN
X-Received: by 2002:a17:90b:58a3:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-38fefed5911mr2268839a91.4.1785853014260;
        Tue, 04 Aug 2026 07:16:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158678ec37sm5144048eec.23.2026.08.04.07.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 07:16:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58dfd8a9-1502-46d7-a32e-d7b9b9c1ce81@roeck-us.net>
Date: Tue, 4 Aug 2026 07:16:51 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <20260728162749.A42051F000E9@smtp.kernel.org>
 <e8ba1c8a-cf68-421e-9974-f31f31e90e59@roeck-us.net> <anGrNyrEX5GX9lYJ@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <anGrNyrEX5GX9lYJ@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/4/26 02:05, Nuno Sá wrote:
> On Tue, Jul 28, 2026 at 11:13:26AM -0700, Guenter Roeck wrote:
>> On 7/28/26 09:27, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>
>>> New issues:
>>> - [High] Stack buffer overflow in `pmbus_debugfs_block_read` due to unbounded return value from custom `read_block_data` callback.
>>>
>>> Pre-existing issues:
>>> - [High] TOCTOU data race on PMBus hardware page selection during probe.
>>> --
>>>
>>> --- Patch [3]: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data() ---
>>> commit c4bd4d03203a9fd14a7a2bcff69ec842b441fa68
>>> Author: Nuno Sá <nuno.sa@analog.com>
>>>
>>> hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()
>>>
>>> This commit introduces a mapping function to pmbus_read_block_data() in
>>> preparation for adding support to a device which needs to use its own
>>> read_block implementation.
>>>
>>>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>>> index 3d5586c67f840..d697939ec8921 100644
>>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>>> @@ -459,6 +459,9 @@ struct pmbus_driver_info {
>>>>    	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
>>>>    	int (*read_word_data)(struct i2c_client *client, int page, int phase,
>>>>    			      int reg);
>>>> +	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
>>>> +	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
>>>> +			       char *data_buf);
>>>
>>> [Severity: High]
>>> Does this API need a size limit parameter? The comment specifies the buffer
>>> size is 34, without providing a limit parameter to the callback, which might
>>> encourage callbacks to return values up to 34.
>>>
>>
>> The maximum amount of data returned must be 32 bytes, not 34. Callers define
>> a larger buffer size to be able to append, for example, '\n\0'. The function
>> itself, however, must not return more than 32 bytes of data, plus the data
>> length in the first byte.
> 
> Curious, do you want me to drop the comment or your reply is also about
> giving AI context so it does not come up again with the comment?
> 

Point was that the comment isn't accurate. The data buffer length must be at least
I2C_SMBUS_BLOCK_MAX, not I2C_SMBUS_BLOCK_MAX + 2, and the function must never return
more than I2C_SMBUS_BLOCK_MAX bytes of data (and the number of bytes as return value).

Having a comment is fine, only it must reflect the actual API.

Thanks,
Guenter

