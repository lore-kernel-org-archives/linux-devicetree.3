Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423F0282F08
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785046687; cv=none; b=SqeN+5rl4UJm/dASmxqFRN4GW/1isuiAz1X5DzsO9D+kP+XfsaZPDFGJcd38F4qPVV1f5HQ765sDsxfhY9F7fKSvaL9jg8H4rRkbmdVcg9/YsiIoz43Wvzxw0qr41KeAHsbZS3GUFPkNLs9v/3eeenRaPIB82LvT6gesV3O2FBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785046687; c=relaxed/simple;
	bh=i41WHrop/8HqHoI/wvzt3rLo0lNgVDIPwu8pcqZ6/dk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZMdeMg3rwqPHnJM3lEzOYx0PSJJJa9w5DTQ/0MKzg7tDkaQd83zUqN930Dg4wR0zPq5HzXnX6jugNeL3TNDzgd0cRxaoQ0kl86OyKUTFQNyYg5CB+UPJpoLzk0WiCDa7HeHbA2ojJsN4fdhzwMY8fa58CPFbdggiUy3BvOA5+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/VoKxTa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/VoKxTa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48AD1F000E9;
	Sun, 26 Jul 2026 06:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785046686;
	bh=/i8esFFwIJvWRcYanhUAHKaBw4/RC3wcjA46CkmqSYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b/VoKxTaYaXrVj5q9eMcJZ+1d7Z1juqlmnYRg2TyBTV3RihFArbO7fqe8j3iJxxFN
	 +YyKsXeLy8p23/go5/mtEzNtJ1UzVdsg5g8Egbgh9ksG7uF+GHpPEDbsibRlQZVT9N
	 jyH9KyZSnxykI3ngPI/Pbi7NCzluzBN/Oo/prDbspLDWCdtSy65LgNvJ2NrBHU8rbx
	 4dzFlWKJEPrl0kJsw7jpqPGr10VTQvvhLydgCu9haA0QO5erDszY+/2F4Lk0XAGCm0
	 kN6al15SC5Zf5J1nIojki909bMzrr84JjhQvn7i/ejyZeNoYJRcFv5k5n37uIQ9FPI
	 z4DG2zmlr0kKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/14] media: iris: Add support to select core for
 dual core platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260726-glymur-v10-10-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-10-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:18:05 +0000
Message-Id: <20260726061805.C48AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The MBPS core load limit is bypassed during stream setup, and core=
 selection is improperly locked to the MBPF check, contradicting the patch =
description.
- [High] Cross-instance lockless access to format and frame rate properties=
 during core load calculation.

Pre-existing issues:
- [High] Lockless traversal of the `core->instances` list in `iris_check_se=
ssion_supported` can cause list corruption or read-after-free bugs.
- [High] `iris_add_session` silently fails to add sessions exceeding `max_s=
ession_count`, leaving the session in an invalid state and violating the AP=
I.
- [High] Cross-instance lockless access to 64-bit power requirements (`min_=
freq` and `max_input_data_size`).
--

--- Patch [10]: [PATCH v10 10/14] media: iris: Add support to select core f=
or dual core platforms ---
commit c60a40ca7a5f98a3b80a85f1100a2fa1ecc2f020
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add support to select core for dual core platforms
   =20
On platforms with two video codec cores, select the hardware core for
a new session based on the current Macroblocks Per Frame (MBPF) and
Macroblocks Per Second (MBPS) load on each core. The selected core is
communicated to the firmware via the HFI_PROP_CORE_ID property at
stream-on time.
Since both cores share the same clock source, the required clock
frequency is the maximum of the aggregated frequencies across both
cores.
The total session count limit is scaled by the number of cores, since
each core independently supports sessions up to its own limit.

> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/medi=
a/platform/qcom/iris/iris_power.c
> index 91aa21d4070eb..a875647b31628 100644
> --- a/drivers/media/platform/qcom/iris/iris_power.c
> +++ b/drivers/media/platform/qcom/iris/iris_power.c
> @@ -75,14 +75,12 @@ static int iris_vote_interconnects(struct iris_inst *=
inst)
>  	return iris_set_interconnects(inst);
>  }
> =20
> -static int iris_set_clocks(struct iris_inst *inst)
> +static u64 iris_get_required_freq(struct iris_inst *inst)
>  {
>  	struct iris_core *core =3D inst->core;
>  	struct iris_inst *instance;
>  	u64 freq =3D 0;
> -	int ret;
> =20
> -	mutex_lock(&core->lock);
>  	list_for_each_entry(instance, &core->instances, list) {
>  		if (!instance->max_input_data_size)
>  			continue;
> @@ -90,6 +88,22 @@ static int iris_set_clocks(struct iris_inst *inst)
>  		freq +=3D instance->power.min_freq;
>  	}

[Severity: High]
This is a pre-existing issue, but does reading a 64-bit value concurrently
across instances risk returning torn reads?

Functions like iris_get_required_freq() and the newly introduced
iris_vpu36_get_required_freq() iterate over core->instances with core->lock
held to aggregate instance->power.min_freq.

However, inst->power.min_freq and inst->max_input_data_size appear to be
written concurrently by iris_scale_clocks() which only holds inst->lock.

Could this data race lead to passing an invalid aggregated frequency to the
clock framework?

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/medi=
a/platform/qcom/iris/iris_utils.c
> index ba5c8dc1280c2..4608e3f288326 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -101,40 +109,52 @@ struct iris_inst *iris_get_instance(struct iris_cor=
e *core, u32 session_id)
>  	return NULL;
>  }
> =20
> -int iris_check_core_mbpf(struct iris_inst *inst)
> +static int iris_check_core_load(struct iris_inst *inst, bool mbpf)
>  {
> -	struct iris_core *core =3D inst->core;
> +	const struct iris_platform_data *platform_data =3D inst->core->iris_pla=
tform_data;
> +	u32 max_load =3D mbpf ? platform_data->max_core_mbpf : platform_data->m=
ax_core_mbps;
>  	struct iris_inst *instance;
> -	u32 total_mbpf =3D 0;
> +	u32 total_load =3D 0;
> =20
> -	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list)
> -		total_mbpf +=3D iris_get_mbpf(instance);
> -	mutex_unlock(&core->lock);
> +	list_for_each_entry(instance, &inst->core->instances, list)
> +		total_load +=3D mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instanc=
e);

[Severity: High]
Does iterating over all sessions and calling iris_get_mbpf() or
iris_get_mbps() read non-atomic properties across instances safely?

If the aggregating thread reads fmt_src, crop, and frame rate properties of
other individual sessions without holding their respective inst->lock, could
this result in torn reads if they are concurrently updated during
VIDIOC_S_FMT or VIDIOC_S_PARM?

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/=
platform/qcom/iris/iris_vb2.c
> index a2ea2d67f60d0..dbb89396e6514 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, un=
signed int count)
>  	if (ret)
>  		goto error;
> =20
> +	ret =3D iris_set_core_id(inst);
> +	if (ret)
> +		goto error;
> +

[Severity: High]
This is a pre-existing issue, but I noticed that iris_check_session_support=
ed()
is called just before this in iris_vb2_start_streaming() while holding only
inst->lock. It iterates over the global core->instances list:

drivers/media/platform/qcom/iris/iris_vb2.c:iris_check_session_supported() {
    ...
    list_for_each_entry(instance, &core->instances, list) {
        if (instance =3D=3D inst)
            found =3D true;
    }
    ...
}

Since core->instances is modified by iris_add_session() and
iris_remove_session() under core->lock, can traversing it concurrently
without core->lock lead to list corruption or read-after-free bugs?

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index 26df872fb4fa1..52855f6c7deaa 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -41,16 +41,20 @@ static void iris_v4l2_fh_deinit(struct iris_inst *ins=
t, struct file *filp)
> =20
>  static void iris_add_session(struct iris_inst *inst)
>  {
> +	const struct iris_platform_data *plat =3D inst->core->iris_platform_dat=
a;
> +	u32 max_session_count =3D plat->max_session_count;
>  	struct iris_core *core =3D inst->core;
>  	struct iris_inst *iter;
>  	u32 count =3D 0;
> =20
> +	max_session_count *=3D max(plat->num_cores, 1);
> +
>  	mutex_lock(&core->lock);
> =20
>  	list_for_each_entry(iter, &core->instances, list)
>  		count++;
> =20
> -	if (count < core->iris_platform_data->max_session_count)
> +	if (count < max_session_count)
>  		list_add_tail(&inst->list, &core->instances);
> =20
>  	mutex_unlock(&core->lock);

[Severity: High]
This is a pre-existing issue, but if count is greater than or equal to
max_session_count, this function silently returns without adding the instan=
ce
to the list and without propagating an error code like -EBUSY to iris_open(=
).

Does this allow the open() syscall to incorrectly succeed, returning a valid
file descriptor to userspace while leaving the session off the internal
tracking list?

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index 5212f7d4e606c..ec35ad4f86102 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -333,6 +333,70 @@ static void iris_vpu36_program_bootup_registers(stru=
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

[Severity: High]
If iris_check_session_supported() exclusively invokes iris_check_core_mbpf()
to validate the session, and this new function permanently sets inst->core_=
id
based on the MBPF load alone, does it omit the MBPS check entirely?

If MBPS is checked sequentially later, wouldn't valid sessions be falsely
rejected because the selection algorithm only considers MBPF here?

> +	else if (select_core0)
> +		inst->core_id =3D IRIS_VCODEC0;
> +	else if (select_core1)
> +		inst->core_id =3D IRIS_VCODEC1;
> +	else
> +		return -ENOMEM;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D10
