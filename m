Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBA346C4AC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388938; cv=none; b=hQDko+SwP+eAaPesIpXcCUfP0UR2xb8Z2e8nGTMkIYsN6GvH5zw1al67YiiCOnZzyrrBFvVN8xmtggT/fojtxSKR3K8xiiMxNKQTzakieMN2eTUNUt6mYKFZtGFKMQ57kUHxDkJ6qO/R8UyaFJRSoopJ0t6434+5g0c6JYY6Iuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388938; c=relaxed/simple;
	bh=PNm5ThoBhQTfuRajdPniX5QsIR0yF2ykSwtXSu/co8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBS/sLtVXUXdCIdJvMlotViz0AgSnztzPgoKTOv/SffwT5TIj3v/BjwIogWMGRdWjwi/8+2yr5hME9ayJdvt98jOTcONl5xiI5Pc6cZlVIqbLKHyHdH8rKr50rQa/FxhBvlKmPxCv4tlXS8P9Ir5qq3EwG4yO+p8ob697XxVRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNb9mEf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYgSRNIY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNb9mEf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYgSRNIY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNQ2A432051
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=; b=dNb9mEf3FNT1FZnJ
	+sVnJIgxvoWbjGGQX0oStfXksLgwdvzXZt6Qok5USqDmNrvEZMCi0aJNLHQZQTYZ
	Xvn5iDsBlu3Xb37+Fl4KVvGdUi7E7Wx61xn5xEXs1x4eieVodpq8F56F60xq5zPU
	hBh+YR7S8CRYbjwlCA2aj16eV3/LIl2QeHOY1vk1ywCmzH6yHPUd7BV9ju+Dtsjy
	dDzQjdPodmyrWzKQ9+0QnmU65ph57ovYS6p8Rl0VVecg9MExLk4K4ch/pwmsliTV
	1qjGt4Eg6JNXKItSM9OzmsE2EeBZlPA4Y+jmVKE1bP9PACVyKEb0xILd6T4edfxX
	XU/qBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg0h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a18b457bcso44878785a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388935; x=1789993735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=XYgSRNIYSI4+kW5jHwROVtOG5/Ht2oWi6lCqlHfEpWH3M503niqFEToS0iqU2rgTIa
         3aKrhKTD6d3xSFzw70yCFkUjrDuPYHovoJabvHI+zXOHcolOL+BKoEsfFa1HMapP3zj8
         ZirJefdBCPqXbtahSo4wpFp6WYDmFVXmS3Duk7zz2B2qOD8JNZfG938rUI5pX8i3MZC0
         ZDiYfbJ/FXJgyInEheObpdgxgs6UefJRBudlDOxEnikhyla397KP1pJkuSCH11Pi2e64
         UusiHfu+w23pvlpeg8laY+ka+DJo+zZyL9rQJn3K0p+pFWdGDvs9XBvzvsNRV+JH21Cr
         kf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388935; x=1789993735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=TCZhwxkxxSGP7vfPIesyZq9+SqRHC/Q/nwk6o5llo3DItw74pGcJP5AeaS+n3GqKYK
         ZOoJLXjqOAbgWO9he/n3ZVvMuYGM0WHc6q1uSxO5wYT5rOhs0D8n/xlzh2ilbIJ1xdds
         CPqHRkyUZwiLqljiSjrKRP8pJnlCg12GNi7SafBDNVufP+M2gsiz/2QryUHMbF7Xie+P
         dsoIfGf3TEI9lyn8orzfCWMPTTbRHbQ6dOJvbpb0Uzc2IaQk7bcLmANnq2zPJiJBIY1P
         3rH4DgDE4qd/VTKzSb8tHDsywKuowXeZ0TkSCO2Mkn9c/51tdEDtID4jmzG6TFVITAZF
         DoAg==
X-Forwarded-Encrypted: i=1; AKwUvBx/sPUiuCShiVn1X4GtqEJQjn/7lTY3YlPRgd1uJe1y1tAtEFQVZZSJI3ZtHYxd9iKkOODIXAZLQVQJ@vger.kernel.org
X-Gm-Message-State: AFuF++mR158gIMU5t7XLRenP958jr2f3Z3ycAs6GMCNHq9lUA/mU3MgI
	7wNM83wkxtgyrTqXoUGd9sl2BoTI5v+Qrr2oPFYk+LXN/Oy+7Rld7GJsGTRjeu7dPZw/eXbSfOm
	FqznE9KC8v7WD1Z4n0yWl+cVoSjlDD4oSxGYqd8pM88ZdMaKHzEvSjYawzV3ixaK+
X-Gm-Gg: AYBFou3ucLmRBf6UAQK0fnjrm7AsMbH7RyatB06zOfpBfoTeQG+SxTLVQyqOzA+1t1S
	jHlwa/RICeHKT786uEKqWhAmT4grjjb/ukEzrbVcx0ZeJm1lUhjZmcpA62h7bqADaL4XDPw8OXl
	7By3RDjlVuINvIZXuPfP9IHtbF9+JlUkR2uYEB4xDgdd2GwR/Cab+olwGaY7Q9sMwpZ/HMgrlOO
	TuGEwg9P+oc4caDynTl4pSE6MXaB7iGX4XnGRJo82j76fqfabkfU514zk1nMeepbfXiMAyzWkPw
	Ws8M6wfpsemJn6UeBtUpOJnsEitcmEsQCKiSCy83ZXYeVbheXXHdbbuYQUtoL6M2oE0NIq0t8PZ
	feWSE1wgrLmPLXpPRAXMRHw==
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr225505385a.5.1789388935493;
        Mon, 14 Sep 2026 05:28:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr225500485a.5.1789388934693;
        Mon, 14 Sep 2026 05:28:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296605b438sm419224766b.26.2026.09.14.05.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:53 -0700 (PDT)
Message-ID: <09fe8d04-002f-4b9c-93f2-a933be8e875c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/31] arm64: dts: qcom: sc7280: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7e888 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfXwqyZqJtGLarx
 gueoOzfVSUSdURgU1GQeVITdVSvu97uBdyP3Spv1WZemTh7/hp2dQd5eBL13h2sa4xpElJ43gtn
 wpV/rlbxm4K8vD8X1VIkaddH+qS/azq9J0gum6v0sKwopSXCKcB9v04NB8SoYjmFrY3cvL9Kx6y
 uATXZag1NKKLh0EbPCW8KQKCS1jnCsAzpcsxwli732rMM41SZEi0h07r1tSO4XgSCMMoGVIQ1a7
 FgOtVlUwImo0NL03sVcO1/Ml+H3ClBITaNpX6j2MkGH3w+k4/UW6bza+ruFz+eQPUtu4wHPJIzp
 b4rxWoC7bGLBkkZUPZ/R2Hh/q8R0N1hBMF/zV45it7eN/gq+oCLew3KRr4Ph++WhGs1QVGZY/BW
 oQLdWPHd+Y3/NdmkBXuF1jmlszUq7KM9i6T7veII2FNSfGk/lWCvEGxTZ/n7Kh2dO+cYLcEdAZq
 LgV8E0RKDUFfHz7890g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfXyDj6YDkGHVf9
 HIgn1LcUKb9Nl24sLY82VlrHyjwJ2tf6DmGEMWn349iaXAvG3AI7ftRiDzfLA0nl5MEQj3ZkTEF
 LkfTQdNmMqlnE8ZuK4DRM3FEivbXzTU=
X-Proofpoint-ORIG-GUID: vYYNqYOgcTEwEGlaNmYwhw47YPs2-vm0
X-Proofpoint-GUID: vYYNqYOgcTEwEGlaNmYwhw47YPs2-vm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140175

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
