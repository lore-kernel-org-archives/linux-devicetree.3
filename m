Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5F8470115
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787000; cv=none; b=qWNbnWLE1nkiP5HJh8+oHEvV6fQMh7cIj7KGi5c0wBYB1Wwpbp/Cz0Qig1mlJ13JGgAj7XqYC1z9hG8iXdwFA8fOPgClDUil4g3DnB+Gye4KCiztNSfXiPaEbkdjN3DDXG2bLHypXbMwv16U4VQFmoXUp5emcHHmJrqB19t/EoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787000; c=relaxed/simple;
	bh=G2v8Z4In0XdRAS7INMiDLN8saFBbHThX8C3LzAr0q6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYf9ONvcUrsTA56mlOLiRlTEkAQ2k6g5A19SeTm2m3W3EgmpuXwJXZDX3mvVvhmbM67Rbj7E2vgbnnwlZrQYGYyOc2buHMTIloOq1vkZT4IePcteGBPYMvMBw/dISNnDNkf+BaSAfSzKEBuFnRJAUSyQ58LgDObpg+Mem8Z7qhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi+be6Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNslYb1+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi+be6Fj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNslYb1+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An5Jk3862537
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=; b=Qi+be6FjJUIG70fb
	i8n9PVOwpcdyzyQHqqPWVv3O9greCJcXmPMxIdfG+ksR8LHCmjZj36HM08ylYBW5
	lF1r43md/0MPRSyDeGKFRhJkeipurAGK2bLrEN/GU8wuQKdbW3brEyw7vPlpav5l
	4Gc5XHZc+8Wfd1uEali5tnAN/AnUyYbrWryvjCYETJhcPFQ8ujjR+ugccGO++lpW
	3+W/QNI4xmegDrTlsvrAZqgw2ScLoYCDz+7hnYaaMKMZQfHuhV9UqKCGml81tMsb
	GoBHOFNBFgZli0l2buLvHCXUh2D9C3bZRLYqTKds6JJPHZupKRo4K1wqXoAfq6zF
	NkK2dQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hygn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:16:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c83bdfa6fso2547584241.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786995; x=1789391795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=;
        b=DNslYb1+j03QCL+J0b7ynV9Edh93gYkITo3U75EMzqDyDIqkOs759oQK3i/F+7dht3
         QwCd5FqClUvopjkoIIfTw8ocndVG3E0kMjHjo7PdGKzi65x9RFvvLgw0s8mY/kcul7j4
         HpWji1Z8F+97yy1LWFal2ruU8LDMmVIJQQA8NL1oODNEChpNZxJ/M8WC0P61DpGDy23j
         bRAGuFB20Y5EmMcbjnPKt/mOjMdrhpVGtzZidoK6OHw30yE8Bdy2urxWOKyPw0wyout9
         IJp1S2uwwCtlhawaY+ENmHxsWahFOJA2a7keaY9/e9wSTaLwSmgLjqQODrG21gbsgIBx
         xyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786995; x=1789391795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/JbXDPZNdiTi4gFT/05j7G8PAlG6bXM/OV5ZMst29U=;
        b=E+1H9hXlGSUSgMv5iNc1gL0jDsKCJ+hehZ1ZsDdabXKt30YA9B69In8LH7VwJYBshu
         WxGyPc7K8lqlHGQfV6Ab1+UYkurpT5A4dqw0jxlVujbP04nOBUqMIOffFz9RQKcDDWSC
         PSqcimABwqe6IO/wIomvlJlhWMKuqqf2e9lMAwpCicLbIOQhd2Ob+zUHzX+Gv1wmMPvd
         A5sXnvI16ClFEHIa631FVDr38wIfDCT8E8V2WH5+xRZXR0cTN+RmJfn9nbcMdfr1o3GR
         0zqGMmTEDVN1YCEQraduGvMyd6aLfhibneWTxSiz4gD7N0C6FG++d7bHAdcojSSZIVlb
         v4nA==
X-Forwarded-Encrypted: i=1; AKwUvBxD17+9lb/sB3wycLnDD5Ix/fGGV05rhTVXz7vrghZRo8uYNGf0V2Qzsn74GfDFEp57WYItNt+F7mTc@vger.kernel.org
X-Gm-Message-State: AFuF++kxcIkJNtm/UTzJoTtniakMXhApPBEunaap7eUhx32MH95u9MrU
	fsYWHc8njfOYK5EJgjJiL9eCVSu/965H3qUwweIE9LOuEXB792v4BzkpZBjgGWUwWtTD4/k3p4k
	VpOv18aGhmOp5YfeD73XI1AOkgcomIbI94LibDvqT87jsmWI0MgIa/LUdPp0GG7ya
X-Gm-Gg: AYBFou0G8NaeMl9RL3e/gp0yZbiYcR5Abr+JZu9LZFVuTQfzLCrL+s0oF0qvIyzRcKN
	ZsHU1S2iV7Qww4I2q0Pifc3p8rOIG08VsQZNmSvKKYOHG6sUmQGSj9gQ+UG/0qXJJrB5k+1iteH
	nqh9sarj+Ip6uhRR0b+gY4YE/IkUaC39UX95I78+461vKGST/4wkzlAZ9QQDSUzDDizef9ppabC
	czHSjHbvB0jGVHafrmfTAb7GIjbXl/ws0TiwKZ6t1dvPoyyweZc+up694nvLUIGWiGGgUvmLJR9
	u84XzKJPqDvPMOu1IMjEA71YP4MCxjVhP3YSc+90EH1ufdun5EtO/ZLDV/RG8geuQi3C5wQyw7n
	k5DZ/V3IcOztn+Gdr2knfraEMBMg=
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9477032137.13.1788786995106;
        Mon, 07 Sep 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a05:6102:560c:b0:786:aae:aefc with SMTP id ada2fe7eead31-78a4aa9d9dcmr9477009137.13.1788786994613;
        Mon, 07 Sep 2026 06:16:34 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c28e9eb4d38sm176729966b.41.2026.09.07.06.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:16:33 -0700 (PDT)
Message-ID: <abaa945c-9af7-43fd-9f2f-ba20eec2a9bc@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:16:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset()
 return void
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
 <289d5485-44fa-4d74-8f69-7adc1507ac9e@linux.dev>
 <ap62OoErmU6lU+9l@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ap62OoErmU6lU+9l@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9eb933 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=zomqoF8P1_g83G_DeI8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: q8VTKFuQw6_MdkHUFxxkAGxE7PD0xBRH
X-Proofpoint-ORIG-GUID: q8VTKFuQw6_MdkHUFxxkAGxE7PD0xBRH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfX2aUQzKoxKZ+0
 cHNZgqhxtE0nFVkdUp1eBfRD0VFxUII0ZVvAyu4CVV2gwz9kycMVB1N4/odmirOS1akBpVdu8g0
 SdaShyTVrzsQDD4D0nmTqTgLMztpd44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfXx6j8cKlAO5Ka
 +3onOXAXANAykR1aNOEVMeiZe0Mti+xbhbbkLg4RE0z/aSpucSqbzNciMSqIdx3A62dZdJjHH5/
 yKD5P6FE7YnR3ad5j4vraITyqLwyfVvjYz9wWVzHBFvYIUaJTS1bJVx0fN2Z+1K6djwp6hK5yTb
 Umef2F7v/2H5BRi/D3Gp2JB0FwxRk6WhOpOP/f/kYykfnBhlgQTk2Qx5dWDquHaGbHIaHjydocq
 g7sCd+lzUrZINu9AWyYOLppvswJq7cJ5yWgFvzFMqhFRlNop+qWXDow6tf49XozE8QYYDJuLpPg
 kehg3S2sFd9n0hVnx1tNz7Qd/Ya/WgG7N6xbcHAMCEBPJRyuzNx29jZJ9dxFeAiSi6ShceQS7Vd
 x6HnejCFDZITe3E3Ja9xudQPmIR5mMIwkLe/F1OAWHpWYgaktD+EqmdQrDZfkuLA6AGXco5Om4v
 Y83tNRfoXFrhKuc25BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070146

On 9/7/26 2:03 PM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 01:32:30PM +0200, Pierre-Louis Bossart wrote:
>> On 9/7/26 10:37, Srinivas Kandagatla wrote:
>>> find_sdca_control_reset() only ever returns 0 -- it just sets
>>> control->has_reset / control->reset for the framework-known
>>> (entity type, control selector) mappings.  The int return + caller
>>> error check in find_sdca_entity_control() are dead code.
>>>
>>> Convert to void and drop the check.  No functional change.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> That looks also unrelated to DT stuff, not sure it belongs here as patch
>> 08/11
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> 
> Agree lets pull these two patches out and submit seperately as we
> can merge them both happily today.
>

Thanks Charles, Sure let me send them out separately.

> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

--srini
> 
> Thanks,
> Charles

