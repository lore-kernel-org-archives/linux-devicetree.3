Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46823331EC7
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464833; cv=none; b=nB62tgRJeq5BZG0wQwtMKKXBIwTN3kKbpNqeHdOpt6qseTcyYQR9B/WXk9IIZ6wcy938mrklflgwNqlMTQSHRrZoTmiL2ytwqvhfBEy195/t0Y6K50m+hDdW6b/udHFRceZ80jTCYlt3HjWmQOHFY8AbkoWJz0mXdqcSr3OoFmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464833; c=relaxed/simple;
	bh=rbiDPWmeNKCH7Sv9cTyM88/aFMJpsq+ez7E4tk0LiRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZrxtnArHpsw/ii30O9IYPPwVozEpetdRvmJ0UXfUpfzr2ar8BkjUNl7MA5Nghn5aOcXKk+9Se9yB3XxquY8ZDjBTHa7fnmOLRf2zMTtDNoiqv8yWJLzmQt2KOwBOAVcLCJH+L4jadf+T6tRuzDibg3gDYeBtoj9LrrSo9X9wZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey4VYfiu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey4VYfiu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56921F000E9;
	Tue,  7 Jul 2026 22:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783464831;
	bh=38TCRoIUYEjHZuJ1Cw9riSz2xWFRxu9jgRccFzs0C8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ey4VYfiurE3YBs/Ilfx7kobXPebZbh0p3yMPX3BiZREgsW8sD6gR3hddRnTvwTSXM
	 tjIa95z6ZqyZgb3Qu4vc+u1NqOUcOR15HvABGUZ8fzqMmE8Cs5dQJkx7xUlFwNnYC/
	 7ceJKtXAvma8+fIX5SwBDqoZmo2OJxi/NizKEhylgRVUwyraNGsDxqgyCsVBYQTtzw
	 mFJcviHQiPEnpwkBKLbshoMZhILy5cWBV1szLa1ynr26KICfN5Z2Yo5YqvIIzEglaD
	 P4yIw08OB+Cyo1o+NwcyxjoHT0Vf5MK7BAqjZCny8fv/pA/Q7MuXA1JG9Wxb4gm2v9
	 ooCjTb/FM5yGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/18] media: iris: implement support for the Agatti
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-iris-ar50lt-v6-14-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-14-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 22:53:51 +0000
Message-Id: <20260707225351.A56921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The AR50Lt encoder will fail to allocate its required internal buf=
fers because it never queries their sizes from the firmware, resulting in a=
 size of 0 and firmware initialization failure.
--

--- Patch [14]: [PATCH v6 14/18] media: iris: implement support for the Aga=
tti platform ---
commit 4c7933dee146c178bb97d589bc58051909ba6ca9
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: implement support for the Agatti platform

Port support for the AR50Lt video codec core (present for example on the
Agatti platform) to the Iris driver. Unlike more recent cores this
generation doesn't have the PIPE property (as it always has only one
pipe). Also, unlike newer platforms, buffer sizes are requested from the
firmware instead of being calculated by the driver.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/m=
edia/platform/qcom/iris/iris_hfi_gen1.c
> index ca1545d28b531..4e2f1804ca66f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
[ ... ]
> +const struct iris_firmware_data iris_hfi_gen1_ar50lt_data =3D {
> +	.init_hfi_ops =3D &iris_hfi_gen1_sys_ops_init,
> +
> +	.inst_fw_caps_dec =3D iris_inst_fw_cap_gen1_ar50lt_dec,
> +	.inst_fw_caps_dec_size =3D ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
> +	.inst_fw_caps_enc =3D inst_fw_cap_gen1_ar50lt_enc,
> +	.inst_fw_caps_enc_size =3D ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
> +
> +	.dec_input_config_params_default =3D
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =3D
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params =3D sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =3D
> +		ARRAY_SIZE(sm8250_venc_input_config_param),

[Severity: High]
Will the AR50Lt encoder fail to allocate its required internal buffers beca=
use
it never queries their sizes from the firmware?

Since the encoder reuses sm8250_venc_input_config_param, it lacks
HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL. Without this property being requeste=
d,
and because venc_prop_type_handle_inp_arr in iris_hfi_gen1_command.c lacks a
handler for it, iris_hfi_gen1_set_bufsize() is never called for the encoder.

As a result, the newly added firmware query for
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS won't execute, leaving
inst->buffers[buffer_type].size as 0. This means iris_vpu_ar50lt_gen1_buf_s=
ize()
will also return 0.

Does the encoder need its own input config array and an update to the prope=
rty
handler array so that it can correctly fetch buffer sizes?

> +
> +	.dec_ip_int_buf_tbl =3D iris_hfi_gen1_ar50lt_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size =3D ARRAY_SIZE(iris_hfi_gen1_ar50lt_dec_ip_int=
_buf_tbl),
> +	.dec_op_int_buf_tbl =3D sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size =3D ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl =3D sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size =3D ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 99e82e5510abe..5c267e9aef6ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -970,6 +970,11 @@ static int iris_hfi_gen1_set_bufsize(struct iris_ins=
t *inst, u32 plane)
>  	struct hfi_buffer_size_actual bufsz;
>  	int ret;
> =20
> +	ret =3D inst->hfi_session_ops->session_get_property(inst,
> +							  HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS);
> +	if (ret)
> +		return ret;
> +
>  	if (iris_split_mode_enabled(inst)) {
>  		bufsz.type =3D HFI_BUFFER_OUTPUT;
>  		bufsz.size =3D inst->core->iris_firmware_desc->get_vpu_buffer_size(ins=
t, BUF_DPB);

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers=
/media/platform/qcom/iris/iris_vpu_buffer.c
> index fb6f1016415e2..511502d4ea6c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
[ ... ]
> @@ -2194,6 +2194,11 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, en=
um iris_buffer_type buffer_typ
>  	return size;
>  }
> =20
> +u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buff=
er_type buffer_type)
> +{
> +	return inst->buffers[buffer_type].size;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-iris-ar50l=
t-v6-0-374f0a46c23b@oss.qualcomm.com?part=3D14
