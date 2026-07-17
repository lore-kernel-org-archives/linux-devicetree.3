Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B49C3E832C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282658; cv=none; b=HHXZ+GoN5s693ZcM/uGE+fdHpXly0DxtyDLj1tIY53TQek/3hgjKRAUpTArFIKN+URyyvKXjj/XeKaQ7CxKZo7buRzhDc1TMda1CmrYSqrWTkl0u/2CllMJWTAbXbe1ZQZQA9jpeRb6lQcsXC7LGiFWtBIHRewLUqULriRcLU/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282658; c=relaxed/simple;
	bh=b+LOl3IQIWey+yqKD15aAKzUfwpcbFTQfAYLBqw7JY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdNdSV/IyTVb8MptCnFP5lO22agPBdIb3FGfQPS3ie/r8bjUykM5GbfkfMR6YDk5SIQIaYqo2Fk7NVVhWA+WmeE69v992DDMF1RCIe3PqPVjWQVv7kCGjTdxuQBNYSyibhPAtfDLaPyva+Y2NJgFyvr+Qg+ILQY1P0ao1xIN3Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRg1oEUb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7q3Qx4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRg1oEUb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7q3Qx4A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d4OG821192
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	anIBn74AomYL3LvVUUMgs2E/qq+99IUZOlzTnnvEbFM=; b=MRg1oEUb4Ni+i2BO
	85OR+1wFl0TJaLyWh6kTHFHLaUjOj02Cx1mtmUilXdPxNcb0DnnWBJ4skh/mCkA1
	b9KmpzUt8yVzFY74+PuBChac/gqyBCLx4yJSJuUtjQRhswQiicgCzK7dF0qiqqfQ
	ZTDxKD4gxoGhuD7/cErPwg0+vk0CNPQrRZwg0/gWe3f1970scNms3dAHTOvc7KTv
	ufs39S7hoqiVvu9aqfM5PZtTG2D/LXlUwgVqL+nYmT/VPOdL9aSNkMxEspzoN5H6
	I7VeS0QMmRCoU3UZxipET5FLKH06WNTwwJX4p8qPvCkSqGNLywbVhAM++An3KYPh
	qeuKDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag8rfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:04:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so15253891cf.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282656; x=1784887456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anIBn74AomYL3LvVUUMgs2E/qq+99IUZOlzTnnvEbFM=;
        b=R7q3Qx4A29+ftl+IGmAeO/YmhktsLmm7i+1Pq5hE5RCDEp9rOFNyFJGgdvIWi91hEr
         JxGMMk2wvaGpv/j3oe2rFS0UUv8PiDJbBHAzLzEQtuvtQ6NgRwQKUYgvAJUa6H5HE94l
         DhsgJYgUo91i9IlUJ9MG7NxxPD1zzsi2svA4oTMhqAaoOwUt98f6klrVpBcSLCO+yK+J
         f68q73KBy+qhaKf3riCuc/TcS4ufEFYdB2FS3Jru0pzyZCr2USsadbHb3UIBZRZTJ6vB
         YRP60MfqEdAW2VJonjfeVsf7jhbXEJUhOFkhUtEvCXC3XYPoHgk8qOWe409Z3ZrV01Zq
         zdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282656; x=1784887456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anIBn74AomYL3LvVUUMgs2E/qq+99IUZOlzTnnvEbFM=;
        b=g24LGLPhmsTb9Z/osAKVEHdJASkSKlxYN44AsLEkcjJjZwcRaA5o89/LQ/BAMyw5RC
         n1Th/BWVYYzMotY6f28O7YuwyxDjvZH/pNow7/71KLRJKU2B2L2zSvIQEZdb5q+9CIGn
         ULLnCWXSGQ7b1rIPF5LCSleHa7briWckv/JdFoe0XHesOAMWwcGNrrTn5s+1N6/c3d85
         qbE4F80KdwYzItkb3yH0PR+pgZR7AlABwLehC62agfm/gLnAAxLpmZe48vsPRZwXko6k
         VnA9TWu99g/f4VfpP4vUdH91iMFh5aIMlqx8t+ebV2OQviM5VpR98XFcIk8wl8NyCrao
         oOeg==
X-Forwarded-Encrypted: i=1; AHgh+RrLXZUs/CQhfCuX7CNPEuPUurA8v6dvzbRRwKkEf83Hfqkh26C/6D6wTewxRPpgu7O8QjsecNT1lOeZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx02J7z9qhTFn9GlMos5bXMhyMipJjXsByBBJ/0fv6W9TNm+9ig
	AlseHi1EoicRTRbObj8D2jHN6w5Iy36/4ByOIJ9JCN9F2aKkKNK1otuXsGtrnw2zNfuAZ6Y/SXQ
	dnJ0S8ki/lBYGBWh/lj+MW05caTxV3bo8Ue81G0Z3HhpZBXiY1y7CD2A8tlVDsRI9
X-Gm-Gg: AfdE7cl9kzpBQJmuz4E/pIeKQvm7UyI1CgdZ0HDoDozFLtJRRv5V1W7dsjozTWDq+N6
	3Bw2vsu78B/jUAtcoas7RVotrZN4b8p353M/0F1ifhXs9ZJnB9RmUyiTzBER8lA0N/3dTkLg9BF
	0IW+CyC2nv2/WMI5b4HyKNzOhYcx+JsPOH80GqxUqrTlC3LPZXzYBq9PiOY4Ka+LiMn51/KMx/E
	epjAUqX7eZDCR1AN5Wf7j9invNm/vykCwLO1mYui1QGFTi/3L/TLp53r/o0frnBLfAWf/hXH48E
	g5JsgtipjLqELHygnpC4e5Q6D3JsTJgfA9b8oTGcvWQreJxX7lDH+aHEzpA/N+F77iS2z9sSmDc
	r19Fa4TcvB3HM7635ImGeZrIq
X-Received: by 2002:a05:622a:1c15:b0:517:5e32:f3ac with SMTP id d75a77b69052e-521382dd29cmr12698131cf.0.1784282655973;
        Fri, 17 Jul 2026 03:04:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:517:5e32:f3ac with SMTP id d75a77b69052e-521382dd29cmr12697701cf.0.1784282655380;
        Fri, 17 Jul 2026 03:04:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17127358e1sm51516866b.25.2026.07.17.03.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:04:14 -0700 (PDT)
Message-ID: <2c6b3958-696b-46d9-ab70-87081610524d@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:04:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: eliza: Add GPU nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-7-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-7-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwMCBTYWx0ZWRfX285WxvdZIGXC
 bdM6IgCZdV6ACpVJIAtVzHsRh9+Y0+J08DvZ1HWMySE+ov74gamQqZ8cowpSH4a3b779vnnQ6bn
 js71tb35efDvRkMtwAPmWNHgTBVTOmpHer17LOzXOoJFOfeDcO5P1p4hNeZDuHfw3Sebog/knqf
 NUVwCYgO9zKwk2p2qTNmEbLDs/mu06wYBOR9nrfKMN7xVrrXAxyCEX/ygN37Mn0cVEZnTDuUbjF
 e6GFaYZ2D0/QjTo/MdRHpNhF6AuP7g/PAnvzPxgL4kwZeGZkWjkoRjbVftM0RYl2d48QtpjaMs+
 LkdS6b0BaeVlpa3drJ8lUQq27o7SnCtWGzvmPehSqB5/6zZO5ZsPSZg0P8U6URwZSS42rQwKqbI
 LQyjmN22UOPFACPpdvOYoRJdqLUTdW3C/W9G6XP/z8ucP7wG8QWnk2mBKHDoWlPNWZl3c1fVx2T
 cf/yjHJ6U9OuCtHrmfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwMCBTYWx0ZWRfX8asyJOKCC27Z
 oP++i+iETd7DT78foY6gKv2t+x1Al8SpcLGMmaMotq0cu64EUFtu2pHDNewfB6pmp5kUyXDiaFj
 Lodqe3535Pv8gvNLAoMSft93FveOvM8=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59fe20 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LzKdWfoJb4QxxMUDPeAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ueZRCk09nIVe5MjJyanretHKqzgWHf6c
X-Proofpoint-ORIG-GUID: ueZRCk09nIVe5MjJyanretHKqzgWHf6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170100

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Add the necessary devicetree nodes to describe this GPU.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

