Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16683BED7D
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442608; cv=none; b=fPrilOD6Kat3rqHKWO8DbcdKzCjh+0jpmlfVsoTI9WorZNeuJeR1y7YNJ2XmIrQlD/4c0SXiac3zjN57MYlDeAFtKb/4SByKNWyRuLJI+18v1iI3pIB1//GWjPX0eJbL/sNMRQ8co7Rus9/ITIlK9sFiVWHsdF4Wd4Ue4da0rMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442608; c=relaxed/simple;
	bh=yObmgf+llw3PJ2A/gqaEje/zs6/w/A0LvJrMRyVWNOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFFcA7ND5aMHtiq/jFGr5MElHKCnxRLdPRUQ06khGV5KLnGJS1LU+m58Igfixi4PzfHUHHQTB1RGjKXsQ8tkghIWFPcRlqKPm54eBq9O9H4yiXIZXU07LjQihiLowlJ+F/788V59s31dtGhinaQkPGIEolcsbApM73ZgpPwtSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VELran0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZc/8c/7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VELran0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZc/8c/7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9H6pu2765201
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APbwl7JfZz1MFEo4M6V4SzoKbJVoUA0Dkbs8rwWXxR0=; b=VELran0c6hntsmhM
	mEB5xbFWjfu7Lb1Kyx7nNim1bPGhBazuvf/3rskHwt9P2v5dCTdYCjLu8bvcG2VE
	8CUkuv4mCbVkNAyPSyUe/y8VgDXG8g5mBuqh3g++t2bfzjBKgd053AZc32hhwcwz
	ehSKPc3oZrVSuEk9r8RCfHojoPIOMMadUe4TK7FCth2gsujHw+v5F/gdTAABYS5n
	Kxpm7KiqCtpkGfX25l6fdPh5A3sbUvZKQ5ffBKm1OSvftzH7RqidV0fM2WU1RP17
	GMIzpLDSih+iJoyKakApKYq+huTBtQNLAguwgu5kCHYnq9i3vR0DFOBU9kv/+exx
	+KQp/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7vbc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:36:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91345d517bdso157673885a.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442605; x=1780047405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APbwl7JfZz1MFEo4M6V4SzoKbJVoUA0Dkbs8rwWXxR0=;
        b=fZc/8c/71iFlaZ8D1NPl6XMdeqZmSxMUV8vSZSgGkJXj/Hb2agj3/8cCgLugqxv+3Q
         HE7Cl/NKrPn9e8aUxXO+1aVyYjNud7j3y4FaoSP++kdoQXdTOVbYOQF+cpm27zWZOLsw
         NooABM7w3qNX0hEW512q2NZTcB97T7Ih+GFL8lqwXJA6EqLsTLlRQ0a6WRkhgX00e+ar
         jW1Vn4SHHi2fdY04nBLJCIC1CuuagKo0MHdjREfDMgpEUZojtBrCNNMPPJFu3y5m0CI6
         u0U+MFclgA0MWCf6muKn9/00gYpA1uU2GyhYZxt7kp8Z0mHI/c4raCA9U8CuTCsrLIF2
         yIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442605; x=1780047405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APbwl7JfZz1MFEo4M6V4SzoKbJVoUA0Dkbs8rwWXxR0=;
        b=T4c/0phABS1/GZOv5eFIW6MPi5voJVug8qyD4rDfmlVE5DOvN8/Hdf/uG3t/creOYi
         Mw6XEWdZJMgxnIq1PjZ0Z6t9AMIXWh/LMfHl8Cxs3gUxi8jLe6rAs1bFjtZc2RF33RBh
         1MPwRLxah3QJIERLftMbVMRLSximla39XAH6wfT6EfICoBLYXVfA/8WYlvTvw1fTUVwA
         kWE9Ve/Q6S3fU7g1Qke1pLmRC2YbncT+rpM6puJWt1lD2Mku1lr2JFtz/B5kgm8JUCwg
         iMcDLZIJtIHGDedaaQiOWXwDj1Kh8wcgJD/7EotUmveulkJu41sZOhrEQlxrNThjgE6s
         XIqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+d7otunHAAW37jY0ffiP71nRuCr/4i9lDgZjxdz2BbBK+LAETA/TF6BmPXlvmzB6gjQcHBwfkjWXo@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsKO9lsRJZJ/nh5sJwQnp8LRr2RXZ+Z9b5ngft4xXJ/Y5Tfwf
	xr/+HUiTnIr3Ju4cZ0/PmfLg0Im2CzkEbPcqRYSvMHg9jGINfnJxvWrhMOV/UnYhi6+ttieJyNN
	WRsTjur1xMurHSTYlE1Qj1HkX2hdINS+K179ehFe3wU2vcMLYsUlhaHDfbc3R3L6J
X-Gm-Gg: Acq92OHj5wEHSt9r/laayPVVpfVkGPhWfec71R7ZD4Nd9wuFvXVVb7bF6wKPz/rKehi
	4XVJPvWkgFmazZGWMekUm86xB3aG+51aitwIjLdjAJMiHhp4nsn3xlKjzOGW2j19x3b1ftU4Xgu
	gf8GoP2dOTYRDvvnCDSjiAZsKQLV8U3RCi+dqkBkWJQNSFFohbq4T6Y1GGcAde4OmaJZ/gngV2g
	AjAiwa0GVzR4vC680q9NrAJd4bPHJ1qxT2h6ahYJzPSG1IHDtRPGzcyVnNVM3KNAJT0+i531Vnc
	Axw0qFa2xCmLyicpinVG2dCnWT4f5FuxHyBKGRn0g5QUUB9AcXy5O/+e86ddyLL3y/AMR68z+zu
	ElnFBYuTWm1T9UWJzJLyxOQEK9wpMxs3nAysuz3CGjF11mg==
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr274379985a.6.1779442605294;
        Fri, 22 May 2026 02:36:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr274378485a.6.1779442604807;
        Fri, 22 May 2026 02:36:44 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb427027sm460761a12.25.2026.05.22.02.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:36:43 -0700 (PDT)
Message-ID: <d9c4a227-97e3-4ae3-a095-a387b7035f08@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:36:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP
 support
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-6-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-6-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a1023ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RASbrK16IBkNdqQIikOEzbA3kuLUO7gl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NSBTYWx0ZWRfX5in/mqwAPb9I
 6CneGKNVHIzREisURkuYoBylfG4eV+g/hnSdeArALmFrd+KC0KZneRtQfFpok5PvLkGDKb/zV8M
 iYHlThDBBbNBGvwvPrAS2gkxTojOs1FvT3MQNn1e4CPi2y7i67Ahl/JqrCd53TYa4D35b4YutQS
 N6rnaUyjy6BVFeB72Ms1Cx7veOZCouZvWtxKvMw3xsrAj9MC8zw4rS6SX+GeNFu1oPvD3C9BLPs
 cPPdvbp0IJJfK5uD4Ljkr4hlTA/LR8wv5CDSfFqx+2zVAhoDoL9L5OY1RDEB+4cDqsAeJSTVlfi
 qRQQ55udk/F4R4ki7NG6MZZG9qnMnQOBxzFmZG+Lu9HDPyEWOnOTKrqg/KEj2vh9W41M3dpf9Yd
 6z2ly/o3BjybZP0bBMPBA3WeWbFM1/ntBPQBwmVrj/2oGTnxTdu/tbtFdLDm6KGDVoqFeKwiya9
 kInYGSwsgxDU1+H5z3g==
X-Proofpoint-ORIG-GUID: RASbrK16IBkNdqQIikOEzbA3kuLUO7gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220095

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Allow up to 4 lanes for the DisplayPort link from the PHYs to the
> controllers and allow mode-switch events to reach the QMP Combo PHYs
> for the 2 left-side USB-C ports.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
