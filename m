Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395293630B5
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775751687; cv=none; b=OIGYuuKKtcP+6e3FgDDzpr2nLmc0Dlf99JX14bC53NjeR2v0WzcAL+3iMtNCy/Kfvj+x1eXl1q9yaO4M/R/RZZEhnKIf8XuyqL6F2Ye2vKTJtWHAf4iq6BIbjVDuWqKeA+sLNGxAV2mrh+2H+o920H9UCxyT7vOEqzXcPyUVcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775751687; c=relaxed/simple;
	bh=KgYrTRAzAqR2qcRtqco8ayHZnGZegHdK68JQOVgPks4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DUf0infVfxju1eQ0IkpYptk8iX7zZtXf+BD5gBGRLHH59nDgRouRKlNmWsp9Wl1i8uOF70g6Iteeu25qJS97RlclppJjnCRUz4DG5jAXZtbVJFSXer6M+TC0Um+Yp5iNdjw7woIy15dE+PiDv4Ph+mOgVfc4hTvaD+ZM1i5TBpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8hiZUcx; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8hiZUcx"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82cef263bedso573982b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775751684; x=1776356484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPPDJR3OP9YsqgLCzmnEwDF9nzYo3p95aTxV4oH2T4E=;
        b=W8hiZUcxJ/KaIlX6ErNliEMRV3RnAr2nJc/zC4z4FBL5z5oi5laJj3+OjtPZ2XFKqB
         PUnuZ+jBzCZTrsz5hQcqCFfdSdRJzULV5aFvMHDq10fz5Ef7X9My7aqhFujM2wZwXOG4
         QPxsXuh/ZI/AbkFUHV8jjv8w1qmrjGCrwPLHc9CoUlkVCgYi5ojnYmfTUXtmq9P9KRMZ
         /vM/LJOvTf1fWwh19OKnO0tUPrgABNFn90dYE6mT0x2lUNfuvRKUOXOy0oE6CSMDoGYM
         olqIYUBb8xvpK9tn+yt6UnGs0dJJhkk0RO9qsgyqFlSJ/0aSKq/p8uqPVWDOzUPpP3ci
         sW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775751684; x=1776356484;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPPDJR3OP9YsqgLCzmnEwDF9nzYo3p95aTxV4oH2T4E=;
        b=ro0Jq3if+rfHsSRTMWWsPqxTemyffN+ZjEJlrUEfFr+9EVXIFGVDEcb8cZ2ANDq1Ko
         3uhhkQk7NmAiJQmbkut+Qy/8w9FMzkgCgP259kUxSB/02xAOAFmUMtDQmGFY7qMyidJK
         7RLxm/XNIFhnA0vz/9Ujmmg5yZ6XNK6nnBsF46Q0BDHtjtdoSqUSWQlDRkuj0Hfx8klT
         fARzQqeqFZBbiQacbwjbq9DGcCVJjFawQekn7ZlCgW4ZnYy381NqNgKYgRYFYe8X8Zom
         pg3VUiAZQHKISHmaLr65GQgWYXDNMCiGrwflJTH2mCNZ7Dc8AW60u1LzLZUnF4xuVAt2
         02bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3CtyJVh6NaipnE0v5egohnNixp/Q6mj/1xDWwoXt7ohJ/5/VTyjBFeD3cI1fMXrWh0R55ozfhdxoo@vger.kernel.org
X-Gm-Message-State: AOJu0YxUOzC6291Ssctn2kb2o11WJtf2c680xktkAUh73LvN4S9s/G4v
	7Bve5KXD+Qv+LViAzxxU0k6wBgjUyjO97c41iXZrInOyI8fbrXWxPeNh
X-Gm-Gg: AeBDiet34KWuWtpGGZBUmVgeAmc6TfWW8IYmXUN8ar/84DyPH54mBPaxpjCMR2eResC
	E9GFn5oewqvBuzRGESZJ518kwXBGC7Ikcno0Kd4ZeLgNl6skXKhxb05BlwKHOfviT4ANhaRcHA8
	zlcaCiKN0sJDTP74blCD7bSEFdxpqzHMOuR56stRJERJDiaAouzooNdPt3I9TV5J1OPoQ12dyon
	yomHT/K7RzyI30cKzyht5TDSigimrdjHJTAasvhtyXSasMSvU2uyWSrvw9ohm3RFX6UhozscbDF
	6nfDwgMOZGubYXMRgLAaGRiA9m7kj9LeFECBiY3CLOAPUJfRZQcJqWfiIO4GFPtLoOdOIfVK7aO
	7lAQUTTreIqYCl0f1rtxepp4lq/CFLgyd6NYIuwb3OzuF3Cy5tKa/8+WVFVMMrUPmAI5Gg3WlXp
	JRTZHrONAOjd7a5JlMP9aOxUTm4fEH4n2LIjpWZSwDvHz2G3A8y69VwnkEhmKGDaMdcGbMS/Nye
	WRKJ4GPWMM=
X-Received: by 2002:a05:6a00:2d01:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-82dd8abaaeemr4410862b3a.41.1775751684017;
        Thu, 09 Apr 2026 09:21:24 -0700 (PDT)
Received: from ?IPV6:2401:4900:8f4f:f496:6d85:c852:1b90:58b8? ([2401:4900:8f4f:f496:6d85:c852:1b90:58b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbdfsm31162001b3a.53.2026.04.09.09.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 09:21:23 -0700 (PDT)
Message-ID: <968dafc5-ba00-459e-b31a-b46d1f0de347@gmail.com>
Date: Thu, 9 Apr 2026 21:51:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i2c: nxp,pca9564: convert to DT schema
From: Akhila YS <akhilayalmati@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-i2c-nxp-v1-1-8276ccbd95fb@gmail.com>
 <20260409-rampant-swinging-wolf-51ab4e@quoll>
 <7930789e-6930-45b9-997b-0e5c850db194@gmail.com>
Content-Language: en-US
In-Reply-To: <7930789e-6930-45b9-997b-0e5c850db194@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 09-04-2026 20:32, Akhila YS wrote:
> On 09-04-2026 13:56, Krzysztof Kozlowski wrote:
>> On Wed, Apr 08, 2026 at 08:23:31AM +0000, Akhila YS wrote:
>>> Convert NXP PCA PCA9564/PCA9665 I2C controller to YAML format.
>> DT schema, not YAML format. Look at your subject.
>
> Okay, i will change it.
>
>> ...
>>
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  reset-gpios:
>>> +    maxItems: 1
>>> +
>>> +  clock-frequency:
>>> +    default: 100000
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>> And if you tested any DTS with this, you would see this cannot work.
>> Look at other bindings - you miss ref to i2c-controller and
>> unevaluatedProps. But the problem is that you are doing something which
>> would never work, so I have doubts that you know what you are doing. One
>> thing is to make a mistake, other thing is to post something can never
>> work thus putting quite noticeable requirements on review.
>
> You are right, i missed referencing the common i2c controller schema and
> did not handle unevaluated properties correctly,which makes binding invalid.


There is no file named i2c-controller.yaml to take ref to this yaml. I
tried testing the yaml file with the dts in my local machine and its
working as expected.

I even checked the status in patchwork and there it was marked as
successful.

>
>> Please first learn how DTS and DT bindings work, before you post new
>> patches.
>
> Thank you for the review, i will work on it.
>
>> Best regards,
>> Krzysztof
>>
-- 
Best Regards,
Akhila.

