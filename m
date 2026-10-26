Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009264;
	b=CFZYjj1c6RtxjxM7VChDedg236Be47zpzxNL8c8xZ742xUvilwUBjx0/oa9iudY1uxbW
	 6zm2dkHIuRGIGIfZxZ7QPMaTqtklkmyEH5y5jLrdKff0XRzFIzWCNFVttkGI03YqozwJy
	 n2H7e7RpBMUnmGYtzph5c7mgQngHbL5Hh240D2GDfcbEsuWw0ipSg55s43hOW9Z7SJ+bH
	 moISHZrwWtE7IwKgGY2jwV0DsJR7ybIzicmpx+9MMULuKdCuoiaKww9p5U60t8FXaxBy0
	 jZBqpMFpjOKMp5nRZJ8QyEVM0134EJbLYoq8Jwhk8HsP64Supey/NCW5itFfGcO7rGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GnGg3CwhR38uGbReDQYTDKY/Dc4Njz+sxG9mC0bWH/s=;
	b=zXLuRKjN5Wc8PnZ1FpXeUqhBUFAo0gmoi1JIRkEXUCNdYmovPGxqdeC9QPPXYlvoN3BI
	 7SJJTtRPWL//TQLmW9+lcH+6vXEEQ3FxDB227yX6/jZCg5/4cOh8Cjcwm7Z1ddgpS6BYG
	 JpVS/h3jKObW7uXOqpRCOt5TxNHpf+hnY1R4iWc98bf7X9hwHfUExtO1yjSCPJXmRL/8a
	 skGOEomb5zztMfpLM9wCXeOR10FLI1a0OQnfwE10/byfWQajgZjzTl/+jQvvubT2F12hi
	 l90ZNgGtf9FXY+itz/myGYGKAKOQHwitf0lPSdTqNJIAl2i6k+S+0/3fBpl1NfqnxzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RermaiNu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mvs0brTc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D4E606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RermaiNu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mvs0brTc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPv02222515
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GnGg3CwhR38uGbReDQYTDKY/
	Dc4Njz+sxG9mC0bWH/s=; b=RermaiNumI6rQUJ4BUBComPJBEVniwoJh0VMlc6L
	zi8lY4wo4UkHn1tu94EH1c2wE/7KGgmysAno4bo/lleCg63U8CmjHFLWK9QouH1O
	YqwLJQKjvKHHKyn/QDBQvxD5RMNH0RRPk6f+b541i3J5cDRx23yunhFNdcOJHUUl
	BhjjLC2wqsPkZ9lXYJ1SeV8LnyOWq1ZuuK7KZxf7xu6Qbq0HPN6yrB5I3LHs44Qs
	WSwK9lOVPsbzYhLFRb50iRgeRrew+XmBUFPw5vrkxUpcwTSJD5B5l5qNHtlXx13d
	GE4mUhKllt4PYqyf5veLfeemSRlQ7vWnM9rW8wlISiPNfA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9kyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:07:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990835cec5aso2122567241.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009262; x=1793614062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnGg3CwhR38uGbReDQYTDKY/Dc4Njz+sxG9mC0bWH/s=;
        b=Mvs0brTc2Om9zMc0haaxWbSyHQiaJzV5W0cTi5GIjVqDI0jHNEGdtJDd1JTedDvpv9
         2gPzT6QkUeqDW3dcO/nWIE13LHtglL2bwg2uDGmq07hzDh0+uadTRhO81L4Ocd5p3wJm
         Vpl0Bz9CnEUijlzh+8391R0X/7ZS/29j9fwLfBBoEbF6NxvO74qIPYCkSF7d1RahOfU3
         J7ddSWmUCRCjOvOaw1ZI259y/FGAgh55loMC/PY+I89soHZPLKVEyEbhE2op0Kk2gwa3
         IOf30PBt18fyBbaevO2OAVTZycUrNvJwWiCEgWO2taU82PHxgkLYl+z+e6m+OUAfiNxQ
         0Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009262; x=1793614062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnGg3CwhR38uGbReDQYTDKY/Dc4Njz+sxG9mC0bWH/s=;
        b=koxcXZF/U6kNXq7LmwD59erlQ3vxjrNJqFqrv/d9yCSzI9WyrIVt+Zt+FqUr6C2WYZ
         TyBacKlGyun6fJqEQrcFJZmFm1YP8xDZIMvN09LRS1ao/7KRtaxmGGxZ3t2PlP22hNlt
         D28n7A6pVkcvnPNIlBWsFx7YxeTSX+mm3N5mOU5R7l3pDzSb5NP+KE1P7jebpY+bjLPM
         vKyUU96VvWPkOEq7tnwqeVjsK0kOA559g1yA9kCV6dbQWsRvn+6QF2HieOc7/Ex/MMfP
         bVRHoCi927EAY6IaT4n+ZS7peXwkMr/Oc/gZIYsqtmu7A4eVb9PNFjp9S+gOHyqIFpFR
         q6QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUpJhgpJpxFnlMtwZXCZvffO6F1jIdBF2nqVPzOijeWTi+rmCvOdmvvo5slq4uDxgYhZIGUxvT6foN@vger.kernel.org
X-Gm-Message-State: AFq9FYLdKLkx9y1Hst9VUr/ZUuc2OOWXY5JeYafzHitbjk9xis6VD3eE
	LbUFoyUARmGfM8G/aMOCwMw7Ii5xfOlw+vgjM2R0Ddj93WU3TcC7WcX+0CoOIDK5Amis0AOhy8a
	FEdkyw/Ilj8yDGwBfMw44emKdIA9t/7/YdwEE3WpN6UEkyzYPqerFHTIHq3hiQhpk
X-Gm-Gg: AYBFou3nHs1Z8o4B8ZLPBfn7qdZb2bK3WMEyjEc8vs7Gh//TtFbcDkmktHEKTjN67aY
	N5tBb0tyx80efk9JjT/vMCt7htCmRQ34QAIe17yjD0eqdf9wUtwQlLe6PnMhbX80ceb8xipl2TD
	EkuX34T7WEK3FoGUCkNLo3vlvq4wgbxRle3pyjBWqL29qKZE3VUCv+iLdkjqBc5wgI9zm6Dm5I6
	BdlKIFr/s0OSEm7NpIz1JDpxyPrDCBqcuxKh2P6gpx/hTIeS/m/fZCg8JsunCQxsbYOgmGIgX99
	AXlbvsUYJnwd7BQ3no5XkQqnXTwCRjNfQ1/Z9uI7DHzQ05hW7+jS4XdSYm3zblPrNn/Aqbr8hAF
	fMM66irmjz4FsMjb+MknMMPXaD9k7rRokl0b84kYfXw3HBR9yKOkgtCRnB6q7K5ApRdxdSkcI4W
	0T+W/cbTF2qKWj
X-Received: by 2002:a05:6102:2ad2:b0:7cc:148f:c531 with SMTP id ada2fe7eead31-7ce5cd9e89cmr1435455137.26.1793009261582;
        Mon, 26 Oct 2026 03:07:41 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad2:b0:7cc:148f:c531 with SMTP id ada2fe7eead31-7ce5cd9e89cmr1435438137.26.1793009261000;
        Mon, 26 Oct 2026 03:07:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a463f5sm16498211fa.36.2026.10.26.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:07:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:07:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 19/23] drm/msm/dcp: Add Qualcomm VirtIO transport
 wrapper
Message-ID: <ib5ts37i4f7qx4wqoscawrwnpeld3pcnarb4w7y3z4b3kolgkf@5avoy2fyp22l>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-19-7cf014efdee1@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-19-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PxsmJI0J81uR_RnfJNhfcFDf86VOBOI1
X-Proofpoint-GUID: PxsmJI0J81uR_RnfJNhfcFDf86VOBOI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfXwP0WDNo3fJ7/
 maUUqpFJz54AJm4QZLRNwQJ15MS4YEgngDtOhtL5K+QyjSYySoAhuqfrYj2fv2c08B4c6dyftTS
 2jYcLoSVN4CsovkWwFsJZKLqOxXOjLloAn95TTeW6W7jiNfNwb+HA67bLBsK4J2BIKcFkbbnLjM
 KiCG7QPDnKx30QC2C6I63eZsegSr/Bx/j68F7q13e0yE+KXocAcZYWa1SjKz7V14yoTnRNYLz/M
 M8R5sZjGsbaiE5Bi95gegazOzcvHZDtcBhT8EDrg1ORe7eobGSmuUMKDSidmM9h06yJCmKdAg1D
 INuhcvXyaYGGDScGSqnewZf0IguM8zR/n/VrV4Ophqmv3cp5o0p2Jd5DGjwX5Wg1C35Hs/08TQk
 k8uXWvVh/tDyOshiAOi5Uxq+M55FEbnBE+GpoDVA5QNN8PqFFvB8L5O1agBw+VjR5DrB/pyt6d6
 YoN7Ps9vCmAOH1Np78A==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf266e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zJVDlABOU36UOg3UFKQA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX3ma2SrDHJH/d
 FxpdxE8VAtZHtouWZY8sw2dmXx9WiMq6YdPLcRkA1P/4ifF2yEh0KqZdxleoscsfIvTOz/0F0p6
 2PnZtL52tzJUcmWfhNgZNHo5TSo0IV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260040

On Mon, Oct 26, 2026 at 11:51:29AM +0530, Jayant Shekhar wrote:
> Add the Qualcomm-specific VirtIO transport required by DCP firmware.
> 
> The transport sends an IPCC power notification before accessing the
> VirtIO MMIO registers, then registers a VirtIO device directly.
> 
> Implement MMIO configuration access, feature negotiation, virtqueue
> setup, interrupt handling, reset, DMA setup, and suspend/resume
> sequencing in the transport. Keep power-management ordering in the
> transport so VirtIO queues are quiesced before DCP power changes.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                   |   1 +
>  drivers/gpu/drm/msm/dcp/dcp_virtio.h           |  23 +
>  drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c | 643 +++++++++++++++++++++++++

This is a separate VirtIO host driver. Please move it to drivers/virtio
like the rest of the VirtIO hosts. It has nothing to do with the drm
subsystem now.

>  3 files changed, 667 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 9f0a9bfeb2a7..e1a995a8c980 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -85,6 +85,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
>  	dcp/dcp_hfi_plane.o \
>  	dcp/dcp_ipcc.o \
>  	dcp/dcp_encoder.o \
> +	dcp/dcp_virtio_transport.o \
>  	dcp/hfi/hfi_packer.o \
>  	dcp/hfi/hfi_unpacker.o \
>  	dcp/hfi/hfi_utils.o
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.h b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
> new file mode 100644
> index 000000000000..a9c3b9aff61d
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DCP_VIRTIO_H__
> +#define __DCP_VIRTIO_H__
> +
> +#include <linux/device.h>
> +#include <linux/virtio.h>
> +
> +struct dcp_drv;
> +struct dcp_ipcc;
> +
> +struct dcp_ipcc *dcp_virtio_get_ipcc(struct virtio_device *vdev);

What is the use for it? The DCP driver should not communicate to the
IPCC, it's a part of the underlying VirtIO mechanism. If we export DCP
to the VM there will be no IPCC anymore.

> +
> +int dcp_virtio_transport_register(void);
> +void dcp_virtio_transport_unregister(void);
> +
> +int dcp_virtio_register(void);
> +void dcp_virtio_unregister(void);

Unused, remove these two.

> +
> +#endif /* __DCP_VIRTIO_H__ */
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c b/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c
> new file mode 100644
> index 000000000000..02c0e2a9fafe
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c
> @@ -0,0 +1,643 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Qualcomm DCP VirtIO transport.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/highmem.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_config.h>
> +#include <uapi/linux/virtio_mmio.h>
> +#include <linux/virtio_ring.h>
> +
> +#include "dcp_ipcc.h"
> +#include "dcp_virtio.h"
> +
> +#define VIRTIO_MMIO_VRING_ALIGN		PAGE_SIZE
> +
> +#define to_dcp_virtio_transport(_plat_dev) \
> +	container_of(_plat_dev, struct dcp_virtio_transport, vdev)
> +
> +struct dcp_virtio_transport {
> +	struct virtio_device vdev;
> +	struct platform_device *pdev;
> +
> +	void __iomem *base;
> +	unsigned long version;
> +
> +	bool wake_irq_enabled;
> +	struct dcp_ipcc ipcc;
> +};
> +
> +static u64 dcp_virtio_get_features(struct virtio_device *vdev)
> +{
> +	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
> +	u64 features;
> +
> +	writel(1, transport->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
> +	features = readl(transport->base + VIRTIO_MMIO_DEVICE_FEATURES);
> +	features <<= 32;
> +
> +	writel(0, transport->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
> +	features |= readl(transport->base + VIRTIO_MMIO_DEVICE_FEATURES);

Can we turn virtio-mmio into the library code instead of copy-pasting
everything here?

> +
> +	return features;
> +}
> +

[...]

> +
> +	magic = readl(transport->base + VIRTIO_MMIO_MAGIC_VALUE);
> +	if (magic != ('v' | 'i' << 8 | 'r' << 16 | 't' << 24)) {

Is it really a correct magic here? should it be a different magic as you
are not just a virtio-mmio?

> +		dev_warn(&pdev->dev, "Wrong magic value 0x%08lx!\n", magic);
> +		ret = -ENODEV;
> +		goto err_node;
> +	}
> +
> +	transport->version = readl(transport->base + VIRTIO_MMIO_VERSION);
> +	if (transport->version < 1 || transport->version > 3) {

Isn't transport version fixed for the DCP purposes? Why do we need to
determine it again at the runtime?

> +		dev_err(&pdev->dev, "Version %ld not supported!\n",
> +			transport->version);
> +		ret = -ENXIO;
> +		goto err_node;
> +	}
> +
> +	transport->vdev.id.device =
> +		readl(transport->base + VIRTIO_MMIO_DEVICE_ID);
> +	if (!transport->vdev.id.device) {
> +		ret = -ENODEV;
> +		goto err_node;
> +	}
> +	transport->vdev.id.vendor =
> +		readl(transport->base + VIRTIO_MMIO_VENDOR_ID);
> +
> +	if (transport->version == 1) {
> +		writel(PAGE_SIZE,
> +		       transport->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
> +		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> +		if (!ret)
> +			ret = dma_set_coherent_mask(&pdev->dev,
> +						    DMA_BIT_MASK(32 + PAGE_SHIFT));
> +	} else {
> +		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +	}
> +	if (ret)
> +		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		dev_warn(&pdev->dev,
> +			 "Failed to enable 64-bit or 32-bit DMA. Trying to continue, but this might not work.\n");
> +
> +	ret = register_virtio_device(&transport->vdev);
> +	if (ret) {
> +		put_device(&transport->vdev.dev);
> +		dcp_ipcc_deinit(&transport->ipcc);
> +		platform_set_drvdata(pdev, NULL);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_node:
> +err_ipcc:
> +	dcp_ipcc_deinit(&transport->ipcc);
> +err_free:
> +	platform_set_drvdata(pdev, NULL);
> +	return ret;
> +}
> +
> +static void dcp_virtio_transport_remove(struct platform_device *pdev)
> +{
> +	struct dcp_virtio_transport *transport = platform_get_drvdata(pdev);
> +
> +	unregister_virtio_device(&transport->vdev);
> +	platform_set_drvdata(pdev, NULL);
> +	dcp_ipcc_deinit(&transport->ipcc);
> +}
> +
> +static int dcp_virtio_transport_suspend(struct device *dev)
> +{
> +	struct dcp_virtio_transport *transport = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = virtio_device_freeze(&transport->vdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = dcp_ipcc_enable_irq_wake(&transport->ipcc);
> +	if (ret)
> +		goto err_restore;
> +
> +	ret = dcp_ipcc_send_power_notify(&transport->ipcc);
> +	if (ret) {
> +		dcp_ipcc_disable_irq_wake(&transport->ipcc);
> +		goto err_restore;
> +	}
> +
> +	return 0;
> +
> +err_restore:
> +	virtio_device_restore(&transport->vdev);
> +	return ret;
> +}
> +
> +static int dcp_virtio_transport_resume(struct device *dev)
> +{
> +	struct dcp_virtio_transport *transport = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = dcp_ipcc_send_power_notify(&transport->ipcc);
> +	if (ret)
> +		return ret;
> +
> +	dcp_ipcc_disable_irq_wake(&transport->ipcc);
> +	if (transport->version == 1)
> +		writel(PAGE_SIZE,
> +		       transport->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
> +
> +	return virtio_device_restore(&transport->vdev);
> +}
> +
> +static const struct dev_pm_ops dcp_virtio_transport_pm_ops = {
> +	.suspend = dcp_virtio_transport_suspend,
> +	.resume = dcp_virtio_transport_resume,
> +};
> +
> +static const struct of_device_id dcp_virtio_transport_of_match[] = {
> +	{ .compatible = "qcom,dcp-virtio" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dcp_virtio_transport_of_match);
> +
> +static struct platform_driver dcp_virtio_transport_driver = {
> +	.probe = dcp_virtio_transport_probe,
> +	.remove = dcp_virtio_transport_remove,
> +	.driver = {
> +		.name = "qcom-dcp-virtio",
> +		.of_match_table = dcp_virtio_transport_of_match,
> +		.pm = &dcp_virtio_transport_pm_ops,
> +	},
> +};
> +
> +int dcp_virtio_transport_register(void)
> +{
> +	return platform_driver_register(&dcp_virtio_transport_driver);
> +}
> +
> +void dcp_virtio_transport_unregister(void)
> +{
> +	platform_driver_unregister(&dcp_virtio_transport_driver);
> +}

Turn it into a separate driver, use module_platform_driver().

-- 
With best wishes
Dmitry
