Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3469542DFFB
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836312; cv=none; b=nW4OSeA3DSqNJ0A2OiOfqRViPvx3dzORFxYM3DuqPptWSloDXMvgsfjUVAy0XfC5zGtvT2oMs0BVDBz4UT37WhstVfpHle6GpLfxjBkEij9yIV7+PD4niEuUty74VuB6QpHDym6L9qMFNV9r0qcbU1sjba3w1Fwyxyd5q1WCxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836312; c=relaxed/simple;
	bh=Ehv1K388Xxi/A/0B5uHgP1DqNXgDD8A3i80hN0+I+Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTbnK25yJg83EcXK06Is4P4xyiixH0qVsqiXiTePkqhoWBSywswKmUJ0jffM8+4Z0w+kHbbzl1qGZQnSPqDRD03Dh4TGo3c6tGbkk9HijaGiK8XViD+KP7/lpMEShtzNO9HmQKD+hpPgsdMABmJ9E4i5tYZvqPcsYOVqj1dyV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o//Pe859; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKIyRx74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o//Pe859";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKIyRx74"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5F2012676215
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vy9dgknhGdv/h9XGHNsuSVZmmq5FUcM/liisQwRaMQ=; b=o//Pe8590wsZcsSr
	Rf/b2RAMKeDbUaJaVpJCSk/h8JhADGwVAKfx29labBfaeJnFSx893frqHfCthe6I
	18nn0rz1NsBXoQxk4C4MhfEu1hyKhkTY3qLqgYr7TwHG7zMXdU3Qf6O9WI+BOuF5
	AVgpWmBCFoK9n+9q6M9LIelUSOLaIiPh3SELch5pyqzVJIzdVPi0hMow1VfqKMJL
	bVSKWJHDndW81qHR7aHWNfSgHhwnxVOItf2bsT4pJuFH4053+DgBGUUmdgysU2ve
	Q+P82/GN8jl+XgadbGtQREUj+wXztCqLrD7JyACdXPoWINn6v8GfeK0HHA64ucXa
	CanV5w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtjn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:11:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9569074317dso359325241.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836309; x=1779441109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vy9dgknhGdv/h9XGHNsuSVZmmq5FUcM/liisQwRaMQ=;
        b=aKIyRx74IUQ6ktSOEjtMDsO+Ui36IjB7pAG8CWmLbAFKgtk4BY2+3PnHEnAUJJS0Gs
         zvXVIKa4ktrmRtVpsxJH/ni1xWq+yy0BdJX8y5mWlBqTyLE52aChbwhwnyE/8F/nqqF8
         fM+jKfBb7vdVAoLIGOtS0YTLeusqFf3v280QMFCCaeK7Y2eqtQlwAkfKy80VqPsYxO2O
         W8WLUDE4NLX6fAJM3nCQ4/AJWjG253cwHrfeRUdxiad+nIWxZ2tivBI4y64/xq1HYSve
         sg1TwAllmVQTnk85ujVsUQ552ibeXtc6FWXpO/g+bW6eCKB8UY3LMiiMimLYZcBBrZuN
         iLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836309; x=1779441109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vy9dgknhGdv/h9XGHNsuSVZmmq5FUcM/liisQwRaMQ=;
        b=sySadibqEv1QgryhIH+N/bolBB/LAElpuZ8O5RpUy/fSFUqbjacgqpnf1vh2re9i6M
         UjHVRLMOjSXzu4A+q6YNGZ4GXGKuJGr39skViQeumyQJ/iCaRkeEdBIeXNedEQ99SlHp
         lPy3jUWgaa7BnqtBth4lJRRFf+WcxUJjYByt+f56RRLyoqdufg4+lF50S2EeIveHeurM
         P0sMKcpbCAAo7D7bAE+ODKenRCpPouOZi7JeheUgR9kByAjcHqmKUW8XTIfc/dzdMh8V
         WWDp2xpIj0scVwQXEpYfFgBwD+7GA+1Kgvw6Yg/TxD8NEDaEavTcw22q96+fdSXn4BEP
         h23Q==
X-Forwarded-Encrypted: i=1; AFNElJ8E8jcBJgBZ+7AzvogmOgLeMFQzTXd7N2a5PBFxBGNHsfBxTjcIRJ4URoiw83DTVPyWqM+oz7AszPgl@vger.kernel.org
X-Gm-Message-State: AOJu0YxxaVSd6gYPiH7bOVqqYAe8zov5AwcG8FXBZ/UOgfXljcknWx5N
	Ap5FF58Nj3SGmkPerxvRfPFdxDh3Kmxeu/dzAH/g7rSqXEJSOZcNCBC6XSBTjw48yqCzl+6v01J
	lYNRtHjeZgRfqQdf5qCEi6qRpnyjuby4Vs3eFg6OB4pw09f8vLAISLy47AnQQg0U1
X-Gm-Gg: Acq92OFITEfiBKltNN2A3koNSKiWcbbBxBBx1VvtjNp/lbXVoOelAl9xsIUKQ48muQs
	qqVibD/H9cVBjfsiep1ET7xAG6B3nGEAD/EGpOFuERnvq7P/N1qwbQkzimvP0+aTOr8bUrLYX25
	zj4ajxS7C7YemBw7YsO1FpKASPod58F14J2oRBPyGr/sSKVEfHD9uNzn+BM4aY5QTs6sHNz3rYu
	ylVsg14uR6cEr/U8PHxSqO6hp4bdypKKCOO+FYcWvUmRvG7N/7P9oMbds5GAOP5A+0+OS8Zv2sb
	7ZYFkpLQAno4QKQKqvEAe9y0BgIaDUkYsfS+xhFfktv/C5Xmbe7n5uOwdhzYF2NVUUYUUaVGQDu
	/JKUKB7lum0m0vQr3AXiddH4qgXMJl3Zre+q505Lk1Fjg1D11leRi7OCo97wFZLMmF34qI9GSta
	ech5s=
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr380373137.3.1778836309118;
        Fri, 15 May 2026 02:11:49 -0700 (PDT)
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr380358137.3.1778836308646;
        Fri, 15 May 2026 02:11:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd099dsm195966566b.8.2026.05.15.02.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:11:47 -0700 (PDT)
Message-ID: <fcadec07-589e-42d9-8581-5a31a42518e5@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:11:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: allow mode-switch events to
 reach the QMP Combo PHY
To: Saurabh.Anand.saurabh.anand@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, corbet@lwn.net, mchehab+huawei@kernel.org,
        masahiroy@kernel.org, nathan@kernel.org, nsc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com
References: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06e356 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RmqWY1QcMqzIjky8fzcA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MiBTYWx0ZWRfX/in79nHPgJqU
 pDmf7Cfj+IIFH5icgpWt/1xXrhyHi1hexXfKqhuI2+GTteWngktbtKrk9MiHt5JHkrfkTjPbf//
 p/TICcFwoxc4uDedUftTttT2oTDp4JEH22iXQeKxGFoTKgc2YePROOp02qP7LqVVpeA0aUEFaLR
 Yyo23cVM4yRiSXsvAsAXUxXM0gWJ0PBCiGu41kn1SwH4IGO7e5SdV9iRpajp2EnJ6SWj2Q/HlsK
 e+aTIpxkVDvRgZD4v/ARjb+Qeiyz+UiWBkgyjZGbx2S24/2d67hgDFKyTaQxF5vWLlNWGHB8arV
 wiVvZfWGotu2glApV24SmlLCm8g1qp76xIJXuI8/6yRl4M+eZuvoFT/SXIDBZI/XQUx1oGgWT9f
 uUhDr0Z5xap3UFvHwctq7KkSqqHQTH6Csl8LwUsP4xpY8o5vY0il7AqJPZjo3rLc/Y6X03j8i6T
 ID/U8Aj9nQgZLjYq+CA==
X-Proofpoint-ORIG-GUID: jKbxZ_VdDPzdHjkMF5wG-U3MVcNPg08R
X-Proofpoint-GUID: jKbxZ_VdDPzdHjkMF5wG-U3MVcNPg08R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150092

On 5/15/26 9:14 AM, Saurabh.Anand.saurabh.anand@oss.qualcomm.com wrote:
> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> 
> Allow mode-switch events to reach the QMP Combo PHY to support
> setting the QMP Combo PHY in DP 4Lanes Altmode.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---

Please fix your sender name for future patches (it merged your name
and email)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
