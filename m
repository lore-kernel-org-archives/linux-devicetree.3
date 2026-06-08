Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E49349CF8
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889686; cv=none; b=FKrYSipJtRsr5LMJinIEneHdI5SUBOSuxhch6FiKBFhF+/M8Hddt31H222hnZHB2LN2dz5Y0i4mhSW1hvOMisDAT7KDL9S/0OxAABbIxOJ0Pf1MnTuZ2qE2L2Tl5ea8DSLpaKsPVxqFx9xud2EKuZtL0ftnj+uN8PMQ5UDKnGy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889686; c=relaxed/simple;
	bh=rnWGZiGa7zATv6HKuoipsg7FGKMd4hpfpbk4TsMTr1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fK1GWNtpsEW1J5E6q2who6CC9oQ68/XOULUOSFql1aMOI0PvmL1PMoSwE1VkTsOaNQwaJvVxr8qekIIguCzkysynbsIa8RqN2/Qxie2homeJMHzdN4d5B6tQZvTt+i43JMazO4WGqXRVsI2o2ve9c3riGSEi+4Kc0+xysRP75j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1fI3lg3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1fI3lg3"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so2592731a91.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780889685; x=1781494485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jYU1XWOTZriAF8A1LNJVkKH7SxBNc/5+Xt7U3MwFkk0=;
        b=f1fI3lg3vtYp4/XbLPqYOS6/iiIez2LKA84iYWhvgfzHg28lEBohAx9SbExnyO17a9
         FwD077qywu5UvJg69qx6fIP9NrTzk/E6xmytp1jEFM/fFOhW8JGnJ9B1o+LnSOVCv/of
         0wKsyi9mWklf2lqeQbM1TwP3MvtiuQS/CpJP0/T3kgxoYRzPWV3sTgJfjimhq/N4mi9H
         OKxrVzt/8h1qYFF34RPh0QnFehKBRwyxITlwss+6LFXYQAP7QroTQBjDnQf9JGucGUMX
         K2OMb+MktAZmMRyV3uihjGno08ZgAiZiolOZHmf/6xO/4+nDYiy++3LLY5RpXEpbGSXP
         7OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889685; x=1781494485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYU1XWOTZriAF8A1LNJVkKH7SxBNc/5+Xt7U3MwFkk0=;
        b=X2s220tXqRUd8h2CaakSDBU+LZFq4WeV/J4fwG/XQUkJZ49Dy+Gnvc5fdez8P1xrCh
         D1NNkNV5EH6GLeZ/3H407egFk6sNHZdIisyYmtWPyE/06jmz8z3omC4h56VrUFYRUhRJ
         +KtzaO512HrJcrFv75RInlSPzEaDdIiad5J3MQ3a4rEPdVEwzMV/YJzqL0W/BPSctCck
         F75ifDu99fqxyKdOldk7cCkLpbVP3fZJALDRhoNSf39BGOK1kAlV31FLE0+hcp9r/kyg
         xdDZ9Aw94Glrj0aog0JGyy5fO3xGaKvG34oQRtFn9+hdtdF0xnDFFpU9XrpwSLpJv2aU
         CDuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pBlqa+6KuyLYsgg//7gyBJPAG7WuI2tA1LGlQT5odgkJi9VdyoJZqRV8HmNqZaWtgsVCyAx9/q522@vger.kernel.org
X-Gm-Message-State: AOJu0Yw19JfbhEI/k4U8Qcf5rWMqCJaJviCp5k1GIhf4ytqXOTd9FTPu
	nxU2Lw+oOaZl0DbvEk4DhijLozHUj+ardcnWJgwFzqu3sqO+/hpB213C
X-Gm-Gg: Acq92OHovuEerboDN8/ySjNrNAyPCEEB6QHka2DDrimvnmFDXh70sLoiurFwLQ7w6fm
	/pgrT6k6LJgUziX9uZa5MUzr4OqXpXSvINkr25rFnrx57Ti8QWd+h5F1fa1ULOMoZs5Unmreux5
	epi3mJz+l+9QjMv4VxGnLre9uL1I1972s1cpKtxsS4545s9Za/bnbp7+jbcYQUtkdUmEqblunfF
	CW239H8D5HCy3z7oTSDr/FXpIIQ00PVYdxbGpqJyPlLC173GAhMctilc3cFbVkEMpJgKZ7SkSsG
	GkAFE/Dg8sSRk0ylDaXZ42C+ecAT5tJMKGBBrhrZsWOND9E+oXb/lb86+CBFZ1T1n1ldLG3GRNh
	OZrEHeZlCK1gWUDYhnyjf6XvQYX1/21xsjlhj5FqYerr7tj4r9iNmEF/BTcjDw4Innn7cQm6NhH
	j1j13WhZeV2Ql3/0vJTISVx5FwwH0Y9hKov0200XBEQr2AcsesUVs//GUyeF7VT9uSygg0gxo+f
	7rtwjt/12g=
X-Received: by 2002:a17:90b:2b86:b0:36a:8519:a4e9 with SMTP id 98e67ed59e1d1-37133569a9bmr10439285a91.18.1780889684637;
        Sun, 07 Jun 2026 20:34:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d240sm171798535ad.58.2026.06.07.20.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 20:34:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <23ed51ae-cc91-46c3-b5bb-250f0655d850@roeck-us.net>
Date: Sun, 7 Jun 2026 20:34:43 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: Add documentation for SQ24860
To: sashiko-reviews@lists.linux.dev, Ziming Zhu <zmzhu0630@163.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260605063042.91776-4-zmzhu0630@163.com>
 <20260605063612.B760B1F00893@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260605063612.B760B1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/26 23:36, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The 'Hardware Monitoring Kernel Drivers' index list in `Documentation/hwmon/index.rst` is maintained in alphabetical order. The commit incorrectly inserts `sq24860` between `sparx5-temp` and `spd5118`. Alphabetically, 'sq' comes after 'sp', so `sq24860` should be placed after `spd5118` and before `stpddc60`.
> --
> 
> commit 65caf89dcee60b08d75fdadfaa3541e74096b753
> Author: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> hwmon: Add documentation for SQ24860
> 
> This commit documents the supported sysfs attributes for the Silergy SQ24860
> PMBus hwmon driver.
> 
>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>> index 8b655e5d6b68b..1888905cd2349 100644
>> --- a/Documentation/hwmon/index.rst
>> +++ b/Documentation/hwmon/index.rst
>> @@ -242,6 +242,7 @@ Hardware Monitoring Kernel Drivers
>>      smsc47m192
>>      smsc47m1
>>      sparx5-temp
>> +   sq24860
>>      spd5118
> 
> [Severity: Low]
> This isn't a bug, but the Hardware Monitoring Kernel Drivers index list is
> typically maintained in alphabetical order.
> 
> Since sq comes after sp, should sq24860 be placed after spd5118 and before
> stpddc60 to maintain this sorting?
> 

Very much so.

Guenter

>>      stpddc60
>>      surface_fan
> 
> [ ... ]
> 

