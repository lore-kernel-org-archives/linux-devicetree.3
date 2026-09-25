Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C73B8959
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361530; cv=none; b=qKG1IEf+6TsRfpoDZ+4DDqCLODZVN9N7/gr6dGoE0whveBTcmZ4dUYa2ii0oHO35K9/49zRf7EdCf7Nre+D+m5ETNcQBTTmHyGPsfKCENB5poAvdfmcazV2/6miu7Wqde0vMu7nmhSODPNliZbLVi/gm9BoYFK7zOiaeZwtawPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361530; c=relaxed/simple;
	bh=dzPcdCovS7Lzc6OZdecytRoeB+rYTj4DjsoekH+cORk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXNdru0wGcSpwpCCQw8yfQZsgfWnInODdXkmeLBvvKRG0uKXt4yFbSnO/7sBmWNpB0SeeTSGALahMGltmmzmUuS0Jz3rdftd9sbVz69VOn8qmPItEnbZeJAICSzXzgyXJXI6aoTS8L2g/DNeo6ulaonZgfbSN8P2ePKHbgdOzCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1xVYDny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXohWq2y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1xVYDny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXohWq2y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0qqb2124659
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cIaDPB2jrjmKp92BAerGSKxYnwWAOS+LZ4WV2GDak8=; b=l1xVYDnyYU4ON9kA
	6cX5tmolXrT3tPqzN91+rAuZjGTEapyzC0KeqDv6M+eI9fTOYXheLGfFudbJosS7
	CCqumcJ6J3FTRwRwzAbIaYy+Q9UqNmwunFlU98p+31OCgj5G6yl/VpW6Y3MfmzXl
	vknHzRit1CHEGEJ480Cfsyihj9ybc3icO0xOmUwIUajKR627Io7faKQjttOSejhm
	tmeKcvqO7ARHtqK20IX7upWV/I9HPQkeQIrne9K5rZlc9cHmuhypgflXS7zS98eO
	WVDnqB/9hcV0YajMNGSk+3yzxc6I+OEz8urtbL0uok6PlUU4Sv5lJ9uU0H/7cz92
	33+L0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq0aryh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:38:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3286d2bac04so1654797eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 11:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790361527; x=1790966327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cIaDPB2jrjmKp92BAerGSKxYnwWAOS+LZ4WV2GDak8=;
        b=UXohWq2yaPbeq1M4gPf4DwjhBjE5lrwzhgMzyUHRjTCFVI8okIMtqU9nIopZL3Floc
         N27DjCqGRRLJ/PBFR6mDO6vFSzc5wMS+zr3m8q7J5iebJAnEV5XXNIv7zOY4NAS+5k8R
         yvzhl0pYhwNnuY51HzA3W4SHXDnrXqzaLj3X1c6IZhUefZX5x1yZgO5GCnPXfg2Z5WYf
         hGQGaPddLsQVe4ACInNxHFoRTYXHjNyBFyipBdlO/HpjTvXYAnP8kPJNPOBofrnp1sbU
         DHHqkXOvAEjcn/ZY+koupWTkyPhKf9KGPuLoyxVVsgOdJpSlmIWYddeycc9GjHbwDOve
         gKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361527; x=1790966327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cIaDPB2jrjmKp92BAerGSKxYnwWAOS+LZ4WV2GDak8=;
        b=zN9adnTS+jwiHFxJ/ywAdHVkgwqPzVwaOnkjSCXWLTBWuR3HkfY7aK3cd0yUQFsuXD
         CsP1gzXqWPkqA9W1Sr202DrobMafKSw1iscvbFmuk500E166avNglKNSW8w4U2R70ZTu
         88qIh2dYaCbUr9d1ozs1LjA0+mSo4skykPaM6Ou6ICEmpJ2gz820uQNmv2wISTeMma8A
         ESsfWtM9DTn5U21TgAvqHFTfFeqqmSNOPzUHFaCYdFUKLBH2xM7tgQHJPckrtUL/kTaT
         muU2ptPbhZN4uKts/esikEgFC0RgFt/PgvtutiHs14bePU7XzQ+QQDwhY/FUmMtfdrjP
         VcEw==
X-Forwarded-Encrypted: i=1; AKwUvBwMbh7yRUPpCJSF58QxnJI3TNmfx6kutuVof89nyNgKo32cq4q6n9UtSEW2RTgQQVR6h/tjAdZLU2Nh@vger.kernel.org
X-Gm-Message-State: AFuF++lmVZdQ2diaT3BpOqDBD3LavnsZxTkTfAnmTu9rWnE+DhRkZNGY
	7cARaSLGHEpL9EGyqJcmugZ7+VIRcsva9ry7efF5PyPDVv/QB/IO+D6lHzceTTI3aj8P102VGXq
	e4YZKaenEYCgaZ406Ru3d0beNzbP+Aufh2WTZsaU2RoOV5AKDhQpEOeGcSY+WqZm6
X-Gm-Gg: AYBFou3fw0E1TAs8JGjrVO406jSyrynMDmz4JYMdJ+ZlOd+GKZyIWP14gBkxT6YzEIN
	t0eF2gRjTWpYTjtYBeC17d8u4HEcUhqcbYpoCgL4MSiNJvjRug9IpZpCDDwoOs5BmsfG5x/UXhL
	2te/+qOQecq4c0+JF4R8WkFjARK+urCjw2hH2jzeBV9KtOpjC5aPkCnEJEmP88GfxKQSFnufIQY
	QoRGNr6deLdzyOwCeU2zj96SOQD69dpYFmzj688pdk98bSqTzTp728qUBbJ8KjURl19CI3DVr7A
	eq0MgU7wuNVxWC3rYWntCeGeMbz1g0Xqp9QiXfdgTs0qHHBWWgJkddREvDpknfrDCtbYlXEc05b
	iReZuBlc/dJhvhetcJKUH7MoA
X-Received: by 2002:a05:701b:2701:b0:144:ed03:7bfb with SMTP id a92af1059eb24-146ce58aa89mr963615c88.12.1790361526545;
        Fri, 25 Sep 2026 11:38:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2701:b0:144:ed03:7bfb with SMTP id a92af1059eb24-146ce58aa89mr963587c88.12.1790361525878;
        Fri, 25 Sep 2026 11:38:45 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm7915199c88.12.2026.09.25.11.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 11:38:45 -0700 (PDT)
Message-ID: <f14d9570-33ee-47f8-b0aa-baedba99e74e@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 00:08:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: display/msm: gpu: Document Mahua GPU/GMU
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-4-0fa0bfd8d315@oss.qualcomm.com>
 <20260924212222.76B251F000FF@smtp.kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260924212222.76B251F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX6JHHUadZWqeK
 6f2RPjgX9brT+WbOKmQJ+ij8PlZkirpns9spbfZo6EaiUS99q/K7UnLaSfR+Jvo2UKS4YiggW2Y
 oESO3vK0C7oR5V2CWNb40cLyImulGUs=
X-Proofpoint-GUID: 6749qBZBAL4ifRnKUpSgUvWVJGH6T4hJ
X-Proofpoint-ORIG-GUID: 6749qBZBAL4ifRnKUpSgUvWVJGH6T4hJ
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6bfb7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bUMPAlxNVlhmAh4efsYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX213A2ZD5E4Sa
 K1VzX2FbLMDF2Zse8qTGxxm4LEE5Dp9IcFmsQrGMozYQw8V3pTuHTCwlhyn+T4hYCOCt5KYtwAw
 ndiylFnS79ZW5GzAcHuPevhsISJ1TQLv0wplFVjjoAW1mdSH5FofFVFhvyuYJvAyKK2ighGbevB
 i6TDdTvnEECO3zUfhUEX68rSLNx8dIxL56mBFLT7n1lENXdCMTRhOo91XcZ2st27QMkL7CD3B0K
 GEzFQnJmfzldtSKVPiOrgj9Nl1Y7Jer/jlc3qJLTOpwn5+78CUX0xaqmX4swhHLr8JZ27fkn7NM
 CMbmmNOBvm3JyMoOJ3azjBSfUA8VNanrvmJttDrG/UpvdIapKLjFhU1fhNDRA7sg2XKaL6h73C2
 uuLYqN5L6rbtv4EJ4PDFI/uxlCvUIgMUHYm/ucKqCvhKvgesTmLZ6yyza3pIDIgr7s/2+mooa2i
 QT0TVUcGJ28HE5jrDjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250074



On 9/25/2026 2:52 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: display/msm/gpu: missing compatible string in reg constraints block
> --
> 
> commit 31fba47631141728d25d3c820a8da841bf562a70
> Author: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> dt-bindings: display/msm: gpu: Document Mahua GPU/GMU
> 
> Adreno X2-85 GPU found in mahua SoC belongs to the A8x family and
> is a smaller variant of X2-90 with fewer slices and smaller internal
> memories. Update the dt bindings documentation to describe this GPU
> along with it's GMU.
> 
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index e5efe2d35ddcc..8a103f998dd87 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -452,6 +452,7 @@ allOf:
>>                - qcom,adreno-43051401
>>                - qcom,adreno-44010000
>>                - qcom,adreno-44050a01
>> +              - qcom,adreno-44060000
> 
> [Severity: Medium]
> Does the new compatible string qcom,adreno-44060000 also need to be added
> to the earlier conditional block for the A8x GPU family?
> 
> Documentation/devicetree/bindings/display/msm/gpu.yaml:allOf.if
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - qcom,adreno-44010000
>               - qcom,adreno-44050a01
>               - qcom,adreno-44070001
>     then:
>       properties:
>         reg:
>           minItems: 2
>           maxItems: 2
> 
> Without it, the device tree schema will fail to enforce the correct register
> count of exactly 2 regions for the new Adreno X2-85 GPU variant when a device
> tree node is added with an incorrect number of reg regions. This allows
> invalid nodes to silently pass validation.

Ah! Missed this. Will fix it in the next rev.

-Akhil.
> 
>>                - qcom,adreno-44070001
>>  
>>      then: # Starting with A6xx, the clocks are usually defined in the GMU node
> 

