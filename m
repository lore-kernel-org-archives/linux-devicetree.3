Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC4031AAAA
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869115; cv=none; b=Bma3oWNzmBZAJbEZqWvmT77RhOotlQ3dwBDc7rwqMst2oSkDT4N6/SoDIyNLDE3P8FeSfxO56Y1jFQNvQ1UQdEp8RrPQbSXFNovtWgCoCIN84Y3wg94zU6D3vpvOzhmfNq62Vjob8mYgtjymQ0zmCywy887DoFmBCfTHMKG24LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869115; c=relaxed/simple;
	bh=PJIHbeqTJsIe0PZwZEkydMC+Kjr73lehc/ylb/OIGBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4C+Cw803rFIT7MbQ8S/e/HWFDUKptSASw+T8qQirfsGm/8/sB0TOkDTTshP6FA5ysOzSGoGopZt+YJMPwSoXrSapLzHj2ThXgBHYimdf8/O67sJ1LDAOIwFdggFfgfp+zAZ+QLnar4r81jXgWDvaSQR3JBhq+3L3YU8wzR3cOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFYQQzJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFZjKPLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFYQQzJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFZjKPLG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkS01441251
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rKDkQFtFQoRGgaiav3QWTOql
	+e2ZOVLUtvHFYymj/iY=; b=iFYQQzJ0q1l5Z3ghS2HW47KRQtbTEC3jmw/v2qB8
	YMcNMTP3ZPDsMAUQ1Zob4kt325WqrlRpiKEPgWtRM3YS73XSGj+TYTL6W/Mwi7EE
	VoeU2iO7mWYHtZjMkHCxCTUUHTt9GHAGASFnutanY2TRqNe45Zfwmupy+TMFDv4s
	EU4dOiI2+pmu8iR8hRlOs/pi+rWidkxF6kG5VoFe9qXHPAd1fI/K5KN/6hpV4ydx
	eNW416mGNWEUKN2xU0qzqFD/+Vj9ApabEJKk3pNwkM0f4Fz7JZcTVSqv9UsWIHPs
	MGWGbr70AYCFefBRXIIYR1bD7ccuNiiz4hKXJWUbTk9Apw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwbn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:51:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccf3d72081so47034696d6.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780869112; x=1781473912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKDkQFtFQoRGgaiav3QWTOql+e2ZOVLUtvHFYymj/iY=;
        b=gFZjKPLGgdkGqDBoJMxA/SM1y4KOiVlnR2oVp7mheGqBOye7mUfeh7zsqqCRBNtbTg
         wyy9jBGVAIGVqeQpv2iEsw1bRV6AVbyspVorSIaCYnUR9sHi+UbzYn+SglILFMviYWz9
         6V7q5JXEOwh0RWHAtSiTHOoKYjRYgeOVJr8XOG3TJv+ZH6Sc2VYXP5y/Q1mABOkk/Px/
         KGXbLvy9omthgZaCSlrIK4ce6gA7Kji2P8Sdh/Li28gVpq+MO7+czJJNJBvrLvs2VVa5
         64tx8dTE4qzdfWgSnKY2/6c9/+xBTmKRK3591ecxuUz23INB1ZNdws0nuDgPYfHjrZwc
         ub9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869112; x=1781473912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKDkQFtFQoRGgaiav3QWTOql+e2ZOVLUtvHFYymj/iY=;
        b=nB0+hdJVdw1umWqD6dOJhYmR5KWYIxGYCW+VqOQLV4hdLeqlVKanG0e9OVMe5a352m
         jcQm57vm9BVcWNVFXMHetFAJt/PHsmw1xCOXU9FpRryQSzK7sikmawX1RywHHCOhb3+q
         l0ddLS4/UQBRxbqCmPFF+GyBFet/+jp72tW/bd7+opbwXX3Dxn5+uTUvgiF80RhWTUSn
         jUk8ccKQAcVCCoTs0R9Uu7VW3AALE86/CUIUzfPVwurMbaH0OX86baX/rZSD3/y04/xZ
         kQ4mYmXiCaTmb1F0OXAdJS78lozSgPLlhxWYB7Fv3wEZEdS8pHDejVzuo9EDgOkGunyQ
         n+mw==
X-Forwarded-Encrypted: i=1; AFNElJ86A3kqTGIKQldj89gTfs0CGzWOTnudQpgvL7jjdgZDD/4C/gsJoqy+7IT48Ci0DPly/UiFYJ83BCoA@vger.kernel.org
X-Gm-Message-State: AOJu0YzqeWcaZs0P0twxlwlS1gWxTd6GFgoRb5zwtGHVVJ+Y+XFGMMpy
	D9Qy3DUJ4ulLYfrRj3D+9O8tA+eBnXzEHY+p+NJT75coEDNeoU2G4COfZEAENMd/QdkhRJO8s2t
	rgKpYLUywv5LyKySTYbK0PIsMI02CFqmN1MsorMqH2xzsoWMyzq6dKOq6ZcnTGHWk
X-Gm-Gg: Acq92OHllgFDhEn2RfQlXvTnY3J+lhdMaRTp9ch8MDSunc/0WsBUWm5FHndlyLVqEY0
	oMFXjIH1j6pUklmBsnoBfW0Fj2mbTpKHguTxD5SvYeV1zEFCzzryXFzrXEDw7k5JdTQtVzFhqiA
	bvVYZrEyvJF0vaNV+kOq+eomnrlZhxk4vRZkSvYhAH3PpJqfpijM0P72QSKlc5+Xg+8lMdOErXP
	gF6HDFabH6TC82DFb8peZ5zRPD3fSv2g/JGI8WQK/qkZ6uiPLocgz4k66xXPY12mXUQbREZLqxS
	/4i8ZuTOPGFiR89itmNth7aRbh1raigRb3llehM2u6lxLuSyk3AhNQFi7aCS5YbZUG9lKpNABJA
	gJI1YVareeVxLB4pzsXYoTiqD+ma3HYSXUBvxBU80HyIEQArog/1R81c8uXadP/P2fy11jUsKk3
	ppqPvSbppZ7/ugVWO6UIem8zaj6V6CqTXoFzR7I1b/qOi3PA==
X-Received: by 2002:a05:622a:251b:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51795afe590mr192005091cf.35.1780869112113;
        Sun, 07 Jun 2026 14:51:52 -0700 (PDT)
X-Received: by 2002:a05:622a:251b:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51795afe590mr192004861cf.35.1780869111756;
        Sun, 07 Jun 2026 14:51:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d6282sm41201931fa.30.2026.06.07.14.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:51:49 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:51:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 12/12] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Message-ID: <mjmfhowcfc4vc4h4fbpf2psblnhgbwwt5qmmfb2fnkfaunexyl@c5rwjftmnlx4>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-12-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-12-afaa55d11fe0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfXzi863+CsgQXY
 mtIBofozdm+2ZQMgAGx/Ij9DIf+zpNrE5ukm0e48TV4gDKWtLcF5xwmDeO05d9Sa7spxv17fYzf
 yWZi3/C4mQpo0sUZ2CePELvBaQRWSh0i3CGIBsKPUW6YFpwUTqOyCeg0J9AmplUfMQyHZDSfh6M
 hQNF84nLeTkncG+n1PVeHW0Ac2qopX6FE5GuU4miMqhdlJPKLVXPe/aE0W1WYOFlOy3uXb7zqJ1
 oTL8OObWmLMK30xsnT6J0qz0s3SmaKfKWXNPXefwmCdEn36EJGqQuP4cOqvvVwruNafPG3ki/Sg
 G/+pau7AekhMqzEkwsQwEqs/bVDiy4JQaHiXvC9XZOoBtgeySYrhWm6sEzPU+FrDXw7cvXgQd02
 gB/9zvmgZtxAlidsT3CoZ+ucMcLe8YQPA33HchNpVIYgb8ipdrV78udbhOf9KDbKJFPFl2tWovp
 +otwOVbs0MXifFwm0ng==
X-Proofpoint-ORIG-GUID: BFCeeXG8b3OZiCAtGCB3FqEzXHdONAKB
X-Proofpoint-GUID: BFCeeXG8b3OZiCAtGCB3FqEzXHdONAKB
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25e7f9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MCItce8SuK6p_Dj8i7MA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070219

On Wed, Jun 03, 2026 at 07:48:50PM +0530, Vishnu Reddy wrote:
> The iris hardware block is described in the glymur SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
