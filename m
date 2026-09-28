Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4120B48662D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585400; cv=none; b=GnnM2FgSVNMix0HUL1awZLormATODOn3ptU9srPfZ+udyZpJRRXg3xu3t4/9IrPCnhzCV6RFEKTpXOSD11r+VXwrxF2TsxIU8sPdND0hrCvWJuMnK6eNWU1HXt3RTgEw/t/6SRDrvqg7jmNwl2yvFO5q6B65oeb19XeqwoCe1Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585400; c=relaxed/simple;
	bh=/o9hluNrbnRR5o5W2f4eH5nfBVQOK8na//h4p2fkvKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KN/HDMWWRx7BW5MKPqrNoeOOu5FSMnMGaSOD0wDL1fhJ2wFCPbw3cisQZbc/e5W/CZgDW/GNFkDJ0041OWqGaUgkREMQKIpaRI6oGcZ7D5KEOKaH006TXGizwety757OiQQor+0HaIkT10JssFR8ouPvRbpSv0H+ropQCU2Trvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eu9iL+MB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EL5NBiEq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eu9iL+MB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EL5NBiEq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xdtT1982748
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQ7ekHQSCnro0qR7M7Y4+SW7D/6YqyhuCVY6Qhj79Tw=; b=Eu9iL+MBaqjjGync
	DvtDBLN7sgL+dQxUV8oRdllt7tEf2wEGFHpMr2XmyKr8Rn7WXCZVNyEicxGwzV+w
	fI5M0ODEsevweGUae0nh5UtRISVW9EWrtotFiOaE2hkFhSn0mdlBbsg4UzBbWA7O
	1CYqRoheQtDB/Ccwzk6bxq9SJY8eyJlGReE7WmNtiz+42cvHSvZpLcHRKtcGyObU
	HqiMvHvavr/HW3s4V0/hNDZrhYhZAa6XFrEG24IkiPh23IRHZnb5aKVqD7eTxjOP
	mLsLajyizUAJT4A6E1mH0/I7gXaQX4T/E21HAQLZqa2ajL1GpCJhhIbf6mKa6Z+b
	PMB0yw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t0pn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:49:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so760706d6.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585396; x=1791190196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQ7ekHQSCnro0qR7M7Y4+SW7D/6YqyhuCVY6Qhj79Tw=;
        b=EL5NBiEqpcPCb+etQauCt6i6IwEOjZ/dRKyPvNhFErIvudamiM81aE8oBPoQg9j8hY
         Uk9sthXgzEI6k0PHO2087xCctawlEj8SeGpVDZdBmusTkeSKWivWaUJTsoBPu3hMJVVQ
         UZPBdCQSOF1m8keV8AMv2UrwXGVpc7b7/FoAnBw6tE93qt2F+m/8+sceSHJL8Si3d1tA
         XG3lIsTFdG24REYyPvmKgXHPnCFsAIx1IBaDThvue/GwDNFKPfJk5swFB9yxyAKQREDs
         bk0kp5piRXuGn4TCE8JgKq84R76ArvZ11xJyxJpPCfTzSWWgeoU3eoz5FnZhHwydnVDF
         q7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585396; x=1791190196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQ7ekHQSCnro0qR7M7Y4+SW7D/6YqyhuCVY6Qhj79Tw=;
        b=oGe/NM0BqWrRNXJDaUxaZWHbaPNv+xacJIfeuw+P4wfnaSW5Uz0xOLeZIA61UwHHux
         XXqrdxqgd7ry9n4GllMKJ1lhHEWdE2DyuyKTgpgFg7CnKG2g+rGDBaEXfaKNIMyNKFiW
         7p5GXbXkGQavsR25bslYzj3mm4XgPHwSYxL2/TYnTXCaEUESW8djZcjtoj+r57OAMa0+
         xjHOpE5SJjsYuvzah9PJ2lEbephzTOqqB5Hv4ghAe1xYjI4uTnUG/N81PRlui6gLsYw0
         F+V+44gifUHo7YhyBWD07dm06lnouF1mn2lxvKEgXdx/moX5MmlqRCc2pVqU3fSOUhfq
         Fr+w==
X-Forwarded-Encrypted: i=1; AKwUvBwatM4egB1ULW5QLbAEFdT5YwuLRd9wSDftmYk7u0pp+77WkXHbvDakBzsKW6watOZvrwmvmQ8pw05j@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3v6TAqmPhkyo7yN0cRtmWB1Kplkc5hMKAKtVPzPHHz/Ph8sHR
	uWb+YTYKxBviIJKcN97zWwwxiqfV+FJYjLwZi4BVirUT36nqgbq11KCQVP+Lseq0odkDFCzbNsY
	JITSvPNiOQpxM7CpAvJ6SsG70B1G2Z2lu5h5irpCNZsssOE7pekHOyoxfXCNj5h3f
X-Gm-Gg: AYBFou3D7gQHRc9WDy1iWFVajSsTKYQ09I/bjTmr+AEph9grRe53MbxVBd610cMoZ+h
	32KQXrpoH5HA+hxTvHhyO+gXcMBgZXZ6rQFPETClG4Kr1ffdv1TES0eQFfnIIhoh6P7OO4uiZst
	T0ls7YKEX3SgsPQlZeDYoTn3vJZPP0ipO2chytNbcC0FxEfcX5L7T2qmnLk14+bKz6YhN8rDdJF
	D+SgGOGqPifW7EJWxtpnUqXdrqpBuMY/FGpzjANfyyshnvVASVULghZOwYWVvHac6HyxLaUy6KO
	LrWq0x7L43pJsXz4nGxXIWgxOyanLgMvsRC61hte7KUfjc9rky1z32DlGngxOMMEQ+mSt4F3pxR
	RfjEQrAvqbblAdZV7go3xWA==
X-Received: by 2002:ad4:4eab:0:b0:914:4bd3:d96f with SMTP id 6a1803df08f44-9144bd3dbf6mr119184776d6.4.1790585396533;
        Mon, 28 Sep 2026 01:49:56 -0700 (PDT)
X-Received: by 2002:ad4:4eab:0:b0:914:4bd3:d96f with SMTP id 6a1803df08f44-9144bd3dbf6mr119184486d6.4.1790585395874;
        Mon, 28 Sep 2026 01:49:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dedf66sm3978860a12.23.2026.09.28.01.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:49:55 -0700 (PDT)
Message-ID: <18088f30-517e-4593-8ad6-3abfee23453f@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:49:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Enable IRIS video codec
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX1nDQYYclVXrW
 1cTjt2r8zg6I9aDKnOt1IyGqWGRmpcOy09Bm1E8i9MtRMcfcN/dkRG/Zdsw+Cf6sl0Flyc00Cyc
 dSrKKBLKbCdn5LnxSGKsQmgcv+bfi4rrfFBheE0u2bxr4795+fc1gpm+qkKy0o9Jk7K9D4ZVTHP
 nI8KM+9WOXSqxxFxdkLgHEct5NdXyHXMTFNco99Hlo+1CqtgFV9sIe1cH8/ddj2Q98sc/lWt1Gb
 xd7BxY0RBAuhu7ioq9xGJ9rfTi8cZnFrwBIq59ViVRy0mU+VyoK4TPwk54BIY6cJ2hHAsIbhMZP
 rdSKKRpl+V7Bn+euDssDewgWOpx+cavpWxVd1OEkQKB/IGoH3OBShFs6DfHbDDOUe/tf/RbneVj
 nABXu3YPSmsNBxMPQ6TMmFE8UWNE2dZpGYijI1povRyqiid7qwICUwZ+WQaowVE4vuNCfS+ZBv/
 r/xBghGJYR5dMudjBbQ==
X-Proofpoint-ORIG-GUID: J9_wulNYfrr9gqCZ1BzY9sKaw0E_mtg7
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba2a35 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gHjZUIugi9cSBFQiOBsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: J9_wulNYfrr9gqCZ1BzY9sKaw0E_mtg7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX10FirHWDiZBo
 x7Awxq2K+NRW4v6fKEiwMT6QJts+RkT49e///rtkV5vK/WPxsPOTtrOm74sjbpWzWn/UnMw6BAK
 t7eTd0K6YetRsa7wgtIXqSJuVRAlKmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280035

On 9/25/26 10:51 PM, Dale Whinham wrote:
> Enable the video codec and point it at the Denali firmware.
> 
> With the firmware in place video0 and video1 appear:
> 
> $ v4l2-ctl -d /dev/video0 --info --list-formats-out
>       Driver name      : iris_driver
>       Card type        : Iris Decoder
>       Bus info         : plat:aa00000.video-codec:dec
>       [0]: 'H264' (H.264, compressed, dyn-resolution)
>       [1]: 'HEVC' (HEVC, compressed, dyn-resolution)
>       [2]: 'VP90' (VP9, compressed, dyn-resolution)
>       [3]: 'AV01' (AV1 OBU Stream, compressed, dyn-resolution)
> 
> $ v4l2-ctl -d /dev/video1 --info --list-formats
>       Driver name      : iris_driver
>       Card type        : Iris Encoder
>       Bus info         : plat:aa00000.video-codec:enc
>       [0]: 'H264' (H.264, compressed, enc-cap-frame-interval)
>       [1]: 'HEVC' (HEVC, compressed, enc-cap-frame-interval)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
