Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAEC40961C
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969417; cv=none; b=IQdVlt1UWILq22mT1XOaH1H2LvyDCGn/8ApTCHROPViszdcCcFFXbX5D0czxVbaDqcN+fXOluKtc2dxn1SVy5zHOG+r5I7Pl2yGWvhXCumHEfmfd6WbW5UJLD051zt1aUiroMV/BUl26co6SbsfC5FoJWATuvthH1/NyMnPGZh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969417; c=relaxed/simple;
	bh=wfkEsWkGGM+8nn8tEP+tS2uM961N0GG0WvR9mkZOtG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKJpGWwlHaWp8V+9rtaVhCch2jo2QYVDsSgf8cdW9u3mtmt2gsjdd9zA5FZBs6oFMuBsUNZH+uBAk7ppjgXzMPIuhcDxGWIiN891VluDoOt3PNFPdn/fu/htXxSuHYw64YQhvVemVgCfaBXrNax9gI5m7sYwJ/73ysR1NzlxKqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPCRI5fF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2UEZm7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPCRI5fF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2UEZm7B"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HC9tTu1805269
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+OizPuXV21JjPSONb3Hnxw2A9l39gj4FyuXf1WadWI=; b=HPCRI5fFZbp2fS7F
	R9qR+44QkiqBoStXta35yMhjC8EwoXfAJQ6qiTVz6cfvl4xOfWFX6MJOVwPyxLvj
	fezwyQiOUfJTiO1woPK00WlL97EYjFYB88YskCdoPKjRzrOqEhyLULyaa0+ajItG
	x8ne0SU4ci7fzSVI3LsJKn0rVXrOA3kEQl1FWjKsneppWLR34V+Tl1EBcO+MMkG6
	gdN4VbaZZhHBeHpJ8NqXhjmFFHvxQ5Dijc8xIvBSM+xOGn7p6xkbHh3cU76wP1a5
	6cOORnKcJW8xNU2Emj+a8bwn+iu8fzsVeclXPl3GhXfAXjinRetfmv52tfB/Lvft
	6X3rNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7gtw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:23:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so9439761cf.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786969414; x=1787574214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+OizPuXV21JjPSONb3Hnxw2A9l39gj4FyuXf1WadWI=;
        b=F2UEZm7B569YAWybIr2GQh1pxijF25M0Xjs0Kg3VNzbwyrAvlzB3UDfS2Dwomd2ndd
         HsrEgBxSUfcC1XCm8OtNx5nnGAgB4ZTWor/zqE/k1QroOvaAMyom6LMwVjPMB49462jR
         viVPkmJKbTpWTgqybmhgRiLpgxpudD6YvJCZdnfqH74yEMcRdv75cgmeQb5Vo6L8iVR9
         +qz5GJKBOjF5r7gwOJcEe7aw43FGgeGvevX5SycygJZ9V0HcRRlaHVXW6MUY8emZ55dG
         qtk2QSjKyRFObuglQiYbLkBR4Tdyx+5LqKTXUujdNXfZrxa7Zhubd5AskJUBB4xsrw9q
         Ahgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786969414; x=1787574214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+OizPuXV21JjPSONb3Hnxw2A9l39gj4FyuXf1WadWI=;
        b=B64odgqe20G9Z2BYyVSzm/3JDwCrD8i6j1qrs4XZwgWqmGUpFPsDb+rgij8vY/kCfq
         ZZOfeNA/zimVkHQwO0Ub3jK4rc4MWwsXarLOKEdYTqCWFfr7o7MS5TQI2lcAXXJlwKnq
         NrUBUBWdRSlqgaQD7Kz4jwmWRriE1vzKXxN3usRQirvk8hn5iAW7oM3TSVu5k59QX8y6
         Li6RqFN5PubeM2CIoPwicl5pG3p/b0tHv/pt3SARAZl0NGLwrDONqQceBLgYc2aIJAyT
         h63c8PekTa/4V07LwKkn6Tp+jIRbX0/F/UPA5/xL5kziG3BnFt2xbt5k13RISUeKY9+T
         pQnA==
X-Forwarded-Encrypted: i=1; AHgh+RrYOExsMMzNicZjlqm/e58nqqq66A+pClL2ZJZrxtcZh2tKWXALhy3SGDdvuNJUy3PAeMAV4Rvgghge@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3MBmuBvxHctHaaHH3FVYehhR40vklcUkLAif0/rGEAQtDLKO
	g9Xt2dhLKECEp3TzDh19b2oKvq36bWtVJmLuAOpD6eKtZngWpngrtW2B7Sigyxcb5ec/6BhlQ00
	Oa2G3d2+LkRaTeyYwLyAjL5OwYf5Q2CUgotlgr/dGOSfDmIjZCamaz1U9qRgioH5I
X-Gm-Gg: AR+sD13UIMlHgxTLWnFLRpWJPQ486/GvztnzqLxpVlVpyxlZ4azOHX6glwc5mQI6ERq
	QUUTIetqP+qPVBuu9fzurXJ50piu8/dj762JHOMQbi0z7pNphBqs5nVt/altXDqkyO2bRbX/rlY
	L7JFP9tyMuZLs/z5zc0Kl2RiNKNKghsjXHRwUoIsiI7DJ56f4k7Rk0MwLALoqLP+Ze8sgey2ywr
	ezWYzbzyaTMBSMUngxo/43+r5elWL6Lz24p8lpM3vZUr/4QXahD3QfuA0rOIqEYblXTuGD7siET
	EBiw4huePqOkTuh3BkgMogJVZphD7om6HIyAh8aObBRVZ6JMg/IiJLkftXP8Z8+TGd60PVlBxfj
	TMYM5eK47gBybxiR21sPczmkK
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr199864851cf.3.1786969413757;
        Mon, 17 Aug 2026 05:23:33 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr199864241cf.3.1786969413180;
        Mon, 17 Aug 2026 05:23:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1f23dbsm4083481fa.39.2026.08.17.05.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:23:32 -0700 (PDT)
Message-ID: <22383df4-2394-4374-8e5b-60602bcd566a@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:23:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a8xx: Add support for Adreno 830 GPU
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
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-1-207ad1fac1c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-1-207ad1fac1c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NCBTYWx0ZWRfX9q25RXHogerP
 6gLhowmjvp7W09ky1DxWPzPSEwG6I2tANZr5F8i9TI+gPXHdcs547WCAjhgAjSf9guM4V5ceXKU
 bUbVVgBAG95UDd9+wv2OHlaI2J96ofo=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a82fd46 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qwKaBMzKsjHvBPFrck0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: B40WUnZZ4L2-n_S5rWNcyFOdpSaa7NNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NCBTYWx0ZWRfXysYApm8XDsby
 x6qrxcGFE/e/NluvpbOAo3lnaPErp+GsSD1JfF3PJl1YOAOcDPX3S4YHM7AhWdPHm5UJKItLKOb
 UokK5QxktTGp/UTChbuY9xRmFiZj7WlmkgaPtBel9E8hb/uHUcGf7nhlIgG/PQC7G49UABEIOKd
 lmTVNN8Je79Dn6MynNY5WVGxGHid+gUuq+aJOy3eb6XFfblBtyEjFJ4Lscbh+So3YWw6MXxUeld
 W9mowHx8iEwuprVWbvMTP11ENt69MGc8lFIxIVacsLdFImgOt9A3XVEarg+heWCoc7Z/Kpism8X
 53qEXX3tflMblQPOm/dd8T8t4RS6yzatLWklTkqrW+Jsfn1n1wNidQefUXKJ8F+B0bv+EKu6spu
 i29s+kHRWjn640hwkTbp6XV406M6vfmNhraG7FeBSS/NQTtUHTIqQDO3vUJIRIZnCC7xawiZUdx
 nognO6nQS/hKC3FObLQ==
X-Proofpoint-ORIG-GUID: B40WUnZZ4L2-n_S5rWNcyFOdpSaa7NNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170094

On 8/8/26 10:23 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Add support for the Adreno 830 GPU present in SM8750 SoC. Adreno 830 GPU
> belongs to the A8x Gen 1 family and it is architecturally close Adreno 840.
> Add a new catalog entry along with the register list to enable support
> for this GPU.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

All matches kgsl, thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
