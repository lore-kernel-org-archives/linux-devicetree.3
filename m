Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B39B221FC6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637417; cv=none; b=fo3DJuUQKK6OfcJ9Gsctr5H7nyRhkZGcruy5I8pnzK78+aSlpHz2g4FbyAhrSUCS9vPaDtQ3PrPXUu2eXz7Xgyie6zM2Vhn88kpF9to2buO+FGs4ggBivjtADyQVKVQZoTew2hrH+OUBO+AYUiVPcguPH3BX1+BeK/41yp6KzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637417; c=relaxed/simple;
	bh=bhNmXrhFvaKTam+ofBz10yzIZUgw6ydcn1p9PpA7Mu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOEqmyr50gcy2sH8d7FFZ+QmBAhNy8BaRfqDiUU4CzXWgB9YxFB8DfONvxsYyUMZvc8Y39yaTeUWyT3G7Jx+a8e2tFdlgDxG5wglDXPDNTigSE+qlAbpimtJetKwyWii4DQM6eyM6pao/TdwYqOuX7++ScdzdvivWj+nOtMjq/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNsc/q7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXHYqb/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNsc/q7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXHYqb/j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARNck1499969
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=; b=eNsc/q7yNwt86RdA
	y2eZdPs1hu8WWYKl2UqpJSju4uefKJLbW37RZgJq+KnXQibBPcJ0fOvg68eXAr+I
	QLMsedQ4NV8u1fMZsRq9ZOm6/fepjVfdgTkvBhqYz1whho7VP39hhd5MW/VHaAEH
	Appjf0c0eDB09LMZvvICSi/RdqLUydnjN3huq9PBAlJ5Xqqy6hLeoE0TSn1M53mg
	i5Uhvairhd3t3/wNwSA7Yg6mds1vCJYBUEYc51t8GffhgeoqUSCSnqm+DqqPhT5g
	qjqg7OYygcl9zhqsflTC6805iPb5TMEBTIjCbvokguOdtbm9L7BkesaYDJ20eZIw
	ByC/VA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtaub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:36:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so33831861cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637413; x=1785242213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=;
        b=BXHYqb/jek7J7tVfwbPZ9xq9L8ZF1je53b/BJPprHl5RuUXqbaQEnMqWmfAu8m2VBA
         cPJQJKJbWQURJ69BYc/7yJovcEr9wMXVcAT4Hy+4ITK8ZcfrNY4UpxMF969UXTawkHsj
         NSmRz4I6UY+IKbTSyhrhNXkxw98GEssvdH5kEVe/ggROPrjETeKmexesh5P0wvlvOwPl
         JziX9lq8lQji2L/nIUbrpOC98233QJYDRfG2Cyp7RynOsx9XGQJNyGfKlZdvvjoZPTiB
         0f5wLgF1glSx2W0AOL4vcPVx5HOmF4LFLyiRHMlt/Tdn2IQ6/+91n+j3E0lvcb1mqg4f
         Jh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637413; x=1785242213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=;
        b=ZQZ+BzjKqiiSlNNNBLvXJYlYGqVbiaRNvAANEXGPHHG5teNb+Zi+fCgx2AHZSfkfLW
         xx51aoYvXvX3pBqrFg6Z+w7QEIvkXPgCdqB6hRFdP5VtsOWTlUTcAaRQqGKemls8IhGl
         YKeA3QFBFyWQ7AHMKc6SpJsjFTVkoC5AJNRlXSX/V9+m0EZvea/V76zdw1WGyAwYUxiA
         MYucPmlvqLQsVXubwIvDTlU9R/5xOYM98mhAwatKavW0owGOggQuR4O3+IJlOhbM24Dm
         hdAU2vNvqpbK/iqfMW5+brPUg/xfqE3OdytVbYsM9t3hlTy/PAl0gYpSItqLaAbjqGls
         +rog==
X-Forwarded-Encrypted: i=1; AHgh+RoEYYNbZKDy9YTnyd3+6DTMuJF36VAmQpTx2TQmxmUnmn19HgeA6G7xllIi7/ZljhZJ+KjNAX2MG1/Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyauwx8QOxE0wZjXyZbAAUUlFywfVDowcV9wawQc2/aeGlBlMD9
	rkHeifaGWMCxXTcELhafphz1RXz85iQx5jrEFcKCRP6RnxCiDn8O1NmunYxuuq3ijqDQJwH9jEN
	6jld+yvOi2E7C+xtOEN2Vnj7VYbs2/zoERhyW1sa7vNLO1GmlDquaYjyTGde1Pyyz
X-Gm-Gg: AfdE7cmYCIjgsAJrPBVVGJb/1rvPKZy8rWjie78MGaNI03/KXpvvb6sXR7/0kuJntIJ
	L7ezJkPngUd+GwQKwQ63wvYA2nNQ8T4Z3w395odUbFgH5xaRNfoLE+IMNjSHonKSCFGkiSahOxZ
	XTScPxW9Ojk/qRhenRqHRnJpmSwqL31a3MmR7soZPvl0XTP3Y2xGItfyR9G0Dl94z0JCahkPmRG
	CkxYEzMg0CRtnboBaIdoApYKGi7X9UZPYW86gs8rO3PfSPM7VTvP37cpZ0+m+ZDEI1bN1dwr2Ga
	ZmyifGlRfyRKoiKQ6nyezdgeMKPlfQ+AaCi477xSibgE9qvsIWskkc8/MJPni3vMegyEVjlZ4tV
	yNnKxleV2ms0Cy42iJrQ0Zn/y
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr104331381cf.10.1784637413451;
        Tue, 21 Jul 2026 05:36:53 -0700 (PDT)
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr104331151cf.10.1784637413046;
        Tue, 21 Jul 2026 05:36:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705afecc3sm581269666b.24.2026.07.21.05.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:36:51 -0700 (PDT)
Message-ID: <a5d6f840-3849-464d-a540-634dc3ec81b7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:36:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz>
 <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H9fT7OJ8Vm66AwvXRlRwvWT5PKL2HRWW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX1xOSG25Qs0Ox
 waIb41Svd1o3Z8ZKY27aMYxBazhrcYrmFj1kMJVfwTPkDDRv7TzOpqusXnqXmb0sHug4fOGm6Sf
 QWy/8ywmJLugQkfspUfjHVuXpqcgVoQ=
X-Proofpoint-GUID: H9fT7OJ8Vm66AwvXRlRwvWT5PKL2HRWW
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f67e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5ZtbFIxHr3uJdDL8FOUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX7imbEPOYA91c
 1WA28EmPCmwRSHqCUS0Ln7ZrdtxlsHdREUv7UaWJgVA3hnXn84edgLtKhEYCPEIHiQDuPVoZIAl
 57RhzcgZ8EArUBIXKXOvbeTLMIYM05Q7OGgUpG8B+iSltn6nYTSfkpHwcAgSvM5TqtMcOH1FFdr
 XAfGQs83eVyhqsjXsaPXRYPKruvzR2Kvy15jsGdxYudr24xfRjmxbQPLs+rrWM4xCaylKNpZV9F
 27+xMYu/+fxpAj3USRptCwulzazKUiHVmn8a6sOj52oTC/Au4GSCUXqgfTpvyCEa8J2evVCinAp
 cuq8sdmv8XhHFz+fAHzyn2mRqBSkN0BL3/aY5B3LnSQA9uxjQqhdx53beQlmRUnWywwuA0ztLvO
 MJYOFW/+Y/z6ukg+GNrYP9Ngt4uBzQ3gqDRLvBUd50v4KQaDlcFpngMJurRtUMxt0e+GGINp2ry
 5BQA7OLrFFses5SpW0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

On 7/21/26 2:33 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 172 ++++++++++++++++++++-
>  1 file changed, 171 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index 9368fd6b87515..c8a28133fb38d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -1,16 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
>  /dts-v1/;
>  
>  #include <dt-bindings/arm/qcom,ids.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>

These should be flipped to be sorted.. if you smile very nicely,
Bjorn could prob fix it up

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
