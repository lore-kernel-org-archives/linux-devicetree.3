Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E441931D
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743943; cv=none; b=Y8Xs5h6rJIKLZpVXBoRx+3Jyp4VTgIal2bXAKcynp1kfjIi0g6nBC2R3PcO2lzsiXdui/TpIpdWHpfKAYDuq69RHjUAdtVdgo7MW7urlYdT37qFrzupG9u8n8me6DZcsbvBKu3ACyWHjWFteIEQxWzh8Eb3+27lxklW9o8xAvGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743943; c=relaxed/simple;
	bh=dJ2JTp6OFiB0mDOUeLX87yYQ+VnXucP5xQ/OK7M2m44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFNdNVV8+KVWQljAq3qwge7M4HLKCXc2rt3h9dHUTti+MA6cnPUOT2V0YhMfrAooXTsvfe9tblL8vJiAHgHHHU65coUrRtK9vfwGFPOcSJFT3gEcCVzpWOYRsTH6EcIG6pXsopDC6vKW+J0OXSy/+nrIpIHDDOUEUtmjXqOMkWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NS95HeDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ygz/Ex3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NS95HeDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ygz/Ex3y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATSDX2592837
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9F0ZQvdgCZ175pSXQOqitXo6ftMA07Jyq3N/MCBR0A=; b=NS95HeDZbikRVR2L
	CDbdAEuKNbD4Bc/z8M8aR3CAtyBF/pWucf/5uTVV0RFapYgsHjzPYc4FQLV1+t88
	/rIEWdm8GIkJ2Q/EXFtwmym8tJ+hGgo48rfkq4W1YDciQn3HpmwsHP5FRQ4O22Ey
	v9JQJARm571mVhShSfQ0RJhYLw2XEUzSsGXd7lSqDm6QPJh02Vm4sXN99yuSTZf8
	JPTIY2eC5ASHR+FcCF9jq5zv7lkIA3/FVqLyqLj8Cx2U6eBtKCxUCTs7H4LFV+Td
	y3Q54UfP040JuLQM0li7HYENa1p1qNVT6gOKNvgi0iZ171F88OJR1awSjGJDR1R4
	McZEKA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vj5jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:38:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7392d893428so66673137.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743939; x=1783348739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9F0ZQvdgCZ175pSXQOqitXo6ftMA07Jyq3N/MCBR0A=;
        b=Ygz/Ex3yySJCXWmnYA4yiIVVdGT7nZDFwQRJeYDzNFR1hM93TtfBimbbn1khwNBGEj
         ML6M5L/W9lG1OiXrkI77CIpNCxmxTzq7u0x2lvkpnRuZRU+181I6O2KYPvXRKOA9x2g8
         EREgT0S4rVBqGEQ0I7B0kFKtkTvo/v8lL9PykOFrvmX0cL/7YaLlZ001otz0dyOeWeV1
         aU4Y6ui2gOSaBotrvBCWnMLWZnOgNlRIdAiFAduSYaCdnVnnys+rGSqva9nTMQ9/2czL
         gax+4c8dCWlx2+k3f62GxXw5bj3qnArxq7PPlp4cg303ohumvCwcMcI0sEB9CtRd0/Ox
         z/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743939; x=1783348739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9F0ZQvdgCZ175pSXQOqitXo6ftMA07Jyq3N/MCBR0A=;
        b=VWSh6tqx4/6ZPGk2KyM9V3PrhjzWPrucqmpZ3usiwNeQzT1nsHsrDT1tJ7n9eQB+UQ
         8TRSYDbKcpUo0ox0X5QaPGeFYn7deSXnxbH3OIOaxkhzTg15kAy5ZBKqu4EjeXYz+rO0
         UXbgdCwN6QO0c6f3QOGTWPy3n9E+9vg7RklfCf2mRlbbLBog1QFEqcYZd+ozYkw7uX6L
         WIadfpl2a0rrqxB8qj7egzb1v7szOXDoT4QTyq9cK3iWRxhO37hY6VfRTVZY51agZ1UN
         Wncv7Zix98gbuuM1dw7CHxC8ajIN8fkoFppVMF/BCGFJmGrqR43q0Zmw6i/wWiputJEL
         qDDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkCfidJF5l+p86ddTxxw/P5o6+HRDnKBVomCumLOZ5Q+3cMU7xRhorodDesAcFDoQpfaRarcmaOyNu@vger.kernel.org
X-Gm-Message-State: AOJu0YyHVMuCkVrKyM6WFNfiko2J6Fw2kRYu39c+WnwFrh2gDb7ynUJS
	eOFELYzPwtUrwLf03m8+0C8vfBZTqCDxxttXz4AqcwRltWhA4jPSe8Chj9kiS8BTNvDnPWIPZSd
	kbexhagxOzfB/eqDmo6GNX25d8VrDKLnBDp1o+I1EpgWnv45sigJ56B8oBrDbXFS8
X-Gm-Gg: AfdE7cmfuk7kdTlzOFoc4wj3/mzEH9ZIuWbW1qiIJIgDETapljHO5CwfOsEU11baoL5
	R4vuqyGf35sVdAdNEYL4ltTFVESE0OWdaWJukesY7DzZJjMzpEA1GlheJDU1MNJV0AponogAeYC
	ZIpVQW6+Kyl6OYRa8t9UCeKxrufuMpNxgu1DOJfDmY6BdaiL3hLOs3MweKL8sHxi2v9xRXnrs7g
	XEbwn+RdPBQ1skxsfP/YbErEOFoKS6YYQABOMGtixD3GC2LFoCdL05Sn2CBjV3ZNyDKFD6qJDoC
	c7PCPjT/ettLGwEeat1WYnN+608XglLkGdQzdiODm5HJIU8ey0vpjUgJ0+37diQTslGYpXBacQr
	eb7yVFCUBra9uaM6zotWQqigVN95iDKUqm/U=
X-Received: by 2002:a05:6102:1607:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-739b6bfbe2bmr297196137.3.1782743939040;
        Mon, 29 Jun 2026 07:38:59 -0700 (PDT)
X-Received: by 2002:a05:6102:1607:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-739b6bfbe2bmr297178137.3.1782743938563;
        Mon, 29 Jun 2026 07:38:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69870eac1f5sm1099403a12.2.2026.06.29.07.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:38:57 -0700 (PDT)
Message-ID: <a0a96e9a-2df0-4576-86a1-95683dcef4f4@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:38:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-7-2114300594a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-7-2114300594a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -sb6JvZvGH314-nVs3QjJS6xXUbiXSCn
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a428383 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l7gszL_yuYPfzADJGiwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX7lQGahTtfWd1
 GkwXrB29zUSOhFYniqR5zGx3FqbdlumdRGs9+Q+M9rMpzQkHioCBuvJ6G301MrFYIZYOvkxN2hL
 gxbeOcx/1ImB8GWKhhOREqtlXIx1r2w=
X-Proofpoint-ORIG-GUID: -sb6JvZvGH314-nVs3QjJS6xXUbiXSCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX7K+y1iAuJl0R
 om/WbydeZe8EsxmifZN6bbimr6cX2IoYyxNoZWRngpuKIu3KDOIdbmQuyUTzbr6OOa1ezcCSNQo
 pHSEJwQ1ejDDYBmYXpHUuE1lsCD2d7Iv8LNqYixMDuRnNLSQPxJzqTWrCI/kUMtVqSXtdgyUowv
 BS8QvYo1GoeTbQVEjnI0uGifGvPm0v7kWTb9BRiBEB+wJ3lc7Owaa1g1+JrSIdD4uVAX47gnKlc
 +u2nccVAFQvScSdKuHX2zX83AOLKC14WOqglJEZ+gsAaZsHUbR7fwpZR1Mc0zxoJnUNw5xvNwxK
 j9MlowqyDQoy0c8LQSquTvemGY93NymowjZ2Vvu8IueBw7dq5IruMNPeBnBtI4F/FbH1vccYC1w
 rjLW4U0utR/1nr9j4CW0uFF0gZNu6iAmDj3qDher2R6K8SORhMwxZ/qfCqeBb1d771LfBp3P9sW
 gxc/QGNG2Wt9MbTFdyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122

On 6/8/26 3:10 PM, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 219c904fba29..445dd8bb7269 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1798,6 +1798,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		remoteproc_mpss: remoteproc@6080000 {
> +			compatible = "qcom,shikra-mpss-pas";
> +			reg = <0x0 0x06080000 0x0 0x100>;

0x10_000

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
