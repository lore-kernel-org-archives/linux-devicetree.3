Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90D7322A1C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517649; cv=none; b=ILmtbDn4aP4mxJgeebPf5BNTtn7WEJkM3RtpcilfnCrJQXarfzVXQkEoOIFZt5Rni0b6TqCa61wPUMNEhkCiUgq6uE2fbK8+PbJZhoVo1shCrd35VPDcGDLTPNKaQmN8GMwBTTo7XfW/KoAG4qS7tMWyP1UQeEpv7pcQGLIJrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517649; c=relaxed/simple;
	bh=DZlwvNFhOczSN15iV3ZhEhqrNk3Z2FnJ3q8czGO+XvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oig7aAz1Nxk6jbJWF991lGttlVuq01wz6aF/QdZV9aqRv00bO2gP4KnXUD/15nMMgThyfiS2zxo1TSr3yafjLAE5a7dlQaGjHGMPTMW6E3u6PiWJsnbBuKqdOvABzaehUvr6FQka2fpqyuWda9wLg5jHtNnhBiEdN4Cg5EivmtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dl5VIgMe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M84Uaqea; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dl5VIgMe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M84Uaqea"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F9TYjl4160997
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=; b=Dl5VIgMe8zt0RvuC
	Mp0Aiu7J+1B8czhXacbZfIPdBD1gOUrDMvq+fzMZ1Yg5iCIu6KSYHPK037kAvZiO
	br3PCfXR57OHKQl+tcfqKQLHXKgmzyJOyyvCHnR3Zwe29JGM7oAe1lm+Z2G6cU3N
	4atN3XTZUW/V3qbmmy4Af4Cqk69uKyK+AcOiRTK+IbzHysKSo3S8TGKsYy1JEORU
	a2mGXvoNnujvKr/X5rwcW/ZoWwqkyzEB+SK6qtZz9rsgZKoyXVphwBz+g3AwlFoH
	eQG4/foq858KFROP4m8STRRHfZduyRvRVvBeXv9DvqnWX4Yw4744yxkzeLSU4BCk
	XGyOqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf03uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:00:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a81c1738so19940835ad.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781517646; x=1782122446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=;
        b=M84UaqeaCWTbVnxD1m8Wf3SCTlJ5ZpuidCa9DV8TPFe69GyFuV+6Mvqj6TNUjnlDE8
         kmYj1fukbH/93XieXVFS57gOoZI7reLe8R9dR74dFfUCXtNfyG1RAYgQfXsXvR+eZUNM
         B3/+63+o8WRS4NaY3f1hKX2sh5HcL9A3L9LWMbC36cMgZioa0RVaw0kujCeDedHAXEcj
         ibGvvRX/LyOLUamnrVFsk1MO7w4AvmCt3lMi/OGA9wCZD2b5bjxNoIo/a3jusN4MJHbr
         oDf6POsZshnS2v35VvQk8jZff8yPel2e95Be2EvoKqj+m6tdTePZyKdKd6NCklHmYCFl
         SQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517646; x=1782122446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=;
        b=Y1hz2bvQqclvJddh/iJ+gPkq+TBNuPWe1pkzlKlkvWRL2i3BCpInncrRExL+O0Y70a
         y1XFtlzEpxVQ6/vj3OTJ9Ozvk1h5AkM5kh3VkvyKK9Z7sUEVKYJEmhdz2bQD8xUj4M/z
         u7AW9HEL7lbMo2bEySnQCiGGqk/prtXTjvEANXT8K4eZop8ZCQYnpitSNwTX8UItW/P+
         amJ18iBkuVdxvIJ+Ho6MJw0QrXxan5cx5vDRhdeo+EstJgaobyMzFWl/S8fWNB1JjP4M
         1km+dXkJEfJo2yiR/ONPFDnllr1B4ywyolcfliH/Odnh6JuH2eAe3tCKjWDlkj2B8RQR
         xtpw==
X-Forwarded-Encrypted: i=1; AFNElJ9ruWMGUs6xNKKCR3fdllP2Ay3QhHbmjSw1qIclei40XHXFehIMweoeGqAnU5pMlv+Snu5m5m62FE81@vger.kernel.org
X-Gm-Message-State: AOJu0YwjhhNVto07F5qpZsTS2XgdvnQYsI1fGafFUVuUain9PJR6Iv4/
	YFSxmR7sJI2p3NR8iWNZtY99m2LvtlbVzm5kHP04T4id2Y883NEK4JRdFF9QhXOt2+PFlgj3L5L
	Ns6rpeR78aQ7d9yCAOouO60Ft4sUmyZU+TbH9qCMBtOHsi0tqr4r0fLbfASUSydUQ
X-Gm-Gg: Acq92OFw+Z3miTM/NJDufy3JwsVxSxlDSsnNRm8jDs/GYHrl64Z0kS35lMEzBjOuQpP
	XCgWDuIu6UCw38mpk3RyCOXJaOg4KVeS0HzH/TrOev2zxePayzDuOu3VMGgKmF9gFeW4r0lwHkd
	+qlaKDHCWszSI5swLAsBhI0YCYv/V+ifrweul5WwEA1zwnCIWxI1/NgyfkdZDsy5OHguevMSMQp
	RWnd7WEu0ppgyUtO1Jf1X4ntBeo85zvhQNxVrZD1Ccwr4Vvbp0SSaagmwqSexcFhgAHKsoRhoGd
	BSQfXPSnEjuIJpC8w4Uu9E4H1wiJdF5PyrOzxzNX3x2bT3Wa1CAdaQr88XS57RJ5/n1BfwEndhM
	iDABiluXHpDzeC+nSkgX2AxeoszGrTWIvyMGhD2yabrrY0PjE1DAmFwIlD2Fn
X-Received: by 2002:a17:902:e783:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c4134ec05dmr144412495ad.21.1781517645636;
        Mon, 15 Jun 2026 03:00:45 -0700 (PDT)
X-Received: by 2002:a17:902:e783:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c4134ec05dmr144411645ad.21.1781517644854;
        Mon, 15 Jun 2026 03:00:44 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ce89sm97213885ad.57.2026.06.15.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:00:44 -0700 (PDT)
Message-ID: <a99367df-7010-470d-bec7-0024b0bb63ad@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 15:30:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <e6567656-8745-4f07-9636-7779d32ccbcf@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <e6567656-8745-4f07-9636-7779d32ccbcf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a2fcd4e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=2pCuibHp1YRUK2peGzAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: XiTx4p9ra7R3lXxWqjx49RT1RSHfIkk2
X-Proofpoint-ORIG-GUID: XiTx4p9ra7R3lXxWqjx49RT1RSHfIkk2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwNSBTYWx0ZWRfX14v5wqudmF8r
 tVA/7bY55KNZ3W/NPJJxllA3mVl7ynVx0z6pSrFmfEG7N5BnMRRjGLXGPMxqcVa4gm+r0huZHAD
 /nzcnVjQznopGXbfleoXnVMcY707kxc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwNSBTYWx0ZWRfX4mmeV8KeVJJ3
 bZgElWSLRHeH2sPpo2mYn7RBoRcbSLU563kZ9Rdqd1lVa9hrV+lNwquHakf/9NpUAKvR5G+iFw7
 OdPwpVranVn1BzwSmFiqT1LY5ZAG/L40sIZYWqzgvGUrGwNP37IfmcCCp+CSP2Qhy3HBboZUXWs
 +DRfjiaKjgp4FM9q0wWTV8oNIZ3egy9HOyEOiGnaMSl6Qh3iHj77zQnLuJXF8lsurgG1pLPzkBs
 4ib6Klqie5vvij37fbFEOt78RAvX0nunRQGDoVyPqlOvetCC0xYHvvwA1D4taBQu9KYmzF3ovXR
 MU5qqPln4vRgssFhaXoLA2QgaX/MMjGxItYAR+f7XjyD9xBskax1e6WKczZ7uT1/1wIvKOiiXHD
 KjEOxUt2NfPH8U2UCnJRhRO5VhkDqZvpm+k57BWqZ9M8QCu4BqH2c6TRHjK2nfWfNgrYqmcrLQL
 SlpjDUPE1KQ85fhRWRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150105



On 6/8/2026 5:31 PM, Mark Brown wrote:
> On Mon, Jun 08, 2026 at 08:00:10AM +0530, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> 
>> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
>> +{
>> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>> +	struct clk *sysclk;
>> +	bool *enabled;
> 
> Neither sysclk nor enabled are initialised by default...
> 
Yes right, Thanks for pointing out.

I will initialize sysclk and enabled to NULL and add an explicit error
return in the default case of the switch statement to handle invalid 
clock IDs safely.

>> +	switch (clk_id) {
> 
>> +	case LPAIF_MI2S_ECLK:
>> +		sysclk = dai_data->priv[dai->id].eclk;
>> +		enabled = &dai_data->priv[dai->id].eclk_enabled;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (sysclk) {
> 
> ...but we just fall through the switch statement if the clock ID is
> invalid and use the values.
> 

ack,

will fix this in next version.

>> +	for_each_child_of_node(dev->of_node, node) {
> 
>> +			if (IS_ERR(priv->mclk)) {
>> +				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER)
>> +					return dev_err_probe(dev, PTR_ERR(priv->mclk),
>> +							     "unable to get mi2s mclk\n");
>> +				priv->mclk = NULL;
>> +			}
> 
> Do we need to drop any OF references on early return?


Yes, an of_node_put(node) is required before the early return to avoid a 
reference leak.

I will update the code to use for_each_child_of_node_scoped() to handle 
the cleanup automatically, or explicitly call of_node_put() before 
returning.

Thanks & Regards,
Rafi.

