Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694CB382397
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417139; cv=none; b=H0GtYFO346AsmQIhfSXsA23mtLfhU7Ux3huCNZyu4iybZWcbrg+ltZfin7YbLTu9GcjgwIPoPkZ/R3eq2Qc6V877aKMICxGUoRHD/mxBktD4/4zJHuNKbiuXhgYMxb2TH42j1fqLgn1pJET3H5RziU7mJgs0StKVpRC3/2o1D4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417139; c=relaxed/simple;
	bh=P0WZKLIMRk3awVcP4p1cnJX1V2AiQM3ZN8GnwrVM2aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pddIhuKELLbSgpfDJfMn22zsL4m24479BRlu4RCD/Nf3lCUMaKAwTC88wG7zIy0jfBl7JBRVMHGxz21pbg0+FDc3dJP5ju0+0/wh/arljEg7jBQoje0RjkhN2bVO6huEjyMeRh5jjOMovPxvElM60yQBlY9O3aU+fDU79/FaZsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUlR7FEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mcr/PNPW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUlR7FEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mcr/PNPW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lZam3114044
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 06:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5iK8zc6JIEJc+8JLHeWXze7Lpfmy72zwCH4OPQazjU=; b=MUlR7FEPb+eazx8t
	MXpGZLHZouE1kq6uSru1REnxF4yx2fxxUmbNfk03ujx783jlxUAf12dVctyWMoXm
	G//vEcuKw4/ruysX6FiMIS9jQ+iTlDyL6HB5j3B2Z3HMcAygO4YdpUhM9q7YNC7L
	B0bXWJVOnnOEJH13iKyRH7C8gpbzxZHRm6IROVuaiBuCeXvnFFdX8M8CZNyfJHxR
	6HSYD44SYBKa/ogv2/XBp4Di/mUeHP5Bv5lE3wi/I4I6mzMMiRuY4R4P/6eSPK8W
	MMSe0LbKEIzAJtW1bsdSFv6kTFmCYNlDke1wv8DZ28u3xT4R0BpwKt6VFUCGpxAA
	KXR28w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjrpbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:32:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso35173285a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417136; x=1789021936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5iK8zc6JIEJc+8JLHeWXze7Lpfmy72zwCH4OPQazjU=;
        b=Mcr/PNPWM7ogg9rsjLVxIls+jICwmEgttwgA1vGQoZ8sK/VR9XiaqK+KVAbNLnxyI6
         KdaKMKSLRZOl7eccz8XelsfxtOti/PfZBQxclNgnqbz/oqMcgYGjY3Cw7rnwEVnFvG4c
         /EsEH4dPXJRd9PaUJqs/Xx64WPbkrNiSbXbS/bncpDlAfJ8HgNBLTY28Pts/l9+2P8Tp
         254M2mNt7RBZr3T1zIte5Y9HCcDF10qXVzQYC51zP9BAvxh8Q6hzzmxFEZ/IMIVl9egF
         7S3iancGXXdXFy3TpDmbE6BKZVejMrp27tHro5wmNotfTfGiBC3X2H8Nh7sSxXWU0Ge+
         EpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417136; x=1789021936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5iK8zc6JIEJc+8JLHeWXze7Lpfmy72zwCH4OPQazjU=;
        b=ZGBTlqVi1tqL40hnK/nRTVuj3fHd9z7fdh3cSV04ZkyDA3OOiPB7Dq0rxOO+BxC9/g
         Ioq0D7QQrcEJoTCauHizF9oki5qChXPCb0W0S+vl/vjUAywH6NKVUQNcOcWBBM7l5NPv
         j+9mjRj1zJucoz5GCrVujHey+NCJoXJjhke2z8jml44nq5lHmfTcmn0qw3r6kTrhSx/I
         bufx8GRU1OAkcDhn/9nOlIMHJMRGKrLhIVm9RsimXTTlu2G/UD9bOhl8G7G3oEtlDkRb
         UBfadFUXaXKPNyJ9Q/imap5DpOF/XcjQgtZlQL+HTOUBNUIxYRgif6uHIfGiOH2I+yFB
         YCcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2PhLKKwlBFI2kuwqXLTgjBn0URJPdD1G9D/GbrbUJgFZFVANir3RzVR0I90Ulo1bOj/0JdHIuHFfZ@vger.kernel.org
X-Gm-Message-State: AFuF++m0z2VIdukbkfeP+h+2otf3R4aCWkl2CT9XJj9YdgGaf7SEwrxL
	k64FxHYTMCwssO2c1xDwyBSML6iIXMvVH2s0fsVnY4MurGev5haalJiHOv4KtwtpcQv0jpGC9GP
	KKU8JOYQFqSoWmz48fco51dSQW7WckY/qtIJ/pyh6ztRxRsP8uUN6P2T0FiuPHb48Zbo2QAGG
X-Gm-Gg: AYBFou3OFw9Z2DbjN4Qk3iZxfX15iJLd8kNKxeAQGlOpxEchQS3921ypNfuKISKcFLw
	ux7frRFC5AxmyT20uiXSkps18dZ+YIdR69Hps6dL6xWQFL82ixcy49Go3iWrgxDIJzDS9NxfN30
	V1TJiyedf0njSoerKy1cXI0Li1eqUl7Lofc6InC/anVaJyPhrQsDCtnLtidU6zW4waYYhuE9NKO
	6cXRnD3QH7+U3m7qHDmvQN+0zom+q9/+zmfXiFdnGnfhrDpM/R000fFG6aFHeYICnppeLfB7vSy
	khyyswjcBFhzlNTaeitZvWN88ltssXJoPtgPTo5d7s1Nu42XIoINRN9wCi8iMLLy0Du0V5QtEnc
	wJRKQHOMZoHmkRM9bD0OH6Q==
X-Received: by 2002:a05:620a:2682:b0:939:287f:301c with SMTP id af79cd13be357-939610ff47bmr767146585a.6.1788417136518;
        Wed, 02 Sep 2026 23:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:939:287f:301c with SMTP id af79cd13be357-939610ff47bmr767144885a.6.1788417136082;
        Wed, 02 Sep 2026 23:32:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172091sm51776866b.12.2026.09.02.23.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:32:15 -0700 (PDT)
Message-ID: <dd3c20f3-89dc-4b5a-935e-e0e142988e4d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:32:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
 <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
 <06bce1c2-8498-4988-b5c0-ab42bfba86cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <06bce1c2-8498-4988-b5c0-ab42bfba86cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfXyVTq/x45Sozd
 nNvgbJNWMqi3TJsQcKZN79de2O9a7OqEnkNgFryQL1G3BcVW6qAzHAPNbMiOZGehvm4g4q+NW35
 lxD6XrUQnYWI8zMUDPzElJXZSs1VmuOLCVsNZfgVR3Jt6CwOvTW95au8DnHULqZAkOFKRHOS+vZ
 IDYZS3m8CDEtS1H1IwX93WSR3Tuj7VIg/MASkq1eUDLSbyByAbZe9SoDnGzb1ARTkdKi4Wi7KU/
 w3VtsBrW9YuUD6MKXl0DTdJfXT/zT/TnmttAmC1NEeYUvoqQncnNli6PHt7ph0JQwed48/YqNvq
 MJKDpFOkEK23oziCt4If3pSxPNdImKl/VabVZcEJlcqGtnD/OMT23biW/Uvekgp+X/rLVcRCMZv
 JK5OQX/OJw2Ygn10wM6/C5i8hJ5NCIbwniZP3+qiYzZpxswAsCPUudoXFn0fyIL1Vc/wTyaueOm
 yI76Z2yPRn3j0DYOVGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX6QBpJIrJ/dqt
 yQoEsebLPdMwZrx6De+7LKqzlh4E37fDRkfmtscL1/+A5t8zwKNQwk7cCpg8vE6MvZDsUvBW3Q4
 ndA9lo/hEIYqof3Wj7iJ4NOiz46TteM=
X-Proofpoint-GUID: aHMSpF5jtoIiNYzFuUytF4RQv8_rLUB7
X-Proofpoint-ORIG-GUID: aHMSpF5jtoIiNYzFuUytF4RQv8_rLUB7
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a991471 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hQxA1nNTofH2dBn-U5oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 6:59 PM, Krishna Kurapati wrote:
> 
> 
> On 9/2/2026 7:40 PM, Konrad Dybcio wrote:
>> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>>> present.
>>
>> [...]
>>
>>>>>>                  - qcom,eliza-dwc3
>>>>>> +              - qcom,glymur-dwc3
>>>>>>                  - qcom,ipq4019-dwc3
>>>>>>                  - qcom,ipq8064-dwc3
>>>>>>                  - qcom,kaanapali-dwc3
>>>>>
>>>>> This changes the ABI without an explanation.
>>>>>
>>>> As per the harware specification, the controllers do have both
>>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>>> info. Will update the commit message accordingly.
>>>>
>>>
>>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>>> incomplete? Lack of context here is not helping.
>>>
>>> If they have these IRQs but it does not matter, then it is not a good
>>> reason to change ABI and you should just add the clock as optional to
>>> the end. Was this binding already released? I think yes.
>>
>> IIUC the intent of the patch is to allow specifying the currently
>> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
>> Bundling the DT change would have made that easier.
> Yes, I wanted to add the missing hs_phy_irq. I didn't want to bundle in the DT along with the usb binding changes. DT change was posted separately:
> 
> https://lore.kernel.org/all/20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com/

Shipping bindings and DT changes in a _series_ is preferred, what one
must avoid is changing them within the same _patch_

Konrad
