Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C290285CA4
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934256; cv=none; b=B0bhWCs1JavMVBTbX5bhGxYjzQP+M53zAKQEFEcj8QEptfcPzvEe+omN8UTXaRUaIg7F0bn6EEDvpjV2eLD4ewxCWrTMeBU9lc3kIkfKWwrctogJj0EnCNOvq8d+BzS0RCMXyJV7tHVG3N5GRQFDE4BdOXX84KqPDsUmtOcND7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934256; c=relaxed/simple;
	bh=TaRFLsaB+uCdy6/Ybg30L74kgNjYEqc9+CZIoq+2SuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khREEkMxmBpvpbo0++cYFPq1vHlYHWslGF5PI3hJC5LASeARUE84/SWh+XJ+nYrUAlB4bgvj9FG87CcU7Aszi5ZhLrOaXakn/RWFauuOo5VmXMHgPrUbDu8Z/0zzmekJFoe628uW/z2NUXUkA542fqZ9TcScBKczD7uOalxHpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FHvykJcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvSgEQlj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHvykJcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvSgEQlj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3fFG31230225
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rm3WwHocTxr9AOinWei4IBwaswTjfmqTJZrZM1lfrG0=; b=FHvykJcRiJJ1/rCp
	pp/HXEZwn/FRZm+x/F3f3xINFLxNLR13Vjmd0qAGUwZmrIimUmZkyLprf6V27QFG
	M25W74M7HV9APPhRdq7/DyLTRccWP66VhpmD6XYKcfZ/gXyfiDKGpZ+P5gS4sgRl
	E8K/YP/0FG0lei2tRlZ6EzVMl1zKRW90XYB8N5aRMtR2aXl/8qhOaPFPNBqBh/91
	k5jYSblxLa7l1XkNsXmOO0xQPb8N6s4eBw0+5clF30tUv1vnlN9XsTeW15ivfg7k
	ksDpDq49whduDeHzC/qhp4w2+A9XW5s/4ThfouUvNvoO2hDbDzRmmu8DkGbiWKBs
	Ijqg1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6b23p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:50:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9f1bccd7so12311731cf.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776934254; x=1777539054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rm3WwHocTxr9AOinWei4IBwaswTjfmqTJZrZM1lfrG0=;
        b=cvSgEQljMDeyQhINyD8XPLQ2wN3y1GEK3VbW5b4WvAyJxZys4Z6znuxjNvcs242Dtq
         O19VQS2vTTxjJx4PyNUx5brT2L8MQPFr4fD17gtCVZ0XleuwjKogjhHDK82vAZcemqC5
         byDvqoPvujh4rGkYnguHevhJNwS3I5v5Odtkkpj8kWx5ck1kvMgr2yc29SUMFzjSlLFu
         do7qRUNsf03Wrb5IZlINqb8Hoysw0goVJ0igt4ArntbBDTdAVN4mTMPW5fEeIsQe/jrx
         gapDG71gxIiio1YiysawX52UrQC87g8zovXSFf26imcXdC360RhfzxmTR3EryxcwZ5NR
         usuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776934254; x=1777539054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rm3WwHocTxr9AOinWei4IBwaswTjfmqTJZrZM1lfrG0=;
        b=mznMBioKxNVrlK7ZwtCllmX/j2C36WuDXMP8NQiNrMXMN/YOW8EUCtSQ+i40LWOC2Z
         BELeAWUWGFu7Knk7t9+JPA11oAK/70H5CW4T9OOMM8ia9tji7ffVh+1xMnDs4FaMHvmj
         FMQF46nwJf9cFSUSy6sbVsq+ZkDnfjqd69aunuTp9wjvfCPh34DB/45IG9hNIL0aV3xR
         7z6yku2X19ON9Jiqo89H8bBLs1CAxXu6xmYTd98ZJgxE3d4DJC9+Lm3m3Rouv3HzTW42
         JW0rxW7OKkOeCG16WtKl8JxQuvFJPFlY9ClY4RSxErJ3tfxHBN/P34X5zZp+B9X6iHj5
         5cPA==
X-Forwarded-Encrypted: i=1; AFNElJ8muTN9GPToVFy5Ndg5+i6VmGewxICqsXb4uLFDI5Okt8cz5ivEOVl9BkrGLP0Vlmpa3Jn7UfqnbXFo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23ITFpl0Xzw4nfDY7uQIU58vFWOcprQdG8Oy5/nY0hMO02Xwm
	ROep5FccSAhoytoeoa7CXsv6vGm9vCMwEQ6DJW9PQ6KKfRzteiC3rrV3L7RDl3flWHj9zMG+/35
	fzZBFmpJwuleBRgpGUau2O8gldVNZwltmefDdDldzBmbdLmjGDaNnFGYwr0XIrsX5Vvz47rhH
X-Gm-Gg: AeBDievwssOcDN+8k6QLd/Tp31i+SexaNdwWpacj/cAIwSH8f+v7r/gDO8KOoZ//xTQ
	mhiXGHkcuqJmDv2pi/dyZXKLcEh7rfulpxdIZ1n2rNNBynwArAfEcyfxO4eqew8BsxVdgv5RLXT
	WT2Ngu7WsdRMkQd9nCpTeYp6McuqZ6+y9SPOaCAfplFCnikxYhHBLjRB+v5lPGdEvHSNMET/203
	fP16rBuE7Ho2kNHHAXsJWqQJ7Y1mTDr617UpCPMkflnqtgLKtBYBDCwclT48pfIIet+ksCPjbch
	d6QJB+KOTvLcOF4mzVbFQw/f60q/JJ2XOmF0KeWQFrDBAu/XY2lmM0yGe4VvxKDohu+LoZN94aB
	uRHe+Swq3B4jDUuSCqFt+dxu4dLxX37MTVP/GPzgY8J1NDHhXfv1V6MRoH+7ISq4qfGaEYzeSKd
	hLo44lhcIhkcBb5Q==
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr169975641cf.8.1776934253743;
        Thu, 23 Apr 2026 01:50:53 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr169975491cf.8.1776934253275;
        Thu, 23 Apr 2026 01:50:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553223bsm635852166b.55.2026.04.23.01.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:50:52 -0700 (PDT)
Message-ID: <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 10:50:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        stable@kernel.org
References: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e9dd6e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=avSy5VQ5IeNpoW7ryukA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4NCBTYWx0ZWRfX2hp48f28hb5J
 piUbjxDIicBYiAfieoYACJEoUeIuzbXR7eGdLIkttlqzl2+rtwcZpfP2laqarh85+1dCYri+PVI
 3qNNkiqtdrRMfnA+Eb/ifuuczOzLneYm75LbbjXdox9gvi2vTCTGLng3Dh0uPSmGfLgb09tTe9G
 Dy6rlQVyppH7cLHDgxQ1IWLb+65d8rsbsDJfdz0n7Qmyjicy+cBnp1h/aedJJl7FxGUPZRpixyR
 4aU77P+ZWyAB7tE2e8dC/WPXDmHkcidNG4yicG1x8Es24ctGFQYN8yVgSclJc4EcfN+l/ieXasd
 ITLxd/vtEPPd8s9yrL1MFbR6Vmg75ruIKREAc49/Z7FV+FUTkQOtG1dgQFAhhm1yemVIF1tFtWh
 JM2eSxY+hQgABX5pjNSYRoPLiwjTqXjUAHCo0dABMYU0+zTcuHISG6QcU1pZ0efrDY8jIHzulg9
 BWCQk0ICxoegD99F2sA==
X-Proofpoint-GUID: pU-XfiUwn0gK_rz8mpeObFXpKq7vfqgD
X-Proofpoint-ORIG-GUID: pU-XfiUwn0gK_rz8mpeObFXpKq7vfqgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230084

On 4/23/26 8:35 AM, Jianping Li wrote:
> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
> reserved-memory region overlaps with firmware allocations (UEFI/EFI
> runtime). The kernel then reports failure to reserve the region and
> subsequent EFI runtime activity may trigger aborts.
> 
> The remote heap node was described as a fixed "no-map" region, which
> turns it into a hard carveout. Replace it with a "shared-dma-pool"
> reserved memory region with reusable CMA-backed allocation, specifying
> alignment and size.
> 
> This avoids hard carveouts and reduces the chance of conflicting with
> firmware memory maps while keeping an explicit pool for ADSP remote
> heap usage.
> 
> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 988ca5f7c8a0..420219823496 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>  		};
>  
> -		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
> -			reg = <0x0 0x9cb80000 0x0 0x800000>;
> -			no-map;
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

Since DRAM starts at 0x8000_0000, is it intended to only allow this
region to be in the lower 2 gigs?

(it may very well be for some historical reasons)

Konrad

