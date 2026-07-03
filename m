Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC63527A10F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783120317; cv=none; b=l4tz3vZ8ac34q23OMcTEON9sPjg+D5wMkRo0CMbwzJA9APApo0lHY1LZuT8xSotCkRLwUhLzZd/GLpseZB2eE7vp5YDcXnYGmMqEUGqJQQrs9O6zQYZ/mOfaYIIMCzj8B9nuCruAYVYGWuf7aW74/6tmiXLblRpMWnQtjLWaRFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783120317; c=relaxed/simple;
	bh=csZOo7AmeNUmL4fc4xF7fLl0U6yGblbmYFidYkave10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyZ9hPVdIzbVNZGXt8plTlFn1Au4NtNxu5O1Lco5HzBDKm5gMXf7G6M28yk5mPU/HA+VzL+1nWJs9M/uVglHIanX82SdfjjbmHSqncSw53otKunkJfGrBYWcU+6aDWucP3YjSG0JgNydVnARjKKqA+nThgdHUhbRqqwUkyvRllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pziJtIyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJ3Na6bS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pziJtIyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJ3Na6bS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPaKG1019673
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 23:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSahybJeUk4w63sJ9vrP7jxxk2JxoTxAM8oSmXe9jj8=; b=pziJtIybqcXIcHGY
	16uqYBUx5N/NQcu3RbmzMBy7qXMjMyRWnQnW0e+YAIzOO+/jIi2ZjOFdlZsUHK55
	MJtpBpnIaIsWphbHLScDa2McSQ6HH0IH4yK5eIn+0pTfNAZd4ibOGkecXIRnGMr8
	2ijq2jLz+kq9hb4PUwWsTAwX1Lh65nMREjjMqqNd3O7PyRCVk+5HOL/nmZiESBN4
	OtUEEqNhKVY18F+dgeSzsJ4+S3mywjbF43heo7nJVt5DD1hzNbqK6QlsAY/kSpr8
	E1gWIEN95XAGB50G4MF8OpxOcHhttAAvTJhhkdpPeDwOF58JURaMm7BEjwd21/GI
	kq9Tvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj20hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 23:11:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so110627085a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783120314; x=1783725114; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iSahybJeUk4w63sJ9vrP7jxxk2JxoTxAM8oSmXe9jj8=;
        b=MJ3Na6bSGHDIGG4OkFI4ldSH5BeZAI782KdZoNUB/aSHLwujQruK1iEyVeyFW+28Vz
         XdX6sQveqXBcfp1P6q7BZ3zpMhLODjPqq+UNdExc3xVnf00oY7C+EK8TKD7CBnB5Mjpq
         gJ6leKoahBRIw3ECsur/+fTjPnsijC0VMcamhEyP+egN0cx1WApnakPV7vGntul4FdmZ
         aG3PbTxDBYNk1JMyZCOY6DNpAOnIJBw+QyMZW0pXwJo2q1/djPUrhoTDNdxWkySxUPWY
         cd0wpghF4RDtsXA/c9Ksd/yT9KMUD969sF9DoUVhO5OVKVHuBXvq0Gi+a80ZrC6dnng8
         2j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783120314; x=1783725114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSahybJeUk4w63sJ9vrP7jxxk2JxoTxAM8oSmXe9jj8=;
        b=IeGTFfJG5CwAKLBp7mK3/wTjJa28TusL+kXTjLXTAQ48SIfulKMVzhf4UyFMBh7rI8
         35Za809I+Ohjvks2Uhz5zSrGUMEvpJ0buJkgzYqNzLEDisutJKn9/lnvYNlbmrY21uIw
         PO7SCzR6tHGSnp2r4lK9UBNAOUGSshC1cwdAZLf73ELi/sY7oF46E9eiXW7Zq+rspBhI
         Gh2MjSwLyxH6Dqj1ohXh9H3WHQk50SKe3aULI1be/FhHVh8vZWFcHSWmtanFM2By37Kw
         9RFiXJ/UCFDm/um9hn+hNBZeroPd7b/oB92WGqlnA3GX5uFLUJdO7bY5K/nff2Th8JPp
         1VBA==
X-Forwarded-Encrypted: i=1; AFNElJ8W1HulHUNNbTD5CPpnC60BIZefYnTJ3cO0aXK7zf56Vw4/OcgUmc/Ghi31HVicDW8ezJxcxfhKEkyN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tTw6m2sfrJazPrHapF7yc7/2rSELcqVWvfzQo0KA6wbT3kFf
	1UTBMNnKgxLkvTIN2RWbryftVu34IW2MFU/bUfPlEDOTShwUD/j4AJHLDAbmW74ozaOjKUTkVkj
	xAueBzL8N2ELBZjxa63dPNbpTVSFadq15PEZ/CovbXjB+qGb6ye9Qb52CLLBejcRt
X-Gm-Gg: AfdE7cks9Pj/cYafBpBniSMGrzk1RrHxx+SXlBx2FLahsrGE1oZOtRjFZSvTkTaXmqH
	VMS9ii7+j/ERmSo7stPEK3GvhgJluFpaJ6IerDGH8KaHRstgkfKr8APagP3+1/3mGLPmaO/4Rd2
	Lv66Sgj10DGJPFG6qriaEZ5Mz55DSE8VeUmfUFQdaOs/I7MRBISqEpBnCZRlYVHd2elO4Nf6ZsA
	Ivmx/G7eAP7R0FUHOUakfqQxSJNJCIrRpR/OvizpeHhzXUuCOIRN1YqFjW7JEElGR8/DxVcWa4O
	Oa91u4tGQ9c5uDHFkCGscZLzi6r5nrt5oFe+axWAAmC945KEvaujudxvGc0m2oTNYDoBZxonfiO
	0Em8yRu/nAR8nLwsgVffDIfWU37qmPRCMXLxbjPB+mk5365rvfvv93+a4IRw1yjKm08BVE10VgO
	bI5VIYifGfqjGhz1gPpEgQC+Yg
X-Received: by 2002:a05:620a:372a:b0:915:9125:e652 with SMTP id af79cd13be357-92e9a481185mr196238485a.48.1783120314135;
        Fri, 03 Jul 2026 16:11:54 -0700 (PDT)
X-Received: by 2002:a05:620a:372a:b0:915:9125:e652 with SMTP id af79cd13be357-92e9a481185mr196236085a.48.1783120313712;
        Fri, 03 Jul 2026 16:11:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfdf2sm835345e87.58.2026.07.03.16.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:11:50 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:11:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
Message-ID: <opgj6twppqwhb77itqelmyzniaifcja3wdazyzeal5axstr25g@a7v634mnimbm>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzMyBTYWx0ZWRfX08IDsb8IEJ2x
 EBOtxMuZFqnXW1DZT71t5/FKpis2cbO03WipQHoGzEujMOCjINe5e2F2w1zTr5OSwGnf0Mj3Pvd
 Hlq2PHIY5t+AXsv6MD8l5IwZMQmMMe8=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a4841ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fEDeFOH8jy0W6kBJ9PsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: seJl0XTzcQZPAC-pJwhTbBg7j52qbk5K
X-Proofpoint-GUID: seJl0XTzcQZPAC-pJwhTbBg7j52qbk5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzMyBTYWx0ZWRfX1g6s54D8VFVy
 j5mjjGuiIRe/ye8XDMToY9WXJtKkh4GuQYi2uDd/OIcGh620rPOPilAT0EkuOyklZPJf+nXE0o7
 7khWMj3WNyNj6d6wmANtg2NBPQT7vY2Vx2yuFDD9EsY5KhxJWyPhb/5aUAyw3W6hys5+BAf+ass
 HBqs2lQxYi6yuap2KoJco6++UWx7zks4X9nUGt6s6V+1qpWv6ajD3xgIvwlKcOfzUhGc0P01FrX
 GI9QFf6aF4WsZK5cw9Twyi8BP5NObkHjhnPh8rtl2/mrg4OJ5BCOHcPIZvmjyFWDquev5a3+MVe
 d3fV0Rd5163LqySBJuvZ2S/mAvLCVJxXNPCqDRkTf1FpkDL6P9b+NvP10nhPm8A05PHXVSuWapn
 oTeB+NfYw1n9ErJLJvrX6xtmUnzyKyDxva5YQ82lhItf2DPkyIr8tNUNuR777h24m0wTQvVUY8P
 tIrtb76kSxz700vrwzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030233

On Sat, Jul 04, 2026 at 02:04:32AM +0530, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 115°C.

Nit: 72 chars. It looks really strange to see two paragraphs with
different line wrapping.

> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 34261221664b..eeeaa369d3a7 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2510,6 +2510,7 @@ cpuss0-critical {
>  		};
>  
>  		gpuss-thermal {
> +			polling-delay-passive = <10>;

Why?

>  			thermal-sensors = <&tsens0 6>;
>  
>  			trips {

-- 
With best wishes
Dmitry
