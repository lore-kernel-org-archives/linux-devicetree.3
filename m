Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D054351121D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862946; cv=none; b=NtsNN2dD9+tUDygAa9GYjVjAyx30SDMudNc+wEKmIpY9ZHueJIOazoBmaZ3i3EsE+QsKG9JcMPTspVs8Rq0vqgPOBqa53uLlhp/+ZxQr4kVeYz5Ws4ghpY3kOySWoMAB0o7wsBtcNUrlcnUfURIn4pmnEL+cADOoaEnTifJprdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862946; c=relaxed/simple;
	bh=iM4k9v+FWnYdhh+RUe247xj2bTwVAPB85IccLeZbDxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vcty74nTLfiFIZwqZxY2PvRwT4NqrORZLjSS5ZVxabFdH/QokCH5/yy+vyFISksMKnQuHEvPIIg6XkwxrnJjpGj8f3pkwaCbHkHlbjryVcIkm0EaxfLm4nHh8e1FA1zKSsf1lURSOiNa88VnF9vx+jJi52dQJumNhZC2kDYFqUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y79mmOjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmYwSgVn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y79mmOjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmYwSgVn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjPFN1970351
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 13:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oFJMmnDqr2y8CcL25EGGYAYefN1maD9v9sMlG47tKo=; b=Y79mmOjpMGzRclah
	VfoYN8SWOOlSTtz+vD1w3HwLwQpVX4t4wujQJJFJAQEtHA03M9tHJpfraUoqDyC4
	b5tF0bXpHUuAIrlRt4RrJd+uMpfXbtB8GEl5PNEOy4Me/SoNbSKTlSKufi/z6d04
	SnMae29t34L9qvQpjydCrvXWTOEGgdU0MsK1bacFKM+8TA/daLesoFEkVDXJPF0X
	OtknGjClf8vmJuZo3e+xfgF29Vkw5PnvfYCTi2OaKpAek4CWCddlsMCU8+Gl/P1T
	gb+cpPkUVBll42gxgZaNYvCZtIFqh8kNHqEfB6RsrPxGh3HXNYyC8tBKfUs5+sTe
	ayKnig==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvvh04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 13:55:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso6858352c88.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 06:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862938; x=1791467738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oFJMmnDqr2y8CcL25EGGYAYefN1maD9v9sMlG47tKo=;
        b=FmYwSgVnS90Nm7z362F38qvLEUF5mVV+NcwSCCrNlk5REdDdCd08dpaFG+8IYvsBGI
         al9w1lFe28leU2yk1scUM/V4kQMnUHMCybdkqnTirvzT5OeRotGtK2/9YjXv0806LPiS
         DrrvYnO5uKov+X0ap+9efCk4X3p9nLQXxMrgjrGQFnsL47xL+TRtsuguh0Hu7bYKv0GH
         jT5qeQTwLH4iN/Rv2ntmSgGi4ybpzEkdjpABoaheankEnreOmKVY6w0Jwf1CURLRcuon
         CkVzMowceH55aWee5cjLqgMeVsyyFCGC7Qudi/qyG6ZtiHbS94CzXPdzzVgZfStqqrm1
         gKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862938; x=1791467738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oFJMmnDqr2y8CcL25EGGYAYefN1maD9v9sMlG47tKo=;
        b=MRq5/JrEgVvbEQc5k2r/425E+03KUsWHcQjrmbaNekCb5nu3Y2zeigOl7zesvXWIcG
         XI7npjAjYwOvu2eNQHPPL5lv5TFYR/hlgIId3PUu0zQ46awnDi8cnLq4Kx0P4BecoDvj
         +EWSogp3wuixs6DBEinaFm1/bOEhBoXfpn1m8RQ9ERxxG8mkpHL7MpF53hcrum3b4/Rt
         8ZT6EZ/DU4NCScMKJiZGBwQ9XH34904rs0zmrTYipdBgSzsTUc/X/mSxCaftiWjEf59Q
         YhuoRDFgqMzrXOMfz1j5dLtDDEZtFobYOD4dxIhzc7qsRLB4Hi4LSGCmcnLONy2gplAX
         Qzvw==
X-Forwarded-Encrypted: i=1; AKwUvBwIv6K2OK5ELw+4VsHBEghdfXtzJtiD/ynsQiMVb2U4yXICMfvb+t4Nsh4XyTZkWoLkq8+ypKTnjVXJ@vger.kernel.org
X-Gm-Message-State: AFuF++n7CGwfj5GlnDDMMMGz25FUM2M8rFDopnsR0X79ZVATHsgMT0gZ
	zm4ZTsMHyn1zOAYodoMkRvPkMDBw3RR/n8bBCQPuofjEw+MWQxS9sjNmLSP+ZyCPjNvLxlIevrM
	Ij85/00ejmzzsP9pL3gVrdMRp5vD/igSXVTX5NCwYOwgZEd0QcRFGJneNWHmiKNd9x9r0PUML
X-Gm-Gg: AYBFou0uGSTyV9X/YtJn9PnCsqrPouN/cP6+oRx9VzWHphz6nTjM5qwwCin+vjAxMyw
	jMTMx//RdHRnY2Uvn+pKpkX42lQEXWARtZg9NHuGJI+3qG3vWaV820EkpxXVufiBxLal1LCeJ9S
	TANwDM7kiV/X3XqAMksuBwcxz+g6omLQYSDu1qzLEoiw46KpJFaLyVlA0DGLVVCShVPNhRK03mU
	jfWuv/7lJUHy0qMxXsl0Jv9cZ1eI+oLO9Rq7mSB5jGJ6G2wSlEK6OWfua8ys50LBhWaZ6807xTm
	ktym5w4ZhQQZrO5m2GFDC0cfv8rQWhc4mWJYrEpnFY6IdFX5/fpHfA4OlFmW56v5fsgjiZ83VPU
	nvD9E4TOHtpbmbtgdeNf1Xhg5WkzXzuk=
X-Received: by 2002:a05:701b:4244:10b0:143:296a:4e58 with SMTP id a92af1059eb24-14d328ffce7mr4673527c88.27.1790862937889;
        Thu, 01 Oct 2026 06:55:37 -0700 (PDT)
X-Received: by 2002:a05:701b:4244:10b0:143:296a:4e58 with SMTP id a92af1059eb24-14d328ffce7mr4673482c88.27.1790862936950;
        Thu, 01 Oct 2026 06:55:36 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df40dc189sm6921469c88.11.2026.10.01.06.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:55:36 -0700 (PDT)
Message-ID: <c14ee77f-5413-4c0c-afc9-269b0a6bf3bb@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 19:25:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: shikra: Add Iris video codec
 node
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        robh@kernel.org
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
 <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
 <20261001135049.D945E1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261001135049.D945E1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IjGypu2gIs75xVFA-tCT6UynWratmJ2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX2rt+piDyDJIB
 coC3hXHmcioAamGtro0ah7TE6UobyKWKhYhhPR5p/ntZ285R+d4Cs/uB7Ll/eYzGEszOJuRk2UH
 /bWCEl+o8fxLnnTifAOBmDNCgppSeNa5Vu8WiENhmZgMTIFElX5zR63MmNOREXiobXCJQoWQ84o
 lhTDjPdymbH0fdQE0sMZOp03xhXozhAjJ2pTQ16gFoZWB7+XL9dlpoPQIg9tW7oUVchdgLHNCTV
 1XpWSzeUsrVV9Hes+DTOChptUSj6GHEpi+ZBFz7I22htSshGyydx3EojIjmqUUYVghKICfm/PmW
 pBDaMVA8kjFjpOAzFj/1GFpCUPk75SdISVDrvYvbQOGsAgk7EXaRagV5m2qbmTXYdCzRSf8xasU
 WFrB2aStsUAy+CGo1h82KDuxwpB3qG6k47Zc4yqy+keko1IgWa1tM65+VuPf54Cl5B9Y/JUpywH
 J3reB2r20GZLBj1a1Cw==
X-Proofpoint-GUID: IjGypu2gIs75xVFA-tCT6UynWratmJ2v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX8pSTxGWZ3pd3
 d7gRErKR4u7YO5rd13w/7CsMiT/GjHJfNmjVOsssm/ZBncDC76gkS3sowIr34SJ2HjFP/BAqPMI
 PZupbD75qfqzoO/zPhVn1Ucm3tqpgfA=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe665a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bMxCJCIvrp3_V2EDkisA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010055


On 10/1/2026 7:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing qcom,shikra-venus compatible string in schema
> --
> 
> commit 72de37a6e4a3d11559749c7b3aae80f415758b83
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra: Add Iris video codec node
> 
> This commit adds the Iris video codec device tree node for the Shikra
> platform. It describes the Iris-based video decoder/encoder block, allowing
> the media driver to probe and initialize the hardware.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 9823c591b02b1..d2e4db4025dcc 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> [ ... ]
>> @@ -2809,6 +2809,67 @@ adreno_smmu: iommu@59a0000 {
>>   			power-domains = <&gpucc GPU_CX_GDSC>;
>>   		};
>>   
>> +		iris: video-codec@5a00000 {
>> +			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
> 
> [Severity: Low]
> Is this new "qcom,shikra-venus" compatible string documented in the
> dt-bindings schema?

yes, its committed with #fe12ccf5a98f (dt-bindings: media: 
qcom,qcm2290-venus: document shikra venus compatible) in media-next.

> 
> It appears to be missing from the corresponding dt-bindings schema (such as
> qcom,qcm2290-venus.yaml). This will cause validation failures during
> `make dtbs_check`.
> 

