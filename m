Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808058;
	b=Hf07GJksrMAIr/YJwbeHI3IElgr6Rxqehct6cbQvaQxw1rVscBF74in2SHCKgC4Yaj0l
	 M7UWh3FR4kucKd7EKvmiEpW8xasn1VlLGcgSNEDQx6uD6o/qkDlHKCphFgN9wB8bIJxMt
	 1KHIGq7SrvBrSvMVwZVNvvgyW47pWMBFAvl/la1GJXY0Vf8FG9eWlswvxVTWKfZcLAlua
	 TEtHN+h9V2TNBEPFEmJqcEawL9oWeiyWb6Sv1xe9a8I+UaszrhKJETnoLiI3uONeXGIhN
	 kc3Uz5djjNE1A/IBr+1v8l0vB7guPkOPi5WYdp+27hU74jdlamItL5AKb4EBGvwt+HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
	b=Up/QuoY4N4LIrC6fjCzKbg7RflfJkmiYmHZkFBCN5bRj38KRGaxzDJxkbVFKALENdmGl
	 raLq6kABeEouMwl0VxEQCbTafa1Jlja7NeuuKVO3REUYaOD3V7pQORPYOJ/Ngjh40HlUl
	 lTQhTmQIajhzcNAOeF2bSnvC1SVa8Bp15exCzmOXAyfHffjMid7COdr7dETaBtNF5wZHL
	 sc6UWcPnYRazDLVgHOSGDdoedGwlwgET80a2XkT/OkD3QGwicseI4lBS48nLzUSivp3Da
	 lRhb/f6YZCaici62WbHEGlZYldB7gsnbNHLzlrBWUj8G2bkeRIKn3dGsu/6FxDdGJhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z66ZL+Nq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ3iSrt5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15FB606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15FB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z66ZL+Nq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ3iSrt5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FisKP2210737
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 16:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=; b=Z66ZL+Nq33OF21Nq
	hNQa6hnYbWiydHBV8apu90US4rEkmWHkMro9EHjfuIOLaXSa1VneqduSmkkVtnrj
	ZAzkcaF/pmZL0DQ94206yApfGmt6WD/9x0oZww8GNZ8PVnM8jSIbnC4MNtSGtb/S
	ikh4DTZ9lNWbSbxZ7tPm/0lDQakQakb3nOtTSiPzl4sSJcp55y6dFPXxZnAPUxgq
	+GRhCRe5SCq2PtBQsztmlJDozcmlrKRxWBL5DXuH8OOhBk2yiNm1Rn7Bho/fbSgK
	k5Ig9wpWqssmRqzpsLZtWFxIYp2W7jxiA0RvuHJopnkBYgjR/4R1BBrzengOLmjK
	58Wbkw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdrcvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:00:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1082492eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808056; x=1794412856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
        b=FQ3iSrt5l+Gly3d/s9mW+b8J/QfiDHs1jFqxOmZkrtWARbbKQ1T0Xz7T+uycQacBty
         aIrjXK4cBHHA9BWZeP4gNlWDu75x3tdQpOwlwIGRpsJyYgzQHdKBCJJ07LezdEBDvrpj
         3g/r+5/NiUc9S/Ir2Y3Gq4E7LACvBcU1vXkanjL9KKLJGMnPfT4uap4XR3HBAGSax4MU
         RPDgLGfv++tYx6WYn7+Zx7G2KTqaFWsoEiNh6qgRuZavTGx/5DAMZGfC/iZliSVwme/O
         7hEXx5nsz+IJib5oxjKKjwwnnCzSF3RtGQbxom7m57DoEozNMtE+Ks3xoRt6bFJmAtWw
         E2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808056; x=1794412856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
        b=bwDJ69IUgRzyHrafSv/MC1nAQO7E3G/vhWIaXKxdvbeHgJefnyYveZH9kvKw9GnTM6
         ZjN37ajoyKGHj/G4RiAcIJDzuu7+oTikHX1QzTZZu0XWuRgZcAlBA28bcFYWGYumeBCY
         2l61ddkQN6hatnQhxMLcIkr0vkj8EsfX+PovES5IzO8ua0CLSL+RW3Ipif6+DO6bHloh
         8ZkKVW4B1ClrjF/8iwL4Ieco5OoRr7wtNCrhsbO7f0aipL/qoEJxS3Z8UhcoCGjHMdjP
         zByLAnROb9TwDZlpAJf1A0+2+b+AS2dc2Pgf3Q1ld6FtPL/s+Pywu6zaFz0AjYzONG2u
         7G1A==
X-Forwarded-Encrypted: i=1; AKwUvBwO4DHJi28bFPz4MCgN2yxaPy6fkIQCyp3E67NwYuHZR2rAvQvFvHD9KlsPRNbZrnqlJ3oMiei8wXUy@vger.kernel.org
X-Gm-Message-State: APuU4Z/TwpkYZYSO7RBTEqQAM20OnXpH5B4uJXCazBspLdtMULVueXC7
	x7P3Oo1tnxS+JvDVpegKeLs1P19HVMusLW9ZwI/BkHHAswbOTfUkUzMS9exYrVux0HfioUggux+
	9gBBbR6QHpND3v82hGl3FF6Nsi2OiLDkeIcZkRYjB8d4STRaCzbc/OhXEaFU35n90
X-Gm-Gg: AYBFou3+ZPAtTLrrdOl+/DAKnMs1aQDkL8MZNzVuty+x0dDFnwsoeS8dubm6BQZ9owD
	0gPD+YFzRdlnVtWCTPp7HPjCIVToFSO780j7QZ97e6ablJTXB1oGeQC48c39viAUtX4s7U4JIPR
	jaLbA+DT8tnbO26Qka2E6mEEXR3pduSK4FPWZZihO3moYugO/NU+VXqDkqrUXBKURYeDWoXjSMQ
	5QXA2euuCyhAKy6SrEVKqwQODayAW1XVB/OO/rbXi49uAjY4uY35JTID24WqyM0a3r6KcjcL+tS
	FzPVmUIpoowBUpBReSo0ao3dq+XPN11wBBOCicsNlT0WI7R40V0Wb2yTo/w+5TqKRzufhJpgNdC
	YOtFR5fdmhqixF91Rr129DDSKZ6+wfl6cE9HU8O3dA7Q5n3c82cPNCgWRya3Rnf9ofGoqEmYvHi
	Q=
X-Received: by 2002:a05:701b:4348:b0:143:6525:f9f6 with SMTP id a92af1059eb24-1ac5c369c74mr25241342c88.13.1793808056026;
        Wed, 04 Nov 2026 08:00:56 -0800 (PST)
X-Received: by 2002:a05:701b:4348:b0:143:6525:f9f6 with SMTP id a92af1059eb24-1ac5c369c74mr25241268c88.13.1793808055141;
        Wed, 04 Nov 2026 08:00:55 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm10164081c88.22.2026.11.04.08.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:00:54 -0800 (PST)
Message-ID: <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:30:46 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261104-real-nebulous-ostrich-017e92@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX5LaSiVYrtMj6
 BeYO0YysbWceirVmGsm3Xf8436qhezB0dfobwRlUs1t8spQsABU6kSc5WzWZyi2w24wmdwh5W5R
 wBxaBS8p/tnXw2beL4X8YbprTQkhLTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfXxXpgTe6RPlP1
 RMEWGaGc8w3GDg5P62kOgA3sxz42FkXuz3WhRh+XTSByPqjYnwKQZ6vxEwxgtU3yO/91mhtft4/
 lOpFu8yg/t23450UEnjBKUHVqzzyYqwtggWNgnSjTWSVc5+9owJP5IyoXg255SEpFuHLbfXwyq/
 TkQwZJhN7GRJhNh9Cs3hGUrwN4mfYgpDAEfLANZV8uPGc6I+wesiuajTuYMxUpu/NoaLqt32RD5
 n6/65e6GtXeIHQWs2QJyuscy0Un/Qn14F3Xiv7mRs20D3P0pW4uHxXc6s2W0W1kWu0FW53rz/4x
 2z7KqJ4O6zfVU5xegcZWKV6BqtKfcxiyhykcGFPo0oLvhDURezyONGMZ33DCXXexElTULErvcuC
 7nlXoS8eb4sE2LcEooTs1ld8wH9waOkgpWd03LHX2lldzLLk5GIMahdVeuCdnUE3r+VbuHBNNSH
 2anHFU3PtdXU+PcmLRg==
X-Proofpoint-ORIG-GUID: cELjEaZ19Onjzg83zzJvxTkHAIPeCmsc
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb56b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bxh7C7Fz_n5UA06wMvIA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: cELjEaZ19Onjzg83zzJvxTkHAIPeCmsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040063



On 04-11-2026 19:22, Krzysztof Kozlowski wrote:
>> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
>> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
>> where entry 3 carried CSIPHY id 4.
> You also remove port 2 without explanation.
> 
> 
>> Describe the hardware connection directly by allowing ports 0, 1 and 4,
>> and using port@4 for CSIPHY4.
> All this is confusing, why do you introduce gaps? What is the reason?
> Your datasheet naming does not matter.

Glymur CAMSS has populated inputs for CSIPHY0, CSIPHY1 and CSIPHY4, so I
used a sparse pattern for those ports only.

That is confusing for the schema. I will allow the continuous range
port@0 through port@4 and keep the example limited to the populated
Glymur ports.

-- 
Regards,
Nihal Kumar Gupta

