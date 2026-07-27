Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593A35F184
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 21:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785189344; cv=none; b=opydMq/4g68Y5RZifM4UeKsZwAUDh7bGpKW2B76Yur/700eVMIMLKH4kQk48oeC7JpeUCQQbu2HE+IvKUf8ayhzVz5CiqZvDk+vPOzdYuVo1W/7ltZe/44uLFAIUP6EwTObK5Xxw6WvBmUboaDkdLeg6TLfwhfE+T9bbaH9+6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785189344; c=relaxed/simple;
	bh=Xg9+AVCzHy8NbNUU1LGiXJXq02obSR98/4qeCANO4iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndWYV8DrMnypY7PhWtsGiKD8W5VUv5oX5iRbfIyim6kmTDEkLWhvBnCK3tOIRmVQt6r6w8T3WbhTUpLocq+P2a8za1c3V/qhF/PH0wn6bBnv69FxDo+aENgtUwVmXmAmYqpVUifF8KGcRICJS2OXEdRvkmN/aVQVbrOA1BFIapA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk12t9ke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7S/zVoO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk12t9ke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7S/zVoO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RLbbOd977144
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 21:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmAUyN0oqNRuNyETgZDxqhGN4d5/+OPdgEY/zP7uvtU=; b=Bk12t9keQY7HR0MP
	IPBrQoXex8NwKCisYvpq+CA6rpJBfOu+01rfS9+MOq1AvCSdK6Vl6ysxNtzMv7Hr
	lflMcVfFCLUAnskcWvhTg8qfsE7SHt6H74YYe0qkTVUcpxXHHt01rPAFjiNHo6oy
	htLOVaQmyMAasKS666UReLlvTjGgP6sgDl7F0WOVPBg4JZUCyFi9MKG9mm3ULLTQ
	qv/lvWry05APhwadhPFLtXBBYM15tjZ+4edD53VXhGpNViQ3bUQz+rNTeZ/DvLfk
	tikyhAx+vg1Wdn4CO7NKEgngxhCxl1OXEPBhPgwEEQ6WY8GeE1Vly4aYKcgTvvT9
	DTp3bg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mru70n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 21:55:41 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81ebb5e11caso78127437b3.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785189341; x=1785794141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmAUyN0oqNRuNyETgZDxqhGN4d5/+OPdgEY/zP7uvtU=;
        b=Z7S/zVoOu99golfhRzf3pRinfj3QMUg0wqgTTsYEAOnrxy0d7eYUKLFHAI0Eu1P4Ys
         /xOTLYo77Fv5bAeSte1FxKlBeg2Vv4M4VwvYxnZHgxJeHML6V5SyO7lGG0dPzSQGxPwA
         tzuIh7K9/k3XKzSJa7FlAes4Vytjc+81BtapguvVH6IPOH5Et4rtm0BQuDHsxltMEXJm
         7fqqrCsImOMPnm1W4TEOqVJff8TRaGh3b+gkVAIIF814TZiwOVXgYZtUmqXLm1pWCZfm
         wIlC6mnPp/KXqiXAITLBu4UN99jqoFHdJjLHi8dcmcA0as+iyXL8zXlO3jfiaLb6+BzK
         PK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785189341; x=1785794141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmAUyN0oqNRuNyETgZDxqhGN4d5/+OPdgEY/zP7uvtU=;
        b=l2XFmpTckWuIpmANA0o0uHHZFbGA8lhM+2mXZH0sBSXVRcwXginEP8ry5QHm9JbIjU
         +hZnGkdGJAWrLLvlAu0+fzf4b5ZmkIuUyggf36GBxdaSKYuY5WPtjUep0kUxJ88UhhKk
         JAsAO3B6T8qLWU1IJ24hcLADXFpMrqMZx5/jkfGlfiLjDMCGX5pOvWqOxuznT4kvzUF6
         PlfgU5l66HJyjscluVB1sS2VUxv3v99i44kOCNFi2VlOxICxqO4qniChoyBtR0lPks6Q
         +hEiUA6Pt6De+BgbJ0GbxuK5r/dCL1kPy6SIrwuEL+pUBmw4nJ4Hcx4w+hDrRNKEDEMe
         54EA==
X-Forwarded-Encrypted: i=1; AHgh+RrImY2qvyOaSy4ifQOFI/KRr6Kj7yxWcaOwmzhvu+cDz2JYMvYQC7/x+kYK09o+UUv4i8ExkkcAuLY4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4922baXFwcj1wcdRqOkSiu2q/zeDT+nhmfnBEEbcmtpUu2CNx
	2wKrlbFF7T35sX6FRlFfQP4/uglJm/sX/J32oROAFjeqrXNm5FQeLtBBGFEkmYpH10QDm9l5w9y
	Er8A0St7oFn6Ev8qp8pLmc0sIAfyt/FFZqPV+hLpT2b5PoiEGttmECpDr6v+8rLii
X-Gm-Gg: AR+sD139jayh8kpISjYWs+p7Gk3GA9d0kSnAAzdmOLO3euiRXfS76SKJ2rrUG509DM/
	mqwTnNJzAXPWjHo4cEHzwGf/ZVYMKfhcmu6gZqPlFHKrh4cETkjJsUtDxXtGDf4TPzV4V/Ge39c
	Q9bdsXbqSKtai41jftH7qHxzZh2n3dQxCmlYtBUbMxWP84rvCNVqYLGR+WCJWI3xN4eVjfTtDh9
	5K1381uAOfxbzrJ6mXkIPu0Kuz2QE3PRxbiYxnjLajbuPHBZd5mDXE1ffWqWF+2MV2h/aFNvKBJ
	rkHb/6sS5Eb6yHY0utr6YpFPn/ePsMZyxtpkJlcrjJnX8b3iQlcouOryd+J8BNULL/LHtV/pCrI
	h/uBhL0FfQ/KWU0Co0ftW9bTKWlhnSFJcVBO2UKjlLtnTY3USXbGFU4LV8dqFoAOu
X-Received: by 2002:a05:690c:4b0b:b0:81f:650c:98cd with SMTP id 00721157ae682-81f69d434f2mr36121837b3.28.1785189340903;
        Mon, 27 Jul 2026 14:55:40 -0700 (PDT)
X-Received: by 2002:a05:690c:4b0b:b0:81f:650c:98cd with SMTP id 00721157ae682-81f69d434f2mr36121677b3.28.1785189340509;
        Mon, 27 Jul 2026 14:55:40 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:713f:91ad:a282:60a7? ([2a01:cde0:108:24ed:713f:91ad:a282:60a7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6576ee52sm38153947b3.3.2026.07.27.14.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 14:55:40 -0700 (PDT)
Message-ID: <2068a530-c749-42f2-9c6a-271e58e435f2@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 23:55:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] remoteproc: qcom: pas: add support for TMD thermal
 cooling devices
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-3-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-3-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE5NyBTYWx0ZWRfXxiTPq7bX/KJ2
 qIjL5K85Hsj5zwOu7gc66PqqCIEOHWTTGoHIwWd52rBTTH/yRpVwz16RpbyhsIMnofsecZeEXrg
 JLI14vHdkBoDy5cWPTFKSF2MNoSqwo0=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a67d3dd cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=dQw6EPwHR6TCfMdrzP8A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: kBEkFSC9-LLRFHt9fjUoxag1vNbSHrgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE5NyBTYWx0ZWRfX6ZuNp9PN7YWI
 vQPYYIDETrJvOLpeHE/beQ90rY4DScKDDk+etAN+NXMj40svf61oWEx0rf3sUpV6yLohJL8rqry
 Ipt+kaO9o6xTR+53guX3lmIOMBms8GtIl2SuQCJouDtaS0ySEMmTPrTNjT3XV55KLUsDJePOn/V
 U2udUtP6ZGQdbN6ToBS4b4LadUff3KTshWJCukArX5N8UQWmYsjwBiKd3ztwiBpBfI/2vWDfoBu
 04m0ppCDJZyME/H78xHYrRZWqnDV1Xayfg64yxOlc+pvy9ULZtcztCNNWvgDgXCoLFT/wZCgN11
 7fzM8BZ/gqLjqkmfEd6qij0sl/0POvAFjBD94x/uvXeweKDK5HixN/PrtBNcw3THgGizsp4z0QY
 9zFCNd+i0CA4gaE58dkqgNAoXq9NV9caQhG8PRHWIC9pdB7xcCWZ2f5dCBjqApBPEd+Iaz2YFeN
 4L4Fh1CG3TyRpiT94dA==
X-Proofpoint-ORIG-GUID: kBEkFSC9-LLRFHt9fjUoxag1vNbSHrgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270197

On 7/27/26 16:22, Gaurav Kohli wrote:
> Register Thermal Mitigation Devices (TMDs) for PAS-managed remote
> processors to enable thermal throttling through QMI.
> 
> This allows the thermal framework to request mitigation when remote
> subsystems such as modem and CDSP contribute to thermal pressure.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
