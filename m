Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E784779A8
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843378; cv=none; b=TDEtJVAEhol5uMqUtAfWmYO3j+Y209U7tD2zceMS/u+BoHmDc85VKrJMbmWnLYcF46RuD5auTlhBfH4+k3naqX2Ug2caRz9Z26aZhwshz1z+G8nVBXndypD1QAmXizmZb1gjZav/4HT9uOfqVen7lD8z8OJ185g8erLsh8TbHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843378; c=relaxed/simple;
	bh=drOaZU4ycDJzaI5EMDnNtFwnSocXqA53ZlNwvBAN9IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Al/6yqxEPIpgSK9WJWktbu+ja/NPQjFuqn47k4NIKEJTd6H4ZNZ+PXVn4rXxSKAiiHHwrZKeaXTCgqlAbq1jxHQQZ7IrSC4ksffUBU3RNvB8YVM7eAvCuPmT4lKuBLsXyH2qDT9dqZq/yWqKSG1elUE++RI7IDCy/OWiNe0xtjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3OZMR/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuoCk2Av; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3OZMR/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuoCk2Av"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAsqT54008602
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smHaQRf2PotzKGQNp55ek4h21N45u+3lfeYBM6Exau8=; b=Z3OZMR/x3B6wBihE
	vzFeZiurGmbf9kf4QbAYq0mLvtmYfmWm2RyE8l4vpLlkipQXLRrqJseYwDMv1jsj
	qtM5pUK8qbIT3W3s9O+HjRJZ2wTnlbQ+6ONpHPYwc2Wn2/aZ9Vs4OQK7OuoGRlGh
	6NmM+j9Cv1V2KP+95QLXjkpljRhOcxlPZee4sLGiiOaL2u3Pfzir2O5oOGPdMLPT
	Yw/0CMPfjz0wmiPKVrmqhN8Weky5je10FkeihosAok5LVF5kpcu7nd4VHtk+ieXE
	YkuVXNMmtmGhkUzO8qRCMG9ZaAi3SpFdmK3guHQSmErx/8ebHQYD8kH9TA67NhI/
	y/0hfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1styy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:09:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso143932431cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843375; x=1779448175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smHaQRf2PotzKGQNp55ek4h21N45u+3lfeYBM6Exau8=;
        b=MuoCk2AvOU8MUjItVtNXC8IUL3F9Wu39rjRVLqqnewbLCQiM+y52ksHx59VoH4BtEm
         C0SqcN0X3AC8K0JN0NL+okGbOoKJP2GCCAGoxlJ9ScZ+xINEMOX7v/2NgTO3CpbClCFz
         OppNN9Wvip1yUX5W1a6FmLteIGwHPfT5Sl1Ownx8Y6F5oilklf0wUvEElHwC5wlSKxpR
         ex50nf3UW4ov7crawFe5RbzweEKfkSY71XhA8v1mgDKr51NIITUqEBz5Ztvoc9PWPcgk
         pAo9rBUOyJxQF9y3qtYh219iWFP/S2W1+KcX4Q9pCJDcsrCcQTf5p+9eJ6vuYJZCZZn5
         puDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843375; x=1779448175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smHaQRf2PotzKGQNp55ek4h21N45u+3lfeYBM6Exau8=;
        b=XWkt3ULay5raxXcRuWZZgwVi+3tuBxw/eG8vU9xHo+E+A6Yq5yE3HEmjjYnfHL0yN2
         C+bV3Ba4H4VMD5TEzZecpy7+I4RxdcbcGR+DrlpDjWX3VNdCAsi+g+J+4mEWimciH1+M
         k3l/cey2Ao4yLm6NczAH+BAnNXjOeBNS0o81iQMN3T9UJDO+Y02LyBZd5H5APrfptQa1
         Kn4X4P56lxOq7n8/MZW94b59uVYrOZbVnfVdNLLIAZm613OioQZYN2NcVywPCBLgU8nU
         VHyAvcrE3sC2nBPthdTaX4V/FEAltHvoQ+ffIPfFXT8uL/U7kwBRVopb//OXxtizz922
         WYTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kAY4IGhqfVZ/mYfWsWrMhK3H06811ICLDh9Q6cjgcc51zXuwZWfNTVGpekxYrZhjljSzab2Py/x2T@vger.kernel.org
X-Gm-Message-State: AOJu0YztAlgHHfwXEAeIz+IrkhxIN3XSgTARRAHrJo/oWiMv2wut8KTy
	u3PtT84vQ+7+RP5lTvyAunZkONeBn9BJnN5gpxyLAGwQbBUuubM+ZrMTa4zWv1QhoG8fHbQ6bBG
	LilCxesbwFCzBGLdc3GBpxjewbnIbkpRBIE3KcBPrtf/zNGkXgzd/iWxEIrPiKrr5Di/4DUUv
X-Gm-Gg: Acq92OGtP01rzKZo0dULbC/Bf7YBr3AmZ1T59aZqjQDrWPHWERKtL85rtGGlXrYX1qU
	JXUuCHngPSJPXcfXcVvoMUjSDuCAISS90EaNiZwZGHV0zlHhBHzDQsFyZHpb5IF/cwmhyIE+yq6
	CLrdSsq6StVYIXpbCESk+bOp0gvu0RdAw7Jj0q16LGYu41AuYWFh4yhddkBaw7Xx/HQTcjqiPf2
	2CQnw4NeZ8Rl7b3kPPUFUgBDYZ1XnjUyIwZ8BbAHG3JgDIiE/heWEibejOaN2KxA0/md76E9MhW
	kdj3ByaPodZPigkJTghosyzEFIrzHNz3/V2uEbZ/KE9/WobbZWBBfGAUI53I1huvHELCEwqdMhZ
	v/ijQH+loAijfXqXDxc/T6P5oDIS6QmzcRH4myC8UuGbZ0CNhJp9QIxpy7Nbhh2bbWEWj32ESC9
	6RTw13d5sjOPMUK1iLdeexKpQL8RfSvWfW9OQdf8KBD4CNsahnExgUbML85D5RSSX9i2QYZAsdm
	e8=
X-Received: by 2002:a05:622a:480b:b0:50e:df54:c36d with SMTP id d75a77b69052e-5165a057fd4mr44963241cf.18.1778843374906;
        Fri, 15 May 2026 04:09:34 -0700 (PDT)
X-Received: by 2002:a05:622a:480b:b0:50e:df54:c36d with SMTP id d75a77b69052e-5165a057fd4mr44962671cf.18.1778843374442;
        Fri, 15 May 2026 04:09:34 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c6:df5c:d8ed:c370:3eee:b864? (2001-14bb-c6-df5c-d8ed-c370-3eee-b864.rev.dnainternet.fi. [2001:14bb:c6:df5c:d8ed:c370:3eee:b864])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8c8415sm14724911fa.11.2026.05.15.04.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:09:33 -0700 (PDT)
Message-ID: <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:09:31 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qR93whxUYG0gj4Zv60G3ZgTMhfwFELTF
X-Proofpoint-GUID: qR93whxUYG0gj4Zv60G3ZgTMhfwFELTF
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06feef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pouD296ARJvTD37ZcawA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMiBTYWx0ZWRfXxk4ZOAuI3IHU
 zzLL9aJq3s8cnIhCSDtUecnzRVLAGHjtm6qq3Bv5C5vIhsgmvsO4tZGbdJ/M0JlddVDEt1+yaUp
 xaQaO5quI7+45Di+RtpJx84CJZXY+9IuPCfnETr39/HVj09ezPS78s9RZ7GYXymrNtUKyUOAO2m
 yUGYQex/FcDBK/fGw6+qVZJntZXcS66JpBdAAMLfY4d5iqry3Qqvt+B4h4DeEr4tamlVSeL8Sbl
 D7sJl+XmLd4MDEb9PEz6IM43TiZXktS6FOnFsYoiwMYauyeaRXyh8LsXgMrNBKwQbUwoJ0N/Bsw
 w+gh/k1qO9UUP+4avcRr/P1kecYoumrA3eWaYkyTjjZbGMeprfB/dQYN8HreB1NCaJcwhKuVbEU
 y/PSEw724rUkaT/WNgtx4528EpGobSHET2iOa1Hwt5yalp+Ekxg/NerUwd3H/lve1J3m914fGcb
 2d+aAWDXLlcQr0eOO1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150112

On 15/05/2026 14:03, Konrad Dybcio wrote:
> On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
>> On 15/05/2026 14:00, Konrad Dybcio wrote:
>>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>>> C630 isn't stable enough. For example it might reset if display device
>>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>>> value to make C630 work in stable way.
>>>>
>>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>> index e41200839dbe..e6c67016552a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>>        status = "okay";
>>>>    };
>>>>    +&cluster_sleep_0 {
>>>> +    arm,psci-suspend-param = <0x41003244>;
>>>> +};
>>>
>>> Is it better if you do hack in a
>>>
>>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
>>
>> Any clarification? Then I can try hacking it in.
> 
> This will send a message to AOSS to intrusct it to prevent CX from
> collapsing

This sounds like a dirty hack. I think, hacking psci-suspend-param is a 
lesser evil.

I know that we should spend time on understanding, what should vote on 
CX instead, but having the issue only on C630 doesn't really help. Maybe 
it will go away once I can sort out the gcc / dispcc / mdss issue on 
SDM845 & SM8150.

> 
> You'd need this somewhere early enough so as not to crash
> 
> alternatively, the good ol'
> 
> diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
> index 6d5bbeda0689..2fea94618839 100644
> --- a/drivers/interconnect/qcom/sdm845.c
> +++ b/drivers/interconnect/qcom/sdm845.c
> @@ -1786,7 +1786,7 @@ static struct platform_driver qnoc_driver = {
>          .driver = {
>                  .name = "qnoc-sdm845",
>                  .of_match_table = qnoc_of_match,
> -               .sync_state = icc_sync_state,
> +               //.sync_state = icc_sync_state,
>          },
>   };
>   module_platform_driver(qnoc_driver);
> 
> 
> should give you a similar result
> 
> Konrad


-- 
With best wishes
Dmitry
