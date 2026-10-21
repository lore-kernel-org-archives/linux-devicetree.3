Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560454;
	b=XPMDGaLDzLMVPiYSPC/GcspNOQn7aHN4NsFh5MS00mWNkR6dqzFAopCrqyD66r7gl+q1
	 WV855Mih0pVwY0FxF2HWMptfe/dAEbjJvWRTp3F3oChV7F4pdg/H8y7XqjJ9i+BI+/YkE
	 NcJDkfi98p//Owt/8YqddZTZbEvkOIM4oCKqjdhlUY+4K+2U/ihmVbnWNTUkYwOfyRmiq
	 k8lUl5OgYV99k/mkRw71v6R3LM2QFvBKD4/G/zeBSk6igxboRzJt7cNQeigu2qrv5abZp
	 rDLZFVdyaaTLRSUkTvGNQjDUJZbIfdznu48//Sj2B9tizqw2hqJ4orH6/fP2gyfy62g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=;
	b=Co2lh6cwVS7V5CEvyGtAUwMY5mCA/0z64ZsAwK0ID/0hxfbCegHlkImtJkt7Rjoa79qZ
	 veAmvCIv0j4YSbn5iNH9MjhlF8PHQnDRo2lT4OGbhC85Vh+P8PJF7YjhPLhaT0LfWZHMB
	 maPFA6mGtCq9/rD5mXC9K8PdWUT9tKpKzusXqk9WjFN6237WJpPGV9Gz5EyKSc3UXqFwy
	 CtfUeWejZo6XJuLV0mvgfICxiTL3MRB4V5g1BqNQywhpJKhm/H75puWT51MNRdeJFD2OH
	 nsXTDFFdFOclpZLZ8IYKtlmUShzNNdloExMPQc75EkSQEgiheZGM6hBQ4iFdtkYmO6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hil7sIMY;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGfKmdE5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E216606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E216606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hil7sIMY;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGfKmdE5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5DiSv180087
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=; b=Hil7sIMYzkdqfvGk
	SBDhTM9TiXhFvdVJfYn4qmWAiIO0T/fuFkIr0gEtRpckin+J62Q+TTtJfjxsszm6
	c6elfhGPcZXnqLP3QLaIrDeLnVv3/ceCQaLtxamyjRes6RGtDXhnBgFwBFrVfNdO
	7rLJuHTRWZ/tOf48CVWJXOuR1vLzoLP/lhl9iZ6R87VFyj5jV3zHM/TyhxjSk1+Z
	QfWrKQnooYxa0N1kPZJNQiLUiAAu9bQSq2XBAfJe+FMYQpeb28XAAxWwf314xYnF
	ZY8xqbnG8FKg6fqviA0NUS/9S4CA0CX2DD/OLI2MM6ckMZIvRlXQxLaM4ZouBcqA
	hpQi0g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajj4kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:27:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so1489605eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792560442; x=1793165242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=;
        b=BGfKmdE5e6LemyZce9m14wtMD+YyG+aZMKFruQ7hulyf2q/J6oLMCq0u/9ZpiySCUw
         fnno1rEkbm6pWFSL2ktT3nqBZ7ZDxSU2efjsiYvhJ67cKYkKtg99pyM+fN/O4FTAzMZ3
         Y79Fj8goO8c9khoQreEjimKwH034UAiy3B1Y5myMB+BkKJ96PFLpTjGeMuWTDLJQdOOA
         cz18BBwCzyJ+aw0iotPArVdHhhK9PEL7aiMDr95t9gdiaroaqUJe9yWvE4+Lm/+67Ds5
         vVCOpG87A59nDmi5hlN/o2EtWWBrazBCakQ1WUn08uE8j5gpCAHucafsC8VUbFJ0kSEb
         s8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560442; x=1793165242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=;
        b=1U9sFoy8tkcISZyoTZObI7807HbhW2BuZZnlN/WJ6oiQ1+9btbtALF3MHRGzycEG5n
         ebvYu1iX1qkkyqDB6XO7oioIWDlN2S33hyn1Z5vlfgtOIuq+AWj53brFDETdLIBdZesB
         7IXDgmM1sWq3dRXLc0qxr8rml8o0DD2DY5O5gibZ6QwoQKM1r+1CoNkc6xc+PIixmkka
         1e1w33mGYso4NUmgwrsGxndRajkQ9aJBloc66U7l1V2IEorGgDSbm6CbyXFKewgP7G3N
         UoqB832VO7iFr76GR4vPiB9+vK8XHBrQzSU17NNmTtwiySZMRLdazrW/jYw/q0FIETEP
         O3sA==
X-Forwarded-Encrypted: i=1; AKwUvBzacPhR30lJ4SvTDCo6EdRAEdh2HjrrZZ8nHWUU+dCSoxyWBHF+QnBS+Oqni6wc7bGqbhExjd620D59@vger.kernel.org
X-Gm-Message-State: AFq9FYL8RBfP799eGconxLH7rZp0V75mgj8KuNLBDWrXEeKEX3WC/GWC
	GByKzpyK68P/u0ycwZ830J2/DFuTODDIEnsRFoVkcmT+ijrwZevvKfy/E2TCbK/UKdfyiEpfnLx
	kkzztN86ODlCyzCU6spuZM4J3cjCTF7iaZLQQ8en5STwCWH1XXiLty7DsAyQB1FCoiGVmePrp
X-Gm-Gg: AYBFou0CByo7F6gp4HanASQ94kdHhiiAIcrhYPNM/mFOlWFEy/pIKZpD1zwNZFVsDN3
	3+wxcd/3yrtJnQq71EKh3CuXlOSY22ew5W5dtR99kHxndaMX00GGYo/7dG+JxeVDiJcYJKZv7PF
	R5ggdgRC0uzziA7eYX4Gh83D926DrcYwYy58C9slBVj4jJ7OfjXPD8CV0/4LDwq4U1vANIXGUyH
	psLXywnNwu/lPTMOyB6GqwBTmpSB16OvT7tODstL3bHw5IfN3EePnJhxOSrw4WedFJml95s5WwW
	AnK5B45UzVGijt7iPIKwJgrqGDlRElRYoqGfkO5wffoJiZL9tD2u0ITW1ay3Lk59v0/S7o/Xh6v
	mKN9cO8HMsQngLqAXtmQknZTPP/FtZjjoMg==
X-Received: by 2002:a05:7300:dc14:b0:358:cc1e:e23e with SMTP id 5a478bee46e88-3674e164bbamr2292200eec.38.1792560441386;
        Tue, 20 Oct 2026 22:27:21 -0700 (PDT)
X-Received: by 2002:a05:7300:dc14:b0:358:cc1e:e23e with SMTP id 5a478bee46e88-3674e164bbamr2292158eec.38.1792560440663;
        Tue, 20 Oct 2026 22:27:20 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bc89fsm4184662eec.16.2026.10.20.22.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:27:17 -0700 (PDT)
Message-ID: <7db04008-5dd7-40f0-be6c-eb230bb3490e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:57:09 +0530
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
Subject: Re: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
 <20261017-little-fanatic-bulldog-e84f9d@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261017-little-fanatic-bulldog-e84f9d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX72Q8yLmkqHDX
 WMhNe96HwpU9wX+RgzI0QjO5I64xNSpN2LVkPuuWq+9y250G9ZY3JxO1BkLYAGL+JYQbWDEXGY8
 cKsxnvRrvbf6QFMc9Vbq57Ogkw+6TsxFp3JC9l/fQYk/bqYNzpollE+AzbN+rJUBkbNWi29aLzY
 KDnS+grnoHZMhC+qzkqrR1q6MCt1PZgSd7GfySRIs2NiVtaU+zYUck+LmZ70xkESCdWB6U6sdq5
 L736deVDiTqPLZiV0Sh+tF9Bmm6A9GlQzRUK31mngBeb50LLV6JDvpLycVdvTPWWnSTz25jYuM9
 ulwYHSj9RsS7V59yTvzgK/LtrvrXzv/kTo4p3lPS7Y91bbkXVZgwC+qGdGVGueouJLp1doDgGnU
 Thu1yT4ia8gbsX1ww4nxLvNbrXn2KzhmfJnjHqCRYf293HSq+7KG98/sNo0AOmpYAV0hRPqa7eW
 YTdcp2MX9m5TspmIPxA==
X-Proofpoint-GUID: IGJwXCO8XvLXs9haHBbVeKTQN7RVlf_P
X-Proofpoint-ORIG-GUID: IGJwXCO8XvLXs9haHBbVeKTQN7RVlf_P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX51UsQAULsxQz
 +0FYhTUFPsFaaqfmwYiD0JCkktvXcfVuligrEZ2t74LV4HC0nFLIeDTNvS64o8Hccqfi87v2P9u
 t3d/Ncweimh7I8L2EfKA/Rdli9BsYOs=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad84d3a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=saEJ52dEQi1JaZ5hwHYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021



On 10/17/2026 10:30 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:51:38AM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> I missed during previous review - you almost hit combo. If you added
> YAML or schema it would be the most redundant information ever. Well,
> pity, no combo.
> 
> A nit, subject: drop second/last, redundant "device tree binding documentation". The
> "dt-bindings" prefix is already stating these.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
> With subject fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

Thanks, I'll update the subject and send the next version.

