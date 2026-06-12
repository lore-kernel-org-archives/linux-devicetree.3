Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DF27A107
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258909; cv=none; b=aS1ck1fWtRqcd9lToVcciLGAytoXBQ+5M1XaW0Q+FzGCo2JPIW9QpYFW5g7IIDKbAGo/Qj6iLh0QPHxmVAmr91paOuteWe7fFEsxuLjh1iPLgzv2OA0ARaRbLKXfC4N0ktp6yY89M8hzbuI+vrlatkgLA3x+0EoqhESnQ1Yez/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258909; c=relaxed/simple;
	bh=6LRgUqShnniKserhwlLRs5VjBDhjJMUEI2k/adynf2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=De63Q2WZ7luAr/P6czp4l53ER7ncgeFXOP3hG5SPWjBonpYC23k59uH6Lx09I/aJItlvzdcjBhIImJUCoZLeMNdeO1zFqZ6mc25Ns0lsqwsKLNd/0hVuJXEL2hD2Uif59lwD0itE63TD+w3PQftUY2f7YPqJNtyBHmf3Fs2XSD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fkz4u0+s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fkz4u0+s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85131F00A3A;
	Fri, 12 Jun 2026 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781258907;
	bh=9EshPrP6w8kev+jqqCppODA8BhEQ4yz+ADGvkhEblDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fkz4u0+scTaSTSZNaTVjR189hbCRLaB/x3Y2wHOH0dUOoWY66EdjHnD3VQr9HbGIh
	 MeKarHuoiEzDFvca/bOACDxNeoHx9FUrrfirHMwUTgY/b9QiJJcShpD42fVs20dhXs
	 R9ZnDgx1/Rmvq/0ynaaxa2uxR+hznGVrgWtTG02f+hXHHjXqycabG6YL/GAgo9EwVh
	 ASMAk+Vm/wzqa0znM8fW/pNtX7AxtlAVYy2tH51n7ztbrXeesWTZopsf7n3u+5kv4t
	 3nhZsnzZyCMjyXKPhHNgSV0E669Pmk6wOoDfO9X4dQomWi71lz1MGHFXixRNdXeJCO
	 8b95ycUILIztA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/16] media: iris: update buffer requirements based
 on received info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-iris-ar50lt-v4-11-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-11-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 10:08:26 +0000
Message-Id: <20260612100826.D85131F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The driver incorrectly assigns `req->hold_count` and `req->count_a=
ctual` from `struct hfi_buffer_requirements` instead of `req->count_min` to=
 instance buffer counts, leading to insufficient buffer allocations.

Pre-existing issues:
- [High] Preexisting Use-After-Free (UAF) race condition due to missing ref=
erence counting in `iris_get_instance`.
- [High] Preexisting Use-After-Free (UAF) of `inst->m2m_ctx` during session=
 teardown in `iris_close()`.
--

commit 07ef5efeab4196fd6eaca945bfba49a95c55f702
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: update buffer requirements based on received info

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/=
drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 23fc7194b1e3a..ee996eb1f41fa 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c

[ ... ]

> +static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *=
inst,
> +						      void *data, size_t size)
> +{
> +	struct hfi_buffer_requirements *req;
> +
> +	if (!size || size % sizeof(*req))
> +		return;
> +
> +	for (req =3D data; size; size -=3D sizeof(*req), req++) {
> +		enum iris_buffer_type type =3D iris_hfi_gen1_buf_type(inst, req->type);
> +
> +		if (type =3D=3D -EINVAL)
> +			continue;
> +
> +		inst->buffers[type].min_count =3D req->hold_count;

[Severity: High]
Is this assignment correct? The existing firmware semantics appear to expect
req->count_min to represent the minimum required buffers for forward progre=
ss.

Will assigning req->hold_count (which is typically lower) cause the driver =
to
under-allocate buffers for V4L2, leading to firmware stalls?

> +		inst->buffers[type].size =3D req->size;
> +
> +		if (type =3D=3D BUF_OUTPUT)
> +			inst->fw_min_count =3D req->count_actual;

[Severity: High]
Similarly, should this be assigned to req->count_min instead of
req->count_actual to maintain consistent minimum buffer count derivations?

> +	}
> +}

[ ... ]

> @@ -657,7 +729,7 @@ static void iris_hfi_gen1_handle_response(struct iris=
_core *core, void *response
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_EMPTY_BUFFER) {
>  			iris_hfi_gen1_session_etb_done(inst, hdr);
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_FILL_BUFFER) {
>  			iris_hfi_gen1_session_ftb_done(inst, hdr);

[Severity: High]
This isn't a bug introduced by this patch, but can this lead to a
use-after-free regression?

During session teardown, iris_close() releases the M2M context before
shutting down the firmware session:

iris_vidc.c:iris_close() {
    ...
    v4l2_m2m_ctx_release(inst->m2m_ctx);
    ...
}

If an HFI_MSG_SESSION_FILL_BUFFER event arrives before the session is fully
closed, the threaded IRQ handler calls iris_hfi_gen1_session_ftb_done() whi=
ch
subsequently accesses the freed context in v4l2_m2m_for_each_dst_buf_safe().

Is there a way to defer freeing the M2M context until the session is safely
stopped?

>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_PROPERTY_INFO) {
> -			complete(&inst->completion);
> +			iris_hfi_gen1_session_property_info(inst, hdr);

[Severity: High]
This is a pre-existing issue, but is it safe for
iris_hfi_gen1_handle_response() to use the inst pointer here without a
reference count?

When iris_get_instance() looks up the instance, it returns the pointer with=
out
taking a reference. If a userspace thread executing iris_close() frees the
instance:

iris_vidc.c:iris_close() {
    ...
    kfree(inst);
}

Could the threaded IRQ handler concurrently attempt to lock the destroyed
inst->lock or dereference inst while handling responses, resulting in a
use-after-free?

>  		} else {
>  			struct hfi_msg_session_hdr_pkt *shdr;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-iris-ar50l=
t-v4-0-0abfb74d5b3c@oss.qualcomm.com?part=3D11
