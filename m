Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877B399019
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760174; cv=none; b=bhPJpgQOVbw1VUFltGMnTS8Y0WyiWxpcvB2DdW1itRYGqHElRbkeNUeDOfuuFCgRGkMgKgHCvyn7OVHyEFNZA7oQ/y/89muol2Z6zSgzNx37RLtfzBaAlI9DZ7V1/FixnnNE/dFLuoBDwbzAWE8HUtuB73tUXTUEMM8CZsGjLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760174; c=relaxed/simple;
	bh=PkWMnzjrKecO2svbBQnVSp7W4EQibMpw7S8p7SZb0xg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pmrHmECvyMB+dMPHHG04Sekd85Q1lUBaDlniI1aOzWGydGHcgFSR1DOO15KkJbN/aNUi+WDd25pUh99i9udd60ut81cUFKqKw7dAtLXUt4JoqV4iENqwzsHFCAmp+OMi7hoOwpmQCoASrldeEAkC88J1pymzX/bokyo424XXf7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MP5kkdzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egwjiMzU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MP5kkdzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egwjiMzU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L8LH902281656
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiVtU5gmBM28dpc+mHAbZrBSEi0ycTtyt2r9qTzHOkY=; b=MP5kkdzV9Qkid6hn
	nFU+eO6P6364zuxqGomA0pPfZv1IkGpuzDPXL04EYfmbrq50Fyuxs/XbTKEH8T6s
	XXGpB+ch6ZOYOxs+8x11otyQbGeVj2jCG161fLm6KfX4blquRBHDomDRLo72klcK
	R3RqnyZbKQrdK4TRW3niwPWTIrMMFFNpwOG1/+mFl9cQqPCVsgYKpGNwlto0fDpq
	UwpGZBCgboPyw5BisNR1Q2d5RPlp32qNVvtmZnBuqIsjw1eJ66w7lmJaXAKAD3uQ
	H9DGATDDZ5P077V+rvUe5Wfhpr2P+J+0CAAUmQFy/9Kz9S6CL7miuczwbbUkTvIp
	ra1J3A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh59ckmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:29:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f71437218so2547618b3a.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776760170; x=1777364970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BiVtU5gmBM28dpc+mHAbZrBSEi0ycTtyt2r9qTzHOkY=;
        b=egwjiMzUoWjan4dUA0AQ6CCel+lmO8iCvDbSD0lCDPN1urevTJaXnSuQAfySIQ2/MZ
         Drj/2I2D12OpknWOUWraaK/FtKkmcixNMLCVGIdphtW1YScdvNw3AMksa7Ofg3Hr5caN
         z80fN8GbTU26AOTbLXw4dqZzHbddqadOe8S+J3XRXCtGWfh75I2qwdILZ2PmYJqztHca
         LWXtEuvB/aCTZXtvy3FQgY9kOm01B7kPW1zZ9p/Hkt5GdV/gTGDYlWs8dONfc9VcbGfl
         JDiEqb20++y18UMx0wPkdc8CoHMp7uaHFyM8NnVrtX9MswOBBTThcjqDkYqgF00+QKZs
         6+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760170; x=1777364970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiVtU5gmBM28dpc+mHAbZrBSEi0ycTtyt2r9qTzHOkY=;
        b=iLd2B3ivdFX1vQ3gGppEsSYb6MQ+pdvIs6BTFfBGGQZzeT5MZ4fWk8xYSfqeqSzbUU
         IZEmrR/qU6mSb411HCPrzLGNTMqtvaO7UTUxgxgbv6azlhkKzIZS3KzjslG7ZoYKqxUe
         G6Oq0zJC34sg4xlmv51++lWIv1hnoX6K9dvJL1/y1RsiniUGPp6f02OzkLRxW/4rvCvp
         sg9dmyEmE0tbn8EZMi0I57ShFWDlvdmLQlTYXVm8UlNU8fID7+xMbYzNbFK8u/P4e+cn
         cCaE/MDY2VXBktcPhWmkO6IGGv6uWDN1GcS3f5VgOGIp2d1LjwFS8cfHaPzttxfGrrJM
         8XWA==
X-Forwarded-Encrypted: i=1; AFNElJ/rA1DsmhbQW7HsFAcH+bvXyPxFJg4K8gAslmGxuJacqPkyQv1GJlLKyK6fhor4QXKUnF4+SSUEn03q@vger.kernel.org
X-Gm-Message-State: AOJu0YxFOGMOfWJTSKSQEWQcmC8hYX6ZcMS0HdQexb5U/eojW9cAHbiB
	eG44KwUxG4LqPwBwuuoM8HIgP/JTYlgkLwNHy/MfVxR4bC2AYA+iwgscxO/UEdf9Zj5Ow/6+KSi
	Xx0wkOwqCye3YjqgeOYVpOoK6T0c9bFAMWpPv8Zt+YGRly6uT0wAvu2NQAsiPjFKp
X-Gm-Gg: AeBDiesukNlTBGVRg0JCuqBKSYq7+6tLPXvJ1e1UiVELwVz4Nsxko3G0MSqXeLC6CM4
	y7VTpigWK2JVGShSsegZgV4Mo9MNA8ghFm0bsNtYDtbPff18tDxmlNvV32hC7aTjPfYXSRy19eu
	F889qFNcg+nhcKUBVNcg9SgO21iHjM5digiwZ/+tolE8aTkAmE5vvCBgcFeT0hQPHRsoCyrW6Du
	s+zvmSxaKJYwoxlt5dTlg6qCVmUjbUMHGNHdRdvYwFhB57pTrLJlYMeG11RnxZP/O2+Gz79Omqm
	Iuirc6L4XeHgUV+xB+6vabzLEbz8xxqID4qRn6rgShPRUopQE/n9UF6Ndc5VwuBQRe530ItBtSf
	Tcg8d5jE6tmCk3RoMXnxrYD/IZu7Lq15WKgSPPpniHBNjDYc3mgSf+nnsT5Ja
X-Received: by 2002:a05:6a00:2ea5:b0:827:3914:f130 with SMTP id d2e1a72fcca58-82f8c99190fmr19190159b3a.36.1776760170012;
        Tue, 21 Apr 2026 01:29:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea5:b0:827:3914:f130 with SMTP id d2e1a72fcca58-82f8c99190fmr19190124b3a.36.1776760169433;
        Tue, 21 Apr 2026 01:29:29 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbcfd7sm16101796b3a.32.2026.04.21.01.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 01:29:28 -0700 (PDT)
Message-ID: <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 13:59:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        quic_chennak@quicinc.com, quic_bkumar@quicinc.com
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5k9whTQD5U1mnWeCl4501wpfTeZrkXVx
X-Proofpoint-GUID: 5k9whTQD5U1mnWeCl4501wpfTeZrkXVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA4MCBTYWx0ZWRfX1o2C+zoNF1Qf
 G9/4DrcLK3wwMZ77of8hsQvWyZoNmHIut3jzOBQJv9aKVTeek9sIkiPa6ri2e+OVYkh1U6w7a8g
 r7SBWXZashJCeiM7ywhB8MBuly4Juc2hb2Q3ZXR+YJtNNFkAMa4DDPwTdrgAGrQyRjrNkZKzmvz
 gjNcNg7/HynIxpbZFlFWvtDtWR0L1iWOmUqemvXxCQM1I7JFghj+BoNVIajB+dZ6nJIzVXVTGYf
 KX5JFVabtV2CHpFQpe4I6l26SaUHdgq60MGFadxu5Na4f8A9KGghCyWuwsGC2QUvtDTd1psIx5j
 JyTYkBfff8oTt4cB//dITieh3yNGsg3JvGNo1yACRHkYannkHk8715Y4JFpOpzxmNXO2boCfIiB
 Pl3ZAOU2vmO3V6T2GfBJiVOe9633+tSL5XVnIn1M9B1tOZJH61LYOdHMFpw3915wu7vkneolsbo
 zhO/wGclqDkY8nYFNDA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e7356b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Gv3PURsRAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=OuZLqq7tAAAA:8 a=GXihVLZcTt7kJqBTt3IA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210080

On 17-04-2026 20:45, Ekansh Gupta wrote:
> On 15-04-2026 15:22, Konrad Dybcio wrote:
>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>> Downstream [1] this region is marked as shared and reusable so
>>> describe it that way.
>>>
>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>
>> +Ekansh some insight, please?
>>
>> We're giving away that memory via qcom_scm_assign_mem() anyway
>> and I would assume that making it not-"no-map" could introduce issues
>> when the OS tries to access that region
>>
> With the current version and the upcoming planned enhancements, I don't
> see any major benefits of making this as not-"no-map".
> 
> With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
> entire memory-region to lpass VMIDs. and un-assign it only during
> fastrpc_rpmsg_remove(). There have been implementation in downstream
> where this memory is dumped in case of SSR or audio PDR using minidump,
> so marking it `reusable` might make sense there, but that dump logic is
> not added upstream.
> 
> Upon checking the DT, I see a bigger problem here, this memory-region
> looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
> Please correct me if I am wrong about this point.
> 
> [1]
> https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
Just had a new finding on this. There is one more reason why it is not
added as no-map in downstream. This audio PD carve-out region is not
defined for most of the platform's memory-map.

With a change to qcom_scm the memory during boot-up, issue was observed
on RB3Gen2[1], where EFI firmware was loaded in the memory region which
was causing boot-up issues.

So defining it as no-map might not be correct and it might need be
changed for all DT files.

I don't have a history of why it was added as a "no-map" region on
upstream but looks like same has been followed for almost all the
platforms. This needs to be modified based on the memory-maps and the
region needs to allocate memory in a dynamic manner.

[1] https://github.com/qualcomm-linux/kernel/pull/487

//Ekansh
> 
> //Ekansh
>> Konrad
>>
>>
>>>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 4b47efdb57b2..13094b5e9339 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>>  		};
>>>  
>>>  		adsp_mem: adsp-region@f6000000 {
>>> +			compatible = "shared-dma-pool";
>>>  			reg = <0x0 0xf6000000 0x0 0x800000>;
>>> -			no-map;
>>> +			reusable;
>>>  		};
>>>  
>>>  		qseecom_mem: qseecom-region@f6800000 {
>>>
> 

