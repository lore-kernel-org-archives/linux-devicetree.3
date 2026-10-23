Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720014;
	b=R154+4F5Za59xUbuWhOUSMUZ6yy5WLR7MaW61X09itDAV9sn5ycDHlAWYqwoldIKTmwO
	 5d74KKjGYuqnIifBJ1b7zTsyi7fjTWloYWim6VBI+94MASbhZxHszZ32ED8L1LmhPO3qm
	 y3VZj6anAl3ZvI7cneurwjAbBINCOnwyTSi0iOuaw0YUYHe9d3PzXkVOGlonl5V1eh7Gv
	 mR21mSlOJ/fI+NH7q8ntydXaP4a27Uy73hU4FttMj/tRV/5xRZEM6rPCO0chrbwANiqmx
	 jO545o4xel9SkaD49ts0VthLwQg/a98xjJL7TWklvxogj3UdWPZb47I5zDaiTGzomXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=49tlLsKwv8QYIzXZv81VYW9pKqhefGCVYLctFPyDUlk=;
	b=yvX+7QN7t4dGHruxdzYV9xGIo6BGd80QpGQ5jB6/xp/pReRGGikjojHZ0+IXF0LKiiKU
	 RGhwcPwVeaZQU1VngyJMr7CJNGT9la2ASjI5xFXWeQ11sMAjhYsm5+GTT91kb+3XiQ75H
	 zC9VitTi4l/Vks3D695ghadR1XujPTO8gtD3FXXGYgiVU7ZQipKUwz9c4jd4PCsrZ63S/
	 ykBlBIaWwJrRycWbnleR2SYU9VpDSb07lTJDv3XDRY01+LlOCaOVBTDQKvhmsOARiEUZm
	 waqr9ArmBFEVRUuAzktGiMXS/+vOOe5NE9b3BO0Lm/6U9Ydf+HxnxO6TTttSeIxhiQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TDy8QTqI;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E3C606A324
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E3C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TDy8QTqI
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so66080a91.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 18:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720013; x=1793324813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49tlLsKwv8QYIzXZv81VYW9pKqhefGCVYLctFPyDUlk=;
        b=TDy8QTqIZyxIxlPqzVjPm23SgAoxQeqdw3XErXd4mBhhfi08NQwRjtgYCntxvCYudo
         46F7x98zOzMLawz2grCqSfrbiJzDBtz/EO+A2iAi/24+RPLgFMlkPx8Pppr5GWu5V6mx
         Y2xSX4sapqQ000/6CrMR/zZHemYuw7jCpNVlIRRDVME9Zeq6iV3DopVbl2acFNKPvvh9
         4sqvO5tg+MeBcMZlsAYaU7XqZYRY8lp8/Z8z5KI77P4cPVDhqNhMFRKiBFQqs00UgMTk
         pQrOoxWUeTqR8uCy3Kz2zf3GeXHNbWIDF/5QR2NIFz4WS/LHIs5qDVhUwxPImY1nypP8
         IlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720013; x=1793324813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49tlLsKwv8QYIzXZv81VYW9pKqhefGCVYLctFPyDUlk=;
        b=nic4jfC1w2i3dczbdt+2urYnqm+250LKoYRNTBZVzm+XE2gZGWJg7rDi2UIBXt37du
         l+NWggPhzgWjVFub+fHB9EgzQxfFTfwxd3xzaaYBcGsLg/9AqIVUK1rLbBAMmJ54eGAB
         rUBzpEnO4Qt7FJInVa4XF5tPrDKkKEmD0IE1TGnKqqDl9EpUtPEE4T1wOXgOm4eXp7cZ
         anMVOWrtl4aupDWv6AtxBi3+ONBKpNWmCCgsWc6d/y8uyYL44qBILQdoY7ErsUZm6Axa
         uW9q1hDPfuiXtHEiZZ4G6ga33cqDxqW5+eRINF1efaU6YOc3mCSLK4inyTUAl/hj4AOM
         Ytig==
X-Forwarded-Encrypted: i=1; AKwUvBwL4Tu/DduEmo5fAuJYa2ktZeglo9dWbFI3d+nOSnUeJ/AQMYj7v8h2uv8pXJhlqqvbxSjFcfNVrCH/@vger.kernel.org
X-Gm-Message-State: AFq9FYJP7skWTX7Vr3VyKrO8jXCqFhxKVfyi6UtSKp/iuWpcJpYYuAGv
	PyHFG8AVmTAHjsPn2F3LKGqcK6m7asHBV4UumdaaBovBXBLK2OUCygAy
X-Gm-Gg: AYBFou0+lNYWZh2wbfMX6n6BcOgOKV+pSXFCirgEgjmO7ilxYBlO8uaU11IfqhqUpi+
	K4J2NE7E+MR6xLvzt5KkBy8ANSOHx71y9e2VC5lP18B7I2QXRbK70Y7DPS/1DVDfkBJE3zUv8at
	bqJvmp1jkzYpGOWhX6hoYIAMD3JdVr0gGJeVk5D2xvPcpgT/KAMoKZdgBZtPxw+5FbrAZlO7x7c
	VoZ4kp+94nctybHtQ9La0i0eCeO2F/Brq8ufVOpjf8JI1lukc/H2aso9eT6ML4YWCct9nOLBluP
	/clFf76WQaPLo75OtEZZTQYLX5bXhj2eaiKnbHrhYpDUbUWFbZ/qs9TO3IeqLMmb7nLZN7dxoNK
	D7Bn6cD58hOV7mv21lqz2rvo0V7UyDXdCQjDCn5ftBhYP0JB5RrKG3lOu8ifu7EEzskrrxZaMys
	36peNj9WHjHr7jeMwTmCGToTKotSlp/GIpGLHhm3INcrs68KWylR/rN7bTogOZdqPnbxFP3Bggw
	6GSvJ5wZB0nQP2yJ8V4ZXb/zXajPDR5ayInjic0F3OO2CIujRLniEODoCzC9hQ=
X-Received: by 2002:a17:90b:52c7:b0:3ad:85fd:711c with SMTP id 98e67ed59e1d1-3adce03c81emr663240a91.28.1792720013195;
        Thu, 22 Oct 2026 18:46:53 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1d84fasm1155510a91.12.2026.10.22.18.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:46:52 -0700 (PDT)
Message-ID: <809fddf5-c4aa-4a78-acbe-c9c39da2d363@gmail.com>
Date: Fri, 23 Oct 2026 09:46:35 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] of: reserved_mem: use dynamically allocated
 reserved_mem array
To: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <CGME20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c@eucas1p2.samsung.com>
 <20261015082315.56876-1-m.szyprowski@samsung.com>
 <20261021134138.GC3667411-robh@kernel.org>
 <e42637d0-c800-48fe-b943-4ec6ac540d82@samsung.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <e42637d0-c800-48fe-b943-4ec6ac540d82@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/22/26 17:59, Marek Szyprowski wrote:
> On 21.10.2026 15:41, Rob Herring wrote:
>> On Thu, Oct 15, 2026 at 10:23:10AM +0200, Marek Szyprowski wrote:
>>> Mike Rapoport suggested [1] how to properly use dynamically allocated
>>> arrays during early boot.
>>>
>>> Use this approach for reserved_mem array during early scan of the
>>> reserved regions. Having all the reserved regions in a single array
>>> removes the need of the two pass initialization introduced by commit
>>> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
>>> regions are processed"), so implement it to make the code simpler,
>>> easier to understand and ready for adding proper error checking.
>>>
>>> Tested on ARM32, ARM64 and RiscV64 based boards. Arch specific issues
>>> with early mappings were discovered by LLM.
>>>
>>> [1] https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
>>>
>>>
>>> Best regards
>>> Marek Szyprowski, PhD
>>> Samsung R&D Institute Poland
>>>
>>>
>>> Changelog:
>>>
>>> v3:
>>> - allocate the reserved_mem array only after all static regions are
>>>   reserved or marked as no-map, so it cannot be placed inside any of
>>>   them
>>> - record failures of the early static reservations and print a single
>>>   message asking to fix the device-tree
>>> - restore conditional compilation of the early mapping code, because
>>>   some architectures lack support for it (C-SKY & Sparc64 as reported
>>>   by kbuild robot)
>>> - allocate the array bottom-up, to avoid allocating from highmem, what
>>>   might be an issue on Xtensa, C-SKY and MIPS32
>>> - don't use the early mapping on PPC64, where the scan is done before
>>>   early_ioremap_setup()
>>>
>>> v2: https://lore.kernel.org/all/20261008152403.766439-1-m.szyprowski@samsung.com/
>>> - removed superfluous ifdefs
>>>
>>> v1: https://lore.kernel.org/all/20261008094125.3197971-1-m.szyprowski@samsung.com/
>>> - initial version
>>>
>>>
>>> Patch summary:
>>>
>>> Marek Szyprowski (2):
>>>   of: reserved_mem: group allocation helpers together
>>>   of: reserved_mem: allocate and map the reserved_mem array early
>> Can you confirm the sashiko issues are not issues?
> 
> 
> I've replied sashiko review. That are again the preexisting issues initially
> targeted by Wandun's patchset:
> 
> https://lore.kernel.org/all/20260920092852.614973-1-chenwandun1@gmail.com/

Hi Marek, Rob,

Since this restructuring and my series touch the same code paths, my
plan is to rebase my series on top of this series once it lands, and
send a v4 then. Is that OK?


Best regards,
Wandun

> 
> 
>> I'll apply this after rc1. Are you willing to be added as reviewer or 
>> maintainer for this code? I'd prefer not to have another entry just for 
>> the reserved mem code, so you'd have to filter out the rest of the DT 
>> code (not the bindings and dts firehose) which isn't too much.
> 
> Okay, I can try to take a look at the drivers/of related code as reviewer.
> I will filter it out to reserved_mem related changes locally.
> 
> 
> Best regards

