Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5086C351C1E
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246744; cv=none; b=gfy0Mhtd/9QgbzpwIo7wFncpCyVyAX8ngwlHw0H6xMM2duza8EdmbbjL+QkUUMerK8CkXuiMW1rXDW2s7YPG4G9dnEQ1CbzXRznOiuqE8jC+5+ClmJ3KKMcLt+mMrIXa0c7fPgxxVZFLynMCSjNkQYVyN6bvxC7dX6PA3brxWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246744; c=relaxed/simple;
	bh=LvqP7JTZU5t3GnhNRAU92NLU7u2TPJCfx5UI2cHd2qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsHryn/znbDRv+d29vc+X0QtId0NvEZ4mrPwuO+b0KcgzsaHZyhZCQG9xPsQXFPh/S4oSksO8IpRgITktJNHoNqFA0D95Dz1BvCjgwQkU/Oj2tgZL/BZ6uAdXpE8FylDQycGHJro9QEqPovCE11xli/lkvjfkVrrhyuGnokP0Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt/pwEPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLsWbUqH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt/pwEPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLsWbUqH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8NYW82972410
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+Od30V6qbTZqrwv4KxNnxnOCvUafKF2/7BF3UbCIP0=; b=Tt/pwEPLJQfSbx2d
	WhV6b1YBJDgvx7UeA7cXN8gLLsbBF/g+TZd1kR6IEEzQoG7xjvn0wpLawD+7W9XV
	FPWzbzhwDGy8BGiQLw0Btvzn8M+vPNQ+3MgINZQMWYqBLM0YpVjsNPk5pVTVMO9M
	iCrtaYLZ9RsFs+zNv/sE5ZoH5jIBqo1+pZ3DpjCixZoNtDBvBCeoMYwt4iP80s/N
	y5XeMwcS5fEiZ+dvkO2JAxrkPycEehcZfsIsm1eeXZp4xIbByNEUtUQ3PmkkDEBh
	I1h2egh3gYu/+nCVJBhgAbfVZ1PwpIWF0Dq0UXml7b0oDp+z/kuq9uUarPEi0aW4
	WnsPYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74g89rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:52:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4966fe6so12746016d6.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246741; x=1776851541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+Od30V6qbTZqrwv4KxNnxnOCvUafKF2/7BF3UbCIP0=;
        b=CLsWbUqHpPTqcjmJn3p8g6VVcSMP/0M9nO33cKHI+MB6OaYu0MSLO3KD2gV/CWcc8Y
         QcorLH7QuXXZUTFMqX0wswwL8UJXyeMxw27iEXNqsw09RSnUU4Lc76GBAmk6PhYUDQuX
         t19CWeMxUmUdKq0OmF1FsGINcafsulRgc8p+Ojs4XURfFMGtASri67SM3oqJNCLTTdPv
         ptegdJFu7yvqW0Nx4gZT3m2p4m+WQlRZQE2tW84T05AEtD+mdDuJi0UxWix4e3BWbzFu
         pCI0R7bgt3DC6pBxjREt4SfXhiitJaUQfuZLjGhOCeUsoEnZMUyuIbJiPo5oRTfVbCND
         yvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246741; x=1776851541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+Od30V6qbTZqrwv4KxNnxnOCvUafKF2/7BF3UbCIP0=;
        b=QtIi9nwrskHOIaSHt/jnR7UAjT8txrsAeGQS3MAI4V2g60ZdKeiAVkJDd9hmpq7tlQ
         2Ak9kzE9UyWKzLaAR/kCeVUqp9pEP+Kc2BfFy8ihf2VoWhg7wUueSsz5Esrx3jadt9aM
         aybJe+bzZLwtOWTjNUsDQr+Y2lXSlNtLAXNfifSg7c+G3qv1pvU9EiO99V0QZqM71b/a
         9d7tqmpJ0rP4m2/e7LigjzR9TiTLs0uL+WtRvwM2LwkybUeJpwwHEEXYrnCSecxKNywF
         IBXzl2KqdQi55iveJTbykLyZc+PBxRvZH4I21FLoQokm6zkFh4Fu+IbQfZlSTyerC4AE
         aPxw==
X-Forwarded-Encrypted: i=1; AFNElJ8O98cejfgrhE4AeUJobYRlodcOk+9qbzFLmVNgyvOG8iexGOcrJCAk0D+t4QoW0TDxva/Mv70uv0RU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm7JkZvXCNIziHKLVpM3q5wIPG/Zq9EgF4stQwokVytIIBvASx
	EjyP3HMg5TgZkatQOUrN8eUxuMt5SnL549zsSIaiWSoB+NQ4hJh2kRphemIFXFh6kmeiCxNAWEz
	eYcSup1q63MzGAqDhi3LdWMcTRW4dnWNg19FLV8Y3to22clf4DJwqTFvhxdbHhRhA
X-Gm-Gg: AeBDievFV9pcD1j8rgUSdR9GArHjLQ3EocSeoQCo96OcUJotzYMuG3vqILPtFsSXoJx
	C6+gKTcjkM+AiT8X47hCsOU0doT2QBoK8+A1FLMh+V1kE67rhX8MlcVqEWndM+GJyCAHrVhkC3A
	jTkwy4gcH5A7zixF4+20VMrVEliMzRz9JAwa8i/HleWeRKF7a0doiyQOEUdv3WU2/aIszhptTRy
	ww+7SUECACwrwOhpHM5iev/DjB8Cm0+EHzs3hFil0iYeQNSwbvDDBNdtceA8xiq96CcMDBm+j+i
	m2TP/SbkCj9R3oDE+JetPXsAsflZBU8PrI12qPVX4yyR5ULkohJCAw9Ou9oepRjBnejM+ABz9uk
	gMz/ioYfhE7AEHwuDCT8Cbz4K4kmhM2Q2nawIFA6nVLPNCprIHIwZsU6qQz9UEPdo+gKKF5U7tY
	g51zVsL0FqiYya8A==
X-Received: by 2002:a05:6214:dc8:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ae6a765bf6mr22534456d6.0.1776246740810;
        Wed, 15 Apr 2026 02:52:20 -0700 (PDT)
X-Received: by 2002:a05:6214:dc8:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ae6a765bf6mr22534236d6.0.1776246740425;
        Wed, 15 Apr 2026 02:52:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1784a9ea7sm39696666b.63.2026.04.15.02.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:52:19 -0700 (PDT)
Message-ID: <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:52:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA5MCBTYWx0ZWRfX8YmshGJkuMIJ
 Y873F2Q5aH90v49eAGdpHKIxc0lOoOrc6DNKdkm+MsMp2kxK85e+9s+yOPVIowRk0XZf2X1ASJx
 smRH9YqeGyJydfWWZmJBpn+hycroL3CI4blKsqX/NuJhBujYp43jZbyIdz2hrvHsauawXS5wXWP
 nfUKo7F/DJ4PT2ElTg7IB543veGJ3pE9wDr3Se4bE6Lh5SiJbEGc9nDYOG0qJobl92bteI1ToQ3
 7RZNX0TwrsiKU/yrr/SZHkl/CTpmzYCHqPUJJVCJBrui19k2l2QpaTNvQ42GCsCaWblL+z/qayx
 DX5HoVBPgYwdnr/IG1KtPhq1PQvwcRkIfhSC3Tz5wQicNRY/T8OyfcSFs42aFqUTN5rUwZrX5N+
 gmDAi3zUoWtDmE93Vseym4w6i9pImYIjRIfxzoJOnCxV7b90NAifM0q6UHLyAqiSUhwB9xDvEWU
 /JdGwechLJdzsAp8BoQ==
X-Proofpoint-ORIG-GUID: e6wx0mW9PzgUYdg2jeljtF9au0-1Vj75
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69df5fd5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=O1BvczLALKNwqtZGQfAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: e6wx0mW9PzgUYdg2jeljtF9au0-1Vj75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150090

On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> Downstream [1] this region is marked as shared and reusable so
> describe it that way.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

+Ekansh some insight, please?

We're giving away that memory via qcom_scm_assign_mem() anyway
and I would assume that making it not-"no-map" could introduce issues
when the OS tries to access that region

Konrad


>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..13094b5e9339 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>  		};
>  
>  		adsp_mem: adsp-region@f6000000 {
> +			compatible = "shared-dma-pool";
>  			reg = <0x0 0xf6000000 0x0 0x800000>;
> -			no-map;
> +			reusable;
>  		};
>  
>  		qseecom_mem: qseecom-region@f6800000 {
> 
