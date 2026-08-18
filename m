Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBA2367F4D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069034; cv=none; b=gT/Kj+UT0fZ87S79RzHGgkQYZTXV7SkmEZEjgpJLL7Z9J+86tjWxD4j37YUE95asFAiUR53Lnt4ShFoIGFQ2D4SQt+LMI7l5WSQ+uAzSGfI1kRhlYpM45mZGisdysZVkBDQi/oUJVq7APifU6EQlr1IkEuq8UyNCWXxj3xY5V2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069034; c=relaxed/simple;
	bh=Dzhij+6s/xq8YAgO5gfpiZLC5KBqOf7Y0b0EnY8pRVs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o2Z10ySiu7tFH4PnwaQW3M7q2/1fho4fMhhGqios+M9T9YBHH82GQrNVckYRvl8S6xqEW9l1CQC2CFdq+kg5vqEhrTvd7iFauuQi2O+L1WzK41k6twRKqn0qBcdAFJFPddz2MX7kyHrnc06kj2TigYdbItaH3jqud9U+nRTGvxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnImaGV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnImaGV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8F51F000E9;
	Tue, 18 Aug 2026 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787069031;
	bh=PC8gHIurv2f2rWToql6BMCcR+/Q+n+N1AvjJC5Z2LZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NnImaGV8fyLNy2AgLrYumqC7DbGlJBEspMMzwNmJ+vu9c3ySCiaf77ny5zPMJMJNR
	 SZbZE4f7rksq0abIXZj9mPMNdi2oZx+6d0zL8GWgM2egi8qqV+q7EiUcmVbfCM4H+H
	 8x9EtqUB8BouXmY5K8SIsC7RKsPq+8onMtxHBbFi3CtKOZOD1mhAwgxwMUn2IAXH1j
	 gR/LENAVPmsvwMHmXWt7/ShYXtLcr7wqJQML0nCm1BR6135rLJZfdt0sbd/SmpE99o
	 aMa48E4iTAV6jetErEJzvneafH+CEsWJ3IgkUabHGYVGmBDq8PNEHJAv4BQLi56XEz
	 pwlqO4WgGgjEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 16:03:50 +0000
Message-Id: <20260818160351.4E8F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Calling `dma_sync_single_*` on an IOVA managed by videobuf2-dm=
a-contig violates the DMA API and can cause severe memory corruption for no=
n-contiguous DMA-BUF imports.
- [High] The DMA synchronization logic for output buffers is fundamentally =
broken: it synchronizes the CPU cache before the hardware writes, uses the =
wrong API direction, specifies a zero size, and omits the necessary sync up=
on completion.
--

--- Patch [1]: [PATCH v2 1/5] media: iris: Add dma sync calls for input and=
 output buffers ---
commit ee7c5670aeeb217b4b298594d79282fac01b4135
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add dma sync calls for input and output buffers

This commit adds DMA synchronization calls in iris_queue_buffer() to fix
data corruption and hardware faults. It uses dma_sync_single_for_device for
input buffers and dma_sync_single_for_cpu for output buffers.

> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/med=
ia/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177f..c7a664426187d 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -585,6 +585,13 @@ int iris_queue_buffer(struct iris_inst *inst, struct=
 iris_buffer *buf)
>  	const struct iris_hfi_session_ops *hfi_ops =3D inst->hfi_session_ops;
>  	int ret;
> =20
> +	if (buf->type =3D=3D BUF_INPUT)
> +		dma_sync_single_for_device(inst->core->dev, buf->device_addr,
> +					   buf->data_size, DMA_TO_DEVICE);

[Severity: Critical]
Does this violate the DMA API by passing a videobuf2-managed IOVA to
dma_sync_single_for_device()?

For imported scatter-gather DMA-BUFs, the IOVA might be contiguous but back=
ed
by physically discontiguous pages. Calling a single-mapped sync on the IOVA=
=20
translates the start IOVA to a single physical address and performs cache=20
maintenance on a linear physical address range. Can this corrupt arbitrary=
=20
physical memory while leaving the actual backing pages unsynchronized?

> +	else if (buf->type =3D=3D BUF_OUTPUT)
> +		dma_sync_single_for_cpu(inst->core->dev, buf->device_addr,
> +					buf->data_size, DMA_FROM_DEVICE);
> +

[Severity: High]
Is the synchronization direction correct for a queued capture buffer?

This calls dma_sync_single_for_cpu() before the hardware writes to the=20
buffer, claiming CPU ownership instead of giving it to the device with=20
dma_sync_single_for_device(..., DMA_FROM_DEVICE).=20

Additionally, buf->data_size for a queued empty capture buffer is typically
zero. Does this result in syncing zero bytes?

Finally, is there a missing dma_sync_single_for_cpu() in the completion path
(such as iris_vb2_buffer_done()) after the hardware finishes writing and=20
buf->data_size is populated? Without it, the CPU might read speculative or=
=20
stale data.

>  	ret =3D hfi_ops->session_queue_buf(inst, buf);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-iris-fixes=
-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com?part=3D1
