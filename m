Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C294C9565
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327766; cv=none; b=acgd248EbcXNE7vSIHPZm1FT+zLTlOv2snVTHA8NUcNlo8ObQem2KtuSqbbryvK/NSB58tcGJUJIofQ36YQAp/EBDIYDx87gRdpQ3ZETwugs8bF045SKIBVvgIJIuJKgJp00u6csgMqUT1gAP+4DsdgRO/PspZXZQSOz8WymVGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327766; c=relaxed/simple;
	bh=1rV/OGFdt+BIYFKUw1YtYeydtLI+LEeW/ot6556DNQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgZ5AZyQMPnedIgZFMjnyx6BBNmS43o9LdqlZjsiBUm4fq6p1cLiMfXtDixbTPvEk/3tIbOnsydZ9psnB62JVC7aXhbQ2yzGGK0JJiJ9KLc0h34szchPjJEH7hLIORSmE9PctjFALTInx8rmxp0X6hElMMnvdLcEitO/SboGmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaqEcrQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tg0rZZEw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaqEcrQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tg0rZZEw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641sSn3614842
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=; b=SaqEcrQZixh8kqJX
	NIbjiiJv30noknviAqvmMqgcd9dLg97+KHUy1B+DowDAtFZdbHov2MJOyoJff6iq
	rqDYW2t4byAMNskkfn2DEmteAKvkbmtwdfnzzGWPM9pYwk9ipzRkB/unQDpp8wQO
	spC9sxDTJrVufwRQlROqiocRM89e1lPBV1O8a+WO5Ti9EHzSmsRDEWPLvWF6owNB
	KQMo662zF2+8K0WTRQ81OMSHEK20fKVNoKuj+ARZc+lVli3a93Wr8++tSyhr4abz
	mQhBlKRhfEKrta7A91FCOx0fOf8vmN+8cT/qCJhPL0qbIjn1JKUVPpUrlbkgGQV5
	z0EtTA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnek1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:49:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efd48cbe2eso7066766d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327755; x=1783932555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=;
        b=Tg0rZZEwzfnSD1HPInJagJB6K9DiQRk0bNCWeoVA54izpP5r/u1dEt2DtMolL2PjCI
         mw76VLr+X9zUCcztubkUCgA0XEP5az4M1fBJ4c/LtWy/M5FkIbLSilIAKLpKTkDQoMZS
         0gdFNnumXVeS2h2t6/SVRmK7Cu0mzhPKSWj/xCHM+IH+8kStKmi3hVmUNTzUClnTaKV9
         7orvYOJ9uqdij/CMYIq3mcT5oWAJCdBm7kPS0vaxzsbnT9D1zO1t9p1uyi+w0PvdCgMw
         xYBukHl8lGN+BFc72ZQVUh5zFt6gXZWHbJEwVZtlzOaERUX0d3MucwmS2MfZdoD+PoUk
         dI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327755; x=1783932555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=;
        b=m+QGKSLnfJTzB4jCBK7HHOtTPz8H0ppfursH0+77AUS9MXdjVzcL6lHoOR8VdYEDCV
         bJyvsEvEVp7arW826j1H8kEBueYtr8A8PoTexfZIYT5v0lt/YFl+qZYfwmcUWKsEMEL3
         P8hVMP0lKYvzZp7RswP4D6YL/kxyF/YDiTnTJlCjuRSD5PttLcfqTDYU8yKEA4Nq9c5X
         Ns5O4Kh4rEsOfDnrdB8v31F1VZZI7wdqZO8YZgG4q0T9v7KGZuH42sThwmbl218yUkvK
         eJ6cggRBMH4PhyQO2lpBvJKrpBWPaw1MTG2tobRt5kGSJhh7qFo+MgrTfzKStv0nGNpD
         rlIw==
X-Forwarded-Encrypted: i=1; AHgh+RqghrWABlxi1jE+decV3ZuwD9sthpVG5meKBNQZA6foIENljT7AULq0jFwC2mTuqYOM17YxrbCZRvg5@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSlqiH93FJK1ktn2rA9DW2HstJ9OmLFFIWVS+6Wq+v3e8R9Pv
	zj2LAPU/ZawnrFHrgsoXo6pLS5kEyZYNQPOhgn+AWzCnZuD4Hdl9GDTC1RoFEwR3ZdcHiNnCKMd
	Vys+dMgHNZ6iBtgKBurs/hPgui0ocFVz4rML5LDO8NJa9YiImxN5yUB+/BHVBi1El
X-Gm-Gg: AfdE7cl1zO7PIPt9v/0L+jeraFZYm1gkvkJJUkTDBrL9Fukpj3ftprd4Zo8uhy8+CBI
	wM7E9n1NS9ZEimIX8NaOUxQbdeZGa8MoNFytvsIc6/OUcPcZslYXra34wkDlcJ87qqbSRQc1NGN
	+xy84KGlGKny4jh474b3weBLLqYP4f9KM7HfNoqEflfrWhmHKqB3RvWaN86aMgRFh8NkANSgJja
	CSM4iuxFs0ySeGewAjSvX6qkaHhwCCrnHe2x2NFE1KW29gDkYEJKLmsTMOg5ZkzVaKSOlP77FKM
	VNYwPrnON7yizlyvUU/W3FMUV9DwpI24D4Ur7Qj4xF3NWRfc77JvxkwvHVczXMznYWTh23U570J
	Y1RlIsnLz6/FQypl7jLZYQEoONiuB8OB5gQw=
X-Received: by 2002:a05:6214:5181:b0:8f1:7139:d6a8 with SMTP id 6a1803df08f44-8f749a7315fmr109103986d6.2.1783327755086;
        Mon, 06 Jul 2026 01:49:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5181:b0:8f1:7139:d6a8 with SMTP id 6a1803df08f44-8f749a7315fmr109103826d6.2.1783327754703;
        Mon, 06 Jul 2026 01:49:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm3455501a12.3.2026.07.06.01.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:49:13 -0700 (PDT)
Message-ID: <a4f31004-8e74-447b-988a-e3250859e74a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:49:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
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
 <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b6c0b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=m8Bw7PwqJOGBpySAz2gA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: aacAgdrGXaE-Vi3gmEliXiIdMCRgJm8t
X-Proofpoint-GUID: aacAgdrGXaE-Vi3gmEliXiIdMCRgJm8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX6DyLrhFb3KKk
 Z/zYH4eXVelY9VDAwA3hIPhRHEsgskZ9dln/xqAy3fmQW1GmGrG6ne3sgxkvLYfDS0HZFm6saJH
 lYtjQATHPgkgRgLywgxFVBfx/BtfK33hlCbuUBG+3P6Fk++ef0xneTr5Kuvt3bqN6rwjSL5M7rz
 VljuC2hCzKNwocnozLSrynnZf/Ii4YgCUEURTY+J1sJrcoIzeMRWvsxoMtHwjt8EpIlNW05X1En
 nNjNP/h5D1ETmpRlZu/dy8Q9UERwiDMgok3jKxsjAUzhTvk1qmYgcg1AYTF/zh0pMD3QseJCyP2
 Drjcocnb/966y1g8jzVSWyJUiaoaIY3nRNJcAdOvkcVtXKm6l0dlRBtdoNmn8iLETsUIx+acqzZ
 U+Dl8mybbIO8jXYRkbY06GgYbY1Mx/PHhLhBy5Vpdf4advDGpigSTkHYBBCezeXa620AslD4Vm6
 UFIzagxXADYRyKyeVeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX/gUHqcA7UKZZ
 Flam1Om8jdGaXLP+AmZeiLnyIogWxZGxJnLm0XhDuR0Qny37DOFAt4x+a+m4ZW1YkCFXcGtZvls
 ab+uckLyv7GpyqATm4cRMdrLivnBpbc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
> A722, for example), so it should be tagged as an A6XX variant to match
> the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
> register XML and rename the generated macro accordingly at all existing
> usage sites.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
