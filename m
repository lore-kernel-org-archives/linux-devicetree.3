Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832A93BED18
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030718; cv=none; b=Qtoau5O4zcHlHtMwk3ZjWA5TvbhD11mYfAuS4hAAuUxUdaIbSIucpsPuniw4JthX1l1yjPTABC9re6L3+fV3b/f2Fr5FoJAyu7Iz/a/bjjyz70x5FJQEKmzYRE3pSyh3rtDXfBGA0mFDauDFYA4Cog/G0x8Ra8XNMn+BFEs335k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030718; c=relaxed/simple;
	bh=rSzN7e9ZxTD4WFp8PWPh1T4J7BMP4rhtRQfSs1Q03mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQ6Tf7xnD461gyh9kgK73ewITmGQJPr/KrOqzaDLvyuecXwyc//eR+3BnnCHetzO5dd5oqORLYUvxWrIMwqJX6pIY4E+MESM3K6cn5izYjyMRcgBktL55TYMPSAMPNPGUQ2083ToJtIU9rKhmrJs7cFTAsHV6S+qGubK67nf5Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hACnsWia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWG23Mh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hACnsWia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWG23Mh2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9Rpo7518393
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=; b=hACnsWiafhBTdTxa
	ZulVo/IH0FqF8qq2uuB0Ilmzo5C4o68OJHBWBjSiEu0Rb2dKg3JZ23giI7Z7SiO/
	5ZgE1Iklx5NHlGj+ncObqv5nKtngkYDfbA8lVY4Kp0JZvw0vLHoxgdzJN/tlDG8d
	Wup7PcReU+KoMQMTLVjPi6NSHfgRrO/ufQxsNfTlmhGdXa12M1LNKCIyL1lvDKCm
	/C9r0KMb5GD7IvdaBKAGWrDVwoXsKEuitA4OXOJkiphPf1Xq05OIvH5+p1gztmc3
	d7lq7uhvhyj2L3q6kj8N1jJ4K0kN5MYgQn4gKcxzk7sWSy2ycF0wQP4NEirZchbL
	LkP26g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnhvbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:38:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca4966fe6so22663626d6.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030711; x=1777635511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=;
        b=NWG23Mh2x8fLQ0MLePY9re9cjk/TIJ4UcHwxRTOgGsnEia47tkojVMCI0hvRbn3Jwv
         JgYUiXitU+TGr0QdmaITXcF6hVK/NeLQhtu+lEmSycBPNo6+MX9S8XZCRYXSWPy3/4jb
         2vqLE7gMsY9eM0Aieyz0tB5osQflYn/fNddAcUEQ8V5UorOPE2UKleBZ9l+USj+eSNcL
         iNnlPSmvfHSo1Cyil6LiFkRdqcZM+UEjRa3eKTxtvd0E7N5j8rFkY9K0dPaz0l+2D6p+
         6EhzKlmyQTj/IbVc7nojyfAtN2EEHcMIWe+PBEY40U38r1afLF11I9Cd0UPc504gF+58
         DJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030711; x=1777635511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=;
        b=TLA4wa+RDEN1NHaAmdL742ehqFVdS3Xnb3SxEtkCJZi8LXx6q9HXMQzEFMpOG61CkT
         i/yq7JO7pH88vhrGYrNM8wMIjbZSXaaRD44U+couScdUlupRNPJjFyX5+cOiCz6Vtw+O
         BwNM3pAQGg0LLYzaO6ThiPAgKZ4RW2BYlMma04NCzQ6j+lSmv7LqCT6SsKIsPTSYJQWS
         1u3NJ++jI7f+B7PKX2pqJjPfwJ8vuFLCM0nXQbn4bux8ogNxm+PaH2NNuK+tw9D+XwDd
         H8L1VEIB2wD1Hg5a7/y/qKPjEQxtjB6tQHRzNZzmUJYrZr61WXSUB0WB5NCzY/hS+QcW
         SP3g==
X-Forwarded-Encrypted: i=1; AFNElJ+8uXWuXFZYwDelZqmtBxBU28qdK0dfEzTUpPpIrnew9v2baa+nvAECOdW2r7Kzx7YrMRi4oGoR63YF@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3K4MJReiKD4EJqsQUC/fepv5FwysHPjGayjwOdOEuMhF386c
	swhJ8r0ld8sPdwJKYGLZyA70+rw9tuSlYSrThZnteSfQ9ZiFvQqKKSgCJQY40+Vp3hlYrsP2TIm
	m3TbIpXc3xyo7AxVDS0iGA4f+uIPnN+RHvtN1unsa05nwwhT7rjE5OrbV1237aWKh
X-Gm-Gg: AeBDiev7H74ryoFeaQhjPmscIyDDc3Mj1OebjsoA5oySX2dSz4glyhLsIAMPISH6LgA
	d9g+A6T4Jbxkc0JovtCzXvSUieC2+LhtPk14zXNvO4hko+y9U7jQ8FYy1o0T7UNP1UStV1dNtkE
	9MtUoLRkPlE/emmFBGiFAZY75d5MrmNjtzQWby3kAIde4kyNlGgNlMUsVYXg3aSTXQWOJilbqvR
	/QBy3sCmnzY1VGHZ5lObg7+wNpsAkHm3dnBDMq06i7V8vz2BoRwLyZOa9dIw71RB6bWHsV/sKwV
	L9OcMtAnOk2VvPlWlBlmBBwa91iXw/dzmUpLIpDC4nhOFbLS3IdSHcuIqyON3GVxnbkn0qjPp3k
	SGmw799bOmf+qwXlwlCNHQUSvQEXywc5MQKH+A8tB/Pb/6baArI43guxhtcLULasUtlkhCv5M+8
	xIvmBWbRoEm2+U2A==
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr356871016d6.2.1777030711641;
        Fri, 24 Apr 2026 04:38:31 -0700 (PDT)
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr356870736d6.2.1777030711263;
        Fri, 24 Apr 2026 04:38:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e54sm777016766b.9.2026.04.24.04.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:38:30 -0700 (PDT)
Message-ID: <74c5344d-93e9-4842-9704-9d0c4a608d5a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:38:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Drop
 QSPI node and reserve its pins
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-6-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-6-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb5638 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=VmJRAYmLPqqtz3Wu46cA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfX+4wDyhjgvwRj
 FqWsaF1RuxFzb17dm+4P4Vv+AzaNC/phl21DP+YY+UnFeiq9liKgn7qkXHFiZ9sojmy4N2BzuDV
 o8gyrgMmAcQpP+VqPzkgs7FTEaWJl+wzROhHaNLBmyhl8UVLHpvjRUjt0dwQAM2GKx/M21u/Nz8
 ni2eidEh74pBk0/w0YfPjifqhFfp6WFBWaCmsBrW7Cqf5AFggrgxlRKjapw9jY0wdgz9ibK4sZc
 Rm4iR8n08X8ABVyiXPqxIOgL2HM2I9lcd9joz+wZT5DudMZP8zedg1jfyIhD4cJR7iL78a/QwTZ
 AYZenLZGGoMvKnuatTayCsGA8G8gRmTcKJ1Z8cZtwCtkPnzsBH+qaOYu5c8HhhMBJGzq3ppCTmB
 T947BJHuTxxX7x/eO1uv43fCpWlWQTnWZGwkcpK68jFpaYuvxdGsQqYZPEnvdRc/egKGrc/YJMp
 yVshYue2ERgHZL+6BqQ==
X-Proofpoint-ORIG-GUID: cerrfQITG3nyXk411pO8arEF4AopuVg0
X-Proofpoint-GUID: cerrfQITG3nyXk411pO8arEF4AopuVg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240111

On 4/7/26 5:19 PM, Xilin Wu wrote:
> The latest official boot firmware configures TrustZone to restrict
> direct access to the QSPI controller. Any attempt to access it from
> the non-secure world causes an immediate board reset.
> 
> Remove the QSPI flash node and its associated pinctrl states, mark
> GPIOs 12-17 as reserved, and protect the QSPI clocks in the GCC
> node to prevent the kernel from touching this hardware.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

If you're going to stay with that flavor of firmware going forward:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
