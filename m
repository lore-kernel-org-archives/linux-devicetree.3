Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBE539A05F
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954689; cv=none; b=aHyXFz72tpDor7uxB8sFr1uO9XQ2LH0SPF9xvihXLaO5GkYs5Ly6aB3Au/DgKFGqFGkCzX5LB0wfLt1gwEw61mkIym5zlVjrpNL3eUwbCMHLMOOqvL7QqIpTpupzVesBZijcaMkuZSzXzRYbDJZcpczDYLQjPUmOo7iGGuFqaBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954689; c=relaxed/simple;
	bh=b7tq6DQtRCgmYUVhlKeubOo7PrQh/bCTQHPN69hYTiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpOaJuyFp4VY/XYnz+9lNFLExrM3ohJYOl/KXLCWL0LZnw7t5Lhb4iOmpzK8sjc/HTZL0vNfACQuY8fgfPZ1V4YvR/a3/l4u92XPX4SUqoqwhtUxOuacir1ic8QEeOZJwzUBjzTOXGyPJyoVuBOYn6IkxbyCi0sdgL1WrDex3Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQBPNlsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyYdPamW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQBPNlsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyYdPamW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9135m2761394
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=; b=AQBPNlsL+M17kdWU
	9OzHm5Su0mgOwcKoIkrtH8rVNDkcRrssNjnJrociLxXfN/H/1czPwNgO311hWLvN
	1Nm8PQivx9hTwJeuw1lQf6mfkYqpshrN0cjkAZNXBrubQVT6QsX9R8TnDsgic9mT
	LEf08m/+az/Ln0tv0yYdZ65vULyI4njrFGKyI1FSFAwZF717gy+QgbZBckUjyDQO
	Px6oY/t81Vkvow3fk/pHzmFdAZQYI3id1OD1TXIRDcfvBl5LMIY+sToONTKgR8HM
	ZiFhJFsizyaRdkdwiVLSpIIZeMQi/gnKBlYhjHRol9AUqxScFDLsjLKv4WXrGq2C
	rai+cg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930fbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:58:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c63f85c84so3698423b3a.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774954686; x=1775559486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=;
        b=JyYdPamWqtxT1POtV1ZYswnG47ohhvGMMLcZTneIUyd973fS5LB//wKrNd0iEiXRCA
         uLc4doG4QQ4oXLL0hUcDUSMORnzBb0iqHUuU0w/P3xl0xCTH7sCLcZIIKeic7cNXy6iE
         8RPcuKn4W0aoKrGuDJfPVYhGWwBD5CslHwrnc8Lkq4jDTGRwCRK8CWv+r4/Sqg/XldKj
         F7lBromm1OiZwLecCpqfcnSa2Zvj2vcZG0i+4SuQ0FEqlqwnxpgROQ3KcVAK5WKrllOM
         wHsSIHebXIgIaKvIc+gd0z7vxvF35WunYnt495bI2gns/rAX6EPo+XqVC8IyfoXe0u7t
         zTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954686; x=1775559486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=;
        b=YoVNUnF5EgR/e3r51UGdvMJh/Qw5G9jgxDUHPVpaiY7yoZ7m9WFJ+pDBvpoB4PbLRu
         T6E2GPujZKuil0RdoBH+dk3Q9auoCDsoFpNy9GL/Gr9Aw2B2OI4g8q/FX8X7nTldHG+J
         PGaFw+3FWKrbCSw5wQ2wKzJBDBW6BJP/xvw2RxHtrYJtKqtynLn6WUjAKLWcoUbNSMdX
         AdweFeOEmN/raWpTJubwGtcFr3qTDog3cLNHbAxdbILY3HYN+w7W1VLy2+Tb2vaYkT4X
         Y8Bx8wm6N1O1+PPm7o07ayQb0nVFkbjwrLV0KfiY6eNHLU8aYSkH6KMmvUsq7IHZXrVF
         Weag==
X-Forwarded-Encrypted: i=1; AJvYcCU+RQFfKOPuDJhUhoHubOf+BOIFcS3414UxVB0Xc7qtL9MRuSwsu35yqkc1adoHuDf56AGsbPCxXjY8@vger.kernel.org
X-Gm-Message-State: AOJu0YxNrWwTHfo/3Pwlu0PlWJTlPMkyCJVmiDsmGTUe29OMG9tNaI52
	cibib5EKVDEMpN2MQz07Q2UhIVjZ1udMy5HFknsHQIMQHg/xxV2OkPHjpurUMJmCUEJiKHZumx4
	n81lgJFTlDPRYef2zSyqiR9eGVe5Cv9zTIF+pyLPYvDE/Kfpcy/TCgq5o9c3V3eg5
X-Gm-Gg: ATEYQzyP0MIju5cqFr2+fAKScU/OvOfssKo4C+r4acA8XzAaYBojKgNVeR/KjFZ0tLG
	JZLD1cgmls7qaAaRb101dGSyI6m35T/dEd+X4JL0LuNW3n4Xyg/B8xhAcd17Of21lpk9qvav3wS
	XYpzg8+MA1lepYqdO9VGAaqB61sf8M9CQQWLhy+HEe+nJF6RHiqiIEKPY/ugdtsuPolg4XPvlwF
	r9DSZzwxQgC6zy3PM48O7JQyYwr/uDXbFzNAXPt6Abx3qAOof22VPxx3cG1+v4pdcmWm20M62nS
	hpCZZsMgn00zuDIulC4NrK/IufKTDFu/FUA+rqzNG5T+alsLzBPeKupaX4VlBubPl+F3Q7a8k3+
	9jOp1vtrYNtIVvgf7SHNMYnZ/fgoODb7DB0wlv36gkiELZ9TsQgM6rg==
X-Received: by 2002:a05:6a00:2e27:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82c95c27e6amr14264824b3a.4.1774954686355;
        Tue, 31 Mar 2026 03:58:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e27:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82c95c27e6amr14264787b3a.4.1774954685820;
        Tue, 31 Mar 2026 03:58:05 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86286dbsm10214104b3a.56.2026.03.31.03.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:58:05 -0700 (PDT)
Message-ID: <5409e13e-280c-47b6-a29f-351cb609bc6f@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 16:27:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Alexander Koskovich <akoskovich@pm.me>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
 <gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwNSBTYWx0ZWRfXzBqyHjJtmxmf
 NiMoyIxjnWXNrItEUOzmDmhyHoLUnA8khbhsMh16y6WtZVQsh9qV6L6YVKFl+8CVN2jDvtmcWVp
 NeErkQuSf8bjL1o5QCT8M1d9spV5Q3UX3YKc2LRq7vxJrGwywvN6x7zzftEDxL94BI3kgsvADWm
 VITn/sSXJvyQOjJZDFSL6w3IOrEM05yGRQd7UwD/oplfJy5TFnfHQAYGHyPtYhaHky+dqsJcE5P
 9zy9TgIRTjy75fqZW9Gto5CuPW/WCmYGIrhX58G0Z636BaUmJYfsWSS07nLKCC5UdHnrn9RBLZ9
 ZhqwoIRu3rldekM93LKxF+1tcXfNPSrIIMtjA4P0RilUqdQbSizJc5JTFNaFKBSIfXbm6Tbb7ql
 /zOEsLNVpsVK7lqOCQDWEVk1hTOeFOnqIGHlPI5VthnXVD2YkzfqirQTKQ1Q+R33D/DVz7hfZTd
 G9ov1ceYCwkAHhkCV9w==
X-Proofpoint-ORIG-GUID: xQthhFPtUFnIlGCdCT9VRhvcrAT7IuL4
X-Proofpoint-GUID: xQthhFPtUFnIlGCdCT9VRhvcrAT7IuL4
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cba8bf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=6H0WHjuAAAAA:8
 a=d5075zjUzbg6PSGir3kA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310105



On 3/31/2026 8:07 AM, Alexander Koskovich wrote:
> On Friday, March 6th, 2026 at 8:56 AM, Luca Weiss <luca.weiss@fairphone.com> wrote:
> 
>> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
>> clocks for the GPU subsystem on GX power domain. The GX clock controller
>> driver manages only the GX GDSC and the rest of the resources of the
>> controller are managed by the firmware.
>>
>> We can use the existing kaanapali driver for Milos as well since the
>> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
>> configuration.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/clk/qcom/Makefile             | 2 +-
>>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 90ea21c3b7cf..155830140d26 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
>> -obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
>> +obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
>>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
>>  obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
>> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
>> index 3ee512f34967..d3899420d6f2 100644
>> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
>> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
>> @@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
>>  	{ .compatible = "qcom,glymur-gxclkctl" },
>>  	{ .compatible = "qcom,kaanapali-gxclkctl" },
>> +	{ .compatible = "qcom,milos-gxclkctl" },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
>>
>> --
>> 2.53.0
>>
> 
> Was running into gx_clkctl_gx_gdsc being stuck on when GPU was doing runtime pm
> and it seems like this GDSC requires GPU_CC_GX_AHB_FF_CLK to be enabled. Though
> it is already in gpu_cc_milos_critical_cbcrs, the GMU firmware appears to be
> disabling it.
> 
> Relevant downstream change:
> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/3c1f31518edb7b094b9b9285287ba49a5c9196d8
> 

Hi Alexander,

This change was introduced as a temporary placeholder specific to downstream GPU SW & GPUCC code,
to unblock the gx gdsc warnings observed during system resume. But it is not the final
implementation and change was reverted later in below commit:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/11bd8d8d6f654cf156bb4fbbfe6587e0c41adc2b
 
But you are right, gpu_cc_gx_ahb_ff_clk is indeed required for GX GDSC register access. And the
actual requirement is linux GMU driver should disable the GX GDSC only in GMU recovery use case
at which point the necessary clock will already be enabled by firmware. In all other cases, the
GX GDSC should never be enabled/disabled from linux.
 
In the upstream implementation of GMU driver, the GX GDSC is being enabled/disabled in every runtime
resume/suspend of GMU driver which is leading to these GX GDSC warnings.  Milos GPU architecture is
similar to that of Pakala and similar GX GDSC warnings were reported on Pakala already[1].
Discussions are in progress with internal GPU SW team to see if GX GDSC can be handled gracefully
only during GMU recovery use case and not control it in other scenarios, to avoid this issue and
without impacting any other GPU use cases.
 
[1]: https://lore.kernel.org/all/CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com/

Thanks,
Jagadeesh

>>
>>
> 

