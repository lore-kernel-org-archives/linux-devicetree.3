Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7F3A48E4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930543; cv=none; b=nmq94LGBsrYzzSjpi0JowER5VqObMYYW/qV6FRrZN7Hp1gyij3UQ7wJRhgCzLX6xQ6lGyhiWvSP+AYR/pvObmk5jRrLOx3MNDNK/yqQCM1KeavS+J5fYPmT9OosZ9v9ixV4iviJWA+JjlHxAnhIhxHk0SHja/kGGBxxGYahnxYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930543; c=relaxed/simple;
	bh=EdjLsq9M6e7OqSkAmpQ+Nqs0l3gk1yzZXSScIFmIbhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4f86YKhmFim2ekXdcUTe7LRESldaFI5oWbw4xFe2WIe6FmAicQTN5wVWWKigEAOYPCI4NYQFb6XWYD1kU0NZNkNXMcyQsfgXGQ5wmLaHiNmyA8cf3R8jgpGUL503mulwoMXAYYeWjXpnuErlx98eiWAYHTisquzbhBFEekz/TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzHn2qcV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnzX3Eta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzHn2qcV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnzX3Eta"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nuwb568069
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=; b=AzHn2qcVkagJU5OR
	t6cv1tarXsnmnbbeHdvg9mMxYIfyJYmsD7EZTyS6TsRjmPvNqr/UadaC8kUPurf3
	2ooWfwx0l6C8JMx6VlDVbjz2Bp2MERbPVuF9gs52QwOWW7HXEGFuvy1Bv/77FoKi
	320vlf2PG+BYtGvMdahwCoLSrhzwGMmRFA9mjxDlYrli3p2yQTGVJdp4K0VpDDIR
	F4H2GKqVyxRrNJ52oVijhppdFaBWddttDA48+z2jPoUAUZyUaiopbNBQQI4o+ohR
	hgqNXE69A4g/36Z80sDlJCXMP4OWyurCqH/MeiMvwTx0ejQdd1X35qdnCtpBex+B
	V58RtA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe915517-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:15:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a87ef9713so40215771cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930541; x=1784535341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=;
        b=TnzX3EtatCQcIP2iAcDb22ALt1Vtdbml8L0Gq+4S5mKxhxdy0iXSDbaWOdtz+AxPLA
         CUjUCrFTqLxmLId9GSIgwsHpYzC+gV9UmGdo2qTn/l2REgDrTxaJpvTg/DY2IUXVEISJ
         XJHo0rmR8jtaWgeeB1zAggKxOMvPuCpWQB7Vx2PETiDLmjESyFS6zdMH9lVnAhXWeeFM
         r0MootYe86RBNBd2QCG7jIjYnfVAdi7ghEU3fiJeWnEaIuwf+JVUET5lbR88ttFTHMMD
         PLgyHZI+DvnoncyJ7UKqsh6uRRBlh/U2JPLzOsLbfKdfqTIqJDHhbV9ynxUam7zw4/Jp
         mvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930541; x=1784535341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=;
        b=gojUHVfh01jtVOYcNEji5MRZg6FrmS40ZxuBfmYYV534KSO/eoU2FWHhjMxDhCJvtg
         wYcE5sezZHVuhFCBHjRAZzRsoXM/uGD64+3YOg2OrrgDcUsLRc8s7XR1eBVystZ6Wokd
         pqepcPdGrsb5KcnBdgR9We0glvc04WjaqipstJQT4QaeTuJyNjjMZs6rBd//L+RO8Ej0
         1QBBHn9BkXdElpoSavwdeHjC58n2c+s3M6DfBwddxJZpy8jW7e2oghXnIIi2LfREsSzq
         TGLMrEIupxkeJZVFDyTspe5UB5ca+BnmK5o6ueK+xUornjyyedQWAFDevhYTOmyfk8Bl
         O/3g==
X-Forwarded-Encrypted: i=1; AHgh+RpLHA35sNhXSahdjKtPK5u0BSxkIEtUGSoPbt1H6PzJ8hcFObKpxGSMkjpvEHnSIZtxF1+QOZ0BHvOj@vger.kernel.org
X-Gm-Message-State: AOJu0YyL0mo4E+vXKtJND/v1mvjlR0RN/UXwNB9Au/88K8Rr35tT4+ys
	zg6t5no2In4+SFlYSixZBnNF5DHLX9YuD4AyU/UDkVWtaZThFLJgMNvEbxS56DsDrVBG0Yv33Y8
	Olv4SX+kbddaSaj6X4m5woqFQ1TO+GCHF5Os9mnfIJbVO8HwGjYu8wtOQ+wX3HRso
X-Gm-Gg: AfdE7cl2etq6BlO/zYDu4URpB93tyZcHFo91laq4F0EG6jfFhuLhLAKUI49spJtV0N4
	wZN/Orl3eOPAh+iFjJZ8dEvr0nbXljyQwQldBmwiVy/qVl4FSrc5FM31yekZDlZ4ZiD6AX8QMO6
	esf1qHO0Q+NRfeZPsQDf/rKuLDRZMTBTKNmkMl4flJQE6vOnb2pysZ126n8W3Puklba4DeN4EqZ
	3pycNcFZAWLh04LUtUx8/lYSAZjrBvvB4MAjYaYqj8ahHhybAcdqXbF+Ib4PqL/3pDyo5peZquF
	CFE/EGa7ybNqrWnMRk/dKElJ47OpAerWmBOOdngX2zHN4baq8pxVZCZX/Vlr3OTYDf9OJOsUCQS
	xBJIR5BkncsFZKk0P6EByLl/Qbjc+dA3m9/d5jvM8PkA=
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr129267061cf.0.1783930540664;
        Mon, 13 Jul 2026 01:15:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr129266901cf.0.1783930540269;
        Mon, 13 Jul 2026 01:15:40 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e19cb6c0sm606414466b.26.2026.07.13.01.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:15:39 -0700 (PDT)
Message-ID: <388c8f3c-ad60-46aa-9ade-042bcd148dac@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:15:38 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
 <e65358b0-b978-4672-9691-705897bcf209@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <e65358b0-b978-4672-9691-705897bcf209@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a549ead cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zbDFh1kpPF1_w5UJdLoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX2NcBdjUV9rbw
 IcZWwYvu/H/UyA0YFVugpHAeG/BdvCV/Q/04WhgE0GXS60xdxvkq+ovaP2MWriJUJdih9ovUfhr
 DeVYUgHLsY2b+0yjYns12X9B9E3B+lY=
X-Proofpoint-GUID: _R5JYJceze7hvM4Y7Ra-LXTWFOy8GjOx
X-Proofpoint-ORIG-GUID: _R5JYJceze7hvM4Y7Ra-LXTWFOy8GjOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX9FE1osoh6biX
 bG3vnyLAxUYGHUa2YgnPiXrWqsrUmGeQn8FxkVyKQxZGmR7J81yBl+pa9gcsCCiEKmUeFEYAxXY
 nP2/E0rDDnzR7P8is95tdXhRExrjG4j/jRxfOp6hmju9uCQ6dsGX6IetcBlLZybu7KBFTGxHKD9
 cu7xdKmDBPDaDTJf0R7kiJftd2A1CvIXAKBc+hbP24C6yb+krldxqDwdh6O7o67d0sKA0r0Q1Yw
 jkRFjjrqI3UDZ/Fal9YF2G0/pJHk7rtYIzZhHDxK96x+XOey8REGFnDu59ji0sXRIUAbQMVBPfs
 XuOtnV6NEHIRdjFBARl2vtseBYza5nXPY28H7QHc2ulmRo66C3foSOgmGlIDPhf1YRewc0F0/75
 +7EolY6uLhconPXMrt6hTkzPNBZ1R/2WBAEjEx3UN0z11hrIogkinmp48yxcW+7jE2aaEV1zC0X
 hWXYnvyiTf2EsqX22jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130085

On 6/25/2026 4:55 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 15:38, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>> that performs JPEG compression in memory-to-memory fashion.  It is
>> separate from the CAMSS ISP pipeline and has its own register space,
>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>
>> Properties documented:
>> - compatible: qcom,sm8250-jenc
>> - reg / reg-names: single MMIO region named "jpeg"
>> - interrupts: single edge-triggered interrupt
>> - clocks / clock-names: Common clocks and JPEG core clock
>> - power-domains: TITAN_TOP_GDSC common domain
>> - iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
>> - interconnects / interconnect-names
>> - OPP table mapping performance levels to clock frequencies
> 
> Drop, since when commits have such text? Why are you describing diff?
> 
> 
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 135 ++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> new file mode 100644
>> index 000000000000..ab8d8951d21f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> Nothing improved.
> 
> You actually ignored all the comments from me and at least one more
> comment from other emails provided to you.
> 
> This is not acceptable.
> 
> NAK
> 
> 
> Best regards,
> Krzysztof

Acknowledged. v5 addresses all binding comments:
- "Properties documented:" section dropped
- clocks minItems dropped
- interconnect-names renamed
- power-domains added
- binding renamed to qcom,sm8250-jpeg-enc.yaml
- JPEG modelled as standalone peer node

Best regards,
Atanas
