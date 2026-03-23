Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9C1FE44A
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272473; cv=none; b=NcM30F0ZSOpg52wSOLLRIK494XMNufmKCH6Ywb42hCFzWdYzGIA7zvlSUvcSsrFpYImcEHBu3KHixkO0dJEPmj7HK4L921JUjotUV0GtPScbwDbanYaUaN3jd0sGrmp93/SGsLdUaYNYi04rr5vj48B/Yi1a4meILU34xyW4r10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272473; c=relaxed/simple;
	bh=VixWgMOvzZAdMZParcQkGqzz2G64vxIA/OfvjCQmY8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xh5e9UJk48vGbL6JWqxlWFvuPUj9tzYdwqw2pIbRF5U9DqYHeCdM2BUfzu/FIblQzeNBtHd7qO0jpEHYPa3DdLXIEBQqIJO+PtJm74vA1myUFPOr/RLtLvJXlFx7ynngub7U9NBLwXlkKWWMRHE2rPvIcW0cQfeFT6RW1tHbdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hP/ADASy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=II5iq/CP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hP/ADASy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="II5iq/CP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83oNK1364149
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2bTapgCUjPbgxkm4GqsyGa0VN9L63QkzThqqt/kEdM=; b=hP/ADASy5lo6PDNt
	PP0xIxnKLZh2+XH6dBRVYTKSzuyrKhcwnC9M17Xdl+t3sTtia1yBRsknaNYwW9GK
	Ltqqt00Mo8WycLS7JgH5eL73aJd1oRee79G3zDFKE2ggdD6k6pyFYTXcb0TRBVG+
	bN3whwnHIMxO1o38JFLrqCQ9QlEspb4Xrux8uEJQEkzx5qDE0GuaYNgIIfPWYE9t
	IKqnJRtlSJ8moQSfE9zuzS8xnYJCojwKQyWfEhEQQYzFEuPupnCnJUnMOL3sMWQi
	HJyOgCKAWTXqMdyT/h33c5EOckemHdtqlA1eV3YpvEcLHkCpPhWE+xsk3dLHK1QV
	4EPsHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p794d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:27:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0554888cfso2327175ad.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272470; x=1774877270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2bTapgCUjPbgxkm4GqsyGa0VN9L63QkzThqqt/kEdM=;
        b=II5iq/CPu6bvabLnsdbnXJQVLTsf2XLSsffi2tCAt1yM4Ihn/p24fPlQQQsBHO2/3b
         IMO/ta5OR3lel6/EXCkfdyf9WHIxy9flXf04Oc0KoJ/oC1p0RsfzomE5p/QUBeFftpTs
         Z5loCDpQVOaXXx5lm2+KnUi8AKiQ0yJWPux97gPvSJYpnCnm//FQCFCfDNM2wTbw/ATE
         m23poGWS6/uPFK57SoxuNiZwnuXqTHCCcxp/mpQhqZS0VCSjtEoV5grFBaIzN8fYlwTn
         4x3HWgf6u9G1mBLwRdfQ2SL8uoedmeNNdF7XYDcdD2QwcRSZefEVnlZ9ucofwDkskssH
         99Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272470; x=1774877270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2bTapgCUjPbgxkm4GqsyGa0VN9L63QkzThqqt/kEdM=;
        b=Q3Cx3/EmrIKeovJjcGz7b6RX8ZrFIqlKEdiG4C1KlQ98nVTIDuih2mhhi9rPiZKrPM
         h6zYo+6gMDxsUZUy07KTfmyvT5/B+1kbHpOMUaqIsZPnNW3bv9E+lMqv/cBMF1x6tCa9
         22wnoNm6NjhYItXGVBxxEOdRjWKZVSP/toDD3clDBVFqf7AGSfVoop+5KS8/ji7PUz1T
         Jn0/XRv9gSDQxcKltlw9+q7yo1B4z7T7ukhLGAnlNbVdsjg1qpX8qjUsDnngigPjCdG8
         z5bh48i0oGnXTopzQp3Z03jFsvUQJccKlTel9Cv5jhYMHh24IVuZnzjAKBly4L4svJhq
         FIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3XuhoXUEGKJKCgw7SzcRNNVLkifhHnTEhLa1zx3iFj+ayXQJ4J8H8Nvm9uBHXslgN6ltjlh2zfN3R@vger.kernel.org
X-Gm-Message-State: AOJu0YzKaaJTON7VwuQqhGT9Tzmwc3ACmakw2Ewr60iM1j3m1qLYKyiY
	ltuiqgUUBNaO7mqTB4N2/xF1hqhkoTKAALKG3G+HbIgHXjSdTRSChDtQpY/3P+Ph17YIpwSUpjK
	0ifvb/i0iZL3JGeCRGiRO9p5DA5l/HzWVyQagxieDrtBczkfz2diYKvM8ASak4dB9
X-Gm-Gg: ATEYQzwFsLx3Zx9BMoVFk9t7HtyXtN7vDh/bt/g7H1tlbIp44K6Xp47M/WWDgobacWH
	SXMWtynt640SDcqBnoFqBv1ahZeRN5k9Xstc1Vu6ajMzrQvqDCPQY4BIcNKrNCtctKd3C9D1HoW
	yajRm5RPWJ2fwrS5aAvToVssZ1pZcFoYTGPEpeWg1RxIy+nXeUlfOKnkgvakY1LR0O5OFURlozv
	2oI3saGxRiNaCh2H3RW8WuKrmUk/FqoTYS+FrvTjOx3Ts0LQBE0TijXsvZRbIxgaGbewdB9aYCb
	3NV+6wG38v5hzl2vcEYu+RYbesoHsznavOInoTprMmA1ltutAVuM7feNKNoVTbeJjeUcLcIdmw3
	waPYshrHMBTy7irvOOwPKHgmurRdyvUvvl7Jh/aeNGJl86QYO8JtLqQn5tkPTqoqJIVzNNASULO
	YgZ/rZoFwP
X-Received: by 2002:a17:903:986:b0:2b0:5548:7d80 with SMTP id d9443c01a7336-2b08278afd1mr97325415ad.27.1774272469780;
        Mon, 23 Mar 2026 06:27:49 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2b0:5548:7d80 with SMTP id d9443c01a7336-2b08278afd1mr97325135ad.27.1774272469230;
        Mon, 23 Mar 2026 06:27:49 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836b15fbsm144412615ad.81.2026.03.23.06.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:27:48 -0700 (PDT)
Message-ID: <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:27:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c13fd7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aLVIdYt9wyNXebfZDecA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: bE9KeSd9sQMFmXjNtYHh7ElhXkPkYVdw
X-Proofpoint-GUID: bE9KeSd9sQMFmXjNtYHh7ElhXkPkYVdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwNCBTYWx0ZWRfX7TOSKqFCxSmW
 nuuZVcqXPfGgPRJsd3z8YLzExR/2wNT+fNnF5VU+oatKQIMs5G/1I3mS+09jK87dz48eCAqbSOb
 kv/aTZhpNjpmcMdS236ow5/o6XE+OoPHRE4zvuBLtuQlg3T1Q2btlm5JZQqbYdxGPjmUThTsV8t
 MkJ4I01PtNhNCoO84B5I7ESaKBwiCxTAc08s0ExrKY/SCWi8H064neGuY7CjBo7raa1+/GRGEuz
 sPcBnkjJ0k1hTetmQLzmIf8btsNRemTE42opCe9MOEpzH+RYLM3kAD4IAU30T/u5xOkpaSuIXXB
 7Tls0Jb/YqS4U5a9jCGhB7QVbWWCpsp/+T/BHhpduSStfIpgrSgUh1VoLpvCKgssYWqRWgN0HeK
 5ZvOKET3HH+gKk4mc74Uqu6W+gROBSKhNpbKLTAgxw6VNk91JZmtSVNSj+6sQiNIWRkE/SC32fj
 xXo2iGpWWyVFIErLVsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230104



On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
> On 3/23/26 1:30 PM, Jie Gan wrote:
>>
>>
>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>> Changes in V2:
>>>> 1. removed two cti devices due to GFX block is down
>>>
>>> i.e. "because GPU is not yet enabled"?
>>
>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
> 
> Do they need the GPU to be online, or a clock from GPU_CC, or
> maybe something else?

We need a specific debug clock inside the GPU block. The debug clock 
only can be enabled while GPU is online. Also needs AOP to support 
enable/disable the debug clock.

> 
>>>>      - cti@11c42000
>>>>      - cti@11c4b000
>>>> 2. changes two TPDM devices to static:
>>>>      - tpdm-cdsp-cmsr
>>>>      - tpdm-cdsp-cmsr2
>>>
>>> They were TPDM instances in v1. What's the reason for the change?
>>
>> These TPDMs havent clock source for accessing registers. We only need enable its ports to output trace data. So I have changed them to static-TPDM compatible.
> 
> The registers are clearly physically there. Are you saying that we
> (currently?) can't enable the clock required to access them? Or is
> there a design defect that's preventing us from doing so?

It's about hardware design. Some of the TPDM devices are designed as 
static, means we dont need access the register of the device for 
configuring. The trace data of the static TPDM is enabled by default, we 
only need enable the port of the connected TPDA device for receiving the 
data.

I have tested these devices with Jtag attached, so I didnt observe issue 
about these new devices in the CDSP block. (Jtag will provide debug 
capability for all debug devices) Also cross-checked with hardware team 
for confirming these devices are working as static.

Thanks,
Jie

> 
> Konrad
> 

