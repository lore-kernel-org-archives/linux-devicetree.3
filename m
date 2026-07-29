Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990FC4734CC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785324089; cv=none; b=g4vAAqFY2jhh6s59w/a7SF1WwArDUIenvZ6yEFwRw3atMk54tFAVxkroBsJbGMH7+pjC9V9SZ5PiD8owRjrFgQvWW/scyt8qj1AOvJuRl2PRHNq3iIEAJ6JDt+KOvKCwwRJu/mjVbmhpfGlWFQKu85Gf24YQtrDUxZebD+DCjzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785324089; c=relaxed/simple;
	bh=Hp2+IfUwP2mHvBcaRk8gZZ18t+cUXx5TnKgSvTXq7LQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3pXE8UBbMUmn2//9eGZHPAWAn3JTk2PjXRuYpV32+k23qOmg+3uK0vTEbcsfb8RRV3lRMi9U3MHXCiNyH0eR8XN1uf7aHYavZr6Wm/bEF69wh6DtY449c+BZLFFuot3nUy8LaGpP4U3+QFRmMMvm6wcDDyYx1W4BSTAf31Tl6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=E98ISPU5; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="E98ISPU5"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 177B03F82D
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1785324078;
	bh=uHQjuj6Xcqi1BVE9uzz71sr2eQbfCmUCgJ90Wi9b1Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=E98ISPU5CSfVeI8s7wy1wqjXwbRuGiW6VLQpr+KjBq21yMf9fC61O57EA+lJmBoEx
	 ad/gkX+3FPW4YyOf4EaLG0JoZp0nSoSiekcjm7/dklVPLiXEmZecs+5WOhnwmCSm6x
	 Wg/K5bCsOTnBS2OUvzgXuPrbIgOfp0mOtTnE1bZUoLsfFBZJV2QXRI+G7VvkxcKfIO
	 0Vk6kOeJclfNGK9pjuxUgFm0MBKVLsfXpUnnI7SMH5hCRpZ5zGu69SttACwUU3YC9k
	 llmZdfZPppgZBPsXYKomYNq6aiCkYVkDDSHn7N5J7Yz5hr210mRwaAlHxZy3TfW5Oy
	 YRsRNKhj8B3owVOmCwvcIQhWzJMNhsGwlrRv6ZPm/26eJQNWY0CnKSW8N96LCM5Aqd
	 KZ4U20bn4CLP/NI3PYbs1vgKhMIt3z9H72NRg59678rZJ4hkpMhd0P4F9Hy+o5c8cT
	 KVUk0wsN5lNxXlHuSlcW+430qPnOtXyMWnlgd43nT1x2COYejKYziWBcY1+oCTkazk
	 iNO2lCXC1JO/rTCynfnODSBvYq8W8WY1Ol/TDQGTI/VtyR8QDh0Ov556CNWltXgOTi
	 kNa01suMdCrCehHRClnukt1fF2BOCY7O5xBEQsbNqObNYmIBP4bJWY4T+WlmBstOa7
	 Je8A72Pct0MgR2Kl4jzzYBB0=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4954c2d4081so6186265e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785324077; x=1785928877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHQjuj6Xcqi1BVE9uzz71sr2eQbfCmUCgJ90Wi9b1Bk=;
        b=j7AGY7a+QWHrv2lQpG2Jy1BnkVRQK+yFy7h9B1XUmDfO9SgLBoQjHdvYT9gvP48SRk
         4YmqtbZZum68CJEdQFO6acKZHZIJf5y/udzD/n2fbryWUUYjVTwZON1SzcWRKlr8M4TH
         NGBgou3JsViMT126Jr76AdgUf5d3qREyInJIFdW2ZpymqoofCHXKA1qO+Mx/BprLsA8h
         bp1LooOQKxUAehEga3T+IOab4zJphNIRZJhq52v1+5M9lZ5S1HfjUO1aX0o4r1LfgQ/8
         QAf5MbEQVRYEzB+51jhQ6DtVAQ4yM9rievXGqyKSAmEDhqXdbAFS/Fv0swOVf8doyjdK
         2CcA==
X-Forwarded-Encrypted: i=1; AHgh+RqB3hTEwsyTH+VVw+iEHHqC0T9tMSBWBsez6FeysJURDn0kckvVIMB5MVCwdpAfXpM5FHuiacmwEK5W@vger.kernel.org
X-Gm-Message-State: AOJu0YzOtCHbvOWXh+lD5nkVSad3t5anWgueov/1Y9A8IksPH3gCuRF7
	T0FDxBt5YxUVkF4/mq/ejF44ySX1OVKBlSNSzRGWjHySJZbS8M7M3muXOfUu3jrJ6sJKXoDCARy
	wX3y+z/w24mZgajlyRnxyG/akUyR9e92Ldd+9v6F+J0ZOF7zQT0504QifOcnRLxqjrhrW4Oboah
	zQW3E=
X-Gm-Gg: AR+sD12jv5209K230xGx68L2KjTA/Sr83Z+uu/la1Mfr7mPGyQpUveXyezl3pCwHVOK
	gD6V5w/KOhlafxjrneQFsoldpk+WIdE9LVLRFtBPcOD6+jGF5w0wC6fyBtfS+gMFD9cQ0P3PEkF
	WJF6ixwBaU3xTfahX7JSinq4SIztPyMlQQh/jUV1sgVu2QP/CwKt3yalmf1Z7rGS4c0TVQya7eT
	hdDk5rqbbbFMR7/0MNwWusFmilcWrpB1rRBNjn7PLnB9O12LngK0qHtYU0RPT57kSv7Ip+whYnl
	ylEKNn6NgIjbqWOrRtBhUL00LmoCTAhHV5UVhpSt0dWgJ6G4+fITqPyOvBIpRnLfjtMaLyjI9s6
	gVNQL4irkGVsAxZiRiar2SiptnSPGy1kIWO2hpCbDR4YePRbEtfIe0r/b3TlK/LGgsALHYHpGSr
	Fqb54A9SrKA48rnAE9Phravw4=
X-Received: by 2002:a05:600c:19cb:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-496c60c111dmr63691915e9.0.1785324077567;
        Wed, 29 Jul 2026 04:21:17 -0700 (PDT)
X-Received: by 2002:a05:600c:19cb:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-496c60c111dmr63691695e9.0.1785324077221;
        Wed, 29 Jul 2026 04:21:17 -0700 (PDT)
Received: from ?IPV6:2a02:3035:674:ff84:634a:fb9a:d64a:718e? ([2a02:3035:674:ff84:634a:fb9a:d64a:718e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496e905fa40sm43707215e9.2.2026.07.29.04.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:21:16 -0700 (PDT)
Message-ID: <bb94e760-c7c3-43be-a221-5a45f8ec2db2@canonical.com>
Date: Wed, 29 Jul 2026 13:21:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
To: Conor Dooley <mail@conchuod.ie>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 Ilya Sorochan <k0tran@altlinux.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, E Shattow <e@freeshell.de>
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
 <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 11:39, E Shattow wrote:
> 
> 
> On 7/28/26 11:02, Conor Dooley wrote:
>> From: Conor Dooley <mail@conchuod.ie>
>>
>> On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
>>> Add bootph-pre-ram to mmc1_pins clk-pins.
>>>
>>> U-Boot pruned their overrides recently in favor of Linux which broke booting
>>> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
>>> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-common overrides")
>>>
>>> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
>>>
>>> [...]
>>
>> Right, I am going to try this again. I don't think there's actually a
>> valid technical argument against it, since it just affects the stage at
>> which configuration is applied rather than configuration itself.
>> If the configuration is wrong, and more devices don't use this configuration
>> than do, people need to move the node to where they think should be. That
>> shall be done separately.
>>
>> I don't want to hear about the politics about whether or not Starfive want
>> to support it or reverse engineering of binaries etc. All that I care about
>> is discussion of the hardware itself and which boards need this and which do
>> not.
>>
>> Applied to riscv-dt-fixes, thanks!
>>
>> [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
>>        https://git.kernel.org/conor/c/42c57c049054
>>
>> Thanks,
>> Conor.
> 
> Second NAK to this being applied, again, do not apply as-is.
> 
> As you're not interested in the technical discussion, then you won't
> have one.
> 
> -E

As E does not offer any reason for their NAK, I guess it can be safely 
ignored as invalid.

Best regards

Heinrich


