Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673700;
	b=aPpsPfzkwAD1+IhvdQT8+QxlqtwmHKU8rIYf/RIAOSdRvRB3wPxTiRDsnCiMUHCi9ljN
	 ZCE0lVtkpsPRV/odM7ABI8hnA3PSPrfh1XQFRm7YEhvta/ADT7l6MTVPoPN386cvDsNX9
	 Hpoyvc/cF0X+8ddO6YegP3OzGn/WHJ0NBrsouf89ge5LAamYlOgf5aSsZHXeXHJo7y+uI
	 xz5VxDcOa5528ZpQeehGOHrCJQOhMs4f8LtB1+cR5e9Uc6uCtL2z72Se4xjjsUcMv7tMb
	 E1V48vTEVXyA8yCC9shlQIsiOneHYBljZTZ9PykNJl+vYojGhF+VisS99oD1gXtZ2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jYF7S1s7Ov9hCjAhKpbMqkQvqhCJSe4k6JebACUrQ0U=;
	b=Y6A3YBwKLHas65EiEwrjwNgd4iwsDOppzJJ2H+e/4mKb6PAMoOe3OfrSmbNWTWav7XWk
	 1YYXyn8bNyqGTlwEUpcStETPy3a2y3SS0kKsR1kVLdUPtVuQkgZbVPuVhxO7Xsbl1QBWP
	 QuqkfWYo79SxDlxtwkfaItCoim40sMOWQLJbCwOGNnf6bO4eAv62kXfnpF8T749mna3fu
	 pc/NqztnByIcw0Yrd8FZ9+FkYj1S9q68yraGZis4IxA6SskMmxg3SO0dQPer9c+dvKz+s
	 1N7bRPFJGwDnn+ece6DDemOzWmzWkIbtQvNVgUdeRY7eXlCU8KgvOidRgTatgSE4tYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Tf/UrPXS";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46D7606A31E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Tf/UrPXS
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3824275e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673698; x=1793278498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYF7S1s7Ov9hCjAhKpbMqkQvqhCJSe4k6JebACUrQ0U=;
        b=Tf/UrPXS6OMKvW6NT4sd1MVRCIhvkTZbkk2B3znuVBpcASONX6lht3nvJq94UwT9cp
         U1gdOal3613SHEmj2uMk/aymgbYEYU/YtNQASzO0343AxXAoKuM0vSBu0Xsc5RnXUHcU
         /mX0yZTImozVkLJ49VAm1wXxUCIYAHAbu54l7CtCPHdeXYFsIKuAO3E3hxL2lgh2AF57
         hqpO1MCoO49LUQy1LYqJ/MKZ/SlkdI8/P2ul9BdL6l6FF+RPw4SvxY9FGG3v8ABwJHZ3
         eM0W2VqBDwul+r7UiaASn6iGxOVU48cYXVgvfC1Six3ivjbvA2ShQPM/d9+dU6fAlmux
         5zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673698; x=1793278498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYF7S1s7Ov9hCjAhKpbMqkQvqhCJSe4k6JebACUrQ0U=;
        b=rRw8E0F8Q5eQtiptj69U1Copb41j2pS3Ket5s8aiykXDAMVkEcWspZQ0O9aQRlDiQY
         7Efzjxaqc/jghCwmbWlmCuca85FRFFQnNuSgNP+zLdFRmqIyZ+4JjBtDvDmO4u7iMD4W
         b/71ZJkAixiI2HALnopZagLNbTOZ/IpdSd7uAMYSmhoGy0odUalzHn9bj5aqobUS4PO1
         A3AXV7P6m/kddMeWOEZLaJRYlLqEdeX+AqmF1ApGSocf2xcY74XorZoGx9cRHMihqKTc
         GJcys1Iwp6lgP4cTv05X7q/Ipm4YiDOVl7ALGx7uEy0TKX6OmOb34BvN8MsatK4K6DI+
         hyrg==
X-Forwarded-Encrypted: i=1; AKwUvBxLJc32IfslKDtX58x6IvVKahXpaBlmVdxQcaO4nyzUXbAoh1HzWDtNRzgEkbcZjGivh6l9trUXl5Ky@vger.kernel.org
X-Gm-Message-State: AFq9FYKlm0o1kxVqH0ODaqE1JEL3OIovJbXDn0ZVEaH6mW1DN1YvCQ2w
	jSbIKjJEVsTWdCXl9fyIX1YO/W623pTcCDqJVBQgRf6PYWgJ+gObajA=
X-Gm-Gg: AYBFou0d+mE3cJ5svM3+QQwxlnhRCujseral5OJmgt9H19EbT5OCy2cPIz3iF5eXLpR
	ruGhDUBQW4KQr+bU3bEkv9YaSC4K9FFIAdRgB63XSmecPw6PTGJkY7jQ6rYbclKCJ3HYnxX4bnH
	ThmYAOtAmwbizE1+qfIpbPDNaLEu+77AlVv9EcV+4PR+MzsahMRKdUt+71izaDx0JH7JYAQ+Y2x
	e0Q0MDfMmG4vTveRiSeWEabLRSt2qJikB4jQ7jiErFR+TGG/ajl+2buRBP5Mmqtno8MeFIDVmQ4
	xkzQHNA9YSBvWr/+bKwVVITgXGZRiDGfwE63+n0Zr5W74Wb+4/uhAvk5o44uFSYgP9+VlhOLzBG
	9VJ39rCWjvl9aztHS8IoobA6qKdG4Lsc6Za+vnqPfXVVwCkVFy1i8o8+A+WUoT0HrPhG1rW1WRv
	Sc3RDufyj9F4NmXZlos1WBgbcfadvvgXvYYCj4ovbxjiY0jBQQiO0aCR4Q88pqfJz9F3+PkAjBl
	dQ+DTdneXQfxYYTq4xk+Zt0DpRNgvvd6LzFcLqrlUdl+7+yTieKmkZovAVpg4iOryQD9bwTZtUA
	6WmIJokrOTPo6XydL279OuQQOFSP1q4/paus
X-Received: by 2002:a05:600c:1c2a:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4a1fdd4fe80mr121774905e9.26.1792673697832;
        Thu, 22 Oct 2026 05:54:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a447c8sm68550055e9.12.2026.10.22.05.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:54:57 -0700 (PDT)
Message-ID: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Date: Thu, 22 Oct 2026 14:54:53 +0200
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
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>> context bank we need a separate node on the DTS.
>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>> unnecessary.
>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>> context banks.
>>>>>
>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
>>>>> provides no way of doing this.
>>>>>
>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>> and secure.
>>>>>
>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>> describe the same usecase - a set of SIDs which are used by the device
>>>> but which should not be a part of the defaut set. With it in place you
>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>> etc.
>>>>
>>>> I'd recommend following the same approach.
>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>> similar case:
>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>> Let me check internally.
> After a brief discussion: it can be either, depending on what suites
> better (and if you can persuade DMA / IOMMU maintainers to let one extra
> bus or not).
>
One thing sashiko is pointing out is that new dt should work with hold 
kernel so, in general moving sid1 from there would break it since old 
kernels don't know how to handle them separately.

Not sure how to address this.

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

