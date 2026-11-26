Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705307;
	b=OoJtQ9l67bFqz3gA6t5fDFjNPHe75zoFHEU2u+Vhg6FuWuwHsisIm/w6zNG/uA81rDAt
	 CbJ79Cn7tAM048cSVueDVNH93qC+sxkv+Ega3O45g5LEGtRzNf2t2yn6qrVJSwXUMzBN3
	 B3vI2Q/WvhBJl6C3vRsIXsqxWNSH7rCkipD6CbmKEuBqbxNXNbULq4fCp1vQ4w6H6enDE
	 dR4dfgTDrEPGjbkVWghyUmMCJaAuiU/VC4TxoUKoz8tMPD9E7K+0igClryNdcVZT0wbsP
	 2ZGx8Vo4LSb3OF7zTCs+iHGt3ppXCbXrg7d+biShoggFzGykDzbHRDLkHALrvqR5fBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
	b=h7NEgxamNrXtsCzPVWV8k7DKJRbazQjuqSur/+JIwS+Sd9E6VuST5nmDxJQOCvkLhWsT
	 7XAYwxRaphfqOzpXQaFgP9+dgSfTzsZ0Knic5IyWqZ3EPRJPG0rLos0TfbNUx1dq3+eZN
	 TMiAwM/l47TNLcYpM+QFF3j7g8TZ0aNiv9YiX6rwpjWHkw6B4r0IIvBGBUZHM2lRhzkop
	 rhlfqQ0sO3J4gSL4xnXF2ARorR6eRyLojTXOU7d/KgmgHFToGRjNXZpKyhj/naKFQlnJv
	 CCLVd0krWHhQkKGof+ILTUcizhcJVlKs0o3loD03DE3Og3F0qyHtewdRjnMOz1DJT2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWclrFBy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cM1leVt6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B1606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 762B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWclrFBy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cM1leVt6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVGkW088862
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=; b=lWclrFBylEkYJmnz
	uQqsbH3qxDtNpVUljF7B2i5IowP3/Oz5hHlLqH2U8Iyjwo1ACDZJplStp2qvZkyY
	zBA9II2Mz9JjOZQGYlv+5Z6DuuuBpaanwklVZ6x7e/++ESCfR1/Laypp6cMYICX3
	ajwQ4hQXebB8lLxGlADQnuWmKjmzAsREYHp7ecQW79cKIGkSlndiYEFMaDmRicVL
	TcqeI8UcjjWNIoTakZqg3iJTrQlVoIjWRbaXZ1A0PAZhogBCX9AOnz902WUl8VWR
	Lk46w7/BeCv5eKvATozGYNgNfetjve280PVTyMjT7zXWV1v2iZX+NFXNEPOAy4cn
	VJvQ2g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm81aad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:01:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so362170e0c.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795705305; x=1796310105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
        b=cM1leVt61HZ4VV3DoLtiB+baFd/YUABW7QazNIaiArAaQ12dDZTeKtStL2UqwY7OH5
         GDIz58YvKpRoumvSKRj83IRoMyrKu/GaGlU8isWOKnYkBWRb2VM6214/Kjm098/HrBlC
         77pLAdxoQMPdVFzpnf9SXpXfvP6MqkRF54aT0bFB0kFYM+GPbHJCBwK5aMip/VqpQkDv
         vW8CUEysjNEumNq4Ub5qRrt0UCVn72HCCUZVd39zntCSewwXIKpnvVik/wQ6L8Kq5MhM
         C6pB94yj4otSTSLr8+jnpXssGPM9UDi58RUDSc76x9B5cHst0vJurOEOBIlts0UTmxgp
         EbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705305; x=1796310105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
        b=TfnqTQPmM2qX8+ZiQ9/ZvEpiMkKv2Pvti3mHZpkjS5vQz1EfRyhLKgHK15OpbjfiFU
         5HZXvFLx8bGwiv2rkgbUMN97ONPMRoyYj2pro9OZfba9Au3fI0dvWknxE2Sq/N7ZUtV9
         +XRo3C81I01ulPGMXryJZsfzQlrp07R/iBEjB4Airsu19BGf5qCfduJgyP3E4Zuvr7ms
         yWAgx0GmAIiMLA32Q4w0k9Gvfk9fbhwgkB8qIorhS7LE87HCT6HedC+tTNRFhHjaWQ5w
         eADULEJFOdmN8AV+bpVAodBalvd1j2tEXmj/7BRKUzrQLurKec+X7hfAA9MJYvVKJUZX
         M27Q==
X-Forwarded-Encrypted: i=1; AL+hErGLq8vPqKkZ33YZSZ4zHhqxy7dzjKbaTU0eTbJwu8QEe2xMcxrWTDp1691cTYFB5gwtLAgcYgFfxyRh@vger.kernel.org
X-Gm-Message-State: APuU4Z88bG28jkkep2SalEX+clELHcBXXA5vDgottRvLTesxQNqG9Tur
	BvbW1Xzu7buGTElfcwfBgh5LEX6cOTTiOXoqYPgma/afxEKsX0Hx018z5ydajQSj4pi2KmFxbDf
	xN8CANLhKlYG46eb1cbE/ugsAOv3yeCiYq3e8ySiVTGNvddZkU5lvVmxVU5uGmPN7
X-Gm-Gg: AZFdTZdpJ54eg3p0DeZxHX9RWBb2DOeBLJHcdGIWX2EIUkbvjIvmuaDEQXTeHugsc2S
	eQPLSc2HvC9peLt1NmfBzROe5YvLduaKc2lCsRzoqS/1xv7uloueleXncJSEmhBAmsFYL50C+H3
	Iv0tlYcb/7HZp7FmOns1mvP4e7efnYEC6LCvzAqO11Fe44DE6Pi7CGbMYE8OSZyyWvWAbPOVoFq
	7VRWA9iRd4DYjFXpSozNOzK6Bv+n7cvpkJjRF6vtGIyn8FG3l0SYqRRqYYVL6fvER8hw3loF2Nw
	oUp+cgLp1dQjnWEOirxa+giP91U8i3ZJ4wEqSuGfDyXoT10Jbkt7rCovXiiK7yh71lMV6LkBgWZ
	JqCRNoMrViiuOSYPnxo1srUd3hCZAPvKWmQHzf9dHL77htk1QFur3iAn21x+oKsrksLW/Sfg=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13275356e0c.5.1795705304692;
        Thu, 26 Nov 2026 07:01:44 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13275286e0c.5.1795705304183;
        Thu, 26 Nov 2026 07:01:44 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm790932366b.4.2026.11.26.07.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:01:43 -0800 (PST)
Message-ID: <00422583-53fb-47a7-bcfc-f517b84283c2@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:01:39 +0100
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
Subject: Re: [PATCH v3 06/11] drm/msm/dpu: Fix DSI tear interrupts broken by
 adding INTF_9 and INTF_10
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z2dqRXsmcRhetqozgCq-eHN-WuIUdqOI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX0v55GhIhr6EN
 7B7YxlAKncIZPT/H6BgXtlhT5oQYR2HyhSjb1XCacWy0FS+xcVj2NEBr18SG/I46WYcPSA//B8Q
 liprrmiahgdx8znt2nuA/67F9stvXFA=
X-Proofpoint-GUID: z2dqRXsmcRhetqozgCq-eHN-WuIUdqOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX1wg8MYHQLKIq
 STzXNp41Wv5c0OgXDyuap1VSjjatTDzSFXQLfXDVF502GS5sidr17HaJEt9ClsJFVPdv2U89D27
 +5YPmFhwVFXtHYW9MW0XmWJsa5yhkFqLK0Hxald7NJjdZaTEHUOgCc/mRYbvWBCvme2ctUSReUq
 WGQT7aI9q/Dd1h08Z7hiOpKeWe19yOnNKcIkiCkM8xhn6WzOqqmGH0Me2oKcA4o9cKDnkgJz9sW
 wc7EWLnR0sgh6NAPTTCYBvxUAePdPi5jeDwwN50q9Ok1VzOeeeiBiL4VOS5fIYWhdzFBVQqjCf1
 /gbp9OEfrylxuKOk60RzsFccPnPFNVY0QuURm7GWMvPCvnZA/Koot5Ag6GY9bnCeBDuJPkUibUq
 JyKI7EexQdNlO5guycZdkUgfKBd42swhIWMrebUFN9W6fiYn4q7rTPSe2x4A5POuivW6WaMFgaw
 YzmohjU7TPVZSzkt9lQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b0849d9 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-NiRQLekuLvWmI5UBGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/16/26 2:16 PM, Nabige Aala wrote:
> Nord requires INTF_9 and INTF_10. However, enum dpu_hw_intr_reg relies
> on all MDP_INTFn_INTR entries being sequential — MDP_INTFn_INTR() macro
> computes the interrupt index as MDP_INTF0_INTR + (intf - INTF_0).
> Appending INTF_9 and INTF_10 after the tear entries would break this
> assumption, causing DSI tear interrupts on existing platforms to map to
> wrong interrupt registers.
> 
> Fix this by inserting MDP_INTF9_INTR and MDP_INTF10_INTR before
> MDP_INTF1_TEAR_INTR and MDP_INTF2_TEAR_INTR, keeping the sequential
> block intact. Add the corresponding register entries to
> dpu_intr_set_7xxx and dpu_intr_set_13xx.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

The subject should be more along the lines of "add missing INTF9/10
interrupts". Then, the commit message should explain the reasoning
and effect.

Konrad
