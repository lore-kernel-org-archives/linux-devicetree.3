Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4AC3BB125
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075750; cv=none; b=dyvwJSaaNDSQRDSgqk1x8nPiyuflZULH+jfoyWZNA6NAfGq19B6iUIn6n4qCQIqZbnLl9MTbRLMup8IUMS0MwoiE1KRsKFDwwgujCzxOHugSJcpCtrvoNNmF+D3V1rngN9QcyP3oKUzkkoUq8i+CawFe+hudV0OsUWKXHfarKy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075750; c=relaxed/simple;
	bh=jHY2q4KRw1a+3cM8OlSYrnjimO30abUuFA2g+e/yfvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilpG2BlM76b6Ru3/vte+GhteJ3DjrWINtJnEUf6rFZHAm82TxR2ttiu47gA3vBCUuS+yRZl2S2XHbrP+RWv33W50UCSpgnpY15d8VGSGfE/w83J0y/ywkmoqRCKTPLmE475hLptASHSukElpXtcFI47yRmeUET3zijYwOR6DriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMRaOIGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLx/Z92Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMRaOIGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLx/Z92Q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jiEd2417235
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=; b=oMRaOIGh/vAinRbc
	IIWDc0kEgaACGgan4xoD6xDYDPm+RzNyOkkz7TM51hbBKbOjQb1ILunCf5VbMU27
	sN3FAVVmoaU2fOFriiMN9P8xIiwH1+4Y9aS5wKiivJnqDP4DCqna4Y5DFSeFwBrE
	DDap1AqxDjV7beRhj3x3TKUxJ69iCO5SlSeOdmwmwMuVvw0cv3bQpv8TsFzegaob
	0EeooP4PM2j4QnWeyPeHEgONSvsfeoTRusutVcLXzc+1W/e92f2IXJOdiPMA4RfB
	ieflyfGRnweFPpXbDoSXHKTShXQqHER1p6oR3LMDFxUOKwLoS5VGPpNLM0ld1lx/
	U2iKzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjnmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:49:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so95002185a.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075748; x=1792680548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=;
        b=KLx/Z92Q/JMI3oV3Z3zCo4T1kDYAuhXYV2wC1zBodO/22jVKzGun4fwq2tsnfdAAbG
         kmNUvhJ2VLP7Ixy72IgNSjJUtp1Td01E1YQm6XKvm3dS3lXS+qky+LibIRuG9ttYceWv
         xThcr1P59S5GRs4m1b/Due4ZOqX5MNnJ0VFLgPNm/mAl2gNTz4vrzlXPN9wdFzYin6kL
         6YnaVQhvyJxMAPoLrDFPwYzfTvFwupoFjJivgoIXU/grHTYoK3RswmLJgJbcSOE21VLj
         IGq/DtBtAKQk1Dpxo45fduJ3tQlVt9gpDCdX8T3z27ltuoQ5q7hK5gKR1CLE/7llF/Hf
         xnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075748; x=1792680548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=;
        b=bwzyMNlSpzXnYvN81ObXwassOd902tU7cHCel0uY5TLc3eCFo2Jby12SCHEsjKZ2NK
         D5oroMJpnuhPZSh/Bohg0P5If6f00zAAHsDAfoN8YPSq9iphGhB8+tOUN55HztTIyE1S
         RIW7sYviZ0+awKMt5h9UkMluLgMdtO1FfJUSEMB+r/aroV7b8rvie1eTostXCLPg8T/B
         dPpBG07qBYuWQO12zXmhcoamlphHJ0iAEU+7OHEIfvy4v6yEFB1PROfaLR7I/z9z88Yr
         nVkQj8247mPTklh/+Uih7YwLfmE4zO6xpkLtAU8QyrXkTX6POXpwg2/3XdR/qt1yDQeM
         YHFA==
X-Forwarded-Encrypted: i=1; AKwUvBxLh/GQV1hdzVF8+/IaZelk3BwKcD9JSPsL1Hp9gpljSUKWnVQ0xF0P/NIoMJxPS7AdGVxB9BC3wDC7@vger.kernel.org
X-Gm-Message-State: AFq9FYIMmG8ZrYnkBfDTNTbun2nXENp56eAcQCJoYtOARbwVJB1FR8Rq
	X2Nx3N9KCXOOrATK2PU+weIq+ZxLC5KXh0WuihmCTI17YmPu+xS6Sc/pB3dLkGvM3oMn6c2pxCS
	Eboxw738kscNI64Gk/rUubLM94+CbeoDzX9K1IUW+E6HkrbVz5xy2clmUG4T8qDNI
X-Gm-Gg: AYBFou3Q9d+sCwRmK7dSd5z5ty7fRPLQERYFl/trtvPGCJ3hGskyBre9gt4AaMTJLIP
	tcSKJRT6fO3A8g7Csr19rBUzg0MA6pcqSRYoRPlFvjO6oveFDT+koaHENpkRvIesHIAM6KbNFmk
	qzSoOPXi7yHImQDOqo/0wwc6fKifhsZFG3Hu01CG1HS30lypxD0KpVn51vFqY6y/eJlTdrtgbN+
	3bkDFnOvPKOk3fTD0ktMMWELMjzpgIiiyE4O2d1lWX+blcA6+gI/bT0MTyD7pbSBzWeXLMMre3L
	b/E1JmgE4Y7QLyGyFv9DRJ0ZSmTvfoQL5f/fjc6QupOz+3nDRgVER4YknFk3mmvBgynDJwGkZgM
	N3PjlXJTWJ+QIojvH0GoDmA==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr842944885a.1.1792075747469;
        Thu, 15 Oct 2026 07:49:07 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr842938185a.1.1792075746898;
        Thu, 15 Oct 2026 07:49:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdefdc4asm7442501fa.30.2026.10.15.07.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:49:04 -0700 (PDT)
Message-ID: <300889d8-cb0f-4939-9b67-c60d0b1499d3@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:49:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <179207449898.13793.6897763208667873901.b4-ty@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179207449898.13793.6897763208667873901.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX9ErtWepRH3F2
 mwRUhdjt4RuCQbPzeBGyoL1JLVSl1ai0Xb1SCPul/dzOlgOL0J1JjZKfHUQkdXvrDm4AkItQHHe
 nW+U2QptAhiC7hJ1GocbDpmgRuHKxV4Q4gHVlh/SZpvamxuUJnEPy2VcNQmtpcL6NJ9GcRVKvVg
 S54+nRzyy84hmnoCa3r0lakKoh9RgVhC/YxcK3ea2xlG/KfyekEeADk+WpojbF6oXa3gly4GFIE
 cXfcQweOT91pzF7Wdvjbb0i2JWAh6QFcZhL636uVne+/prhzgse45JW5zRf1JWCN+RUgpzDPusw
 u02z2CsQFXoI0GbDsu2mq28hDRfmKmLXY+4HxdL59XTzNAvpLzlYXI0TEjp50yxQea2xYurJsQ6
 JXWV4Ft+PtbsdieIMPpbXG3tq7NHAOzp2RpjHoR/CNPZrqaLN0o3pkX1d2Ijf03AxNAcndqjIbW
 3nG2/Np8ktO2FNt/MYA==
X-Proofpoint-GUID: z0S0VecQnXZELtHRlWEMsPhpsDGnetyc
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0e7e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=-rt_0zctJVaUuj_7EdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXxQCEgcQeiz3P
 3s5aN9bAm54OPCt3Vm8nycui8DifFjvSUEBZUaAih1lExaOdJ7sC+fyrVcDa4xg/gkuuNCR0mBF
 E+fILGQB8Ir0LhFJLJvZaloSkZA/PTQ=
X-Proofpoint-ORIG-GUID: z0S0VecQnXZELtHRlWEMsPhpsDGnetyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 10/15/26 4:28 PM, Ilpo Järvinen wrote:
> On Tue, 06 Oct 2026 02:50:26 -0700, Gopikrishna Garmidi wrote:
> 
>> This series adds initial support for the Microsoft Surface Laptop 13.8"
>> 8th Edition. It's built on Mahua, the 12-core variant of Glymur with
>> cluster2 fused off.
>>
>> As on the Surface Laptop 7, the keyboard, fan and platform profile are
>> handled by the Surface Aggregator Module over UART. The rest of the
>> board is close to the Qualcomm reference design.
>>
>> [...]
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
> 
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
> 
> The list of commits applied:
> [1/5] dt-bindings: arm: qcom: Document Microsoft Surface Laptop 8th Edition
>       (no commit info)
> [2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
>       (no commit info)
> [3/5] platform/surface: aggregator_registry: Add Surface Laptop 8th Edition
>       commit: e93536b1fcf775356b06ddc845461e64d4c87313
> [4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
>       (no commit info)
> [5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
>       (no commit info)

I'm hoping that's the tool acting up?

Konrad
