Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2D3AC0D2
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276116; cv=none; b=bSyCGx6lu4Jcf3QDO86NdGn724VZxnPPdxBaEyGc2Qvo+Rvm2iOzljiDse6S0uL+3rR/dIcKblzWZm0ebIDn7OdP7TizXt7g+krAqWmbWmK9L+SuemOcEpOrbGC8elDiMfLIv99E8YgxA7TAbWwpym43WWHrnGIPnD0GzF2NWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276116; c=relaxed/simple;
	bh=1U6PHkR9BS4WG2lMS++ZS63W+ppbZ/HlAsr4XU19ZJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4aiD6pnIiNavFdwUpgxiTBLDh4YjL7kDwNKm2dfzySIIayxQgegQ4neqSvqmuONRItwu4D32X8aaSX/+MlIsHw4T+ugPqg0zOB+nxoMHEM89VRboR+XGp3nc3uSjF4rcMpX4H6dbZuo2BVbSfS7OsF439rN8gbDkOWo+IE5Cbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0arf258; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0arf258"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82748257f5fso3405246b3a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774276115; x=1774880915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLlSUPPiScSugo/U5fFVFPY6P9c0KJH20TgbcYeYPFA=;
        b=c0arf258rl9X4D4wZbLTbKBJw3w4kStVoen9ijmZE2rGUZwcF2KpYAJ9DjV2tDvAB7
         xp0ULheoGWQnzEOUEEjehmoaw3s7VKJH7k1QYRGxZSZHCf1ZrXDvlyGH0g92i1E9MtKB
         QVEnmZaeAJUFAnJy1K7MxHhXDRywpkxjj7FaXNs5PIDTNpDxqMs6xKSLWFzohww32pRA
         Z+GHgguix2/X74mHqVy/NELQuqDGFgR978+NrfkyOzFg8aai5B7DNvYPvLUz1AHRAtKt
         nIaHxK5TNhExw78Uoqb5nwHk9MQ4jP5iliOeNtXZtcOy2rtMT1cyGfCAwm+W2Fy8FllQ
         qIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276115; x=1774880915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLlSUPPiScSugo/U5fFVFPY6P9c0KJH20TgbcYeYPFA=;
        b=UzNVzbz0cplUSCYilbgudRXND76RrHiKvjbRpHCmlQny42t4fZ0sfyZoykhenDM8IG
         EF4dwoYuIpuKldxLZ+p/t9m+LVq4JCGKnlQOs4RzZ+9lOTXF3Dho7UYurZSdWHASYBbr
         PD9nh9GbQA5+v3R5gYOf5kxR8kmp/F2l/TXRACfUoD5gyMN3RCfGxg7EAx/0UfFLEdmw
         0Lo9Bv0D4+pZYU12I5P+unjHhPCrHjFN03RFPQNlwNZLlI1WmJJGrWFKmFHV2o4GPsQp
         4N6M37D6xexJra/OoWnR0RBTaXgomWaxpb8AOlXS0cJL/kDun/+3XduVBtE+977lGFpY
         QyLg==
X-Forwarded-Encrypted: i=1; AJvYcCWA2MfA7TtMIXwUe0V8mfbn2QbCCfMoraqpboPu/G1sG0PyaNQvAB7hCKD2dEqeOXC1sA+LxbmHqGOs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8I/pEztCTdYd10bnCOQhomtauOwX3HYY1zQmHLB4+rNMKMk8B
	rB0RRfuXcS7MxJT+3+XuZKP6M2nR3S081V95CWqvu5CzqomlfgK8Xd3f
X-Gm-Gg: ATEYQzzNhihrIlVlw23Cb2/bQjL2tUei18dxu2rekWqKL1adJpC+7aC2g8laJc4Vq/k
	YzqcnaQQnN28p8Bj/U4sX3ITwOQRtZyNpejsbg+sc53O66IKgqL9r7kq3eB3PdMcLFDN+G8MaQH
	2Wz8tQ4OXcVqF80zehgnBHNZW9sN1miEdz2YzCEDhM4Wy4NWgZqnIyAjQdfZzCT3aKVyiRmb4MX
	iNZuxAHO7WWwzOloR7LGJlIQQZ6XFt6ZxlOnPHX7NpilxNF+IOyNQgbaqzTnfqrJXP8h9Fb3dzT
	hP36J9j256TpQJG65mE6/btkmpmsc1cheYlcRmpuDtz8Pvv3WRw7fvTUI5v06sVW/OcCtfVacuP
	986EqpFVHicUr850AlGw/epFJrmBhfHVEcJ02/TLzwmyaukQgoGMcfV/4Brz28VExAa8VPQ+2Sk
	WORFMBSykGPIJK29vW0zQtakTpJPn2NBQ=
X-Received: by 2002:a05:6a21:888c:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-39bbc119fcemr10927527637.13.1774276115017;
        Mon, 23 Mar 2026 07:28:35 -0700 (PDT)
Received: from [192.168.0.106] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c763ef3a0aasm5548588a12.10.2026.03.23.07.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:28:34 -0700 (PDT)
Message-ID: <f4ec860a-275f-4b60-b0ee-92b1d8725e3d@gmail.com>
Date: Mon, 23 Mar 2026 19:58:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: dt-bindings: mailbox: Convert to DT-SCHEMA
To: Rob Herring <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260322-mailbox-v1-1-c6251f18187c@gmail.com>
 <CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1gjj8XkPRA@mail.gmail.com>
Content-Language: en-US
From: Atharv Dubey <atharvd440@gmail.com>
In-Reply-To: <CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1gjj8XkPRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof & Rob,

Thanks for the review. I agree with krzysztof on this, it just serves as 
a generic guideline for the

mailbox controller. Dropping this would make sense.

Regards,
Atharv

  On 3/23/26 19:05, Rob Herring wrote:
> On Sat, Mar 21, 2026 at 4:20 PM Atharv Dubey <atharvd440@gmail.com> wrote:
>> Convert the Generic Mailbox Controller and Client
>> binding from text format to DT schema format.
>>
>> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
>> ---
>>   .../devicetree/bindings/mailbox/mailbox.txt        | 60 -----------------
>>   .../devicetree/bindings/mailbox/mailbox.yaml       | 78 ++++++++++++++++++++++
>>   2 files changed, 78 insertions(+), 60 deletions(-)
> This already exists within dtschema with other core schemas. Probably
> some of the description is missing, but moving those requires
> re-licensing permission from the original authors.
>
> Rob
