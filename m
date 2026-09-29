Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462D851615C
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682245; cv=none; b=Y+vYHcdhyrfaUps481hMRVZlXknZHZsP0l83BJlqPRKF4U2UVr3IHncj3Pj55rFI/VzkQPTpfZZbau20orhvdcP70E88f3ZfJFt6k6U0ZwfPqtCV1Nb+WgHC1NB8U1+51e8CqRoROkWxBd41KdP/TaHRB8e3umpzyi1zLo7SD2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682245; c=relaxed/simple;
	bh=vqE74hSqpullA8LLZ475ZN4prtKm1cvbqlh6+zEdAYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYluIBv/srM9O2G1X5RHM4KPzjWMCwccGT6emr6/R2kjfaqQ/16E0kaJovNS4f3I4/x6HJbo146gFplf8rKrjxnxi7KGfZe4gwuKooavzPjRDw4llnzZzRwwY63pQLL33L4K8jAyFRuELjPxPSKbNWz178LPEvs2C8cjY/rmd1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2a/30ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MkKWnaQF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2a/30ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MkKWnaQF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjSQZ1196346
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 11:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+ukk1SWi8NzAbh3z6v2PaRAJT2YQzW/pe/nUUSijms=; b=W2a/30ZGjxUjRudd
	HL9zqrdJZ/JGZrpE9qhefBa4KGXfjdWghvRWSRJHB7/LgoBicLjGoO5Y7vAoAiXg
	13XoPgS0VtFIBvdwhfUAN5Rn+3tQ7nOCQmtSN96WH2AzdOBISWDfa9gbK3pU/iCE
	rfey8LqpAvN3LOIkvQ6raCtyAbNSM9OabjpEvlL6a8oBk3xKKSyuhH7Ia+RkP/2B
	1S+zzCOT1HU/zLZMtERCDN6MeAQZLcMl2cw8q+uUUEAG/jg+FJnlpUbXF4vSRtk2
	pvrpGM6MDbjCwp6nv5IK2ld2lyF2bTVHvatFdkdOPljt0wjd+TdyCH6taihMOJtq
	VJCr2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03kt2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 11:44:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso781003285a.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790682242; x=1791287042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+ukk1SWi8NzAbh3z6v2PaRAJT2YQzW/pe/nUUSijms=;
        b=MkKWnaQFw04Qo9Vi691c/10feQR90neXxbbl5X4WUsVC9Tf0XClnxgaxW8oInPorNd
         yEJ4OtdgUJInV2PEk0tE84MhdrpG5TtDLF8UYC3t6dHAwg6DiBT0W652cLhGlVH2UYpR
         b8lVfD7Db+kvbQHLGtNLriXoc4FVN9LaUcCZ9PduPWn86LO7WVt8C01fiIS12B+1WMZq
         5BL/15W6JHCWkC5nRGssgKQbHnCupXDI83+deTOqjGihSVy7OMVkw/ePOLzLUAzvsSXs
         jxHl6lrbceBcWpxc0mjyCq8VUGdHM2ayLPcPAduyMVZKVwsq5Pzyr+YWqENnVHyvfSCq
         EYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682242; x=1791287042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+ukk1SWi8NzAbh3z6v2PaRAJT2YQzW/pe/nUUSijms=;
        b=iaXoiskNwElTRyeYoPRywsbkTkZMFrCWWrJbbYQEcbhdIK3oqhcc0NAOm0iYE00qKt
         +fMwqKl4g1Duf5K/papLN1l5iMSnQYIIBj6FvKbGcvYeubpd3CtP1BGGymKYTjtjm6yZ
         QJ8BEF615EH8Vzv/RWbvR+4AZCs6lJq7QDuArMggmyZRTZYaL/WokqoKlpjxzd8/s/Wu
         SsuFQowsizRS55WaT9J1lJH2Lf57ZnANhuy7brY1ZlOJUb0S/bNDe0d8DXwU5bBFeAgK
         JEdrKPqz2dflwpjYvONwuINm9YVg4mHzD+Ie1BVUOvCa2FEHqFOha9nUrw7UxB14vJ0y
         I4NA==
X-Forwarded-Encrypted: i=1; AKwUvBzxQ2Rf6ZyDdi4T4AjNUzx+wAPXGZu2QNU4pgLTXLWOF9SFfdoctr6QXB6Ut3CMefyjSAuM4JSzGyT1@vger.kernel.org
X-Gm-Message-State: AFuF++lrqxNrZn0fm0tY4o3CWOYVPF0LDkmD/CzKI7LeZAtARK436335
	vEOZ/sOrHJRnfA5kk8mBqIpAx4iCKXOJKUN5jyl/YxLCItCE8HsEGYszKWKBQlQkx9CCu7Evw18
	RC7JRz2PI6FjAccYICfppNO9Ipv1hkgG37SwGO5YiNzL/CTuI5uDsoT8jpSb4in5k
X-Gm-Gg: AYBFou0SrVUMJAPCNS/kwb3fi8XN7f2O0tXM3CL9JvfAyfid2w1P8Ujc/AVW8NSkba0
	ExY/u3ALQQx5j/TTxn81eEb/WsnYRAfvvDQolcbI5RDVMKJwrPqZ70H6KmoYTQLt197ZDL2knNe
	yDrjTh7Hs2x8a/IyMXoVp1zXXK6lCkxUqXIHXDQCOL+wUNUIiiGL02SXym+jn3DYEjHqshT4TXK
	tNEKuLrZy5iNE8nEssNdiyidC6WazmnxFkiq3gznnUE6Q4FZTzD6WqKkklMMM2HPsvxiTXeFp+7
	Sqzg9XZr3vITA9BpsUmVcb9soQfU/BVHHox6WbDjfQnfK4ySWXTA37fgacCZDYdqJW2S/pAJkDO
	IheEc9EM+P01tLFg6ftf98+r5CyJF2DkbSDXzHX8=
X-Received: by 2002:a05:620a:404d:b0:939:9f51:29a0 with SMTP id af79cd13be357-93c43ce6b41mr2573892985a.50.1790682242290;
        Tue, 29 Sep 2026 04:44:02 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:939:9f51:29a0 with SMTP id af79cd13be357-93c43ce6b41mr2573889185a.50.1790682241809;
        Tue, 29 Sep 2026 04:44:01 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm86145495e9.0.2026.09.29.04.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:44:01 -0700 (PDT)
Message-ID: <63cc2480-a8b7-460f-b89d-8526cb17db36@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:43:58 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <w3u_oVZRxmZkAlC5RmxuB0v5k970jezsVHDZvryQ3oYkStqmsp79LjODiA0mYkNl1jkRya-7Ncvk8KGrE1vnUQ==@protonmail.internalid>
 <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
 <8df7fdb2-813c-402c-99c0-9de6b0dbcd0e@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <8df7fdb2-813c-402c-99c0-9de6b0dbcd0e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfXxtvggzr8XEco
 t7qIfNnCsYOXbgJOi5/GmIvLZpg01iOoBySjN2duvsRzuZ202i7gTY/oQF2hrFBIlNC8yIury9u
 ZcC9/FW2GkTifTPQqGDUXiI2jlmh7MI=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abba483 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=R6d1XtvNd3bo7WazfPwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX7CVL2mJXV/XN
 HLfGqvL9nJIL7xujAq2Kb+6sfTA70c6un9UK62Du133u4XRXaUBsK92sKSwl22rXKeqOdS5y354
 JQTqcAms9M3BrwzoPMDfo8gwV/4oSM7+eUwluxtkEehXC31zJlSJ0exGa2vldvMiCeL3IiQ+7aD
 nhqsTv3owjQw9PZzmGqZ9EaId+p7NDptCnNmQY0kyfADAi8YOrUPiixZ14N5HZonRNkdfxgufsn
 2WX1nudK80PiP2BYBx5la3BkvtpY4rmmRn9whikhiPK5qylFQzNew4Rg5eIiS5eQw5fYuiOVtz/
 8uXlPc+NVgi7zTHz7uFHYpF6XezhIRCtKF+FpnjR6xZ3EaMT7QU7dPVVLkrW8OejJ2xcHZNnTB1
 71UYmmCCW9flCkNU5Dja9QqUigHFmyHAFlPFYZo4mBhWnfn3O4oD1g9i5MPHJci5aAYsDPsulAd
 Rmz8HF9RVuTNoZYGJ3Q==
X-Proofpoint-GUID: mHBoxw2dYxIzzd9YtirWQDUbubj0ZBVY
X-Proofpoint-ORIG-GUID: mHBoxw2dYxIzzd9YtirWQDUbubj0ZBVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290046

Hi Bryan,

On 9/29/2026 11:39 AM, Bryan O'Donoghue wrote:
> On 19/08/2026 10:32, Atanas Filipov wrote:
>> This series adds a device tree binding and driver for the Qualcomm
>> Camera Network-on-Chip (CAMNOC) interconnect provider for SM8250.
>>
>> CAMNOC is the internal AXI interconnect within the camera subsystem.
>> Multiple camera sub-devices (IFE, JPEG, BPS, IPE, etc.) share
>> CAM_CC_CAMNOC_AXI_CLK. Direct clk_set_rate() calls from each consumer
>> cause a last-writer-wins race. This series introduces a lightweight ICC
>> provider that aggregates bandwidth votes from all consumers and applies
>> a single clk_set_rate() call.
>>
>> Changes since v1:
>> - dt-bindings: add all SM8250 CAMNOC master port IDs to qcom,camnoc.h
>>    (IFE 0/1, IFE Lite 0-4, BPS, IPE 0/1, JPEG, JPEG DMA, CDM, FD, SBI,
>>    ICP) with a short comment per group (Dmitry Baryshkov)
>> - dt-bindings: add IFE simple consumer example alongside the JPEG
>>    OPP-based example; clarify opp-hz and opp-peak-kBps semantics in
>>    comments; fix maintainer email; align provider node name with DTS
>> - driver: register all SM8250 CAMNOC master nodes
>>
>> Atanas Filipov (3):
>>    dt-bindings: interconnect: Add Qualcomm CAMNOC ICC binding
>>    interconnect: qcom: Add CAMNOC interconnect provider driver
>>    arm64: dts: qcom: sm8250: Add CAMNOC ICC provider node
>>
>>   .../bindings/interconnect/qcom,camnoc.yaml    | 124 ++++++++
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi          |   8 +
>>   drivers/interconnect/qcom/Kconfig             |  10 +
>>   drivers/interconnect/qcom/Makefile            |   2 +
>>   drivers/interconnect/qcom/qcom-camnoc.c       | 279 ++++++++++++++++++
>>   .../dt-bindings/interconnect/qcom,camnoc.h    |  52 ++++
>>   6 files changed, 475 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,camnoc.yaml
>>   create mode 100644 drivers/interconnect/qcom/qcom-camnoc.c
>>   create mode 100644 include/dt-bindings/interconnect/qcom,camnoc.h
>>
>>
>> base-commit: 9e970952a9503d6ab471a2fea4c10b6a2785406f
>> --
>> 2.34.1
>>
>>
> 
> I'd like to see the code for actually _using_ this in CAMSS, seems a bit 
> incomplete without that part.

Yes the next patchset will include the CAMSS part.

~Gjorgji

> 
> ---
> bod

