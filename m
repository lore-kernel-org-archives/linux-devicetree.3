Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D737B26560B
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346819; cv=none; b=Kr5r7wVwPssOcLI94CV2NadcNNg0GP+XfCbJiMwX08qtIflcfWKOS7iDlbltyWduSNnwNwjNx2dcLBaGWWpdfF60e9yGFGKym/Xv2oQpqlbLA2eXr9KXQAKj+pqzX+YQ+KUciG8DEs5xwh4gg7egCgwhij/6fb2rpEUdc82uajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346819; c=relaxed/simple;
	bh=A+XtOyHxijOVbkkz8FigAt2vjQUd5yw/2pqqmX4eTw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rk+jZcwqM5Q5mgtW8uwJDTxk+fsmsQtGtxGq+rEvuEAbZwflfLYY8eL4mRxftC1r5NiYEAEnuVKiFn1n/OBSwgG5EQO5UnlZFlhUbebTRk2pdmE4s/kHWWytRpX7c6kgnZ2G2sgJuiND/Mnn2BkaL3p2qkv0rc3fzJjakVIw7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njTEvOJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmSz2MYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njTEvOJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmSz2MYh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GDQ7ZP3733599
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNdmWVIuP6sNJjEyEjeGF1LC7+n2Dc+tbUpHpHABd4I=; b=njTEvOJV4MFNi7xf
	W97s2r6f4E9bcwxTPETE4FIJW6GLBVNnjWgIwCPDUo2SH6Q2v8VfLBqUjJW3qLAo
	sDvJxz1CnNtEwa562TR6rIyFJT7dHkwvzf7/Cu60xVZp5meisVZpv4NbiodeKXWM
	aWO9lpyfL0wGmToaRC3Xz4AZdwmvqwy2KgfeOdI4aSuVJwVtgo9TFN0vpIC+DE6j
	5vDMiBj4WVpv9vccFmBZkPkskid9HCX+jxwtzzznbjXHFqpdbE35Kx9ZFHsI6sYj
	5ObtUjHz32RXNNhMSprN7pW0eKveM98e/UdK+IWUSwcYP7JCHUIEz+8K+N+9bzh7
	bRerOw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwm71c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:40:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acaea1ff11so9155466d6.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346816; x=1776951616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rNdmWVIuP6sNJjEyEjeGF1LC7+n2Dc+tbUpHpHABd4I=;
        b=GmSz2MYh59Vth9VIdlCSXKjMkaous/ZZcEeUuJFFucvhhM7jqbiwXIqbPcjvs3kJCi
         igHR1hWGrcgcGMGmabqrNBESiiocc63q+E9cxNqm4O/jkkulzDdCMI0sym7zrfZHYJQ6
         IGbCISGQCdjFu4IuO9iHp5Dy4GWq3BZZGe5b48lOJV+eg53X3UQ9fWOZd0v32Ab1IFFJ
         bGyhy0HBb9Pi3nU7uP2CHn8lX2mS/3nSKex/hBjvxFOBoR09+v92B8lmSLmzxgLGMJMh
         aVr7S92ki0qTR/CLLKcro92lTQ32Bi7oTGxLFAlCZoHzv75Zws4la5V9anmVuUODBwxC
         uzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346816; x=1776951616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNdmWVIuP6sNJjEyEjeGF1LC7+n2Dc+tbUpHpHABd4I=;
        b=R62DAoUuoyx5uEhawrui3WMrw9MB/G6ZyUbY+YxLbH9ohgmbGPpLNi5fJ/evzfU/0S
         WSfz4LjcBKFZP/oweFm1Y3L05qS+ej5jkJGi5dbHjUzZiW0dVan8a9J+zl0hv9Ywq5+W
         Sm+jwkUFQs7MoLfSai8xAjF521emyo+ETUuPHY3ZS3edJ4sN4adz9MBrCO79yikd3XK7
         HkSB4OD+nfAWMjDn2W/RW4WY2cM7NfkuHbP3ezNVoNo2uZZvox3eI8V11tklRiLFEG7g
         BQPdnv3Svup+w8nJeVjRJXaOm6VH9XjV+vuJTIodv99+c5CikWR+PUPFyZdk7TG+YvdD
         bPJw==
X-Forwarded-Encrypted: i=1; AFNElJ9/cJ1NSyvXsnI8sh/DqNKVVDb8VpKJOIpWSDj1tg16ZO+ybiSf5+JQGD+Td758/Z9X4L3dLk/fuvox@vger.kernel.org
X-Gm-Message-State: AOJu0Yziy4ZlA4C7Dn+6Z4+KRlX6s7r2aDieAzb5KeMj2r5Pl9vKokGR
	u/oajWSomfuz5a15/xsYg2fq1xHByzn0RZ4jxLesRFOGaUNLPyLUrCqGzu8XinH9Hy9LTa794tz
	p8i8EvrDYKhETG6FRTCanyxgy1gryy6qi0rEwA676dHvZpzF9W62JiMrPG4bhxupg
X-Gm-Gg: AeBDietX7KY1lVdUsWY+5haL63/ZWx3a6+IhH2H2jdHyPEnsYOHW24ANGe+URUX9stT
	g8xsrwRWitJ8Y2Kjz5FpyWqoquv+uuoTSiG5VMYNv6QCR421yE39lnXbd8wSBl8szSOILgFkTs9
	vj6HCOzvaoFV+uVa36OPYErxU4XZVkUrQ8TUMyhTR7pM4WD2RwER7z6EAPEZghafn8rnatqON90
	VaHc67ycXOtN9xCLHKZJ2gDBwUjlGFVQC1RfiGgUfC2d6dhxuwrbj84pQx6W4Kcq8CbEc7rNZVC
	pc4ky3pE2KNPDnudA5uOlGEhTGd7bFICqIQmGwuq9PdDXN63b7qIGoWpxIsFmxvrsxJbF2cOTwF
	ZP5DOaWymmXE3MjeUagCSxrCpes4jDqmdqK0oB5YzNhoUrJ6NydwvdvRDRyidKz3SZnrgFNcEIW
	hZqQEHBDVskhg/FA==
X-Received: by 2002:a05:6214:2aa6:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8af53ca744bmr28130936d6.2.1776346816236;
        Thu, 16 Apr 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa6:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8af53ca744bmr28130446d6.2.1776346815750;
        Thu, 16 Apr 2026 06:40:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17341a97fsm171539066b.13.2026.04.16.06.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:40:14 -0700 (PDT)
Message-ID: <653fc8bb-295f-4f1d-b9ac-a33e0d8a933b@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:40:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sdSPb10OT0rZaltZkNJ9o2Wo4ziAO68g
X-Proofpoint-GUID: sdSPb10OT0rZaltZkNJ9o2Wo4ziAO68g
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e0e6c1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=K0FbUi0B3_fz5qGjPmUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMSBTYWx0ZWRfX18gWG08n3zaT
 0MJYvmhSElmaoy59AjXuNBnwb68Xt1LvhTVEhm/manIr4oPuxEpJxk1BMOKB1BCAgykfi6X7ghS
 5qdHmXNufnAzl32LljoVC6P96LrDgiJgYAclhl8GmqVGebRWP+R43uKQ0lulS6LRJidExXS7uYP
 9AlYN//mW7GTCdUcPsqeAc/8XslOmCcSq5pNL0y2eVi001yxjOsEpkgGJIF0zvzAwUdosgxr4CF
 0s1ztoIM9mlE6oVppTVy/wfgtyXHBTY2eTUHDAYiD2EwJImZBGb+n3hNYDgI9IeQewyxbYqshQ4
 Df8ysflFdd4M5VAlSNF1zxkhEWqBNlqlH9FmAWJxmlBf4RwG45dM+ziRcvqT0pp3BKYQdvt06ns
 y6vwY3xHEm1Vzf2TpJDW6FnT7dCkLgift7ymZR1StqwcvrHAbvdN63UmdHTcIrf28g/0ZcE7acX
 FqoGCS3Aroazzly1Cfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160131

On 4/16/26 3:07 PM, Harshal Dev wrote:
> On Glymur, there is a crypto engine IP block similar to the ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..e8c796f2c572 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>  			status = "disabled";
>  		};
>  
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x480 0x0>,
> +				 <&apps_smmu 0x481 0x0>;

It seems like these aren't the right SIDs on this platform.. Have you
tested this patch on hw?

Konrad
