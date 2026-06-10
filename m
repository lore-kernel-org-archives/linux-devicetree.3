Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956631DDA18
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074391; cv=none; b=enrVR0kb3UBsUiGMLB44udChxvlYVKkDrc9TmOR81TsJ1xCNnesjPg8puSyxQg8P6IOZoUwhi/UT6tJP6X8vN+oob6yrM18G+6NozyrgIGbh7876E64tL9G1bt9SyAFy2RBb1j467US9MdPFeN/JFzA7+uaaTEliQrAcJhC/ZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074391; c=relaxed/simple;
	bh=1k1BHymPjKmVaT1olpPJjhr2INme4XjVaq90Oi8AceU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ii9TfwrLZyA8YEyoDSL2fzQGXTyMNIOLFZgtDw/J5HLWN+ylcGHRVBxmQHDIzxRpMCRmS1huP90i/39TEoOvo284otVp2BsWDexWQ8wM8dDkZpxe7fyAi5XDkTWWIc0bsB0DgcKrje25cRwhbjyyAgOkpMR9fj+kGpLs8pG3u3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1Ut5gf+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1Ut5gf+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416351F00893;
	Wed, 10 Jun 2026 06:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781074390;
	bh=Y40ISAwiha/7SHpt5x0zmt9EU8KuMRmxPmWCRIQ/3/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1Ut5gf+4a7WjZ3hI3C93NsS2RsnczLJ/sY6WG7QXLbAzz4gu4tnQBY56SzGapRCe
	 dz4JanYf/uTWbRzbpqIkGWvuD3U0g1uGzcExeKoy5z4z9exSzYf7SZ2aXnnoKowaoE
	 8iYmZRen0GuqWKocnrtqz280PmIRFKhy3bvnxNbak+1vbY/txMVFwC9RV3iels4Y3E
	 ENe6RuMyyehUrqloop3QCSEVKAEIngg/Vr5mrS/FiERWCuQCy2WUDWUvFjGe8skylt
	 IgKSU5zcZK7ED3KoW6n4xJ5r0/BKy2fzLfafEAjlybSIcjywOXbmEDsC2G6XnOIrbN
	 jHm3IapeRlydA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 09/12] media: iris: Add support to select core for
 dual core platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610-glymur-v8-9-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-9-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 06:53:09 +0000
Message-Id: <20260610065310.416351F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Independent evaluation of MBPF and MBPS loads overwrites core sele=
ction, allowing sessions to bypass hardware capacity limits.
- [High] Dynamically altering stream parameters via `VIDIOC_S_PARM` mutates=
 the session's assigned hardware core in software, corrupting load tracking=
 and miscalculating frequency requirements.
- [High] `iris_vpu36_check_core_load()` permanently unassigns a session's `=
core_id` if the load check fails, dropping it from future hardware load acc=
ounting.
- [High] The macroblocks-per-second (MBPS) hardware limit is never checked =
at stream-on, allowing sessions to bypass MBPS constraints and contradictin=
g the commit message.

Pre-existing issues:
- [Critical] Race condition between asynchronous firmware message handlers =
and file closing causes a Use-After-Free on `inst`.
--

commit 6d93c47ec9e78218d02741995430e7d85a3d1c7a
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add support to select core for dual core platforms

> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.

[Severity: High]
The commit message states the core is selected based on both MBPF and
MBPS load. However, looking at the stream-on path:

iris_vb2_start_streaming()
  iris_check_session_supported()

Does iris_check_session_supported() only check MBPF at stream-on? If the
MBPS check is omitted, could a session with an excessively high frame rate
bypass MBPS constraints and be incorrectly admitted based solely on its
MBPF footprint?

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/medi=
a/platform/qcom/iris/iris_utils.c
> index ba5c8dc1280c2..4608e3f288326 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c

[ ... ]

> @@ -101,40 +109,52 @@ struct iris_inst *iris_get_instance(struct iris_cor=
e *core, u32 session_id)
>  	return NULL;
>  }

[Severity: Critical]
This isn't a bug introduced by this patch, but does dropping core->lock
without taking a reference count in iris_get_instance() allow a
use-after-free?

If a userspace close() runs concurrently:

CPU1
close()
  iris_remove_session()
  kfree(inst)

Could CPU2 then resume in iris_hfi_gen2_handle_session_response() and
execute mutex_lock(&inst->lock) on the freed memory?

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index bafa2ab645b17..dc491a5aecf52 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c

[ ... ]

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
> +	inst->core_id =3D 0;

[Severity: High]
If the load exceeds hardware limits and we return -ENOMEM below, does this
leave inst->core_id as 0? When VIDIOC_S_PARM handles this error and
gracefully reverts the frame rate, does the session remain active on the
hardware with core_id =3D=3D 0? Could this cause its load to be silently
ignored in future core assignments, and its frequency requirements
misattributed to VCODEC1 via the fallback else logic?

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
> +	new_load =3D mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
> +
> +	select_core0 =3D core0_load + new_load <=3D max_load && core0_session_c=
nt < max_session_cnt;
> +	select_core1 =3D core1_load + new_load <=3D max_load && core1_session_c=
nt < max_session_cnt;
> +
> +	if (select_core0 && select_core1)
> +		inst->core_id =3D (core0_load <=3D core1_load) ? IRIS_VCODEC0 : IRIS_V=
CODEC1;
> +	else if (select_core0)
> +		inst->core_id =3D IRIS_VCODEC0;
> +	else if (select_core1)
> +		inst->core_id =3D IRIS_VCODEC1;
> +	else
> +		return -ENOMEM;

[Severity: High]
When iris_check_core_mbpf() and iris_check_core_mbps() are called
sequentially (for example, in iris_venc_s_param()), does the second call
unconditionally overwrite the inst->core_id assigned by the first call?
Could this allow a session to be assigned to a core that has sufficient
MBPS capacity but violates its maximum MBPF capacity?

[Severity: High]
If a session is actively streaming and the frame rate is changed via
VIDIOC_S_PARM, this recalculates and mutates inst->core_id here. Is any
command sent to the firmware to migrate the active session to the new
core? If not, will the hardware continue running on the original core
while the software incorrectly redirects required clock frequencies to
the newly assigned core, potentially underclocking the active core?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-glymur-v8-=
0-1c79b9d51fc0@oss.qualcomm.com?part=3D9
