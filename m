Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ADE4FB9BA
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975899; cv=none; b=D6vcslv+5ZKjUUvB0Gwoi1dAA9SjXGitA7288SFtyn8xOijh5aBCwyiTbr/R1jp+Jva38eL/Dgw7HBDulriuyiCocQxLN4yMiVOlREjgTw1BGqStzJgEIybVXVm2vOXRlvPdCVbkmqaxAZ37pZy91U95Pz9v06zmdPCnW0bRET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975899; c=relaxed/simple;
	bh=Z3h816ZXGxVD4csE8LYPHv1WBDy5zaS6dsqoEyjpLBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8JX1gOTozXIW3Dc/a/ZU5RUKQpwGdM9vMzPf96Ke4HIBB/Bv/uITuiNV6cN98OcIj+1Lf/+AjMDAa0K27i82rkiQJ4UUREjnbJlblLD8HKbHb65UV/l7HLV2m1Sdz7+eey6+UF1Ehx0gmM3BIyH3OaiTuBxu+zzHoyEPCcAutU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehh42rNz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qe5Baexx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehh42rNz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qe5Baexx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7fXmE3017725
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNulU2JiXUoxqitj0tDF9NlTQTZRzx8RpIvKK9xWQ+8=; b=ehh42rNz+TnsrvSN
	W7q6pgy/4ifYFAd5GvgGL+diTEULLtTvql+Q0VnzYU5IyrbfqY+YwOP8ZxknrdMp
	eF3NJSU2yW74LRUc7O6fuUW9f+xEpnjBH84ERJV2YdcI9d3nIjjs0bPD76mKHEEP
	zoMFmvOWtqoXaM1vtpDw9/Qr4xA4+3yY1qAOXp09KMAZ6Dj0h0DjALQfX8Ip/UNL
	7CLFd1+WRV7bUBNyKH24NGhkB1YuG2yEAZF63Vkcp+MQxerYB90FSGrSjU6bfT8P
	8THc5W/8r5K+5vIdbIp7yp6bFoawm8lN77iIFMmyrO3YJi7LP8YR2XOzyJ4M15M0
	aai+aQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3yp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:04:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so57948e0c.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 04:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791975892; x=1792580692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNulU2JiXUoxqitj0tDF9NlTQTZRzx8RpIvKK9xWQ+8=;
        b=Qe5BaexxWo6EPoWxE22OOIj+cv9kZY/SMyV0Hh7+ts24l82vwiF0Odong2/KBvaHQ1
         Ot/e/aWBvWXE50uzjBvzE4XxfLxrV0RMf4ps5ngO5bA3ugMNBUdnn98DKftVRh3tKO9O
         INZj4vQDWakipiy5Y989KfoTsKr7OCIF8jSFGQ/MhVaOd0qHgrDQkeLGBCN/XUsp6zbO
         CPnJKzdvP3uABz2KLatBTbIlRNL07VUckiqX8Artf7t139HfZVeUJapPLJVyxmRZbKhG
         esF22SBfx9Q7pkQvBZcJsMjFC3DT5nXsSrbSJfD02BaAxi6YTYaa6IkhdzR43hkYW0dS
         yOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975892; x=1792580692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNulU2JiXUoxqitj0tDF9NlTQTZRzx8RpIvKK9xWQ+8=;
        b=pdrAx3MhPCWuRf4EEaSGrDrNfLqBJBrS/w50V6uDE8TOy1YSu58XIr+l6yy3vKP4wr
         3LdBgBXAsbCqNzldxKVk23NB47wnaX9zs0h5qHKInb6gRM7dLuyHLbRPIBXTxrFgrI1I
         7H55M1DVlNv/UcqhqpR5TaZ5dbhejXCEyrbhCPulokiYHI9Rkw+di8Z01j3EbW/SMOk/
         XQiqvgRm6817aoMT5F7ubdXUgCZjT9Lu8qeuL+WKBFY6g/ji9fOKPq1xYMYiccwQ4NH2
         cSlIWtaoFKcdb7wMyMa0KT30ytVNoa1eijpU9K40aE7rC3ZmrO9pRP/c6JBCDKUqm+0K
         doHA==
X-Forwarded-Encrypted: i=1; AKwUvBzTLiwhQ4p4tIWg4WXntaAkZ1rRnc6B1rPfGaK9t9QPhP5Nkjx4z3oATPPUPN8tOsomF9APWsfyJzpI@vger.kernel.org
X-Gm-Message-State: AFq9FYI9turhLIL0s+8Qs7y1d+FgjkSVZSUiJCZY+vCzMvMvTfElcsFq
	v+z4NaLPvpMcvecS0FxI0oFKvbY8bHL4rzP5/LO3cLeYg3lydJpc/D3U05o8fICWPabGoB2G25e
	KsQZj5Y9ZY5XqnvQQW3W8ahIBgNtk2EO8YMEkJQXRDOIzHHLf0j7MoMsmyKQOQT39
X-Gm-Gg: AYBFou0ocDEmtKyM3rrHo2IZXJ60wyEp1R8kiFxdiVDNct6EGhVO4TFUAThwL/CRhgT
	2Zd+BtXD5sSXAPk/BcIYMY1zNXnuJiatIN9s/3kxlw4ffjN7dM3KFg/HPxPE4a5E4X4XEgC4Zav
	7EVAWD6mD/5iO3lK5A9M+z7kTS6+Aui4w6NcgP1d8Q3hjJgNxt1pv++lqOTWPjh1WTH8sRhKE0F
	XWG0heseyvRiAuk84xzDJrz29iPiSTk+4Flr55mwE8HrVFvjWy8UEmHKwHzbCVGBoMDZ9etkWWz
	8RwRZZJBWp35z22ajv/lvxAvPTUxeMRIUwmqcS2rxxr6ppXFE/vALROKFOZKZRuJPrh5bnkNoRb
	x4eZUG7IJQ2mABnLP/WXJ0w==
X-Received: by 2002:ac5:c54a:0:b0:5d1:9e07:8db1 with SMTP id 71dfb90a1353d-5e91f2b155bmr3325066e0c.1.1791975892301;
        Wed, 14 Oct 2026 04:04:52 -0700 (PDT)
X-Received: by 2002:ac5:c54a:0:b0:5d1:9e07:8db1 with SMTP id 71dfb90a1353d-5e91f2b155bmr3325050e0c.1.1791975891839;
        Wed, 14 Oct 2026 04:04:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9762af5sm700056066b.1.2026.10.14.04.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:04:51 -0700 (PDT)
Message-ID: <9fcbc293-2b5e-4b52-9854-a9afc39dc946@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 13:04:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] usb: dwc3: support two connectors sharing one HS data
 bus
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf61d5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hm8Rrv06on9B903gwGAA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: eQEkv947eOz58U_-O9X-QwiJGpiCSPGn
X-Proofpoint-ORIG-GUID: eQEkv947eOz58U_-O9X-QwiJGpiCSPGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MyBTYWx0ZWRfX/RI543TKp6yO
 H68cJ7xuUaBEGZsllSMcdAvHRdbKSaEZwQNWe+CY8OEy/OT/yHV8KlJUT9gPjAn3ElEBxF3i3Yt
 ekTCmQgN1XY7OQIbYXXiKbXvzVWa8v2BjNElKQjubg4ZndplqCPGp+3gFt5O47aDfaEKRVN/4pr
 HTpHn7XYgDsU8ku3Uz9Sj9nIQBZlMu41eeQk01oyDwF8J+0w8DS71EUeWTKs4SxMTEIzAL5fDbw
 gCkH/WWQCsFYrVsUWcGrlTneVCam3v0kcvtiCmehTcl9vzsCM6aLVRLzbeVJyh67evZjeIxHlBF
 J0PiE1ZmSQpW1dXyD5vdqZbQhIt27fkumQfsI/tQoS+S7U2ih/GFLHvqIc24STB3tALxn3xgfjD
 3cUzgTff+X8CJ6odfccW0a8MLPhjcafbpWQKaTKXY1+Ft9TJ4GPTEZ5czlvc8jtT3IV9M493bep
 w+NmCjQc1YTdI3bYa2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MyBTYWx0ZWRfX0tnXIL6CE7r+
 R3oF+u49NEkgbV8pWLNxzDkMajYt61ujjhVK85zWI1zO1HSlgwhXPWfiRI+7kjVVQJqSGsATjAA
 SB3Vrar9GPKI/N4MBvABvcoowdJ8x5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140043

On 10/13/26 12:29 PM, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> Some boards wire the High Speed data lines of a single DWC3 controller to
> two receptacles and select between them with a GPIO, while the SuperSpeed
> lanes stay per connector.  This series makes such a design usable:
> 
>   - patch 1 documents "usb-psy-name", a property the dwc3 glue drivers
>     already parse but which the bindings never described;
> 
>   - patch 2 describes the two-connector HS data path: "port-select-gpios"
>     plus a "ports" node whose connector endpoints carry "mux-state" (the
>     logical port-select level of that connector) and "usb-role-switch";
> 
>   - patch 3 adds the driver side: one role switch per connector, mutual
>     arbitration between them, and a data-path switch performed after the
>     previous host/gadget instance has been torn down.
> 
> Single-connector designs are unaffected: the mux path is only taken when
> "port-select-gpios" is present.
> 
> This work was developed on the Qualcomm SM8750 (Lenovo TB322FC) tablet;
> the board device tree is not upstream yet, so no in-tree user is switched
> over by this series.

This is an incredibly strange setup. Are you sure it's actually how it's
wired up?

Are there any hubs or other devices connected inline?

Konrad
