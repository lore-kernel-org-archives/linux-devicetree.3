Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769211;
	b=uNoY5oX5Ard2Q3rm7jb4hD26QSDniuKX8qKilsMxErJwVgiS9QOxeqoGFz9iMYGtcRUE
	 PHOqHkBX0NBtBQF7PxFOyuLZ9unKA1yQSRzv/aNri0XB7Cfj+9ClJ9hlTLPO0rDHBxwAC
	 hMHc19UxiM0go01zM15mYSTxzFaq0Q8K+xI4J9nPKqrMeVIc10cHXO1HfbOWyNrWYp4GY
	 jfMWCHNG+Cvmj7sJsHmYj+x0q5EWTnAyXpSlLfexNJfsAfmEfurJ1e2LGnlVcZpmYx+Co
	 kp2zqOdP3LUNCOFT7PfP56xBGc9hwTXY1fdW9e6Q/ATAxa8Zz4ERFbGOn65HTKUp9jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769211;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=elQp4eJjgV7CDBDpIJwmmrdpKNOO8F+o3POaFwYjmFA=;
	b=WFc9z/0hU/4QgS7horqux01PCkdZl40txrYnfl4ZOvMsidy9KquET7oACi+I7yhl0s4v
	 95rjjQlmiBTe+/nBmTUJXEx1Y0BbEGKDfoxhouNArNdzgtuK5cJldvlaKjHrf0mgZM6c7
	 jG1zuh1oJyIkcvu1HVl2VP5b8X6NX7NUXt2wjW7gHXj8p2nlSAKUGaGEV1xnbIDFtmWin
	 4PlcXO0nafRISFOI6yhOp1vsd/ti5bN6B8deBD7oonC3rQJReT+6TotunweueTl7XbXST
	 QH9+YmFHcvAXbpjuhgDcuxiB4svmlTfOOkB3W/yS/KLNLPIhL1/AUYNtwGRyEh1GQ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuQ2JfJg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8DD606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuQ2JfJg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B59F1F01825;
	Fri, 23 Oct 2026 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792769210;
	bh=elQp4eJjgV7CDBDpIJwmmrdpKNOO8F+o3POaFwYjmFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QuQ2JfJgDNhmbYNVuvr2//e7l4mMbVtANnUFAhbRdajNSFEvCEEZTVjnAYCVr2snJ
	 kYObE3/aXS3CLJTHv7FrrHaURzTrjOWwWtxWsxqkZ+VEdYOwfCJcnZ9IJivkgvnQHa
	 Tr6eRMVhMwLS+lpVPCENAN/oVYM5A1WJxphOfvoQJY1Hu2m1ei/mfk34yalt8Qa3jp
	 Fii6jFwUsHqy1JqWCkI6YS+RPfgnGKgSrTX/aspQo/ymxzd0y0BwSAIzWZCYFKpKkL
	 sCiEu6pCcfbBO9GPfUWhZR9/VpBLr2ILT7kGgbyo0fX6XbzsmBivl1m1lqiWCwLUGY
	 B09Cu0oLSrgcg==
Message-ID: <sashiko-outbox-182905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/9] media: uapi: Add CAMSS ISP configuration
 definition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261023-camss-isp-ope-v11-4-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
 <20261023-camss-isp-ope-v11-4-0c2937195298@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 15:26:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: uapi: 1-based camss_params_block_type breaks v4l2-isp valid=
ation
--

commit 5063b494328e812916323b381b136d2e5d3ac987
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: uapi: Add CAMSS ISP configuration definition

This commit adds the UAPI header qcom-camss-config.h defining the ISP
parameter structures and shared block type identifiers for the CAMSS
Offline Processing Engine (OPE) driver.

> diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/=
qcom-camss-config.h
> new file mode 100644
> index 0000000000000..5756d165e7e87
> --- /dev/null
> +++ b/include/uapi/linux/qcom-camss-config.h
> @@ -0,0 +1,212 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Qualcomm CAMSS ISP Driver - Userspace API
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> +#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> +
> +#include <linux/types.h>
> +#include <linux/media/v4l2-isp.h>
> +
> +/**
> + * enum camss_params_block_type - CAMSS ISP parameter block identifiers
> + *
> + * Each value identifies one ISP processing block.  The value is placed =
in
> + * the @type field of &struct v4l2_isp_block_header.
> + *
> + * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
> + *	&struct camss_params_wb_gain
> + * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> + *	(CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
> + * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
> + *	&struct camss_params_color_correct
> + * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
> + *	&struct camss_params_gamma
> + */
> +enum camss_params_block_type {
> +	CAMSS_PARAMS_WB_GAIN =3D 1,
> +	CAMSS_PARAMS_CHROMA_ENHAN =3D 2,
> +	CAMSS_PARAMS_COLOR_CORRECT =3D 3,
> +	CAMSS_PARAMS_GAMMA =3D 4,
> +};

[Severity: High]
Starting enum camss_params_block_type at 1 (and sharing the enum across
ISPs that may only populate a subset of blocks in their
v4l2_isp_params_block_type_info array) leaves index 0 and any unsupported
block indices zero-initialized with info->size =3D=3D 0.

In drivers/media/v4l2-core/v4l2-isp.c:v4l2_isp_params_validate_buffer():

		info =3D &type_info[block->type];
		if (block->size !=3D info->size &&
		    (!(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) ||
		    block->size !=3D sizeof(*block))) {
			dev_dbg(dev,
				"Invalid block size %u (expected %zu) at offset %zu\n",
				block->size, info->size, block_offset);
			return -EINVAL;
		}

		if (info->block_validate && info->block_validate(dev, block))
			return -EINVAL;

		block_offset +=3D block->size;
		buffer_size -=3D block->size;

If userspace queues a parameter buffer with data_size >=3D
sizeof(struct v4l2_isp_block_header) containing a zeroed block header
(type =3D 0, flags =3D 0, size =3D 0), block->type passes the bounds check =
and
block->size !=3D info->size evaluates 0 !=3D 0 (false). Because block->size=
 is
0, block_offset and buffer_size never advance in the validation loop,
causing an infinite loop in the kernel.

Additionally, if userspace submits block->type =3D 0 with
V4L2_ISP_PARAMS_FL_BLOCK_DISABLE and block->size =3D=3D sizeof(*block),
v4l2_isp_params_validate_buffer() accepts the unpopulated block type 0 as
valid.

Should enum camss_params_block_type start at 0 like other V4L2 ISP block
type enums, or should v4l2_isp_params_validate_buffer() also reject
entries where info->size =3D=3D 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-camss-isp-=
ope-v11-0-0c2937195298@oss.qualcomm.com?part=3D4
