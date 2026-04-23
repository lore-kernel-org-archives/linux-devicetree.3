Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C23E51DE
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936530; cv=none; b=pCHzP6ahk7huErxq+3hX7sZBprjR52I8MV8igwEPrSHB0xog3M1a52cHU4LglFa+T3OifPegafRa7oDJ3hrH6dvtvx+QodX7ndt4OsYbItlNiQRWb2NQj6HDZUcCiNWxjlefk7+cG40cc6+a5T3kM1+34uRvEdKf5i7Eo+B0MmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936530; c=relaxed/simple;
	bh=43DjspOXiNHJdI9+IMUXLQ/SDPiADg6BB3xMniQey/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjJjpRbEgOXdihZen5BGGm0WgwqsVkeCCMNGB+nogDsMQFjaVcxh1n/qTzh0e1/I261z0QymeRPw+YSKrM5DuznOmzzffa0Mw6+x41fp8Nx92uA9Yg7j5oTpGj8PZEG2a9Jt/Vgd5D1Xtpfwk5RpVjTVzmDaEtQ+Xh65ymZ3hrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxzltWmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFTctlXq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxzltWmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFTctlXq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uE6L3044060
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cU1Q1HOzpIyUGlSrwwBjkIMi/d4z2yNRQMRgG7Now8M=; b=ZxzltWmXw4ICOBcz
	unYL27aCSC/a6M3nFeo15xeAxZzDj+UqL1/N56WvbMXXAT8pcsNfuNbX5jSV3SRL
	Z8PBbMuPmUr3eiTGt4ScScbszbs5RKph5ScdaEb44Ogr7RFQJS87G8muDdk03oVF
	qe5hG0pYCIWWY1wZuohhvukf2qhXCrspjE2GOqLOsqQqrCCW4QQtym9kBpOnmWPX
	nX4Gr+2yU9JBHrU/AweVDavcVmkFtdVldKLGWFIY0lnp3xPuWP03++3rfvPl5EkF
	y85RrOYUO8bAGHbiNwkz3CpzD+Y4fguHCkaIXhv3cAM1dEY2Cp1BW2r8unhylz0G
	TrQlnw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh368d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:28:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5073ed1ec6fso19224441cf.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936527; x=1777541327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cU1Q1HOzpIyUGlSrwwBjkIMi/d4z2yNRQMRgG7Now8M=;
        b=VFTctlXq46X3PvKkeC7ZDwTCapzB4ANjqJbd3QYWNzPYF9vdcj14RxIr3DgD472WYf
         AFk62OpoIVD4AKndfYdJsu9FZMJRqF1mjke52w00G/LJzQ3TtBUtiC9SLDNAK05dp5Ua
         LPCTb3q1bgaX07Ju3d/GvOWTr3ZZgV4JM/RV5/2CZ16DvYnQMOurgniLJbdBLYFtair6
         wFnJmovn4/IOyCOxblLiGTMXSF0BJiLdz2H/GLtK9asNlNGQC4gCg8i8ZO3Ysq2udJ0H
         adyMj+S6BrLsuTNnIbGL2hRoV2lTX9UoYXRRNo/wUL/tmvaWMs1PheLk74UaIE/Iq+vC
         np6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936527; x=1777541327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cU1Q1HOzpIyUGlSrwwBjkIMi/d4z2yNRQMRgG7Now8M=;
        b=Pg3HCGqj03uNxtPxRBTKrnH/fYDAcEJFds0F6GwgJ7LIQYN4+vFbNqqWMx6bHisRjf
         5EvYrtAunBVMW5fU9AnGt/eTl4Fka/vXQPOhgUc8M131/WHxtD8+2BmSE0INAqhbKm+a
         CSUbiOTJDsx4CCWOtp4r7qdP5SBzg260ucm+49+ktCPlZblLFGSZpFQ5pHjl21jdxefd
         Q+34MaM4U8z7stNllVv4hR1IQeG9vvJzkJlm3v1EakTZPOKHhMV5hnIuorq0OXl2u8Mi
         O+boWSp9EpZSWUacMzRCS2y3/ZThZ8EeouLi3Y2dQ7ymNccF5cRuEMuqg6zLZn0UtT9D
         G47g==
X-Forwarded-Encrypted: i=1; AFNElJ/AXSmM9kcc1fqspZHEAlKefrEPq9gOj/YEdyDn79cr4/Pja6du/caFfHnpZiIzh3S/HSDELdW4aA4x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2T0Kcpg9uvO0lpRlJcy88ar0INuHhZC8Q6zXcwekoqg9ckAXh
	W5zhd7ZPp7GpzWvn8Y47HaYFGOKoUnqiqZo85Pupes1f4c8uH4MSiSr8usIitmWJS3RWPlbebGa
	jkFiNdMV/WYSubAO8DN44HxrZ/392umxq5tGMORC/4/9oQ8yf9TwmXehWHTkvcuvj
X-Gm-Gg: AeBDievk3f6PXw5gDBPNcpmALT2z2Id67XbOdVvtjfOOdNo9hVd4x4gc4SCWt2gNGhN
	QgNajaeg+QRsFtTdeijmvJhot/7V+jnrPL32rNXjVzX5Mo2O8DWvI/fatevdfHbKPds4aW1VB9Y
	QGqlvENymh2Y3Y1eyxxh9pjDiNO7xFuhVzrEAdm/PE9dXUEKgAHVktaBE8P9KAziVeY9sWYfCvy
	KJbX13wglU5u17x/zaO5Q2D/LKs8hwgL7aFu7nq7UbHrmGUL5mLI3RREiYOfVBy791rJ4NmTImw
	72SVECTVgpbESrwUXWux7ffqClBXpdhG4PsnRcSqdt/priQL/oWySy2XagHf+rJIodsytYFwA8S
	Tuz3h/movgdwifd2r4837QeRAVIiyrgnf5iJVXDWmiN0rJWZGiW4MAyGGBc9YkgAM0FsccVJi9F
	0vWX20Sp0gh1+S3Q==
X-Received: by 2002:a05:622a:1b09:b0:50d:a92e:fead with SMTP id d75a77b69052e-50e36c1d215mr287662711cf.3.1776936526596;
        Thu, 23 Apr 2026 02:28:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b09:b0:50d:a92e:fead with SMTP id d75a77b69052e-50e36c1d215mr287662471cf.3.1776936526109;
        Thu, 23 Apr 2026 02:28:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd24sm627840666b.32.2026.04.23.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:28:45 -0700 (PDT)
Message-ID: <fd49a3be-bc15-49c8-b006-d0c34048fa32@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:28:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
 <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
 <49a3cee4-fcdf-4653-bd54-72db73f80bf0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <49a3cee4-fcdf-4653-bd54-72db73f80bf0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MSBTYWx0ZWRfX/uhQcmXzCGAy
 g2a/lNhDsySy0p1fGxCpONb8F5XZZ6l9nNldHEMouBEZBMjucG4ghPHhYf0OiVJobliXM2qZ6N/
 rx/ztvbEirKm4KbT4Voj/wnYY5Gm//XNoFBulGaQfhf4q0y2W80XFVEja0EB9m2xCbOjiegK3cy
 751gEVu4mDzVg9CQg7h4UaPz1kH8iFXY+w2W2woHg6yYFdNhYWH3c47MqbwJzddeUeEapLqeaco
 EAq6ajG6OQ35W2kuPDiN35rRXeRqJRVbb5GDJSKSO+TsZqIvPH16U4ho9afWrOIjzZVbIiVuvRC
 YQ9gAj24P1xe9jpfstqNI57zmrIV6oq2hoZS1rq9e9BXnD2W1rcAgYO0L+FLOuFm9KGRUwQX1St
 oz6/onwpOIRp7SiKzS4v8I6tuPqR9ENcEQ1R2QR8U1CBUtYv/2Rc8P6C04jrDf8XemmallQxAZ5
 nrVUkyd0JSCGMgqy6TA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9e64f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WDzp8sBBVq6D_D8kXeUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: M3Wykyqd7xsU3QhT8pwEuuD50qHDXHS9
X-Proofpoint-ORIG-GUID: M3Wykyqd7xsU3QhT8pwEuuD50qHDXHS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230091

On 4/23/26 11:19 AM, Ekansh Gupta wrote:
> On 23-04-2026 14:20, Konrad Dybcio wrote:
>> On 4/23/26 8:35 AM, Jianping Li wrote:
>>> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
>>> reserved-memory region overlaps with firmware allocations (UEFI/EFI
>>> runtime). The kernel then reports failure to reserve the region and
>>> subsequent EFI runtime activity may trigger aborts.
>>>
>>> The remote heap node was described as a fixed "no-map" region, which
>>> turns it into a hard carveout. Replace it with a "shared-dma-pool"
>>> reserved memory region with reusable CMA-backed allocation, specifying
>>> alignment and size.
>>>
>>> This avoids hard carveouts and reduces the chance of conflicting with
>>> firmware memory maps while keeping an explicit pool for ADSP remote
>>> heap usage.
>>>
>>> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
>>> Cc: stable@kernel.org
>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index 988ca5f7c8a0..420219823496 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
>>>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>>  		};
>>>  
>>> -		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
>>> -			reg = <0x0 0x9cb80000 0x0 0x800000>;
>>> -			no-map;
>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>> +			compatible = "shared-dma-pool";
>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>
>> Since DRAM starts at 0x8000_0000, is it intended to only allow this
>> region to be in the lower 2 gigs?
>>
>> (it may very well be for some historical reasons)
> yes, this is intentional. ADSP supports 32-bit address.

Okay, so I think this should be one of:

<0x0 0x80000000 0x0 0x80000000>;

(where we directly specify the DRAM start, which may just be form
over function)

or:

<0x0 0x00000000 0x1 0x00000000>;

to cover 0x0000_0000 - 0xffff_ffff

Konrad
