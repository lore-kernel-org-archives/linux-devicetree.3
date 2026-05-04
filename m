Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DF7260D
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 03:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777866417; cv=none; b=JE4cpe3Oslb3/ABototCOBXrX4sMv6VmY6hOD9zqkMiiVhtidfoK26MMMiHnX6/elnfqrKgcXxWt6GSSEoeyH+/lMqJkbzR07fqMpprJwbw7qgVWC2eR5iTrdXYoGRxtLgX9wLWkw8RkowMME+geU/+VoNBXbaqlkYHZUtfW+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777866417; c=relaxed/simple;
	bh=pLxMJg1KifrfWXeCQTwVo0cJp/RvGgrYCglxjMrSxt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PThIDX7pb8RuXDazTnlUfqQOD/6kM16PQmbXDmYIMl9AMeU4LAjq5Veo6nRhYqUuk+3oj4DAZte82YloXofoHNmLdtXtu5texno55yy6m7CxOP9bNFLWLYdt8+HY+hPQ6vxiI3fdWy9dS5N/tW7K31by2EuYnX32bVsQF99bvRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=TEVENzP+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="TEVENzP+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8025500cc7so590439a12.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 20:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777866414; x=1778471214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pLxMJg1KifrfWXeCQTwVo0cJp/RvGgrYCglxjMrSxt8=;
        b=TEVENzP+6YgBO/a5qbvqk/n0zbw2726ri4eUTAx/KtmZkJsMYBg2lifcwwZGg5kF51
         x6fILCQmtFNbJrYkBmK/6z3ODk0CP83VqcvXqq1FkCwQfXC05/HGxow9EjZem49p+sai
         NGnhY3zI/263YrcXkUSJ2eLQXOVGDJKcU9SryylhfWKhHEEoYALB7IYb4JOg24PoB/Es
         RKMLmeLgXSb5u7TF23dH+76ECNCf0Pg+qey2bsRsBkhB4YJUbMbCyat/JINsNRHzzwzW
         500WiSHno3jDG/yr4XcEAXt3QuFQpaArfFs35MYNs8BL40z5zH6402x6TwYuO1yFoklK
         clzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777866414; x=1778471214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLxMJg1KifrfWXeCQTwVo0cJp/RvGgrYCglxjMrSxt8=;
        b=PjpJ+MdZhQja8GwpoU4dYwxYFxfBivMg6K0tl0LnMV4J7b1Ejn9Ky/GSBNLy0ezXiX
         5cTnXRIaEJMltKkqHPeWLhLFLd0bVCW0uqDdT7Dp9GTvJN3C3bGjWf4vyFv4Loxx+oWH
         xctqd0bn3Hm0JjOPfWTP2+UK4bQt0jNrDAXexa3/fdp5vU5Tzil2WxNSkT2CJkJdpDin
         KFCoUdWeAaKBtnkyvXj1AeGI4NinU2P3Ga9iW0326sfcT4DAp3MUuGjA8KPcIif23/T7
         h5PDP91R1a811FPTRq0N8HP/GrFP2rRRp0GAoskhuQNRALIN8ArXy9YZ6o3IBoXhMc8E
         DSGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2NkrEmucT9NNveWaZjZAkY47l3tT30lZv9EbLSSVUkWWZc0I4spCUHXJDFUqOIrai7xjpJ97rWvI1@vger.kernel.org
X-Gm-Message-State: AOJu0YwB70t1qmtcLJUjFe40amQViwqwymTaO0aZI4c/dbPvdZyPYzb9
	KYk91ttuk7QMmL++GSZMjkb3TSvDuokoqHzMF7b50zqZmdyYKjxBBP7wQLplGsH+JDVEMg+d5hN
	iudMpMOk=
X-Gm-Gg: AeBDieteSlWyLOyy3C25DDlDimsNY+EDW6ePWgrK4BAVDdg90XPNmCz+fr2ngJ0LFjN
	9G+xfRDNy9iEFAVefUP9J9cpdaLolYIwG6QupM7FovMXoD5eQTKGydRaoVzCoQWndXovaWPOBzh
	VWdOBu7n1lnLX1Xi20vV1jaKWEx5N233IA9dCz4MehUtEYzebQir/WgPMB5RruuAO/rkQ334ZXV
	sRCqcoXZ7Ks6B2UzxpKLMJ3EpT+gItX89IyT3QbX9hpkgaYcYlL4u8fgr/6bI0Fg6uoktejcbsB
	CTHz0yjvUn33086UG6kWWGr3PTBj/xgKfHlKELYBZhyZeR9dL4V5pABHlvwPmO05zjZzYn0aRf0
	lB2Gb3R+pvOGqSlENj3BkE7x/DX5AHH3v7qoXQAuFEPG6I4r22FmmjWw0ar+MaWsG8M1wEfTaz4
	wOcwTNoGm3f6GkShWT/sNXtY+nHoP6TKAl+WElGn4KAjJg6U+NFgF9ivfHPRYDon6TVEHQArYq2
	sUI
X-Received: by 2002:a05:6a21:33a2:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3a7f1fcd4f8mr9500799637.48.1777866414193;
        Sun, 03 May 2026 20:46:54 -0700 (PDT)
Received: from TAO-BU2-SWA-3 (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm10788953b3a.33.2026.05.03.20.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 20:46:53 -0700 (PDT)
Date: Mon, 4 May 2026 03:46:50 +0000
From: Brian Chiang <chiang.brian@inventec.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	Jack Cheng <Cheng.JackHY@inventec.com>
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Message-ID: <u5vkf7w4e5skmrwrey4hp4ub3pr7zufkus2d7vkidmvjyb3s4p@tx7eul5cgymz>
References: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com>
 <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-2-f1f83d2039f7@inventec.com>
 <mhguhlt5gi7sg7qsgetsizdslm2z4vdhlgag55bqjnq3a2kz24@iafh7hhezp4l>
 <f3b8d049-744c-42ab-a641-086bc1726b24@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <f3b8d049-744c-42ab-a641-086bc1726b24@roeck-us.net>

On Thu, Apr 30, 2026 at 07:01:22AM -0700, Guenter Roeck wrote:
>On 4/29/26 23:58, Brian Chiang wrote:
>>On Wed, Apr 29, 2026 at 11:29:37AM +0000, Brian Chiang wrote:
>>>From: Jack Cheng <cheng.jackhy@inventec.com>
>>>
>>>The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
>>>module from Delta Power Modules.
>>>
>>>The Q50SN12072, quarter brick, single output 12V. This product provides up
>>>to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
>>>efficiency up to 98.3%@54Vin.
>>>
>>>The Q54SN120A1, quarter brick, single output 12V. This product provides up
>>>to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
>>>efficiency up to 98.1%@54Vin.
>>>
>>>Add support for them to q54sj108a2 driver.
>>
>>Greetings, I received the feedback from Sashiko for this patch:
>>
>>```
>>This isn't a bug, but the commit message only mentions adding support for
>>the new modules. However, the patch also includes several other changes:
>>adding PMBus locking in the debugfs read/write paths, fixing the
>>WRITE_PROTECT restore logic, modifying the configuration for the existing
>>q54sj108a2 module, and refactoring the device identification logic.
>>Could the commit message be updated to describe these additional changes,
>>or should they be split into separate patches?
>>```
>>
>>I'm wondering if it is more appropriate to split only `fixing the WRITE_PROTECT restore logic` into separate patch? Since disabling WRITE_PROTECT was introduced in previous commit. And maybe keeping
>>other changes Sashiko mentioned in this patch and record them in the commit message?
>>
>>Please let me know if you have any suggestion, thanks.
>>
>
>Sorry, I seem to be missing something. I dont understand the logic above.
>What does fixing a bug have to do with how or when it was introduced ?
>
>The missing lock in debugfs functions is a pre-existing bug, isn't it ?
>All pre-existing bugs should be fixed first in separate patches so they
>can be backported.
>

Got it, I'll split them into standalone fix patches at the start of the
series.

>Please use guard(pmbus_lock)(client) instead of pmbus_lock_interruptible().
>

Sure, I'll do this in v8.

>Also, your patch does not apply anymore. Support for q54sn120a1 was already
>added in a separate patch. Please rebase your patches to v7.1-rc1.
>

Thank you for the notice, I'll rebase the patchset to lateset tag.


Thanks again for the review and suggestion and apologies for the delayed
response.

>Thanks,
>Guenter

Best Regards,
Brian
