Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B23ED5B2
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821155; cv=none; b=XfLqQFbvBmGwyStrN1MXS1PXViStiUmiS/vz8Y0bw0bK2/FhtAfjK7QJLXqVJ2DHuvGsxLL0KfYN1WY2D8i6Ew5tF+2ITMiS2sTyeojuwZl3pcjB3UfsDYTzMTdklNHUlM+4XS2/RgKh5h3bxwxRw5q1yzx95c6Wap4BKoU0/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821155; c=relaxed/simple;
	bh=vpMAwpte2tX4ELtpDnI24a3ay+0Q7hZpikQJ+xcsdVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpWRk+e8+MBaRklx8d+Y0qMIdJ+4DuDt2pEtYEHWvRslaS4ZPZQG9UYnf5ngxdmGs2kRuQ1XNGQSdHGwaneWKO7lezla5jQjRDH1PBNt9GWo6KdxBMDXqRVkcWEQKF0LI0VGPY8ttbBuA7mWa9tRBxpuie/bvJ+dXz41ewTRZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6HuvqFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fi7TBVSL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6HuvqFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fi7TBVSL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDYM1590654
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FGdnLjb0PIWG4GlXZplmg3kw4pOv8RKY9RWmFItlcE=; b=T6HuvqFG7+NIeWJU
	bvXumMcF51S78RX9GymhgyjQryDYB5s4ygqTrIhjKghayfo68RoeR9QHZ+PzQJtm
	TQSK/wH0l1WFp+XHG49EbMmQDag03WpMClyHczWL/XoUMqG1rWMtgLdQsu2cLgbv
	Xq9GsOlIBl6QDXOIlKt1S1CRYE+gDMfdbuifCZVXX1vzKi2cfF7vT/x9xCSg9LIs
	ijcAVrRSV6OZ39H3KOu3YKj5plDRmL70De2OeoL+rLlqHzXcsAvZezGfE075fsor
	7JaWG5FIy6rIZtnWzprpAmHkB1SS8FPwPtkspwYvETuyhmmHTBYtv8zxVYB7V+LX
	U1GeAQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3e2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:05:53 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd933e15a8so172542e0c.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782821153; x=1783425953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FGdnLjb0PIWG4GlXZplmg3kw4pOv8RKY9RWmFItlcE=;
        b=Fi7TBVSLqRXiSBQR3PplMX05+i/MIxvRWkXMoi7yqzIKDpe0bfJcQMsS4jVSV7PwCT
         0Z2km6c/RQremYT/JjztcNpbPNotLcgj42kA0cyN/9BQVW/Kty6K6osg+Iv0IC+mNp58
         Ut6nNMBOhnj3RTnJtOSGeKtH1LLEVTTgKIcUe7S74QLT/dpzvakB9lXGZ+OpTKYkH4a8
         4ePNy6s1FWTBrxBbL3wQR9kPWeYHZuopLBNe3yT9rnp5TiVBP+XSEoTJue72zfjUoivg
         qdZeCF3jqRxGgu2SePTDYUO14ZvZWymbCYR9KQTpJNnZFsclAgl35cNt304vBT9pWGvZ
         HHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821153; x=1783425953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FGdnLjb0PIWG4GlXZplmg3kw4pOv8RKY9RWmFItlcE=;
        b=B6zwG6u0sD7uwd0x9ILw1UjhO0T2ELn+AWTpYddekPoQYuInmvYqD1apX8iUf0yZYD
         xq6wnPwURE1mgWpAz62KgDvv8GvwXC9IffSIRVYxTSo7HZ0enY7V4ZEPbArybbo4IRfw
         akKzhyXU67werJQadEVo3k+G3IC8jH1cL1a/UdbljYMXvQRTM7MSOXEUObtXJvZwkN7Q
         2s/7yR8YZKgQGD/94Ty6rs5fiEq9HKUq0nUHduP7MrR+shbd51emLjn9T+4ZiXeirPE0
         eyDWFwayz4tT0mLEp3cscTMhByVrGrNsixkpBWGCkTQsSGcp/A9FN25gujOHlsFkmGEv
         +eBA==
X-Forwarded-Encrypted: i=1; AHgh+Rpzw0/vN6kg6O+J2+SGH+KP7HCQ/NeySATSbBXbhArqf4zSUD6uo3lQ6zUdpsa7dOoU+WpUguaZkZly@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0DA1nZ4pKo+aS7AgDcXYx45lX/6BOxYIrz9zx1YrLoKIYGxvc
	qVfe03wv6b/UTKmOvEF5/i4AFTMBXoBHKtnwKw18C1zVISw+mJHjkqniyi8v1Xb9V7gOKNIkJtC
	vbsLCLT8n3KSh4agbnanOg0TVX+qJOPvcAIVojgzibzaZ5XCexj9WCJtkf3DyzZl8
X-Gm-Gg: AfdE7ckja9rBkTL43gca3ApedOZeQsVb09qDIEBQdtPG0MovwZUac04QHb3vop3e5MS
	IC8noPG19MtaaSjHGwkeW5PAuhrorPvX68BXhuDaKbq5n7MRAsvq9DVjmZ+KRy8lHAc6RCxFy7x
	bmAEuBp4QYFdYuckyTThHKe/wygJl729W1r2+rdHQABCR+4f5uyQoYrCokiFLfUQ1ctAyIF2gQq
	hRjq2JS9Ky+DW/K03uIRv7RQsjrQGs/0HlmXtzKp5SCU+2gQAZEq29mZwDnpRuAMVxH0ePcrbCl
	ef+Cn54BCBak8TRvF9fMs9bJcVRtKpFUaoGfTh8yeqS0tejsBRKvG1SDP7kNi+BY8sz1ir455ha
	Wr7kHJ+ixieDdPllarLueTGBpPHGP8vGwXwU=
X-Received: by 2002:a05:6102:370d:b0:738:4343:fba9 with SMTP id ada2fe7eead31-73a38a42b52mr469674137.6.1782821152906;
        Tue, 30 Jun 2026 05:05:52 -0700 (PDT)
X-Received: by 2002:a05:6102:370d:b0:738:4343:fba9 with SMTP id ada2fe7eead31-73a38a42b52mr469667137.6.1782821152447;
        Tue, 30 Jun 2026 05:05:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12891785f2sm113720066b.61.2026.06.30.05.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:05:51 -0700 (PDT)
Message-ID: <df2baf3d-2959-43f3-b6d7-9ba60d6a3cf9@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:05:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] arm64: dts: qcom: pmk8550: add VADC node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-1-4af9251731f1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-1-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX3IsnGEOcYrS9
 LzBVJST4IRwe1IJkJmZnN9vaXEcQeRNobLeVRF2KOVA/KiFgPUN0ZKjl9JK6cU6UHqIGa+7JsO+
 u3DySC6IPkvrI1P4MCmfr2E7d6Sg7iA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX4Tu5tSOEFlE4
 KhsAZIv0+LglDjgWTYp9WWumJq1LSW2wlwFEQWC7/fUO6DH51dxuG78wnHca8tfa0SFA/u5ssT0
 l+7kkIovGD5ABa6pmOQ2IZ/h6qfILFG9mcjjFbuf+dDAaLXpfH4TywVjqCWHl7bQzt8ZReYbcXO
 uTY58YxUx9KZ62UhNyNOTrd72wmeC1T435oqh/FbkuhtdXwETqr7zVpvJgwMLtQMMT0TE8YShm0
 mStuQJ5D1BXFv9yASWhGwo5YLawX0lbR1roVb2ONnTautRVYPOfOpa8S5wg774oku9fcy46ncnZ
 eM1Wife5XoQ7bDr8QWmV1d7hq/mV1GYJHntJGxyvcjMcRdLxhkFjuFOiHzhhAn4fyNWMl+CnUrk
 Fm7o9pdhAZLmqcZegvEwDEKi+w2KYPKckAvV8eCBvA4oxyzIkeWxNdEPgK3A/cxHGpGE1+GIUfs
 mKSDlInKrcfTD5+9c4w==
X-Proofpoint-ORIG-GUID: pViSljj9Zp6jCgLFZsrTrh2xI6LxSAXL
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b121 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ifCK-ypfc7Y0ayOvxkEA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pViSljj9Zp6jCgLFZsrTrh2xI6LxSAXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300110

On 6/17/26 2:53 PM, Neil Armstrong wrote:
> Add the VADC node and the initial pmk8550 adc channels.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index 3049eb6b46d7..639c0b1e0c33 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"
>  
>  / {
>  	reboot-mode {
> @@ -44,6 +45,35 @@ pon_resin: resin {
>  			};
>  		};
>  
> +		pmk8550_vadc: adc@9000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x9000>, <0x9100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;

same comments as I gave to Jishnu on the other series:

nit: interrupts before cells

and use interrupts-extended to avoid the issue described in

2d5cab9232ba ("arm64: dts: qcom: sc8280xp-pmics: Specify interrupt parent explicitly")

and please sort the node appropriately - with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

