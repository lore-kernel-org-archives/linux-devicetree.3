Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AA3A6EED
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368848; cv=none; b=sUs33HTUW5p+LLmGZ77qdtHVeNYPeloL6+9AbefPI+/mztTcjE1Z7NcPw21Ou88IU3eQ9EpSSkElW6K713kIB40oYIY5wZLevj3awTAMoNlefZdcnHsfVaiZJH3ks68E2iykRtIX4fDeDZhlumVQsjuW9udWRfJ+K7bAALI0Bcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368848; c=relaxed/simple;
	bh=wi/3CDrgYApZYmkDjhzgutUUZqsgNZ2AqrK0yxBpg4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjVQiokQIiVvGky8OTr0EBUYPRFBRok3lVWUNjF8LAil73WMDDS1cAdJ34b1kfJ5cAJL9VH4RKkmXh3Iyb48cQ3WaD19+71MEyt5TGtVtNU0h7Bs1oW2dpdhzLa53AwiF7uQVBzhkMnMmp/JRs9qOr9stm4q8tmU/wEpOVfi/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0Qrco8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ip/MlHE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Qrco8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ip/MlHE9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S67ibm1625050
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BjLD594h6nIPe0oI8UEQpAkNqznX8Chsi93htrR9QIg=; b=p0Qrco8EtpLyNVfF
	rv+kRHvW+tS1k+WWeIhKK27ECbmyL/1AjVzD7mn6SWYg76yUMdTcTB2z79y3AmhF
	HTWZ4DjKJMvRk0675yAtzmz/NdV2smvMllobyQO5Td9tPWg/21DUt23DJf+2+Yp4
	HMkVaS/R3wrSHLZAwKG2+Q+mVFjCldpRHycLw+lNG9PftVuXQ/ie4d6HI2drAqSE
	wOZ4KNqOnJFBeX5JqPmfdx8oaW4IuR0sibxmAQYfsrf5LJ8sCftCTXlZgYASnTHT
	YQL1PsY/bCinK2DB1BCCVlPkng3kgLuNYzvePEo8qRnSRQ2GWvDfc0GRhvetBHHs
	UvLvdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsa939-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:34:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso105363411cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368845; x=1777973645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjLD594h6nIPe0oI8UEQpAkNqznX8Chsi93htrR9QIg=;
        b=ip/MlHE9ca8iymeXAuaGcmpSKF+zkjaPvPcDeTGgMkHHvbP/v/Bc3BPq/38N7D9ugR
         XmBUMJEJUPYudw8GNf1nWa6X1OHOHPdQAQtyyJ2YXlwtXTMY3SLUVGgOgUQ6oBs5cVak
         fA87CKZiU9trJA6RbXfP0z2r6Lab9UFwiHC+YfAxDxtmnxMkddKTBqcWXgmcb5S5m+og
         zEzGA2E1mSqqJt4+s0QfUPOomKc0rETx5P2acS4OhjHX9Nc2cqvx2RNO7FBT9d9pbLmd
         fCpXxEsP2ceRm0PTjwujwn47QYGGmTn8LldvE1CpI3NVdz9T8Ln4m96J8GS0hDgdbWD/
         sylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368845; x=1777973645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjLD594h6nIPe0oI8UEQpAkNqznX8Chsi93htrR9QIg=;
        b=K52WDC4tSsAeW00kyJW4WE4oJjp9T3tCLEkYi8Js3zc08Wvm7r2AWzqZ+RHHdFHpht
         E3tEg6VphFaopvrUiBi7606Pn0iKtTAHb1VVNvmAtj0H+2KdrAq9h4eH9p/pow+k5O6X
         5uO1kYczaRjWUqy7LuUX0nWPwoA0tlvaC/E85K4cttCJjjvgFYS0RZitBFq1Zw5o6EYW
         ljLvyCZIJktafldOf4iTSs5YrvV3wuAuGah3WQ6dIOVGe14jrmCrbBz5D59+mpg/yT8c
         AZ6QW1n7d8N0JN91ak7owSiYnjn330Kfl/oDxVpkp8CFiagxhkQpDaCqovPxjR6ZmQ8o
         gfPg==
X-Forwarded-Encrypted: i=1; AFNElJ+c3sJThrKPrsH1shNb5iLCG+C+Ggng9JOFOjYAI8Iqm627TwXTkuS32dfXxOnRFpIoulwdVdQoZ8AS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3JVHqpIAueiCQnWiTMmz+Mk+7U8jIsa5TCcwm079gAJeFvnD1
	GyLNYTjOuHnPPTXHNiRRFPfpwdTb+j0bxbOzjKbuiFmirNGTyHMqQDHXIcZlUGwdNtPSOyvawKD
	CHP1nyIqyf71PWJBErqS+TzPzJED3Kr8lfjrSrQ51vUEYMZjLgRqu+FcI42NeMd5O
X-Gm-Gg: AeBDietKnF2oSSOK5QZxyGix3g+ss7bcTmnz6QG783IT3bfVtx6OOGpEuzqBjV2KtEb
	ihIuj6psTI6nRiy64hL/FH1o6tcEzLgs6X/vWPLvTWKoX7t6VNAwNzXX+ckHiY2kuxBHBfZ99+w
	iRcoQM5obJWA9zXSd8kk+/pMt9bStazWAKMJFZtrd6i5jk2KqsKDyehvl/e66r3myQmCNWl0mOi
	+Q1L0+SALgFnqnisYc4QuXX5JE7pLG0C2uEEC0ib3tKgSsx8RDZ4oqBIlTfY3y/Y5NF3ZaLfWJQ
	b8FzmeC1CGjO+piMrD7rFOoeAVjNElvC/OBcPvXFCD8VfZg2ITKgX4/po094/NVYWwJ6bV3Dost
	dFcUQW9En3HoIE+DV3Hw1NMT6IEdqAUSKfY0cQTofESu3h1CvHz7i/UlBOngUWK+y8V62fPNw+P
	0SMdZeiMUhuxxWxg==
X-Received: by 2002:a05:6214:1d01:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b3e296dc23mr30614546d6.6.1777368845379;
        Tue, 28 Apr 2026 02:34:05 -0700 (PDT)
X-Received: by 2002:a05:6214:1d01:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b3e296dc23mr30614226d6.6.1777368845004;
        Tue, 28 Apr 2026 02:34:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808e325a5sm73818666b.21.2026.04.28.02.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:34:04 -0700 (PDT)
Message-ID: <cfdee1a1-fa83-45b8-a33e-252a1998915d@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:34:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] arm64: dts: qcom: pmk8550: add VADC node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
 <20260427-topic-sm8x50-adc5-gen3-v1-2-8a70f7b90a75@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-2-8a70f7b90a75@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YjrBMaiKg4NGVVfL68FszX2GL_cmF-Xh
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f07f0e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=I76Qk8w-AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ifCK-ypfc7Y0ayOvxkEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=vUPM0Wvl0xcrLs4nqPIT:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MyBTYWx0ZWRfX5PehVVp5lPgu
 bicchQ3mNxmvdT6+dF2/11SJ/xGxArI4Kf4/3qEfX1afbj5S6vNFgWBQddU7wspU5sF6OGLznEH
 d3Wln4R6WnMUcu4TC1aa+zD14n85vvOKGOQOqrQz1C0mR++9m7rpFfF5OrpDDRXrvCPCoWVc7TJ
 HinfCyGbYgldrvtY8ejpHKG8/qYqS9QCED59ajUK8B3AFcFJZOEwgHpqRB+dCwRjGlgjsLKXVAT
 aoYadz9dML0NqG21shN3WN+hs3ep8jF1Sez+U40P0cY7tBqQ/05maCLtNeXRxFsAsZcnZpVe014
 DJlfWhz1gFVBG39xWOUVYiyjqB616L+cJfBJenXvpJvewNGd3WHjwVnnqKQJTuXPO2VzZGKWokV
 bZgvos6z4J2qpODNARD1tM0TIQQzemg9OWa7mMCKR69B+U0voI1jh2+/Ulp8FUavdmlfIXk+5nE
 YobLshiyZr6wyV1U41Q==
X-Proofpoint-ORIG-GUID: YjrBMaiKg4NGVVfL68FszX2GL_cmF-Xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280083

On 4/27/26 6:15 PM, Neil Armstrong wrote:
> Add the VADC node and the initial pmk8550 adc channels.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index 3049eb6b46d7..92d57d101c7c 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom,pmk8550-adc5-gen3.h"
>  
>  / {
>  	reboot-mode {
> @@ -44,6 +45,36 @@ pon_resin: resin {
>  			};
>  		};
>  
> +

Stray \n above

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

FWIW there's at least this one in parallel, I don't know which one
will end up being picked

https://lore.kernel.org/linux-arm-msm/20260404-dell-xps-9345-ec-v2-3-c977c3caa81f@vinarskis.com/

Konrad
