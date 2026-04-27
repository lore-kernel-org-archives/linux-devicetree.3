Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDFE314D35
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290606; cv=none; b=RmggQUCGeQRDc3X58SV9g7rEzaW3PfCe+29c3twDRseYFYLvG6LayzvwL4y6MHAhPcZdB1zIwrr8wdS40wfpp9talkeUrIPyxbqO2h3pjuOlXu0W+/o78fNkmnYbyk1su14AK0ULsszPBMQzKJ/dY737/GNOBL+s67Rh+h+zexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290606; c=relaxed/simple;
	bh=sCsBnvpoC0EZUtGC3Hj6tVJSiZqQQpcGMtowAvh/1Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9hH4n/02eBmsUBDUGexGbKuDSz6Kj5x6+J+bhhE0QIkl09+3pJ9bDcSO/I+8uOeoml7PlTw4+nrfvA1wIiNm5niYZKPBvEc4Yopwwmfv8y0oEIENri/LFx9XXdT/t+ERUDT5h0sSfydnz5RyYqcOby7XoFtAaT6VdyKXzNCDjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5SieLbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSMNr4NJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5SieLbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSMNr4NJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TCLA1501572
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7ZhwAWmcOH0SM+sKrOOb1vCtR9oVbMGw7WZvBcy5og=; b=g5SieLbvpieLC+00
	EmPZR7McDiBE8evlYtHaEljwYaDQTDvcJGAXEjzVsOCuv/G5OrmyFBk6510p/SUk
	ro5tCHzzcHRO0mr+gW9jetjsFi/cRHjsaSOg4WdyHvYjD746NUDj9QzxFCQx0hCU
	2YdV76BRr4RO4En93tsYQ+QX16uwiIgEPkHVRTdgZ0PqmXmni0oL/j5sQqB8AO/M
	nJmjcedU29umNaCRh5WpLnZ1GYK5EtDajO1U+AAAh2A1JWq4GbS4fxe/JsDFCdeE
	CMCJIVOXaUhxlGo31mvLu7mILzxHYPYU73FJRozGGNhmJmql+2URnXaLFPHGSVKk
	RazwQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrnvt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:50:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso96266751cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777290603; x=1777895403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7ZhwAWmcOH0SM+sKrOOb1vCtR9oVbMGw7WZvBcy5og=;
        b=HSMNr4NJpA6ITukKcFWEjD1E03sdUjk3zgCwHaOkDwE1UqCBPYvjyzQdC1A6B4cpAV
         Dxvls6Bo1PP/4O9Y+CXbSS707GSSRGL6vNKlI1saQWHd7NE7GJUvnD7DLUrMe0iWTk+u
         bPSfGBoFQFsYLy0cC+hvffTbcA+9enLAJyeNJkU4w1XQBdYZRdUb1Jn0w2kJfRAfpjfY
         6TqeP+w2yFzvsLpIs0YoUQTxxOq7XePqIZWGjzoPrDyLs3YdMIQPSR4NLvp3u21oIgUQ
         I/+mRrdNEcvedZlTNrsSdYRLNkfC5MlhlZ8rqzwoNld57adM1C9hIMvwj9TD5oQIcnHn
         AlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290603; x=1777895403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7ZhwAWmcOH0SM+sKrOOb1vCtR9oVbMGw7WZvBcy5og=;
        b=pDaQGfZFFRoIuZYTzKPw8Uqo8IVzszxawxT1TsKwXavzFTPNCFE+u+FCxynBOT+xH5
         i3LERc7k5eQAUBucRNWNdJXl9o5RFzM+COwMjfJ0x+3IpwoBtMz4U8FIRfVgS+8nKCtT
         DEH9iyULt4AS5RK2JeTQwlei/Hz1KW+QmnlfsD12QZyLIr2fPDKE4W33HyMsO7m7TWI3
         /Sy44byy29O07B3RgUFQqOySRguvg8H+Yw2QY7pXWwNxO+8I8t9R8Dbz3OUg7aYa7IX1
         Bj7TPxtCMSHvyPeXKReU3f6aiJdGHanSh5FW8m04C6PkGCdm0+vZTvYOn6GYI4PTrsFJ
         JYBg==
X-Forwarded-Encrypted: i=1; AFNElJ9KDiX8Enw4abaFfRV+mkp9rM7SZsMa/1rIWC7RLMhRQHX1rBnHSyxD66iaAJkzKY22mAnlF9bdUfYB@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/dj9h8k0/LTBcxMms1ZTHbGm25VwyTKtXx6CFRyqWmheanHb
	8WIZjle8NTX68WsDr7s57HRGMUwd9sbBFth2sNwdVnJYB7nELfhXtEMzZ7hc2Mj34iZw8q9jC6g
	zdUqjd1MlzY5wqU32JHFam3rNUR+j1QPRC9qiBvyHXEhFmr05ncVDnCPikAdrGPUX
X-Gm-Gg: AeBDiesJQ1bTfwe1pIKBQp6L1lac83UpJmv9U8j0UU7AjL1J+TNcuOeN7RBa6QTh5ZB
	5KQ4PcjjOMGKVjpsrJb7xiEgHVDq24eRvVwCuVRzZhyZBeYkUWimS8u2A2ABWdevJ94iHLi/36C
	NXfVS83EyVevveE3oUNx5R86PokDSGITUMIPPJOYEf5pOfYtHGjyQccueJELDZlsgHsM9SM0N2l
	Eq2srn5McA5c1v8WqfZ6LFQ18cQZzBlgu5YjjlDevOccKvfqEKfPCOIv3X6ck/QQCXddIcdnfHb
	g/u+tK3KcWLgtUTTIxVXseZNtQbW6tLuc4YQHxRPgdvsFMpOIAQRdNuVvURH6/znz0UBNtz5/Cl
	HVm4e723KFweI9NzVSMjCRh8yqbg2JJHcymSgrEBL+DifliP2raVtv9TGpr3ekOw23fdAOuerXh
	CwWlshY04GQVHukg==
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr441504911cf.8.1777290602831;
        Mon, 27 Apr 2026 04:50:02 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr441504571cf.8.1777290602315;
        Mon, 27 Apr 2026 04:50:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d455ddsm6986567a12.18.2026.04.27.04.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:50:00 -0700 (PDT)
Message-ID: <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:49:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNSBTYWx0ZWRfX3GmqIujzKEIs
 hNcxlLYTo1Uc2/YwB850XzBgyFrBi1cw0T/VKi1y1aIhYfpNhJvH5aDgAgJ2ltDbgHAnzoIJKjU
 SajYwll0fYd3Um4hMxzaV/tpHwGkopm2LXQG3HFOh+5YAn/ZI6f2Dx7ojzo84i8tsGe6nJ2Z3Ox
 8IMi2pSG3JlLjCGFJWMQtigdM2nGAsT3qjOuTU2sx0rkKQ5SzkEROCFQO2lBw2aW5tar4zsSG8/
 7rsN+icvwBHr+pRYlbyRc7woVkupjtOuKQZV5odVreSHxb5+Gk7MFbDicI2BnpIef+36AKNJCcs
 4x7nVIcQhDlfTMOkfVnlFaHDTc6OSZCs839JeobHHVdr25w90zVhdVhKfhmc1ZQbbjM/nejV2Q6
 4/6GbC76SNR+r+V1sF72Kz4RdzB8AKenSflWK8tBI1BAHeJowVNZTPtY9wUy7RiJFmeAWPkmkPO
 QKjE+M1zKpp9607kA7Q==
X-Proofpoint-ORIG-GUID: f6QKVvDZ5udv4-2Z8An7PabjV-ohCSxj
X-Proofpoint-GUID: f6QKVvDZ5udv4-2Z8An7PabjV-ohCSxj
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef4d6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=8KgiVX8ZtaUODci2sxMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270125

On 4/22/26 5:39 PM, Nickolay Goppen wrote:
> Downstream [1] this region is marked as shared, reusable and dynamic so
> describe it that way.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..36b419dea153 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>  			no-map;
>  		};
>  
> -		adsp_mem: adsp-region@f6000000 {
> -			reg = <0x0 0xf6000000 0x0 0x800000>;
> -			no-map;
> +		adsp_mem: adsp-region {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
starts at 0x80000000

Konrad
