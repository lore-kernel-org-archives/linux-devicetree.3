Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE3D3ACA4C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040161; cv=none; b=dvQTpCMvw06iTMuL0jz83MWDS8o8AZxhM1KRYX5D3LbBXSn+gttAwZIADVt3hCeysAeQc868e88vp8/f4oTMOHU7cy/NrH70qU52WjEK0w+gKfUbSYEBQ+Dh8tYIT+w4KxMY6nLGm6mLExsMDHkyJWQbMAP62jbw3ejETBQRQ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040161; c=relaxed/simple;
	bh=UsoWPs7N3ck5RGgeIsP+Un7T577ZXuJXQ/V+C6Km7GE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mHb/tHgYnWj7NNAdZJm/R1UXBqccwWfcfHWO+EmF2vM995jr4luW4Z0+KX7nctRR2o+vb5UwlOffs0sz5brjlEY37UlE0574XB6djTsGqfhQpxUp/P4O3zyeTKIUd80xjuVwkvUmpnPv9IF9yGCUslyMsP3jE8TcV21tMOYTGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfc/HQaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xn3bsMgQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfc/HQaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xn3bsMgQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6q9pI2118169
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=; b=gfc/HQaJE7KeR25V
	LXYhHXnq8EelULjK9elSFkSt/qVo2Z5KZ/VHbe03/Y/vF1lq8HqQMSAHx1FVgJJ2
	F+mFw8cRLa4TUqGos1FyVkFX13LK/PhEGoH1bmnvF7hKHOn1hInp8y/iYGLzJXVM
	ascH2dsPxpdkFmVYAoibepVWOY5TwuuZZlQYhlOCb9U4z7EOIjrpprhATcR351bM
	LgM3cLN4sAI6OCfy2j8AIlwy//bwRmE211/kF6un4uSOmymyEvdGaPFje+6DFya+
	/mNLql+3pwGGp6wUkQnbTQcsMRtrqsNSG+yirb1VNfIJjjLB/XyAIHcoFy64a7Pb
	qMowUg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5ahv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so495585a91.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040159; x=1780644959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=;
        b=Xn3bsMgQewfAdq7OfKChk6IBke755sCJwHa8JeRcta8/RLhZWbbU8QW+bpxOXscK0Z
         eEqSSa3FXRAI4G52v/0/uo3a8kU6zFX+mDIx34eWDmRTizTvZ+SHocxvgiH0MXp4BpSq
         fkqWO7l2cW2rsvq7+LIUgXx8ufeu/gu0xx97K0IOurfvinrzphRAV2m5CBCA8yDLLFa+
         xvl8lYoZ9PnysnarGo4dl/6pfj0kmmM8aFkFQXsVknG25KXosPAxJvLDcz+dOu0MT5X+
         IllhY0Sp7zGXQbcpT2u93di7CWZorV2QQkR2AdCWdg4fN2sf+4FZUHOpLAaOGaRx/yDs
         q8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040159; x=1780644959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=;
        b=L0lb49E/OPAP1s0hkLyofENxPa9Y/JvLq1eMHeHnvgmJTmJrGIinxYU0Z/U+jsbzC0
         avvdyxrCcAkg55QrmrADgr65k1aVAAXiSvoqVCcR1NyT9/eYOPzezHO9nLGaGAJr43Pt
         pQCC0t6+Kd+D9K2S86o4IeghWIbsT5U4OUzTsM7PkP1bxlBRxsHQypH7h6s7twYWR2M3
         6RX4CJI1WEKzCo3C0N0ivTR48QM6AmA8DD5nFIYNWe1BUa26xiL+xEuxSGcIGQaN8gCU
         5y3WKCLeLuFetSLElFOUUu1n52aP+ridFEkhWbmulwS48URhFZkjbx0F+69t+k0pLUug
         X1Xw==
X-Forwarded-Encrypted: i=1; AFNElJ/5bsnoxuT4+1KDbjgp4GJV5eYX17un1ESDccr613RL9XQrEo9S7vKRgGQNJn2Myaq5+5RjbjeBiKKB@vger.kernel.org
X-Gm-Message-State: AOJu0YyU1sYU84QjSyWHjmnvLG+AX9gCqZEPK6CNsnftdU2pEYXxf1NJ
	5U5D0hN6y8wN9UYY8YP5V7YO9h+UU50wduO5IW9uHwicy6gNk4MlpTCJkYQoTi6JOxAoCDgc9Tp
	vHI1NdDqrOt0b6CUdWrY2KRh6sMbroehDp6szD1NSuA/USW1+RozoPHw7iyBXib3R
X-Gm-Gg: Acq92OGaRu0TY/EwT1+h6JquWaE+VHpXrxSKPNde0vTHlgL6PyzkzrF3eNrCbxmUSSR
	CG7OaOfotfZ03agoduM19NKsVDdx+/kvmjTcMBGPvu+qFgvSFGrMf0IpamqZMFx1/XNRQQ1iC+P
	C9HOx1Bsa59wN4a0sMKxgZE4MAPoqo2WQubMZv2f3/L7FTHEh4RzZBp6OG1Jg0NGaRVz3DAeIYP
	7Ct5/TcyXuhtCYx9utbpNNJlHofdND9xo5IZsuUoPU24WybWhyf0XpU7+h61HFt6ghu4uh+c2X2
	BZSc3vrKKMoumgLI/9+fcTPEPpI1OeW0PkZ1EYMItzF5suI/ZE1jzPSmB23Od+6OhZccV++elfd
	OdfbJGYmzLnk1c6PQw3sXnxhMCZndtmd8nPKg0GqD44F5pPLxnsMhp+khkT+3370P1ghAxRKR08
	1k/EQmvjEPnYMuS2SalYrzlSDE/X4=
X-Received: by 2002:a17:90b:3754:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-36bbec8958bmr1422377a91.10.1780040158855;
        Fri, 29 May 2026 00:35:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3754:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-36bbec8958bmr1422354a91.10.1780040158297;
        Fri, 29 May 2026 00:35:58 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc1c71392sm682063a91.1.2026.05.29.00.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:35:57 -0700 (PDT)
Message-ID: <5b0c416f-c973-4033-b617-2b1f4660f0bd@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:35:51 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] media: iris: add support for purwa platform
To: bod@kernel.org
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
 <178001119238.19934.12836659245627484817.b4-reply@b4>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <178001119238.19934.12836659245627484817.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a1941df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a87e1LDsL6KBLIImkoAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: QY-aOfiTrVNbC8kNAGPK4GuJZHSqYy1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX4xBTBugnfm5H
 9TIhWUGNA8HmW03J4GAh8G7mJitM5Xc1d2mCanBsmtamhrzEKfzfVIS8uacvj+nlYY1JPUkoJsY
 /JTNp/R9U98+fz2LNI2lVZrDdmZN5C1JFKK0btfPsXiXdRxiiWHMRceMxoJcuAGR9v4/gdshchD
 lVZIb+cxHRxczk4ssO7kWQILJnFK41dT4wBU6utLxSkrWeHI5OR6ZLjeDrAdddBPsvp6eeL4byZ
 GmyLFzLog+lVywzgve2N0eSaxGUWpRnxdhNGkDmbGH6gqRdiPahE20l63s5OQarqdpg1scLz0x/
 8b2rW8q9hi8UCIItmy6oZVp+mWTvMmoUUfhUTubSoprmQuUEMOullExIpo8gGS4ExKTb7eC6rSJ
 pAd3igO6obLar3UWxKP8bR4ZCjrvjWOlRHfnnaNtjRYIsVcrwM+zlw93HOPFQMgL2ZAqTZmEnl6
 NWjB20uffD9WNfrapZg==
X-Proofpoint-ORIG-GUID: QY-aOfiTrVNbC8kNAGPK4GuJZHSqYy1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290072



On 2026/5/29 7:33, bod@kernel.org wrote:
> On 2026-05-14 18:09 +0800, Wangao Wang wrote:
>> This series enables the Iris video codec on purwa, allowing purwa to
>> use hardware‑accelerated video encoding and decoding.
>>
>> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
>> except that it requires one additional clock and uses a different OPP
>> table.
>>
>> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
>> and OPP table need to be redefined.
>>
>> All patches have been tested with v4l2-compliance and v4l2-ctl on
>> purwa. And it does not affect existing targets.
>>
>> Dependencies:
>> https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
> 
> The engines canne take much more of this Captain !
> 
> Doesn't apply.
> 
> deckard@inspiron14p-linux:~/Development/linux-worktrees/b4/bod-media-committers-next-plaform-qcom (*)
>> b4 shazam 20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com                                                                                                              next-smoketest [367fd4d05a088] (!) untracked
> Looking up 20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 6 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 83 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✗ [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✗ BADSIG: DKIM/qualcomm.com
>    ✗ [PATCH v7 2/5] media: iris: Add hardware power on/off ops for X1P42100
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 3/5] media: iris: Add platform data for X1P42100
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 4/5] arm64: dts: qcom: purwa: Override Iris clocks and operating points
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 5/5] arm64: dts: qcom: purwa-iot-som: enable video
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
> ---
> Total patches: 5
> ---
>   Deps: looking for dependencies matching 7 patch-ids
> Grabbing search results from lore.kernel.org
>   Deps: Applying prerequisite patch: [PATCH v3 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock controller
>   Deps: Applying prerequisite patch: [PATCH 2/8] dt-bindings: clock: qcom: Add X1P42100 camera clock controller
>   Deps: Applying prerequisite patch: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video clock controller
>   Deps: Applying prerequisite patch: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
>   Deps: Applying prerequisite patch: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera clock controller
>   Deps: Applying prerequisite patch: [PATCH v4 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block definition
>   Deps: Applying prerequisite patch: [PATCH 8/8] arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100
> Applying: dt-bindings: clock: qcom: Add X1P42100 video clock controller
> Applying: dt-bindings: clock: qcom: Add X1P42100 camera clock controller
> Applying: clk: qcom: videocc-x1p42100: Add support for video clock controller
> Applying: clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
> Applying: clk: qcom: camcc-x1p42100: Add support for camera clock controller
> Applying: arm64: dts: qcom: x1e80100: Add CAMCC block definition
> Applying: arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100
> Applying: dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
> Applying: media: iris: Add hardware power on/off ops for X1P42100
> Patch failed at 0009 media: iris: Add hardware power on/off ops for X1P42100
> error: patch failed: drivers/media/platform/qcom/iris/iris_vpu_common.c:292
> error: drivers/media/platform/qcom/iris/iris_vpu_common.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> (venv)
> 

I've updated to v8, rebased onto venus-iris-next, but this will conflict 
with commit 95a337f92f0a602d4f935315bfbc8bf07f475e65 in the latest 
inux-next, whereas v7 won't.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=95a337f92f0a602d4f935315bfbc8bf07f475e65

-- 
Best Regards,
Wangao

