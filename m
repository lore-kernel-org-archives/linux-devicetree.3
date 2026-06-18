Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D533C6A2B
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774938; cv=none; b=NqXImbrknf5jNi5CW3RlRPM4PiPddFHeh0V7qYrEDdtv/lFWdrMbbmboTFjkFReFe9HtK7bmoB5bLOS59OR0wZJyQTvuh5PQ1/dCGzwnLzqEdnat0JtQlQW/OGQjpU5rtPxX3fQr5eSyto3nj+dLi+8h97d5ZUFuF2peTiLvh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774938; c=relaxed/simple;
	bh=n0ehsZOkSmTfJUHo1S4dKm5sKDNwaeJI1q+rZLaqI1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emFs97Uomx72aZgIdll69cVEuRiQtL1tDsmodtzEqzb8xS2DS0G+9wAii/npe+JWandM+/4JJmQrknUHm3ochYJ3FtzirLzZcE635hzfUOAyWoC4lGo0AjHa9TXWJakOShEcX600kVPDqjmIRLQa8f+YS/4YbDPwbYLOv88CaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nb+ExJoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da4cHIAs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nb+ExJoK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da4cHIAs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G1pm1157459
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=; b=Nb+ExJoKPrZnZUDd
	7ZNuwFiLLwUionlJ0TLwqBXCS/Csod2cbRdklqc8B13YBTjkdHz8kjEriLfbTx8r
	M1/T4UGZbS6akBVNdIzTYq3PuLgoQwV90Cr13XPM39RjdbOKtFx+QkBRnGtUnxav
	KXt5a+ou+cmZrbfZ9IAxC9UvLsK0y5kQ8OxtZJ/UYxmGldjC77sopevEcMHp1qbU
	0hUUfkzDuWpKlGZ8qMru1tAY1rDqmIxD3QG+6f+bvXxzsgU60TPzdBTxgWN0sTZM
	VkXqZyeM47VAr0KEqv8U/d0u9ieji1ITrYMAYGbiRB9PDMHeMtuHRN7aXjjiVZ2H
	YChpIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a2rm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:28:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158ecbfbc2so13865985a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774935; x=1782379735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=;
        b=Da4cHIAs5ZqG9B+WbystUNfKvpMbTuTscHrtdTVzyXjqzMj6hyr+VdLavWKbYv3Dzk
         7QuPC9IgBNbVZWjWKov+UsArTWlOPTuKYNNYYIaSMapBH58O2//A1CKhl0ApvB8Cre0k
         67lXP/gFMi75DF6TCZJjGE7vo1RKkW5EH294YjLr5ORJ4nnzOWY6b/0wRl16YZZsf4YM
         HFvQQntFSnZVv4lQAM4QoRc9M9GiL9i3gWGRfTb/DF3sLt6wUcf2oxOLgXwZQDdM4SSL
         5/eXYQtTugyaNlu54Pp69KBq+TNZdMzWu/x7fZNa0cuZlaWMW840Pim17/1S8O3uTVzQ
         WAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774935; x=1782379735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=;
        b=ZR2ERRb3FS5Jbn/9Hr0MNN4Pdj6NTOLIhvJiDqci3/fUL6nExWz3rhhts19JkhHVOq
         tGRIdXL38Jx+drNKf6r4VgpXsbNy1+4i98ggVivgOd4yuCUPySutcpzf1n4MSwD/vtJw
         DIgCSfCcAiIKhO11vmKu5srg4yhXIs2cGrSMmZu4qxSxg224ngT1tZdvCNeG4lRhjdvH
         pLUvhHJUuN8IkMQXQ07tACUlCukEl9zvEImohxMegSmghmeCu3gcSIgB9/ZtFgkZdVIQ
         Qet4Y2sWYE8u1WbvTjzkKMMWaLqJdLiZr+m9WUQ72/hR+w6KyS/VGZ1r6FniMB6dvXlv
         7Ggw==
X-Forwarded-Encrypted: i=1; AFNElJ+ho43S6BMNRTV5Lzu5K8bOWZtEFsPA4NWnZa2Y+oPd0j90fC79dYcSUGvty+wYdSSLW497hXmRxsF2@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJySiTncJ2Fj2f7UfmKs09GuvFu3mhciPuPN/3OM+30saZHVe
	M6Y8/xUdg38HJjYTLXuF/oB3jlL8gt8CqsK2Ad4oTuY/gVJ8cTKloyzrXUKY2nF+6+a7qAQpkRN
	M4GLPoV1qcqPru9SWTNbzeZigMucQzVy9zBUwiROHgwR2s36rTr1vtXOQKu1R7FR+
X-Gm-Gg: Acq92OGoJ9sH8UpxyOY/qDL521iAMaFlYFukxaxhI8DEVX8dsSgkFNjuSSt8qSV+w8t
	M4s0T0zeJPNAgrGRc7tw0/uin8WNeLIh6t0NeOHx/ZfPW/rHO6AGW8GdyewOUZxYK5A0NoTi0PO
	44ihQ5+HCnGdCcsaYSdmFyXfNULMqVMUgTFF6Nb13Lv16vM62z5BaupEvG3rP2B7sVKe8ORyU3B
	0093YtsqqphxznTRbkmg9z8T0J2PSJJQo7Qk9GtnwhQBcYcvx/6OwpptgwD7iiZYWl2MrywO5Io
	FAoa8yI9J9nw/2EhWVc4sU9ZNGUT4WRMg4eZO4Mt0XM8AEBbjxskl6mX7xm2FXXszYWrF4CXJ6M
	VQxeSLLFLWRXDeBGgrub9yuX9traiJdfAKJk=
X-Received: by 2002:a05:620a:1991:b0:915:f92e:86 with SMTP id af79cd13be357-91f27cd63c2mr293828985a.2.1781774934789;
        Thu, 18 Jun 2026 02:28:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:915:f92e:86 with SMTP id af79cd13be357-91f27cd63c2mr293827285a.2.1781774934250;
        Thu, 18 Jun 2026 02:28:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69595d7934dsm1638902a12.30.2026.06.18.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:28:53 -0700 (PDT)
Message-ID: <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:28:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33ba57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gDzzPNA0uyMDLQwxZz4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NyBTYWx0ZWRfXx59H/Vies/1t
 4pN36yAN1uK4QEAP1gLhD1ZzIqDCU8y/GvSCGre9Pv4FW2C06oqOrW3vVsxhZLbnyVKU/B3A6BP
 /Gn5kX9OXmBG8vAwBBvBBAySrbwvx2s=
X-Proofpoint-GUID: 13WyDSSQ3bTTtfL4kgW5VdvUyVaHjylr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NyBTYWx0ZWRfX32N+y7mpzvzu
 XDqlyxqp9iP2rhPjiw5X+qrQSShy2dSjUEo/zfBYia+5xhcqv6f4kGIg17KcK7BMteTXmvVHXo4
 CeG9sg0BHFw7vEMwlM4Df5Sfa9qrbJx/NjqF4dk7wUP7YXSCSL4ue0Xq06BZSE71iF9pGFQrVu7
 amtki570YqwxkGeIQdqvzj7ULMJTMoO7+Pfthd6BYGCyvsRFladLQtNL6/5OU+8XVtA1B5fFGod
 8hMGUsJwEsMDvtvkQyI0YpewBspnsM+MjFBmHCkDz0xuxxYLWYVUQyUl4Trh8JGzy4MRRK+NgaN
 +jKtqMJ1sm3QZ2Ijz4u7aGzh9e4wUg/7f7A/R4E3tgOs0gwyCqkIOFPXNuejGeLaFuIMKLb03PZ
 /w7g4dH+gqqN5IAFgjgIYEFArdL/A2NFDen4oaHCbAFAgJVNDVPz3f+Pr+vUMOyQNRkx1Qprnga
 Mdh6JbTjaf8JABMTtjQ==
X-Proofpoint-ORIG-GUID: 13WyDSSQ3bTTtfL4kgW5VdvUyVaHjylr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180087

On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
> 
> 
> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>> bandwidth vote to be accessible. While other clients typically
>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>> vote, causing intermittent register access failures.
>>>>>
>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>> is acquired from DT if present and ignored otherwise.
>>>>>
>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>> during probe and runtime resume, and released during runtime
>>>>> suspend and on error paths.
>>>>>
>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>
>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>> consistently.
>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>
>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> @@ -53,6 +53,11 @@
>>>>>    #define MSI_IOVA_BASE            0x8000000
>>>>>    #define MSI_IOVA_LENGTH            0x100000
>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>
>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>
>>>
>>> Ideally, any non-zero value would be enough to keep the path active.
>>
>> This is true for Qualcomm devices. However, you are adding this to a
>> generic code.
>>
>>> Here 1 Would be enough to keep the path active, but might be too small to
>>> reliably keep the bus active.
>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>> power penalty.
>>>
>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>
>>> seems to be suitable here to reliably keep the bus active by BCM
>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>
>>> LMK, if you feel otherwise.
>>
>> Shift it to the qcom instance or provide platform-specific values? (My
>> preference would be towards the first solution).
>>
> 
> 
> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
> 
> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I

(you used decimal 1000)

> can evaluate if this could be moved to a Qualcomm-specific
> implementation.

Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
the QC driver

Konrad
