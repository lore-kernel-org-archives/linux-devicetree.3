Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692348;
	b=mDTbeDhFgaga26j8Qx65zq0O7Cth2udk/RYrdJ8etPV2n1rYvn8EGKJkUL0U7anVvXln
	 KxlLMn+S3A1e9ZEdBXlveIXV1dmHsWFSgIYJYtNzLbjtN/ik0sqziSbPiAJRySp5pPVnx
	 exZHceAKzgAPzYk6Nk5xB5SIWw0BAJ43B2dvlN/ncLTAE3rvKBhflQvE1gwyrRiDesC35
	 Na/P2jVmylIISUa3R7LoSSHXaz0AroAmN7m3h9zfbWtJSitX0cPDzsFt20aVDqSJUFn+z
	 Wa6tsHbTxGrmemZ1oUMFWliXwKx/7BHZQsgJckBohkLBbJYXNwbTpvNRyK2OzDbRhBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
	b=Z9TqmUrw7fJOh3WfQWuyL3b7AYquEm+yn0kXILmj3nxg0hzwqF93s1MkoViV/lyqTRll
	 tvYsrrK1W+WSAb9qB8GAwcivHxdZE/tr3NWyVMOxsQ6FgKFMMEdKaWdoDvKVypirxFAnq
	 7g5F3RXpNQVB0FxYzY1wkwcuLJB2cBVceM1ZHIUbLoHi/317RJDsFQL/qNoo6ooK7fRRO
	 HFveKggOtQ58FZDIFJzcsQdBHEMll0ra/2Yg6Gi6f5bUx4vDJRR/2dCurlcXn5oV9BpVZ
	 TUaP3Cx5fGVFdHEPy/o/0F8v3Z/iHTOz1m/8vb21sIH2f0O2wpS2iQ2ZZ6wefwgQ/0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENiGG3gy;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA10606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 18:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA10606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENiGG3gy
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so681855e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792692341; x=1793297141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
        b=ENiGG3gyyAuVeWIKa4LSnuOTEfgIAnd+HliVCcVvSd97dGwI6+bb0LpYPHo6PkUhTh
         cXLAv7cMZKpMSaKp1xlOAHaQrEPRp+Qqcvvu9jMexARfKbIFjlgs7TPyJI6ptY4sRcJ7
         pnHKxke6wzEvPe0C+4sWoOS7fNm1Hz7UeYddytJeKWtdBlr1pXgF3JsLtc0Qbk71FO1A
         zNwpb+ECp6OuM+oqFq6mdi4sEC6XQ9NfaU+4A3Q5dKnFNQ/P7cxSZJ2On8cNhfa/UoE7
         PVqbFHyi73gJU57gv2Sb1YRRm5dqOLgZR11k9/R4jd4q+y4oM4XJqk+7Gz7ys1NviWvz
         a7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692341; x=1793297141;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JY/kgswJkw3rC1uB03Rt3fXoWelWaBya4FySXulL7N8=;
        b=SQlAb1mL0lXnEAO/Ow4sRE6U58Woe4ydZzQro6sWrA957nXVV0QORdLL8aKGZXLiDq
         dtOm0o2aOrRL8HzEbHjf2q78PgEhs22XdQDEiW/3Ju6dTFw+FNSIuvlAKs51d8hMjn2x
         dOLYGoS9tGVxUinT7pbwlp81dw2evyDO/ZmQBCDAB/pfAlveB1rnP7VQM2RotBaDUxTR
         VXlh3jiwkTShjUzRkdaZ/TqmaLD2qU8Ajq2sk/hFjROmNDmTHPSl2NahHLkQZjElEbbE
         xobVcbvymXZeLboPeBaUqxoGmohRtKCSYnwZPUypKMXpGb2TuHYyMfH75XRePZUWpE+W
         T7mg==
X-Forwarded-Encrypted: i=1; AKwUvBwH6ar9JLbbTrnLaPMOnGF1C6Jabx6gj6d2Huym5QLS1zKHFyNu5fH8TzcP2wd4voNseINDcQ+LEAZa@vger.kernel.org
X-Gm-Message-State: AFq9FYIRjTvHvhFqu+BBgBXnJ5v8GM9eIeYBbpqko/eec0pfm2i7aMbg
	9SFfhxlRhObJsUM18RpTj1CdizoyLYXgHKErpJobZIr9jUN+Xo7OMuE=
X-Gm-Gg: AYBFou3XUr5Q2Cu8PXG8kQ115R3BxNUhHE/kZWLzGWvNVFw90ixxBYgSjxp/R2rXCwF
	1LmWm8Z6wgRoTKNs1FWbZnBZW0vDRL4C7NipHXRXyHKHJAgfl+KNFSxIYh0cEf4GWx++fUmUQSj
	Fc7wlhiReem7Pw/8pROKKZLYBjn3BjDjpV8ilx5sO0EsSqgWy7HtxRL9hUQG/9nBleKOIK27FAI
	iDyUQmmOFwVktEqLBRAqOtZlANo9fZPkYpKRt/vH4MiwpcancZS83Pk4dcLWVurvG8tO9LQ5ZA7
	Y5e+t6GySWgLtvcr8oNhj2FHprNr+ec8dDd99ZQmX89VDSo7VZO5VbmsEif1w0qETiej1AHzl4L
	AyZi0O93aXCxwyNyrDZ9078k1a0SWMpUKym+pbcuaWVJcjZyDkXP72sfrCweKyvFkAOT3OylgyB
	n0K0T1MmiBhI0tFWiTrKIsH5ajCHgR7eSIKygs5yoP7ghbiCu8MDvqT6kPV6wZNmHl9/jBFre2z
	SpqepuQ2QTnjmTUVnKhI+iUycHdohc9NXJjp4ys3X82NY6uYe6cGiSJ6Ous3Q3ltRimiGHPJL04
	fHILuikk8h7sT8yIhkOwX8Ib23N1Jxc4LYqC
X-Received: by 2002:a05:600c:46d3:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a1fdd0b191mr127111405e9.10.1792692340943;
        Thu, 22 Oct 2026 11:05:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm14106125e9.9.2026.10.22.11.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 11:05:40 -0700 (PDT)
Message-ID: <31970f28-5415-4e78-aa0f-51f15d779e1b@gmail.com>
Date: Thu, 22 Oct 2026 20:05:38 +0200
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
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Language: en-US
In-Reply-To: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 2:54 PM, Anna Maniscalco wrote:
> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>> trying to separate a part of the GPU into a separate device, but 
>>>>>>> it's
>>>>>>> unnecessary.
>>>>>> What I was trying to say is that we need to map sid0 and sid1 to 
>>>>>> different
>>>>>> context banks.
>>>>>>
>>>>>>  From what I recall, so long as we use the same dt node, the 
>>>>>> iommu drivert
>>>>>> provides no way of doing this.
>>>>>>
>>>>>> What kgsl does is having a node for the iommu and then subnodes 
>>>>>> for gfx lpac
>>>>>> and secure.
>>>>>>
>>>>>> The address on the lpac device doesn't really matter. I have very 
>>>>>> limted
>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>> I think, you were poined to the Glymur Iris patches. Another 
>>>>> option is
>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>> describe the same usecase - a set of SIDs which are used by the 
>>>>> device
>>>>> but which should not be a part of the defaut set. With it in place 
>>>>> you
>>>>> don't need to have separate qcom,lpac devices, no additional 
>>>>> properties,
>>>>> etc.
>>>>>
>>>>> I'd recommend following the same approach.
>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>> similar case:
>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>> Let me check internally.
>> After a brief discussion: it can be either, depending on what suites
>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>> bus or not).
>>
> One thing sashiko is pointing out is that new dt should work with hold 
> kernel so, in general moving sid1 from there would break it since old 
> kernels don't know how to handle them separately.
>
> Not sure how to address this.
>
> Best regards,

Also, looking into iommu-map, it seems like I would ultimately still 
need to add a child device.

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

