Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77D3AA1B6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219804; cv=none; b=U/9tf7Tiw2HQhaOquoBAJzYxM1b4FtMMK8WA73bB/+Llasu8C5Ke2ZDxoB47mqmeI1oavsWPxDQTFj7xI95sT22yGH0lslNTbEXMBfryJsS41G1MGijmgwhj4AsG9FgqWabAXXcw1+knyFO+Y/KRIMuBRASRK4tKnKaFwZj7efk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219804; c=relaxed/simple;
	bh=iMbmJsNaLLeTIxlQ1jOCqp4Vms5UQzlYStW0ICCyBfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOzgTZ10WaU31clHWnvn6bQyV2EjSsf/lerRu2WSRkD70P7D8DWoJ5rc1a/Wzi44Vr36GqjibIgw5XJ8jZO+aSkH/mSUUmvA8RXKD9eak5xzu517rZ6QSN4+PVfkYwE9ydMfeW7prno2Y5MD0iRdollXeq7FzgW634pOz9vCOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7hhTgZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mv0HHIe8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7hhTgZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mv0HHIe8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3aWRM1303407
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoAsJknaz1GZDs6X/7eVr0WT+lP7Mxrr81WYawWLjWI=; b=p7hhTgZ0XbOzLnp5
	qQOeVXZfkI7wEaV535YXAhPf+Mw7QnnKT8tVPb8BPnebApD94+VRXdzzkAnoQfKx
	Y4ncEbgI3iz31xswL9y7pDNDvCgu+Jc7ZuVNgpXP3LvSk1qCG/wFoCxR+hP+9cJa
	SLFopooinDe4pGJfERt/U082g+mMm+g6HifnbBloRmtNTlFmX2OcJ6IhVvYU25Nz
	4yMMAeja7DBwlAVWWRjLHLJjrTZi2rsrmUDjQ3EW2gYobPlJodlhMATxobpnNY5/
	HvTtzXPOqUZ1V/Gbkl//L7dpfVMopJN4SAEw2fztKza/Gmfw8hvfNpH3GCEIpI8E
	6MP86Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8au8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:23:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485d853b08so9303434b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 23:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785219801; x=1785824601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoAsJknaz1GZDs6X/7eVr0WT+lP7Mxrr81WYawWLjWI=;
        b=Mv0HHIe82fDr4+K5ThejWnTSC+AJDSPIQr/EOyPku6biM1hR15R+zpB3VMkYmZCPcr
         M6mhXrK2vrxoFVgF61fWqDgwIxM61d1G4cOVv7im6RPRqZJbXyjGh9UJiNxAWlmbB0tc
         1r0SfWvv0i2oe3u84D7z1UEbpVea476++4gfn5rLQ7LSBsHDHBf3EhYcyrrx6yxMXJVd
         vCMMTHUWy/hMl6WGBG8koWvcH/gq/cjZ0Tj61JdfUBkT/VsNLgl2X950sdpJYIC31x5I
         uUX/mN4w1rCwin6u6DAJCKY1MPQfUeFnd94L15e7lRq2e67ru7u/Ixpw94j1YYtdHGwu
         XfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219801; x=1785824601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoAsJknaz1GZDs6X/7eVr0WT+lP7Mxrr81WYawWLjWI=;
        b=G0deaS8/UT3l2cZ2LEUJxdJZrEDDP8Z9tBWZDHngqjYwaQGXGVDCR2JLef5lh5gdCp
         jII1WPNiVkaU0f7pHnZg2gEWk3Z24y0sg1QU6nS//PDrwbymRuvWRjyxzWr3/962/k2P
         Evl58SGK4DXMRkhDcaPHn5hZsBfhtQQmjfNu+69AuCOYd1uNqhIG927AWBusMs6tz5K9
         0qW+D7tC0hXOnnLGvHcqCQVLsJ8yIuzPA5ouwSHGEtYPgP5Z1XpSMAO7HdoMz2Yd7l5H
         CzTlBiYbHU6rWgEBWKjdWB2uCrzIaIsV4qRkv42h62NSfwxN3cHXOeK49McostKLJkqr
         iKRA==
X-Forwarded-Encrypted: i=1; AHgh+RqKELvetvD7o6VZC3LgJjkn/xYy7cHy3B+20+WXDT7DYhQjoASoZolhnEnlvBPRBUjDpNvqUkogxhON@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4gBDRMDBofWPL9dy24tHvh9gZ2nDltNJ2rWsGpUQJe4XTXRqA
	obBAGtvWH34apfNFnOmEdLMfyqxjHKpYuHCYuzHJkHs7L9jTjAG/BOP7h5TwAlQL95Xhe99H0Fo
	Wq4Th2FLz1VJghbV/pwzrJvnRPSe+EaZofn+MoSvT2Mm6rkDq1V0qSRjzes3NFRMU
X-Gm-Gg: AR+sD13PEfcP9wt4b5VPPM5M2d33RxOYQAaYTEdtU/Zt3PlLm9K2l5UAnK5/i+JkP27
	zDN3jmTUrABCzBfEnOHZFCh4gQveaEFfBWdJVQ3pC+aDmOeZ2X+f4qGFn6+EOlzlSx9S4KyIg97
	CoU6h/cxCTIrStz1aFCF3Nim9ceqvENF0IQg4jbaiw45Rt7z5p3UIbnYEYnUEzF1NbgtLkuniwH
	xwzhpOjS80zQYoWDFFAg9R5ku3OeiTukL//ok5CQqis2czt2knUuwnZPwl19ODO3FPxNYM8z9nV
	nCDzH+sxMiYWV5yarG63Xc+nxQ0PCi8E5nSjAKOpJ6ftrVb9QUYjAwD4mBxknJH6iIqNaEehbyT
	Uo8MVxaHZsTxuqP3Cj42VJbolHOd22YklYw==
X-Received: by 2002:a05:6a00:1795:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e9311d07cmr1184825b3a.13.1785219801110;
        Mon, 27 Jul 2026 23:23:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1795:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e9311d07cmr1184791b3a.13.1785219800627;
        Mon, 27 Jul 2026 23:23:20 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f0fdsm3925209b3a.14.2026.07.27.23.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:23:20 -0700 (PDT)
Message-ID: <d038a86a-67f3-4d2a-b034-7b80f3317f2a@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:53:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-2-prasad.kumpatla@oss.qualcomm.com>
 <20260724142917.953BC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260724142917.953BC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfX+7TGCxUox+Zy
 eSn7PuRGCwjiJORao1qMO0rGjHLD1WrsBaRyfxSn82qv1VlD6xd9dNfJymbY7wBaytMkkvgnSxF
 QPUmUeRxvBEV3gEUH5tHzxSg4AxmQCg=
X-Proofpoint-GUID: worqkoX_pigwniuD6ECoyNBppd5sBrk5
X-Proofpoint-ORIG-GUID: worqkoX_pigwniuD6ECoyNBppd5sBrk5
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a684ad9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ug1fvlQovbtiwNzuxlkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfX6vDBFHzvRsoP
 8mX0dh/gE3PNIgfPzMtqAnswpE2noSev7vz4NIbLpy1qW+I1W5ZPo9Q4DwHMoD5Rqnf3j+lKKxo
 R5Cf+s6XLYRjPFBZHWldfuCQcKFI6CjH1UnJCUqlDL6bvYsBMzlnYVdiZbvFdXtSIQByuR8Xx0T
 /Z5z9vEqwFMlE1IZ/8AqW2qDqCytld0lVs/usfIPM2bjn0gFvMkg8uPICXUSzTM1Jo2TGHbF7WT
 tTWwrIkm2wHajmO4Szu2RaeCy8Y7Z7mhPsfddWWujH052PIUdAa8rPAGfQ/fvHvBWU6KZ+zG50t
 AudI/krKeGjEdWyviA3luF5QMzBuaCD7HSIZ6NE99KLHwIvh2QUsq2s4jfLCl0wUA2bU+331ikA
 HBxNaHANJ1/mpj7//caKQX5MrwKhsmqSRNDqKQhQY3GxsHRCDNk2Xtp6PLLqkARKH46naCQ9JHm
 RXaPqRkcZJAwrvXf4Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280057


On 7/24/2026 7:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Adding clock ID LPASS_HW_LPR_VOTE (104) without incrementing Q6DSP_MAX_CLK_ID in the clock driver prevents its use and introduces a latent out-of-bounds array access.
> - [Medium] The new clock ID `LPASS_HW_LPR_VOTE` is defined in the dt-bindings header but is completely unimplemented in the actual clock provider driver, making it unusable.
> --
>
> --- Patch [1]: [PATCH v6 1/5] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID ---
> commit f9999fdb82c99c4b2b674da0fc47d8921c55373d
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
>
> This patch adds a new clock ID, LPASS_HW_LPR_VOTE (104), to the dt-bindings
> for the LPASS low-power resource (LPR) vote.
>
>> Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
>> resource (LPR) vote through the PRM interface.
>>
>> The LPASS PRM supports a resource voting mechanism to control low-power
>> states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
>> clients to request the LPR vote using the existing qcom,q6prm clock
>> provider interface.
> [Severity: Medium]
> Is the clock provider implementation missing from this patch?
>
> The existing qcom,q6prm clock provider interface doesn't appear to have this
> new ID wired up in the q6prm_clks array in sound/soc/qcom/qdsp6/q6prm-clocks.c.
> Without adding it there, clients won't actually be able to request the clock
> as described in the commit message.
Thanks for review.

The corresponding clock provider support is added in patch 2 of the
series, where LPASS_HW_LPR_VOTE is registered in q6prm_clks[] and
the required PRM handling is implemented.

As a result, clients can request this clock through the existing
qcom,q6prm clock provider interface when the full series is applied.

>
> [ ... ]
>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 7b553a73bc928..8e04106d48be5 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -236,6 +236,7 @@
>>   #define LPASS_HW_AVTIMER_VOTE		101
>>   #define LPASS_HW_MACRO_VOTE		102
>>   #define LPASS_HW_DCODEC_VOTE		103
>> +#define LPASS_HW_LPR_VOTE		104
> [Severity: High]
> Will this new ID get rejected by the driver's bounds checking?
>
> In sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c, Q6DSP_MAX_CLK_ID is currently
> defined as 104. When a client requests this new clock, the validation check
> in q6dsp_of_clk_hw_get() will fail:
>
>      if (idx >= Q6DSP_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
>          dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
>          return ERR_PTR(-EINVAL);
>      }
>
> Since 104 >= 104 is true, it will return -EINVAL.
>
> Additionally, if the new clock is wired up later in the provider array without
> increasing Q6DSP_MAX_CLK_ID, q6dsp_clock_dev_probe() will perform an
> out-of-bounds write because the array is sized based on the max ID:
>
>      cc->clks[id] = clk;
>
> Does Q6DSP_MAX_CLK_ID need to be incremented to accommodate this new ID?

This is addressed in patch 2 of the series. Along with adding support 
for |LPASS_HW_LPR_VOTE|,

patch 2 increases |Q6DSP_MAX_CLK_ID| to accommodate the new clock ID and 
updates the clock
provider accordingly.

As a result, clock ID 104 is accepted by the bounds checking and the 
clock array remains correctly sized.

Thanks,
Prasad

>
>>   
>>   #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
>>   #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
