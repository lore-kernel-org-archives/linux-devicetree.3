Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A19302146
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747043; cv=none; b=No1uaiZzL9cqWlfTPiD6Go8JJ+nVk7pYeKXKFIJMyREJ0ZjLX7W6BHCS9blmk555kWld9jkQrmRQEQAKLNUA7kAPrickxNfPJCP59bU9L9emvXnT5uAbIKRL1K4WymuytV0KD9UAkEWEaZ2igfvFDvMT1YBTtD2fGFdFH11u3v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747043; c=relaxed/simple;
	bh=wEnBgqajFXXRvu6hDveGCvMCgI6kKQeUz4dTbvlLUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+2okxyQgVifg6doawuo/t8Hbv8v/Em4v50rvi9gRMpzjKeiIRkKkQv7o5BvUMulXTzc0yBNiyVp3Vp2l4GRHlsh1cw+NVYrSPBLlm0r7uj6agl99V+C1Ac3I1BHTdaLAaQhnVBO/FOLZ3NwV+evvBEUeU1+6cajKDxUCj/EnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwV1cAiY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJF9XH5e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwV1cAiY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJF9XH5e"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6870AmHj1245994
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 02:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bTyP/MvIhEcB00GtGlwFZRJ3
	HfiGKPUUykKM88tlr4o=; b=EwV1cAiYNtR37fAGV5NJsbSxWObPEArI73hyhrc6
	bW4Dgmyo7vG1Jm15BtcriqK/gUeIL2eUFhBeWtGhF826/zzqkLzTj0IBiXdmMKJN
	gvIVf9Bpi4PhxiJQ3tLJxXq+u8jfBzqb/e3LSgekdvgSCSpst0lsip/9pvrfXsnC
	QvBjHmz+tb0xFuDhrv9+3bOM4x1vddD07gt8IZAgDK3vGxawJOxUa38LZ5+KtG05
	9Fjp7f7c35D0XWdV1JvWmW6rXWdzm9+otvCLBL3xpo8WpVrK+cs91EhdckpnIQX1
	GOoMARvSKn1+qEtSO5tzmllgFAkZ1RIFRbvRhEuUK+uZGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jcham-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 02:10:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so6501183a91.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 19:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788747040; x=1789351840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTyP/MvIhEcB00GtGlwFZRJ3HfiGKPUUykKM88tlr4o=;
        b=IJF9XH5eOeE+gwyIXsABTKBchMFkkKrekvl7LCGBfyNa30dXU7oqBaZ460YTsqI7gA
         E+vxaVqLaZ5iRuWZUg1qtCNKO9Pv/LBe/YDQpuycttVcJIU5emL8UFNyiD+P1Fk8YPcG
         HAfrBY6Nx+Xt8yihDuuHSIIoZKry2xCKgFUbBGsJ3DCWDsGk5MyTKBaXTA+/riUUmxwN
         1LbnPs8+3GKU0fI4D0/2Tlvt6S/svEL7gdmirWa1ngLSo7c156HfWI3vBTsPf1KVO3HD
         S7qCt/EachUIPkLrepDvKgosFLUkQDAMUtA+j6Q/qp2Yy2E6FumPHTM2JvN8w0SpaL65
         d1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788747040; x=1789351840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTyP/MvIhEcB00GtGlwFZRJ3HfiGKPUUykKM88tlr4o=;
        b=dvRSMlqqjAR+4+9Y72tYkkpjeXZK4xpe3AeLUVHbwHL5uh1bXO5LjSYxLCVDpw2rMr
         Haa4cPE/l4S8xBBdsshtPt3IEpd3+SqEodF3TYymvjsXig2JfFBKzCfwvY3PMNfIlNtu
         Jgq8eJIDhUUsr3qqp68ai4pEGgDvjIWox3BxRer9N4nPSmI+D+ctZUD7ENwwJTb8DiqM
         4MAZesiYrKcNlyOZsWytjJnl6GtKxfnRkq+iJo7YRWxA/WnklQXIzIKRSWShoITiYuog
         I8GMN12m2k3uIiyfYpQ9r1vSLL1BEM6SGMzA0xHQFZZLVhMsSyzDWBmWtRQNG1ZpLCHP
         yjaA==
X-Forwarded-Encrypted: i=1; AKwUvBw0BSIUkbA73/Oh8RhOwUUzY9zvvzmwL3RcAbYr6wzroyNHhS1oJvBtSBPkucgo6WOH4UxTxT8g/k0W@vger.kernel.org
X-Gm-Message-State: AFuF++k4tsM+hntUxGqlxkVZipjwTHYFDfBMUON9q0M4AuXe/HgSmbwY
	xoq+gNN8n/dN1f9Uu9whXHzCdXG8eAJBKZtKZqRxJ9fHtdPB6A3kkwsdVarewxRS585TMoyBrt8
	67AhWfmnQau6Yfj6pEgaVwsCuLtgFygmfmTeAc8xGt23UrXHwBmxaD+zbvv+lEkP7
X-Gm-Gg: AYBFou2zcLAY6dpGueRF1VzEeWlF/JbtTwlpoxdYal91BfZAvUXu38SkI2OQ+TlJUop
	OFjm2O2F0GYawLjrU/fkOSFAbETSXA/tbtkb5PHmq4u7RJmUt4cQ2FzkgUOw6XTchCQdPomQdjb
	oZ5s3A4J8rEMw9WKwLos9Td0urocv8ujwmUUrY/Xis454hszMsJKRvrXHF+LIIrVeJlTfHsEF9F
	wXVYEEgsqAgGuFsAwyfEMkBuWcfrtJJhXAsRLTgluZsB8PNvF4ci8l5r7st1Ruz0xd0z/B1lbIx
	9gs0dq3m7RgDijsv0scN/BCLG1z+9aDj1TAx4C9mKL0d2kjrVY+Q7mXbszM6S1q9cbYGSW8q6LM
	s2wNTyVlQ93Bubx6YHnoY5YmlcuTV64hZ15e6bSo/5QWQHjnCgQP3WCw2
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr29653960a91.18.1788747039800;
        Sun, 06 Sep 2026 19:10:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr29653876a91.18.1788747039277;
        Sun, 06 Sep 2026 19:10:39 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm19652821c88.6.2026.09.06.19.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 19:10:38 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:10:30 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Initial support for Advantech SOM-DB5830 board
Message-ID: <ap4dFma4K_ONEwrC@YUANJIEY2.ap.qualcomm.com>
References: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
X-Proofpoint-GUID: vY7Oq9h8BqiGO5sKsLwuq-9U8wOjhWxz
X-Proofpoint-ORIG-GUID: vY7Oq9h8BqiGO5sKsLwuq-9U8wOjhWxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAxOCBTYWx0ZWRfX9ySERfT7JJr5
 heRiRy3fBrtRiEamoC/LJL+f4JEJiYuTMXbIswwy4BmG2r3Zjg00xzfjPrZ5iHO6Teg//AdEQ4L
 4DOUogx95CfqQy6qH0tr7E8eXwDsp8mf5rBFeLZ1IN47bFZZ2/JJzOqpmsLWSWfoRatc1JuXBYB
 T+wOc1oGfUNKqfn6qHYRWkCQK6S8QYnWyKKQW3+lKExIoC9389QHanR6VZ16klRUbo8IL099oLx
 dDAq9j+3VtEXxC8FazqQjwMZPUvqjB/nfKJiGZLmUfSaQJFNiI5ZC94xbuFAe1JEnrLndysDpKz
 PA37eclobrW/5Bs8qX69Qou1xPAi3QFDr/agVK27D1UbXBiiU0eGjqfXMboUWdUhPqKsOGCLKZ1
 9wkovRklXjaVW+ixYtuKIU/XP8zPilEuJ3EmWt+GdTsBi4eJ8g+cgqZcA0J/ZIoLnzYUscxf9Yg
 knZkZenF9BmaSpcT53Q==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e1d20 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nkr-iKa30n4xwhtGuzAA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAxOCBTYWx0ZWRfX3dI2/nMuePQ2
 41AJiCwFkJcE4a2kT66kgus55+sb1qX2+K3t+WFtspkkuWOGji3Y+rZpSTGPl5q6zrMJupRjBRc
 QwUd3blLq8J2BjaTFYzb4Oa5yPrbN4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070018

On Thu, Aug 06, 2026 at 05:44:45PM +0800, Yuanjie Yang wrote:
> Board layout:
> +--------------------------------------------------+
> |               SoM (Advantech SOM-6820)           |
> |                                                  |
> |   +------------------------------------------+   |
> |   |     SiP (IQ X7181 EVK SiP)               |   |
> |   |                                          |   |
> |   |   +----------------------------------+   |   |
> |   |   |   SoC (X1E80100)                 |   |   |
> |   |   +----------------------------------+   |   |
> |   |                                          |   |
> |   +------------------------------------------+   |
> |                                                  |
> +------------------------+-------------------------+
>                          |
>                          |  Plugs into
>                          v
> +--------------------------------------------------+
> |         Carrier Board (Advantech SOM-DB5830)     |
> +--------------------------------------------------+
> 
> Introduce the device tree, DT bindings for Advantech SOM-DB5830 board.
> And fix HAMOA/PURWA IOT EVK compatibles.

Gentle reminder.

Thanks,
Yuanjie

> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
> Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
> Changes in v4
> - drop fix HAMOA/PURWA IOT EVK SOM compatibles patch
> - rebase on next-20260805
> - Link to v3: https://lore.kernel.org/all/20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com/
> 
> Changes in v3
> - add patch to fix HAMOA/PURWA IOT EVK SOM compatibles
> - update Advantech SOM-DB5830 binding and dts
> - rebase on next-20260804
> - Link to v2: https://lore.kernel.org/all/20260727070758.528-1-yuanjie.yang@oss.qualcomm.com/
> 
> Changes in v2:
> - update commit msg
> - fix binding error
> - update pcie and usb DT
> - Link to v1: https://lore.kernel.org/all/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com/
> 
> ---
> Yuanjie Yang (2):
>       dt-bindings: arm: qcom: Add Advantech SOM-DB5830
>       arm64: dts: qcom: Add Advantech SOM-DB5830
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |   7 ++
>  arch/arm64/boot/dts/qcom/Makefile               |   1 +
>  arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi    |  54 +++++++++++
>  arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts   | 119 ++++++++++++++++++++++++
>  4 files changed, 181 insertions(+)
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-hamoa-come-v4-f7033c4204e7
> 
> Best regards,
> --  
> Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
