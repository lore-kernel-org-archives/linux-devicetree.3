Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F9539BFEE
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279325; cv=none; b=B4v/wIq/YKnboP29M0Lqd0VhpKQqpKAKNnoMyYbobx8fsWlop8ReI8y50ogsO1LVobgwpUbUZ8CuAapXdzdfNO/LkYTOxMZaPHjM79sXfDcXu4F27jEeqycaQ0EKZ+z0vpxqs3r8T12NRVFLmxz7VGcLpLTz+LSMvbCkM5HeTFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279325; c=relaxed/simple;
	bh=neKNELKcTkDyFNQTzfs1oysao1xPFI5tJYGHEXhqorA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwJ1HVDgY53KQ284JPI/doNHuIfSUypi9IefbeVdTbBaeodSJFmqZ+e+FAKcQLUmB92mxJrOel5+HAaMUuanHUYvsmDGbHZNBhltFW+GXDwb3rDJN25/p3z7NI7xFm2TrmW4FhuqtylU6Y11h3ct6weQK/vOvEpgOnwVDwlWoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XICytxMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzYPrcVA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XICytxMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzYPrcVA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TEvU3682481
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qv98aU/01DIYDSvxt4p/UE/kkHTjWYh+2Lh80L4kIiU=; b=XICytxMcw4QY1PIS
	HjoBLQch3z0TdAso+pmr7g62tDODZbOMia/2gDNqycOXVdCzTsrmO13YozO6HjXE
	oc+zzksrbyAoHt7tDtFi996sEhu9IcTzOz+zKW+os9S+bJP1p3c645dE9ooF330O
	+pJ2dZ2H7wLh71q6h+VGt1Ij1OMnBenHyn1DLfrfWwhmnq6tF5tMeKLYsQt7kSmh
	MmNR9uVST38IosAqvNVAJTQ4ic90l5oT0z/Yzx+tbE2egI3mnSOCKvP3Ae5BpHC+
	K22FzwvmQbINB0VTBbQeze9aYqxjVRx8iN8GdPZ28Ir2A7lswdMyRK3ETG+Jp2QW
	/S4yvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr573m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:42:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso13330197a91.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777279322; x=1777884122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qv98aU/01DIYDSvxt4p/UE/kkHTjWYh+2Lh80L4kIiU=;
        b=TzYPrcVAyJnOL8Vrj7Fk0LEk1mO253GMx6XfQawoxG8epe6XoQqaVZyTcOXOYChxs/
         jPh25YNyoFH3vs0p2oUxtEaR1dWr+nswPkjUunELm1MwNv9JhEBvBKg4Jx+39K95bYMw
         kwnK6yT2S1hE78Ww7cAZ0kXfPEMNAsC6g/Bl/jjQu9Xs3xDNQSQwkpE5kSlphTLdT0DJ
         aMGvDKV3KkrgnkOjWQCxgqxJ/Ke3tblCh6xE2hWcWRMvw043U6lCiWeNYWEFkwVRYy+I
         j7w+Ez7cEbJxz/Qo9gH8hnUGagtfO3VLyxxmNTGlOBsy6GFxeT15j/lmmf+6nB5zC0tU
         uPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279322; x=1777884122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qv98aU/01DIYDSvxt4p/UE/kkHTjWYh+2Lh80L4kIiU=;
        b=HE44VbaSgnkPFg+cSBmEDHe5vKkpUdribWK9rkcfJPKCoKTI/5F7jmxkotKMr30Ia/
         wQIsDLb98KyMUmscrndh/3EhgEgYarNx2637K3dbb1DDphvlzBh4PmDnr7cXG8RbbHkW
         BCaH5hU/AJnhUWtVPNsTyTw1hwfnLprJggaQEf+DJGzMJMLgFwwxAtLFhaY+TjNewFrw
         OOTBEoN0g7sSv79KmMuIVOEuMDe3AlK9ybhEZbj2mvKqYj7wbr6qysrg1CqB1ThzcQ5U
         U78VQ86sb1HY3vZtKWwEjUa0dtdpGDMqgEWibqpaln8dnIOYlgW12O5Zt8fZIMkwmFo8
         jc8A==
X-Forwarded-Encrypted: i=1; AFNElJ8On6OLd3uaTRxZ5s3MshrSEFGW4rpnVSrkopYG+I7EmWrq2LPB/D0zkMDNQwq0komXDs8zQfe7VAJh@vger.kernel.org
X-Gm-Message-State: AOJu0YzFLF+zBtBQ/xNS6l5U//GBMDUBsOC9Sjidku0YgAcssGbHIHtH
	o4f/tPa0hnTV5gLiAHTEvS9jUljqKmq04SbRNsLsuNk0VAQ6vG3dVsk7dELUfN6zCcG6Cum7oyH
	77Uhft6pzJ0lItUGsUbA7OId36KJaY5Zz+KZqKchDzW4kYYYWjDtqK3BxKhCmI9W5
X-Gm-Gg: AeBDietnQk9WTefvjGJ1BtXsVpibk/qAhJ1TqOYbSdQ8Gzs+5MAg/89Sefu+L/ezHrW
	G3RUyuuBp5MQesyQUyUaj592sylRLZnsu+zC0Rq8WtmDdwrPIzuSpNj4wwHyOGMoMLoq7106iE5
	ODSTX30fgvy4jDx7Rsop30mrhtWcp8iweMLCmtYQ/+kGJD+SwDjyBfkbSk8Rm5/RLdymX584xVL
	dCQ5OMPDwlmqjTgiN7I88JbNCcE3jBNgj6Y4kcnNRuDVJ0hh8tCdTrG7yIEtqOOMlGXw+RXFD2i
	1WfRCkNUkKRfZejK2fSgNxNMIObVc0PsHIVsiK2/LCXEBHV00QUcCpj6jv78ckp8M4YQjR//FWW
	XCoVRnIars+J3N9jSVKbn/jVTmKDXoYHs6jIJm2Glp+PiMGHO77fAHJ2xBbrNp8DaQk2FKyD7um
	qviN2g6/hfOmAkS1dBKa+GvYYtW3LR6uVbcYtqIdN/ApQz/w==
X-Received: by 2002:a17:90a:fc45:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-36140468f71mr42967999a91.18.1777279321765;
        Mon, 27 Apr 2026 01:42:01 -0700 (PDT)
X-Received: by 2002:a17:90a:fc45:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-36140468f71mr42967976a91.18.1777279321311;
        Mon, 27 Apr 2026 01:42:01 -0700 (PDT)
Received: from [10.50.4.70] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc593bsm38705687a91.1.2026.04.27.01.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 01:42:00 -0700 (PDT)
Message-ID: <1cb7a0a5-4bc0-4391-9592-3909a627ea96@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:11:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: glymur: Add QFPROM efuse support
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef215a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0rvPZX15ANotvEkyALsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: F5YuSd-CzWURQKoN4QLQRgTXNQuC4FIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5MSBTYWx0ZWRfX0Hx+94z7kaOi
 21Jzpl7HcWBM+WT2rc52Cm+2czxRNVyAAFQ1db83dSOKoz+9JePSsf3FSa/Ejb07tfd/ZUcvMv/
 DlvaR2TnrDHlpqp3uPD51xYyyJvNPEFggcFSQ6tqsFJGVsRdOTcKU8SUYu2f61mYLiwUWf9kzvG
 IwPWTr5Na+biueMZQk3/aL/LhHCPOWwMZG6Y+gnEZNSYRiv2FNlWrERW1t+lFu0+gWHeXNsoqPU
 /OLvyUGkn7TwLzyHV7/Pri+F89UG1yWjgztAi44nR4umZ2deY7ePumzkD0pTlLbDG5m3hQF1wBG
 DRIGeTAfOOlR/IJRy6B7hRcrkW11RjoMC7zx9TF6IzHipy3Q8p2NBN4ppEq/qKAPedo3Hu/FfzJ
 YNzfzdO0qHgQLViH69FR6fFADj685uGEREM+y4qHLYSOCwKke5TPMFfnhyJ8XSvK7Z/zNDU1tC2
 ybjGFWxRK12nVuKG8ow==
X-Proofpoint-ORIG-GUID: F5YuSd-CzWURQKoN4QLQRgTXNQuC4FIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270091

On 3/31/2026 7:24 PM, Pankaj Patil wrote:
> Add dt-bindings and dt-node for Glymur QFPROM efuse. The GPU speed bin
> child node nvmem cell contains details of clk frequencies supported by 
> the GPU, which is then read by the GPU driver to select the correct set
> of operating performance points (OPPs) for the device
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
> Pankaj Patil (2):
>       dt-bindings: nvmem: qfprom: Add glymur compatible
>       arm64: dts: qcom: glymur: Add qfprom efuse node
> 
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml |  1 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> ---
> base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
> change-id: 20260311-glymur-qfprom-51c7521e4da0
> 
> Best regards,

Reaching out about the patch series,
Wasn't acked and no outstanding review comments as well
