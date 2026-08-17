Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E071D30EF86
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956752; cv=none; b=Hfkb0/7WyMXFJgINZbwVpEmD+1+A9DLB4pfOd0qOJLFzajFCNyDf2cRpCnaSYvV/DuRYBMQbgd3BUdnrMxBEZJdqnzQmtaUeb67UxRivuFxuHMYCEEc4iX0rI+FUej6lT7+70H/o5zWb3xjM0YrHvr/MdCRSskisQJbEy5dCXxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956752; c=relaxed/simple;
	bh=jJzQGQy426LG3R/40Ztx89ePEo9tQdC5bpBJ1j4fLOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AssY+kH0Ta8jvsFNLzVpCawKxM02c+O4hKD0E4KjENEvE4lGkjk4vOz+UwdBW9L/p3mtKXE0pc8AJHf5LbIMmFaEfnSrNhr0CyFqFyCg15lGi090WJTBu5ZBHZEyiirq4cSYwHqDvbyOxjVZEWApdJMSG8PbBG4lxdX1aSDddaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTSHbj68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksOR0HkL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTSHbj68";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksOR0HkL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H76H2g2123358
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdoGiZh2lX5VMwxx30uGwje6sydxiWOevpW3eseCtNg=; b=VTSHbj68RPvDpBYk
	zm1DNptj+D995Fy/bOoYBdbKQGWbFdYtRc9R9UfvFQZm7oJOSLmeRmEY+K2USZi7
	P54CJjv6XJdkccGPOr36G8ODxsPWMab4fLvAJhN7TEZg3SoSkcXscw9nNxIBNn+F
	NniWbIk0+Vy/orn9963ep044UUSUdhku7ejylL6JUjBdb4MxFU8N1IitjRwLLU9/
	lb0/etjS5GXIBassmOjBuzcumjCOyOZLmrUe381h9nIBUHVFS0GpyUL4RINnhu4l
	i9ME3unljao805zywUnWtzKvoZ95FVY0OaNdEx7CgxsgDk5PCORQjUClNqiKYURN
	LaivuQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7rc6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:52:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so3231617a12.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786956749; x=1787561549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdoGiZh2lX5VMwxx30uGwje6sydxiWOevpW3eseCtNg=;
        b=ksOR0HkL3fo+QVI02Vojo57/1pE3vAm+LqWz4IlXh2MCS8dOG2azY76WK4hlwTSTDl
         55dbENr7uIeLGz6iJ0nRTumonKOGhJRGskGpkBy7NdnhIBVKwYbKId5Qj4f3IzeNcuPi
         +kufaPLh7+0DzYq2ptjVF9bY+14cEJrZfhQA65G3pNg31VDDPCfAqfMGN2QYsjGmddqW
         1AwSfMsT3Huy08cVgQiKbo26DgY8PFpq8B2S7gTOOawnK9jkpI8UHG/lcIHe+zt/G4S1
         13zdmlO0Jr7irMOBcOwltQMlei7p8Z/KJ1HLjMzUQRXHwTZSNaTm1i7n4n9Gceg6V0iK
         61ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956749; x=1787561549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdoGiZh2lX5VMwxx30uGwje6sydxiWOevpW3eseCtNg=;
        b=iTe1FsY55f18A0CT/JUBK8U8OMjBdgXnYmCCekY/ZyoqKTApYJUZjnj1J6zThWlFcf
         +jlgAWZix0QPxFRS/5ESP13R3yBwjKoPROyUaru+pVBOiSdRjKA6KTb9o1yWTAHUyuOD
         SWJCalNCh3CfbYXQpInBEmrW3a+kAjAr4mfuH4cBjrHu4SJ6UwtluobhqJM1fDGM2vRm
         0Q3OxIcauSJsRWz/1G4udWuM0JEyh8E1LY7oY1Spyw8jhrKZhnGKXuAzjOc5NR2nDsl3
         TfSgEtypSNsC0CAV9L9Q7TQWEcPnROkAhvUv8iHEWQ0yCHHgmlLwmpU/IxWUCM0hd+L5
         gUow==
X-Forwarded-Encrypted: i=1; AHgh+RqND5K16Nh4e1H7szungJa22d4MtBnPJ82Cbql4yuMfcurSxK6fsxWjEt8GbK/M7GLd/Aooi926TuFv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5UQEfsGGxpof4qdww+ZZOn9vZ4bzGSzKBOG56b3ApsP8qOaPW
	faacRFozsFHAzx7Id0PzW2nL5DPsiUPwDDE6fC9Zclao8uWdaa8RTmXcO+aUTaTHPqv7zkwZJL3
	6TUt4mmi3cGky/T1GGWA9+wvk+JiTyZ9VLYS3A9/ScuGO986Aawo0tpNDRHaBbgAC
X-Gm-Gg: AR+sD133CogSJi7bW6p9p/bloT0jPHC3TxNYrVExJsleXi+mdJb4BIzDwxciwF2fKtp
	s7bBRjxP5pvxB6bBdGb7k0SnKT0LFeZMcfYe9uJVTqPFo4NDYAvsa47AYgB/ptjBSwDEOKXklvA
	vkPTCTSQwqeOCFfTvz+JuidKyouELNKL/5/OI4MLZEpJ3Zfa47yaT+f+nYHCC45vASbfskrE3au
	AohnFSaNpPw35WE9ol40+IJ18wku3dSlm+SCsoBpSBTlhVq/23oQy8oMqVmKUC3J7EpvJx4rp4y
	GMjIjqnVXM2fnLWXtBw62FeRerD/RebhKmiFCfWJX3qomk2xb7gEQ1eZkwss1p9lZsPbeLj/LW9
	mGwX4ODGC9F2hXS9BtIaglnoizsh9RCURhA==
X-Received: by 2002:a17:90a:5184:b0:395:543a:cf2e with SMTP id 98e67ed59e1d1-395543ad07cmr630495a91.15.1786956748801;
        Mon, 17 Aug 2026 01:52:28 -0700 (PDT)
X-Received: by 2002:a17:90a:5184:b0:395:543a:cf2e with SMTP id 98e67ed59e1d1-395543ad07cmr630464a91.15.1786956748281;
        Mon, 17 Aug 2026 01:52:28 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b79af0esm4091009a91.4.2026.08.17.01.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:52:27 -0700 (PDT)
Message-ID: <cc33a87f-760c-42d0-866a-0d86e38cdb29@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:22:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename
 QAIF clock IDs
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
 <81474771-c89e-4476-97ae-032756879605@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <81474771-c89e-4476-97ae-032756879605@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s3F2n4qGA-wbbU_bR-2FgVadaBR6JL2O
X-Proofpoint-ORIG-GUID: s3F2n4qGA-wbbU_bR-2FgVadaBR6JL2O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfX7ssJ/EJSaO40
 xEp3cYSlym3wDD/0e7zeS25wwrKwuNpIEQLNXCfeb7fHn1mG0WLoTEmqmIDky0JmsMWu1FDvlKf
 yJYokUgn0PSrKesjQd8iglcEeqHc/GDC9hQb9dBUSsWdryS37Rdfb4fVKFRiODjUN9SJ+xr8JH+
 dMEfTuv9l6llSpZxHtMznUB1qzHi84PnEg0quzdkIBJ6OkXGFxAu8NrN55YVHCTNkE5icrqMR/Y
 X9IXdtL+ITPfnGHN+F2m12YTgYxKFBTg5PPYuBF3t6n2poYDRsGt9URZF43h5+ZM0zEeSNv00r/
 Cek8kDoRMtbMqn3abtxu260Lw6kNNjQuz741R+GHsAp5DAi+z9VWtisFaM3N8JTxsmiCtBzoD/n
 KOpeo4Z3et7fFTPWXnNSIixylLQVbYFcIXV/WAcRMzRcRNkLUBuWot1GXP3fgAjaTSXdSt43GCl
 7NIhB7gZBqSUOIFvA0A==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a82cbcd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=kr3vThTxrrWWTICZP-wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfX9B0mtz0GzUK7
 Wgf2Jp6INwBis5SJI8Mp9o3zsMaT/LGLbTPm1U9MsELXvdU2CY5Qp5iVZsURoyBUTTgtLVBzLnb
 pjSmCj4AsNtRo0u7ONj3u6G8tDq7Y8s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170066


On 8/11/2026 11:49 PM, Mark Brown wrote:
> On Sat, Aug 08, 2026 at 11:49:44PM +0530, Prasad Kumpatla wrote:
>> The QAIF clock IDs were added with a LAPSS prefix typo. These IDs are
>> new, so rename them directly to the existing LPASS naming convention
>> instead of keeping misspelled aliases.
> This breaks the build.  *Please* test things before sending them.

Hi Mark,

The affected LPASS_CLK_ID references were updated in
patch 2, and I compiled and tested the series as a whole, so I missed that
patch 1 does not build independently. I'll combine patches 1 and 2 in the
next revision so the rename and all corresponding user updates are applied
together, ensuring the patch builds cleanly on its own.

If you have any suggestions on the preferred structure for this series, 
please let me know.
a { text-decoration: none; color: #464feb; }tr th, tr td { border: 1px 
solid #e6e6e6; }tr th { background-color: #f5f5f5; }
If you have any suggestions on the preferred structure for this series, 
please let me know.

Thanks,
Prasad

>
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:67:19: error: ‘LAPSS_CLK_ID_QAIF_IF0_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF0_IBIT’?
>     67 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:68:19: error: ‘LAPSS_CLK_ID_QAIF_IF0_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF0_EBIT’?
>     68 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:69:19: error: ‘LAPSS_CLK_ID_QAIF_IF1_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF1_IBIT’?
>     69 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:70:19: error: ‘LAPSS_CLK_ID_QAIF_IF1_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF1_EBIT’?
>     70 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:71:19: error: ‘LAPSS_CLK_ID_QAIF_IF2_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF2_IBIT’?
>     71 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:72:19: error: ‘LAPSS_CLK_ID_QAIF_IF2_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF2_EBIT’?
>     72 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:73:19: error: ‘LAPSS_CLK_ID_QAIF_IF3_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF3_IBIT’?
>     73 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:74:19: error: ‘LAPSS_CLK_ID_QAIF_IF3_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF3_EBIT’?
>     74 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:75:19: error: ‘LAPSS_CLK_ID_QAIF_IF4_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF4_IBIT’?
>     75 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:76:19: error: ‘LAPSS_CLK_ID_QAIF_IF4_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF4_EBIT’?
>     76 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:77:19: error: ‘LAPSS_CLK_ID_QAIF_IF5_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF5_IBIT’?
>     77 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:78:19: error: ‘LAPSS_CLK_ID_QAIF_IF5_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF5_EBIT’?
>     78 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:79:19: error: ‘LAPSS_CLK_ID_QAIF_IF6_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF6_IBIT’?
>     79 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:80:19: error: ‘LAPSS_CLK_ID_QAIF_IF6_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF6_EBIT’?
>     80 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:81:19: error: ‘LAPSS_CLK_ID_QAIF_IF7_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF7_IBIT’?
>     81 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:82:19: error: ‘LAPSS_CLK_ID_QAIF_IF7_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF7_EBIT’?
>     82 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:83:19: error: ‘LAPSS_CLK_ID_QAIF_IF8_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF8_IBIT’?
>     83 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:84:19: error: ‘LAPSS_CLK_ID_QAIF_IF8_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF8_EBIT’?
>     84 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:85:19: error: ‘LAPSS_CLK_ID_QAIF_IF9_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF9_IBIT’?
>     85 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:86:19: error: ‘LAPSS_CLK_ID_QAIF_IF9_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF9_EBIT’?
>     86 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:87:19: error: ‘LAPSS_CLK_ID_QAIF_IF10_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF10_IBIT’?
>     87 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:88:19: error: ‘LAPSS_CLK_ID_QAIF_IF10_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF10_EBIT’?
>     88 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:89:19: error: ‘LAPSS_CLK_ID_QAIF_IF11_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF11_IBIT’?
>     89 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:90:19: error: ‘LAPSS_CLK_ID_QAIF_IF11_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF11_EBIT’?
>     90 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:91:19: error: ‘LAPSS_CLK_ID_QAIF_IF12_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF12_IBIT’?
>     91 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:92:19: error: ‘LAPSS_CLK_ID_QAIF_IF12_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_QAIF_IF12_EBIT’?
>     92 |         Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:93:19: error: ‘LAPSS_CLK_ID_VA_QAIF_IF0_IBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_VA_QAIF_IF0_IBIT’?
>     93 |         Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_IBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:94:19: error: ‘LAPSS_CLK_ID_VA_QAIF_IF0_EBIT’ undeclared here (not in a function); did you mean ‘LPASS_CLK_ID_VA_QAIF_IF0_EBIT’?
>     94 |         Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_EBIT),
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6prm-clocks.c:15:27: note: in definition of macro ‘Q6PRM_CLK’
>     15 |                 .clk_id = id,                           \
>        |                           ^~
