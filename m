Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110E261B9E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602907; cv=none; b=o5jjzR2WPpUrSH3mpk+cMiadNptcBpBIdmg43KuNCmDSFP5W9Ag97FdY5MAwBVlDS4JCacfyR39n0NVu8jKPyPUkZ/kNf1tSmt2lRJt93xVWib5+f36PmEyqcgjsy6YlpxZNanEdTAdWoReruPuZMlwvljLCmiRdnKSQsL9qC6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602907; c=relaxed/simple;
	bh=kxHs/fi/spj4z7RXMIsqSTpgi1AKBRAozmoZVIQW0zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDy+i2iOn+Ycn0bhl+lU+8qahBfYek8CZBLrHtXUhEumNpdo/Et7XiJrR5MNMYx8vtDkDkmN9CQxM0RnqWat3T7jdBvscRkR7Ks4ycnCeUpctn5ZYjdsIqlef6eRc+EN7QSLr8wi5nGS1cSgKFNmWq1xpGvx1Gx5/QS1Rz4Gpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXu46jvq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXiHL7gH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXu46jvq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXiHL7gH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNTr21575699
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p3J+vb/d0VohjnsZg3ji4uSx
	pD8yDGTVB5E6yxUIvBo=; b=OXu46jvq4wPbLsTFXLhHI7kJAmJSfGxJAh+3/6yz
	ctSRQyiWNT0b8/uZ70rQ3YNBUCAX9soeEdCcUnJhzjPkhV5xxpR2jCYHcqXNoqnH
	Dok5BEdKtsQoxqFNTygCw9+TmA9u6/7JYU/9rS4SgO4Y7sW2DS7PXx83OU5mS4PJ
	xIZ5cOj0PgXW6jcmH+dzUWfUbAu6c5KVvrP5QkghbW+kuLOk8fvg8ksV7TnLT9dI
	f9TanEAm9z9PE7qRsyPL/spVajFm9LYKnDWtN5wTrzeOLrzRlXVmFhw7Cccgd9SN
	MR2N8PXmyQLr6Yi44ee3+x3Gce+V0FjqQX0X/mUs4UZKkw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcc1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:15:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7377e2f1a62so543151137.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602903; x=1784207703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3J+vb/d0VohjnsZg3ji4uSxpD8yDGTVB5E6yxUIvBo=;
        b=GXiHL7gHW8idZ6/WT9rajMjNdjy31ivaHTeMAb1BzlK5hpIt5c/+SjekrYpPMKh/xD
         r/Zt/lh2U+CLZr6otCQsxnQUVnRbyUM6nq/QnFIAFZZ/v/QPk7bDWLkkVIKD0qKXn6WM
         44WmtT7mVjtXgEMuS2hT2qWryicX7jAgPMqhgOkb7LvDwNfaXZznXv7CLb0ulSRIrB0j
         RsVA+6H2ObKgVKG3gm+SUIDhAJrBWSkbOIiiCoV8/0xnKSq2MYc+ViDYZnTHjWKiIZT9
         J0ehuukrddBFx/oc9hu83U9lgiiiu2BKzh0agShPlJVXkQfxdpdpwxS8nBQdMhCItkXs
         +kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602903; x=1784207703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3J+vb/d0VohjnsZg3ji4uSxpD8yDGTVB5E6yxUIvBo=;
        b=hu+/i3+uRQWJ9bJhJZaYSDRmjKz8PCe5NvgxnSUJzOKTHzo80j0wkIu6qO27JawI7t
         CKC35rDJ4rIyPECv7XakINKxMZR+qIz5imsXFoIFifTUWMws8+cSFdC3EIm6ttZzQbrX
         lmV47cIx0ytx3fmQII7EAWQJCEKwj2FvoloyZFvc1kflerDQjvqSYbIg64aQzp/4u5NS
         7FQ5FBd8P4Povtfmzvax1ULcNtz/SpjX19odRfFTia3S/5v1AKUBJhHrxEy8rywsHg1S
         rebWtb0A30oluohui+CFCeduLa8nBodcMVXK53g/PTKrKu3UbbVgVkdHqvY8KnNw2QiC
         qqsg==
X-Forwarded-Encrypted: i=1; AHgh+RoKtaUY8nSH6YqXyFHarb9cyGyB+W6VUtC4Ga9YTeh3VbR98T8yFkO9s17+I0AvyLfw3zYF2BwjOpKM@vger.kernel.org
X-Gm-Message-State: AOJu0YwLFfmZG8vsTzIVmmPs4BfAZI/nVKtXepeM1wmApzAQwVeciakZ
	GR+IaDdAkKQMrfU7DwjE/h/cYcarscJwApxHNcpJN6uym1TzTvPpDKUXJncrR3wyckBGYRtyC6R
	F2ZPGsxmGjC0+qrZZKu6YKrcVcqdpxEslsGPyj51iNeWLRCOxcWtdA5szEDFFWjQV
X-Gm-Gg: AfdE7cmc4V66DyTEXYxx8hDmEzIMx/q/7hB+DjLMqNPjDXO+t0jLdV8Ukt16XKzwMxs
	UjBtG9qFrJdN7N9QXuqHiRIG4ZE3Ch8slsknrWU1XMUWjNKaOhD56Vxjuf0w9cVM33oUKugODZ5
	1allaXv4KPtHWQFFBLFeJo2lag7VXLG+h3dxEBGzFzk3uNOuEYvocz+7vQ+ulp9xt20+rq9gztj
	zTtDh9JN+CZE6A3J60JTvB0rwM9UVPTZsFHgUe/+6z8Mv2lMyAfR+fgBlddXOZcrE+BA8YAKjxL
	jzR2ciwNBEOMLuDa+L1XKdX5V/5qhxp8uh1LeEM/Ydi2g3MNwwpnFXLD92FwYP75svnLpX4LwMN
	K3KrDIqfNd0OwTr3QEgcoJQlCO/V5Ey89RH0dj/FMoawYclMylHYRvTIe2CFqbXn++Kc1CzySYL
	0NmEho5rgRVFmXJYFZq3rF+ieu
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr4015013137.17.1783602903383;
        Thu, 09 Jul 2026 06:15:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr4014993137.17.1783602902810;
        Thu, 09 Jul 2026 06:15:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbd1sm5179015e87.44.2026.07.09.06.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:15:00 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:14:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
Message-ID: <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX5gbc75HTNgJy
 qk3Mx5C41Fkg8CPibzhCUzD1V24JCHra4F2UKjY6pu0W8eAucFLulsXMCANRdNLlE3BNCouGml+
 narsaO92+ziKzZTofBtLJu19PtdCZc5IbnwBteemOAqxS079sHY0JOJwST+4pSQ0/rouD+jUmbk
 GT00cPUs/zhxIRP2D65A2Gi8tF9D5Aq2lymCVf4KMnBfdxTFnZMDiMf6tHv9f8vwci+l+VAFNGX
 Ny1t4yLHmJZKnG8rSB+ICaKQjnvUq1M1CHg5LINva5fjr9VJjEtYg2b/8dZvp4tmMF7jEy34h+I
 rAeEI1RSiZZcSjo9zpoIcDiIYioWRNS1+TSK/A1Yug1F+jEaUevSZ+qhdzRbTlG7+Pce+pRDUKQ
 BsLfCLTf2eGbE2GGKB00RueSDo7GRg5W2MI4Mtw75QC2uetEY3MSuFGURTyqY1k22kmSTRlLbFW
 qyHLSg5os+Su54AVWOg==
X-Proofpoint-GUID: QlEBrmze7HjDFcatr7NIto6SUPD0lclW
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f9ed8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=tcVzVmk79huRiCZlmVQA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: QlEBrmze7HjDFcatr7NIto6SUPD0lclW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX6fkCjUEZL5F8
 kQ2Fyliji51FzpgEBZzLSrtTInBn8pvih5FkD4w4D22Ql95OvLS/EAkKH1Ngmu7f+RNPT+jsRg6
 wN3RQvhkXA/0oIEUwXpk+MIY5XbUmzQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128

On Thu, Jul 09, 2026 at 06:05:52PM +0530, Vikash Garodia wrote:
> Iris platforms use separate context-bank devices for the pixel and
> non-pixel domains. Add platform hooks to create and destroy those
> subdevices, and wire them up for the affected platforms.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>  .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
>  4 files changed, 80 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..fd6bfe7e786be3f8a4885296fb11ba430ded6fd1 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_gen2_packet.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
> +             iris_platform_sm8550.o \

No, it's not a separate platform.

>               iris_platform_vpu2.o \
>               iris_platform_vpu3x.o \
>               iris_power.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..bea904a9249bafe1dfa11ff39155d1930402bf7c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_platform_common.h"
> +#include "iris_platform_sm8550.h"
> +
> +const char * const sm8550_clk_reset_table[] = { "bus" };
> +
> +const struct platform_clk_data sm8550_clk_table[] = {
> +	{IRIS_AXI_CLK,  "iface"        },
> +	{IRIS_CTRL_CLK, "core"         },
> +	{IRIS_HW_CLK,   "vcodec0_core" },
> +};
> +
> +struct platform_inst_caps platform_inst_cap_sm8550 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 8192,
> +	.min_frame_height = 96,
> +	.max_frame_height = 8192,
> +	.max_mbpf = (8192 * 4352) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 489583,
> +	.mb_cycles_fw_vpp = 66234,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
> +};
> +
> +static int sm8550_init_cb_devs(struct iris_core *core)
> +{
> +	struct device *dev;
> +
> +	dev = iris_create_cb_dev(core, "non-pixel");
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	core->np_dev = dev;
> +
> +	dev = iris_create_cb_dev(core, "pixel");
> +	if (IS_ERR(dev))
> +		goto unreg_np_dev;
> +
> +	core->p_dev = dev;
> +
> +	return 0;
> +
> +unreg_np_dev:
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +	core->np_dev = NULL;
> +
> +	return PTR_ERR(dev);
> +}
> +
> +static void sm8550_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->p_dev)
> +		platform_device_unregister(to_platform_device(core->p_dev));
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +
> +	core->p_dev = NULL;
> +	core->np_dev = NULL;
> +}
> +
> +const struct iris_context_bank_ops sm8550_cb_ops = {

For a long time I have been asking to fix name prefixes. Now you are
adding one more. No. Please write it as a rule of thumb. All new symbols
in the iris driver should start with iris_.

Moreover, there is nothing sm8550-specific in these hooks. Enable them
for all VPU3.x platforms uniformly.

> +	.init = sm8550_init_cb_devs,
> +	.deinit = sm8550_deinit_cb_devs,
> +};

-- 
With best wishes
Dmitry
