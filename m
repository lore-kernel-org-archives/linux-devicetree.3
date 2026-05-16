Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1674230BD5
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948562; cv=none; b=dIY6TrLx8iId6wQdevPi5dqPPQSzMSOgegLsgwUhihRQeoy7bu5CwM2W2tLb9g/bV+pozyk9VHVj3mw7vQ6bOMiHzM8NR4ZKqlDdelYTN1lc+mftNDWZKfL5M4ffifiqp9Z0pGNlBDoUP0yRWJvAq6fHTJirKGkXlE9ASm1fQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948562; c=relaxed/simple;
	bh=QbSMZNro/tsFV61AOiauNJk5853m5ywcmzrf4R+Y1eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpUGsHkaNP47Fkmu8aIOptzzdJm0Km0Ii1MbVvH4pusqGKaiTangfOOzXQ4dVmE+j/IgJkeg2wWmg2lb9n6InO3j00DGcWXeMGWCsEFYujI2S2uq+kqu5kSNJJlHkKBBo6zSXC8j4rIAoiHBc9Gy3dJ5udLrWx7xwqBiJREGD5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8buu+GO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsDv4Dtr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8buu+GO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsDv4Dtr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3lods3573203
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 16:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sVs3WHhnycnq25s8a2tK9aUD
	JAVeSsHh65fJqWlNy8s=; b=G8buu+GOqEIL0v4M+PIHoMe2SaiNTbHJuns5L0mT
	TiHZ++vCqcxw7Yytw+Jj5UjD0exUFJe7Y0Ssmu3tfSfiltROJE/ggx1yRVqGEyZb
	k3jMatjGYZfhO799MYCNczCpjSy/k73j/w/fdEQVO9L6ngnXNH7mDGtnf+Gvxu9+
	bn8vZ7NGy+nqItzskjALjrx3yR8W86kXfcWrdiZ3QfAP8uq3KoAIe7FwgaD2MrFO
	YnzgBe2Rr3FegOmytlFLW2thoYtll8UADbCSpdcbOPGZhGTcozOR5kfcvStU6s8N
	fd4pAFCcUNbwbr/URAVUdXiVLc0yD2G6IdfaQ8NhIorlQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01h83k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 16:22:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5162ee45a77so26168241cf.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778948559; x=1779553359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVs3WHhnycnq25s8a2tK9aUDJAVeSsHh65fJqWlNy8s=;
        b=bsDv4DtrslOTrOTDjsG7gZYu17raTjsNQYOLZnUYj7ZrgLFNJzwO/bUnzGLXJay5dX
         fHy+l069ayRM/TjmiaPsK8zIFROPpV+iy1W7UAFCaK7dXyhGJHZDGJ0QqsH7R+VqEFOO
         avZKghmaQNkOQmzdWIEF3s3AftUdqALCcluLGXSEdTGLQK6VWSz0YKFxPskd8SkkFL4U
         TyH1yxF+V/JyvaBI4ufLshG841Kah2JMt558NhFM1jb+NE9rWhfaTKRT3gEjZHLsDKx/
         hSGPfOlqw/iXsVhKN8QyF+KxOtqvcBrfCAAO4fSzgeTUPbi0IWjTKdgEZWKlWtbZcG1j
         77rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778948559; x=1779553359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVs3WHhnycnq25s8a2tK9aUDJAVeSsHh65fJqWlNy8s=;
        b=pNXyD75jdBniZ6PR5lWQnap9Xw/RUy+UVs5lOwoJ8Y1Zrysiz16p5YwWKdUrpVMF1L
         y9HKLnSwi687t2MK1f3yoga0TfDEWdSygnj8WWDx3KY+ZPfWekDH6rihRfOaSITgjH4h
         2FuenPfxTit0O1VbZaqsAL4ynXNdnHtTArTyBWuq3Rln1uwNPVemRUos9VXDlpX7U4A6
         X2yhsq8nlyK2ROSM/IO7Vb5XNceYWJHdqWsc0DJSMVO7fF2yn4qzIGnVs2tFM6UpcsDs
         8Xuyr8QR23zdiXFuaWM6R2y205uNn8x0xWO4+pbbFvGqlXPqHLn/CSgIGw5md3I0Lasb
         TLdw==
X-Gm-Message-State: AOJu0YwF1LRWcEmSGdF7ty3lojPF1IX/9dJDr9HclcktgKHNuHjkTZi6
	1PdcJ+OrXMnPvX8gv87WcMFGOw3L23xixTnVL58QrsyzC0iV6uXT2B1fKm75LvbDJbSt7gWkY2j
	4zK7bQh/xbwXfWfgO4ixcazPOfR1Bb1fSYtZEnKwdzHie0FA2XPXxmuvFMxio1AzM
X-Gm-Gg: Acq92OFqbrqb0I+df95CTpwmx9BeGyfGH7olAFGU1jytE49UWR5+/PIBB+JdtNxK00c
	Omfv8N7nlTa+tQ4z7TDH3Ovkpd5Abh81eGuaTSOV81lP93nYB4noWpA14J1ZlZXRF/xx9A1vX5x
	8bdN/74+6YP13A2Bnm7GidquFO9w3D0uqIgk6yA7okrb+ffuj20b/7kfg2leUeAs+Uoo9wSJ1lF
	Ph3qh64Ve2V03bllmNUDGesVLXe0RLLuNSd8CPMhQfZ+Z29WcjuznTMJ3gErYzlm3VuMg12hoJx
	s13YXj4zAmwqo0PLsJmynDHLAzM7amNdxXrIt6GC7RhgbB0ChOWSDkDyUnYNob//cbcLlk2B7Co
	O7V7RVgLHECCrDbQbuxsY/SKxfVAnzbsEzoeZGRUEIZC5mn4vGS3yVvNzyDlJWP7sAM+fo8/xjk
	tzcg4xxwYbXkhkFzYw2ol50OBaTpMC0CooohSr0Wy0jfEdPQ==
X-Received: by 2002:ac8:5cc5:0:b0:50e:601a:217f with SMTP id d75a77b69052e-5165a076dcamr126517161cf.25.1778948559323;
        Sat, 16 May 2026 09:22:39 -0700 (PDT)
X-Received: by 2002:ac8:5cc5:0:b0:50e:601a:217f with SMTP id d75a77b69052e-5165a076dcamr126516821cf.25.1778948558822;
        Sat, 16 May 2026 09:22:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cab4cfdsm23943751fa.27.2026.05.16.09.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:22:37 -0700 (PDT)
Date: Sat, 16 May 2026 19:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm7325: Move common IPA
 properties
Message-ID: <mpqxflj66d6gqwek4hmytp5r6xxposcrzyvh5vyvkstqgget6e@awxvzbmfy3nj>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
 <20260516090853.2873223-4-zstaseg@gmail.com>
 <urrhdy6esy4srh4hh2ebqvk75z7xjk37n4nyaybaayitlnc3au@y6cm4y3trvis>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <urrhdy6esy4srh4hh2ebqvk75z7xjk37n4nyaybaayitlnc3au@y6cm4y3trvis>
X-Proofpoint-ORIG-GUID: mgLjMp40K1UU3WLmXR0nwOVvgLlZDgrh
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a0899cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=q6enR45eAREWc0_BSpMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mgLjMp40K1UU3WLmXR0nwOVvgLlZDgrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE2MyBTYWx0ZWRfX5Em7yJTk9iGX
 b3l30H7xbxon3xzr/r+czRrDX+ey57rnOLwxFAUAlvbpPVCb6hzSLBqXexel2DHXkoxGoWON7Kn
 wDFaAQBvT6x6GG2IuA4PnOd9YAL1+m8a4NrlcqHuXKMW+zkWlAU4kOftLPOCdHMTuZ37uuL4xAj
 COd/e2cqGCOnb9PzR6BskHkgvxbwDdWF6obxqz0oB349jLs86t0uvIIwsgOYwQHWiQ9/4JwYoUz
 N6KdHtiOtcV6a6OoskY3+D1gWTcJ6bFqmVJ+zJJZXMNJUqEUFgQ7AcTGAncCIE+nJA4zmGCzkSf
 +gWjX6JycO2VF5XWAzkHfYbVWN/i0b59RjdryyEOtGpNXMVoqHQoy6++IYA7DQ8GmUxkC4kBmea
 4Dybs/LY5Gaz1B9/3XSUTHDrJMK6KpsGCdRXI2O8x4Wmz4How8r2c6FgGux3vnhWcqmaXq6v5rv
 9vfNn1JTEJvHYbme1NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160163

On Sat, May 16, 2026 at 06:40:48PM +0300, Dmitry Baryshkov wrote:
> On Sat, May 16, 2026 at 11:08:53AM +0200, Stanislav Zaikin wrote:
> > The qcom,gsi-loader and memory-region properties are common across
> > sm7325 devices. Move them from spacewar dts to the soc dtsi to avoid
> > duplication.
> > 
> > Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 --
> >  arch/arm64/boot/dts/qcom/sm7325.dtsi                 | 5 +++++
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Looking at it, the property should go to kodiak.dtsi, but then it's more
complicated because of the platform differences. I will take a look and
maybe send a patch.

> 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
