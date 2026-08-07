Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F154B3F210A
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786099456; cv=none; b=L4FNL+iaJVP0mKe8SCvYkyAKDw6xNk9mPEmmoaBN+vkWz8plJJ3+G0gpcHbb0d5qEkvM8QQl2CCv+ama7oIhJKqISBF4/BjUHEFBNEQzVh3INPWMGTVuYBaa1ISxHxbMiEUkrpxGChAcvGqUQkXIKagRFs16kb/JNg+5cqDPSs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786099456; c=relaxed/simple;
	bh=8+wEpsin/yeuLn/fb8ngAOeIi6+WvuSNR3Ik9m8tebk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PmwEPIRzcXaiz6Q+15Hr7pDliPZt+0gaGEPi1l78aJd7swA9Et5/Tvc4GcA/K/JasE040JfnJkRpEmO0Nm6HCHnNLnqtjkN9rjdBN0QVxnH5DLmUCEP1RhQHUnGd+DmAWRZ55bDFXeDmMGangAFjkYEbfW6LTgKdOowrUvJktE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdqiV1qa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtFHLUyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdqiV1qa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtFHLUyp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778Nfvt3176979
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 10:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma7D+aNpc8m+Jgpg127jyC6gD4giJWqOzfXGaQO/jUw=; b=gdqiV1qaoN4eFLuY
	onEeWN+hg+OlvIopwZkhi8/h6JDqcaICd7XhJNJfJrD7R/MKIS8lSqPJLsmnYk/H
	RhNBTWXoHUKho2nEBTM8ykTX6JBhFt53HFL/QBb2D3hwHaz+CuhgBC1sSpejtQLw
	5IoBLQ6VfQQTPEN1dhTJ3L0Zw135WjrFmSvyYXaxe244A+bXokyXBST6MVDzcaGS
	wMX+Ap3nlFwFNFJn9sh2ocqOZtmlm36TP5jCZQTxFgX0/BAGSn8kcaN+g6pMKv2P
	UBtSVs2jxLtcREE2ORucEnRZ7fKx5SfhoYEyHknsm3BybE9HQmtMcZm9gHf7IYFj
	OkUIJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jkf44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:44:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so7056905a91.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786099454; x=1786704254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ma7D+aNpc8m+Jgpg127jyC6gD4giJWqOzfXGaQO/jUw=;
        b=FtFHLUypAEiPIcylNLBbz7g0BM87/NqJKCBEClXOKcxZHVTwRVVZncb7EnW4bzHCcA
         Rx+TS2o4QtMvrIVr1ZXwbHosVD0ThTHIKZd0hVlFCQZ+ixJnz1tArVA2WLJrHG2caJZ1
         1QrBdXG/0yh/zZ/DDzpWzRjqNdyb0Slk7inxptk+3UN56bbD+gJyMVhpv6xX0WHNDP0r
         JwszX/u6P2G+ivYS5RSAgIq1AZxedJiOl5d+TgCUqw/9IlI2MXzqEyDOZsjBNP0j4JGW
         QFjD7FRx+95PhPnz2pPvp/Tvfv1CdPVhOGz0s23FfP4yAHA7pc8fiiSdA+wUcQPY36ak
         oFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786099454; x=1786704254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ma7D+aNpc8m+Jgpg127jyC6gD4giJWqOzfXGaQO/jUw=;
        b=RA/qNgxaZVqZ4sYWGj0ub7BSS18g1PEW2wOK9kE+59HTY9rVHnGVffdiMKTwZ8pcGh
         xGTJG/vFmQKw7SEbhKxE5rNbDZxcb5DMPK1QxFAyIPVOyh6HgQvooby7hI2imcpVvPlE
         Ddim0UKpk5Xgy/7ydRbB9CuMlwzCnaLDwD5uvijin8CFQsocFk/lGt1I+jmywkjHoe8A
         i26rOtrVg9DhAU9YM2IblC/36aYqL+Kyt726Ezc6FtmtjE8SEXLqCIZwSEaJph0tMADo
         j0OlqqES0CbyEwRZus5kHGA3lalCraoqCNafbZHxvZVAQfTps2PDK7mpegfa4l90vyzW
         rQ5w==
X-Forwarded-Encrypted: i=1; AHgh+RrsgrArstp6AhEF515Qd4MojC7PEpu9GByMFJBoYVKpOmb0Atw3RwFR3hi+59MDYKnn0pKcWH/gp4p1@vger.kernel.org
X-Gm-Message-State: AOJu0YxpyyrOvM4eID9BceeAW9slIcT40GuuN5TgF5BD8Ae8UmI+FueJ
	h61kwh8/oBVl7Alccr2QHVRNixdhU4xLk9DfUVJWhiLlritQrbYJY3jZYySIpfPo5azkTPrLV3/
	9RlpW2JhzXzfjtMArXD0uYhAgzhFfUjYn87+ka/RQZvtu5M8rNLB/cnmzDmBJxDz6
X-Gm-Gg: AR+sD11JhQD+23++mL/9IrbL+nsoGz9BCfDiBTksNeNyQX7+EM/Wgw+h4oo5dqC/N1D
	DMvjIOfT5+BnNstSdRfH2Epp8uPI3SViMiUazmo5tY5OHt7FHhUDNggPK7ssZimAgnO5LWA8k4k
	Y4mtL/eMwiQ1btoTXcwBfexGh0oI6TISYYQXqNQ844UvmqbqGJZ9EiIeMQCoTyQUJzqwQuMyOMz
	tMZogPHystd8Dre8H2WaJI9zsY5puqdoKk9qbn2BDBUpKkmTgrpsWaZJP31acldatmH6BQtslZa
	o0twWeMzd79rV8300lV00/v4w/olyUhWA2ysvamLZKTpfBp7dS/5y3Z9GSZhAGKh0DDCzqaZn3w
	SAc/JL4kjyjqmBzYp4VsV7t4aSDVEdA==
X-Received: by 2002:a17:90b:3c07:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3926228789dmr3195130a91.17.1786099453570;
        Fri, 07 Aug 2026 03:44:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3c07:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3926228789dmr3195086a91.17.1786099453177;
        Fri, 07 Aug 2026 03:44:13 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39086164982sm4410327a91.16.2026.08.07.03.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 03:44:12 -0700 (PDT)
Message-ID: <d1c383bf-d563-4c67-ab9b-619e7161854f@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 16:14:08 +0530
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
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA4MiBTYWx0ZWRfX/0HsX8CwkVPf
 VHcRwJu0lFKZ2q0vWljsUMrdqGA3BzlRFcJtVZmu7cW+L+z+3zt1nNO1JlBEA7nGPhzzrX2le4A
 wOkrxfeCCcqobzHBtYnGFXtuSgxqiSlFKf9s1x8BihRmJh2OUNztobmOQOB+B6cVkdnBxgf8HLN
 CRyV5MxxUE1k2agdlvlgeO7kZgso8qar5pEUk5kO1sRV1jPtj1MG2P9CEdsfCzK7fxJrXP/8o5y
 eg/ndZpDlDoMw1g1YV0iHIQTmizuJiJ+boWiC/NiKVLcuQpB02muq3ArlndkaKbI/Ui9vofKK9F
 b58JfvZ7/Tz6+90qDUh0cVk4IWyDUksNaExBiW7G+H2Va2SqhallfMyLx5kNtnnwb9knxX8n9Cg
 xl41f6bYONI6H/wrntB85nVTuL9QAbvAVw6KTaIM7XEDJtokrGlR7qEgrnOwLJDivMSyh2C3dLJ
 5EKs9VVT5Rba8Q0q19w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA4MiBTYWx0ZWRfX1kyl/KbTXkUN
 BmxCIXCB8tlZHoL9kCB7h4F5JPJnLh/KJ5O3ZhnoMrDWcTVFt38OdU8tGDBcVEkFjrEDKdo9Gsu
 t8yazh9Um6+49AL0r5NmbaseOfYujcs=
X-Proofpoint-ORIG-GUID: C3BSzVGNqPMJ3LCG8w25QVgi6yeU2eWL
X-Proofpoint-GUID: C3BSzVGNqPMJ3LCG8w25QVgi6yeU2eWL
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a75b6fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BqbkvxNZUh3vXpf7O68A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070082

On 07-08-2026 11:20, Vinayak Katoch wrote:
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

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

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
> +			reusable;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0x800000>;
> +		};
>  	};
>  
>  	smp2p-adsp {
> @@ -2348,6 +2356,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>  
>  					qcom,non-secure-domain;
>  
> 
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
> 
> Best regards,

