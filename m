Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3024F3E51D1
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946054; cv=none; b=HZ7h8yURiV9OBoIoYT8jPQoaGaxDijdhvws8PPGhTXdMI7t/WGf8Z8dcX74OaCdXjinwmtTkvJzYvwvGN9JkDctaoUXhJXWEoL8d7KclrfSdDAcd/hfiSPsNZw47wLW74/6WJhTWbACW/Np/e/wwvL0kBYW6CI1t+QU/fVvFLI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946054; c=relaxed/simple;
	bh=e4lpZ96MbcKu3Vtw+ft6xB53V/umB4l0ktDpTuQGmao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0zoonIHtVe0HienSsPA8I5E1Fuhu8vIaFdhFJcY9tBJMcGs9r9AQxv7oHPcmsVf2KS7TjxWI46E8MsTvhszMZcsmDrFMYp4oFHwL0TERVwCZbuLHvK6Tq6p1Glsf2WooHoJOZWU8XVvL2tLDXqmynJ/MaXM7vLyKi0/oO+7er0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZ5l6RMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ew2tkR78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZ5l6RMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ew2tkR78"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4laBd2862276
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 15:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rn76R61KTcsXG+c2wn8r5Z0X
	XD86Ov/rfiWz4zx/264=; b=QZ5l6RMw+5EPYW4IE+H1iuCxp/CsP+ewfYIBp0e6
	q7wluKOVyD6NO9FkLUix2YDA+rNwDRPFdD9GSJBgcNrF4I+0SIlrCwyEHOh78wBp
	AwJsK/Do06yoimwHkTsvw8ioCiBczJ2FOREAqrfF0prjhyYC30Yz2SFSp8FQIuNK
	SiVn2n3ss3vtjTZofCLccqoaw39+WvARL02ZKTh1PKshGFtDdqG+3pDd8Px8k9ar
	liSmLV+dw15gpKkt+HCZ97TPhY0o+XA/hBI34xW9YzuUfw1nIYf9EYLlH6lA7ldS
	Ydp/mEpHxHRgKYSJAENomAIYJXK5k+i8ftvFFTnk+nZgmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7s2dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 15:40:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5165d10e036so4995651cf.3
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778946051; x=1779550851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rn76R61KTcsXG+c2wn8r5Z0XXD86Ov/rfiWz4zx/264=;
        b=ew2tkR78SFOUK7a735+jZ1bSzr7cSfSLh0HVAdtRYlfh4uVinIg1xEJmKHKjtINJQe
         5Np+p71fJQgo9chNJ8s2JAYMRyshW3XT62pQu+mLLKL3pqnzUjFuAUiVq8z8aN5fAC/K
         h1XkDuCAGddP0EQHvADOFfqKrOQC718O5wtfX3ucKk/COV61NsXupdj2ANOCjcz0UuKM
         9tOmrYp1bLD+DFXZhdPV936FtEy4IcttTEklfte98WDEcU8u6yz8GdmmjZrWy2ATFkLj
         yflzhSPaFqdbSAjHH9SJe5XUkBlM7GluNz2ceKm3Efr1fer/JQ4ex/Tuj3VEyJrYpukc
         Jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946051; x=1779550851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rn76R61KTcsXG+c2wn8r5Z0XXD86Ov/rfiWz4zx/264=;
        b=m7faX0EjnWVMyAyx2uCB0oSbVzyGl//EnndKVwGNjsA2p+2E34O6VT9aJZfeUlB0g6
         UjnagzNJsrJPKfRM8qGFhOGyuVLuUAFYtTdTvVzNR4aPhYlgFayhWJKqYaJZm1GOFuvJ
         4ihS/SXkymfBo58o90eo1mc2QWm0vlUcEX9O2rm3HlLZ6otANuqcCYaYFMXCBkqRmXnN
         qC6WO0+tOEbXxQqwlfUIN+2EaoonHSfKe34J6A+d2VxzPzXLmOVyru/uyWyYlKSzn5yN
         l8tClKQS5lC78BW/3rxry2/lhhfW5oy6d3mkyCpSNdtS1bKiE+PsYlKWuJ/txPJSiNY2
         +nTQ==
X-Gm-Message-State: AOJu0YxkA+TafutlmKKVqFr2wIavxeo9nFXvg0EFODeeFrqnjFF4SVRf
	0GASF8MpcPw5unatH+MW+0MbqrMNB+l3g7nPd6PAPo2uFvgoQmvQx2psgO73aa7H2UwCeZqJqhd
	yW8shju5wqpUeSqKDfl0PnaemwTBRj0rCTBX4AOmNgJCMivr+SfYbeeEVj8cceBoJ
X-Gm-Gg: Acq92OFTcXYf7oQnO+pHMMes6j+fnZ2PRXGlrWEOKVF0CJijz1EPjePbWpThRMwh9BJ
	EH7UeokIIslMqdLxFjEl5NuKJzICh+61QGByHzKIcs+UK6l2MWuQ10bWWjhuZ1iZwtS69W5xalN
	YiV6CEZZrDprLWSLSokugTpsKKAXkGI5feOgX66+EQfg0jQjFqKQkPu3rHg707hc2wYrzobeetD
	7G2x4OOJh2s1NeA+8Krpgk/+USdsXvNO8MuMZMjrwXLz2HbXmtMM8DAb3kBDXDegsj6usjAa8SG
	4VK/x+hdnYWkJWH2jRhj638joi0ym60jMgs/6BAtOGeTHGY+kysV/+sVVEU46yV1fNpgI3PvqYp
	MC7t6cvOa1wTeSyVJpyJhgzs3xw42uxmdFV19IuJPJrctdipFoXAdvQHjavdGcWx6dXdHRbpovg
	61rtVUMcajMkEATyFqadZ0KALFN6MZOk6r02A=
X-Received: by 2002:a05:622a:1181:b0:509:3257:c050 with SMTP id d75a77b69052e-5165a0dfe92mr121298321cf.24.1778946051512;
        Sat, 16 May 2026 08:40:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:509:3257:c050 with SMTP id d75a77b69052e-5165a0dfe92mr121297911cf.24.1778946051057;
        Sat, 16 May 2026 08:40:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c545asm2088981e87.56.2026.05.16.08.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:40:50 -0700 (PDT)
Date: Sat, 16 May 2026 18:40:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm7325: Move common IPA
 properties
Message-ID: <urrhdy6esy4srh4hh2ebqvk75z7xjk37n4nyaybaayitlnc3au@y6cm4y3trvis>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
 <20260516090853.2873223-4-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516090853.2873223-4-zstaseg@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1NSBTYWx0ZWRfX286ppVGVJRNT
 rpO8wegQEEKcGf4K+SHyJtRWhRNznKg9Mv0MWHwlAi4Z6KGx8gab/EjTlDWFX9GnxrtC1mdo5WO
 bysR4SAZc4U03TVfNsHHMjl+VCvgvbGBJk2CSbT1VbMGjrhgxhb6UT0me34jZ3scJdNTTKQCr64
 IGuzcy/r5WO4RO3+Vy1ww+vPUkS15PiAHVaT5KVNoJZ13Zx10ah03VYLjecxtdGXI8BNyF2QHZW
 k1xWfrFP/kZ1UXiYUbsWJK7tXLnvBoz7FtyTNl6Lj/lPB7qTkhPShrTNaCQgo6mf5bUxfs/R+lg
 0cwMTaQTVmvhAm72GPwY62Da4BfVGxoiI8dxQRMZsK+PxgF1v245B1E/4rPP94t/nuG8kdgPbnj
 /bEMhKrcJ+Uq5rQBPtDW54RwwFKIsAqB7agH/R0O6ev1nS+9q/McAXNK7mBXpXBv3keMIEvP47r
 PkCbdCeRgt5l8ngx+FA==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a089004 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1U3QSdD7kP3weBaaEWYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: jBO0aNAQ8tcP4Pt5bXzBOx3DVtqFvgVD
X-Proofpoint-GUID: jBO0aNAQ8tcP4Pt5bXzBOx3DVtqFvgVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160155

On Sat, May 16, 2026 at 11:08:53AM +0200, Stanislav Zaikin wrote:
> The qcom,gsi-loader and memory-region properties are common across
> sm7325 devices. Move them from spacewar dts to the soc dtsi to avoid
> duplication.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 --
>  arch/arm64/boot/dts/qcom/sm7325.dtsi                 | 5 +++++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
