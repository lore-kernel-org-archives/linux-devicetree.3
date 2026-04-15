Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5A133F378
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246575; cv=none; b=ZYEU/pX4IoJsK0Xz8R/1XlbF5wy+wxlD7tjz0BHH2KISgxmEL3PepeFQ3edlZN4A2t55p/+Y2FR9eQD0pHRM1WQsHSvV/rHkGaT8nma7e4juwptxuCxJkSQ2LTSuWpCqz7MUZfy+20BWpDRlW/t8ifWTpLj7fKeHb4j2GqDG6hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246575; c=relaxed/simple;
	bh=cxYpEZvQMHrSUdqMLabhc/dkvmhcRT0qC3vW9qGxMb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ej8g+5BAndVAfteq9L5t/wgoamz32fnNBehwiihSnXWKMKUEhWufzl7q2wwP8AtF9jz7a86lMx+wK8Pnx1fqlmPjndvoDK6V2/YPowDytU4Y06jzEq0erhWQ1G3mMY2/oDniJq8ugxviiki28BRydv4nFVbz+pYdyYXTgdu2rF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSKCgCYt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7HOOsUN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSKCgCYt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7HOOsUN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9SJNZ731460
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGKAhaWbgzww5lhS1vPXCnXjw4jpJVAA+m/j2lXOxow=; b=DSKCgCYtV6swTrO7
	BOS8qTKDMkjskI6iwsokkCWBuPm7oSS+g4u8AwzBl4H0cIUGW94tFo8rG98/SqrX
	hNq9Lwo95bdshxZXqGIXJm7IC1wmtdGFfjgStRP3zZdocOn/qGVnBUDHnZXGxIv/
	nFX4FQpvcfNE5PJng86B4jwuV6M/qLsPyj+AP6rJTcq+fZUw2ANsTTPMzFpjujhF
	Tg82lAf9yvpPcoDrT6DP3hhye5WU6XM1m6r7tlKNfDFv5fhUy//GLXDNloCg80NA
	NCTBYx9tnhpoD0XMGWBCWNZzyQ4/gcJSRzC4zh+8yaDOv6DDu2PL0MbzwiDpzpl6
	cK4FDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruub68s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:49:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso58360871cf.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246572; x=1776851372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGKAhaWbgzww5lhS1vPXCnXjw4jpJVAA+m/j2lXOxow=;
        b=e7HOOsUNXTXJ/4IvFM6ovxxETcZ/frFNwRwHeu1mFRXBEW97+PhSgwOV/MTBD+0X29
         T7o8ZGZKsXpfaP3dEBz4qwJO1OMp0Ht23rP3Nd6n2La0K5XG4GNNxyEAWzgC3TxE/7xS
         P9z+BoU0spQ6Nu4Yror8Y6RNTHglNdy7I1+Sry0aMUpoM+xpEArMVFQ4Y2BPqXngB5el
         b8V7aCnkviszOa5NhayvKAdTrMUf86aQZRw/71hdZgLK/Z7XGOQH2yzyI4ZkbZ8kUh7v
         ej1OpqJg29AVx7cVAdbBuAUVQRONduqI3jZHcmhWPqLvZMBLrBEIDFtdnJ2bhpso/8h+
         ukoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246572; x=1776851372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGKAhaWbgzww5lhS1vPXCnXjw4jpJVAA+m/j2lXOxow=;
        b=eZJA2GpxSb0kwJOyy7PEpL+j/9w8O4b/p2v+CaTsUuxeQdeasR7TFBAlyT8cK6E9Du
         yi/SS94Zt0oA9z4iVHebo5f+k6kMBJQbadriVxQkoXCwbL1Df4Q08cNGfdAcplghcKHO
         hUbGaNd4zgp3ZFV6OHAaZoA/zF6ZVAZw3SbPwyjFIdxfIyye2f1n/Qb2rJx8UXB8gESm
         7tc3HDsxn35ocCjSfYOCjU0W6xoWvvZHgSoTLE6CugIBT7uZqpUfMxdAE9D8egeaG3R2
         9gb+smbuIa9+T8A64wdYKbjXefe7cVCoVucBIIkqw6680OgWyR6uijksezmnVwXGRVF9
         Srfw==
X-Forwarded-Encrypted: i=1; AFNElJ/K5c9nRBgsoUYy6kDMh30qaJXg8mWjVcN9HYs5pHP6sADteauPlG+/LsLmxNXsuqo3jWgYIMIXR6co@vger.kernel.org
X-Gm-Message-State: AOJu0YzBam7D6b40cnXJImW7B1UET1FqsWWlH4QVrfC19Ny3amgzNZE9
	mJUkEk/Yr90SXU2Ri/42qKEACoofwqkG0apYid8EtCIggPNhe27ecJ40R0EcLbu6pdJopM6TzLw
	o8VAJfi4tHKg1nO0FUXOmy1tMthPM0q9dE3S8cE9J14PpKvw8vhdkMOv/yng1U5yH
X-Gm-Gg: AeBDies4DtxVGaja4Zs8xMCMc7rZiiqYpZ1KhvDSo+ONoseE693Q+dzOiLHopkpGMZ4
	Y2kkoUtvcADvzV8QYbDGaaBWnIoLu7AQLlvXelF3oPRb0H8S9bwnAIjgaB9HsPdkhFHF0ZP2ebJ
	n5Nt7fwQu1GuPVgOWMGjpKqA02Xm5+KQDD8MsUipdFFXljv/4wYS6EpKoKXeqgIDrwmynbetYSO
	dMwHYHYCuFXJelh6zl6MwSdzEsEZwYJXbiIq4mSWU0HrjXalLIdvjINBtD+kA9MoRoTH4SxYZ2x
	3kF4YWGyNgEE+UDA94nBnqTqHjHK2NzeulWq39ynV52mcAyyEx+1EXNVudd+kc1BeaB6TDCBBVq
	3YmiIl6zXfo/VmsshFSxEfxAjNhfstdNy1OWIPBmG/N2v4+YA1M8DmPBaMQQdaQtmof1D5fNEVw
	7qTvrF/fD9DzfdKw==
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr15482561cf.4.1776246572403;
        Wed, 15 Apr 2026 02:49:32 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr15482401cf.4.1776246572016;
        Wed, 15 Apr 2026 02:49:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1782aecf1sm38771566b.60.2026.04.15.02.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:49:31 -0700 (PDT)
Message-ID: <d4c7d384-316b-4d32-9161-04757ede9ffe@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:49:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
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
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-6-bcca40de4b5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-6-bcca40de4b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -mAqK5i2PYQamvV9ihXhbzGRCuzShyq4
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df5f2d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ctcgHeANrx8D0WuUPGkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OSBTYWx0ZWRfXwIdIf1XTFJyO
 RQUJ8dj4tZHRpt6/RYJYRZH8v9AAjcvXhYTsHI4cpO/BxZSViCtYIcZkvj8ig7u+Hmupt/zlVpS
 QfkveZq0rUKtncxprYwK9zLGR2mj3RjwpT//yqVNzoKusnLDQCUv51CM5J1ztd23WSS49FDIItE
 ZJ2pHY5XyHFLnycOv/zGpWqxWQc/wSKFrnR2A1DpDvS2Tecl1QMWa9x2ZpRkM4U8ixBWiOJc0g2
 BptAJsTVF8auurqhyC2ww+eNw0wEwzc8Njzg7gimIbpDKBEfoWL0jYLvHjzgrFsxk6Vh0Qpqw3H
 7fxd7a2o9OeVAZcQllxEiOziHoFNCoisEGal/DwECx5Y11aZtdoYcpp9QSEZ+gl7xCIolOYymec
 1kgCX9Homs1QkYgY5d0ZwREX+QTxmSf/PTOoxoREkFaVI+TW1cj9LQOqXsgmS75LKtYIeuEPpeY
 t9MbwVbDgSR1Ay+5l2g==
X-Proofpoint-GUID: -mAqK5i2PYQamvV9ihXhbzGRCuzShyq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150089

On 4/14/26 7:08 PM, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without it, the interconnect framework cannot vote for
> the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..105efb4b3aa4 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4312,9 +4312,12 @@ qspi: spi@88dc000 {
>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>  				 <&gcc GCC_QSPI_CORE_CLK>;
>  			clock-names = "iface", "core";
> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> -					&cnoc2 SLAVE_QSPI_0 0>;
> -			interconnect-names = "qspi-config";
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;

same comments as patch 4

Konrad
