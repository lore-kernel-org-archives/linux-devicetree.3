Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A03D9678
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691802; cv=none; b=uFSRvmJYjRAo3P/emViq7Op2mL3Le9q2HpapkM4kmh3oMr2b94ds/XYZ2rTU3G4+ShozoYZ4C5pZZqp0pp/UlCGGqu21l5vHBhh0uwsMGppyhZ4gw3qCftPqsfU3+cbV/QnMDL7opeVVz6qq/XiqOtG4p3k7G3ZhO1V8h5b5ssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691802; c=relaxed/simple;
	bh=L8FYvNeysQtoeBE5eKmPP/VdM3VJ7g98IcQFHXcA3iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/anspygKWzb+ZrvlNJknbsb/KoKjXNqKUXHktXoMtvGXT+bub5xBwgd9qqd43E1+wM0aqtswqexIA2DuGCdtFDlMPs7TgKM2A5Hme0O48yg8QEP5na2waGE75996BOx1taZJaDkTUDV62cetm4fi3F/Qf8KwcL4Lph1Q/WMO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yf2ZnN6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2Ocn41t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yf2ZnN6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2Ocn41t"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UDmF1734952
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEPSj5KhHSGylo/KiUhOCUsfFxzMDAF8WUF7+LcJ9lI=; b=Yf2ZnN6gbnr4jVw/
	dPJSpYSilTQRh1TRkBHOURxQNdh3if0gHsDkgp33gNfDzu7x1RUMyaSsMWRLnxTQ
	dWD+5yRO/874ylGHzErguyb6iPl6Js8ZEfDeAocswzIGrZ5iE/ioO0+/lV2cDaiU
	a3LzDVjYB9fsQq5YtRzhUHjSegWuyqnD9JiKia3XNmCERgF/on8OxTbIpFpgJbFN
	nlB61k5aDEbDDoHwrovbMxQOWPDu2zCOw/K1m2yTu7zDEPss63VPLiKf5Pi5apak
	dsrZR3+iLZAzSIksbPZjwA3b8eDwSyMTAtOEImtz/UmN2ybvZBnn1cZVIXxyv6/1
	sG2JGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjn84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:23:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915756c1407so39611085a.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691793; x=1782296593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEPSj5KhHSGylo/KiUhOCUsfFxzMDAF8WUF7+LcJ9lI=;
        b=f2Ocn41tq/4lSQ4zCa4H7lisF/iBSaa14MqWZHxjj3w4tPcPEKHTKt3V3i5//dinSi
         9MhDs7syE1096C3WQpOSmQfeyQ5SVHULbYtZI+qL72jPVcAqhwVGmNreT5Ncrr0N1NBf
         CtCIuG+HA9B7jiBC6qH074R45z/RX4QZLKjMKdBmTZa65cyaOTtZ7KJsDXpX+qiuFszB
         sulwMV/n+duVw0iMZncRW1SoQDdHNwWdcYTBvDeSdaoUe8pvI9uZ+9E9X8MMdKJuyBDb
         8O3Aqwov/kx/bdG/kUMulaR1T/HUj/yyQUcMgrhe/abkgyeUtXIwtxh3JnR+/Q+BITPd
         9CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691793; x=1782296593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEPSj5KhHSGylo/KiUhOCUsfFxzMDAF8WUF7+LcJ9lI=;
        b=GqRx6qEMqgKmFVVcie0O9YdDwv1qL946JexxlgfggjYq28NMF1oh8AZI70URfVizeZ
         UJSBggKaIeafHcotwUzSWakXYSMDVrLVh0Eb5RDv2db+kbn1dYXSjjAZSN+hoNFPEdsM
         ImNyCrPvpsxY7Ucelj5vyYod4zhXm4KczRYB5m4Gd6m7JiSs5KSoJj6l293dy/lOnYnn
         FhwicSxZi4MwLApSjdF6rKjuL9gHRWERR36MhrGz6vTAx6ghCXs7Ve9TuD8rO854W0wb
         Rm6MI/IjeZFCb5CmDwZKNoOs590Dhp3lphiakkwiLhtsANrPOvvufEBiaMNtfbzg3BfM
         3w/g==
X-Forwarded-Encrypted: i=1; AFNElJ8HQTnfco/wIg1V4DCBmXW0sWBitvo1WD+Qh7immS5fNGv5wQUyF5IeoBfTol9Hg+xNVxKTXCFqUZFh@vger.kernel.org
X-Gm-Message-State: AOJu0YyqbfvmBUxItljrkRf70pE+SdYD8katwG3c3lYV1Dg4c7f+MS0x
	JZWhTG+WTIZsO0TLMG+ETj32nbcuvMO82zmgabqyT8+THH/uYdOjZ0W+69sjcGu1dlTeWw/ia6L
	7JYn7SCNUfjvNpYl50I/SxslyibvbViY1G1MKuKGyl1W47bCNZNXgGY4N0/aj1j9z
X-Gm-Gg: Acq92OF5cTOBHYjLIvu4BRmfVwmvEFud3/Yhi3tfzrJv7TQSlQkXTcZDcC5i8mc3Tkn
	xtXBI702FAMQ7OM2DSKkXk+6mNEWHdoZFqKu3YKsIySUp8A0Dmvah6IupV9KH24dCj+Qj6mY/WV
	cxBW/TfdtghSDm+4+fujbmlYhC17DYqLZvUE+OXdE7yXn9MoBgUBltulD8MamzOLTlFYKkDnGOg
	FiyD+jXcanuAFIoPJuzlhV81UKs6RBqSj3PUazpWICw0lnZZ3VwAdeKg5ef+bQAeggjR16jmgzu
	RB6uoTaM4wLgR9r4r3sA9pdJnT9ip6hxoFzx5vf/Q84xy/ynkxQfM8vDSNhORJ5avF3rjRRBSfX
	BHGg1+KSBDIV+fy4wAI8X0YgOqqE/9BardOU=
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr341291085a.6.1781691793407;
        Wed, 17 Jun 2026 03:23:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr341288385a.6.1781691792980;
        Wed, 17 Jun 2026 03:23:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693ab54e6e5sm5512062a12.1.2026.06.17.03.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:23:12 -0700 (PDT)
Message-ID: <c8219694-bfe2-4354-9c07-622596964103@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:23:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Hawi SoC and its
 reference boards
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OCBTYWx0ZWRfX71ec9kpVX1w9
 l61LkfaZTvYDZxVSbzAFoNS/Mxy6iM+kUdiPDrNvIaJCRMJ6gcS5SyHmOMjGVcr1v1BwLiY+TPX
 pna7DNMD1v+kUG9qWWop5rtSaACoDj8=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a327592 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bxiTcfX1wFVtC9dgpccA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TgIL6hgPMa9UJR2lgOx5zmkFWTklh8lC
X-Proofpoint-ORIG-GUID: TgIL6hgPMa9UJR2lgOx5zmkFWTklh8lC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OCBTYWx0ZWRfX+EgM7yegLaJ4
 YirKDE5VTc8smpFoSJovFoHcxOErSaWIvdZualag0RXDFW8mrvLAYQjvIJFAZX8rue3nt+nX0DV
 JhA+7GCszrrIvrUBpLdtiV9PHBNbvhc3ToKrsqAwHUioB0vTqsYAdJ0awcmZHotUp82U7tdIJZG
 SrJc1ek7jFV5c+G/NeI8NcOlF71Fwu+XyLCu6UjL1koYkMCf96r+TuB5pJ+FL6kBEPL0I7jfSqV
 uoWT2MJ3i5Od4B8tqSrDL6Ju9RVJoTeXF/LpNJQtyiMyKXAFwnDsW5q2zITiN3E7J9fdUBpm5+f
 727u+K4nJYXrp0j0Hvx8+D0WpPqEvU0ZNSrlMCxEAXNFAwKKD8vg4VJiuq1MTbW2lCoqpSwo5jj
 o6ZoBz4+0FqTXfVnudGxpkCQT1ae3R3SyMXihu3h7vlcdQ1DSK39u8EQMF1NfOvkxFz8KI5LsNB
 Q/A4QCCscXlYscRorug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170098

On 6/17/26 10:01 AM, Mukesh Ojha wrote:
> Document the Qualcomm Hawi SoC binding and the boards which use it.

'Add the binding' or 'document the SoC/board', specifically not
'document the binding' 
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 50cc18a6ec5e..bf6bdded81d6 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -371,6 +371,11 @@ properties:
>                - qcom,ipq9650-rdp488
>            - const: qcom,ipq9650
>  
> +      - items:
> +          - enum:
> +              - qcom,hawi-mtp
> +          - const: qcom,hawi

'h'awi should go before 'i'pq

Konrad
