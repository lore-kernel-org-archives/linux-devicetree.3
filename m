Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769163;
	b=Fc1Ng+Fx1O/Q0StwFzc/N8XFpf7HPdY30jkucxi51WZqmKmok8nLueSSt15LeYyuTv5t
	 MCdkbtyZzpUYm3aloDZT1WLJ3XWKCf97Rdc9fvSzICLWV7k6ECFpoGF49zmtnvVA307wt
	 1aoeVXdCj4iDlwyMRsFNO93IAhsJQEBrg/0UPgVmt2X0emq6ed41fSlrDNNZ0ETz8jcBE
	 DC7WgDIuYzUE4nlvhnHb/DIyyKX+PVGXxe60cUZ9wbHPtjH8OuLU/qaq0FhB+l6TdpoMX
	 0GnLWF2GOg6Ca34uQ4r370j8p1I7lr+kTfmJ81I+u7kYsvKRHTCwOxHHDQ3rfgh+BhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
	b=ObWYHqhRoUdt82G+LOfqyJQPg1fkwFa4y5H5gzBjUAxU4QcIpNTztFAs/vzFn2ZQpFAF
	 5JbWI7eE7JcajGVN4ex0wkYzdfX+nHJ2oA+U4Ys7PbIywg5/cN86RtTNH516h/SoZjfld
	 4EiTmpJ8rR1rEEkhO+WiO7d7glTxzDSMnB4kzyEDT14CFe28ivJtyg+s9cG8WwG23WrmI
	 POPoXgh4hEGCOgQcFJ9hgbeVA5S0SMcoe/Vugs7WRXyx3wneE4yvD3kURdYHUtaW63r8Y
	 j9z95yn+6HdiZeoaeemTdUa3GNvN5RRntUMR2egdI7SGv6gwKEqYDc8H/SB/sCHv1sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=clz6LlPj;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C5606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 776C5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=clz6LlPj
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1df146015so7365035e9.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792769161; x=1793373961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
        b=clz6LlPjUTdI3liTjbBPzvaJkyBEN/TX3HWi/4eIyxmmD8ZI4SkQKMe8JEaByKZ2ik
         eRDS3Q02MyWHy2PC32Wy6vIuqBCo7vnr1u6nXWBuVNKCKKXgPR1pZJnAuOF6WVJ3t6rO
         10pytd3CMYvrnCQ6Dn/V7zVk4+RxfpV1d8ZZ6M9d4Io/cMYyW4ZUZJY31xhESceKPYId
         7N7O8IUvcNX7rQU/YQBztiPewCNQOmbApYI13yZUd0WOdeMqN6FPwbf8jRCg6S6KGBaX
         /CxfKtvmcVdVaInpniLAhO10G5Ie74B4YrO3ewquG0c2v2p+5S9TMTpKGcjV4OXa4a+0
         zgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769161; x=1793373961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4a2HGeqSU90/oPjDCBfIOMhTpn84AQ4hBfmcEVcMu7Y=;
        b=hPM9CJV5jftKJix1dzHIgnIAym6FuxOJFxW8H61TRPGY2JVJe4r7xaopS1ASfBjGsD
         ae64R1jQEl8fAh8xVC8IgeKV00DvdtHpPzKIcU2Ud2yFS2h13QsY3eHTkg42CbIvSKwz
         NY05C8A9OvEuZ5L34esaWgBwzKFHxBYzhetYvQcANkYgQu9Tgof6k7Z9YfjiRcVzpr8P
         xFa/vptHWv5QizO7WvPBwn3jL4Om0SSyUvbrW4XV7oc4A0/I86LZiVSxJmsZ67PzNsm4
         7jp3uEh1afYEFPyVbCmXdkc87Wlz0e7gsuIQ9zmB2F8xT1EKKzKm5pZsSbkA01+5Peoa
         sVdQ==
X-Forwarded-Encrypted: i=1; AKwUvByD617aRGdizLz8HZ+5WrfhD1RHWeTSFA/ukbiObM1KwD20VcgKlQfJi+W5hB5+7zv5SK+hjskOp/wX@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4kIxoY/nFlZDx62ciHV+wfgsNSCEm9zuwXKI/KZ4COyY+Y4RZ
	gDlCjtrJS0VvK1nMeVciFf0sA2Q8TzUXQ/MxO0y81ZfdrPSucVx71zM=
X-Gm-Gg: AYBFou0NDRIUnNVV/kqqVDP/B9RkwpAHhkk6uYiDyAOP5QzhzECDMv7tSN4gd57/1j6
	MsLSkIbAJZoBG1QaMjneogpisN4OuGaaHIxy9Ft72c8Eh4UcpeOOy2JDF2h5l2BEFOP+hMIGqm9
	JT1+du5+nB6D2QOwmcuciODqN+Fc/UfNptQRty2lNlhLU4zD4Yx93Roqa6RMLiA1Jipc296kFGw
	7aRZZ+38tbo89cnPpmfjXwg6WGf45kcjiDH9p2iMsl/1WI4qnn2zpbDL1dtO0iYjc/wW7zIF2NX
	JSSc5uz1g22ZB2K6vn+6y2nIOrDMLFN25B53Pp/f061/a1K4zFdJwQIsc4oAX9V3+1d1Qk33ofv
	nSdi6DHwGTYALObt8TLsWW0OlKaixuP0iyrSngHwNlGcAo74bWhzDP7UeX4QvW23mtSKivzR2gN
	hWz8tHViBG5FBttyGt1w0JLLUmda66fVH96K8zVth5QF0U2AuVOkbgH3rcjHvdHmQ1FewT5unId
	exISJxiS9cgThzj3hYGYN+ROSifw8H01d2HRqSI+kxYiwBbu7GwuMUBbpHS1ucLY4NzSuRVw3YK
	ZFeqb3kNm55SbfiKIklUjQk2LxpD96Rw/wBOLVHtxDnmWEMI0qlP9ln3aw==
X-Received: by 2002:a05:600c:19ca:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a211c8fa81mr43106325e9.8.1792769161277;
        Fri, 23 Oct 2026 08:26:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cda9686sm11718245e9.6.2026.10.23.08.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:26:00 -0700 (PDT)
Message-ID: <af06c4b0-55a6-45e2-b2d0-81d64fcc845d@gmail.com>
Date: Fri, 23 Oct 2026 17:25:58 +0200
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
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 11:46 PM, Akhil P Oommen wrote:
>
> On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
>> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>>> unnecessary.
>>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>>> context banks.
>>>>>>>
>>>>>>>   From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>>> provides no way of doing this.
>>>>>>>
>>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>>> and secure.
>>>>>>>
>>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>>> but which should not be a part of the defaut set. With it in place you
>>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>>> etc.
>>>>>>
>>>>>> I'd recommend following the same approach.
>>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>>> similar case:
>>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>>> Let me check internally.
>>> After a brief discussion: it can be either, depending on what suites
>>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>>> bus or not).
>>>
>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
>>
> + Bjorn/Konrad
>
> Not sure how strict is the requirement for compatibility with older kernel version. An
> option in your case could be just do an override in the board dts file of the
> Steam Frame.'
In other words that would mean not upstreaming the DTS change? Although 
we plan
on keeping LPAC off by default upstream it feels like that would be 
quite a big
barrier to enabling it for people that want it.

Also yeah not sure where sashiko got that requirement, maybe it's not a 
real problem?
>
> -Akhil.
>
>> Not sure how to address this.
>>
>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

