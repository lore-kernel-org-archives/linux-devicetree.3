Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010DA3BD24A
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464710; cv=none; b=FNWvYm++ZNnu40n8jWqX26WiMA/piRalFIdJGxEpGKZg/n5pZ58c8jllQVa33TiMj0qq3D07Fc3hhC1Kevt/spMWlouCRtkRJa6XDdS2V1BIEPxlyShubdSF/DKrtL2i3Q7Ntp+HwXpLnfPGu0IGktzcmRn+6EKfvpjcGP+YlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464710; c=relaxed/simple;
	bh=cHYqSNif0RYDXMYpUZy4sKqIv2xpJlOO4HEM52ZVTJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3U0qpxSCGvqlbziRSHMSHBwvKuIgz/NFs8N0+uUovaEC1m/t6P/ohbatJa81awdINwS/eJ7S/jOd8nx0lsa+VMkUzq9snllE18dIaQk/hm921CtShD98naPYmypsTAyL9gYaZrBHuADltkZnMwpb03j6UqZoZgp10+valIduSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pS1sroGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fp07ETUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pS1sroGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fp07ETUr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX5bE766960
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cHYqSNif0RYDXMYpUZy4sKqIv2xpJlOO4HEM52ZVTJs=; b=pS1sroGRAGeP5HbR
	i7kfywaCoDaR2Ske/SRun7p4f1bKQ+1fqjNHIsYoW34cY9dRR1Swu1siKIgIEH+b
	OB6gBQHCA+E68EM3O0GFv260qUPdQmtD0r7FNfEbaITaqoKujLovxiFhSFENqwTa
	WY92sG13S48n5LdJsBkpYl7GfNHQVB/J9onfWco/Am88LHbSNH8PonhgylsH1enY
	Rh0xLIYUGejhqEV+D/TppmrLT35VVA8Q1bCgbCcW+qPfFqDXWJBLLmdbjLVTu9Qv
	wMjZl0fy8JI400CBzu4w0WycTS48MHLFOw2p3Yyl6zMUWr3nZDDs+DMj6pvJg4sp
	stnEDQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc1epj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:11:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487eb67173so50554b3a.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786464707; x=1787069507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHYqSNif0RYDXMYpUZy4sKqIv2xpJlOO4HEM52ZVTJs=;
        b=Fp07ETUrIigNxmgnAt5cT4hkPs24lR4XyFh5l238R42VUZ8G23vXyGeU3e+nIW+DMg
         iP3/JsP+eUaBIr4aKyqcNsi0gSwpUeytTeHp+H3JhPXbGUPMF/xSD1aYacDzPsCoeIyW
         HkPoKmJehosx+mrZM97UgPj17VzfM+16gI/w69JfC7Tfy4TVzDtavRcZ0HdVXZlmSQsn
         wTOKCFwPj5ZkfjblHrQlNImj3gEBII+MoTegBmQTc+AYsiGmIzfGLbxsFZYZex0wp0XI
         KJ/vcNEXlP4ymfzCZv40sKAzcmxgS6O+cKOc9iwb+YEcYBa5WLXBVOhX2U2Nwx3tVh+P
         Usaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464707; x=1787069507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHYqSNif0RYDXMYpUZy4sKqIv2xpJlOO4HEM52ZVTJs=;
        b=TC9aX5kPBGPONfHfYfA5b8/KNgzfi6LtyvIKve5Mdc/Th9q4FSyqgbFkq4zxQhqpTT
         9lmEkrO7DeZGNgR9FlTnqL5h7Tz8M3qZA34I0oR6by5WVebG1xW4JNFHSTC8Jv+FLihL
         p9cGa6WsYza+kbzmpa6OWPyu9M9WvUdqEzjyhwne2M9CEnRvfP4MehYknQ2Hn5g5puMI
         VAnpYoecWv+pYqQ07mWpOY3874ew4qD9S2ZsQ+xikIizv5H5wJu8GkutTnpQS1nJBKFO
         DSpgL33CPOH160vvQUh5M42duSvJCy4Kh+WO6uZbvGDsgU5J9IjfErRDo9FdbHns3F6h
         sMwg==
X-Forwarded-Encrypted: i=1; AHgh+RpUK5dBGNDPx2EmpcIRDiYw+XATgoL1ZSniXfdL0HqjzWITK1dEAqgQSwsUhQbP/l1xSZzMdjSMDt2q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+NRuGQHoFZpE4r8V97lGXop3r1XkEqZZA8JhRDkJz2tv2mBHb
	iTfkR1bL29oGwoAP1dTqHzbOlWF517nsUvPvlUrmRopDMKGK8jLYKroluFijlNZXOCfRBG3ItkU
	t4AYrdB21C6DZ3cvyfChElJBbSQWlSZLkNPEGxmBykiHstSKcdNSs7d61NkmycMSa
X-Gm-Gg: AR+sD10XGwxxN9+fmEjGMLG9caopdpRNYfrt1wmGAptT1/DPmEExeSux967D9SyZktx
	PljhF4tZkDlbjb7RCp24Wz2qaYqYiGcQAfPCIHBRkjxbzb8DKiwUFm0a1QR0OTF6V50fxoiX9+x
	FwC8h2u5uXmA+i/tpacba0Mw7d3O6jXlVoCoBruGJmYKNistYAnXguai3Q8x8b+EcnD+hvpHHxy
	lb5n4F0RTN9LUcKtJgS+XQgkpWEYH9Q5sdnSOyssGcCkcDQf6Q9r5hMZIOdaoOV/xcAipS08YEa
	tx0bwJ4n6TlkUl6FVJ3bKoJE7b3ofSax9NPDw0hHUMP9imZaHnY665ynZwQgOJLKJDsnMImfmr2
	hKDnCnI2HO20zMcjNtkLB+XWEotrPEaRU47Hk+9SOAwJ7
X-Received: by 2002:a05:6a00:6087:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84faf42b207mr2039699b3a.1.1786464706797;
        Tue, 11 Aug 2026 09:11:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:6087:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84faf42b207mr2039582b3a.1.1786464706266;
        Tue, 11 Aug 2026 09:11:46 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.84.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1b73aa6sm45904b3a.0.2026.08.11.09.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 09:11:45 -0700 (PDT)
Message-ID: <52332595-04e8-45f0-a4b0-5ca13dbe3270@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:41:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
 <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
 <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzNSBTYWx0ZWRfX1UM5CHpt2emb
 E7o52FnVa6crktFOpanJOSqHKSiMGmuHlC7eQUVjbX1R5Nm9fc5h/Ke2qifyFCoywEC2euEMrNM
 uPS1ZaYZLZa6ctKjqtrgszuuGVV4Ktc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzNSBTYWx0ZWRfXxGAwcuJQHzPE
 BSBFdNTiU/7x6OuBicWlmYa2WyAlizn+in4dmli5StFeu1iF/sTf5rYvMiehjv6t1ardZWzEDP4
 LaIFkUwJfpGKW7afPWmm0U4CR5wSvY7SCrogtq3+2QVrfGkyfVLlLCbT1O+BcmKKrKk8rPkM0LL
 XJjyaHRFFrJd8KHrsTgIAMi0/Nu6Uk/TG299GkrLz4/28ugzC4SRVy/uQxo64/KJXy5vIIQTzzJ
 xdDgqCihSBD5Przb4QmG8A2e7ki8O7lN6KR0gnpQaZ76HYPKiajaY2DY4nqUBHDoQLD4BjxT+ow
 JQ6jMBhNYexl8qOuVrIUY1XH0ZQAmnt/M1yZJpf1ZsqT2ZCYvWvrwqm5s2378M1jun7bYgTFjks
 ePh94CdqhhdLe77NIN4XT+7JbU2pSG0CS4OwOWUDiQFYOSZ1n1MI+58WG+gIFVzWNM6SRoRv8Pk
 zwYiDUaoTiLL0RvLsUg==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b49c3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=0/lRlipvHLU+ZVN6ZkkSUA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=y_0uHl98WbWs3jSTaL0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 8QOSlnbNQRc3vwnsb4X9Me9N-MajGbue
X-Proofpoint-GUID: 8QOSlnbNQRc3vwnsb4X9Me9N-MajGbue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110135


On 8/11/2026 8:54 PM, Jie Luo wrote:
>
> On 8/11/2026 10:00 PM, Kathiravan Thirumoorthy wrote:
>> On 8/11/2026 7:06 PM, Luo Jie wrote:
>>> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
>>> TLMM pinctrl; without this the pins are left in their default state and
>>> the bus does not function on boards that enable it.
>> Should we move the TLMM definitions to the board DTS file rather than
>> keeping it in the SoC DTSI?
> The MDC/MDIO pin-group definition is SoC-specific. On IPQ5018, only
> these two TLMM pins support the MDIO interface—one for MDC and one for
> MDIO—with no alternative pin assignments available. Therefore, the
> definition can remain in the IPQ5018 pinctrl/SoC DTSI for reuse.

Thanks, As discussed, please send this change along with its consumer.

