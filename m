Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6E3921DD
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678509; cv=none; b=J0zWBomJkDMDEZt3tw5eDuPtBXaGysxbMPbGgplHsHyNmISn2jiaT6Y8AI05C8LbKid/gh+HCPDAim542UucwaXXsObpNOjZNNFZStyzvnG40yjJEx+gLSo6UZ54AIY+pCduPoksZDLOyHSMAPtTLfuUr/Z9mPTFMdveW33m2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678509; c=relaxed/simple;
	bh=Y0VZfMMDGtnkJYhGf+U9Z5MtZVR+mZz8AJlSieCPJKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uo2/IDf+2uweaY8bKUPraW8548dBjuoB8Wan5knW/O8Nmoy3vInOvpl0In9UKaKuf73VldfegXvqQUd18j1tN7RHZSpQFJ+9agxC6QYJKYcduaP9uzGJPOAP4EFNwwEtbkTykgP1GZsKrDxGB9NAXKXa71+AQHukQw9YqWOZBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hj6QWsVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fro+B+lw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hj6QWsVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fro+B+lw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9mPkr3925588
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQ8ZoOouZ4BrjvsYaJON/pwnwqOqCBNwUORSK1JbGIo=; b=Hj6QWsVKeOBMGENc
	UMoFGwqmbTMHVPx7dLpoz91xhUY7REEm6sigWQIlrafCi289JxodOTD37fDR+jk6
	/GTDDFxCHeLe0jbPvkpVV+OxVFzPoJQh4jjfVkJHuFDBaRzdd9wsL0EVW65E0XyZ
	epa2tJVxHMcEW2+uQTI6aHBSQ1Glu/5VudwfQUHWCEgqV2Wp5yCPOgR9EsAgnzlb
	VoW3adil/qfuqYjaXjnRYglP+gB2TAIKZRTjTI/Av8lRwnDmCsVaP20vu4q0yfQD
	ADU99l5zmmxSom83ltF8BAs4ySWgBrirkJSmYwwhpXaS0XqQH4gybB7fQjbro5Rb
	+VR6pQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhu9r006-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:48:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e62562b6aso1035151cf.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678505; x=1777283305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQ8ZoOouZ4BrjvsYaJON/pwnwqOqCBNwUORSK1JbGIo=;
        b=Fro+B+lwlPtRqLoEYmwBJ9RjZxQ9xxpMEg2qFGn34dAc37oLLXkmUQvrl7gC55yiY2
         JCaCdkLXCQk2ad+BztW48iVN9CiBo+gN+HbBe1OmhTEmifr/o5oUjR3Bkj2k+fDigsjb
         JXrUxAZwlYRCfHqCaDtD2j8qIxZyMzo1mKabC+jFwezuk1RWdKs6d0XzVfpY+iIGvOH8
         Y/LOmj/Naxhp0L2hrw4JrGPO5ZIyJPjgvPMnzF2TlgTOT0kN6ykDeCyZK7vyhKFxqf7H
         SRk8HisblEHsC6cFU5AYQyWfbExi4YQMGjVX8MrAg+E7pRi3XuOq07YPpC662d5vjy2t
         miXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678505; x=1777283305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ8ZoOouZ4BrjvsYaJON/pwnwqOqCBNwUORSK1JbGIo=;
        b=otpWp/OIUno9wWoEoZIekX4Xfi85j/a0gVqDMEPXKzU4JisgbVokeBoFhnkxLoBzIE
         KqXWmFtM/ax9oJoag9KeOHqMm1zHGX6l0tujJsaNRv07MQhHeyFzExkrb5mAnvOezdJM
         ggbHmUXBYRq0Fxawtj3gSJXhvdYNhn2jx93lAHVbw/POtaaFSdTo1ThiZEfIKguOs2RP
         OOo0JiuKQhM747rYCJGe2DcbwU8mHsRfKEOm5YVO+CYqkFuCIFGcABeEXMoeMRoLZKXq
         VRzsWcFQUCqIMmPXJdDcD0TmZP3bFbGlhu/WVpZyS4R3DNQ7+ZB9iiaEZXfUiVbgm2Ye
         jnQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oH1GjJdt+WeNEosGQ9dF+jMtamnNKTY0ydzZHw5B+WLTlbnZHV8yPXq1rAWZ/FLMjGRt7PhK83OV8@vger.kernel.org
X-Gm-Message-State: AOJu0YydHeOMd6XWGnfOYYLMtWSKurgNZ4xwd4DRH3cP9jbV2oNHGR8K
	vROUUYlhLXDdmWzrDoi5cvVQXq1VbdfMXIRkaoMC5RcUTWOhD07pPYfYPxO1CP2crsIdoNs9KPk
	2ssx0weSdSn/O/Q5vcF0L4F4qwOuvxsP/XjSZVC30bOP7Nv5hc1lxKi0rR++k/ssj
X-Gm-Gg: AeBDietY7jrcqFaVEjAFQSnmxiazgUxbN2tY2yNzwHvXtVqYGjU3FzLKnnfAxw7rxvS
	TtNsLqZFNtGT0A9R1yTFAfFvoc9t07dpcFT8Qczb2q+ZGOUa7W4RhOLPY35YpTycSvnUmGpdWVq
	1NmqapZ5y581Upl+paonep9z1WO7dYyORh6I3XQdh6mlUyzdtmtuoS+daS923uObRohHEvkUu/a
	FcxmUt7IjIO6usHOrD7g/2x3jm0KJY5Y7Wv4dPo/Ts0P4joGVP1cWxjZzq6HcGigyYu2+Qit2vd
	7y0aHtMjUp0Kc0Rq6P9OuN/bcwJEfHAMVDNqqX4t8H37J9lc8UaNaoFXNcYXynFyVBp25ZyKFnu
	qhkfQb4eVIHgQZlPtWCZSvBY4ThN3dsuH4d6Xwatsu/TSFn/qUMfGosdXaLmdfFvjXwtXxtuBX9
	dy1ybLXimBXPsm5w==
X-Received: by 2002:a05:622a:2587:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-50ea1ab6a40mr9032081cf.4.1776678504872;
        Mon, 20 Apr 2026 02:48:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2587:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-50ea1ab6a40mr9031811cf.4.1776678504448;
        Mon, 20 Apr 2026 02:48:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e22asm2021642a12.9.2026.04.20.02.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:48:22 -0700 (PDT)
Message-ID: <221187cb-e28f-4cd2-bc7d-0f738a01770e@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:48:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: talos: Add QSPI support
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NCBTYWx0ZWRfX9DIHRrEcuNL+
 3e59Qt5H1VpecCXFBWjMqImaQvoE0zVBX2VG52nAepfoWI8LOQ34zz91adjTi7L+Q/Wk2e3029S
 6UE1c9C31AT7j1dvfff1bYuLA6qgirshVZxQI5wysKn40p3haNJIclvVo8pjcnToeWe3vEENBhR
 LYAwuqmyM1pwFTQL8MsUhLOSXqGrDAPyde/ihXyCph0L8vylvbh1xhobf6i8AKCvL0AoIk1ab15
 eBrXi94BROVS6uuLmEdH/ksD5+PKn1LVcYMc2vGSznf6g/ygcd1vLM7cNczt6yKlVNhOZGtKIfD
 9m/GnRu0nfZLAKwBQe9z1k/HlPSAGvtOxHMIzmhK2gnPAksrGr7sCkzOYWa6qLGWTlAPAyBIvAg
 yG3oXdi8XlLixYNlnpeIy6dGaruAKYBQiW54Hpce4oSZmp4SPlN8MlvIyR3G0TfuO4IgnMCOzD/
 SjtD7NDhqjQkQN1eDXw==
X-Authority-Analysis: v=2.4 cv=IIoyzAvG c=1 sm=1 tr=0 ts=69e5f669 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v9HvSh1xhsShxInwDaAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: FEAWiNCIlN0DQ56CEmGgjXYglnMV_6zL
X-Proofpoint-ORIG-GUID: FEAWiNCIlN0DQ56CEmGgjXYglnMV_6zL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200094

On 4/20/26 8:12 AM, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
