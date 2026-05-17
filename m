Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9963BED66
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042097; cv=none; b=G4MnIZDPXHkLH8+UhHAaOZgzdsI95Y7GnCnV8vsHd2a8j1ivvmh5dhW4GTlNeYmkzel7fqn27cAYIWH5Qierl1C9/a0Jo5qroebfNiO4Vt+k7/rfXv9v/Lz2oL3QrKk8kqMn81GBUPpa/AGRdISGnFOUp1Pn0sbpIT4OUbziscM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042097; c=relaxed/simple;
	bh=QLRmnAmXmBxtEPAZKCGiRo1OmutoBrU2oBUCOucKahA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wb4QeqRH1iQPc2BLYL1koZDUQqUub9LEPR4jljYnJmVvEHxKUOI5BXGail8KHAGHT25q/nKaU6VM3QPLOQUeRs2je8Y3/cwlUbG6rEQqkL2rr5tQ4U7/Rsp1TtRoxtGty722TAL0hzQxQmdGDYz1x01ac0cD9MAnBDlpfR70xMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d50m7Nhv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsoIctWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d50m7Nhv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsoIctWP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H3PYZu2753028
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LoX2V7qBQutb0MAbEsVo9ahJ
	MEdN0hI3xKZwjM9Qtvo=; b=d50m7Nhv0DHivtAL8V+B8kh/pauK58uVs7AKkwJ5
	aUK9ru0m8toL20Qku0fo0MqljHp8n+Hrc7oyW+BmWKpFF0XIRzWHtCdsPSoWTRF3
	5afhUtW1Me4tx2iiL45UuFgVJCgaZ13xmyoN2e5gfvXKQzTWIFbVDLsl69K7NCWZ
	l+NoScNu/fF1pwhtWl4Hip6DlKZRlzDlex3C85PAzx496/jltEWGh2SBCfv5mAve
	ObBEF4qSw0eRQw7y/vAUw1V2myWaa2BeNlMVtlqxMVzV4NWmkxV9pDuBk9+cqCCn
	eiYwJNUMp0k+VAYAqBsF86y0YWKCKiw253NwJ7XEltRZ8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qbbx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:21:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51605cf3c60so1182711cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042095; x=1779646895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LoX2V7qBQutb0MAbEsVo9ahJMEdN0hI3xKZwjM9Qtvo=;
        b=VsoIctWP8H5hfN1wWdknm4hlvCL+nqh4SgRZtz6adq5rPesButSTkDqSOvfZnmC6W3
         MBZWNo2XnuFK8DteJ2QzgzG7eOYQGI+QpDLr2ZwPKgXP2buztkPqdK96dp0LCNXk6okx
         eLw/R0yKvcfjRiu6P+BDM2LHAdWeFCXhKEJwQcOp05OB9h9DkyInWzLm5C+DtKXUbLxl
         6tLGFAEPFrw7WQQx03fi6yiE5oq59zn2+0Pe8OnI1OH6tOcIVaz4hej28q/kU3vPXQ3X
         BBRwIu2XYkfgfVVkYtFEYQO6HNxW0+WTJecfcyQ1sLN0Zhq32ULLuBaVXphxwV0JA8dx
         mqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042095; x=1779646895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoX2V7qBQutb0MAbEsVo9ahJMEdN0hI3xKZwjM9Qtvo=;
        b=fbLPkCI+gSLbRHjCRyyouzaoUDXsXhKZ3hV4dEW12NvQXrX27ugxS1Pzo1u8vxIHEv
         BZOmzyBs3EuyI8miSfk6GixSF6r2A6d/5bkF0xyBhfHESTmex89/g/zktHwT3nxEVF4M
         iyynrURwRXA+XIT3iQ+6dXHe1Ajk1q3QSZdBDMZbGd4xvSOof+9PxvudsoXkg6h9shqK
         fwOU8AgZiRlS/RzPduC73MgakWPOLhFkNCnyJJ+YaZ3nOfcibRXy7skrkE6wfMUR0av2
         Zc47xBp288IBIHvqPT2Y4lwckW39NSUZD4wzwF2BnEfHvGVyiG8c0qpqR6rEkjsmFq66
         LUrQ==
X-Gm-Message-State: AOJu0YwD4SYU5gwXI6hnkFbKxAeKKU63jzD39SmitpDccDY4L4Q9Dung
	l7SDBSRD/3g/pJURHZ4odk5ttHGZqzD3dF3Bq/mXmjFBuUukXtL8w2RAMxYkZ6WV+cOXZsW+lmU
	/qWlo0Ujx90PVY7EWT2QZvSYx2cGaHM8Ca/wIyNvss82zlerfoTWtxyDhfAj2DFj3
X-Gm-Gg: Acq92OGMegj9FdlHX/IZyadL3k8mbrG0uvnUVOammQjjiGiS/UiPT84TqAJkq/UjpyP
	1ZH0s+PHDY3zFVS2kq82idhluCco8N+9Ks/7EoRgn3beQ0RiHmPV37RxDmFqddi6aptjt/7LRw3
	6bzxFNbSJ4VjBGe6ot73NFsXYw82MhNZqd7/pbc4RpyZjaaLVRNsnVyPrghrWlc9vK9ZPJXae80
	BPhbi//xezShSA36uRKN4s+eFou7f+HqkYjglAg+ulyT8TIXm439jqoX5h9dsMx0HDdUIuzCNNi
	nInqOd+76KS6L8+I6GUpgANrBibmyXl7CpO8t80g/Np4tBZo6EXOu8KnIPUj45Vy4RD+BhxGbML
	EbfqAwqOFyr3OEqMMMS5Y6f8p6fW+C5IL0Iat+MprX6zwo5xnXIJf20xtv3mmsqGP5w8zge4Ckl
	bhew8gxvufJ8lUqxOhIlXeJJ65CVNR7CHh68bKRNh+CnuUVw==
X-Received: by 2002:a05:622a:4d09:b0:509:2527:d789 with SMTP id d75a77b69052e-51659fde5ecmr182600361cf.6.1779042094825;
        Sun, 17 May 2026 11:21:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:509:2527:d789 with SMTP id d75a77b69052e-51659fde5ecmr182600131cf.6.1779042094390;
        Sun, 17 May 2026 11:21:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39588281540sm6793811fa.1.2026.05.17.11.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:21:33 -0700 (PDT)
Date: Sun, 17 May 2026 21:21:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <h33qy74eg74kjqetnq6vnd2zerg5szedxapsknfhndhqbwn6gk@q6ocp2teu66m>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
 <20260516090853.2873223-3-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516090853.2873223-3-zstaseg@gmail.com>
X-Proofpoint-ORIG-GUID: KO7EC5t3tWRu_jUX1Fr05GsIVmTJHIfA
X-Proofpoint-GUID: KO7EC5t3tWRu_jUX1Fr05GsIVmTJHIfA
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0a072f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=mRJwLWP_GvxiHzzCRQwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfX89uePmZnvLlq
 vM3kTBqK7dOhnpK+uy3DfnA9NS870a1UNIpcmarHieiz2MaCBNJi1cF9hdiq/SHjrxAIi523XkP
 SA4CWTnVe9aPsV5GtvvaRUgfXdFZRZMUhB+aqpkzZrTvnjCQnUs8inAL0XAAAbltYR8vkBPsby2
 RammYfYigldSorn4NsvcgcADS2RJ6mHKHRi54mUR2Rwam++HvZzj59aTRqnQa8AGrlXruHECCxu
 IsHE8DJiOh+mgsJPxL5WJbYEsVwpO1MIrPEAyP+VTGN5luDFHDfKNnLAmni99xG9QaZu31Ka7I2
 22XeKhqPboyoh/ws9igWQ220OIhU3fbNptSQPGIRZTBQFs9GbBwx6h0rckHyRCOPAqg+4V9n8ld
 yCibE6UtbVXI3z6B8WztrwJZAdbyfrr5D2J22Rs+OPDjv3lz3N+1QzNIMAfKCMAjWAJP0PdvY1M
 x+1yMzDcEo6UH6Ywe5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170198

On Sat, May 16, 2026 at 11:08:52AM +0200, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 908 ++++++++++++++++++
>  2 files changed, 909 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> +
> +&usb_1 {
> +	/* USB 2.0 only */
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	dr_mode = "otg";

This is default and can be dropped,

> +	usb-role-switch;

This is a part of kodiak.dtsi and can be dropped.

> +	maximum-speed = "high-speed";
> +	/* Remove USB3 phy */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
