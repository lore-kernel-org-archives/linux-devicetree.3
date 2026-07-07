Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4F40D58E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428244; cv=none; b=dhI4S8I35sI+MOcp/fj68TRGLOCB1DqCRCGM7i9oUxIhVaZLBYt2AWOeCOr/97J09t0jKA6jg3MQSZ2PS7FRwG0Nq9gXdpnsg1UoLVS2REymryLKEdBFCvtrLGrZ32koZYsg24P/4GLHpdzPwfcC9U7tb5P4cNPd0KlS1QbS5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428244; c=relaxed/simple;
	bh=jj2vRusPH5dQvYdLb63Wzcj6U93bufwVr67iZ8YvRfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjyjJqNAVDyoy4NBkJO+DOzVlvHEvll7CGlOUg3tLxJZidaxJv2eVUaWei4dghhQlQaRC9yo/jNkre2SQ6B/+qNYt0QCgt8hGB5vYQsDCaWLocbvCkdfr0H27kNIqtg92KGzX2Li1zq0GxAvYQRXOFVkZDhKPs36BB61AZGTqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XD7NvtCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1iDwZqF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XD7NvtCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1iDwZqF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8mpw3606303
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 12:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=; b=XD7NvtCvt+ciicLc
	SFxlsBX3lxxlCeJzhe7+FCQ7sllI9nmp83Wp7Q5Sdw/jmrb5rQBlLklY94ke8uxl
	K6pKpodACkGCwZANRoY/ahbVze0XEd0WNFcHhLwgU45NyWXU71Lmy0HjRcqBT1/2
	3Us/ZWIr7YBgPOnRx+bZ6X4v/YQLBykVEJDkInXoliJRFKkAS5aeKDAGa9+eRVFX
	Pmfneoxro2uCyK3yJpFMhoyo8ImDUV4ajCP+8UxV1LpodyHlMaOY+ojAQ8Y6Gkz+
	jxvu/VCOpPonyiTABDAOLAeapPcB7X82j1ji7/KjywSz0hc9DpPkkJ65jwHRwfOp
	nEXIpg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8j0p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:44:01 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb58b8b31aso5554402a34.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783428241; x=1784033041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=;
        b=I1iDwZqFOn199fseRsK29y8g7LcVBK0yjKf5KmzUiLHm63574J8CpBgDyRI6sae4pa
         +UxuZplNlP9/IBStIyz9Pd7b45KaefNJV8rfaM038Hlzxqd6qF0k07IXA9LiTAum8Nmg
         IZoqwzeCXgswSfQXGDuFOLYLqmP0DbV6Z40MzyFqsgqqcc1otU5RP7En121WsPLxQVgy
         qnSegP5R4+iXS0RTHaQ8ZgZsAJZM5wzYPhcSWEke0tZgAY9B3kYml3iBLEtmwJgn2QMW
         mzmEGrhf+5t2GgpmOpAOntw2am92JxQLuhg/opP2O39hzLLtsdsme5RqSYep/+mfrOcf
         KxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428241; x=1784033041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=;
        b=Z9+7msqS0zdJ8+IIVgp1S0+Qb1ww7WkGeVghM3f0SGhoOr+sam9yiUFzmvVyrXKxL3
         zXAJal9IbuKVp+s6TrvHxNZzw+yw3fbtjbD7LrLDSlxia93dYzBl7dhAFYt00pGQFsCA
         Q5LBjAjBP7mQ68RSbs2fxwSEgpw9u2DUG/3NVgIqX6oLm7jtLHbiuyynhXONWqf0g652
         PBkEmz1gC2/YBa+GnX5sv0zuqmQGYBzHKz6IaBCUsp5qxJzxp0aAhBXSNGj6Ob/0ICj/
         hVlkkjv1e5YbAXT1W+MhYL7F/jL0N8hwa8nprEYXcU1vqLWzChSMhc5d0JfY50jiFt4W
         gDOg==
X-Forwarded-Encrypted: i=1; AFNElJ8uM1NB759ktW3C4Qotgw7naK8Cm4PLUjcuZbKPGOvPx55cMiorSR7o37yae0LaMBn2Q+W1mkX5r1IW@vger.kernel.org
X-Gm-Message-State: AOJu0YynuxK9ABqXADE4wMMRJ1tK7/tjfasQwGR2wOgy7faa95Y1u3XF
	TBHjGX52XylPQkXI6k0szg7G3k1BwEryvbBVi1rRVUKGWkW/6uHuwEx3G6lM5Ik0lvFBQ4S2UJ6
	dOl8CAQdXfwZfzzNNFqYMw2HeEzXF2JHexK3bzCRKTUxYAusyiAXcS1InM5PAJkWQ
X-Gm-Gg: AfdE7cm4PzsMNluV/2wluZKNpejdo6u5fYHAs5uEuCrkNW9eCda6bOfxrSRhCrq7dO6
	iuL9KcQLy7hZ2EKX6HqGFfirO36oMslpLj4uiFSYkhfkq60C1ORGZv/TjCt/oVq+zt2fsp1zIuh
	SRLqtC/xUExxKt/uGeNRwMY8IGHU1Ee3QTQHm7n3aW2waEkHrVRV1roWtVOcFYXheltkwx36Z4H
	c3uDY8D39BJlaNyWU0T5Bk43GvTzF6ROJBYNY0ezVSoK0pQKTrlVz47tXDmzcjSqp8ftHeMb2C4
	wURdnxB9GDpT5M242A7qu0tAbVsdERsCUJkmtV03ObSR3s31uSu7q5DT+20hr5JmIaLOy7JS/D8
	c9q54N3av3JZ5PwUQwG0/cnMjS0ALCYS3/0jUlRw=
X-Received: by 2002:a05:6820:f004:b0:6a0:f3b5:12a2 with SMTP id 006d021491bc7-6a3553978e6mr3648928eaf.20.1783428238541;
        Tue, 07 Jul 2026 05:43:58 -0700 (PDT)
X-Received: by 2002:a05:6820:f004:b0:6a0:f3b5:12a2 with SMTP id 006d021491bc7-6a3553978e6mr3648859eaf.20.1783428237043;
        Tue, 07 Jul 2026 05:43:57 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a31fd2cf7asm8442320eaf.4.2026.07.07.05.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:43:56 -0700 (PDT)
Message-ID: <8fcdb7be-0bb4-4cf5-b969-6e5b0b516f87@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:13:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
 <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX+6zeOxMeDLnf
 YWf1728qW+8jwb40/85Wv3F0EyVriMUVcckjD9tBDJWQQl2TS+SU+BMCkdr1sGix2VPf1dp0+d0
 86xYNY8DKJKKrnCAOk6RgiUH+NtPDe3/7ElQc/RELqBOoquq+SJgMgbI//fVCIh5hYmtkmtLqv8
 6YgWpv73Em8SLex6v5lHxR1PW619fQAU/8qzdxy7r44qw1VITe2ywsBWE2XSUmj/ouq6K2iJHYK
 bC5OD6vrZ61YFQg7PDBqGQk/EdT1ktD8dlcmW093dAcvUtZc7mfPHVKtXfoMm7AqaUfIhEHMP6k
 HCz1QXS3HC8F6LsUh0wM150UBbUlmb4RqPVy/ymtRGM6LTBPplSo1mmiCqzM1vO4a3Xys0cNXBu
 6nuGIUCg7oPh/iEWyxaTa5Unb4HZaYxTdByJ37X7fNpFCW6SJ5O/KDMbg8wIDwoNi5LxxiSQn+3
 +nP8y+s/WG17suhExlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfXxTyHxK9pAYbj
 Ce7FoEuTXsKnKezSxhc6ocPas/d8wOWHlNLb2j8LdDBlHv0YKUkvqIIAyWIRg3JgoHvfV1owNkC
 yFkUFMHMPaWQ3zU6QDWKIeNCYDsCE+g=
X-Proofpoint-GUID: b5AfM6UTeyep3l_AVAnZiYeJZobt1kO-
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cf491 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RRvI01qy6g1rNRViaBEA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: b5AfM6UTeyep3l_AVAnZiYeJZobt1kO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070123



On 7/6/2026 11:10 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:35PM +0530, Bibek Kumar Patro wrote:
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
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++-
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  3 ++
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 27 +++++++++++++--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>   4 files changed, 84 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index e2c914fccd6f..5133d3ab023a 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/acpi.h>
>>   #include <linux/adreno-smmu-priv.h>
>>   #include <linux/delay.h>
>> +#include <linux/interconnect.h>
>>   #include <linux/of_device.h>
>>   #include <linux/firmware/qcom/qcom_scm.h>
>>   #include <linux/platform_device.h>
>> @@ -607,6 +608,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>>   	return ret;
>>   }
>>   
>> +static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int err;
>> +
>> +	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>> +	if (!IS_ERR(qsmmu->icc_path))
>> +		return 0;
>> +
>> +	err = PTR_ERR(qsmmu->icc_path);
>> +
>> +	if (err == -ENODEV) {
>> +		qsmmu->icc_path = NULL;
>> +		return 0;
>> +	}
>> +	return dev_err_probe(smmu->dev, err,
>> +			     "failed to get interconnect path\n");
>> +}
>> +
>> +static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int ret;
>> +
>> +	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
>> +	WARN_ON_ONCE(ret);
>> +	return ret;
>> +}
>> +
>> +static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int ret;
>> +
>> +	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
>> +	WARN_ON_ONCE(ret);
>> +	return ret;
>> +}
>> +
>>   static const struct arm_smmu_impl qcom_smmu_v2_impl = {
>>   	.init_context = qcom_smmu_init_context,
>>   	.cfg_probe = qcom_smmu_cfg_probe,
>> @@ -648,6 +688,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>>   	.tlb_sync = qcom_smmu_tlb_sync,
>> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
>> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>>   	.context_fault_needs_threaded_irq = true,
>>   };
>>   
>> @@ -658,6 +700,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>>   	.tlb_sync = qcom_smmu_tlb_sync,
>> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
>> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>>   	.context_fault_needs_threaded_irq = true,
>>   };
>>   
>> @@ -667,11 +711,14 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>>   	const struct device_node *np = smmu->dev->of_node;
>>   	const struct arm_smmu_impl *impl;
>>   	struct qcom_smmu *qsmmu;
>> +	bool is_adreno_smmu;
>> +	int ret;
>>   
>>   	if (!data)
>>   		return ERR_PTR(-EINVAL);
>>   
>> -	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
>> +	is_adreno_smmu = np && of_device_is_compatible(np, "qcom,adreno-smmu");
>> +	if (is_adreno_smmu)
>>   		impl = data->adreno_impl;
>>   	else
>>   		impl = data->impl;
>> @@ -691,6 +738,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>>   	qsmmu->smmu.impl = impl;
>>   	qsmmu->data = data;
>>   
>> +	if (is_adreno_smmu) {
>> +		ret = qcom_adreno_smmu_icc_init(&qsmmu->smmu);
>> +		if (ret)
>> +			return ERR_PTR(ret);
>> +	}
> 
> Move this to a runtime hook to be declared in *data.
> 

Ack, will implement this in next revision.
<Missed to make this a runtime hook as it was not being used
anywhere else outside the current scope of this file.>

>> +
>>   	return &qsmmu->smmu;
>>   }
>>   
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> index 8addd453f5f1..6835b40339ce 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> @@ -6,12 +6,15 @@
>>   #ifndef _ARM_SMMU_QCOM_H
>>   #define _ARM_SMMU_QCOM_H
>>   
>> +#include <linux/interconnect.h>
> 
> Not necessary here. Just forward-declare the struct.
> 

Ack, will take care of this in next revision.

Thanks & regards,
Bibek

>> +
>>   struct qcom_smmu {
>>   	struct arm_smmu_device smmu;
>>   	const struct qcom_smmu_match_data *data;
>>   	bool bypass_quirk;
>>   	u8 bypass_cbndx;
>>   	u32 stall_enabled;
>> +	struct icc_path *icc_path;
>>   };
>>   
>>   enum qcom_smmu_impl_reg_offset {
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3..a27804e15738 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -2189,6 +2189,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	if (err)
>>   		return err;
>>   
>> +	if (smmu->impl && smmu->impl->runtime_resume) {
>> +		err = smmu->impl->runtime_resume(smmu);
>> +		if (err) {
>> +			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>> +			return err;
>> +		}
>> +	}
>> +
>>   	err = arm_smmu_device_cfg_probe(smmu);
>>   	if (err)
>>   		return err;
>> @@ -2273,8 +2281,11 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>   
>>   	if (pm_runtime_enabled(smmu->dev))
>>   		pm_runtime_force_suspend(smmu->dev);
>> -	else
>> +	else {
>>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +		if (smmu->impl && smmu->impl->runtime_suspend)
>> +			smmu->impl->runtime_suspend(smmu);
>> +	}
>>   
>>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>   }
>> @@ -2294,9 +2305,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>   	int ret;
>>   
>> +	if (smmu->impl && smmu->impl->runtime_resume) {
>> +		ret = smmu->impl->runtime_resume(smmu);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
>> -	if (ret)
>> +	if (ret) {
>> +		if (smmu->impl && smmu->impl->runtime_suspend)
>> +			smmu->impl->runtime_suspend(smmu);
>>   		return ret;
>> +	}
>>   
>>   	arm_smmu_device_reset(smmu);
>>   
>> @@ -2309,6 +2329,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>   
>>   	clk_bulk_disable(smmu->num_clks, smmu->clks);
>>   
>> +	if (smmu->impl && smmu->impl->runtime_suspend)
>> +		return smmu->impl->runtime_suspend(smmu);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index 26d2e33cd328..ed08f86cf99d 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -455,6 +455,8 @@ struct arm_smmu_impl {
>>   	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>>   	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
>>   	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
>> +	int (*runtime_resume)(struct arm_smmu_device *smmu);
>> +	int (*runtime_suspend)(struct arm_smmu_device *smmu);
>>   };
>>   
>>   #define INVALID_SMENDX			-1
>>
>> -- 
>> 2.34.1
>>
> 

