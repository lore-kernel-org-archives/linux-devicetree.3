Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C27451993
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388509; cv=none; b=eycaBSVUmlP3IQ84qxOl9tBKAooF0lvj0jxQk2b5r9j3PKD/ESPSM3s51+UfTNohsEmU3CFdCs+w0kg1sCFoi+2jMf4uZYkUbEGGXOntghsnaiRpSW1Ti1ld7imnsDLucRI4wA5NNtFSvNmz0eY3TiaHQyFq8Zj/aXsKB2kQUQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388509; c=relaxed/simple;
	bh=qyvVZPMmf6cjGNsZBWyEB+VQPzOPL16F00os4ISp9tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8wEwHxlgRm3TGAJMe4OxLcXgJ1O38vq/meOfBjDn4FN+yXAnPZOXP1LF8NuJMnYXOg9lJpkvr20IGeWzRZ3ZK/Zly22ctgU0YP4J6B3w+lD0g6MQw02O/OZrnoiL3eDq1qkfWx9wJgpsXUsxKMI+Z4ZwjZQtJaW6xcKr+mJQiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9l8oCM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ektk8BMH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9l8oCM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ektk8BMH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwAO3860391
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=; b=g9l8oCM86cP5zO5M
	/PKudbbPBSLcsu4HAY6yBpVvolo4T8D2h0qjdL3lYpOnU+f4n+m8gGu0gbuIt30b
	Q1u1Wzd6q1bhjVVUh1xyaeXxYPVxqUr5JUQGjooHOr1RWoJ8R0iJNQO3JNz2CaqM
	R/+NTyJYV7uBPaFC6Uc131I1jFUIlu3I1BuO1Yy4L4ArFTuqJRhfE4aWU3Ajll9t
	1DbHiVtE4iN8vm5/ib3W3F8GPWJiVsQAyJPu8cLU+fUTKs+jVdH3hRqSsBPqs6lR
	lJy0Hfc3oS5myUosu7F9TifdxNjOCB8GZ9zFWe7tnsjzLdXKuB2Q2RJkp04dkkV0
	lpS7KA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0xef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:21:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c6e562b059so123724e0c.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388505; x=1789993305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=;
        b=Ektk8BMHKKA7kYd4d9rVe90O7ydhvlTfQ/KaNrY9/M0XXTFdyg57sCsk9yR1xXzcxv
         X9DMSz/3a/fRnWu1OLXxgC84mSbQbv/m0upPG3FAyjUGhM6SZaa1wPSodqXzRsCILPNl
         yL6w4ZQ70hkHjj7YVbeOsJ1abY/Z2nhAIu8ec0NSHxb0pYNC1KXgneWol1Rh3zLj6jlq
         OEyDJx8RoXH9wYT1Sc19c5wMTrs9/RR7I5HQhkgOe7XWtaJDd0VfZ4sUY76VVRTKJ3dm
         /aNmVZUUY3AAF//CHNpIy6UAMvwhUydFucta/qXynOBhx1i+7lSPp2fbGQgK1Z0WA60E
         9Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388505; x=1789993305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=;
        b=tSEdcSTe5Ej9PONfIWS90Qthr0STVwx2fYzjBGUvuDlZZAynLV0azL5VbjeCN7hTvY
         COMKedl+W+UU2Juq+s13ftov8QwpvAWg5iAk9h1v23k1mU6Gju15QzurgcfVTrUsPuWR
         e/wZdNzvfiPvx3CPIQJZKOJcFTRvMqQX339i1aA5/2dU8YSJdovpn0hVKpvjISNRhb78
         7hp8RavpynwNLaAtevrRY3GbiEt/cpmyaAQWUJ+epbsPR58BPaF7ZKFYa0uU25A8YGbT
         RHJeh2ePTnuUADRlwUzcNkK0mwJ73mzJHdt5tLX13FCgQig/yAlwp41PEBxNDG8g4cJp
         zHgA==
X-Forwarded-Encrypted: i=1; AKwUvBzIr9p0uytFmwWYmqopw9BDHef0yW1D3Rg6bx39YULnoma98KfLjr/1kDbHtAbYO/p+o9BrPMH8pniR@vger.kernel.org
X-Gm-Message-State: AFuF++lC5TYMMBzF/+SfNzlyN2fwFwt55SVZTrKOPXZoSo5mWnZLy8+0
	KQTSdC121KNbhIrLg7f0RKOVf5vtn1zeTX9nR8Z0Izk4vzY0r9ItdiDMqF16C0vXO5pPfXZmx/O
	t3olMI0A/Kk8xrjUzOTzmsNnjEyph9vR1SCFoDkccI4+3z7ai7q/siH1XntJTqv2n
X-Gm-Gg: AYBFou1eEhnvcxWWWivqWAlLHLvsChc9/ITShhu4L5LtD7bFbB/gq6bydUnXXsIkJX/
	xmDskruhcGjQ3uLUqe+wByNFcrUpNdfuYK7mAWDmngCF/g8HY6Lk7qNvLdP22WX5nWHCmNN+SH3
	w2VJIjDUMfWkthlIb9gm0VCfQ3F9lV63ghVWlQS1rSAVAW9gqTIKlQ0xIatPRrV9iZgbIZmBOWQ
	2j+41f5JOFXr+lFgevWkcZ7/KQwSeYWAFUSxmBjN8pTc9k6jeaOaHkVJTe8Cy8NqsfMvOVdkTeX
	jLroybilmkVbeik8hTMkhTqhTuYSoIyhm/R2Ga4gtf+Blg1mN7bBPophqkP6HWsEn/GJtaPcxV1
	rZ2sLlOba25YyqzD8sXIafA==
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr354671137.0.1789388504762;
        Mon, 14 Sep 2026 05:21:44 -0700 (PDT)
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr354659137.0.1789388504296;
        Mon, 14 Sep 2026 05:21:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04568f2sm2472223e87.19.2026.09.14.05.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:21:43 -0700 (PDT)
Message-ID: <1be88118-4ecb-4d60-a79d-8675b9399a4f@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:21:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/31] arm64: dts: qcom: milos: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7zszstuiJgpzNFiwZg-_EeLrpPLRFokX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXzAohVIFEHreL
 9ELsW3vl64VvYcDgowclMYGDH8o8K6qOZaC9U+sKHCPF3wqnZTzeiyFcSNgkUzxmR8Bk3WFLneY
 Mn448uIj9V2qbSMpjPiyEHyt+JLb9Wo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX/qzCdguo9Qh5
 b3lkcEPdif9HDN8Z6bLOVGicifXPK0eygAAvUL7abHZswJ/5vGggiRgoo3Hq2BhVlNh75H2cwvN
 3l8cbhNfCZ8nDcnSq1UiRPb8Y6OBEaPJ8so023zywnz7pmNkrCsjYr4On2CsDaahigW1cONiI7G
 5h2vbUK/xBMsXT3MeQeIkHzyLcaV7vUuGZ1JIYDX1KU9Wv6pf01TDG09uRf1bTAivAYOrN3Z6/C
 o3p5FB0Nc707NSGRup9/wgXPMLZRHCgz3DIh3MC3yNIXfX6Woj+lodqn6jD33cFFWow/03nPScu
 T7px5lS3nA/FuGLaVrUVyONMBf86/Q4gKfNYdVRsQXDMsMi7IioUlVfkfl/AMSL/lF8m6QMGL0A
 611+cYOSIphktsxzR1VOClDGYWnI4wWKutMKCIx2bwDhglT0DzP1QekR+5vBdDpvAKjEjDduJ4U
 r6yheuf2Bco5lRtlOiw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7e6d9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YiyR5B_2n7VWvMOyD40A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 7zszstuiJgpzNFiwZg-_EeLrpPLRFokX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, fix the big CPU idle state name, which was described as
> silver-power-collapse, and update CPU idle state names to match the CPU
> type and low power mode they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
