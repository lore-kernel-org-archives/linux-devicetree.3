Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49D3033DF
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774779801; cv=none; b=H5zyWIErJLiFLwhxujhZexeETrs4h+VOUz5C/rrYpUFMMv+vlLq6WrHKUYrADk6mO9dekudyshV0B2myW8/833FPb6BO9oWtIwCXg4ZOlQR2Ya5zOD/6hKoIFQfNEf4DHuLXnT5wBJFrXCF0dep9tDyLyBX2Dnat6ZVhcZB1KKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774779801; c=relaxed/simple;
	bh=6LLYaMCidoB7CqFTQvxDu+VpiXQrRhc/XlHQWMmOBlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIlvePWk7SoM15lpz1k5zn+MPFgp0RwDU9Rby7qsaJu1gD+045oB7wXpBt8l+ARsVurbnHo7K3NC2Nxlh09919QSRX0o4en/HC58nxdloPr4Vi/N6MVt/E3JCuPVEKn1gYl1r9/8RrQmp2ejol8f8ISxBIIAKbfXaQy5KrASGAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrqDP9dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgy9dpW5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrqDP9dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgy9dpW5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T107WX3232175
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mK/kfH4F5IH4Sq2t/puumD2k
	dvUB6BnYA74BB3PmJz0=; b=MrqDP9dz6Ovx1i4/NejBwEUz9O+yK0iqBVu6qmiL
	d1uFBxE1nJKSeV4JpbM89RuD+XFOPxPm+LCkDoxjRD2IuvKeNC4eTZ74EOb2Y6ey
	Vw/8IwvgBB08BOQA67VFuyYRlFidtAdJXxIeHfzRHlvRR+omftAnUN+AmK2p04Qo
	Q+pop0v90KCbdYK+uStZJWzJ0qMYK4ACPnectr8beRIY39hqwJDxAsxCN9sVEIKM
	35I5sWUITUxG+GTeuYX2hzZLgn6/WfFtGcoH6fjLbP+jpHB5uGl86RYsx3ajxYHW
	iUpwkTlrq17ATV2St+Dl6JE9lNegcvyqCoq8X4klffeRMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwjnvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:23:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso111893121cf.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 03:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774779799; x=1775384599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mK/kfH4F5IH4Sq2t/puumD2kdvUB6BnYA74BB3PmJz0=;
        b=hgy9dpW5u/06DzrjJqDSszIqlDjhlQL0J36BWqXrTbAwZ/Mw21BM+XWsXxlYIEKKUm
         hzGUZm1uP7d7qGxgoriuxQdUYaQg0Yyq2I41NNZ1xHHjoT+PvXR9729UcKTLRKgJ9Wkp
         OUtxWKQLlKoYOr7NhLrx7z8OMP1PipXB+pjhpGSrugY4HhgVFRtLjSr1m7gVE6fgGWLX
         JRhTMAaPZA+c6IsyvBp0ITfRiGwx1WrVWWXbG2AoTyFcj/g2fJQlknamcVvARfalBUpe
         q27Y8sFVw8MLCcILlSMXq4FJFVnjnaL1iWDKvVs7G7+a6tu20dAWkme0+4uwjOVt4/LW
         cOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774779799; x=1775384599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mK/kfH4F5IH4Sq2t/puumD2kdvUB6BnYA74BB3PmJz0=;
        b=Rn5KHHSa+dGOZqzDafWQT+OX62nhA6JVVaprZ3vROD6XyQ7Vsu2d3DtL+/1kbC9pgW
         ru/8JC2wMGoCI+1sgKT525LNNF9HGLDHd47dGRHq3hH02fkWLkuauiDtOWPx70Td27p0
         lS1OK0t5PYL2c5qURQscE/CLH+dhQbEU3aNEJcfXkwgR0Y7sLUqSDO9r1b8iiKC2yo26
         FZW1SnhlOfBKjIng7fl7b4yxpgCfHKCczBVeE7ixwQi9CsNe2Op0lpGfdbEADlNnLCpw
         CnLPI48TuasRjuGUibG05/pC2aoyfz+Wkpnn7nWRHvUB5syfmZKRrFXA3/NVXnOYsAZ6
         ZErA==
X-Forwarded-Encrypted: i=1; AJvYcCVG3pSl9cPinXPmcV+OSl7z9ustgeD9LGnTOj63iETAToSSTiyoQBK3t5p4+5xM+ZebNSrmaPC7JHU6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/XXrpAaeiZ5XaP+6cfR0k9+/w9VtYIvEOC8sEO1GXF5H/fuYl
	F4Q5pourBh+h1Lsd06xbFIA/AGBAf9d2onsOxehEYJKctb4WJCQLJqrczJMx8QbW+niSIlUcFNw
	4yq8xPnYs6iIWMnz4kyNtAVY7vP/t8YjHXnd85CbaO1UtlUbKfiog0c2AlL+8GfOr
X-Gm-Gg: ATEYQzwNxxeCfnAiqtRuxuLTDw15RvVEu7cF7A243J3oeQnTelkll0fSKCY+gSi37dR
	rOPS8xWEtIg1QgIz27VE2SAD/rN9IUht0aRTvlgC2QxJRMAT+gzTm7+iDz/MlMzjDqqEzj88XBI
	gfhUyfndwiW69REKEP2MwqoVt3x1+SCF79mFWaOFQTDOICPLZVOzHkmxKlK3TCfwqxRrxcREu0u
	+6Wrflf7W1IRVJN7oStMRwCMefdh8L1493R5ognskrwSQtq6mQ4nj0R7DbydEVQYb7NziNdrGrv
	hcw7XzNvOHG7UNTohwUlcJo/fhZXCGLxhLNknbNLagYtuQRFksqoLqVzHLkFMJRbbu95UPqL6vw
	c5ZQ12MXVpOlRsTeKS1SlRy8zmuSnie8polCK1IWF85vnpoVTaMyEoTfCBamQ8eM/EKZ28QN3Kr
	PwVCl64bimbVoDuJQafdUpOIGOF67FLsTxHdQ=
X-Received: by 2002:a05:622a:407:b0:50b:4522:d0a0 with SMTP id d75a77b69052e-50ba38b226cmr118374311cf.34.1774779799011;
        Sun, 29 Mar 2026 03:23:19 -0700 (PDT)
X-Received: by 2002:a05:622a:407:b0:50b:4522:d0a0 with SMTP id d75a77b69052e-50ba38b226cmr118374121cf.34.1774779798593;
        Sun, 29 Mar 2026 03:23:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145eff6sm959406e87.76.2026.03.29.03.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:23:17 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:23:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: drop redundant zap-shader
 memory-region
Message-ID: <s7dptfslnmvngl4ocmc5vngg63tdjjspnkybmo6d43webucn4q@qstcolvexhss>
References: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
 <20260328-zap-v1-2-f6810b9b4930@canonical.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-zap-v1-2-f6810b9b4930@canonical.com>
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c8fd97 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=DfNHnWVPAAAA:8
 a=EUspDBNiAAAA:8 a=5UJbzWUa9Ju5Vw7BQqEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-GUID: LYvUH_n7vck4TsgRyUeLt7QJf_5zW3kb
X-Proofpoint-ORIG-GUID: LYvUH_n7vck4TsgRyUeLt7QJf_5zW3kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MCBTYWx0ZWRfX5IprYm1YBrBW
 TJ05bnWvhh+ykDH81ZWqX13iKqP0Qp718E04OX/hwu+pZWEuje464ZEW9Jz0o66gjJxvNt7XYo9
 FEvGN2Z4sHrzS7qXDi3UFGgSCaFzZ6tA1ZA8rp+icCsPID0aRAvolkF3nbdo4HJX/ykzVNxUszk
 rESD4yKmpGIoCxHvBPQKpVvx7xuxEdFVXim4+AcVlBVIOwLhnB00hUcOgmru/By1602YFoKXPz7
 Okn06BUGcp2o5jOHCmXvGd/ZMPZNO6+W5q6RXCQ1srE9Ay8rFFu2TNTNzjg1t8obc9vqUC4bGqA
 xX8hOBq3Vl6VT6VEkuix1yhvgz16bxjBJcbKGKPP+6Cfqj0TSqxfhOdBCmF9sshIYlxIN5vbsbX
 t7y9MdW2vtjqEKGvSH+WtO6F2YbNoTKu/fol+KK7+JAnCvUszOCMHwwBibWJ+qY0NrZvQxgFAnM
 1MX5AjMFWXPcc9aSScg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290080

On Sat, Mar 28, 2026 at 04:49:22PM +0100, Tobias Heider wrote:
> This is already defined in the gpu_zap_shader node in hamoa.dtsi,
> there is no need to redefine it.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi        | 1 -
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
