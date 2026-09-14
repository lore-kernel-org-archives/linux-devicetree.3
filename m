Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD113F5BDB
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373651; cv=none; b=O8AxOfSWvenDylB+QXBugILBAeOnYm8FnDzWZhdg7wgd8LmcNFHmbDwLwcM42lOXBpWTyncZV0WAa74hpIkuqZ+y4kAyzPi9l/FsjYiK78j5ZujYqOcgNJs/DzQ0JrYwk4UhMrl9Y+D0iA5f+1PZAezXthp8byLvJvBtkTjxWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373651; c=relaxed/simple;
	bh=y5T/F7vrssXPrR0h8cK35gqPOkp5meOnh4qAw5/OTjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UCOEzB5+5vbixna5QlIcNMTfhyTUmL8X2yyha0rCw4fiKIeK3nfIvthUT8GAVfh8b2lbHyv8cVKAUA/osVL27ASw3OBsJp8b21NJcOhVSbHTt6uwleeBzeoSbJDxxb1fzvbs0Iq+0uTr5Y20W/tOr1BFbU6YUoV+bLHjPuk0hQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU8XY3+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jb6flQ9A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU8XY3+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jb6flQ9A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jFpn3842394
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=; b=dU8XY3+QUzdnFCrd
	XDVzW3ItUiB9RsOrZ1WDsqBO+rh3UuBRdhGY4dFeIMNuHRB09bsT4yKHg7d8mH8S
	IoP0yKe1QhHTyvix+X11/IER18drswGDVcvqUbVvripoKm9ZinF0yBivsBCEWiAZ
	AL8+ZjQtIAQ8CaSCsy8SuJJAW9nr5Fp7SHjWqcTwhvR9ZzNDL7fMDgedMZQhXuq9
	B2eRh+4wMsEEBqyWOvbwsGAtmrUrotF4CtH54lTFnze6FiJ4b311mAtecjYH+kBi
	zSOqCJJfJ/U5F0ddYyuDhab+OIG+TYwoChMyXSptzZz5yyc2zAOKftXoVnuotxzk
	xTUAlQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5pa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:14:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f4002c1aso35809985a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373648; x=1789978448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=;
        b=Jb6flQ9AuZ3AGzGREQ/C5vAMrps0GMVSLRbB8/7D7wSogM9hmjafchHm51+UiI4/yl
         GZ4oe2Ut+FKXmwf8MmNnOE+pLtqpJk+UR/f6tVaskGMMBgdwPvY86om55aFAExcvO67K
         +uz8Vn6NlX1+blcoIaK0WVrVk19h/m+rsm7+gf5H4LsVJAB3JuPGqEB+raGW+6AFn6Ak
         WyCRTb3CgI4BL5TRn85Ypkkc33MrwdFT6X3FKcagx6Xg6ctM2/10M2Al1nNdWpx2L6ZA
         dLS2RAQyhCQAdh8/cxXE2AHzLP82TwZnF88ofhSw2rzaI1DlOL5jxAZJs1bhit3/UPuV
         n3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373648; x=1789978448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=;
        b=bhZx0ynmEyVq+/yu/wHY07w9VhG7BwDZTTu03kLdCB7fHqyggSSyye9TzXWMeZWHHI
         z1+lW0rhGl1YTAOjP+rkdM0T/sXVp1yNQ23CyZpGvb9TN/8R6QVBMFaZmEyzfKQ04B4Z
         JXaaGiDYWUWx310bCOClsWYIWtKwCvHM0HxXV0FN7iACwB2Ms6wbkt9FKsr9wl/B+brZ
         TzBN171QUSEV8lJe/fkWp70hH6zTyu2TnsMtIFAyznXhh/yyYjWJd604MSphuciWGSZu
         q6N1xzb2n8nNe3lukRFrT+BB2SXBB9wSu3CDpkLhsO6C9wivEy6vjtf//CkV7/pCABt7
         gTiQ==
X-Forwarded-Encrypted: i=1; AKwUvByMKqepiSNdz4DS308bLUbg2AV1qYa0oeRvbJWUs/bgYb/6S6ZGOBz44JABLrYpSJ1eou4SLf6rqNfD@vger.kernel.org
X-Gm-Message-State: AFuF++kIskq1zrWO6UuhZnXXFieMGlgHZ56R3dZp+0y+MyJMOPsl8XZb
	gSWoOG6/+380RhXuqwQieIYa/MkLgy8kiGimc50CCmcA0vrq7II4kqZ5KEKOB/TSA4eFJgMwzmi
	GKY7rrZL1yrS3Ed6grYcRcxSFZgfFJTu2FE79HaI7WTj61iBUoy8xNgwWypzjSR8U
X-Gm-Gg: AYBFou2+1qmj0nXoE2W2pK4uMrmjDPCt004IVlEVq663gOi9kglCGBBXnAy9O2xkRL5
	u7O9YvTb5l5/ToRcKPj1rFWyb6DQcY7vQmZYdnS0dypLL5ZG3aY/pq/VQRZpkecuewEdp1j1pqs
	JjcGOO2+s431TyEhOLMTOHcVW3ogCeqxSCFJDI4RMjIwe/TFfymDCYaTRJ0T0WtPuOheQXQftmT
	6NjgEmR+sNtHtCbakqqaqgOGMRaFIx9NwM6T574dm7uccWy469LwaDzSJWiA4TFie+su3JkxQZ+
	Ct2mJdudG1DcdPOJuOhA1fWm1O2LRZHEidOKYKIqymD5V3a26YB3RVUURZt3szhS34y1QBKH5Fr
	E33Rx/+GzRKXqHUOva69u2g==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr167361385a.5.1789373647752;
        Mon, 14 Sep 2026 01:14:07 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr167359285a.5.1789373647409;
        Mon, 14 Sep 2026 01:14:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e1ffsm376092166b.7.2026.09.14.01.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:14:06 -0700 (PDT)
Message-ID: <a66a9afe-f649-44f8-ab13-06455f95ccec@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:14:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Correct inconsistent indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S29rH775Aws4IqKnZYD6uByD1JFIH6pN
X-Proofpoint-GUID: S29rH775Aws4IqKnZYD6uByD1JFIH6pN
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7acd0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tPLuR_csD6jfBswSsDEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNiBTYWx0ZWRfX63rTPioEzD84
 zfrE1eRWIGn0zfsJurcY+kZfdI6u4XrB1tQCv+CR1qLCG7WT9laPC0HV2q+tkhuEoRs8BsEfd4u
 iXVYeZ6F/rZR+IWnQ6ZwPBv7T+RHnt6Xj9vfz2USjqwwUatMhHI6cvFtOOLBSC5wyQ3Di9VIrua
 B989Vhy4tH6hDdtnjP0p8qXiEuHg20i4oyfi8I1V4SxkIyBF49/jT1DFLYkfyFcys8oeGub1cA2
 Cwp0u04CWWMhU16VB2azWIMDQiz6DjH75c7xswZ+5g2rAVydDv4G3U6WGdesUh1uK3NV3a8yjoM
 9CVy3vRDTw47U2WX2ntMmTD9CLQ32C9eRnvkN0woKg6BK827z0l9+MxJmoRuBVCUlSKgBz6rZUc
 W0PoeT6k6v+LC9C1hy7Dqcz1saOXPgdC1bkfzaqvVd5IzNPcFLkb/HOE2OyhG1LrVXRGaq1hYiW
 91ZSw+Oo7SnRA8oSDZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNiBTYWx0ZWRfX+cFwONkqKqkM
 oJ6QRm4o48nazUmZh1pZj4E1YQspXiMrBr60EvG3T+qrKxsu6PcG+FjL+qgG5TKwlozqX555ix7
 AXf084TYTNHIZV5ctwD3f4Db0HiK1Q0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140116

On 9/13/26 4:14 PM, Krzysztof Kozlowski wrote:
> Fixup mis-indentation, e.g. spaces or tabs mixed with spaces, to fix
> dt-check-style warnings like:
> 
>   talos-evk.dts:39: [indent-consistent] indent mismatch (expected depth 4 * '\t')
> 
> No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
