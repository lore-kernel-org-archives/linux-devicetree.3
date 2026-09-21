Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E6403E9E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022968; cv=none; b=GQphN4TcgpsAr2A4SaLwCM8fBMLYfbdYPGxIAzATFAi7oX/ZMew4l0wJYz3lJGOzDcBawc39G/ed7xCLYEDAD5LheRP+AWTc7gBThw+I9FmbgX0glMvT0iBi3IyEyrHJZewXcFMJHQ/XhJ4IuZMooua84MDGsc9xKWaUZNUuzg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022968; c=relaxed/simple;
	bh=8X0NcnAyyYZrxMbslV2a8BYmyIWH8krztSLCg+aMn6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFbyjy4XyOjX5/+CZPgSWtw7ga3NNDYswoIBJs2ml0O0iTofCYWHdlxb0RVZfwoj8u88ReVDWQuI1eQc+ePoLM2PzgjR1W9P+Oqryvu8kC5ijHru17IQSGDPydpGLcIc5uuX1mp+FrYou+DGOcw9qsNciphj5f4lRsxMkf47+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VefK8UL6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVIyNnyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VefK8UL6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVIyNnyG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LG77bX351741
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=; b=VefK8UL62syGlWw0
	C4PlvfAlL6cxbSmQ9Cjig+H6SMW6jZDpQrSNe8cl9xZJMri2zT8KEcHjenoxv3g7
	A/segX7gVa9yKyiJ6HkHE4Bxf/7m7oGiZsHJ2uWaBkAWxvlYKbwzmJ+me1u1+X+x
	Nm6KzRnJVDJ7i68qlZ7jpPWXnpd3vd8rHTCIQEdQ/KFVMBy8q6hRRr51gNSenr1P
	h8fbALFHlQTT8tS0oOd1qM411ZdXGstdEHzSfMobUNZa+mQ/cdZ8M9L008vEwKC/
	JKAM6Ad4myRowaZEO32frdAHpZjMRCeY+d6mjSn5xaJJsvXb9Vp+23eAm6N6I5n/
	YSZKFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tsh3m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:36:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso49592755ad.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022965; x=1790627765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=;
        b=EVIyNnyG5EFumc9o5uEqZehUuk6FQoL6l9a34mG3A32INEX1qY/IuAxLCT7e+SlsTU
         oFXZiMpmK8CDWrWwveo53NU5UCOSAolgvJKvQhHc3DwqpNkCyq3kfdXmFr6e86FDL6KL
         nInKtIe1CrR7GixAOG4SH0R/XJhc4tGAKgiRziLBxKnRyJ9xMgGC0RbVQ+CuE5chVcqb
         pPP/ag/RCgt8UJJrJ8mcKcZ3I83KY25bNpfRaXDDTvekK39axl8xYBnj8Se6+KiDBwDf
         FY6LEp9kGU/VuPgsCEjo9hNgYHLqTZM0xUcfO8lTGI98X9QBozKw5tVZtE7bd6K3AmIV
         rAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022965; x=1790627765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5AIKP1mP34Wx9dw84lO7Zn0zSS/9x6lk1WSUH1MKxg=;
        b=gc7qnW3LqWJZ+VZNGa6AH4RBkDJb/C7wQ5kt0ossmEHB4LzB4gRAm71481YHfFeCMi
         ORnhe/PQIWI0PG39gIeMPUI/nT18/5yw1cuQsFnEjEIOb4amO5XoZHURDS7+qQ1V5/ZW
         6LQiQH+sw8/Ga5/dAyrEWOP63u5zZRO/Fjc+Abbpu4CH+h/U3YTVC28wIKDOyCSdqiSj
         WfikstzhSKbmrMTpTiySOuZmDwDEu5vLnOBEfAucownwoNFRHemNzAGycs6+ZKpO7HUJ
         t0yQCbBXUGKR/9O7itBlhlwrxgCW7iAOn5rhn2IW0cjZbZayi5y1eJ5GIeco1hkFJjmo
         9spg==
X-Forwarded-Encrypted: i=1; AKwUvBz52q1Gy/+wezLKtnVsIVY8SaSBJViL63Z3F9yz8rPKgXNJsnO/rhovh8bkAqhTa0f2v8tptKPetnCj@vger.kernel.org
X-Gm-Message-State: AFuF++m45eJaO0gnAKCVbiZeVg7nkUlv2TnkGE7MoyCHXZwHqQYKK1l5
	p3n38zC9Xb+KqBKMEFrxVQovs0kVuVegAQ9KbeN5vpBXAi3Sp+y5VCaU5jmBCjm0zPsyGJelKrN
	3xdjigs2b+fYnz0keL6s62piU+Z6lBtGHPr9KNU2Lx4Gi1OQGNL8hXojqyvN+4Ycl
X-Gm-Gg: AYBFou0T0MBvfKahitmCwtr/Cb6zwOjsCNF5NFaWVBz6pdz4UmlVXTj+JEIR4cqEUIw
	5G8Wi4JfEMYKlOxh/gnAb7z6HlPdbLJBASJK3vglMYONQcQ5u6yvuhlF4z5/GBfudW/r4vAUA0I
	dsBKCfE6lbxbc3RfKKrJuRc6rOfSodWfVCjH9dgX3PHHX3mUamdXz2IFl1e4XKfNVKDgNbrta7A
	6kDS7C4wI0x0Mp80ylDOB/2aY+2eQGcBgh3Dml1HdJj095JjSMPORiAtOAVrdT+tRTi3M8OcIZX
	iBHpTyXoLu3IdDWhjzYUzQcwsnNL3x8bWibZtU0gJ6Ww1wkEOcZkhhBWMyrxEYXn2dYVU+/rsat
	AMVuI4OpDJIO+1qX35g5UH84e7Avv/S9IAQ==
X-Received: by 2002:a17:90b:17c2:b0:39e:6c69:f471 with SMTP id 98e67ed59e1d1-39e6c69f552mr11786913a91.48.1790022964955;
        Mon, 21 Sep 2026 13:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:39e:6c69:f471 with SMTP id 98e67ed59e1d1-39e6c69f552mr11786876a91.48.1790022964357;
        Mon, 21 Sep 2026 13:36:04 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0696b0d1fsm470437a91.1.2026.09.21.13.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:36:03 -0700 (PDT)
Message-ID: <9fc5a569-003b-4d5e-a943-04ebfdd1e9bd@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:05:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
 <h4c5oybkuxf2wmja2osm73ntpolx2ap3csskipbuyoks6xtdsi@5ihhj6ztn7mq>
 <9e3da313-ab1f-435d-8e3c-1a0c946a7790@quicinc.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <9e3da313-ab1f-435d-8e3c-1a0c946a7790@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nfx6qwMRbfF9IW7Jk_QBZbgo1V2W0lhE
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab19535 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mqtUebdMckNC0E4VJ4YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMSBTYWx0ZWRfX9OMbtp9EbSf/
 gB72BjWdsbJKod9gjH0Qt//QC2ru53ib3TgKHg36IUDle3u7d05A8ZJCIiAWtNMGYa3BJ2XMhN1
 KTDhAB7eew8fEekrepT0c6nbmDG/3j4=
X-Proofpoint-GUID: nfx6qwMRbfF9IW7Jk_QBZbgo1V2W0lhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMSBTYWx0ZWRfXzFPPvzXmBPVi
 LeXFdyP6HYzYpGxv9bLRJte1DxHDTMr1kR5xrsdZvFs+/HMAEr0MPHeDtKpFAmddGIzAAPCBNZL
 sX/9STpxY9qnr9NnlRIbinV1Cwp43MdecDF04P/dlupTASof+dFNjrqrMwFi2yR+Qo32T+e2onu
 n8+Ppf8NbGV3ELT1c6TiFkvIRuW6uorTqMpxqKH3qga5yV8ErL81cbSpNqL+PVD+wxLAH8dVbF0
 wyiYTZlEhnDTQZD7fuXETTDDAdIhY5B4Uf3ryDx4o8H0qrMwTMQD/T+Sz5IwqyzIxjJo4JuyTSY
 ogMWYN89O0RS9PCI+OS/DuMNXTM03wmyswP/w6qMg7wtU1cx6C7rbgCA+5N6LTZ2Kz1rfWgbcKp
 Sr/tvaxP4JEiSpQeLR/sPudJ4rGZoosWF9a0SziemMpIL2YvxM7A50epRvqR8Ir4toY7KQWQxou
 4LbuplC8nibpMWiYH6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210301

Hi Bjorn, Please find my responses inline below. I have migrated from my 
@quicinc.com email address to @oss.qualcomm.com and could not locate the 
original email thread.

The replies below are from a draft I had saved earlier. I am sending 
them now from my OSS account after resolving the slave setup and 
validation issues that had delayed the response. I shall upload V7 
cleanly with OSS ID.

On 3/5/2026 9:12 PM, Mukesh Kumar Savaliya wrote:
> Thanks Bjorn !
> I am sorry for the late reply, i was completely off from this work. I 
> have restarted this series work and will continue now onwards.
> 
> On 7/2/2025 2:26 AM, Bjorn Andersson wrote:
>> On Tue, Jul 01, 2025 at 12:48:51PM +0530, Mukesh Kumar Savaliya wrote:
>>> Add support for the Qualcomm I3C controller driver, which implements
>>> I3C master functionality as defined in the MIPI Alliance Specification
>>> for I3C, Version 1.0.
>>>
>>> This driver supports master role in SDR mode.
>>>
>>> Unlike some other I3C master controllers, this implementation
>>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>
>> I believe the capitalization of the last feature is "Hot-Join"
>>
>> It's not entirely clear from this sentence if it's the controller or the
>> driver that doesn't support these features. Please update to make it
>> clear.
>>
> Sure, let me clarify it and update the commit log.
> It's the driver which doesn't support Hot-Join for now, we plan to add 
> it in future.
> 
> I would rectify citing controller driver doesn't support these features.
>> [..]
>>> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
>>> index 3e97960160bc..0e3ad9d96424 100644
>>> --- a/drivers/i3c/master/Makefile
>>> +++ b/drivers/i3c/master/Makefile
>>> @@ -1,5 +1,6 @@
>>>   # SPDX-License-Identifier: GPL-2.0-only
>>>   obj-$(CONFIG_CDNS_I3C_MASTER)        += i3c-master-cdns.o
>>> +obj-$(CONFIG_I3C_QCOM_GENI)        += i3c-qcom-geni.o
>>>   obj-$(CONFIG_DW_I3C_MASTER)        += dw-i3c-master.o
>>>   obj-$(CONFIG_AST2600_I3C_MASTER)    += ast2600-i3c-master.o
>>>   obj-$(CONFIG_SVC_I3C_MASTER)        += svc-i3c-master.o
>>> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/ 
>>> i3c-qcom-geni.c
>> [..]
>>> +
>>> +struct geni_i3c_i2c_dev_data {
>>> +    u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy 
>>> for now */
>>
>> Commit message says that QUP doesn't support IBI, so what is this?
>>
> No, i meant to say I3C driver doesn't support IBI along with Hot-Join. I 
> have enhanced the commit log to make it clear.
> 
>> Also, why "keep as dummy"?
>>
> Removed it as we are not using it.
> 
>>> +};
>>> +
>> [..]
>>> +static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum 
>>> i3c_bus_phase bus_phase)
>>> +{
>>> +    const struct geni_i3c_clk_settings *clk_idx = gi3c->clk_cfg;
>>> +    unsigned long freq;
>>> +    u32 val, dfs_idx;
>>> +    int ret;
>>> +
>>> +    if (bus_phase == OPEN_DRAIN_MODE)
>>> +        clk_idx = gi3c->clk_od_cfg;
>>> +
>>> +    ret = geni_se_clk_freq_match(&gi3c->se, clk_idx->clk_src_freq,
>>> +                     &dfs_idx, &freq, false);
>>> +    if (ret)
>>> +        dfs_idx = 0;
>>> +
>>> +    writel_relaxed(dfs_idx, gi3c->se.base + SE_GENI_CLK_SEL);
>>> +
>>> +    val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
>>> +    val |= SER_CLK_EN;
>>> +    writel_relaxed(val, gi3c->se.base + GENI_SER_M_CLK_CFG);
>>> +
>>> +    val = FIELD_PREP(I2C_SCL_HIGH_COUNTER_MASK, clk_idx- 
>>> >i2c_t_high_cnt);
>>> +    val |= FIELD_PREP(I2C_SCL_LOW_COUNTER_MASK, clk_idx- 
>>> >i2c_t_low_cnt);
>>> +    val |= FIELD_PREP(I2C_SCL_CYCLE_COUNTER_MASK, clk_idx- 
>>> >i2c_t_cycle_cnt);
>>> +    writel_relaxed(val, gi3c->se.base + SE_I2C_SCL_COUNTERS);
>>> +
>>> +    writel_relaxed(clk_idx->i3c_t_cycle_cnt, gi3c->se.base + 
>>> SE_I3C_SCL_CYCLE);
>>> +    writel_relaxed(clk_idx->i3c_t_high_cnt, gi3c->se.base + 
>>> SE_I3C_SCL_HIGH);
>>> +
>>> +    writel_relaxed(M_IBI_IRQ_IGNORE, gi3c->se.base + 
>>> SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE);
>>> +
>>> +    val = M_IBI_IRQ_PARAM_STOP_STALL | M_IBI_IRQ_PARAM_7E;
>>> +    writel_relaxed(val, gi3c->se.base + SE_GENI_HW_IRQ_CMD_PARAM_0);
>>> +
>>> +    writel_relaxed(M_IBI_IRQ_EN, gi3c->se.base + SE_GENI_HW_IRQ_EN);
>>
>> Don't you want a non-relaxed write here, to clarify that the ordering of
>> this write and the previous are significant?
>>
> Do you mean for IBI_IRQ_EN or the whole function ? If yes, then i can 
> change to ensure no re-ordering. But i don't see reordering for complete 
> function is required.
>>
>> As above, the commit message says the controller doesn't do IBI, so why
>> are we enabling IBI interrupts? (Just guessing based on the IRQ names)
>>
> Yes, commit message says rightly.
> We are enabling just to ensure I3C controller works with IBI controller 
> enabled. And that's mandatory per HW programming sequence as we don't 
> disable IBI controller even we don't use IBI features like IBI interrupt.
>>> +}
>>> +
>> [..]
>>> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data;
>>> +
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    i2c_dev_set_master_data(dev, data);
>>
>> As far as I can tell, the master_data is private to the controller
>> driver, and the only thing I can find you do with it to free it again on
>> detach.
>>
>> Am I missing something or can these 4 optional functions be removed?
>>
> Yes, right now these functions can be removed as it doesn't do anything.
> I had kept it there to add something really required in future.
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
>>> +
>>> +    i2c_dev_set_master_data(dev, NULL);
>>> +    kfree(data);
>>> +}
>>> +
>>> +static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data;
>>> +
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    i3c_dev_set_master_data(dev, data);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>>> +{
>>> +    struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>>> +
>>> +    i3c_dev_set_master_data(dev, NULL);
>>> +    kfree(data);
>>> +}
>>> +
>>
>> Regards,
>> Bjorn
>>
> 

