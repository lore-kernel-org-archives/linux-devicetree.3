Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722123;
	b=KCtCyvB0FaZusvJF796Q0Aq3E0bZVmP5poyEPQmExg9HtABxTSTsWkbQI2z8wcLStZpO
	 ybVpYwJHGo6nLOva72kbZzCtxJWg4kh5iTZl2H3GKGusc1iznOo32qxKoJevFY/uI5TkB
	 2pxsB/HiUOu8NQbRnakxJ1qd8EQPmSwroCLCdsZbl69x3ZygmUmshSw3Z2LJ1EVMB/oeh
	 jSxiBpIn6h9Gfl1Um/HwoYZ5Q549Z8z6fD0XlvFeEZ5RQV3tWpXONvg/3D36KIu5MO6Au
	 uNHLyKiY76wHSN9EedTWJrsenFOB21qgKvUA4Hz4wvIU0s6Vvpt54LZtsu/E4aTHUjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722123;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jpu4qmlguZRpt99PXPmaB3eT3kVW5QvuvdAO0yNbmXE=;
	b=JKccrdToSjO94vcpQTsV6kgmEEtetnmQqjtnItyYw9cudcNkFCFNujyBoaPv+Svjeh4X
	 aT77A4+j7N2LegqBlp9YlHk1T7ZWruUXnRE97mGiwOmlSDnP/uyB+pREbDUys4syi+gi9
	 gXFRg764v6kyqH/Iv9L6KWox2NZaehNTV9cLa7ba0aMF50VE9AwJXJPH+SZxqkt5FlDwZ
	 IKP+jfIGbF9YPLvMUk7ujr4PxDrsGwJr8nJ3uiZ9sqgsQR5ULIhrhbCDiJDHoz/Qar5su
	 EXFeBKcMkSEr2bsAPOYicf8nOmXlPYF/53z6fexSziIdCtqeYIyraEg990HFxcRNGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxzPBrm5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045C4606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxzPBrm5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9337D1F000C1;
	Tue,  3 Nov 2026 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722122;
	bh=jpu4qmlguZRpt99PXPmaB3eT3kVW5QvuvdAO0yNbmXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LxzPBrm5DCyaYjl4kcEizTUBpDOnXebl35+3pcT6w9j4ym3rS50E6A7lz7sGk5YYx
	 gndsxxGj9WBIEJtg1GQmDiiPYCaTadXzUIMD5JSjSnc7X8WeFDF7iGMuAT5F4aH+EK
	 BqNppmM4gGflyXJgBBnVxX8NHwsOdz7ScCm3Gx0uKfI1KrczY3FOSDca44LkUq9/80
	 PRWmaBIM8JJPc0FsG9573MMH0QnYLK2mjmwmxgsvgcrvvrM7jtoXrIV179H6zXtD+G
	 aAbf9OpPIDY4LUzPy5nVcjfzL78Su8PdkMAiUR+6wPPDnkORqpWsypTlXhiTxvY1MZ
	 xRm8ZlUSsDg/Q==
Message-ID: <sashiko-outbox-195700@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/12] media: iris: Route buffers to the matching
 context bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-5-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
 <20261103-vpu_iommu_iova_handling-v6-5-e4b6ad864f8f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:08:42 +0000
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
- [Medium] media: iris: BUF_SCRATCH_1 routed to pixel device in iris_get_cb=
_dev()
--

commit fb84105c9d23a8b5f8ddb71200e875eab85392ac
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Route buffers to the matching context bank device

This commit introduces iris_get_cb_dev() to route VPU buffers to either the
pixel or non-pixel SMMU context bank device based on buffer type and codec
domain, falling back to core->dev when context bank devices are absent. It
updates internal buffer allocation, HFI queue initialization, and V4L2 M2M
queue setup to use the corresponding context bank device.

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 883ef7e752915..9dbf209e3d4c0 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c

[ ... ]

> @@ -140,3 +141,43 @@ int iris_disable_unprepare_clock(struct iris_core *c=
ore, enum platform_clk_type
> =20
>  	return 0;
>  }
> +
> +struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_=
type buffer_type)
> +{
> +	struct iris_core *core =3D inst->core;
> +	struct device *dev =3D NULL;
> +
> +	switch (buffer_type) {
> +	case BUF_INPUT:
> +		if (inst->domain =3D=3D DECODER)
> +			dev =3D core->np_dev;
> +		else
> +			dev =3D core->p_dev;
> +		break;
> +	case BUF_OUTPUT:
> +		if (inst->domain =3D=3D DECODER)
> +			dev =3D core->p_dev;
> +		else
> +			dev =3D core->np_dev;
> +		break;
> +	case BUF_DPB:
> +	case BUF_PARTIAL:
> +	case BUF_SCRATCH_1:
> +	case BUF_SCRATCH_2:
> +	case BUF_VPSS:
> +		dev =3D core->p_dev;
> +		break;

[Severity: Medium]
Should BUF_SCRATCH_1 be routed to core->np_dev instead of core->p_dev in
iris_get_cb_dev()?

In drivers/media/platform/qcom/iris/iris_vpu_buffer.c, BUF_SCRATCH_1 is
defined as the combined internal buffer holding the COMV, NON_COMV, and LINE
buffers for HFI Gen1 platforms:

static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
{
	return iris_vpu_dec_comv_size(inst) +
		iris_vpu_dec_non_comv_size(inst) +
		iris_vpu_dec_line_size(inst);
}

Similarly, iris_vpu_ar50lt_dec_scratch1_size() and hfi_buffer_scratch1_enc()
combine the COMV, NON_COMV, and LINE buffers into BUF_SCRATCH_1, whereas
BUF_SCRATCH_2 holds the reconstructed reference frames.

When iris_create_internal_buffer() and iris_destroy_internal_buffer() call
iris_get_cb_dev() for HFI Gen1 internal buffer tables (such as
sm8250_dec_ip_int_buf_tbl, sm8250_enc_ip_int_buf_tbl, and
iris_hfi_gen1_ar50lt_dec_ip_int_buf_tbl in
drivers/media/platform/qcom/iris/iris_hfi_gen1.c), routing BUF_SCRATCH_1 to
core->p_dev maps it into the pixel context bank rather than the non-pixel
context bank used by BUF_COMV, BUF_NON_COMV, and BUF_LINE. Can this cause
SMMU faults on HFI Gen1 platforms when context bank devices are present?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-vpu_iommu_=
iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com?part=3D5
