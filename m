Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72ED1A682B
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571364; cv=none; b=Lkb058jOSiIBy7Ed2do6Ds8acPaL7jfM/BQ3zd0sRDlI0iz5GMLrpb2gdYcGaWiptpfZWAP0BPdXhsZcEAuad3QHMHx1FFZIHB/dGMqWoZuDi0Vmg67WnYlEnc7bdUZkMuH+e4DnMF9ZXqsLS18wSmi3Pk7+fy0EoOhZYEkIPsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571364; c=relaxed/simple;
	bh=Le+5z1qmxKswaaH2tm8lWknAiQ833FKk4wBZh6IX6Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfFvC45Heto0CpDVpLaJMl7ffh3rS7OdYLgukopsuz/bQ4L+xkjm2YTYBthRJ2UK/3Bmyy7rp98QIIjLBzeNejxLOeeoxoh3nH0hH7ZoPTC4h/SOnFXQxn3g3Qj2egI3AyGkbUKh8s3CU5KGzYDMfUaJqiOuIVcXubnniIdGK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+EkXO7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCTB8CZR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+EkXO7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCTB8CZR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OHDU1914922
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A1iD0hT8gPT6LyNlMAYMTMam
	sqTnUn9lu8xXjn/UQ5k=; b=h+EkXO7zrlnwszqh0Cm99Fgjtb+4bIFzTiwsmgty
	duOZYcdRvTQy2eg32tQjYaF8HYOzKRFzsgTYuzTIUVDu4/K1zmiMO1uWCNF+qexi
	yxNvexShMLAOF0BMc2q0PvNDALV11aud296i69TZn5XdNJZc+MhXi9x6gaOgC36l
	4tmvdgofzdtoY7sl4adb0BUAJHG+sed7XldF0qGv856Y34kr5BDFn2DgDm51Dnk8
	301uziC2XSBEJInx2sfNJ1lBmxyATk0M63li49FOZmqSjji11URs1oNzTkIRy9z1
	GWcppYHIFyAkeuss8NUBZWwt2auMjNmmNi/IVthDH6Mb2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx3uy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:56:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157de5360fso908096385a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571362; x=1782176162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1iD0hT8gPT6LyNlMAYMTMamsqTnUn9lu8xXjn/UQ5k=;
        b=VCTB8CZRsYUUNm/FsxmJhMOktXwONamNLr2YzXNijcWXG+17v8zhfqfyylSV11t0N/
         WVo4fbJCNr6BeEGKGADhnThD2VTKGOklDV3+Q94SWZ4Kwv7juCmLX0eoAkKg0vkTg+I3
         9QHd12DCIIbPrTTf4g3gmqu7+xne7Bve8HXcRHbR0Qh7o5rjP4z+chry574c/kA6Noav
         k5N1ne+A78q9iFn48FJseFmYqSrM2X0U7NeL+vrUhH8gGgiYIz8RFYOZRXWknbIicG6Q
         /j2mMF1hq9OqE8sZt+vyCTz+KdwgXRDKzGXcLRJYiGoQPWXKdxLEbX1dTMbMcdOTUedT
         MDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571362; x=1782176162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1iD0hT8gPT6LyNlMAYMTMamsqTnUn9lu8xXjn/UQ5k=;
        b=Zr6pJasIoK5VOPFua6oJrd8CGcpjvmslTInpwCXzNLQZIUfMhmNvKrsoAyLLz3A2Vx
         evSG3vu6z7qdjrb50DV9mUiUChly2qfk4QyVnSlfWReBQsB5OaB7eh3PtxcOC8TAE31M
         /csEyM2uc51hoYoojLX5SlDiXhQopno8OemHNW/FwoEqe2juizJxbzF34sh6MShPS7XS
         8i2R3USc36nUoeqrTzdYtiaxoICkdVcpgpRptI4lNCuoRCzDI0pvnJrbI1vCE7oA0U6J
         avU108R/Qt2G4nwEJpMU7UZo0lqUYlh2+jfD1iac5zpKt/3o28lMWUabjPdlGfVvIL1e
         4SDQ==
X-Forwarded-Encrypted: i=1; AFNElJ94mcg4S+LJMVy2hMdlRitqH88/e3GHjejDfN75Hldx3x3app5og3p77FNcqTY3ErTJpVpgIuXN8l+7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx3JALOJYSDzgaT3GZ6+XH25/hgtxMfDnLDC0+2u+Gyz9UWjuB
	gNLjLXdY7g5xE9orSdDrmJqLUznDaTd59ZW9476z67ezO5ozXeugSnKbFGJiLQ61jxpHcyXY1S7
	qfreoJ+aUcZplYFGgrBRuoQ2SRAt/1VgzTh8MxPFuV30yWHl/w6XpUgqyY/Sh4l7DqpgLpYjN
X-Gm-Gg: Acq92OHLUow8LkmVwCs/ehTREmjScmOSbhw8Bi1XAW22ZMNQn1DN0EZQZgdEp8w+U9R
	E/WNzHOeY/pG2JRZMhUAD5L9n8X7iNPEz2+iobNTPMbCm0kwUPEG1VfKaExCEikYrDAzAvrmhzV
	U9409v+77EvNUlcJ0GqkR7nNVNJlX0CtwNlC55U74fqcq0GMVsiUxbdjPnj8V2emdAzh7sPvjWD
	+xcNlYqR4ZynJi3cJbtwU7UZuOQwaUCEcVkF2wgEUzx2MkSvtPEVHVKAPA1cY8Fsac2SqwchkBk
	B2j0OCwQSgI+3IWOEsgltxERbc3tD9oSiB4OYmIiCCOLSDER+eqWW63mLYL/Ia4GaYWPOE2cdz9
	VdWwr+UtO7vtbqOzz25jX22ADCkhD+hjdqoESQyV1/oxCYouzG/K+hHlmpXMM6+HCkjyukpOFhk
	0G0s/FaI/rxKgfL9bjUbVnUYj+FvC903vbHXQ=
X-Received: by 2002:a05:620a:25d0:b0:90f:786c:4a82 with SMTP id af79cd13be357-91c2fb91ee4mr261732485a.39.1781571361969;
        Mon, 15 Jun 2026 17:56:01 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:90f:786c:4a82 with SMTP id af79cd13be357-91c2fb91ee4mr261730185a.39.1781571361503;
        Mon, 15 Jun 2026 17:56:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7333sm3082627e87.52.2026.06.15.17.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:55:59 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:55:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, g@umbar.lan
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add the tlmm driver for Maili
 platform
Message-ID: <5fwiokm6dgjulxp7gkdld4nvashsuzmaij7qr43tsjdg62vsph@b2ogs3jmnkek>
References: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
 <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uIoUGRme-ykKVUtQS3jII2cYwf02uUEM
X-Proofpoint-GUID: uIoUGRme-ykKVUtQS3jII2cYwf02uUEM
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a309f22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3KcoXW5xE102B6w2v2sA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX41B8ALs8DSJQ
 HZK/4Pl8vVFzZkXDrqw9PS62ds9OH1sF15O7zWP9QQKth/SJD4MYq89T5LJ/TPeKZg/0mx53c4U
 bqaPv2uDRO35cTq45oaT4WIivU2ze6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX4HodbNw81Lu/
 2azFnJdokBaBmKprv9dp+JSTe2alpWPeQ0of8AwMRRSJQtx3mESdM4SHFFeUtqseROlsjpSJJOV
 9DYFk+6VEp+Qn0eGl/06tiOTeliD4Kts+hbav21oVuhuhyuG19A9pk9rKdCqQJROkwm/sXy7V45
 vnIErzmpkiIbtD6LlXY3IXXXgafN0J88EkOLkYQZY9RBcbbUr3tsXAi817/Anjp2zAUq4kO7vVf
 AdQl+3tMEPRdKMg3Z7QBNV1GPnEIbfBGEIvFXFY/jAcSqu0atdFxzwi15QZ/UlVdrgoznWHS04t
 N+A8vsa1YAz2cDI1gjwgF9nPK8aduoQ1UcUN5dbgLzxuGoZYJC5NMLfhvHbLgx1XJixqXp/jVt5
 TlBSeC8b6n5YoIXBYDMcX/PGjRnGSHL1fWQ/YMx6rjlZ6ljTgOCQZj2X5ByYNboZUJv7vpcr7+f
 wjtf+Jkoa75NZmnhKgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160006

On Sun, Jun 14, 2026 at 11:55:04PM -0700, Jingyi Wang wrote:
> Add support for Maili TLMM configuration and control via the pinctrl
> framework.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm     |   10 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-maili.c | 1630 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1641 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
