Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3053F0A8C
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969055; cv=none; b=kFW2qOu4om7yr94APRdD4PlMEn3jpzRzCOjMjD+tgNpNgQU/AugsEpvRN5H8IcZiRDZqR3fk/TEySHJvV8jvCxfiZwSXMoHYxI6hAuf5K8u8RV1eHluYQoSUrt6ZItC5fg16s/kEzxLpwGYMnVsGJg3C/Arswswe8ozuGUmlhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969055; c=relaxed/simple;
	bh=TADT5pqLCP7/EEMUpQ7FZ5u2kWNtsJWJLulqEY9u7P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3hRQxpIENly5ZRwKI0KXVaiteNJ1j0M37l8Uy7QUxdwcQmOtq2ycY3ijU9LS/1mBELSgkPu8Pxz6r9Jy8bEXO+qvs6hzCYH/vFkqFPJ3oYBimFnx8EoCi9mti9nWkzGqQEDCVF2u2Yn2H4upXjqzn4oYG4S77J/R3ueIwEgOPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXVjay9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeOtqIOV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXVjay9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeOtqIOV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E684lK2515922
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtAEjqArzfjn7+O9rMHOz2hVGzWcB2IODXM/UtgZXR8=; b=AXVjay9xJxu8x0zm
	N80g4E++AUhMuqtnDykVc4byahpqJXLW7jLXFGa7kaxXRJ/s2fhHbdKODKePgWBb
	16dNArX/bBPuZ2W5SHd7/rVctRHf2Sh5LARmdWiUVCixqO72xWWzhWAYa6v9Ryjs
	WUrguFceL4NKO5rmF9j6qx5ZeiCfjLHUbccZDBQj5QGH/T0bBxvSMOW2O4OO7b3N
	ziAsVEVYBFOIqR2FFUm8/I03j7lgYQqVp8pbWay89f8TWC6CHjVawh1PUiW5G5Gf
	c/Vddi3nQ1oTd/D3dld06Yuwwu66XLtclvI0xCbw66vIt6naDj8rum2SOjj+0egw
	KfJsFw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4708req-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:10:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so2363089a91.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969052; x=1792573852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtAEjqArzfjn7+O9rMHOz2hVGzWcB2IODXM/UtgZXR8=;
        b=CeOtqIOVRCM3oMYo2s6E3dv6i9BrmmXbhIsqnUcGqXBQ7bLReKavu6lzTd2YsgnwDT
         njJ3fPDBi6qvSqxyslpKowR4+Kr0vcooJvbtaNEZYDTfXKAuIkSNUlbYXWEGzS6uVOR/
         JlnO7j0E1qa2RiSMmnUC6S3vyiwFApFv8paf7DsVbYcb/XT3Mg9j7UYt+EZsaXCjsnCa
         NmbSOOEkQjcnrzkqRxymHX51Cl5GMWunMPPrMgSKZ00GF/cSThl5X9v7Wc+jORr79HIK
         t+YbWTRSk2sf8maP3lyhuv/l5twfLC2/IOmm7clNwuL8MIMSkbi7dcDmpQD0qsz5sNXM
         bI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969052; x=1792573852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtAEjqArzfjn7+O9rMHOz2hVGzWcB2IODXM/UtgZXR8=;
        b=Irem4rccGMNL4C3CukS4jLnpJxDtStktMtkP2MO2DLJ4VYIbV502ez33k5WqjdXp0t
         7mke0DMPhV8p8iyE3paNJ51fSyNiEBVvxACsQ/Lu/Fn/10Xcp+ptYXwEm+xG+6Yv5+Vo
         ztPURwduja6NhD7jIHICXwlAH+C6i1XjqnZovIGX7r/OeKcU1ggjhWG5T7rx5Qoe8cNT
         IYY02Q0IB4T67CEmYwA8negHzvPgYCi30WYTDPilbFioclVo/JeWQW2LkThD8WaLR/Sa
         0R5m46zX3MczPPPsgPR/IzyUu44SqqEYQhu13ZM0KM6oyaHkXrnbOPXDtWvduRgQgwnw
         HpJg==
X-Forwarded-Encrypted: i=1; AKwUvByS9PROrx0CUbHGax73ghuzH9ZavaKEnXzCSm37KONfDxH93bYzfJ5fE6/Qu5oSBqQFHfyoz4mri/d9@vger.kernel.org
X-Gm-Message-State: AFq9FYKdK33bWislWZOm0SKrKQwLcmoZzVMIf6EjCj2GzgsKEozSjf7D
	ry6m+FJNHWdual12tdGXf6ANkmJtUiNTvZWB9wjefgIOfUMYNmmv+Dj9R9wbyVFeAgB0qkSLWzw
	E18VImrQ0YKB/dgWt6kCJhtquKJXnzo+jGZLAdh2JthHFBaHQe72uz6saVx9Z5/n1
X-Gm-Gg: AYBFou3u3uin4eQW3ar4aoPKXZMadm15Sp2XYYXErvFXRPNtGlMaEZ5YgXyOsIR9m64
	D9ergMqQeIqGXFQE7JUFSooa771xxtXtdKIGKE78jSEuw05YqgFfEK0lzLPoJs+Kv4Crgu6TWjB
	S4zBmyk65Ju62NSAF+HSLAUOA5XwYgc1hXuTjI0mdP6K2DZmstIdNqfqqGSNt3xJM9sNY2G5g+1
	EdJppz9eySGqA377wErQIns+qoBNdffulc6krn9cLHIQJZ8h10QNlT4PC5cBMIvFKPiOohokYjT
	dAtDnvRA1rUOzHh088USI3xb/xjM5n0DjbRphjta8lXkZolyIFMqR1Do6pzw9AFiXKl5ua6sZrP
	GdLQhghKExf98L9FmInaAfQ0108l7
X-Received: by 2002:a17:90b:3b90:b0:3a8:5543:5572 with SMTP id 98e67ed59e1d1-3ab3a3654admr13949568a91.1.1791969051586;
        Wed, 14 Oct 2026 02:10:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3b90:b0:3a8:5543:5572 with SMTP id 98e67ed59e1d1-3ab3a3654admr13949521a91.1.1791969050687;
        Wed, 14 Oct 2026 02:10:50 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6069ca15sm3642624a91.11.2026.10.14.02.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:10:50 -0700 (PDT)
Message-ID: <c4820536-bd14-4377-9966-80d787fec19e@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:40:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap
 no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com
References: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX+p9GCZNafLKr
 Bb6jv7kBGuYiV8QhyqiU98N03aFZqBc2S/qWsjZ3meTgurbabHp963qgNbPyRR3K7dPkP9C17zR
 KOBM+dyVCtiu2gH2o0uPF5OjdSfBkSIDHPNoJMwyWkkDlVK3gz71lnOz9vXsycxc9A4AXZv0Flj
 S4OLp0FUzX9uKnmQIeflZi7y6Vqldj2Q8P2tD9VKvOmv4OGGiXx7UYxilf6XuGKEbt2LrLSre/u
 dWXPviKjb2lJO3D61Gpq4OEPPvGOCb6B/NCzjY7d+zN3l6uNxvHvWxboY8O5NI86bzinfMoyb4o
 5GcnI6w3qOA8rR9tzzxgLQmzhFzTKnONRXUrstRheejLSn+wYxeaWh7znhU83emXf7WM4ueOjJk
 obNygsK1jdKok8qTTH70R6Z/8GNASTbCeBWGySxrZVMtRZjCZuM7jeVY6FTpwVrAQ91tvH8bNRp
 erAnTAeBbWQCd6CdPsg==
X-Proofpoint-GUID: 1ZxxBEeFFSBjvlmKLosi8l-0ZhmXlhPX
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf471c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wpYJVS7NxIkf_1e-v7wA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 1ZxxBEeFFSBjvlmKLosi8l-0ZhmXlhPX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX9uZ8uEHopP7i
 NmkecoegnlXd8qELT95YBEK0Oh2INmEXuI9TXLDvBtN6PzetX+xyoNt/bT5fmo2oOndRUhoQMKn
 HbUMKHywD5VPVLAb9FpeH++9qrHjqJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

On 14-10-2026 14:08, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Talos, GPU stress testing triggers a synchronous external abort
> when zram accesses pages within the ADSP remote heap.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: b0b51a5f1911f ("arm64: dts: qcom: talos: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 8ed6f2755705..b14952b57d6a 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -682,7 +682,7 @@ pil_gpu_mem: pil-gpu@97715000 {
>  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			compatible = "shared-dma-pool";
>  			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
> -			reusable;
> +			no-map;
>  			alignment = <0x0 0x400000>;
>  			size = <0x0 0x800000>;
>  		};

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

