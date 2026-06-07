Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73E158DCF
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780863736; cv=none; b=jw1dFnFjiM0b8iZx9yyjhcpzIV/FKSd0qL/54D1N7gliNdm8SK1EOt/LUfNVqBZU+fEJrQjpW0VJJbyCk9b6Fu/o6W2r4ybuAEc8FHzy8gYsFeRRrJNzzetSSXu4UA8znQ/7DZdyja1FEBfJhsxOPt0KO6Uan0PkYKnH8nCZHAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780863736; c=relaxed/simple;
	bh=giT1I9zfdDcaXk6MM0HM0EHPao1z4tagevajV+cQ0OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrM5oTc7ZY6r6Qx+SC8ncm8gSOhXOrTyHHewObSQJqkJhTuMZRsHGaLudCH8nnYbgWatW/4NP78P9oXNgpXcXjY+WsJKmalwWPqHxuNv4ax+UZ/V/LmEF0OvTRPlkKhbChJPCyu3r9fHFnR/+jrN7xBmfviGpBMUMY3qzEQYvdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLf/u0Tr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7AMM0eF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLf/u0Tr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7AMM0eF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElXGk887150
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 20:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zj9yNlRTpmlfU+qA45qjBd0d
	bow/2pUcDycgzZNi5nU=; b=GLf/u0Tr0C+f1xnyaX3FCezRA8NcjVLZqh7KAa70
	TmJUah3LF0ePNoH7TI/Hpo7tlwyGadxSfSqKaK3gyMMIufnYFlpR0WrFgNYymufJ
	fhY08BAfxs6c3F3iFeDt8wLyhb0BpHZPmWZLyOCdrjKz3/EnRYGTJ4dkYLfI10ue
	cxYU5p6zQCVuqJiXkA8Gvg5dexrLj7R3PdG4R0xfQ1FhdGztjNLdbp84LNsSsv4e
	xEer5oUBdUOPro2JEXY7xRaYBWRw+hZzYF+zxsUU/llrfkARxiGajYomEWrNyAP2
	KoTl9909CXLo146VYZ6COr/Azx6D0TSJHwc+izyFkYQ4Rg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrcrb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:22:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175b7946d5so30547251cf.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 13:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780863733; x=1781468533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zj9yNlRTpmlfU+qA45qjBd0dbow/2pUcDycgzZNi5nU=;
        b=C7AMM0eFE/3ApYwGOqpUbwC0zOldPtWaKFIvEptZkregitJhlCufT8R956NHxylG7i
         U0JReCeNcBWYrU86MZT5Q0iGzSi9mZddHx25SX69HPlcucMj5kfOVJEfEx2nxrIaudqU
         QI+UqjTQQozxyR4h57AOu99b1nWMzJWgCKqu6HbC3inJ1aB3oa7dw3hhweLOw2wwsyiQ
         4UIusVU4Tj0OOQqUoNt2FQr6T1jChoQSL81HKpiznClvqKFZIAWJzxzQQb9nzGjGKrAn
         3oyP5rpgRIWgGaXqgP4Zz2hCKlUNvR8SUmUu5oBoXXkiLhzPtdoLDf22kdcEGqGIYDNh
         /Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863733; x=1781468533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj9yNlRTpmlfU+qA45qjBd0dbow/2pUcDycgzZNi5nU=;
        b=RLkSqv7bVfA7XYMe+kDA/9G2amX/pE6T0HpU7NvALgYx5ZDlsw1dA/ovqYqo6FX+Fb
         UXdDyUO1vzQ66H1SPBu/4VBGSJL87vMUKNiMtYZCW+1FU1hBCmfHugQ/jyi/fFRQFaGN
         WfTkkCqFz8oqR33p9NBx3vn80FtmcWnBQ3l4VESeZ7wwM1+VfML/nLvHZmZb502Q5h1b
         MpjhLHB8Et29o7PYvaVKMSVt7pNcO71SYQyogEwLuPGA+dwXL13oy9GUBkmaVDNLKIUQ
         VFsa6UpzOLcDhGFv5CnHXH5P/EgFpjjTdJIqQ/PcWpmNgxVpK8BiEHeTZLbpIlXY0VVn
         yFmA==
X-Forwarded-Encrypted: i=1; AFNElJ/t1m5s6mUhdavWnl9+niRBYixR9zplM+mH2Vfhykb/Nd0rgO5IVx8bXW1VnLbcNAzd85f7tZTWSV2i@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2IMhF5ue5rf+9MCCU9MFX+7IUjOPq5GJ/+M0/T6oaGsAJO1Mp
	GSGN+2OrY1SZVeMR5Z0ilOlOLsFUnSka59dpR8wBQZLcmN99r3MhFh5hUn3fLpk9oOMTsxn4Sdb
	MczX6W689gVzcIOeRZm/7sP5jEMoevVadPP/7VMfz+4eiTPPQVxkedaIVVTl4/5QG
X-Gm-Gg: Acq92OHZKylbrQPwaOO+kG+v/MOYoEcXxwtcAWief3CduwbUiRyYus9W82qghnSXleo
	DYKW36lDsTsf8GG588Jns3iUxHb8YlEU9Y7VrK7SKpGqmVOOYH3FMjlOCr1eCitV38+Er3BPDAD
	n+MaMWjBV+7zW4PFC3UHsLP/ojd5ZduQzyLDRJ3GLbF1FVYeXnkL681DzeuoYH88bp4xn1/j0K+
	RLXHoGkr7kjnNRmeaF869SKbHEDJUnN9SswhW8JLIb7WHAsfvWQJN8zkvCucL5oNz5tC9CUTx3A
	+J6F9rQOmetn9pegzTzOJdeMY5OEaMVxWpqYP5Kw9AYVKkmV1vIYYS1+DrPzl48mNAOEzjxx4hB
	Mc+hwH2+Lok0dnuDW8Cpvjhq5WEQeUH1QzFFKNPZuCEFOSXKzrMj1r+fhqVW40weyE32qK4lt5m
	AHFXaLcmM4fIutoFzdoKvLKbSGhQy+CBc7AnfshMD1ClXgsw==
X-Received: by 2002:a05:622a:5214:b0:516:e74e:cc51 with SMTP id d75a77b69052e-51795c29083mr115039961cf.51.1780863733408;
        Sun, 07 Jun 2026 13:22:13 -0700 (PDT)
X-Received: by 2002:a05:622a:5214:b0:516:e74e:cc51 with SMTP id d75a77b69052e-51795c29083mr115039651cf.51.1780863732626;
        Sun, 07 Jun 2026 13:22:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66b1csm40812001fa.9.2026.06.07.13.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:22:10 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:22:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
Message-ID: <p3l4o2qa6yt44zwxxqhafnr2ty5fbdwxewuldelfkdjnr3vsrf@cnzrnfv2fq5r>
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
 <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMyBTYWx0ZWRfX19X84BNnvWKB
 A/vJ4RgVTULgO4dR7vje/lmtORrkb00rrlM2sP3qTMH7zCW+qC4tHw0YIdbC08BU+vtv7uGsfAY
 yGOuapG7rrIR4+G8NeSrtH9F7vdQ5wmeosy9Hi5/nHvBRe3AKd1bA+Hkr+BBZbMGgYSf9Nw/0aC
 6ZnotVuZ9CFmOcI/qXolF0JuHJnI7Mo0C/5qyhNKFegZ+nMBbfViuhxDWF61ikhZSWwmXHpu6kt
 4qMajjyeSTjrQ0ZLlnQ564h+IAdpTdGvlG2Y7FeTZoh2Bs/H+SjlETVqtryhPIfYj9QNdC/S0os
 wePntHxCQw5KN8ALp19btMF+MqkdUvPMpMkMFupkqN76NvrcIslxXuVHG1k5EZbx6j/rBZpbrRn
 AlhoGk/ZUQjly9sZ+DXztVr0/CL+GXByYEZ2IsTNtz87+4/uRaPgMWnV6ocyu70+bl+9beIu22w
 WObScZErWu2pgZKwQww==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25d2f5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=b_Pr7HiucSRPs_5II3MA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bZcZWm0mn9u9B3YpQPmM9_KTIYdRTToH
X-Proofpoint-ORIG-GUID: bZcZWm0mn9u9B3YpQPmM9_KTIYdRTToH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070203

On Tue, Jun 02, 2026 at 10:04:05PM +0530, Kathiravan Thirumoorthy wrote:
> Follow the new binding style by defining PHYs and PERST# (now RESET#)
> under the Root Port node. Avoid mixing styles and move these properties
> to the RP node.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 20 ++++++++------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
