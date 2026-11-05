Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886096;
	b=AGkxNYmvnq4scw/6qqJERPAcsN2iPePY9lW9SEsv2SULGyp9XNACpDqJ5oybGAsvAZLs
	 RGNBF9+mIbd1P04ayPW62K/gVDi6tz7U+8TmcWl7Gz9RIjKR9njTaAVX8igxN3e+G2Otd
	 +lqwz2+V5S0rVqzcDGZXUEXyIwSVNMgp1yu+w7Vn+Hl3AmB1SMuu/QaDlfhCxJjnBuNAG
	 lFJluw2D5bhRxMywGMVMsTOwY/Tg/dJhgN4sd/NAWaTKRS5Ah5PQ2dM2l+eLF33A9wWGD
	 pZwq3fYUblMVhDlVmGltT8re+bXFCtpKro7KQStlFNBcsXrUUAdrPiG6TcG1sFS4mFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iMd3kYBOu+TSW3dG0LvqQCxVneA1Pzgi8pIv9GsQNzU=;
	b=VlyoHLmfqlqMbAgogCAAooTr8YWXANB56rGNRf9yd2znadtUudChLcLEkT1DebQQ9/Up
	 sVon0WH3UtYztz+1Wjnz1ly7/jtkowzCBmgCRYxRQ3aGDehKorPbrHlvB3RnjTP1FuAag
	 T58uhfG7MvkenUgVdqK7EZ5JON30pTbT0Mz8By10S3r7fWVoNT0jt40nyO7R/XtIF0sj8
	 Y4XZpqZsAJS/ySitwqlH0co7H8VWGjKGn08Bx4+BI2GWpEf8Kt/A0tI/E+GsXkiu63ykQ
	 dDdTamE558xDf9s5I3o8JwTCt30EguqexZoY4Im/0AB0k2dPAeKkgwjXXPKthhFvolA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5zgv4O6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XefXoTqu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BB2606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BB2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5zgv4O6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XefXoTqu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59thnd3532014
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 13:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iMd3kYBOu+TSW3dG0LvqQCxVneA1Pzgi8pIv9GsQNzU=; b=c5zgv4O6mlrsJZlO
	cPzXh1UHezP5ML4J4r5c31GBVxZ0Ykk6w/uDPWl4toE+EZX7+bkDJecE+su/sjCz
	WZPi6cJsGi2fjYb0LqQMK5dO55ZA3d/BGLHfRikIn77zVgzsQOO8sBeVmV7gl9Yp
	H4bcZae8VebNfHWWB3kau7qQ6aR4RHE1iOAhuczoiiwc2V8uWmWODdrRjVNX7L3u
	hKGtM6ej0KYKiPa8ZaMhWizVeg8vj589RFIvEGxzr/YtsIgqOw2wg81bZ+9uzarD
	FFGYjUoXQJAG9r4bAC5rVI8NC0YdGpfWGrm2y4H6wKLXm8WRhiNlZ0PuAjnCsmYW
	tCstVA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq9wcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:41:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1119eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793886094; x=1794490894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMd3kYBOu+TSW3dG0LvqQCxVneA1Pzgi8pIv9GsQNzU=;
        b=XefXoTqum4ANAPT3k0YTqE7qstNuKtbrlSIb0hOGZExpgoyqPCHpSJfCgLTnoegqBo
         Ag5RSvtALyDMZSxmaCFwExTlIf6IRHOmdKlxM0+p22U7EERG8uVuLdrTbeilI4n/VpbJ
         ANsSsvtgCJtJ8GHmiJuFtM6FjDD7gQQ9EyTip1bXO0wDy9DJ0OFYcg/184+JBHPEhrr7
         mwzEtZecjbv/JdajGLSwNpjDkTPtjtw5XscvJMuQgtVOTLOH0aOhrIhAHJqRYV09UTDt
         +aHKl2MvE5NcpROMFIkoUtz4JQaRg15yTvLIoH70R2KbM7w7Rgz+Ib3Do2mOb3qpiwpD
         Y40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886094; x=1794490894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMd3kYBOu+TSW3dG0LvqQCxVneA1Pzgi8pIv9GsQNzU=;
        b=oCNWkkfCFDUyYtOzV4Eiw/EXGMBJA+0FcS3z3LQOYNSlZtn4XLthyRUZZ8TYLDtvjJ
         NZH5eJ40K/zmgjoOoIIKrRBK6yhzZpPQOenR3kc2vP1Em/Hq3IyU6gMNQpUNFdoUXM4B
         lDmY6LmL9gvkVMXKQ1bxXFIxYvqmyRd5v6TvF6kU3xZDR1FXOhxJqD13HGFBJG6vWTQo
         V9gINpRM3c0ueG4ZYmQlCbX+Lop85WnR/aVibBnGEzz3V7e3nAm7196vkv42zDPQYUVa
         D39owRrJvUFVg35uTzG5DpdX2LxzX4kUhL1JJEBqVn4C3LQxEEPyYgHsMdFb1MrF1v9j
         ifFg==
X-Forwarded-Encrypted: i=1; AKwUvBzQdRn/MAwC2hTBu07qZ8/jy5NkSMjahyy9QP7ZYAnTT0yTGvIkeVFoT+56YMU8cH3+W6QYebOERgOm@vger.kernel.org
X-Gm-Message-State: APuU4Z8ROJoWJfP2mSpG5j4QdsLD4RXQQyg80TX9g6g7gNxUGOj78it2
	56IE+J5lJBc2tBjiqcu2m3ihCs28/ze9UfycpY4XHg2mEB6GXP7RUJ/gAtYC4oQ3Kxi2H1QEP6m
	ZZey4hfN78ILAdLy7Ba3Ebm4e0P2zhXRYGGyhSxznYiD1+fX1D+52uerGteklhlav
X-Gm-Gg: AYBFou0mjdjVOw7VRRxZK0m+FYbQJF1g6wyK00hSh5/6+1EJF2BLTOAaNc4ej1HtRO3
	q+FfLva/snfGjhNqMQ6fKnRTFJxFv7VTfdUW/N+AYKvAFV43+mMueVtizFVOXOVoMAnuQXzQGxV
	2/Km6b4wDhm0dEISxOdG/aghvFaIXuBceD95FEWUq9uLrK58QUxgJSakyXOwQkruBPRxjrXJ5ag
	vxTfAKcJ5vCGX1IFrCEoJYADSWWLWA4t4LmqKBVgtaH7hmspFA5T1ol+UH4bDqA/KfvLFfmmQTC
	/bf4md9QCGrMDzMJz7Dh5uPN8v5YUCAQ5uKJ8MEIBPstRU5h17r6Gjen2rCLwEx9XRUDXSZVC4w
	g7s4Y75KcBzUl8P3fyEZOaSExt9RcH9eQFjST9eEyRkivp9hWnpzpkCsoJIuLRldE5gWyueFKji
	F8/g==
X-Received: by 2002:a05:693c:409a:b0:369:f05d:6c67 with SMTP id 5a478bee46e88-36a42364b83mr31028048eec.12.1793886093233;
        Thu, 05 Nov 2026 05:41:33 -0800 (PST)
X-Received: by 2002:a05:693c:409a:b0:369:f05d:6c67 with SMTP id 5a478bee46e88-36a42364b83mr31028024eec.12.1793886092676;
        Thu, 05 Nov 2026 05:41:32 -0800 (PST)
Received: from [10.206.97.48] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fe477sm15424892eec.17.2026.11.05.05.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:41:32 -0800 (PST)
Message-ID: <15ff1391-d35a-480a-b28d-a6507b69ba66@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 19:11:25 +0530
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
Subject: Re: [PATCH v6 2/2] of: Add support for "iommu-ranges" on a device
 node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
 <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
 <f416b51a-0775-4834-9e1d-af8a72d9a1d8@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <f416b51a-0775-4834-9e1d-af8a72d9a1d8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfXwx78jTwo8Ixr
 xCNu7Ef3XHMitoi1HFJLqDjUyjrfxJmAnNRmsz9EJkHbeW6B3PdlQn10FCND3oCOQGzfN4tvrlO
 6Per+47lidiBnazKIpOpAag2/655fZOqLWwGjK0IR1dzoPoTa1+tbMHP0yd2WW6v7GtWxvv5ncx
 h2O3RRB5iQ9dCCxhUe2TlLBpw3Lnwxwcev66rrFRj4Jx9HFiKkK1yQE6aN8qEbCNtp6LmvyAH6O
 QkONNR/RJpuIspTowf7SX3GoVtBGIzx2iE/we0ROsZg/V3CKi2vaRa9pY+QYtCaRYhDTVZPNr2K
 PAj5UBznCOH+zRV1Tztw3bFtrH7Fu5dDHflGHsrtJcO1B90EAa6e3nSxhdtjDQdEQhIL2IvgvzH
 dtrp4T9lXdXEReytCrTsUD5Oz5n7I31kLazOTt92prpwzmttVcLm4UaK+nxsvOy6ieDuGlkMMcx
 oiR2nwJHq8XCdqJItNA==
X-Proofpoint-ORIG-GUID: 4c50VK_YT46ieyNV0GjvHqrOGe-qLhK7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX5yxYqOPjj0nC
 wsIgaIq9LLXznVRB9NRD2Vg5Q0HmTzHpl817lGNap6+A6mCvIGciE++hVRSStXAY3xyeEO2XByd
 hPvQm8CqCDcUkQ2XJjkWnFmLR8HWfXA=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec878e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=r7ux6a0TY3_jL4VTlKIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 4c50VK_YT46ieyNV0GjvHqrOGe-qLhK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054

Hi Bryan,

On 11/4/2026 9:53 PM, Bryan O'Donoghue wrote:
> On 03/11/2026 15:29, Vikash Garodia wrote:
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 
>> 5c266511db78910d6fd221af5437cecff4931c22..0428ceb50dec58f11872b4fb64e283fa8d9046a3 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -185,11 +185,118 @@ iommu_resv_region_get_type(struct device *dev,
>>       if (start == phys->start && end == phys->end)
>>           return IOMMU_RESV_DIRECT;
>> -    dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] 
>> as reservation\n", phys,
>> -         &start, &end);
>> +    dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not 
>> supported\n", phys,
>> +        &start, &end);
>>       return IOMMU_RESV_RESERVED;
>>   }
> 
> Same feedback as @ the last version of this.
> 
> I still think this behaviour change should have its own patch that 
> preceds this patch so that the logical change is clearly explained and 
> understood as a standalone change.
> 
> Supporting iommu-ranges != not mapping misaligned ranges.
> 
> Otherwise this change goes under the radar of the new functionality 
> addition.

Ack. Will push this out as a separate patch.

Regards,
Vikash

> 
> ---
> bod

