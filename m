Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF333BF672
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883369; cv=none; b=kZjkVwabQl6Vd1KPZBOV2QM00xbCFPq/ciCmM/fV2K6L3wsvu5vcbYCDhqc0NVexbp1xCWsCOulfeahk2pqRqJJppHLHe4EUwOikwiObzWsw2vSd/X9nNaudVWO0qw8JxFQMVywdJoKnLL9ElfIPK9uChIL8sHiB4W1RWPPqlVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883369; c=relaxed/simple;
	bh=GGi5FP1TfaEYJKQ7ggUUrDXlF/3PIJtQncMwz7QMfto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TitzxkDGjJJWJOmeuYYI6er7w+PC8f0FvFngjNUcWigua4ACJdDXoHm6gJoNkhqmhCj3xIo+0ZHrHmMoV6H0/9w1G4+iUOrT5E5DxFBmvrfvWSNompYNYcOMJ9D6lKK97ykXcL5BkreMsw1wkrTKQrCKFPgsepGli3OMrM5A5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enQl/oxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yv2ieQZb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enQl/oxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yv2ieQZb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJeYHE2728539
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=; b=enQl/oxkGo4EUY1C
	0nmObNylCTCi+UVv7Git6oE8B7q8Bt1uKHiilYmDewZ8qqnxSX6AK/PKoKpOLIm1
	0aWmlBr6qJ1zvln6zk64GhcuzLUmoTAHHN/xfsc+4BTUxqsBnaGC2gYKHVPlTKyZ
	x5CG8V/PoH6TiqHonXu+3gMcp6HhDy4GETZblyihZn+z5k5pfcuot0+O9mFVesey
	q4kxw/021aWB2iYk0ygL7qx0AWtv/qXYJbNO6tbzOooKCEfxaQUXryof/9EYjPgV
	yNF7vOe0ErUh4Sdj4zyegucA3XumsC0oM6di4BXlncDVa4h9UK5uPFTNIulzHPOB
	kKZNCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6901rhry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:16:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3692f395339so219456a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778883366; x=1779488166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=;
        b=Yv2ieQZbzqSZOCu/kZu8O3+8BxHj0cp5tYLmGOD7Z8s3HpWfUVfo3AhqH6IE1c7ElN
         4X9SGpyRwUPfzGQcudOU/2qOoF6LjTzGxJ5Uv1P9+Qq2uSEK3zV4EvHbUMj0Jy/YxSFO
         /0N3Co/xU3NoFeSOzx0SNV2LDF3bYQO9i9JaWtF599TLM/k8bkJkAr12eh5LGc9nGBPR
         Ynvi1CwkkF3jph+ufl+/CixG+o/TQZUmGKQPLAwYSvJ/8kh83ZVJmxalZt4ZjliYfMV2
         zI3tWFoGDo1KujZRAuF4BNF8dbtuY7vKHSVeE9GPpmMbRjy8Em4PrYJmDcdf7Jre2H9T
         Ek6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883366; x=1779488166;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6gFmG52451iCRGkhhhcMmCq+yZXn0FSxt2aFKyqf4k=;
        b=iO4PTmLfc0BDYQ4+zN3RsDtdfTW3E3gAbn3kBDCI6BrGb6hgtr6hy1QngKoa/UmVWd
         m6ijw4wL/L6p6w2MgAJh/pa+kVwuVBvlVcER2Y9CR5THpbptDc/xemfKPU8zcJQBIyUo
         YFiiaoZMLzVfOw0BCYD5UxD7v0N/AkRsvdOG3poZHsPaTYL31DHXs+tcOaM3FN9IjOpu
         ff0UtZBL/w2yPpwuE9EO3iXTeyiW+1me7881CcQrKVbeHHKoyfU/7IFT5yUD0Qms9hxI
         iqIlogjAGvGGXcaGVJF9dceYMFT6LtxecSK4HP6xQz/Dqin0o4v+laTX3mS9B/Rm5AuJ
         /usA==
X-Forwarded-Encrypted: i=1; AFNElJ/hWy8zslEveIzYjszao+shh8ndEq7XfEL0wJAQ7DUU/kwgdQlkopxKTMPyCkwT0JPpj60gXI7naXDr@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBdsDFI5AwdGoHzMRLgwq9BgKTXYC9lxh2vT5UTUpJ1PH5Wo+
	C3jPCumWAM2SIWuux8iS9pTOpJTcF21qEvi0Yre97Bcpc3aKjZCdBEbyiKW9FotVZ6V5rntZ3ds
	PIQI/UvTyg/3z+V09f+wFV1qdHk8Nqh3dXd2d+LOKuaXez/pkloMrbj/WQWs9XEzM
X-Gm-Gg: Acq92OFgQqvrKDNKJjbKKU93+62dGaKPWLRhXLCcDZJ/CPrfUfMgMfRy1u4WJ4qF/m7
	kFPxxf+fRjwNirtWkc2rWoDV90kiCequjOgfDmHWSyRSgEx2rajJP6wQ1FQpnMpaBmOg4z/1j74
	u94VaGcBU+/qF0cMUOuoS5fTgHzugWnL+25WqlrX4/WfVltY5apWEqA880t62S4s642wpBsGegd
	hnnaPgxfNy2IMPqHTPPTFAjiN2P+a1aaINloprPWBYoTYkO2Ul+kYrLvQI/q7qeOPmtdr1HwZ78
	16bsQkwZ2bVw+8oY5ZAcqbOdgjGUYjmaqvWxm5fVd3I27Ea4AM8MMQ6fymjggZku+Nz8nxOZB2L
	eZ71NZWbj6QjFxMvr8zgTC8gs+R3Rd8OX2cRoKt/KwvnP+V83+gv3cw==
X-Received: by 2002:a17:90b:134e:b0:368:5367:d681 with SMTP id 98e67ed59e1d1-369519c348cmr5767566a91.10.1778883366306;
        Fri, 15 May 2026 15:16:06 -0700 (PDT)
X-Received: by 2002:a17:90b:134e:b0:368:5367:d681 with SMTP id 98e67ed59e1d1-369519c348cmr5767533a91.10.1778883365800;
        Fri, 15 May 2026 15:16:05 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb11683fsm6304190a12.26.2026.05.15.15.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 15:16:05 -0700 (PDT)
Message-ID: <f946b661-ee69-4502-9745-247940c54653@oss.qualcomm.com>
Date: Sat, 16 May 2026 03:45:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
 <20260513-glymur-gpu-dt-v4-2-f83832c3bc9a@oss.qualcomm.com>
 <20260514-pearl-mamba-of-inquire-e4888f@quoll>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260514-pearl-mamba-of-inquire-e4888f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIyMyBTYWx0ZWRfXwClLTDh5wh0L
 e1OeiHh9BID89yGbzDRik/NZkVzFDEJeXb+jrQ8xh1xnHWEzqz4owhakBv/IMIJKxb5bAr2cZvk
 l6UujnR37npUhw+HQ/deh4FIPAwCvWzPGrrS0f2ay7DKNCA2m0w0exZEOMOdEjQxysvv7MbXwzj
 dIGx39BPOKXnLXNMWsH6eMJfxU30oGwEB6bXgU6pR+JDPbhUhcPms2ug8H2MNC4BLWDyjDFD6qg
 IvAH2CT0+Su6kyT0Ed3RziD04/Jvf8a4pv+YN+u4udSmDpMzUiElC0PVjzuXNVG6vc+DEf059hj
 6xxuTWqzjTFbOjgSojNWnzIIWOW+viw9W3MVkfSfX4XTn+8lABNhuKbNo06Pfq1aJn6LE5SgJox
 Z6mcenVwcioCZRufz72GTwYzwm1QKLGd4yuNVrO5HNWrB1eAdjoY3N2loicCLZbhp43SJuprNHR
 LYgxmfwQ8UZY8lU6qTw==
X-Authority-Analysis: v=2.4 cv=A9Bc+aWG c=1 sm=1 tr=0 ts=6a079b27 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CuuWk3emYSqqoFdssNoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bHvOygKxXOGMZhv0jQucGzpzMxLEy20J
X-Proofpoint-ORIG-GUID: bHvOygKxXOGMZhv0jQucGzpzMxLEy20J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150223

On 5/14/2026 3:43 PM, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 12:51:19AM +0530, Akhil P Oommen wrote:
>> Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
>> It features a new slice architecture with 4 slices, significantly higher
>> bandwidth throughput compared to mobile counterparts, raytracing support,
>> and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
>> other improvements. Update the dt bindings documentation to describe this
>> GPU.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
> 
> Someone needs to start applying Adreno GPU patches...
> https://lore.kernel.org/all/20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> 
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index 04b2328903ca..e67cd708dda2 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -411,6 +411,22 @@ allOf:
>>          - clocks
>>          - clock-names
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-44070001
>> +    then:
>> +      properties:
>> +        reg:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        reg-names:
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_mem
> 
> Are you sure there is no cx_dbgc? If not, then just minItems+maxItems
> like for 'reg:'.

I merged cx_dbgc region into the kgsl_3d0_reg_memory region for A8xx
series. It was getting in the way of covering the entire GPU MMIO in DT
without overlaps.

We don't prefer overlapping regions even if it is within a single
device, right?

-Akhil.

> 
> Best regards,
> Krzysztof
> 

