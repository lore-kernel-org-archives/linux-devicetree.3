Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A923F4DF3
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139174; cv=none; b=T8MMn2XWkNZmFRsEG3whnJqty917XBAD9+ZKutPOcC1Ocht2BQ/uV85ku34f0pOuKn5UMrMrQK9i1EjD0epLn22yHfFi5oa4DtywGDGJ/EP4vVnU71XTEd7CG5Vg5YwPxddjEBIadhJM8LcwvQk0aKggy/Q1AJU4/Tz1AR4FZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139174; c=relaxed/simple;
	bh=2rJaiVENcAslAsJ/ZJG0LLPqyf8TgsnKRVyB+Uc+2eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rT2mzcDotsN/hKsxBR84ik8PF4dZZrr9TqGpF+AdbhNMVVAfsA/15my5WHSE/vURo0HIhDCUFdyj94ry+ddAmfGtvuhkLoLpOn1/OhuUGQAxOW3sltiVoKYYINLStSuOVZusbkUPWKeM7Jm8uptJ4zUyg9lqJgwEOGf6OFIgWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgfnVdEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctP1ZLsl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgfnVdEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctP1ZLsl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8E5M3984469
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSzDhfuybgj+6b38gQRwDwkRCyqNpzNvsD7fKem5A3U=; b=hgfnVdEXGEJEyE73
	mNBROxhN8b0k/C4dt4yRiLnAUzaAwF+/r7Ex4BAAOp9vTt0LQuOptQLLh5+JDl2K
	DzicciUnptPaFYW07/qAEumwePUl5/rkhj2dIrkqQSRHMNLWpCUcnSRbrMiNTkkv
	kkDFXEhRebBeRcJHY6a89CWIxoGUXJ76pUJzcBzEL1UuHvht3E+3SCCej96ICS2D
	CQRWyKIUi2ewuLzPCpQLaKC5t9xLW2dfByFEwtCm9rlWaH9bL+GM6zj+pFzXRQ0D
	cGiW2ZpFvtp8Jh0RsXACtyZ/FVJFNoFsKhknXs9/AiLEBoCBpYl63WjohhKKRfNt
	VRhfqA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjk27h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:32:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97bf9097592so9209241.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787139170; x=1787743970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSzDhfuybgj+6b38gQRwDwkRCyqNpzNvsD7fKem5A3U=;
        b=ctP1ZLslimDzV3FWXUzbP3wPUMtFkBV+niEpSV9LcDaZzrjw9J5ucRiTvyVD1EFIcU
         93P2H57UqMRF87KL4cQVzYakIwFR4XgmmeFvraDBRKroJwIa1m2bRc9w5GEOe6VieYd/
         05H4YvHwIRzZvgKVpZ1Smakt6HgNTC7+22uxAI/nTPEzM2REwZBKijGFkcGcrOyI/CqI
         Ag0rtS6rv063sGD7sik+AaAvg1Vd1IeVMdYH9kGriv/vZbws4WtIeHYqVOLfj9cZBhQp
         qtsTbd/50J+a0AcUXxEUjfpURkT7G7+Ni9gRuhaAMYjiNNM4XSdhUtW0+Mz7DszFlyWt
         tNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139170; x=1787743970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSzDhfuybgj+6b38gQRwDwkRCyqNpzNvsD7fKem5A3U=;
        b=IF9PqDLAAnYhsTpvRX6zcGJk7KlyNsiq/xP4i5FeR9KP+GSKkifz32XDRkVQi8RTSr
         x71p++DJxuoklLwWZLMzLKeyFFd20Xp8+erR6Mp0oqflqj2WNILsyL+DC4eoYfU5GWFb
         qNtK7mbPCfkRsYgZQ5wAfVNSjbgLrHhWWlVJAhDMFHQ268Z9rPPUAbPbgwgy/fMIT8pW
         MDaqdUkOcS7Av1xidBDfPs7oBPkLE8nLf7yuQcZINfJvTtEeQ0+Ca8sQBcgECnBybVwA
         44LM65ru+pEmvrwRB/IEWA2oYcvRX0ji1OaumVpIS8ZzZlXZR0GlePzM04mBnm8F83dG
         J2VA==
X-Forwarded-Encrypted: i=1; AHgh+RqajJ6HNf+c60+wARXEYjztp7vWULQPjLm8OhEDOBAHigsO0tZD1MA4oltaEPVHFBhTDp5DuBjab+0g@vger.kernel.org
X-Gm-Message-State: AOJu0YzFuTq3m87OQ5FBfD7EXU29Y+/TM6eqtvAYIZnLHbDuXVzVFbPP
	K2QGSVEWXkBIUgNNMJok/R4e9E0fuekqUsE+F575QEpAN1a+mWUbibmRgGb+FiP4aWIp8ZJbGgm
	07co5b9Ypr2bYSgiDNx+EJ/EfZCge+JlMMSlGK8sZkFqrdSMN+ZTW3U3S3wO1VSIR
X-Gm-Gg: AR+sD12MrMtF1EijSCc4eRNqgl0hbWbC1ccU5AhikF+ku8qjiy0F36E2a6i3JygfSul
	8OhGH2Ec8NqEzMGmUCtrF2V3EQlN6iuQuX04P/wiBQy3ZU6II1YrRkeE6PBd16PR7pvwUafWtID
	JR4HX0xBTB9gXjC7A5NNP6CCMIYrTNa+6jGe1rTysYXnPMZsGY6qHnsVh6n2DIsvCXpXr6WmmTr
	0xMwtJsogqyN1BnJDs4wNDen0pbl44QYfHXPO6VMorwOvtgLcDoLi7ZChvTRcOlX/qbYCw2t5aY
	opPQbHnNL5h1whUTcjZ4kOsEIIuqGU1g2YVQ9xmO+2a6/XRXCPnVeOFkfEzQAtKgrppLa5Tw+AH
	p57LOhIToCETFFINDc05QljN+
X-Received: by 2002:a67:face:0:b0:778:17e5:d823 with SMTP id ada2fe7eead31-77817e5f425mr240403137.0.1787139169870;
        Wed, 19 Aug 2026 04:32:49 -0700 (PDT)
X-Received: by 2002:a67:face:0:b0:778:17e5:d823 with SMTP id ada2fe7eead31-77817e5f425mr240397137.0.1787139169502;
        Wed, 19 Aug 2026 04:32:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9d52sm828146a12.2.2026.08.19.04.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:32:47 -0700 (PDT)
Message-ID: <349cf07c-882d-4bfe-8f14-d6f36fdcc74d@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:32:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4OSBTYWx0ZWRfX4053UhFSga/H
 qi7GC3j97u2hI5IoGrH+0mUFCcwIbiH1JT9NWVofy40U3VBwoXcm18hy5XF0N2CZxeXKWU/usS4
 9KaSPpCYBsoJ4FajGrcCuPx42S0kuxUeMCnrqVIs40BxCPiTGrhoZHn3n7pgWC+cWRlTXqtxzqL
 9hO7npBllnIyJ47gdNlIEff6yEXsb9caC1UDQVjmjpO7lhlzeeFdcGmT4Frq2uzl41KLkhgZqcK
 FpqBPorN7NDfqkrCpWffqLayl7V8F5QhHHoIFFRa2CoFGNqeztTtC4BhndrlLCdYuxRq+8uV2PS
 t1NzH9Vn5Jm17MUMQfLxoCJAJMCdGShLpBAMWjk+LEVuiJAv7OreKzHTx0DPOn7o208A9Yb7W2c
 Da8Fww5PqHmlgFzrO5Ka2zUb/zMB1nuF5zVZynw83XAK0WblFu2rv8qY16LZ72hfVOTKYx26zCE
 9Ob1rWI+NOiSPWvwXPg==
X-Proofpoint-GUID: ToYn1Le376RGNTivu6Mhz1LsflewqI_i
X-Proofpoint-ORIG-GUID: ToYn1Le376RGNTivu6Mhz1LsflewqI_i
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4OSBTYWx0ZWRfXwkQbXRf2EfuP
 7m7VozAEOxtWxREguWv97X1OK8pegvjyK/t1RQGjEpiX+rxuvQ4YTyL9I5sWy36Ma5LHXNz26oB
 KTtKOSdJXKrnDb1R4384QdePiOOlbpE=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a859462 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BqbkvxNZUh3vXpf7O68A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190089

On 8/7/26 7:50 AM, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 590bd2432d85..2064eed01327 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>  			qcom,client-id = <1>;
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;

RAM starts at 0x4000_000 on this platform.. I'm starting to think
that asking to provide a base was a mistake. Let's just make it
<0x0 0x0 0x1 0x0> to allow the whole 32-bit space

Konrad
