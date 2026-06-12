Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECA83630AE
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259942; cv=none; b=ksPkcgnJtJVZ8DzEwXW8qH6BERcSN3F8YeQvhC43GQ7eOxVmsdt5yGAwfImnAm0OulqfLgokq0YBeoBoGpZCjMdsi00rQJGY2jb79MBa5mJ/qjXHrltVP71OXSNR1XlDYEgdKe3sUDS7KQznjDTVBE0wYF7md2k7XIEXfkIELqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259942; c=relaxed/simple;
	bh=85FC6IsjWuimQExtFovXR5Nw80u2LQdOQ4vOZMKJYtk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lcBtW2yzn2KoSc6mbJCp4TfRxv3LIiyB/jhsi1B3RIdXcY9hZAG6XKQS8ZASnv7QM2EOufYo8/O2O5TEVgD6aX8QOVWcLjAX7KtmqGr0jAqas7ggrnVykCoFvFfyNCYs62+pQ30XeAltzudJTy4l7kviVdnzp2VEIEPDlc1uH7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTAUlofp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTAUlofp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8421F000E9;
	Fri, 12 Jun 2026 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781259940;
	bh=Wg/NLzF2e4nTHENR3fme8tQL/0fOLDiitKp0Uhqep50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kTAUlofp7iHRAKCJV2I8REvRgrJv53dCHe0uDwrHQHJJkJ9MJEqb2f9cCHIYSyLPN
	 1N7fTEKlYA3ds7C5k5nIYNAGNh7bwK4URZ5DWlOvpEb3xi0qoSKdXnlo4gUEkrl3HL
	 2ZPBiBhISssmUEs8Zim3uXz7iKuFCUV5fqj/bwlc/7IznUN7v72xjDPNNMzszOtwqU
	 KWD/BweSw8Q6NiqLwz6xUS7FtxVmiXQ5QH+QRLSEeAzb9KrOXTO8+zImcRdHOem3TX
	 KO380iCnxp5qi48/s+2A2WRdhs2YtXPYZ1MnUjQuY5XGXOlBbL8/Q+EG/CPpRH/pyZ
	 FK9CHns2ExZCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/16] media: iris: implement support for the Agatti
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260612-iris-ar50lt-v4-12-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-12-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 10:25:40 +0000
Message-Id: <20260612102540.7C8421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Calling a synchronous HFI command from the ISR response thread cau=
ses a deadlock.
--

commit 960bbe7059755e03232b477bd06562c01b126fdd
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: implement support for the Agatti platform

Port support for the AR50Lt video codec core (present for example on the
Agatti platform) to the Iris driver. Unlike more recent cores this
generation doesn't have the PIPE property (as it always has only one
pipe). Also, unlike newer platforms, buffer sizes are requested from the
firmware instead of being calculated by the driver.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers=
/media/platform/qcom/iris/iris_vpu_buffer.c
> index fb6f1016415e2..4a39b8fef52b0 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -2194,6 +2194,19 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, en=
um iris_buffer_type buffer_typ
>  	return size;
>  }
> =20
> +u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buff=
er_type buffer_type)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops =3D inst->hfi_session_ops;
> +	int ret;
> +
> +	/* return 0 on error to let the driver cope */
> +	ret =3D hfi_ops->session_get_property(inst, HFI_PROPERTY_CONFIG_BUFFER_=
REQUIREMENTS);

[Severity: High]
Could this lead to a regression by waiting for a response in the response
handler thread?

When iris_vpu_ar50lt_gen1_buf_size() calls hfi_ops->session_get_property(),
it synchronously blocks until the firmware responds:

drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c:iris_hfi_gen1_sess=
ion_get_property() {
    ...
    return iris_wait_for_session_response(inst, false);
}

However, iris_vpu_ar50lt_gen1_buf_size() (via iris_get_buffer_size()) is
invoked from iris_hfi_gen1_read_changed_params() during event processing:

drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c:iris_hfi_gen1_rea=
d_changed_params() {
    ...
    pixmp_op->plane_fmt[0].sizeimage =3D iris_get_buffer_size(inst, BUF_OUT=
PUT);
    ...
}

This event processing runs inside the driver's response handler:

drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c:iris_hfi_gen1_res=
ponse_handler() {
    ...
        iris_hfi_gen1_handle_response(core, core->response_packet);
    ...
}

If the response handler thread blocks itself waiting for a response, how wi=
ll
that response ever be dequeued and processed? It appears this will stall the
response polling loop until the wait times out.

> +	if (ret)
> +		return 0;
> +
> +	return inst->buffers[buffer_type].size;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-iris-ar50l=
t-v4-0-0abfb74d5b3c@oss.qualcomm.com?part=3D12
