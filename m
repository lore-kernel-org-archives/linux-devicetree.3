Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550023;
	b=JXGTcjXmnx/C1tubNVjknemrwQowzeFL+k6oToqDSGdw8Wn4xl0C536EHzR1NT3++Mhe
	 Jq5uJxESdj7lR67JMexy4cqgEK2cb5bKc68XM7zWEIc/KDJtpVESq0cqlPJaI6oEnb1DG
	 oSORcbO+Gtllu6WeQKcZFPameZo2eVb2nx5TsynQ32/7MKcVCj2ACZhuTwVnHTG9Jex6p
	 9PjA4/ZMJI934+t5bT6v9l9Gz6SiLN2Zb7dyfP9swvi5sW4p6FxCgbVQPeX/iHbOys09K
	 Ia6ZdLsnB7rVlKCO3eP6n5v10zshpairVqt69G8wgnzXLfCSHYHxVVpuJO3PZ1h5z7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UgAMXzwGiFMedIrvcOyftAo5u6xTyBMmfWnPz10pLMg=;
	b=VbMdx0Sm0mprDDHyYPrvCUPoTE38bgYVHpGGn4OOW5wyic+2wkmDBinSP2QoBXsuYJUj
	 4/AJhoF8PCxxPanZVV6dWYKNGDmCnDtTAcZ2aGKC1KF/+PSwcW1h2Xh1KZ/JBZdK3ToVV
	 vZJtHG1KEfOSBVVwNOFDrjMPX/pIQ6zVP6pIlZA94I/13Oh2inop/FWFuyUGvpY87PILr
	 +St7JxCa5iqeS6RhdWJDahUKaReHcNLrccO+k0KVw5fUdD7r+db2Cu6h9a3Pt8/qV7ItD
	 AQv1VQP76t/EHC0qEZxBTIcQYWyDe2May2W68qvudsFDvfhBS561ubCsDCxQbstrU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fXYVRi1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zid0Sx2B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE22606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fXYVRi1k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zid0Sx2B
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57FmP3120089
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgAMXzwGiFMedIrvcOyftAo5u6xTyBMmfWnPz10pLMg=; b=fXYVRi1klN3xbDYX
	ajjK19vTr311U0EkD9DFTO49pkZx9aK6RyM8vnzvX252b6K/hQWA0JkuZ7+rzPgp
	gECco2NeGtkk8cA7KBTjaF+IfdS6FVDy6cArUP1iiraQxtZl6EjOaix0wDriCPP2
	ooS044+iWe9456VP1HCsiyOI4H/tIOrZ/fx2GCJA3QvQottvvv6Sm6VoEB9KKIaj
	zSKMYlMCgFpn58HhgX/cixO3gfP8GooYnxWGN6MNMcpptRs78zCod3jemvXy/OM6
	lSgsTZaasGJCv1sWcvReTpbd+mTsqBj3SCY92duXPhkOpKcs/dD7fy5wVuvZkJ/N
	Qk5Tlg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgw9rcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:07:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so371775a12.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794550021; x=1795154821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgAMXzwGiFMedIrvcOyftAo5u6xTyBMmfWnPz10pLMg=;
        b=Zid0Sx2BVQR6PCIH4L43k2DYr8eM51t3/Iak/Dc3erpHkiBhAAT4AxvFe/Ze8llyY9
         BrkHg+oJgVh6Dnu9urOKAA7uk+DUz0VBFhj4RwwfJwn8LqRbTJsPVvxsoXmwIfCNW6JC
         gV6mAYTZeioiypILMZnzxW2hNxInkDrDKfHlMjnZe61QP8PKW0RbD5dnJyX8ofQtZ69X
         znbRjP1VgHDEC2h9nMg9Gg3GrlGy+bfOImmLsEQR1f2g7LBaym95/hJGSQt3LPZTD4JP
         71/NL2aRT/XHp8R0E87AmgUvNtDOflU5NBxkwa1YynrmRwQmG8mg5FT3DlcBV71MLbf5
         uoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550021; x=1795154821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgAMXzwGiFMedIrvcOyftAo5u6xTyBMmfWnPz10pLMg=;
        b=Bk/2CJoMXPDyaniEYur5ddDiLkON8XSnGcnJ7j8BIvGDKB/5xjqovjp08Fc6hPQIdc
         1vHTPfUtEtksaZMw1RWUDlAnqpKBPVbsHwg+4n7/pWsJOqhZ6RoV+vXasTjzEu6dC1UP
         RqZkiFfhv5G17fGhx6JH8tJA5MCY2fsbumzLuRE1liuK87dchmIWqD4tqs1VgdoQ6c+A
         38qFFC2obubBFLgm/a7vy+GNueJXE1MhYjK0EffaHrBtgQ3P5Cbl8BjewgUifNrVs0ZW
         oL7kUWrxWKXOk6kOKbo7HuWVddozNiMm1M/3KLCjFYZV+o5q0Vw5tko8hWKUQ70dieUV
         0JKg==
X-Gm-Message-State: APuU4Z8wnprliXeJvO47mAD5wWhtKydTTelZfZuUAWQqcbMPIGs5OA80
	D22PowzSaUf0Kylb3qRAv3D4NPM0e/23EopnofvaRh7yaas0K8IzLurOoq4cI2NEo1pzLHPi76p
	7MsR7E0kZlViRJ51upsFt0w2phbAYKiDFC54d6xzf2Adzenid1p58GDdY9AdR41Ah
X-Gm-Gg: AYBFou3gF3Kzw0lIT6w1VOPA6XTQkdqJqXWY19/nLztdm560mDRAMzoURGeuFmEf0Fe
	I6pE8iZ9PXqs6jf0IXiW0BcmPgmAqtVyHJ4n1AoY48B8Xa7ejyE+pfBaSqav20YMNAdR6jZ6FdK
	v9Hv3jXD1mWSgU5KIT8bLRm/EO2EqI9s6yo/EcVNnvgzc+nhxNM7tR4XI4Au0X09E0PAozmitG+
	AxkxT+nVapMtk0RJcfJicLA41G0K2OCLtIKM4jtT6H6kBH8LHEtSW7Kb43iRMUBOWTw7d63ExE6
	zoL+tQPYZlcBU/YXut5QRoBHv20EAhUAw2J0e3erzSqDknpWTCk73cEC+U6uERyOmijyZbBWjrB
	FEEmsHD8fn6+n5l4p38Qo1aR4GkIFjYZ885ao8DiZFqRFCJB4OdtSZyD7TYiS1tWemtxx5J2GXO
	RqehE=
X-Received: by 2002:a05:6a21:888e:b0:3eb:a2d9:58f3 with SMTP id adf61e73a8af0-3f7a7cc6890mr1255583637.41.1794550020727;
        Thu, 12 Nov 2026 22:07:00 -0800 (PST)
X-Received: by 2002:a05:6a21:888e:b0:3eb:a2d9:58f3 with SMTP id adf61e73a8af0-3f7a7cc6890mr1255566637.41.1794550020241;
        Thu, 12 Nov 2026 22:07:00 -0800 (PST)
Received: from [10.239.133.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18cabc9sm705020a12.30.2026.11.12.22.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:06:59 -0800 (PST)
Message-ID: <5a4d7f96-32e4-454f-92ef-3437f42f7a11@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:06:57 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 07/10] qcom-tgu: Add support to configure next action
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-8-songwei.chai@oss.qualcomm.com>
 <sashiko-outbox-212115@kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-212115@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6a905 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=seu3x0KXz8hfYJcQ2jQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: q0dbyanNE_4umCAeO74ZrjqW60hd2lzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX20q5D5tlgAb3
 0z+9RHZYQTCx/YZeUjsJXI0XIw2kiOnWWTJOp0mY0F8JmJXLqpLkvCyh9A+lghZQrKDipjY9iA6
 Q6ABvdBxJKe0KVB6m9MH4bahVEV4V3Cx6bg/Lmpy1XeLt/5dXi0e/UIv6PcLqo0qIRMG9zjwznX
 jAZ6eqLKltch7kyK3wvGY5taNekUVJ0gbnVJ2pTS6zp/MHjksPxILBNlTvAWOjCEY4W6Z25kkdq
 yTm2CSIrHaC0q6uq61q5Io/b7vM8nNtcGNmIABzLu05i2Dzpf4gxNFmbYLxFn6YCtpB7maz8f/Z
 GvpzySYY4bMfbWPWC/B8h9w60RrNNJjSzUP7T6yPwWCM45gysGEVBA7F9ArMiuPbXuNzJrvFeIK
 QkyQIiWZO8Y12Ext++aeqBC/Bq2AeU5GjaA2w1ssGPp2VP2SVmN05ZKOWJTsQP1AaKRuWQlopCl
 c+jYMSFXFoElf7O4HsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyNCBTYWx0ZWRfX65sYAhNxFXbo
 b25k6mEDiLhicYHIfmBrt0e29Lp+5TEgezXbV+6FnPNG6YLhaAmHGKNsj9g214CWa4+w/u0xtgt
 Roe/Y+aEQytpvBd33AIfBqvUns4KbNg=
X-Proofpoint-GUID: q0dbyanNE_4umCAeO74ZrjqW60hd2lzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130024


On 11/13/2026 10:59 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] qcom-tgu: swapped operation_index and step_index in
>    tgu_dataset_rw()
> --
>
> commit 39b03844fdda185e25e4736b4873ab4173c403fb
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add support to configure next action
>
> This commit adds per-step condition_select sysfs attribute groups,
> including numbered select registers and a default next-action register,
> and flushes their staged values to the TGU hardware when enabled.
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 72b98a96d7f20..6e66752a7b8dd 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
> [ ... ]
>> @@ -409,6 +473,29 @@ static const struct attribute_group tgu_common_grp = {
>>   		.name = "step" #step "_condition_decode" \
>>   	})
>>   
>> +#define STEP_SELECT(step_index, reg_num) \
>> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
>> +
>> +#define STEP_SELECT_DEFAULT(step_index) \
>> +	tgu_dataset_rw(default, step_index, TGU_CONDITION_SELECT, \
>> +			TGU_SELECT_DEFAULT_REG)
> [Severity: High]
> Does STEP_SELECT() initialize tgu_attribute with operation_index and
> step_index swapped?
>
> struct tgu_attribute declares operation_index before step_index, whereas
> tgu_dataset_rw() uses positional initialization with step_index before the
> operation enum:
>
> drivers/hwtracing/qcom/tgu.c:
> struct tgu_attribute {
> 	struct device_attribute attr;
> 	enum operation_index operation_index;
> 	u8 step_index;
> 	u8 reg_num;
> };
> ...
> #define tgu_dataset_rw(name, step_index, priority, reg_num)              \
> 	(&((struct tgu_attribute[]){ {                                   \
> 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> 		step_index,                                              \
> 		priority,                                                \
> 		reg_num,                                                 \
> 	} })[0].attr.attr)
>
> Every step[0:7]_condition_select attribute ends up with operation_index =
> 0..7 and step_index = TGU_CONDITION_SELECT (5).  In tgu_node_visible(),
> this hides all condition_select groups when drvdata->num_step <= 5.  When
> drvdata->num_step > 5, the default attributes and step[6:7]_condition_select
> remain hidden, accesses to step[0:4]_condition_select/reg[0:3] read and
> write drvdata->priority or drvdata->condition_decode for step 5, and
> step5_priority[0:3] and step5_condition_decode (which have
> operation_index = 5) are misrouted to TGU_CONDITION_SELECT for steps 0..4.
Same issue as patch 6
>
