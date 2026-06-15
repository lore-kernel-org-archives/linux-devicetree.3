Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143723AB46F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529954; cv=none; b=WnndVTKJU7wov/pFjW4cg9fcuzZWm7Op6D59KIpgtbd9b8dMbbWqRDpJBMtco4FOdSE31yIsYGau2AkmJkg+oSzaRZ8I5FTHgLyICS/pQZnNE2l+WvaUpE6xMiWBG3Js35BCG9cBlTvsq6yFeq0j7dzdoKsEFEpYDCpApR9m6+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529954; c=relaxed/simple;
	bh=3xhHWlD8RQco2IA1KAQxhlJoKB5DW/j70I2e9jXDPe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYmbddBuVVvpcUaSg/Su+7xh7k/Aune3iFdOm4tjvb47yXvbRlF5CRYwvkCLkU7kPBG6h2zM88BO/5o8g1cf0a7mtVH+wx8knMqMcOKdHVv70A1NetilUU43RQGywpGB7fWPR7uP/desN7VcDTyo1GaCgt6rHS10FxBcHWZMwMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBOata2h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCIEG+W5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBOata2h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCIEG+W5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZb5J4116663
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=; b=cBOata2ha3mzT2r4
	NpDWj8zrLNGSUg7IPgZNw0ZxMh6wdFvQ7Lpe2wW1dtVrVuOcnrGTF5DNORb2qj/j
	lhPgBcWvfKnVCNo09tuDB+QlOgNwJrQAAzAQGP+g2S/KIwJG0vrCDRdRterxoSce
	mu6gVgODNhntvCsNyxS7jFeGUw6Nw9UXl38pF5VViGcRYReqGyFK0eVvKw+NXluv
	Sl2VTpTp9xCRqpeWxRA+wz/w/6qg/RVbsihsQNPoCs00flPzB0mwsP/k4kTCV1Sl
	D6eV97jg4mA3A9eQGroeGpbgluG/ftmNzsq0XH0JusyxxIvLkAaj1P39+HjaJ5ns
	NHD68A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjrv5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 13:25:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so3378756a91.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781529951; x=1782134751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=;
        b=VCIEG+W5dFBU7zILN0BbwUBRubesRG8hW/eStifBc02V+f1glW1/wY3LVHytnivR43
         5qmA7EIGVpjMPjBMzlFo4RQVaYyM2WOsw93iaDoPVMfdJKo8EpVxw1MuyhfE0o4Q+1FW
         C5W/7Moy2tnePNnkTGWiTekDAjgL3TeteQq+0A+Su/0rwTVlLl4VTMqoaTbo5qESXpRu
         oIQe/qUGp7Y17ehso7FL0p6OSCHMpdBhdqbIoxlXTq16jy1+dXQU/Yv+bWMPec0Yd7eE
         tCPRVai2AHGJC37pZrA59NLqX8kInfnKR+TxR7FAIA1K1I2i8J+8BHjYjXtlu6PZzqFq
         w5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529951; x=1782134751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=;
        b=Qd4RVtGjnR450+nrC/gR6lY+FV4McRkxlUgxOq+Ml5Fx4v6WbkjyGUocr5QWWz59AJ
         Vw0napEaEvIqysLm717pkVb14m4h8Og3htgGZSiezdNPz9p+SRFiUX1PnGAIz+Oi7IiU
         kkGv1g2yRADgXVRg8Q6QXI5stTYeERwJOP949mbNOu5zMKMxJZPSICUZONtbrB11bnK9
         MFziVxHU4YplFVdNJTPFR3OpQAvXaGI7pvjC+SO5KE/DRxgWJ6H+0LhQ8HZmtonoRGwy
         8qVauBcuMRNhCfbkVCRQ95tkfXDH+TEKU24bERxiWbC3WCHc8fX+iitP17Fnyq/VASc/
         yo+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8e8nZ+xIm6y026ozgBbCcGa3X8xZGvfKoRDz5V0A5W08GqXAL84XI6WhsyDB1ocHCNv4fvJ173wKyF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84T7A9bjuIDasG/z64iKZo/4MWR6MO6R2cNacKINZqls8ESYZ
	JjhE17KCjGSL8IVn7P95OXU1rZPSMm7AenIQFWnBBNLT1Sx0pvqmzdbWqao5x3I4fx3eT9+xohA
	+l4QP/R4QkwUvVqz50a4UjyFmPzsg0Pg2oTtrUbAUDt6Jv/J+NiuioyHTVhMwK32k
X-Gm-Gg: Acq92OHsh5fiGG1IyWzodGcJHJddKiz6ZGS3oiEnATX3rO5YOuQ4J/TBsD4vbfEH1Ez
	axiVmSJ8yGFAj+3V2onL2IPgQt0dFM/VRWtvmvx2x0iiMbh/748fdE3el8GflAs3eWLX4P8ZiG3
	QpmrJ7aKcBN0DDzcxoSW4SRPpRPO4rFM8Vr/tODXhv0HSS6oSMjYFa2NwgcxK7bI0kW7OCUR8HE
	sS66bBC4kztY9Nl7c0mqvBhtM51Lk5X2tSK3uGUYDAMkvegWVS4njD65touYV0IYVl2B7582nLv
	7k2ZIgcKWE0Y1EN/SPtjAgwaIYr+5ILGB2/0eufnW+AvR6VhdtWaZEfTG24p8zbYEwDODaDjCB7
	bcvDXnqW2R33tW+/V0+S6ZJq3oCCOkI88Ikgg1S0t4JXhuI2U2A==
X-Received: by 2002:a17:902:d4cf:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c4130100a2mr158666195ad.30.1781529951408;
        Mon, 15 Jun 2026 06:25:51 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c4130100a2mr158665745ad.30.1781529950823;
        Mon, 15 Jun 2026 06:25:50 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm104350545ad.23.2026.06.15.06.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:25:50 -0700 (PDT)
Message-ID: <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:55:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE0MSBTYWx0ZWRfX5Taw176CILQF
 hz+IlMDu2hNmYMRHwBQ5I8YAiANoQQJOdow0LwF3lxZ5ZG1ErR+ZlGf/JQQlSmggSV4bZVvJDYo
 Pe5kyuE941uWlW6qJ+DA1ZzM1VG3wUjJaByY6EVfuU5jQ6fClIxQqyd8vWDRSihMmK2g12CwgXO
 CxGvOMsTqrmXxPt6J3DLiYo0vc6hN/b3yD1ldHOGA3/O7gxCFhMrdKorE2Cwf5HgCiiqHg1AMuP
 /XXiSgtyA4pEr989A1e9scf+k6KLmLhKfk1lctypzeYi6r3mFBJgl4Gmxcrt20wxbkJ0GFgugB6
 oGGAT/M9gx7x9YBnh6Rw4rWR4zm+3T7sbUFlnG4LP34mzN+jyaKb0ocd9n9Ej2cbM9mjzZrQrkL
 ttVzNVOGpAc3FLuMjz8pajdBpY8tWFuESeAuds1zyWjeboGfJJkkTEQLJghQ4McqfRJ+BSFYO6u
 tkvrEmylWVG62HGhngQ==
X-Proofpoint-ORIG-GUID: bqdDecxR4Yyjvmg7GVet1FDF02f0HuDz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE0MSBTYWx0ZWRfX4LqhD78MoeYf
 Qi47sa+zoRl9K7OI34jT6gx6ihqI5wQ139yfMyjmQkHRjbtYjeddGkXX5HbS6wNtVVHM9ICcKbz
 aLxGJ+j59yuQ2j1qcbcVuSDLkdlpg/s=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2ffd60 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=he2KC8_JSkmjwAK-aeQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bqdDecxR4Yyjvmg7GVet1FDF02f0HuDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150141



On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>> On some SoCs the SMMU registers require an active interconnect
>> bandwidth vote to be accessible. While other clients typically
>> satisfy this requirement implicitly, certain corner cases (e.g.
>> during sleep/wakeup transitions) can leave the SMMU without a
>> vote, causing intermittent register access failures.
>>
>> Add support for an optional interconnect path to the arm-smmu
>> driver and vote for bandwidth while the SMMU is active. The path
>> is acquired from DT if present and ignored otherwise.
>>
>> The bandwidth vote is enabled before accessing SMMU registers
>> during probe and runtime resume, and released during runtime
>> suspend and on error paths.
>>
>> Generally, from an architectural perspective, GEM_NOC and DDR are
>> expected to have an active vote whenever the adreno_smmu block is
>> powered on. In most common use cases, this requirement is implicitly
>> satisfied because other GPU-related clients (for example, the GMU
>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>
>> However, there are certain corner cases, such as during sleep/wakeup
>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>> is powered down. If adreno_smmu is then accessed while the interconnect
>> vote is missing, it can lead to the observed failures. Because of the
>> precise ordering involved, this scenario is difficult to reproduce
>> consistently.
>> (also GDSC is involved in adreno usecases can have an independent vote)
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>   2 files changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -53,6 +53,11 @@
>>   #define MSI_IOVA_BASE			0x8000000
>>   #define MSI_IOVA_LENGTH			0x100000
>>   
>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>> +#define ARM_SMMU_ICC_AVG_BW		0
>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> 
> totally random numbers, which might be different for non-Qualcomm platform.
> 
>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>> +
>>   static int force_stage;
>>   module_param(force_stage, int, S_IRUGO);
>>   MODULE_PARM_DESC(force_stage,
>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>   	}
>>   }
>>   
>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>> +{
>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> 
> Is there always only one bus / path in question?
> 

<Apologies, missed to respond to this query>
Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
while accessing the DDR in downstream path (client->TCU->DDR), which we 
are addressing here.
Hence it's only one icc path in question here.

Thanks & regards,
Bibek

>> +	if (IS_ERR(smmu->icc_path)) {
> 
> if (!IS_ERR(smmu->icc_path))
> 	return 0;
> 
> int err = PTR_ERR();
> if (err == -ENODEV) {
> 	icc_path = NULL;
> 	return 0;
> }
> 
> return dev_err_probe();
> 
> 
>> +		int err = PTR_ERR(smmu->icc_path);
>> +
>> +		if (err == -ENODEV) {
>> +			smmu->icc_path = NULL;
>> +			return 0;
>> +		}
>> +		return dev_err_probe(smmu->dev, err,
>> +				     "failed to get interconnect path\n");
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> 
> WARN_ON_ONCE()?
> 
> Pass the error to the caller.
> 
> 
>> +}
>> +
>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> 
> Pass the error to the caller.
> 
>> +}
>> +
>>   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>>   {
>>   	/*
>> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	if (err)
>>   		return err;
>>   
>> +	/*
>> +	 * Acquire and vote the interconnect path before accessing any SMMU
>> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
>> +	 */
>> +	err = arm_smmu_icc_get(smmu);
>> +	if (err) {
>> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>> +		return err;
>> +	}
>> +	arm_smmu_icc_enable(smmu);
> 
> Handle the error.
> 
>> +
>>   	err = arm_smmu_device_cfg_probe(smmu);
>>   	if (err)
>>   		return err;
>> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>   
>>   	if (pm_runtime_enabled(smmu->dev))
>>   		pm_runtime_force_suspend(smmu->dev);
>> -	else
>> +	else {
>>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +		arm_smmu_icc_disable(smmu);
> 
> Handle the error.
> 
> etc.
> 
>> +	}
>>   
>>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>   }
> 

