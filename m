Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C0B3DA5D9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419171; cv=none; b=kEmqtDpiJ6KG1pOKb7fwkVwKmlcs8+TVCvwsEeN0i+hDjL3FHf7PZOQEku+Dk/eGqgebYkPSohMhpb1keL33s60/07PoVpXFHpnZUU6WaV7ulm8O9IsSIKU9uFm5tvZSh4TS1y/xJZTT8LiJVvlqGm9JML79rfOa8Ryxaa08Drs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419171; c=relaxed/simple;
	bh=ESxyEB/tDsAO+oi+pSDFTqjZIxjuG8H3dDWNdmAQcac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNgJBDv9cWNTnjkzVJtTgoTjF2l0K0YgL7v8wxp9FUJG4cgSc9ZD9pVHdavIcuHx25truAWFteAeax1Z2LRyYFlc3XIAWRoS75hU7Ayjp/KdHWoAnfv+vMZK0BJZ66qUsbCilMRYKA//GNLASM4iaEGQLkvy7Ec8QXJQ7ugR2ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpA58R8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YF1tcoYR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpA58R8J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YF1tcoYR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DeJ33243142
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=; b=VpA58R8JiSlVbUdY
	S6MHesUXfkwIBo3HzMez6adaN2gWzDQNMFVx+ZUl6tnES3W6Tj7pt6rjlanvjnT2
	o/GnGIDyN1LLdP8ZAQjUn5H9g+jqKQbT/8WiEiA5LlB8OHGlELSDOY7sXwVeBuxM
	4EIFlwi4NOfosfmkcncRQYCNxqXSP+S3tGmodsagdfWod+a+tOVUPuh34/QB30AE
	Svx22pQiSPcvtll2QpJgf6rGYIdQGtYXyJ1ve+H4FGtlD5ZTHp/zXAGmt8JO4v3a
	sa++8xf7Ka1c5Cwq8TOl+nzZsUl2njze64TKgSiVxSwg5mWPewNTIrc0pgltRBFb
	Q3pCtw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rp36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:12:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so11061041cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419169; x=1784023969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=;
        b=YF1tcoYRDmSD7y5p5GR9Zjb5ama3KShagHmOjhAL2KX1slw3sOx5Ny6Swo78rrdRNQ
         DBhU9WrxYM30PvDIOPQ6fhXq2UnomA79ybIVelILpwkOvdFEw5OJL3ldKQ0jDUIIbdfW
         ACc0xtx4pDVVFDGb04fRrhxvpY/uYPgGvnD1R+MqtF8aYf19YdtfNaJTKZO9kdbE53S8
         tk3qCVgWTTFZAf2F8ch1lsm3Z97DH3LaPMRuvU1VnUjRF3ZaQTcNv1Cgkugqbw/9T6Io
         jUaRmCSMVqoXjxnPm89GqQpkYvIKajW2iUuKl6CcwVtssFYCir1m6RYXxngky5KlTXID
         uZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419169; x=1784023969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=;
        b=kP56a8iEJey4FTw/L/c4JaskV4mVdXEchVM0+OawqiGAxDFZS0AVHjGGE+L5GfwPWl
         NPkZH7ROsml9o8JmmY9dGblaWDGUmilgcoosQihmYXG0USNSEGsQB2GQdlA0yaf9dpd2
         ukUHLb3goVLUXhn1TBkk2aSRKbg4/0cFlOysQsZ8qWmISIBKrH47P1gjuAR3KsTF+Ya1
         D8zbRYCoks2wYsWCPtWbGeK4uvazw6dqdfSNZ+No4gjiQfMBjGs1SEnNnb5unI7aM1Eh
         fJ5BKNWOgG0JITEPzIbME0L2WLMPh3D53cJ3NrDDd9T8Y522vzfSo0DLRM21Tno7B0VA
         LiAw==
X-Forwarded-Encrypted: i=1; AHgh+RrY1e1Dic5eKCWX1ldKW4J/7mbId653uYbSDUmprdR4CEBBIaQNdPH3NdMQWaBxftkzMhyr2MtJJjmN@vger.kernel.org
X-Gm-Message-State: AOJu0YxZeNQHVO94bRYMbPlUSgCxGdX2lKFRntNg+oOeLTCWLu+ud1UY
	Ny664Le1ZG6bVRzOSMiFT1nWxBudS5gf5rgoRTHrSaNmSsBfOvWY9jcN387auaamAwJqR2MANWR
	7F2Q15OPsyfg8U7xIjKdXTYGl4ZdSpDpwMg2BxZfvIXsub7J0Nh6tR2vkPq4oAbQtziiiCA46
X-Gm-Gg: AfdE7cl9abYCtQauiN+E1Aj7GUQthod07XUXKz5z/Z3JaOmI8qMjfDIIeAIV39bzGHH
	MffBnnbyg643/NojMACstgKIfjaO/skD+v/wWarx7pTz2O8RSGyK8gP/FX3ztiYycW2jWSOS4Ad
	Db5pE6GapoQuGLVf71HsiHKAPrfPCCkfaPtiuSKWlN3m6oqyNUnkM7svj70qM5a2B+wvoJQFR3C
	auXyNl57ZaHTtVJtf4Kx6QyIauY3F6Q+gee7nOOL349m+h8tjeSSfXh4jImvl5bxtwg+z7PED4L
	lE65lP0hxUgOT8Ol4wVq0WJSvMSCcfxnKiTyKWG9wRKAEbM6dvWFJDkeUtusDOs67eksoyRuQVm
	VDMu5CyW338asJICylNl9uVWdp5+N9/PSAKY=
X-Received: by 2002:ac8:5a0f:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51c79ed34b8mr20269501cf.6.1783419168913;
        Tue, 07 Jul 2026 03:12:48 -0700 (PDT)
X-Received: by 2002:ac8:5a0f:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51c79ed34b8mr20269231cf.6.1783419168432;
        Tue, 07 Jul 2026 03:12:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada057bfsm98437966b.43.2026.07.07.03.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:12:47 -0700 (PDT)
Message-ID: <36f4507c-2524-4a9a-b38a-7d061d13cd4d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:12:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
 <20260707-kaana-gpu-dt-v3-4-8dac9a60dd5c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-4-8dac9a60dd5c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cd121 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z65YV3W3F_EkYOo9s_QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: D8TCVY0XCqilJQYUSm5LuhIWbzSp9H0e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OCBTYWx0ZWRfX8PyOtrMcQVve
 JsMw2AT8wLLHX4ZK7FzpBEDtir/AyNNMoiEyL6JOc8MyabFbnMg4S2KCXtWYKZ5fsKNiXJHD9il
 7/gk7FIctVHR8JmcD5dJshbVg4WlYeY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OCBTYWx0ZWRfX4CTtvjbYDVFk
 9YD7iilFilsKLTjg7R1z+YFNEu84oESmdVb8FAYmlwlMMb3y/9yhmRpB5JThLFgoXcXmYY3DH1C
 d9SDRXjsonuS0y6ehZfw/LYrO5Q3sV8x9CxruQopCrxjnvFWs8sGM7PEaFSVKCVgS8SyduKOHnD
 iGGxExNvFICLikNVXgkp4gwlrxyITRVmG17GHQW3ARAEGxaOZQZdXfvR0JuC/99wCwNll0WYxTc
 VbenoUSpJIZEtCOKpJd0LI+8fRmOF2+IRO8Sx3D7zzCGcYcZ5NDI1873jJ17dSoEuFPAEU5awJl
 WTmbGw/xjXGVHlEHZFtohHE2PLkzsQl5Krjo0Mw1AQC8X3jgQgMqNawcUWhecNBMCmsA3oFvlqh
 YsDDGMdfHnE7mkBjQ39SC5EJkxxMkoVKpBXO2UPC65bjX1ClpchQlGsUIORsvEaLQpkblYcamd0
 dbBIEDx1t21hudyfDDQ==
X-Proofpoint-ORIG-GUID: D8TCVY0XCqilJQYUSm5LuhIWbzSp9H0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070098

On 7/6/26 11:40 PM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
