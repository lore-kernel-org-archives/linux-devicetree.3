Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31603947B6
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558736; cv=none; b=D4IM0lth+0WElLvTj8bNMaYOSwo1J92TP65tiB8FkWf2lgh7FuofONR1CUKXKXk1I/nCo5zZNUSN0h8SMcGAfZOlP5EsC4Ot4XJdOl8hqJS4iLSCPxYCz5zw8qImy9le5NNIiVrmeB9v7nn9wAHDumzDl/pB0U4I06kDyRWTsow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558736; c=relaxed/simple;
	bh=G9vKaY+yEYWG17l4tqx37r4ujYP9F/IMOkS4T8bzc8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c87hTzZl1V/WEjLEeiI5Hp2xw6YZEn1HFBgv/0pSQFddMfnNSwn5DXbQVSxOxif+MppG+Kmnqd0Zr3BohyvHyjft0b1T4VoHTDpMwoi9R1J7O+AUsW4TqBdEpNGTZXsZnW5GamcPSoTSA8/CDxa2Rau5lrfXxPRIC7n36d9ryXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSWstHUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QG9b9pbA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSWstHUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QG9b9pbA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376e24R3536962
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0QRW/CLDGG5aY4QVmFE9nt6fhBRgakmRPRc9ekvaIs=; b=BSWstHUHhuWj8pyU
	jkAoIHvk3RB9OI7mRHI4xwnEBYC3kRi78YctQoJZ2YQzVqKDq7hX0ICUppqCl48t
	O8qm8d0K4ImQQ4CFX0A1ZpfDQe886OOyceiN4/wXkx9ujlDbWj/dWo92sk8ydPbo
	M19Lh/a0H+C6BiCUrygWOeiZDB2e2f30ZbtEv56yReHPOLElaSL+VaV6zL7iXfgI
	8H6AECS6Amcgzv179tULYzWkJiOS0ys8iqo/2vfWO4+vP4lJawNbulvXEXqNwCFJ
	6MEuh6SR2SnHLekbpBw9ESVg5uUDJeXBlINUaSW4ugT95GZJncXb65fIsH98UKlV
	d/P06A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2bru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:45:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d56ae62e86so57830085a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558733; x=1776163533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0QRW/CLDGG5aY4QVmFE9nt6fhBRgakmRPRc9ekvaIs=;
        b=QG9b9pbAuifcOVyAenl2FOM493jONhwI5bCOAU++oBndUiut0sJ8B6Et/Su4FpSgPY
         s9ih+SNJy8+UQ+RdFN8zg5j4k2U8C0lSpwdJ/HU4qTzl+h4RVmYg2XJr44dTPM/dOL0c
         FfOfGgUExgaY76KpMDtTvkKAOSwDaafSvagdd/ZLgijZSf/pubOy6cxX5ZAb3eVImG97
         8YbLgBVGylc4lB5mvhQfPZsBZmGf+gG4Bt6kvWdrPhIJ81HvvuEZ8+FOxo/ftiSfoLLO
         6uPZ/9lKJMPtJLsYli648LUf/SFdd0htedwzJ66zVK3srP8/tB0tAsnSmYEJ3/KZ+s/Q
         PD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558733; x=1776163533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0QRW/CLDGG5aY4QVmFE9nt6fhBRgakmRPRc9ekvaIs=;
        b=hQSqv0P014gfYBj+NsWulG9zddgsP37A4OXud3XlAqk6C9IlFCgOHLBCfWx/Aflib3
         LDbId0EN0rIcKIc3LmERUcjBxY6a6wf/B26j9SEg1/xOsBRjF8jhtKeXFXYgGD8aL6d9
         eU9IodXCukgD2vEg5PPmIIa8HKfx+Ii0SJ0IQzW8tMHxCh/RzvE0NPW5fhTZbfGQl3OC
         OScpoorkyk5i4QENxhSKXNRwD98ZPtaS1YovOryqim1WPDIdNghCYkkw2BLN79+4f3kR
         d6N9U29Zaw9XmQWUiXzOro//qDyxUtUQ1HYXg+wEmzQIwVWNkjeLPbmJZpCVzbZFKi3m
         fccQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcYL+XeiTCaNHPYzQfkMHKl0stYcGR/tgAChiX7bBMCSsPCK+EUTUHM0v0okuxMT/V8VKUZ74xwt84@vger.kernel.org
X-Gm-Message-State: AOJu0Yz828GMPhkIlyXdMC4uwf1AJCk4rZqPKTGlOcPxvni1IrUf6KIO
	amqxlzxgNBILtsDF/1xObGTAAagUv0aHM8TzeFybqn6IRPAGmSw7evtZq5M/vE+m02nuCHaAxIk
	oC0m/snoFqsCEcFtUAzhXq45ISaFiQ2tN3OXUdICwMpaDMP+YZ6iOg79GzzXvYNYt
X-Gm-Gg: AeBDiev/oX2XQt4aLreH6hvk5c5/KAiVrNSHDf9j02OBgPhFa30h9bgW5NZHcTHWwL8
	wdpszWJ74HDavFT1upJYNUDliAL01BGn9Kko5IrdNcLWsjw/xV0WNn69G7dhfX/ZJROIxaArgNl
	HFzUftQVEMC82R135uzXEO/QIcHaE8Ag/hrN89+BpHGMaiiAtPJa9O0CNHUpDUzmV1l5WAmYCMx
	fOtjmy2oKIO4RlXphWmPT1BdzEl5maaY9X1tkV/sxrw8XOo1Rr9TTblyvVjeFxxcixZKbB6mQ1r
	3GMjKqdxeDbuK8lE2zy1A6DbjsK3F+lbU6ZkMu+41AEGSNzLveXLuq6C8M87GPazIcNXApMaI9l
	c+Ite65FFrz1O4TTBCHC/+ZC5NGUkB0XkJ+zVv2ErWCtQtMy6zPlgdKtcdV7n2zv86XnCeeKIi6
	jeRTw=
X-Received: by 2002:a05:622a:124d:b0:50d:a92e:fead with SMTP id d75a77b69052e-50da92f060bmr7603691cf.3.1775558732698;
        Tue, 07 Apr 2026 03:45:32 -0700 (PDT)
X-Received: by 2002:a05:622a:124d:b0:50d:a92e:fead with SMTP id d75a77b69052e-50da92f060bmr7603521cf.3.1775558732248;
        Tue, 07 Apr 2026 03:45:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b976dsm4286446a12.23.2026.04.07.03.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:45:30 -0700 (PDT)
Message-ID: <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:45:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ul4jT0f6LCgxaXPG7H8uahbKbEjuaonR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfXytjwcxSvdqby
 bKwFCs9icXja6HSJZgwXSf7wGEEdn76NWh4UnrssMEzkcYnRg8iD+rQlmXnx+e80tzEJJZvDXvC
 XQu+nqGIjc2cik3xNIznyFpUf6yRM50chtdiN4rvdpPPdWwZgyEUAByHnyX+iMXYGlqc4yiaA18
 tgKxp7vCXti7XoPW24Ag1BK9Sv3wQxvPIGP8Mgx6/a5Q+QPVN/V/jnSJukfLin24Qfr2LDz88HZ
 ZQQTTdU7uaRN8Wba5BfVyMiHG5M2QaVIVs0Eqj9bVVAA9eqZJ+DnBlH+ykAez5QCmeOBxC3nYHU
 FQvE2KLPEaYLJvxwslOyLJkWEDjRw2QB2SHRdXgE3fwraA+vKi6EaLZ0R9dvjre3s4jMmokD7mL
 8iV51V0vRgWgRBaDjeWQfa4Ux8yPwrBIr+mNZxxAyjp3QzSrx6AFsX39iFIYZk1+dVvijY3xB3q
 xzCn7/VhkrWWjczeOiQ==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4e04d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iZwa8WBptBBy-baP3AMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ul4jT0f6LCgxaXPG7H8uahbKbEjuaonR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099

On 4/6/26 6:30 PM, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver.
> 
> As bindings allow to specify 2 clocks, add iface clock now.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index dda4697a61b7..5e6b659e8719 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>  			compatible = "qcom,sc7280-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
>  			reg = <0x0 0x007c8000 0x0 0x18000>;
> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core", "iface";

nit: one a line would be preferred, please fix that up as you seemingly
need a v2 anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
