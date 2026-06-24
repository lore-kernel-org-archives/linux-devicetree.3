Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540512C534
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299208; cv=none; b=CD6Rt1/LVS7pPvdouSTobSmwk5xx6VAXCIK5XfkoDoC6WQMIcaS8X2Por7eFVfWRnqlBTqTPal+/G5AafmTVa9p31KkrqkWRlwEoizMQlYZH67VDffNkLXTDAUaqiMtM2sQaYlyCmCNeJJAQvrfqhFeo30+FjGk7yFxSrtr1660=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299208; c=relaxed/simple;
	bh=uPbUn6actKKkvsdui2PhPU5T7wXetEBaeMWfS73GncM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7hVhyPuoN/tJYsBXzhYUYjdGItk7eKxq1KgIXitKE5ZsVnwHlTK/uEli2VRo2KOSy1USidhUXpgZGvcc4AcPhEPeH4bzmL1SKE6MvJxTFpq5qQvceysNOU9R44OaeV42I2fVEMStwLejkxUFIcjFjDrpaCQrEcd/c4ilq5RcBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojvBR0YY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gScqLCol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojvBR0YY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gScqLCol"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANTaT3069766
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uc5Cj3yh7udwhNMcfVCvV98vfUFOng4oy8Pby1IpcrI=; b=ojvBR0YYRIqoisgZ
	LolSuv3sxSulWt0/PlHffbvHZNPMOvzl6uaQvSENxe2gKHIknb0uRsPzqvTktD3F
	Md/8KexnuF8wcacC4NJxsELoZOvL93xExCYB8kzKxlfVFskj97feDBemUxUMkKG8
	bpANkRKvRtMx6JQygc4X0wy2DAMDxV2BBpluW2BZSSdykIa+zcl/c6QAdyvB3vFh
	xiYAgg83WnQsKtvS6dtRRrRd1efrkgjiKCRoZXQPKNqu1xzSdb91KbfJs1aXGx6L
	6GS/cOfoB27X5rK2N6bEC3rZZdLm1eI4AfbLr9H51NxaCDx+3Z+7zSCC4nxE0LW+
	R6pjCw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g089q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:06:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8453558c5d6so214481b3a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 04:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782299203; x=1782904003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uc5Cj3yh7udwhNMcfVCvV98vfUFOng4oy8Pby1IpcrI=;
        b=gScqLColV6EiQyNzNhV0t228CNuB03xmy/LeY1BHxpIhjfMRUzcFWDaMLp14hTAXK3
         pqKTJ4VhYQK6Ffp8G8015tidTPm89YV2lUrhRQDGGZ/qgVfDsv4C6fu2XQyeYbGMV3Y+
         yaC5qL9Ez0CuwIKh3g9quihoQxEMfkVvi6p9UdZVFEtRp+SgqRWykb2OldtOREgUKaI8
         nSlD7HHeG/LkZBEYgIIAVb/Z7UYJn5oDxlBfKPZOOADQ8mCicVcT/Rx+MIRmeH/4cbBy
         NxDonSG2GG/ZEPCE0Zn0swIdqN99LBPSeUg6FCfSLGJrsFXAlUfiqjW50KUQJGQ+T4zC
         5fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782299203; x=1782904003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc5Cj3yh7udwhNMcfVCvV98vfUFOng4oy8Pby1IpcrI=;
        b=HDgc4790bpiI83J97YsfAnpK0aSnslmnxhf3fHRdyXgrLdKZyvu3LfcHRbO8LwDju5
         f+EyejZtEbzaov5xoV6HRmuxrAaLnn3SPiT4p0v6esNVzg/8cIOYgcSo3bauTf4PeA/N
         cz5FJddLPBsNJLOvUjTG0Sc8wjEl1bKb915BZbqK/kIgdB7+CKLX+F6fopO6GCSEcD3t
         K/FdIKpeRxR5vzIfKicAvfy2A06xD1qHMDV7PkTKLf7RNZc3aAGb47jz43tNDRqCFZBS
         c8WtULwCm0ExE9HxUl1LUo1x8yffcTwU7aS8ooOfwCNyZasyZCjCltkw5G+dHPZmNnUP
         is/A==
X-Forwarded-Encrypted: i=1; AFNElJ+WJvz3ubN17aXmNjuhHuhli78G1blDTKiP2YN5VITqFi6RYcbtoDGsGOAbjQB2SW/jL5nkBr6ALBjd@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRlJjbDoOewraHwlplZ5y8sEX2dJ87+oZyqt2IvR0a4rE76Ga
	EWuPTSiT26RnlYCJbJLmWHN+xzIeC9Xt/bnKGCfVIzTmW0Y5bdTwf2Zgj6nHh7FK5RH7mWqtshI
	dk2LR7WGIZ78ViQFfGEsvufPq/On56x3LNMDRjxD7iZJ1G9TmhIXyXOhUJoQ5oBZ/IY2Ke0On
X-Gm-Gg: AfdE7cnzW9aVEvRvEpsgeDWkPZjm6E3gdNwokTCP0FXPZAoQu2u8iRzQh49hUVsIKes
	xM08leDEpTs4eZY7FvT7QlTo+3Ch53XIQBetTxG/lucbrdjZuQ5eA6fCyZyudN9Kk0Vczte2ORZ
	OfuaZ9iPYzNGJHkprDSJE498MxiXGREzNVa401Vhtqhfl4iFuiOrcKcW58VJ4/gqMF8u/EqffhF
	xyLHk0Qv5pGob+zgroNcWkLJ8pqakx+nhEX0ciVnWFIR0mpGOA0/IkD+h4aRTmeroQITN6XjbEI
	hPvgWwFyjTls8lACqEDW/4wKIl77XWnkBRpfGGkuZHu4Iw0d/g7dDko9igFnrBbdGlrx6x1+XxW
	sJ9tP1MW2MrUj2tPguSyhDAfG9G642YLAJtQ=
X-Received: by 2002:a05:6a00:3e06:b0:837:95fc:148d with SMTP id d2e1a72fcca58-8458efed8aamr5218477b3a.0.1782299202579;
        Wed, 24 Jun 2026 04:06:42 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-925c87e2572mr916074085a.6.1782298828928;
        Wed, 24 Jun 2026 04:00:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580f73sm1620615e87.63.2026.06.24.04.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:00:27 -0700 (PDT)
Message-ID: <891015c8-68df-4654-b1e7-94d73e74267c@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:00:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008
 PMIC
To: Xin Xu <xxsemail@qq.com>
Cc: andersson@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <f18194c2-01eb-43c0-8e40-5575deac9e84@oss.qualcomm.com>
 <tencent_A1865527015C7AD1B52C56A46AD106234508@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_A1865527015C7AD1B52C56A46AD106234508@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3bba43 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=dZbOZ2KzAAAA:8 a=i_-uY6NMUGNg07SqJiEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 1yvntTdGQbRnKFCQudRNbYCXd35xOyuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5MiBTYWx0ZWRfX+Q0hKWQPUzda
 9Saw8fx0MzMa8PIUUs/++bdaLxAfuITA+G9FF7Ow8uLLyhibqQbchqsuQ5hZ+DhgO2vxfxLI5IG
 ZQLbAKOuSbE37FBNu/EVdSGdIHIjpXqwlsODfPGf7S6XAvRJjL30/2KGjorbxalgZfjeO4Y2d4F
 A7Nl0OMk3DLcXp3dpRUSHwc0ZYLY37OhZPNu5sD6TJ/1mdxfN773IKdSEVo2uPdZmEcYL2gjT4N
 7AW9qUTbYnNnaPpw+DhCmK+bmBvdeti6/zUGHePUsgNOzGs0JcBv42xh2muW473QB9UWAW2eMhg
 6imrqma2yNi2kvomH+dZ5rZiBn0AbrOBJ5A1x0Xu3Ce9yiWICn6snYwJrdz92+lq0M+BQwp2isj
 rjodZoKhsnJFE30ziq6qD1WnoWOK7g==
X-Proofpoint-GUID: 1yvntTdGQbRnKFCQudRNbYCXd35xOyuz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5MiBTYWx0ZWRfX96+0AgsPya77
 VSXcFPTq+c6C2szW8mAt9k0HU/goww90qUCWNViuY0ioK6EDwmaP9pKAP4OEzD9cSAkoMAGMcr+
 9XDL1IzRg6vmIzZeDuUXHlnVF8DVP8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240092

On 6/22/26 8:07 PM, Xin Xu wrote:
> On Mon, 2026-06-22 at 13:40 +0200, Konrad Dybcio wrote:
>> On 6/19/26 6:07 PM, Xin Xu wrote:
>>> Add the pm8008 PMIC node on i2c15 with seven LDOs,
>>> using GPIO84 as interrupt and GPIO76 as reset.
>>>
>>> Signed-off-by: Xin Xu <xxsemail@qq.com>
>>> ---

[...]

>>> +	pm8008_default: pm8008-default-state {
>>> +		int-pins {
>>> +			pins = "gpio84";
>>> +			function = "gpio";
>>> +			bias-disable;
>>> +			drive-strength = <2>;
>>> +			input-enable;
>>> +		};
>>> +
>>> +		reset-pins {
>>> +			pins = "gpio76";
>>> +			function = "gpio";
>>> +			bias-pull-up;
>>> +			drive-strength = <2>;
>>> +			output-high;
>>
>> Drop output-high, the driver will take care of setting the output
>> state
>>
>> Konrad
> 
> Thank you for your review!
> 
> I will fix the coding style issues (blank line before status,
> interrupts-extended, property order, and dropping output-high)
> in the next version.
> 
> I have verified all LDO voltages against the downstream device tree:
> https://github.com/MiCode/kernel_devicetree/tree/elish-r-oss/
> The definitions can be found around lines 209–244 in
> qcom/elish-sm8250-camera-board.dtsi

Thanks. It's best if you grab the DTB from a running device (which
has all the overlays applied etc.), which you can grab from
/sys/firmware/fdt

You can then pass that to DTC directly

Konrad
