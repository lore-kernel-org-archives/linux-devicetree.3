Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F6926D4CA
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782330; cv=none; b=F6fCTj7g5iWMzw3UdphjceiUE5/bq0tvwGk6YGAk0mc9UbrxgL5lvgqX0rftyJofTbaV0MkE4lJNZ4AmihS4HYjDBJWSnNyB7SpBfrQ97SoMITCEPDT02Bh9jW0nDgq059dy9DepQIGsLULcCGUui3TgYdxLBLzrQHhyj2U+0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782330; c=relaxed/simple;
	bh=OgQFmR7d0QTg2q/pOcWRKLoBjwr4jnSdQ/zmViXrg9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avqxtQe5Hi3AnDw66BT+ixDFX9LEFfkfGiHielhMyp++NDkcOEPrlaVaiKXKgR5rmsPv/yHToq3gktCQXjtglx8/Q96lMJQQCfNO9EYAVccf5DX0hUKXR7BrLo1SuX2IrIglEA4EkkYXJQUz01QAQdU+vbDKGxaXTbA+sSE44eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ+FZg/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TU2zXGdL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ+FZg/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TU2zXGdL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhan8581063
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U7sDMrLma/KSN1eduAy4SE+M
	hRTl3Z/KMo+PH3oKTRU=; b=MZ+FZg/UcZWPd+xzE987SHcrT2b3S68o+Mt68P16
	jaAABv1MAadxyLUwIiGbc1tLnjN/VwLMjGx2UBT4tiZS4qW6DDtgDYuvE0Vwc3VG
	AZy5U1WoJdFyAGbSmiqwXeiHw4y9Im25XkIH+5b+FWfJLZt7cyNLBwKcAYiaia6u
	KGz0kwMhsx9GjpvJwB5Le5oT/o95Gzxq0qn0OsklahmF8x3s6HiTOCkeLSxBZT4O
	rry2WFiHcbb61B4sBKrCJrtbOLoxWBdGfPAjjXJCykdOIIe4Lon5nXd/KaBO2oIr
	1H5YasZk8puuj1a1vmlQa8Um0Kq2MU3+XvrhQi4Z0k2Q1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqjsmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:05:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso37363941cf.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 04:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774782328; x=1775387128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7sDMrLma/KSN1eduAy4SE+MhRTl3Z/KMo+PH3oKTRU=;
        b=TU2zXGdL9DYyNSeC9dT0Hayf+Ccma0QxG77Kqb0oQisVK3VdeKmg5E7ZiqG+VFvazQ
         2h8XMT18yqovpSNspTVT4orQRb0qFIrpbcUuRK2QmirF6dq0nGu8y6w8E5Q6QJFcH/x/
         JMOA2bUxcWEE6ODn9as7YdNuv/foXHuBe52Pw5Cd8KGtxb57HCYWGqAZTl/fSfnDlwfU
         T8mDnzFe2PVgqRBf+XSx6iWirm/eSl9yDWnyYMqoItKqzip7cv/NZpdRhiy8IuR7gFgD
         xJyffkVi41KjHJvqvW93r6qhRfvomQCk1k37hI7/XyXU1CvC645A19u7Zn7gnJ65q2TE
         Waxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774782328; x=1775387128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7sDMrLma/KSN1eduAy4SE+MhRTl3Z/KMo+PH3oKTRU=;
        b=Z79aBNC8MU3KCUPlkFLekgl3UTHpQlbsV9RWOgF4PHUxmxTuoXpakM93fmw34dZtz1
         hlq6m+vc8mzY0kxb4uQWmOViqtyTyNS9CcpnjLd7n1i7jWJyDxmp/sI6fbmxoilZ7LCO
         o7EVw+Ntq0yWXyv0iTeH2Nl4x38adyqH5JKSY5VlS5anBLHs5RrCXWEtrzbFXLqOZhk1
         6Xr5E+YQ0HLH7oXhqda9b5XxhSBNHCk/tHyhkkxC6PQmQt5ccoMOfa+o+6k1+FhYAEm6
         C2yigl5d26Z+XRmhNhrIoA//Bc454wVMpGBRxRm6WPW+hBMmaPq7ZZH6NpDrI7Zt9iDs
         Hpxw==
X-Forwarded-Encrypted: i=1; AJvYcCWF+n4QoIRWcSCya0QuMXx0yerAF/g+G8rQ+YmsPAUy3tToBu/nPqBjoGB7n/pp+aW4z3VhPMmgk61u@vger.kernel.org
X-Gm-Message-State: AOJu0YxEJOaQ2lR1tDYlY6C/0bPwnwFgEPOWEySYMKFmmOBsPVQc/Xa0
	d7ZTt+DMGlPGXWdOV3DPxcukekHmDE7fSY/wV96ZWn6sn0K9Tos8rPqB/aAfVG2Nb9MSMNCeLoo
	mZ/9pC3maTunc6VxkxNW0ngi1EPDbCWDHG/mnbUGDAMfPFyCYSvBV/FkwEiGLk1NE
X-Gm-Gg: ATEYQzwS2TGccnqNpsfH6PU6XHeYsWaX+M4tT2gjYkVo/99VMn6Qm23AtZekPQZD757
	pUIIBJB8z6X4OGVvVvyGAA3li4mU2tv3wr8EKmlJCT9zmvEPIL20tJZLYvtU/dxXWX+k2yWLZjY
	JEr3HCSbw1HydpAASaendph+1RiiT0LfdWhB3+ZH/zul+yTbE4sm0mr+eNrJcKoS3kgC8f1FT2I
	4+qFal3l0HFzsglvcFharqw79MZk4YT0q02yMZ2RrDk4vsN4xUsuwvXANq66QT9mRu+DqlsQixK
	zgV2/9PUTpWNbrjKR4Ii6+0/8IsRetORGN9BSV9kM6crz5PVcVfJP62mjzKcLv5T2ctDt7Gvp9v
	9W8lIzBiDeutSIuI3qN9xRAN5uPSbqGEifg/tUsDOoZCYmyY1ktZHiGmvezzmNaJlh6J2sTUPOU
	X27zAUwRUIw077xAqJPspdO7syvFRXx1IvlDk=
X-Received: by 2002:a05:622a:4cb:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-50ba394dademr109569251cf.55.1774782327938;
        Sun, 29 Mar 2026 04:05:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4cb:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-50ba394dademr109568911cf.55.1774782327547;
        Sun, 29 Mar 2026 04:05:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8391fe90sm9075951fa.42.2026.03.29.04.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:05:25 -0700 (PDT)
Date: Sun, 29 Mar 2026 14:05:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: sram: document glymur as compatible
Message-ID: <t5vbe36b3i2lx4ktrw5bosjtldgpmep4ueqkx5b5saoc7a3dm4@ywsv5rrcefew>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-1-8fe0f20ad9fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-glymur-imem-v4-1-8fe0f20ad9fd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5aQi17EQ2HDvUU0a7bHiSCOqBZ883Glv
X-Proofpoint-GUID: 5aQi17EQ2HDvUU0a7bHiSCOqBZ883Glv
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c90778 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t_NDYdS1q9VfzykaoWoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4NiBTYWx0ZWRfX+d0cSmYSSGss
 Rj1+duo2yDr3um60e6W00tzUcegGTB2ibUcJezfcHE2G31cyzKFCCWWtACL0fUqf6mt/k9ATRKX
 UylSUTqOlL5rs1ZSUc9mMexccZLQ4oG826HzDHy5QElxF47q0iqzXIb27G3AJ0jrK0Ckfrs+27A
 o43vwCC0P4xKTiViC+mEpIAdD2I6IBLEKxHTuRHcrPLcPi9/kTXQuMDy3pxn+mydEsrbBKrBR3V
 +Ro6Roh5/Ph5YG58r98Med0CFiA7a4EKbC7VugkCA8hRbB1nKrHlmluP7J/c13Y5QdIjXPgwoHp
 9ofVjVMgMh+AfP2K4EHGplyEH9q1dY31Hfc8Qo2/rkP37OLrSm4p76LEbZQnWBhWzsl0finb1LE
 H3J7uKjKFdpqVxaetZOfigd6NGqdIDMkL2XY7GgDxJGiyz43QDuyLWdeVbcRsnooX5Ojt0bhRV9
 V20bUiqkLE1vOOo1cyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290086

On Fri, Mar 27, 2026 at 03:24:35AM -0700, Ananthu C V wrote:
> Add compatible for Qualcomm's glymur IMEM, a block of sram which
> can fall back to mmio-sram.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index c451140962c8..bd62711dc630 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -34,6 +34,7 @@ properties:
>          - nvidia,tegra186-sysram
>          - nvidia,tegra194-sysram
>          - nvidia,tegra234-sysram
> +        - qcom,glymur-imem

Is it different from the Kaanapali one?

>          - qcom,kaanapali-imem
>          - qcom,rpm-msg-ram
>          - rockchip,rk3288-pmu-sram
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
