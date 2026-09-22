Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A151E431
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067697; cv=none; b=iZHcwaYjRj2OqEbTp6TJQcZxViSNVmKMZ+QD0+FrKDrZiw+66v2qOZycYIHsQeq7SkPM2kQJPSDITLWEy3NzsvlCfhU27AGuLWtmveNkTBiMNTwXHJ6qHpgNkRzwA/wP1nnpTLr5JMTop/0j67ZIee31fRUXPImZcTs4+k7Ztfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067697; c=relaxed/simple;
	bh=av+aBO05c6O+92dbe3DKT23RkVy38OVygGx5jUvujcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDl5/1102DcN6jxSHy4mhxHGKXjlnbCkvBBc7RSdXSZ7bFQbNvb9eKAudZgMKy2gq73iNTN54ZftdhNEm74pzC9d2LLVQf+apBuJHchID9h4VPBSte5OzA0w5geo8Ibj4WFxIZLXm6v1eFtATRpKFQrDMDXolhPhaz8YUbfDr0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOxAcuWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2PJioX4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOxAcuWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2PJioX4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M3hGdH1842531
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=; b=DOxAcuWbmFupSuyx
	du1CZYe2dVBXW2Sgp+LibQE8MoSnh83h5WNSBWa910NeSlh0tkhY7XS30kstOep6
	4rsNwMbmR1Xkes+rctyOF7UdjzJc+p6i4IiLTYinqHCQneGcriokaBJeHwnXD5ck
	obNA2I40bIVwjoKBMWfRiRIPZJgqIJOvoWKE8JdpB6hsMZJMk21KlJKa9hlCkRgN
	Q6pQlsbIERB2Ra6kbv0si310NH796/+HF93lcLjfUqeAVmdR24gwj+qcmtqt/xVe
	9vU8Wew1WBTXlfiwTEoDo57VAyR6BSPdgL6GCOT4M2lhXzi8ueiiOJ9HND7RAfDd
	zDtJ1g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj11147w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:01:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77969cb40dcso96881137.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790067694; x=1790672494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=;
        b=c2PJioX43seM/PPPoWN9smYrCbeGR9NpYnbih5RyCDHXbdq5OY4zS5cXP8e+3fAA+i
         SMcA0v7TBZ/Q1Hjo11VFNP3oLbTvcH3GA/TDW9xj0tw4N9y3xcrHmsgIcNWSef2sMPat
         SNQ4bYrRNTtN0ha5U9CcfN/nfWbL51oqsqk8QFIXkqDodsLGcolcFn02qDFs3zovFMMm
         8fw9ESMJ8m2KtrobvRK9t0qlv3R12L1+ESxNG3Y3zWB34wgA8zY67PrHu05DiUPGOTFq
         1EU3q94pO4BM6+CqWpZ6LFPUomNVFnrn4162FdubRCiPt+4U28iJZSLBaKxGxdOipuU+
         VA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067694; x=1790672494;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbKGxoj2US6xi9Piwui13+v3UWQs/y+8IIKVTQ6dkiM=;
        b=cOWvtyePD78LVpBGdLFSKgryeZoW4/NC1SbE7t/vt1AvrT7By28AwF1QmovOCI8wct
         JBGwzrBGNnhMudlySYZLbyJLgwJz7z97MtjwTBC0p5RiNT229L7mKrK+4N1IPrqWvTvQ
         cp+WS9sLarFOufQfk9w1uEQlHF1PE79AITlvCIMgdKDadQj4HNmX73iwXM69uwrX2PEq
         MegwIfpL9MG7RSlAP42zAVpEiltbhx39QelODlJ08cP/wG/JfOdY5es1P1iPDqUoxzKF
         haS0ofNd5IRSjlVnolYzmu5l9E8p0qCY9ouaIDPqZBenEsC0hlACQmnhaBos6DSkPqNn
         6iFw==
X-Forwarded-Encrypted: i=1; AKwUvBzTUd8CK1yh7JNJx7RmNw1l84b30s+f60N3vLk75NRRYWqCtT5HU0GHJw5HE7UXrBDmrkyXwc/gb2CH@vger.kernel.org
X-Gm-Message-State: AFuF++lGtCBXc2Jo2xYn8LZmlsLbn4awOyNxS6KZFuImANJ1vceNZFSI
	CM4a2IllpV6cwC5WEs8G+4AQ8qv5fh2Ed5pgwGk/N1vzsk+HORCbEsEid6EgB2U3hGHnEPmsThb
	ISaaqOmvmeM9+Sh00iBSMvAq2G6PqHEs6gVKEsoyFIbCVL/WXY80oOvOPzNKFH6ef
X-Gm-Gg: AYBFou1C7x4gxhc1L9+cu9D2UI5oOInvo6f6LHAuDEoz+c9zHHAuvuCvXHpVsk39QVl
	sUiwYRXQWY1qBekKmXpwb6xu1blQoD5cICc0rC7rr7akHbgK/YzDdGeWFZCMlmkLlVdUBwvc8IZ
	XmaGvRFad9PgW2O7aoxwkHEhEnBmrkMH5NCt5BRujxhCIhtnRTIrQXlxp9O/ZI8t5CqDlRfG/Md
	Z59UTm+SSbcrPRkqNarjzAvQG/2yXCMRhTGWAEHODBtUIQSLBNPu5mGdwQBC3ROqMHJnz7ge1H4
	BstlWNTbXisNUg+UT98Z5I5+LeArgBw9TbCd5ZfDVPjIK0mpCkcGDMC9vDx7+bhU9L9zi6To7nh
	5KfzpMAmpQt3tdO8YsjGVOQ==
X-Received: by 2002:a05:6102:f13:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7a59911c082mr7087669137.0.1790067690893;
        Tue, 22 Sep 2026 02:01:30 -0700 (PDT)
X-Received: by 2002:a05:6102:f13:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7a59911c082mr7087281137.0.1790067687753;
        Tue, 22 Sep 2026 02:01:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5b2d17sm49927166b.36.2026.09.22.02.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:01:26 -0700 (PDT)
Message-ID: <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:01:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vv8P5erUbPu-jcSLaWVs6lNPUIrmwhBu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyOSBTYWx0ZWRfX7NFUaNfNL4lS
 u/BFtlmEepF1epVFtlLOshbkSjAS5h6MhU/dbmGDD9f2ufYYPJkkWi4p+6okUmI83wdTMjLaZHh
 bTWXMWIXEHTwd3gjWW5DUMAHkfn9lGk=
X-Proofpoint-ORIG-GUID: vv8P5erUbPu-jcSLaWVs6lNPUIrmwhBu
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab243ef cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2YFxNopJgCIckj76tygA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyOSBTYWx0ZWRfX+3M0RAKWmLVr
 kVkAG2z6uik65LVD5ccubk/+iDUu+SECQTtdyx3kuEZqD62o8aCGj7uBBAjSDPn/yV2GuCTyt+4
 NPjYvdH+cnGYKEBwQmpgDN0b/z4pO3I4bguRjzOaEF2+xz4Y+RIuoWR7+qNcG2hRtsAwPU94ppm
 Ppr3NlyD3yYVfkYPqx7LPhMDigKIRI/dRGq24h7wX6pcB2huo9x8IN51awdN3wM/z0yHQc/SBAp
 NYnCXz4qoGKt8tN358+gEDfTd9AJCIIThHvrXQIwMn3KT1Ry92lfZIIPYY+2bD93U+Neg/ltg1s
 mfmr42pu+nKPLm4a3MUmz0zs53DGxhaMMynscomDrhjQ7o33vhqC1F1kXT5u9q0RNIGZsZOtJNl
 E4KnuWndV6rkxx9f7b3a5OEZ/2qVrskAMlcNdVUsQ+v9CE3B+d5zZXq/VPtd+gquvtZ6dvzbVDk
 F3Uqx1EaDFV9lhoI51Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220129

On 9/22/26 8:40 AM, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index de7c395d9c35..51fea666efac 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>  
>  					/* note: compute-cb@9 is secure */
>  
> -					compute-cb@10 {
> +					compute-cb@12 {

The unit address is interpreted as hex

Konrad
