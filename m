Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705603;
	b=GmNjrTkVNWH9BLnBLF8NLgw//tAKh5GWwY2be5FPYpiSAkFbJI99KymqKSFrd1se7Sj6
	 1EFe2rOlc32ANTRRpIE0PEmXn/8rArbvDJiNWg6y1Zm30WD0eyVZC4btL5RrKWteKhO8z
	 PwylDT6lR2yyn1gzaZSk1nlA/dGMGMZWTCaC+dhfLj9+5p1vkdMInd8Vpsz2DhQgz+y1c
	 azuL+RtmETEdjkTDDQZzFVcZPVoQcZ7nK4h7t8qvNGTW7YVyTgmKVsNmF7VnmTtt/sAcQ
	 MqwevropGOnS5lr24PWvdeky2PPWy9z/FgqLopdqj1k8qtlL6mwv4pmcrXI1/AjHRqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
	b=uRLBb49h4FCXWbUyoOKv3+kBhJXYnA9CUIzFI/JcH+Z4lZHg9aSO+EpiU6jwkB8DR3Ya
	 XaxipQdiF2gVWWmQ+IL1DVv/PB7nqFIXAq7MHh2oGop6B3sJLU/pZiblO1warMyMMSaL/
	 iL29yu4F8JKtBjkpMxXsRS/b0U2Cbj+8Z4FuPIIHQrNdXPDeXtY54KzRH43aant3UrDeS
	 1EzwDiMdr6Q0y2QS4AlUOFViatjdxrh2SaNtcromnnBd//EKRzAk19t2LHJeQkS0u+Vcl
	 JEHf3vqDQNfdSL3FbLYFNwP8WvWs0JnoEj+6mpWf+OY8kUMGq4qU1iD37OnhmXsqyHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNq+hvA9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H8PMkA7Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF79606A324
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 21:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF79606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNq+hvA9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H8PMkA7Q
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MKp52r733737
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 21:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=; b=UNq+hvA9A8DEwJLN
	NSYfFSTtglUNNRNcKnXpBoF+eJxXXmuGdMTgqw7kmS6wZSsb8jP0zZbtAYPZSzvI
	sKxCKw85TSNNzD8r8KAvtkuj309mg2YOI9eQdAS7L1XUYlYegnK3AIzwdnpPabzR
	ts1NDX3Mhqs5NgWyklR+me2lpJcGfo2BgTM6lffe6lljiqxNlxwjjqWlaMcYRcZn
	7/v6+pT603Hh7qLgcO3a3t8hIvCiz5xj+hQQuoDccw+7GKskfaEsyKy2wsD1D5s8
	e5B3IBFArInFKq54Cfemsc0cdvi8cf0svwEMsRslmd1Xlg78ZZ+q/UsIiFXWZdty
	4wjHaQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw1725-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 21:46:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so570355eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792705601; x=1793310401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
        b=H8PMkA7QnKJODksT8HWhR9DL8Oi+3sSyDo5LJ8cK0IsopzSncJTQM0zjca1xVYcxFH
         F9TaV4f0wBCPTG7deiWywqqiG41i0QMbniGdXjnz5kcQRSsNSL7g1ETfv/MLlJwmNwE/
         vJP+CdqUc6rHx85MJSKqM6sa5SvECFOskntEMP4rXsXvYkioiwDBPW3ceKCZgFjdZsEL
         ll4asanv3dNjgBX9aUQZ/TgE185yTaokATH03+C8s+0nleedra6FRNpFOtoptC7oOa2I
         EtpQ9IV4A+ghPS92SC69Qs6SPJAMWDkcVRa/76Ha9zRuXMo65RV/PGHyRh1Vu4VYa7p9
         WC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705601; x=1793310401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
        b=z3/gh01L6tTWNJEGByLTEtQilH+AlG25QYTrl03Jz7dJJY6va/oI3oeEt4VxMmDccw
         RzB1eQ3mPwnP5EDtvQH080BDdqJ+XbfiiIGBBmCTideibvuik0Pfpd+JWoKLoT91HZgj
         hcAxyxX60ebEbCtmdxamwCqPnogT1st5m8Z3UbYW7nXpKMKzPE5CTzdoRy0nqSI3+jas
         q3xwI8J5lQHC2BYxxcMWxRyeLRKdDcPeKzVXdflTLYy9bn8b/gVORhraWN/mN1koh+m5
         cv75LNZ3fDVt3L7qBb4du2P9AoU0UGmSNhLXjCxbD12m3ykI6EsMK+kdKS3BxTnAtHk0
         Sncg==
X-Forwarded-Encrypted: i=1; AKwUvBwWsf0+vkal8RscDgqFtiIwfQcWU3KILcG2MugRjniEysG2Xqr2JEcQPZxPfiUANEP2uJCyqaftLjn1@vger.kernel.org
X-Gm-Message-State: AFq9FYKLLHBie7a1qQ5ijv8/kbYMw59IQoDjSEL5GAb22yvc6+8TfedN
	EW8E6DX+WwfSIMiVqCUbTdUgD2vPEVnJJ+E8WXl70hY13CkLhWswNtvDlOOWrQx2sHQ3c1alDVk
	JwoS2kUxo3s/pDx2KlriMvr6WL7MKljCZq3BvL5iuUsfs1sTwXHApQ1KRQsev1cYk
X-Gm-Gg: AYBFou1gnoF0l/hqGE+XBHMylRtoqC/qEhbVsB8TUIqqcsWWKBjUAPuXogpdi88aX8V
	27/2GmJJ9DvcSLkdLrdJJPuxWDLrcPBj9hhtUC9EQb+evXf9WnNlYp/fojS8NkrEVHBZp5rUN2+
	wUQkGMsnrUa++O5zjtCcd9Zdn9COtXCwiG7sRVrzFSROUgdGFbounar18NZSc+9OOKNQjVn6qEQ
	T+BE20PW4Bxflmn7M8el5mnCQKfGgxGVyIw5rIKk6rI+oXelxTJhNTtcY1vBO1AdHqT4WAPD3Rn
	SkfPmRDiwPHADyCcqRViJlnXqEJYQ3QsH+vDIvlSYCRzxldMtFBUtnPIfGI+YsP6RwIDM9s6CZR
	OQtaa4Lt4y2XXlrRlIughlBYe
X-Received: by 2002:a05:7022:1e13:b0:18b:48c3:287c with SMTP id a92af1059eb24-195c693fa23mr494694c88.41.1792705600360;
        Thu, 22 Oct 2026 14:46:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1e13:b0:18b:48c3:287c with SMTP id a92af1059eb24-195c693fa23mr494632c88.41.1792705599029;
        Thu, 22 Oct 2026 14:46:39 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e9e9c4c7sm954775c88.4.2026.10.22.14.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:46:37 -0700 (PDT)
Message-ID: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 03:16:27 +0530
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
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2HRx6Ngdd72nFC7r4wzSLJAZv7hM0MMk
X-Proofpoint-ORIG-GUID: 2HRx6Ngdd72nFC7r4wzSLJAZv7hM0MMk
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6ada8442 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=9jRdOu3wAAAA:8 a=InArmlTPJEDsLdIP4zgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NiBTYWx0ZWRfXxaZUP04Qwom9
 nJJ3dVE/Z1jUFfMOqeTCtS+LSULBGZ5ogpf4VoHI7+DPijVy5oESHNaKQq4diqoySek64bOOXxv
 ttot+5kqGxnrMMwZb87YBWiUBL/V+xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NiBTYWx0ZWRfX3FnnphgXjD8+
 mE57URO3zo1Y2tohgm6Lq9JZrvb3PFSe/Qru7dzzOdodD/g/uRqUxNwl9PRrimTl/tTmm1bphns
 5X/OmwDvafftNbk5NcdrLGoZg7YlEga60ji3baedLP2mAdcdcG8+uRqCBTBS8QLd3Z38evmMbcF
 Zmv9j/dWsci5XmiheLlvrAmlnYRgjaO34H6rk02PMms0Q/sZbz7lnIf4eDwx9MWeXGXJSOCfSGl
 gtpv4Y53pXleILnADhV0J8Zpc+F3KpSuyGmjEQVww8Qqq0mSkjCBh/i5zucUnalaE04MDxMINil
 DtBBVt7Hjsk6p/NG1xYHKVSEBscTyohYXpZ8UFJ1kmdTbT8L79WFEHFHeOipoWSYOjxX4fBi6Dw
 2pCf8T6tPu6fdHQ7fwc6JVknyOGO/IuFOIn0ER2gOQ/BiM8gRU9AkXPjR1s9C9FCBJRWJt4dXtt
 EtYCw/Coj/CBNbjLPKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220086



On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
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
>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>> unnecessary.
>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>> context banks.
>>>>>>
>>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>> provides no way of doing this.
>>>>>>
>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>> and secure.
>>>>>>
>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>> but which should not be a part of the defaut set. With it in place you
>>>>> don't need to have separate qcom,lpac devices, no additional properties,
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
> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
> 

+ Bjorn/Konrad

Not sure how strict is the requirement for compatibility with older kernel version. An
option in your case could be just do an override in the board dts file of the
Steam Frame.

-Akhil.

> Not sure how to address this.
> 
> Best regards,

