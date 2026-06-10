Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4E1282F0A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061128; cv=none; b=LUIo/3hwsiU95xF9REZcpUCFaJTY5lAv53POkFpuk36APjkzpRlZfxUjU/iChBgxn48OANwlP/0j5qfRwgjT6jHYjTIsOGreD4TehraZMnwcpIVAynFSZ8T39m4yaxsjYQF2c1SojwOKmJClH/fjN920O10fKHcF/4APM7nv+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061128; c=relaxed/simple;
	bh=/NryWXkR6E+3gURwL7KyTpAD8KltnuDEeM+zlykdqEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2NbqrWpCozOIpPz+HsiTrrzc9wMWhRGDq4ojVM4KPctNB2DUfircypunzKlfVKERMHqiKOByjMtuaForxPMakhnm9xPeFnUaU7EWEJh5hRDY3LjfDfSkKzEu5zaB3Mq+IElf6IRLNO8W8dJMkcidTz2dYuthMYJa39cxTBdtZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTKptZ+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKzkbSAP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTKptZ+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKzkbSAP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2epA84061498
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=; b=aTKptZ+93aq1bhm2
	NHkU7BAiHlgkKB1GI0ZTUT1xy+lj8r57tB38BoMSkJVWwVHjrLZHCSa2Dn2/uL9l
	/oE8i4v6HnWqCGB+S1ek+LuOYarUD6DRa0yjmcqmfQIT5uXfxi6YijQ0sG4Wa7zE
	I072jF4sMqCM+u9uvBTUyro2CdydWnQXP6b+65O+O4MeZT453xb6+rE6nQcRUWZF
	YH9aR0Oca8MwQOmgJRx0zgPUy4XNJc2fUWJfKoW182gsyi1bAEh+wcSfINtR68L9
	fSW+1swmACxIzUW2hiiXKtRCThJLlcuC9yhhsSMniZQtBNhgDzxjdDqzVv2zttUe
	lRPXZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh0fa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:12:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423efbfb61so4172386b3a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 20:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781061126; x=1781665926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=;
        b=TKzkbSAPdI+y4cxkiGWqoH9Eahl7IaLXoMFpa7Ok8P7SUfCWUkoSIlVw2nRxJNTJS8
         iuhq99qAVXJn1ndZGh0q6CMD942wPHOKW0DjMcPAYgzvGf9WSrBs5j0JsopabS5YKFO5
         +FbEp11xvIXkyyYRcuPDrgcEnxre0ZhifEmIp6E+zWlRvV35Sgi6XlomQLxnnVp9p/0w
         zjHFeoatt31m58lZWIfxSJVAlDACb9obEFf/r+5dQAiQmtuAEzmvn8ciyzAgwFjHhzNz
         J717Zg89wpsG8tmOrV/YnUJ1FHjKkQcZcd2kn3OKnJlj7OZdpAAPbqxI90tviQ59ZVWd
         f+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781061126; x=1781665926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=;
        b=QPfAQyUtvG9i9L79eNmgwI16gNiUtEP1FHeIQho2MmKAsIWXuzLLipU2hZjeKmmB7i
         cQrHv5KHjOF9tQf8mz2B8I38q4oVG/x3g3fNb9WSKdkQwSYSnBmDZX2SP9djalrCEkI5
         THASsworBnSdu+rhSEUwOzqsjmjDeuG+609bRxK7tczgZctKnmtBvtx1zxrVKXqtj/Fa
         JbWMcGubSo4BPt0Ne5YPgN8i8FMXKIExG1AlE1nfgPhPb4bZrVCcZvvFWi4VNFTM5XbM
         9EpFvGys6Qt9qTw9MIGS01+jBod6kF4AWSA0vSLRHHgIr62IMRj1/uIieKoSTM/2tdOL
         9K0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Rv1BlbVelA3FN80cC3a6vttjVifDOi0l3Mw+8020pcVW32YxTrWhA3OoW5RUquadYgUK7B7JLvN0t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmu2dTX8l8QBO0vVzCo7RvL3/B169U6Lh+cNkn6XhxEbXl+d9H
	5HdC9meKFvWu2LtjNyfNRUeegi83MynEH2Sr1tugRoqve6i+cRmMAsKKOqhHSNqzGcHng5P0s/Z
	MDOMfR9rVADTtCu0s7NmnS9F0G0sXT6VrKu9QUKFBhv2VCLsdY0sJe1SpbttCqtzW
X-Gm-Gg: Acq92OFdEPnvL4KrrZuoTfinNx2/vtMeSgk7Y7DyuM0ijcXD66p32z5l0900/LY6D1Z
	xxubI0QyD+WydR7wjYiKBMQBSuNcnAhfo5KAe7xQ/TFV88TfLnczNgUURbdEyjs7NreZVpQzVY8
	330wj89brvLNO4ec68SgMfZxRZRZmQDulZA8Zp3qjEcSIP0A4zQ5JWT3hK0Nr2guZvlD0s+BDnR
	epZI7eLq1uEJr6qyx/DqbW34VWOVfgYqdluTuIvdgT2dzeMgW8JefXfjOcoviJpFCpd94sewrYm
	fxrwa2RuhLgDXvzgayNwXy7G721cTkrr0DgN87SlFmAeLQNrVe7k9Vz+LmKBK+7tt60x1b8ljhA
	Zv53MDUduEnJK6yCZDHAC41v4FBj6LnWqpWedXt/x6Vrd4AGAoN+Sv3oNUhUVdcl5rJXcSQ1Mr8
	de6aXrE/HjMJ+/REOCUzuJTigMMgk=
X-Received: by 2002:a05:6a00:f9a:b0:842:7296:dba with SMTP id d2e1a72fcca58-842b0e2fb1dmr24452673b3a.7.1781061125742;
        Tue, 09 Jun 2026 20:12:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:f9a:b0:842:7296:dba with SMTP id d2e1a72fcca58-842b0e2fb1dmr24452638b3a.7.1781061125289;
        Tue, 09 Jun 2026 20:12:05 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm27496629b3a.26.2026.06.09.20.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 20:12:04 -0700 (PDT)
Message-ID: <88c161d6-caa3-4fff-afaf-d10cacfe9929@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:11:59 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
 <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
 <20260521112205.rq6g6ev56l4u47uu@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260521112205.rq6g6ev56l4u47uu@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAyNyBTYWx0ZWRfX420T+zwsES4D
 rIwQfDNze/OCCOQKrZlg4BIt9lKdhz3ZV9ODugFZQS7ZAtsQb+CUtGo8iTLcZo1NIZJ46cC3U7B
 iRR3hoac/5mXsSJqtzwdzu4MhRl5YYlTMkCU6VUBvUr7vM2DkkEwRO+lAqvOD2/SIhjiFjDFtYP
 aLZexKkK2luoX9jQb6QAc5I4oDsVpTlktBUg6cxieiOs4BavU5iV6II4M5b269YVLCJMFa/PMWK
 ceo1MD+hnexef8/J0ei2uy8ixSWYuVEDip/Wh0cTVeInRCdsdXqNLNgFV97M9XnIjEkNULAz+Y/
 bBkMWuKtwhT5caQ3MkPcRTESW/+8GQvjkviYzaQPugy6cCvLtU8wbM00kFGjzJ7b5NF3jjvDvRa
 RWogTqpbAjY0tg4exDkEPCKKYRXhUI6+oQPMH0V/fKeRcVdasSuieNyTV5DyVr2vQf/eCCr45ue
 o+eTiVX+GCaVG5jTJTA==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a28d606 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tERN6AOGqS7yUma0NWkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: z2ujGirJDY-hsL-G1jZ_sRRYY-oJJjhh
X-Proofpoint-GUID: z2ujGirJDY-hsL-G1jZ_sRRYY-oJJjhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100027



On 5/21/2026 7:22 PM, Mukesh Ojha wrote:
> On Thu, May 21, 2026 at 11:42:49AM +0800, Jingyi Wang wrote:
>>
>>
>> On 5/20/2026 4:27 PM, Mukesh Ojha wrote:
>>> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>>>> Subsystems can be brought out of reset by entities such as bootloaders.
>>>> As the irq enablement could be later than subsystem bring up, the state
>>>> of subsystem should be checked by reading SMP2P bits.
>>>>
>>>> A new qcom_pas_attach() function is introduced. if a crash state is
>>>> detected for the subsystem, rproc_report_crash() is called. If the ready
>>>> state is detected, it will be marked as "attached", otherwise it could
>>>> be the early boot feature is not supported by other entities. In this
>>>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>>>> can load the firmware and start the remoteproc.
>>>>
>>>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>    drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 58 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> index da27d1d3c9da..ac2a00aacd2e 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>>>    	int region_assign_count;
>>>>    	bool region_assign_shared;
>>>>    	int region_assign_vmid;
>>>> +	bool early_boot;
>>>>    };
>>>>    struct qcom_pas {
>>>> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>>>    	return qcom_q6v5_panic(&pas->q6v5);
>>>>    }
>>>> +static int qcom_pas_attach(struct rproc *rproc)
>>>> +{
>>>> +	int ret;
>>>> +	struct qcom_pas *pas = rproc->priv;
>>>> +	bool ready_state;
>>>> +	bool crash_state;
>>>> +
>>>> +	pas->q6v5.handover_issued = true;
>>>> +	enable_irq(pas->q6v5.handover_irq);
>>>> +
>>>> +	pas->q6v5.running = true;
>>>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>>>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>>>> +
>>>> +	if (ret)
>>>> +		goto disable_running;
>>>> +
>>>> +	if (crash_state) {
>>>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>>>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>>>
>>> I am not sure if this is already discussed, but what if it is the first
>>> crash with recovery and coredump enabled? What would be in the dump,
>>> nothing? As there is no segment, is it expected since Linux did not load
>>> this?
>>>
>>> This is even true if it is a crash after a successful attach.
>>>
>>
>> It is suggested by Bjorn:
>> https://lore.kernel.org/all/qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d/
>>
>> I did a hack to test the recovery by setting crash_state true, it can recovery
>> (stop and start) successfully with below patches:
>> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
>>
>> For coredump, it will return from the first "list_empty(&rproc->dump_segments)" check in
>> rproc_coredump as segments are not configured in attach.
> 
> 
> I was not against any of the stuff, but mostly checking, if we agreed on not collecting dump
> for first crash when soccp minidump is not initialized which falls back to full dump of the soccp.
> I see soccp minidump id in the downstream but we have not added in 6/6.
> 

Hi Mukesh,

I prefer to add base rproc attach feature only in this patch and skipping the coredump in attach
workflow.

Thanks,
Jingyi

>>
>> Thanks,
>> Jingyi
>>
>>
>>> @Sibi, has this series been tested on Glymur with KVM?
>>> I don't see the iommu property in the below patch.
>>> https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/
>>>
>>
> 

