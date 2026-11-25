Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578441;
	b=wdzqHJYcj3vP9en8kR/DXZxjxkxESbvv5L9D+wz7H57uXUWgrN6jVJAzU4aJ2quk6VnF
	 oQvrujgCMvCGvoJSMM6eHJ1+cNR1u9hEP21S3WFW6YslLnyvVaGdd13R6FH9X7KPkYzmR
	 ojRTvOn5Mxq04O9Q8vP/+ElQyAo34WHCw91JvOauNqYp17LhKZ9KsW0Sb9DR3R6cUXx1V
	 GjaobWHfaQSWNqw6C4Vq01h9jj7tQoK7AS5cGXhd5++OtbSdTR0v9k1J+HU6WFMmYpdwk
	 3vgWKnykps4YV21e6WqV1n+gW7NN6eX9Q75NzEOwwE4PI/dWqVUEKdcPvcV1CuSZRvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578441;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lYezi2jRuK4l5Hs1irDDIcrq/xYaDDuC3wn/YInDP5A=;
	b=EmjOHGqJvoP3jXsJ6MWJl3vnp9xokocLmRVDRqMxZaM8SZM7SiVA7RAOnmhjryrVgu4k
	 iyHHQX0iKgTUvYPONmZ9Jn29PlFYLT9l7fkd6tLm15qrPxg9WXvewxSrbYhDX0qY7VJx5
	 ES726jR469mo+naqy11Q7FmwJAkya/W3gDhPnc2+ErIpw1nfHDOK9/mcs8V4K4kTBVVS9
	 V02G7SxKQ7MJq7VV7G4JrA0s5+44mf7xAIyj25gApVHWDOUqzt34jftcVeLTmR2DPGGrA
	 o4WW/nGU4m5LJW8ABazLmNcx547/OvmJaH/DZ5pXPXlevzDIaqZe88FDBRBnvQzLfVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NHiq/HrY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A82606A336
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHiq/HrY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C4D1F000D1;
	Wed, 25 Nov 2026 03:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795578441;
	bh=lYezi2jRuK4l5Hs1irDDIcrq/xYaDDuC3wn/YInDP5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NHiq/HrYKG+psoGCd0mNTreE7xCjtvki/8NS3784NseMCOE8NcM7rdq5mh+fgAyzd
	 5gv1tGBhZaO3CDEcpd/pfOMXD+HbHwlqGOHCgDgZayES/70dLlsU3xQtONDAI5ARcE
	 MxehtyvlF8uzybiJ7MkVosy/37xtOoE/dLdKBOriAlNxWgT3oTS0ELBe30tJESkcq6
	 B3O0Fze2MIAm/JtZzvb3MWBYrxQcOSaR9SH3+YrlaE+vj44SmM7aeTjc+kjaqAiDHu
	 vXh5d5/clz3DiZ3bqDwcZkypXvZNUDqrdh//F/FawYZrnqEDBcZDzvtfHauS1MZyvK
	 2fKn7rlvVvg8A==
Message-ID: <sashiko-outbox-232501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/9] media: iris: Add support to select core for
 dual core platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125-glymur-v12-6-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-6-5c34dfd73fc2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 03:47:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: iris: premature core_id pinning in
  iris_vpu36_check_core_load()
--

commit 808d193eb38505ae4527a210592f86b63f734489
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add support to select core for dual core platforms

This commit adds core selection and per-core load and frequency tracking
for dual-core VPU36 video codec platforms, sending the selected core to
firmware via HFI_PROP_CORE_ID at stream-on time.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index fe0c91af3301d..0a211506d12d7 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -339,6 +339,70 @@ static void iris_vpu36_program_bootup_registers(stru=
ct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
>  }
> =20
> +static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
> +{
> +	const struct iris_platform_data *platform_data =3D inst->core->iris_pla=
tform_data;
> +	u32 max_load =3D mbpf ? platform_data->max_core_mbpf : platform_data->m=
ax_core_mbps;
> +	u32 max_session_cnt =3D platform_data->max_session_count;
> +	u32 core0_session_cnt =3D 0, core1_session_cnt =3D 0;
> +	u32 core0_load =3D 0, core1_load =3D 0;
> +	bool select_core0, select_core1;
> +	struct iris_inst *instance;
> +	u32 load, new_load;
> +
> +	list_for_each_entry(instance, &inst->core->instances, list) {
> +		load =3D mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
> +
> +		if (instance->core_id =3D=3D IRIS_VCODEC0) {
> +			core0_load +=3D load;
> +			core0_session_cnt++;
> +		} else if (instance->core_id =3D=3D IRIS_VCODEC1) {
> +			core1_load +=3D load;
> +			core1_session_cnt++;
> +		}
> +	}
> +
> +	if (inst->core_id =3D=3D IRIS_VCODEC0)
> +		return core0_load <=3D max_load ? 0 : -ENOMEM;
> +	else if (inst->core_id =3D=3D IRIS_VCODEC1)
> +		return core1_load <=3D max_load ? 0 : -ENOMEM;

[Severity: Medium]
Does pinning inst->core_id during iris_vb2_queue_setup() and summing load
across all instances with a matching core_id cause sessions to fail with
-ENOMEM?

iris_check_session_supported() -> iris_check_core_mbpf() runs during both
VIDIOC_REQBUFS and VIDIOC_STREAMON.  If VIDIOC_REQBUFS runs on the CAPTURE
queue while inst->fmt_src still holds the default 320x240 format (or before
VIDIOC_REQBUFS(0) and a later VIDIOC_S_FMT), inst->core_id is locked in
before HFI_PROP_CORE_ID is ever sent to firmware.  When the actual larger
resolution is later set on inst->fmt_src, this early return refuses to pick
the other core even if that core has enough capacity.

In addition, if a later step in iris_vb2_queue_setup() or
iris_vb2_start_streaming() fails (putting the instance into
IRIS_INST_ERROR), or if an instance with an assigned core_id sets an
oversized format via VIDIOC_S_FMT, inst->core_id is not cleared and the
loop above still includes that instance's load in core0_load or core1_load,
causing other sessions on the same core to fail their load checks with
-ENOMEM until the file descriptor is closed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-glymur-v12=
-0-5c34dfd73fc2@oss.qualcomm.com?part=3D6
