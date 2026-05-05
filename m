Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855E1D9A5F
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 00:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777942108; cv=none; b=LN20gztCY4tD5dqL/Yurxc53CpFW8oNBU8z+FwtpjjogOwe7XiGnDzFYYf63IQEUIZPNrDLdRa0JLXV11QdhVVfZJoI6TViUqETgqU/RzWNubjxCOVcxhb9Fa8mPYp/dVZkzBncyW1/HWrVtitqVb4q482PWjbjxRhsnw7LofBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777942108; c=relaxed/simple;
	bh=CtxzZiqK2ihDTrGqRz+E/Pc/e8H9A+jWiivbzUAHaps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ND/XKqx4Fmg8RGiJAuXq0EVQ3SzLyMpNJGB+HKIjKV+Zaq038E1pvMqj8tIjyOXwitrviYAxgQ7LD4jTENDeNNFU04d4juTE9LMNZ4SZfmQfwFQn38EpecoAW0+Be+DwypaYPtNV2w1GsqoKbCF42enuCOrC8DbmrbQ5HLRwGVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDPRA2Wy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ps5NW4mT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDPRA2Wy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ps5NW4mT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644JxQVp331125
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 00:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZoqdR0XZGmUXKsPgvfPhc9Gc
	8oHeFYnuRnafn7F91g4=; b=aDPRA2WyRiQ2rfgD2tgLPZxXkjUmxioa59YymOB4
	NZL41rXZOyfIi57OANQ4K0g7YnUkG1UIn5agaNUCCfYrDi5JGWUTUvSnpho/Yie4
	QSL/2DkJeFpbbVA8gwn0I1W7nwh0c82aEPdZabeaSP0DNHBYB/ymqWnNpCcUFH2H
	TVHoucXJXImgiRuC+CYOyR0wz3MpXSqLncMijhzMYd3y4RR73eb6a8uaOr9GW2Gc
	3OvBnrenu2CjOP/cOidJbrZN0lK6YinyjW2BYdUx2VUpkEfkQ0fJ8cNOC4hCaQHJ
	vTPsBtQxwpS4c+cs2eupG9UkWw6lHKYXZFvMLXdf80OwDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1a6px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:48:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso64688091cf.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 17:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777942106; x=1778546906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoqdR0XZGmUXKsPgvfPhc9Gc8oHeFYnuRnafn7F91g4=;
        b=Ps5NW4mTI1Z3+7UzrzhRW/yKZRYqh3GA6EbtFtLXqIx3oetU9s4amtyM/4JTSZWL/n
         U5+2WB3f5IiEMpKQ7bYQA6/REE8RtnznUifzV1FSwXpb+eFFnxEi4T/UalSpeOXzEzGZ
         HRwz9l9MbB14Qj5lSll7De6XHTL2cFbKtStQBnOZRyXUBsGfBPkkPPZAImIpz7ndSRnq
         K/vx5BskQV8r9zgRLl1X5Yqic0Ub5aRg21DqZ63mdFk+uouSFcF2IatxbvdGFk061020
         ufVHhOidoMRY0pLkmiEPlVwLo4pdC9us1OATvdpsNtZozyevVv5Q0r7Pu9cxWh0mCh8h
         ZBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777942106; x=1778546906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoqdR0XZGmUXKsPgvfPhc9Gc8oHeFYnuRnafn7F91g4=;
        b=cyE2emfNSxLYQnkFqa3MnjvK6sZgSXKrcW70CKvJMXCy7TKblD4b43XXxGfQTfgqf+
         cJdC+i0ONx5BgJW3nfW/dOKvZDCPW7xy9qEEtcSK2GMTYiMzSoM10BTk4tVtHJyUXjkd
         4OARBCZZ+tYg2gTx2uOdnvLeA8JznDjcIgJHR3kJjZF0U2Vv2t5ERlk0ekuAdq9VPXrw
         U5ENdwZLDr44hDsAUr9QdKMdyiF6mHVkDnhtNM30lu3xCrrUF7KLJ2WzXEiZgp0zPKyg
         tJhYrIMC+tSNN+TFUbZYd4f2YD6sWbvy1E6wjyvOBylxVHxnqDPqAaMGgWd4x+nV0wpY
         n0Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/wfw1HQN5rB3eP4nANgdpTZoNf5nGDs58ffThgLkIXzJjLpFz9G+nOJPeHLZQDcnc8BmaVc/m+StXt@vger.kernel.org
X-Gm-Message-State: AOJu0YyBbDUUaR4JQtrs05s7VR8DAgKa2p9cCovTaz0AbZ5oWYy7KNuJ
	Ho/s4Xj6Ordr03s9V//yHFa+31Ai/8d8qiqr9n5V0NdnV8DOzbINregj4KhECva7gQqfVLcLZ8V
	JWhR2qCLAfE/eOiOpmT66reZ/qs9ar2qiRTgjRHdIS9Uxmq8hCAh7GkAbPelcaiyZ
X-Gm-Gg: AeBDiet9OPPFDc2Hjxhmzj2xdX+RL1M2NeVrx4NPt8v5pK5q5DZesZRTniU0CbGnChb
	ZVG1zBbSc6jJHCYeQR4R3feao7X3Pp0GGwx0UnGIJ0VFzUJYhiOI1E4JpgGBrBPLSyOf7d+PwQq
	/m3an4/4bD9pEHNt8kmahLRDyor9+PE3Gnfv655UMprEPnlcTWSosRg3TF3sUFP3RdfXaTeX7HI
	umVXIJ4nFtI/vd73IAlCrW4DVmxd/P7vrQZRmrGh66XoPdJkbO4QpHpSztvJj5yBk4UKRxBjXwU
	Q+FAu4nk/FTMB8tXqIOYNbYsTRNbPgDvpYc//xX5KUCsVMqiTRwlPo/aD0okQ64lYLr90HLff9E
	wRn1fEwgARLu/+yYvlH3RehpWdOZjBZQaYKrCjsx3i/0aAqew8HV3X77CfYS2LEaMNk/OCoCdtF
	0vopQtwdOpldeNBVqibCQOR7eUzg6/aJlUa5U71V5fafmUdg==
X-Received: by 2002:a05:622a:4d99:b0:50d:83d7:686c with SMTP id d75a77b69052e-5104bf98d55mr183328601cf.31.1777942105787;
        Mon, 04 May 2026 17:48:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4d99:b0:50d:83d7:686c with SMTP id d75a77b69052e-5104bf98d55mr183328291cf.31.1777942105309;
        Mon, 04 May 2026 17:48:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8670a37absm2603992e87.55.2026.05.04.17.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:48:23 -0700 (PDT)
Date: Tue, 5 May 2026 03:48:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, yangsunyun1993@gmail.com,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v4 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI
 bridge
Message-ID: <nqcq5h3io7o4jkvyywh2pzfuorj2grk3r5ogifs36obw7vawap@xv4ohryelqc7>
References: <20260430094612.3408174-1-syyang@lontium.com>
 <20260430094612.3408174-3-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430094612.3408174-3-syyang@lontium.com>
X-Proofpoint-ORIG-GUID: flggW1WuB8Flx79n1qasYslHtRlnvlcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwNCBTYWx0ZWRfXyG1KGmvuzzxm
 fcuRi4GS3zbIvZiBPiw3gNs4GTLvTbTb/jbTGs70tMAHGiHptvlTj5DkJzxTvOFsy7LiiIPBjaj
 SUlWTy6upfiDCP3VEWnw5ci9DxvsUilrN9Itvn7FA0tR+KqzTsQKGg7M/QBViY4+4+Dy2GAVf21
 7MhaZZwQvZxyraRURDL66XI/DRMHantE+H/+Fp0B4dzpmN1b+V0Ug9MoQRTAy5HVkLTY1cQJSTb
 NqwhZWPmV5XNkPpj10t6PsjkZBk+RBkYwZJd7QVtaAGt70mVnZCettOKKTPoBPVZ+Fru5zlneNi
 728cP/FwR8fcFY+7NpO1MFBRZGZ8c8xoy6RFQ0dvep5Zxlon5czWdNq/50d5XkyCz+N3BvdkNVb
 pzhdZPS67COCOF0klOTLmq2k72NCV3x1nzZEHIZy41OBhTbrC/Mpi58k1Lls/TzzlCk9fl+Q3A0
 yF/wF2TfbrlWNYGg1/A==
X-Proofpoint-GUID: flggW1WuB8Flx79n1qasYslHtRlnvlcP
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f93e5b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Kz8-B0t5AAAA:8
 a=EUspDBNiAAAA:8 a=Th18vmrz9VDaD5OkdogA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050004

On Thu, Apr 30, 2026 at 05:46:12PM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> and output signal/dual port mipi.

MIPI what? DPI? CSI?

> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig             |  13 +
>  drivers/gpu/drm/bridge/Makefile            |   1 +
>  drivers/gpu/drm/bridge/lontium-lt7911exc.c | 493 +++++++++++++++++++++
>  3 files changed, 507 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt7911exc.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index c3209b0f4678..8cff2bf15b09 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -132,6 +132,19 @@ config DRM_ITE_IT6505
>  	help
>  	  ITE IT6505 DisplayPort bridge chip driver.
>  
> +config DRM_LONTIUM_LT7911EXC
> +	tristate "Lontium eDP/MIPI bridge"

MIPI DSI

> +	depends on OF
> +	select CRC32
> +	select FW_LOADER
> +	select DRM_PANEL
> +	select DRM_KMS_HELPER
> +	help
> +	  DRM driver for the Lontium LT7911EXC bridge chip.
> +	  The LT7911EXC converts eDP input to single/dual port
> +	  MIPI DSI output.
> +	  Please say Y if you have such hardware.
> +
>  config DRM_LONTIUM_LT8912B
>  	tristate "Lontium LT8912B DSI/HDMI bridge"
>  	depends on OF


With those two fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
