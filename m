Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E4A1A0BE0
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 01:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780277108; cv=none; b=pKdj6kBNpmr2aeer8ZJTNvDNJJMORXK/qOoEESOXRYhqKJ0PQeereqjyA6YRsdxxG3wXYknTyvhOdirmNFYF4qbliCUcbqiqyJGGKXVugH+v7KSmhu4lkCsVygd7XIE31qO+atYUQdPVNPn9JjqybGMVH/6sn3XjGl3XVHVq91c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780277108; c=relaxed/simple;
	bh=HB/H8kRdQnNVe+iI1fetIkgGU9UEJ/VrxvkBLPDfr2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzXAe8z5EedlHv5923shG+bXVljGBQOc2ABRf7qGP1LtpPo3uxOqCuFOump2F7qLzr7vNNvzrvZ8Th7mNtFTX9k6k3j4fdZLNcSyUAa8mTnbPv75/WtsniX1HwnjptL7wRr4MspFiBaM81KDowkWe9yt2PlFSQy24UcKNd4bXik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qpq3vd7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLJeDwRe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qpq3vd7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLJeDwRe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VKlvmK2539104
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 01:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NIdcfqGLBBvLnTrYiE/G8uxoCpse5IEp9i9iU8fM0A=; b=Qpq3vd7ZF92EmwVz
	zDQjxNlThx5pv6e4zscdPDvLr2i4S82U0XrkekUyVoLk4JJmSbgu4GyJExgz5h9z
	u0XTi73u4ORYREkYWjsAfQ84pbMFywpRlNZU19kRADRhNoz/JQ5twbFrCnTrzRgw
	XKLsfvd1qREwzmKR5yooh+5ASLAvt+9nWEL4IOxZL2VRo8RCFY4DXiguoOmrt5H1
	oFSsNkzYfxeNjKUHnL/M98ymDXkPVLS8QVsvUEzdxvGg+tntiN+1h08vq/0YqoCG
	N9ps251a/IjEyxaPAdukrMWdBr85SDeAM53+zZlAhuAbIYrrBvKsUyHlrly4gokD
	sxktmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pnp6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:25:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so3284528a91.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 18:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780277105; x=1780881905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NIdcfqGLBBvLnTrYiE/G8uxoCpse5IEp9i9iU8fM0A=;
        b=PLJeDwRem+pP63lwgSn1Mis93QBLinl+NbYXewwUfNN8ocE0TwFeeb4kw0KB7/X9oh
         EiFTids6zMDKnJVSyrOC9kWYtVp1yBQfCkCNJR8b8RGLOtBY3ijRc3MjL8nK4l04ZIuB
         yfiP5hnhqjFXBVmmsGNBiOS74GEi1v8zSaqAVU0wmXsqnmaU+IRS8rQK9SkrAUrJIE+4
         pGHLkwA5DuBROfhMb2sfv+3TjicVau/QSpl4D0y2QHFIt25tUXfpzou5ZuEm4Ugdsu6x
         3rO9FUkC0k2xQwYdnPzjFTiNdmNScomqV5kk9MMD04uYMrUcUek0N/NwWLSNxlrToQa5
         zUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780277105; x=1780881905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NIdcfqGLBBvLnTrYiE/G8uxoCpse5IEp9i9iU8fM0A=;
        b=rPmiYqbJWgedZmHME1CzuTpMNRDPHv8Q5ac9aP88xy5g1+yXmGefuhpXxUkQgohRb/
         9as3AL540D2STxGO401cViGkWVNuLy35pKNo3DlO3p0PXXt0hhmtH7F/adQQpMx3AbJ/
         FLmcbp6hYnN0h4Xh22R7muRexm2DKUIIKSCjELxGfX9MzfEDuy0eUq4pjj/wFGuJu0cy
         yJ6G/iC/S8RZHQdCQZIMnM0CKr2SjqkSfk0KDO+LGzw6V2+Pl2m3jZQvlkWr20OCwOSt
         yxoA1GKykTc2QDKp4nzoUjngwHibP52pWt6dw28Bj2rO03IeP2ReqiT2lDnnOi4MUMoA
         piqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8db2Ei1UH/dhGca+M5HbQw+W9GWpWwquQpRzLxCqeIFFbJeZCiXirZ2MigYodsSTLd0bQddcMUZuGl@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8rUoKBb339LdnU/2VhceWjLqpqsXqXgtHVG7BRqNTdMVz7wD
	m2WRVkfjmNlHbTmeBlKyDK3XlLt9sadvhG34uiH4+7QPEhbnxv0Udq4YJ25y/ZrBG1Z6CoC+8Fs
	ynRDC38tUG2qNx2WlrxWbrrqMUrmU70RJD3v4pVmSzWB5pvNsruRk2Ms78gu7j9+F
X-Gm-Gg: Acq92OGegA00im7IdK7vZ4uOe0iRQMBsbahWPJcpVWOt8v0vLitOS6qEncP8JjwjUpy
	+vU+zxGwJguPcdVfRgX3XfMQMEb6mWA3WyGQLKvshwv8op6DW6ixXCwBvr3oy2Mf7HkNRpZNFTh
	HyhFM2YbR5BdIdXvNGV0tLUl9gebaCxEdI7ntXfOVZ/5sU8Q6eMLSaxHCDduDwnzDnbA0jXmdPD
	QS+Sw17wxQZ8igP2TpyKYactMZiwvpmYMcjUGubXjgjoXK+/E8dvtVnRT4ch6/sZJdagx3dLHOL
	rUjAwn/C1m3RNduf3b9DvVGJOldmKfKCU+h3DOJ0eJDFB4baodoLOVE0wKKBtZ9rGAdgsFF4opT
	euJltIZtHYD1kCExWYeomCXLdGOS3PUpssbTCCTXK38oYemnee96iiqGPSejWwRRJcicpNXVjjH
	qWMxp/DwIdi4wS5HRWVBZQ1qQA
X-Received: by 2002:a17:90b:4d0f:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-36c501b8fbdmr8019902a91.16.1780277105409;
        Sun, 31 May 2026 18:25:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-36c501b8fbdmr8019878a91.16.1780277104956;
        Sun, 31 May 2026 18:25:04 -0700 (PDT)
Received: from [10.133.33.48] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc65e8490sm9412967a91.3.2026.05.31.18.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 18:25:04 -0700 (PDT)
Message-ID: <c24d1b5f-c066-4f16-b4d3-e50fc2d40c46@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:25:00 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Maili
 cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com>
 <20260530-finicky-celadon-crab-2cb4b4@quoll>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260530-finicky-celadon-crab-2cb4b4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WP_FDyPIyAO6l03RVKJjsF53e6e-uVkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAxMSBTYWx0ZWRfX2zXidDIn/Nsu
 eBdcPzvZJ9L4iR4A/LruY9hdVcU1sV/psDFsxK2a3Pic3sxEnMYbyOR6slUen+MZ5abI88Q2naL
 bubvdvY2zYDVDPRBff0ZEuWtBjtrxRNfXebyPFddKFrVCzLhZx4xIyFsbiBwUgxfvLNui/h8V0b
 kc95rUNuPfJhHdnBXfS9bH3KN7FHTbFlnIvtQ6fXyLyJUMsYWVykjV3KPJ6rxVIWyFUv7LGTtmu
 lwHd4ph+sZmJJnAavbXrtrK432zItVvyzSRp43tbAknqlVCbDwMc2A5McIOCV2yUbHmwsS5OshX
 lroTAXJ6yn8CxgLjOI2BCe2SpRJtHbk2ZMBDlXUsorgNa273krTFT6N08Q8XcGDnxKjm5a+qyBO
 nxnKwWoYng2dMZ6yAyDrUzs85anDxR+t/QoWGcDdq8XpfW6F+J+4Xbkd46CqkzXBF9G6t8Br/X3
 V6XvO+hEncmqOTFsavA==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1cdf72 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Vd5kcbO-RD4PiU99qyAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: WP_FDyPIyAO6l03RVKJjsF53e6e-uVkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010011



On 5/30/2026 7:20 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 02:19:53PM +0800, Yijie Yang wrote:
>> Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
>> monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
>> consistent with the existing pattern used by other recent SoCs such as
>> sm8750 and kaanapali.
>>
>> Assisted-by: Claude:claude-opus-4-7
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> All previous comments (from multiple patches) apply.

I will update.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Yijie

