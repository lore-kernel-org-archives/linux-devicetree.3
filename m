Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36A9311969
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045810; cv=none; b=Fz3n3ip+gJjxibg0cI8zm1ZE0ITDhRuKfpTFdtx+kB3hAf8vr0WDJFh7ur6RIqlW8GeOpBRK0j6YLfLm6TBGy/W3Da2DU6pCQbp2nlrW4uGF0PuvOJFHUGkEpZvvqexViDYIeZU8lysKWPJ+izIuslgpX96GPp6HaSvlB+l6UWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045810; c=relaxed/simple;
	bh=Q6YBnBs5q3KLuPPNX6a9MXdGjBN2O235Ais29gGX3gU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m3AnYnnBtK8w6iaoZDJE7ESChoBvWH07++NmAGgmIpl5WJcWV8YDOocNe1lxNspRUPMG5qKVImRkm4kDj3cpuh/n6vj2p4M8MRPCJTLeyW3G8q9RyZ4pbmnSK7SyizLBInhmCVzXdVD6w3mx5haxO4yWwNXaGLMfzGnGHyFtwB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehHRarD1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehHRarD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B6A1F000E9;
	Sun, 26 Jul 2026 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045809;
	bh=mY6Cw8nE0I1klt0VaSIGCfufzLmM6Wd1zi9NtL+bieQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ehHRarD1fZNbkNRfRZ7jlCXPSqLpW6rCyQFOFe+PH/L2qvQeiYNWCw05nM9n78sIs
	 iRfN65y/YlswN7GHFJdmzXvhRTw1i6pJa6pbZk4aVjLl/i/18INcD0srTPaXdtCedr
	 yxXx3wTRcM8SOqgq3hmxiz5zQb4Ei2EQFq+1fA2bc0s0+EB1SECIT0IDWjqPkiW08Q
	 lm91ZQSNFt6aXECEYtyaH6tia1wU4KYMG2vNH/U3yNsRY1SXs9xKmzpyiTXCjdVzYi
	 zrirvPMTFGEHsGf5valqtPqRvgpXtwLoW7SvkPCMdbZZ+uMLcRvMpqzhc7o8EiZlMP
	 bGaXmVNnidDIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 09/14] media: iris: Handle CPU_CS_SCIACMDARG3
 register write via program bootup registers hook
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260726-glymur-v10-9-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-9-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:03:28 +0000
Message-Id: <20260726060329.24B6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly added `iris_vpu36_ops` structure, which contains the fix=
 for the Glymur platform, is never assigned to any platform data.
- [Low] Bootup register programming is improperly placed inside a memory ma=
p setup function, creating an awkward double-write pattern.
--

--- Patch [9]: [PATCH v10 09/14] media: iris: Handle CPU_CS_SCIACMDARG3 reg=
ister write via program bootup registers hook ---
commit 5b1dcdb0f86534dd18f11d0f09a2cbbcb73f7014
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Handle CPU_CS_SCIACMDARG3 register write via program bootup re=
gisters hook

This commit adds a platform-specific hook to handle the CPU_CS_SCIACMDARG3
register during boot. It aims to fix the VM count on the Glymur platform by
writing 0x0 instead of the default 0x1.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index 1b08461ee4d70..5212f7d4e606c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
[ ... ]
> @@ -361,6 +366,7 @@ const struct vpu_ops iris_vpu36_ops =3D {
>  	.power_on_hw =3D iris_vpu36_power_on_hw,
>  	.power_off_controller =3D iris_vpu35_vpu4x_power_off_controller,
>  	.power_on_controller =3D iris_vpu35_vpu4x_power_on_controller,
> +	.program_bootup_registers =3D iris_vpu36_program_bootup_registers,
>  	.calc_freq =3D iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode =3D iris_vpu36_set_hwmode,
>  };

[Severity: High]
Is iris_vpu36_ops assigned to any platform data?

Looking through the driver, it appears this new vpu_ops structure is
never referenced, nor is the Glymur platform added to the driver's
of_match_table in this patch series.

Does this mean the promised firmware boot fix for the Glymur platform
is currently unreachable dead code?

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index e690c566c8751..72eb8f6240b70 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
[ ... ]
> @@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct i=
ris_core *core)
>  		writel(value, core->reg_base + SFR_ADDR);
>  	}
> =20
> +	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
> +
>  	if (vpu_ops->program_bootup_registers)
>  		vpu_ops->program_bootup_registers(core);
>  }

[Severity: Low]
Does this create an unnecessary double-write pattern?

By placing this inside iris_vpu_setup_ucregion_memory_map(), the code first
writes a default 0x1 to CPU_CS_SCIACMDARG3 (which is a boot argument
unrelated to memory mapping), and then immediately calls the hook.

On platforms using the workaround, this means writing 0x1 and then
immediately overwriting it with 0x0 before the firmware has started.

Could the default write and the hook be moved out of the memory map setup
and organized to avoid writing to this register twice?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D9
