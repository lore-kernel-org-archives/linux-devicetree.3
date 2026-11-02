Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624593;
	b=utwmdcUvXJpQ1zk66w/Gy6uRYIceP5L0WlddXRoa/3EQ0NXOfTD7MHN/IhweB79PkwmE
	 1u6WdRul7WdjKD5Je6zCirKAKH5xx4wo98xnBFpMVjpo5AbQpeAuJEMkI3X2KlFsKYFGs
	 30lOoMxmImD6cjV2cijfwIMUtILo59PWFCW0IYqebNHraFEjZHFQs1CidYdbpDH7PcJz7
	 UF3xvRRxk7QDTxOB9Hg8CwnPQJE11X3zpw/KoIgRqsEgBdOsENKqmCtILSR9+tNYpSROJ
	 ebIoOcVlMgKjRnCvWFNC0c1GqPnt7B8LlVfcd/h1o5CG0Tg9xEZCcK0M28uWQvZoeOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
	b=l0iQA917XcX1NPpXJPSm7y9MS2O21hR0hzreXnm0i6A7cJJPCS9T0Ed/wGbUK5WsdSz9
	 aT9/Ac1hd2iZS2j80yMYpQX3aIrD5aRqU2OBlbHWw9PQRzO5+5fwEfQbikR4Tml//pbxo
	 E7WoeMtl32W52+n0llaIcV1F+KPoWs6v0WXxd357X8+cww290lK9BeHm4ojxO/h3RnuJG
	 BgMCRttSddVsgjWlxSYh32geTlsoQxn/g2jHFFy8AliCNk3VJcty86GKTnYOfGKCafxJV
	 V3uGwdFQhmUYKJuqQ+TETeFRd8exxjDxsmlF+1weEc0Fqwy15/zP8Q2FIEe9e6VXGiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYVjH4Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPV2d6vU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AD560A3826
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2AD560A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYVjH4Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPV2d6vU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2D0Ta93400794
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=; b=YwYVjH4ZysaBu8l4
	1s0nZo+iGjK+TUj4pKtuAYIgm2/oTd9cAZnCEL4/aJ3SCEY/bVs/r34GqFyhhDtp
	kE+HM4nuJAUnHGyB1n0J6SXPgq3yzYIdLSmt/DkJ+T1gC3BQsG47UfIs3rTpJOM/
	5jAQL7jqFSR/0nSwD+nc1UirHLDAlQtXcr9FWk1GfPinRIlawK7MsGKhEwfmUKSA
	dAQdl2CwFaleNszRvUFQjup3/S7IZXIVMB32ZADWZkIdtm1tNMWBpVv7KNKXSm+C
	C/KpfRer8MJDWFk9C1SwR1VPXBBjMbiiFOBvmgiq/yB2NbTHWtqUEGocwvSR6aWE
	Q2ddTg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgx0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:03:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac78dbbe7so59844e0c.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793624591; x=1794229391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
        b=PPV2d6vU3dkNgj/EjU9o3ikjWRFpt/4a0ptzsDB0xTflzIfNp5Si22g8PYUhcESSLj
         +edLQVYT8VdNoIOZFgQi2ia/ZHypKvknfJt3eM9MuZpfvRYJrWxr2iFv1i5BC9IfmMsM
         x80emY4jNV3CiJX2gu9QlP0o9SWjB9Xqyo8v24YyKRhlgOJgLpRPUyoMlvr+FPT7qXU2
         2rT7x0BOZYoaBRugC/u7DDlMkWOyqj5xaD7pogN4BCX2+C/ONFynHDue5vLigddYKAOv
         ZdbFrdkJioOECM8e6o+uc0Ol1CthE0uHDB4m2Irmc5OOQqn27zV6tYSDDld7/lCAcxjc
         fA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624591; x=1794229391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
        b=XgW6v/ISzDTKBXl/4EZeuKyp/1t6TU9bPUkbnhtsiivia8Th1KGbVVE9Z6AK1yXLpe
         B6UOaxBtIdV5y6kRNSeM0exZVjxJ1PwvEv134VacwXE+1ZdkOEhiP7OGZaiZ2/D/kzbF
         n0DPdu0ftxpfaS1vkmlNMhgaPOiURKxdVbe7e6miyNRk+QipdTirKb16rTFnsY2I6ao2
         TYHpSB41DP9p6CocgaKdEA56XFU9tZd+jG3AkvW2kqbX74Dt+aJT/4TIoSTnN925651O
         8nyYdWW+PIiFG/QdB4qd8TH42Otmmkgap23ZUrdDoHiDikqyIv49wvC/rehO3sRQtLrW
         HJOA==
X-Forwarded-Encrypted: i=1; AKwUvBxg5wMFh6MTgVp7oq8itDLY/BuWVNVfgoRBGS/PAZgA5R1ZbXF5IocfobShzk8AGpF4qyG8sxHHdHme@vger.kernel.org
X-Gm-Message-State: APuU4Z8SvajL/KDsTSGSWt96GHcht+7CWRXvl5ziAleqjbdTB86/GRQ7
	Fb0tAkkqu8ILKUySl3qX0/IIfvRMhVpSDZLmhsOCwKYx1AOcHTEEw93N++EFu1pbqPqgalAOGMF
	CF0bzaS3KHsu6nFErFFrUleilLG6PCvfqUzS0PC/pRJ7emZLFzcrKnEX4gCqdQHj0
X-Gm-Gg: AYBFou0Jh19S+qslCuhOhnpVtHv2hbo2Me40JCK4A/ZRYaZ0sxvCiN8u90l8HDYkOE0
	1Edh+zkpj6B4btnhmJ3Ik2VIobSn5II75cNIYEmNkMRLoS269Bn74kg+cBq/Zf6A+LvJWctA2Rt
	tAnegZti9jLqUfRtRyd+J16GmZ6smDZDFmyJrvDCl70RzbXniyrWSWknFhJxvNsDS+y6/B96H95
	Cp24YzLVc/cbO3ox9CIXGeYis+GobMl9CXllJM9ltD9pf7iWGjVP7SNOAOO2d4/Lp1TLWLM9EOq
	ji35UlVDxvC/II2InJL1wjUNglatqN8FHm4JStrlkkgEfUbeTzKHew3HTvxYl1/SM005JCv6h9d
	tGez6B2dJUNzA59Mf//4xU+0vQnZwsalTM0Ch1qK1W438N4BfTSQtf1iH40iC7VCANrUW0Jg=
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr4388732e0c.5.1793624590339;
        Mon, 02 Nov 2026 05:03:10 -0800 (PST)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr4388694e0c.5.1793624589652;
        Mon, 02 Nov 2026 05:03:09 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d19csm1698389e87.40.2026.11.02.05.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:03:08 -0800 (PST)
Message-ID: <14d63775-3024-47fa-a495-60351c31e6eb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:03:03 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 09/14] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88a0f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=km2EZEuaMOR48S9SEsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: Hmeytn-Y_Yk7gL6VWnaVNfCAuQIx2OvI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX2HTSQzEjQKyz
 SUGj/FyEvOuFPR6zdUzGATuXJMl+ovHaSbNMoOgf1OA86rMlxQZ1JlLXhIJ7umZ3bk15682tebZ
 L/jZUut/PlDt67KSLc6b0X+Pf+stt9w=
X-Proofpoint-ORIG-GUID: Hmeytn-Y_Yk7gL6VWnaVNfCAuQIx2OvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfXxE94N6/ecvYh
 sikSISxZwE9xtPVLzp3Ga2k0Y8jVT5FOrFXsgkDbeEqX2uFZlHtUSOeVwA5PrM/tmlfJwE79ijn
 5xMGhOstbUyoxF4b4sZvxSA9psJ8arev7URYFQtOg4avIaM5/rl5ZKWTpnkSmG+nFpU1jgE6chp
 4HgSug5z1AuA+ENZ6c20lPuwtNIzQ/TMVHXYefPkL4oSqquw0O0aHXG6fJS0jg8NYyfkEOgjS59
 NnIGDKwjGUkErKTpUgwqmqqkn/+fgUg7VmXGuG5WP0cYNxcIDTkL2w19nyS5qMzq6kY+FOorHoO
 k20sMgYvqhw42/MjMOCHZQkLmXOu3E6YCmoTsdWUDvYrSBemjJrJgt3j45G4IhizoaTfZJJCdA0
 srd6DqWxAJrAu1xowPTt3xUucMMy2//MhFSm/aj/WH4t4kdxgePL8BeOsQze1hZkqnnerZoX08a
 m3I6F/BohCkPk8PxFdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020051

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> Program all the register needed to start up LPAC and send initialization
> sequence.
> 
> Additionally, now that the LPAC ring is live, make the code aware of it.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---

[...]

> +	/* *Don't* send a power up reg list for concurrent binning (TODO) */

Here's what my robot came up with

human tldr: missing the listed registers from a750_ifpc_reglist_regs[]
and a7xx_pwrup_reglist_regs[]

LLM:

The strongest IFPC-specific suspect is that LPAC setup is not
fully restored after IFPC. The series enables LPAC on gen70900
(Adreno 750), which already has ADRENO_QUIRK_IFPC. When LPAC is active,
patch 09 programs several GX registers in hw_init(), but adds only
CP_LPAC_PROTECT_CNTL to the A750 IFPC restore list.

The missing registers are:
- UCHE_DEBUG_CNTL_1 (bit 30)
- CP_LPAC_CHICKEN_DBG
- SP_CHICKEN_BITS_2
- SP_LPAC_CHICKEN_BITS_2

A likely fix is to include those LPAC registers in the A750 IFPC
restore list and the applicable general power-up list, so their
initialized values survive collapse. The KGSL code in this checkout
has a similar pattern: it conditionally adds LPAC chicken-bit registers
to the Gen7 IFPC list when LPAC is enabled (adreno_gen7.c:652–660).

Konrad
