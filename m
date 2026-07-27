Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E741A4EC
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160554; cv=none; b=MfCxrWVP0Avp7wY20GqvWD0g+4MEDgqZTELH1Ru8QiwKCQ+lSKcvpq41tvgja4eusZvI4YbFzxY9s2e9eqTaNIiXe2h6rp9e3nsf/j0dEeDfqtlsGKDQQzrJ+mIfIYLJiJHIJcUONfugyoqPVOuzsKG2BZa71sRs2nIsH1hNDpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160554; c=relaxed/simple;
	bh=tgmjNeM4RX3moHUqbuO/yW7mmJhG09+PPGsCcilaAs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpNZtVIa/gPQ5H7w3ABlQt6ux5q8tHSm2NNaV/DoCTdsSvJUQxIAkEGgdC7C9cWKZRImowiL4Q/W0oucvves8X5CxZWSTlJCnSt5HT5dEJssYFzIMVOxF9FttOvIhtsLsM33lRkLaXv0D+wS168DLRKQW2es9YO+cmh7uLrZAMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIWEDlJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpofVy0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIWEDlJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpofVy0j"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDluH33414506
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pkdWnQuMpd+iBrUuzN6qCMfq
	8QBHq95joAhH8/IHLoI=; b=lIWEDlJMUMOGG9hTGlYBziKueCiRCG3/k+Fnr2t3
	TH7vCltg7/HmslvNngNA4lSAcdMOKlAO28IjJksPtRhpal3guLTRL/udcaL9UKfP
	psEz7NWY28VEVuhO5lPvl3s9OT+euqIYjSNn17kLdKIGd8ht81mUmoRESC+dUAT/
	MhE5U1MmEYTleS2j+UGUaVP8VKuyd41fKx/Jp0zFma1ta/mFTpyTpOPhmGZJ0+80
	Xf2/ZcIZlagtStdxbQ1vHTlkVZ7Rxp/vtUhd+1AlYqdantfKSWkI06AuMfkvj949
	uO8eBJsOp3qZph/17JEJeBuEV2O73L2cdb5vA1orkGC7Rg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v68x9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:55:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so31040001cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160552; x=1785765352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkdWnQuMpd+iBrUuzN6qCMfq8QBHq95joAhH8/IHLoI=;
        b=fpofVy0jPEIisZru1E8gzGe1TRJHxnRwim5Xr71dZMlZH5liZF2+JaDR7zbig1ateC
         UKsKWbVMZhUS+7AMsJLGUnQYNjo34/d8rv7pAxdRUnEkQ8fW9aCwV/rNxd+aHouzGdM+
         en1a/ytv30ZIyFsG0CqK9MTR/4yQYQeC+S74hsdeaP1z0F6Qt84IueFBiEjUR/A4WowL
         cGS6bO3VOonaZepn+jWtgbZlTzjTcSacCt1206mynzHoOHnBaZDGegmm34tdgzj3RDsm
         O5/2qrgT9dmgQ7jgC1OPv17VnjeGbjykSS6xEybLJtDzctNYoC6E3F1fQXmVCd1ddlTs
         nGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160552; x=1785765352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkdWnQuMpd+iBrUuzN6qCMfq8QBHq95joAhH8/IHLoI=;
        b=d2V7lHE4akjPB7RaYDRM2yGI4gw3hPRJETkcuYiy3Ro/HmGCz4ce8yAemTdRNrF08+
         PdH2lMFh7gGmQ1wUyzb8bjhsR95Slr892z9CcBOruieF/Qhe++2WY6Ig7giXY0hfdgEN
         PGgAL/K+U9Lryfg6QtZUavqmKaYg2yod0rK4N82/16UKpgJIzpZ/A8D/Tkjn4H3U3z1l
         c8bWYaGPYvNVWiUbiufM9apTcTiLglw6UpDsTLKjUzxEsA2BfXaK1I6yuOngDmvF1MPi
         yBLLwRJhDTPkLQ2Znj9IxwzNLS55FQRtFkFX/QhKuqzXS0H///f8HquOgNh6Z+5b9RHV
         EsTg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4KGGihCttLJ4K5zAe/1tjEQLL4ZYwVeazx1KtTxa4xh8UXjQftL9mPlraOHuZUFuou7JlKk6Y91Js@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iZg9ZurShWWOpqzcMhMaIs+/ufiTOSlMwNfC4wAAGVfqzj8z
	58aoHAOH0AwZVR0BFD4EC2amWTn4ab+wacB4EntjF3JdjUWnUnXJAayqlCyIpSP7no0y9Nh88MO
	UFT0gwpLKaQRNttCojgkqTZBWxMfYejyfixLSOxJkenm50mHUJhfX7qW/xrEfpMEb
X-Gm-Gg: AR+sD12OMknl/EdjPu5lGiLa+MCt3gmAXKID6zbavP5nxuXjmzM+ojCHLWHZ/zYlT6/
	CJF6T+UzjaVH544b3Mqpa5EyZ/6T5uSnwdIXKq90pmb+F8dNYMIawIAduHGSg/A3E61gQjoDKzr
	EuvDeGFyolehW2z86ZZ+L3GEGHcYF0zh3ebbtkRnbX3GmPp+KGoiuLHpSqxNKm5FAOXHHOCCY4P
	MvcVzQvlbd1c6Xm5Q2yws69b07Ql2Pj9RVBJvpSAG/x3Q4P6txp+AVSWS/J+IQ5pOqE2RxUkG2T
	uITAieeVAiA9CodzRsn+3pGPZfxSUWKtT8RIMnHmDJnkI+3IxyA4ohah5YrDhE6NBZlxZaHPpQh
	ccQfpoZ5E44Y6/O4=
X-Received: by 2002:a05:622a:5889:b0:517:78c7:d93a with SMTP id d75a77b69052e-529ccb0d75dmr10018041cf.16.1785160551724;
        Mon, 27 Jul 2026 06:55:51 -0700 (PDT)
X-Received: by 2002:a05:622a:5889:b0:517:78c7:d93a with SMTP id d75a77b69052e-529ccb0d75dmr10017541cf.16.1785160551242;
        Mon, 27 Jul 2026 06:55:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm51706327f8f.31.2026.07.27.06.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:55:50 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:55:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Message-ID: <raojtphmpetjitaiaf7e77qvs5zhv24ga4wix5klndbkcy5t2i@tcyrm2xzoape>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-10-5cca1bef2e48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-10-5cca1bef2e48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX/tX7Th4KL+JW
 PhgvV62X3gGUScm7nKQ09jPRPhaTU4B0aVEl0AOsujoR1z3vm7td02cwW/gFToXUUTs6UCb1kjM
 U35RHDc/gcwbMVzBzNcmh0/8hZRNuiU=
X-Proofpoint-GUID: dy9qvf_bv6PRQbMmpd0xURekSO9PeA4D
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a676368 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XF3s6JUOJAP1l5vmAHgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: dy9qvf_bv6PRQbMmpd0xURekSO9PeA4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX/dqmHkTkx31S
 RuClhZkfHarkvjm06x4QKA5cP++YEg83jpBcw5qKOhYkb2CFmQOo8c+87SV0429FEvhscWe/7KN
 ZAaeYpsFlpRGeM4rf2tOI4X/IZGnhAMCn19/10gKrxN1KpEnaQ0gC16o5ng3UDY01DuEDaaSyyj
 TAbeztCAkb9ko54fm3xYzqOc/JYJx/Pbn0nrZR82rVfDEJe0uvafTkPBxuFuPZdfbkUFxcTRf3H
 RY0XAuiq7Vtcg4xgsF1fbgGv81pBcv9uM4Lh2eeoetHTQFwR17RnoqGHCLnPxb+vegbRHDZk5VL
 UtVYjFRmHZ4CSSVoN8Su1UmRPkAu3phbj6fVGelanO7U0AobO59j+IkBLXdBDqJCXcAT645++Fk
 6YhwCu3sUy9YpK7NrJQyNGu4NUPSB4CyqRnHXADGLodrwH6+BydtfjUqRPhcX16aD3aUu7yroY5
 FP2FxG02Cd2Vr8D899g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270131

On 26-07-17 13:01:54, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
