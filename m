Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB903A2540
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695135; cv=none; b=R4qlg2+XnHp85JAaaqhO212edtSOnqyZaTg7wlt6vZ13IxIL0+kRg6pcs/C8q8b8M6C6TAUXGXUfIsIFgAN5yywIA2PHobKGLb/++WLyRS5I8Dg/DbpyF1TswyrzhJaxp7WLKGm4KoiHDDTMLMh8QguLHarI7o5sWoYm90FENIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695135; c=relaxed/simple;
	bh=nTeuEk1UVUVYb0OVRGIhQKZbyIFPSssLEukrTo1Ne0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSQiZ9puo5WFWLKO4bD1XFSmwUcBBkFnTgTlpds2cPY+XJ3k724gQMQoC3NMQKjFttdUbooTYSJ7EHS5mUwyRM//MUe/ktt3h0cMAPKkD9CEss0jEAXzdi+dB8jLx3XLmmGwxSJFBkU0I3/2aT26INW/e0EA1B9f3uiPkDztPiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSiYKVO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBSn9CKF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSiYKVO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBSn9CKF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC293q2965186
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1WKKWsy30d8mA0DD+ETWJZ8a
	7Kl1AqNPvhJoq/q794g=; b=BSiYKVO2YMfkIG0fCZORzl+GyoJ1WQGw3vbcbbJX
	8+9rUtHAknD4szJjVD2PyovYSne2u7TPE/ASEOLa4No36Hzvp7uzkDB0Tqf/2P29
	1/ZeazSJ8P7tg6+iaRkoeRsTkSF7w3QNT0bwgoqxRNYB6WkiAvlP/1BHx9FF6oTk
	9heosIJAZ5EMNHfbHUM5gjo59+jT8cVZ0e7YFWAVzlSeRAYzJ5DDtI1tLB8+HZT8
	+cvhs4NMw1bVrZ030VsrKZuVPUGE7cb1nT/ZUubeZRa7GGxW2jTmaSkzZHvG9ZuR
	DwGgp15vFE22t4i6QbCU3wvMdHCRzrSMRJ3bjqJ91CfjNg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5anv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:58:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf01172bso16617301cf.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778695132; x=1779299932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1WKKWsy30d8mA0DD+ETWJZ8a7Kl1AqNPvhJoq/q794g=;
        b=KBSn9CKFAe6CiRv39m3W5Uoe5ZetnYikvctjGkKmllyrFtmDoJZWOn4RZIDXTdK6uM
         +pWT0o/hFTpbt3zetE8bqolcSDmscchKOddRu5dBKsWpK8Wwyf4VIzxltfly0Ky/a2xz
         6+95iRYMJKXFMASJkZPeCLaBL/qraV8ZhK3lUTvxHfRKq+H+eDxN6npR/n4znl2sPx1g
         KjSRTXeeFmsheBphvhJsams5frX50k+pL9qHyRHbxpIHig3EKcbYyifgNlCXkLaK//t5
         CZd8uwZrbDfFxd33vaIrCgcyBN+OshwDjBfUvNk9FYJ6ebsk3hW7Y6bxI7EqdbJIpsPX
         Sh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778695132; x=1779299932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WKKWsy30d8mA0DD+ETWJZ8a7Kl1AqNPvhJoq/q794g=;
        b=j8ZV9IaKk2rdac0sB0CwJVQff8dQD7QSWcJyKTY7VmtlokXbfPZHAjYcoWyj+j+ht/
         cbZPFCmXm6PO5qISIJTlsGUBka5JSa2/paAPC5vMlbPmGqQRUxgezjSwHCrrZDi86RMU
         rSCk5tmy18FVj9BPJnASNMY/dvjV/J5zta4un034bdvAJXG+Z+RLe6gABzbaxaGh4bTL
         /Gf14BFQ925gq5YIooa/VDbrRoMwFRWCQZPL3bEAYbQVeK/deoAo5ZigYjTYUiaX0ow/
         5cD+xGPUVRttxHFUhtSQJs40SZoUv72+9bW3v0Fy1O6vcZHCdwv9L0JakzDUMv1dzXgB
         08IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MLngdnNH7AomqYHYBSxf2uyXS0HdrC3l8VxW65gmFVs/TuLoYUPz3FfMC8v8iD8VPoN8yF+GMLGP1@vger.kernel.org
X-Gm-Message-State: AOJu0YycwqD5rd9z3QWllUfQ9dkuGiV8qq7reQSNgTfN1Mw2Uvz6dS6S
	8/nagRWN6t65eY7PbRmP7KnXije0jCnhxmjL9cOonfXY+Af/lUgxQbwbatR+oh/if7PFXSRio7e
	nxRBvabTiJPZ8wHRSwHrMBIs4u/9actETdCBJG6BFmAGjH7x18HKYfmd6evwPO8T+
X-Gm-Gg: Acq92OFxun9ZNP60xBgCWJv+b7tN8qayeisS/daIJE0/G4rdlpQv0jUYABOIZiti/Ub
	wUoNX/1D0NHk4c9JmWeJEf30bLv8wMZOqX+3xi8fOQ9AlUydJtIXTo59wGI11qsQsFR5Sq1hJ0W
	vW+bGE/6t1fOv7IYdabtUtQL9VccRa3FY+ZAnl4iRlYcZaE1zy6AuGOVp/Exz+gqS0tpzVlTpCr
	U6Tm/vrTPYVN9SGHrBopCX6fmLGE1UT2mX2rlhehtlye2LDuKmmzPDIeXUuJbqzDUlUW+ggCHtf
	U2kk4PDQ5QPV84X7MgK5OD4wmGcIBOP8h9gF6D1vdDFgTXhYXqF+LHRKBUg/yk67xaij7cJ7nzQ
	pxfNNSHx30pzIYlHOKfhd+vTmt8Gv6wUI0Tbtd+YPkecSwC6xZizhyInK0lm4myo0WMaFqOty9b
	5tnXx+83lyfOznbhYtwgnF04C7N8B1QXvs1WY=
X-Received: by 2002:a05:622a:1e0f:b0:50f:c5f0:f2fd with SMTP id d75a77b69052e-5162ff577efmr52620531cf.47.1778695132295;
        Wed, 13 May 2026 10:58:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0f:b0:50f:c5f0:f2fd with SMTP id d75a77b69052e-5162ff577efmr52620041cf.47.1778695131770;
        Wed, 13 May 2026 10:58:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b2acsm4133502e87.82.2026.05.13.10.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:58:50 -0700 (PDT)
Date: Wed, 13 May 2026 20:58:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        Yifei Zhan <yifei@zhan.science>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: add support for pixel 3a xl
 with the tianma panel
Message-ID: <sxfr24cgzfa7vr5jvgjpnq3vdhqwoasycyjrphydleucsrip25@vtlul22nzqv3>
References: <20260513172549.1345-1-mailingradian@gmail.com>
 <20260513172549.1345-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513172549.1345-3-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfXw7uw6gUuk2Mz
 u3rFevAu07jlzhgmSCDphfM+eeRNuvKdD0jmY2Ppsqn5P7Qi5/tK9V5aHHhVcRRcvOlBo5oZV3E
 PAE5nN/JI4kzafOPY/fbL8Zfg6T1ea6Ilk6Sct6gMJMu4icr0zoxTYNpBOMcKLYcPz47pD0zxcM
 hZzMcUhTZvqaCRgooLoL99FaTSrgeh502EIDKW3oldq2HC1FZylbtzmy7hEDrAQc65unbYWTuwD
 iP7lC/jenFl5NAta6fQzRLgiBzGe0WcKt78ZX7NlHUnDVy+I+bolm9apc+vOh6+IYcglAiCHmWa
 lZOUkRVfR1piOxhxRiHMl/Ib23zpG8bWVipozKQAGJqNg9TtzHj9HSlqiF3UF9jQ4/dPoWWCpRo
 85S7mZEDc3addg2P/BzvjPnYrX1joI0WMwSaewHisn40uyL1HuKvtmHNUxxrBP78n5hDuXRTgFN
 ULVdU7ncmMg0cqATsxw==
X-Proofpoint-ORIG-GUID: LW_vxfsSuFqpsKDhhOjhzi0lV2k8-N55
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04bbdd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=nkUbddICNmq_qF48:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0n9J7lFBbKc1xmsM6LIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LW_vxfsSuFqpsKDhhOjhzi0lV2k8-N55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130179

On Wed, May 13, 2026 at 01:25:49PM -0400, Richard Acayan wrote:
> The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
> panel or a Tianma panel. Add the device tree for the variant with the
> Tianma panel.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: "Claude Code Review Bot":claude-opus-4-6
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../dts/qcom/sdm670-google-bonito-tianma.dts  | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 169cc9b9ccd3..d909c527d848 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-fairphone-fp3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-motorola-ocean.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-bonito-tianma.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
