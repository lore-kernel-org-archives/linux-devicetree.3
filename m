Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EB247CA78
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145247; cv=none; b=nj/9EfGERDpihB3tSiTGjSimezTvAlbQ+LHQE2uHMpDk3M1lR3TbNrXk0P6Na1gkbbAN8BdyZJ1CpHhBKD5PRUQU91xrtyu9t2FrCdVg15EDcW1SfelqTSOxyAppAlQHOxM9bA18A1XFSioF0rlnzmqqML9sfnNff4cc2CckhhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145247; c=relaxed/simple;
	bh=svnknxrvxPFY2XhHHB/7UYk5zvriBKO1HYflPEGoWls=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EaKZNQixMrgUbddLtdK5COY5pQp3SSu+to61o0UNgC8OOKTCN5gr1JmQZzDygm7UhpI2F316TktFQrLtAOdNerCOLVEtcpsYGpgQQBDtzn2L6T601w8FG4N6xvtpuYnSlxpcuQ3CX3vm+LPWFFrJN7U1HvbmIjlJvp7o/j6C7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kg4flyau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZUficEH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg4flyau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZUficEH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8luRG1611411
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=; b=kg4flyauA7YvAGA1
	jUkKTAMXw/CPF+ibJ5mBtCM0lCB3T/mgWwK5NzgGMUod8oXD4S/8hR0yKpDAJTP8
	xpgKweJVxIggcCVA4eybqjPQJcOb9rGW9ZITVAFSCvCiRnqzNrVRdR9Cg36x0fII
	AsQI42QBOfQl20qTA852okbLuZxS8Yxa9FqinMVjDi07j9tWzvRd7YGjF1evbqGy
	Bi/O6ZOoz7atiREFHClHWuPdEpi9V4hhFMFikj5VFCfMv7/Y0y1W4CBZh3DQDtpg
	epDN4tO0BcHte9qWpflDYaKTepK2pEe29Jeid8l4xAPZoEgyaU1xO8ozeZSuzFnZ
	MGfWoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3seu76a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:07:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso95335385a.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145241; x=1792750041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=;
        b=cZUficEHSTOEaqBtnWYbpplQBEw5S1faBKZ1FRccMXLUrykTtaSReci7+2cUVRcjQ1
         ECmcmcpWZe9kLlGyq+TZvEoDWo2lYARPZ0ATxSkAfZRWC+zKKsL4KX5Xr/nl1I5RXYeb
         mh/joqrvgJWcUYbYPI7MTUACxvG8jdQEAqeMWUotX9cLhMDZKRVHV9DJgvTP6zcjut4B
         OVP33O7HtWMMgw/d5quEaGvy9rj7480DpkyWNAfzu8TwxDAAmep4BY9SB5tGeQusEQVP
         d3Tsu5mYtZ9yQW2iREFXLPsNszO21schIQhsgO/+XwYtO3eWFPUpBbMQLXeU8Yg6hlnH
         4SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145241; x=1792750041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=;
        b=PubmWmt+hA34Ah3XsO/YBW48llfjglzo/+Q1VLSloE1Qk9H7+CqwbGTlZseUJkjNw9
         GVyWQsfYOeCtuiXNlM9p6/lKYOT7UGWIBdpJcQ/tzOqqTND5sbqVvWrJJbr8I7ht2pAT
         jPtOlnRNcEOw9hOoCnsmsLRbXp+RTlIxEQt5MS53mtsNyPJFqX52eumHAOA88DEku91x
         QqHXiYhmUuiKJSmPONs1WNqQ9Jo/L2c86+V1F5U8eZcL2QepiqP3n/joj3yZnswSiPhW
         tEXgAA79RGqOwK00xhXnp2cjEDIfctvSTt9IqpYqtCvH+18/9Nwl11yevFrxLZ+c3EIg
         uEAA==
X-Forwarded-Encrypted: i=1; AKwUvBwcDC+TDXr1HavZf4F03YQd3xkp+e96UnN7qR0N769n9qWTl2+QwVJDAQmmvU0lBEut3tPUvFcpnRV4@vger.kernel.org
X-Gm-Message-State: AFq9FYKiuFMXqiEvVH1VQ/9hPw/+6ycNc/y6gQAE+qxuN5EiXj+z5/96
	ZgLje4RqvSkanJmxH1kc2MXwpVc/FGN1IwpJOCTnzqyhFFO+DS+mUFenCd8fKKQ/6RIaQ+NPA0s
	U55HrwsZ2R95lIbiPzgKQUOgcVfZETeSoktuhS3Ek13NunOfSXNg1r/7PColf8djl
X-Gm-Gg: AYBFou00oGq5MmRHmQV+1AZfZRCaIqDtScrBcLeKP7xucCnUuN72xvH/e2fvb6hvBSq
	9VgYJwci3N3EtfXS8C6ieAefmeX5j2DrmwmnWafiLOz6lfpvwSbJccLwkkv4c6+cL6oX7WUY7vy
	LxMDCo3zM3245/Ua324BiXnpC5qEY0RwDWXY3+EKcrap7eHKYi37m8H4WAjayoGxfOhTW5ng+UL
	tdawkFwzRW5+sTXjPxZxwdL0PARsE6So/8hWk7vWpQqCepBFIvhFGYbXEfssqpt3fUXsH1mr65h
	P3YNGq4kKx3jtodBlHYp46W5eucJ4qIrTEc8Qq1Xpvlf2HbKvuUWaqnKVGDXGkIXxJivrMLc2fR
	Md+Be0JAxaRj3cVt9SCTZ+Q==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3865353585a.6.1792145241146;
        Fri, 16 Oct 2026 03:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3865347685a.6.1792145240560;
        Fri, 16 Oct 2026 03:07:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408b4a85b8sm58824166b.0.2026.10.16.03.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:07:19 -0700 (PDT)
Message-ID: <bf35b332-1d7d-4c1f-9347-dcdc3ae5c7f5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:07:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bg8OCubJzvVzyuCS65ibT_T4Dtf8AGk_
X-Proofpoint-GUID: Bg8OCubJzvVzyuCS65ibT_T4Dtf8AGk_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX5GU5ggNlJIq1
 Wh4M/cVnpEWT1U/JMgay4WnK7jjUcBZ9JoCwrBwzP9tFrUhKQWoR3VIqNG9t3qXUDTMHmfxRwwe
 PKw+okcdNUWAYd5HOkX9dSKNn2LrHIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX5SLiXLBoAkuw
 IUun3B9QZOO9fjoBKtO3582CP4Kj5MQSnIRuyBs8BFhDtLwe4sQROvOmrX1LlzPC78FMidlhPzX
 /VtoAcIpvfE3jl5uMnEgfnZ/DzgaZGQdMaytu4teh0J6glcDfe064HNtG1IRMywh3ab3iV6eejz
 Vi7ToJfkcTXTztm7wx/9Da9mLxDk7CFBR4326e0Qy3GnBsdu8AnHv71wExQHHCzhR6J2wm7Qkv3
 iCQYpNtYd3LRJjKXHa1LZgxLuIMfLjSpYmt4B3nttufeJ6f18bbqAUn6O+IHJVWEEY3IzUbUnn3
 /rD+u/ajJy+oE51GwfBzgja6dSct7PWlDqDNOp6bB8ShZT1yFdOh0mwRlzRckNjOUSvM+f52fl5
 WsEdp0dhtnQ3DEeW8df3OGgTIW2NdYPv5h1lrDI/ANEY9s4G+xFELIuTkmgSXL1oSMoI42D0SXx
 /WLsIUUl3JBJQthgS7g==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1f759 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=UiK73t45R7nl48eyPcwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160040

On 10/3/26 7:56 PM, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +					q6asm: service@7 {
> +						compatible = "qcom,q6asm";
> +						reg = <APR_SVC_ASM>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";

1 a line would be neat

> +						q6asmdai: dais {

Please keep a \n between the last property and the following subnode,
file-wide

otherwise looks good

Konrad
