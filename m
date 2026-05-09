Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C92279DC3
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 03:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778298908; cv=none; b=bRbeRwsmhEJuA07m3zyJKnZ7wqWMza3tIyHYItbkjHzB1O4Gf9Ap6JHryIbQRmVPv3QUnxaSWWRmp/c5i3BappodZ+W5ngcqHT0XH2EVrD1lwSVBSZy8EUYWVrY/qkpkk5idgPPIl5kA4C20vz9wM1zJeeRG46N1RB9glDJt7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778298908; c=relaxed/simple;
	bh=WEBfO63FUkGA5uDnr/WmvF58EOmHKPipNxl8jO7u72c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UD0utEGnuNZ9U8f74YbcFnMPCHfq3ZYrcJQuUneAYzHF2Hvx3HfnNurdPUtz0xc96Zhz+dTTrdCauHdUbfvOKcmLaW96zVcg+pLJYXaz9hCYnNduaYwAR2qWDnmG1Zo1bciwXJ04pbyyUz4EkxIWb1Zt3aFwXQ2pZaWLzT/C0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfOHFvhA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfOHFvhA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B25C2BCB2;
	Sat,  9 May 2026 03:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778298908;
	bh=WEBfO63FUkGA5uDnr/WmvF58EOmHKPipNxl8jO7u72c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tfOHFvhA2oNXFI6655aOghLKueQUmyBLQnw6zNrNYzK+MJfISMsPK/AzHmns5oiJi
	 lh/tADKAokTZ6nkFCV8Sn+Bk7SDKqPmmm3KNbluD0NyHO5vs/+6U3bMnMxsBuGAtNc
	 xXknM/kT40/M7ydXuZV0a5d5dxfAbFqVX5yIIWSEg8yAnxIh8Wbz5aMYMtCJsBG8sb
	 EndAmy6SkRYRlsq/t/qA3Y8DFenw2VjWSqdTgNFLvR+OWtcIBv9TVAc4DVFZn79oiu
	 3I8IT/KIFeev8OIqytDyWs5GtQ4Hb0MJp2EW60Tucf26umu335wrknT3/zUmi62wJs
	 GahouQG6OeXHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/14] media: iris: Add support to select core for
 dual core platforms
Reply-To: sashiko@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509-glymur-v5-11-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-11-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 03:55:07 +0000
Message-Id: <20260509035508.84B25C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] State Corruption / Admission Control Bypass via core_id error =
handling
- [High] Hardware Constraint Bypass via sequential core capacity checks
- [High] Permanent Clock Overprovisioning on failed stream initialization
- [High] Hardware Desynchronization and Under-clocking on dynamic core reas=
signment
- [High] MBPS Capacity Limit Validation is bypassed during stream initializ=
ation
- [High] Conflicting HFI Commands and Core Flipping across M2M Queue starts
--

commit a24b550f95eaa9370c3d20dc544af695464b53d4
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add support to select core for dual core platforms

On platforms with dual vcodec cores, select the hardware core for a
session based on current load. Assign the session to vcodec0 if its
MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
the selected core to firmware using the new HFI_PROP_CORE_ID property.

> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/medi=
a/platform/qcom/iris/iris_power.c
> index 91aa21d4070eb..b72ce5b596b83 100644
> --- a/drivers/media/platform/qcom/iris/iris_power.c
> +++ b/drivers/media/platform/qcom/iris/iris_power.c
[ ... ]
> @@ -87,11 +87,14 @@ static int iris_set_clocks(struct iris_inst *inst)
>  		if (!instance->max_input_data_size)
>  			continue;
> =20
> -		freq +=3D instance->power.min_freq;
> +		if (instance->core_id =3D=3D IRIS_VCODEC0)
> +			vcodec0_freq +=3D instance->power.min_freq;
> +		else
> +			vcodec1_freq +=3D instance->power.min_freq;
>  	}

If stream initialization fails in iris_vb2_start_streaming() after
calculating session power requirements but before a valid core is assigned,
inst->core_id remains 0.

Because 0 does not equal IRIS_VCODEC0, does this cause the failed session's
clock frequency to be permanently aggregated into vcodec1_freq during all
future clock recalculations?

> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/medi=
a/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56b..da8a89d3dd41c 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
[ ... ]
> +static int iris_check_and_assign_core(struct iris_inst *inst, bool mbpf)
> +{
[ ... ]
> +	inst->core_id =3D 0;
> +
> +	list_for_each_entry(instance, &inst->core->instances, list) {
[ ... ]
> +	if (select_core0 && select_core1)
> +		inst->core_id =3D (core0_load <=3D core1_load) ? IRIS_VCODEC0 : IRIS_V=
CODEC1;
> +	else if (select_core0)
> +		inst->core_id =3D IRIS_VCODEC0;
> +	else if (select_core1)
> +		inst->core_id =3D IRIS_VCODEC1;
> +	else
> +		return -ENOMEM;
> +
>  	return 0;
>  }

If the requested load exceeds available capacity, this function returns
-ENOMEM but leaves inst->core_id set to 0.

If this happens dynamically, for example when userspace calls VIDIOC_S_PARM
to change the frame rate on an already active stream, does leaving core_id
as 0 exclude this session from future global load calculations?

Could this allow an attacker to bypass dual-core admission controls (such
as max_session_count and MBPS limits) by intentionally triggering an out
of memory condition?

Additionally, when system load shifts and this function dynamically
reassigns an active session to a different hardware core, is the new core
assignment ever communicated to firmware?

Since session_set_core_id() appears to only be called during stream
initialization, would dynamic reassignment cause iris_set_clocks() to route
the session's clock frequency requirements to the newly assigned core,
starving the original executing hardware core and risking hardware hangs?

> -int iris_check_core_mbpf(struct iris_inst *inst)
> +int iris_check_core_mbpf(struct iris_inst *inst)
>  {
>  	struct iris_core *core =3D inst->core;
> +	int ret;
> =20
>  	mutex_lock(&core->lock);
> +	ret =3D iris_check_and_assign_core(inst, true);
>  	mutex_unlock(&core->lock);
> =20
> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
> -		return -ENOMEM;
> +	return ret;
>  }
> =20
> -int iris_check_core_mbps(struct iris_inst *inst)
> +int iris_check_core_mbps(struct iris_inst *inst)
>  {
>  	struct iris_core *core =3D inst->core;
> -	struct iris_inst *instance;
> -	u32 total_mbps =3D 0, fps =3D 0;
> +	int ret;
> =20
>  	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list) {
> -		fps =3D max(instance->frame_rate, instance->operating_rate);
> -		total_mbps +=3D iris_get_mbpf(instance) * fps;
> -	}
> +	ret =3D iris_check_and_assign_core(inst, false);
>  	mutex_unlock(&core->lock);
> =20
> -	if (total_mbps > core->iris_platform_data->max_core_mbps)
> -		return -ENOMEM;
> -
> -	return 0;
> +	return ret;
>  }

If a caller executes iris_check_core_mbpf() and immediately follows it
with iris_check_core_mbps(), won't the second call wipe the core assignment
made by the first pass?

Does this allow sessions to bypass hardware MBPF limits, as the final
assignment checks only MBPS capacity and ignores whether the core can
handle the session's MBPF load?

> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/=
platform/qcom/iris/iris_vb2.c
> index bf0b8400996ec..5a05f7d655017 100644
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

In this function, the driver validates hardware capacity before setting
the core ID. Does the validation check (iris_check_session_supported())
exclusively enforce the MBPF limit and omit the MBPS check entirely?

If the MBPS limit is bypassed during stream initialization, could users
start sessions that exceed the max_core_mbps limit right away, instead of
only being checked during dynamic frame rate changes?

Furthermore, V4L2 memory-to-memory drivers allow userspace to call
VIDIOC_STREAMON independently for the OUTPUT and CAPTURE queues.

Because iris_set_core_id() is called unconditionally for each queue start,
could concurrent session starts on other instances alter the global load
between a session's two STREAMON calls?

Would this cause the driver to assign and notify firmware of one core
during the first STREAMON, but then reassign and send a conflicting
HFI_PROP_CORE_ID during the second STREAMON while the session is already
active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-glymur-v5-=
0-7fbb340c5dbd@oss.qualcomm.com?part=3D11
