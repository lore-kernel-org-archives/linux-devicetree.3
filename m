Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57E5361656
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346890; cv=none; b=D1g/VaeiTtP+XQoYV5Pq7g+TJHtG38RS+LuKnJ5gUQQT/QHocl/BQDMH7e5LkAgttQJLxzbPlCqlJqs3vo99/ZhhLNXwdlemNDJWJa7xn6v8mIvSOAWmeZqbHDyUVVPdwF0+VNJgVwziqx5EPvcx+UYWw/AS8+b9ZuFuVzLaoKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346890; c=relaxed/simple;
	bh=08l0oZJROEcosOyskoo7I4EdS5/F1vuEg0gvwp94Ixw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RNre+qt+DL3lw7iGqYHNzamyHa4nihjQpE+kYv00oyqX54qyx8HG5TpbSXFk9whRPn84tXKg0kGUqmv4UVcVNk5aGMAQojx9f+/yMwjXRkHPaehhIrN+tIh+/C1vVv+Md/fD3awkovShX48OYiIfA+B1J/9l/MnSASOBGLsSSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlGK8Qlb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlGK8Qlb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187341F00898;
	Mon,  1 Jun 2026 20:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780346889;
	bh=J0m/ES99evNePdy+sAjfZDY/+Xkvi9xf627vp8ulFiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YlGK8QlbKi5mLG+xpjXW9DTtvR51jeVY/LDZCwFqg0pbsBIoiV76aGuYubvZk4oUw
	 VLdfQoRWaE9ToELdAqBQ5jbEJbhIhvlJl820vWYS3nwhHGvvKe9VKFTjspOi0oNh6J
	 jwTAPHWaJMMX0LkKZElDtvP+E7xXbkGvUki9PgpLkck8kaJEVv33oJhoFX0yTzjjUU
	 cQXBUX8h7bPsF9SoP9O7IkuggGu/hiDqinKpos1m0BGILopnaUwusUt0rryDrJrdEe
	 3aSLAcdD8PTrz79KbyOUNfKFVtKxfY3TabsAByXri8994RKMf/MN3D+eI9+FH1m58R
	 MhTU+qs72sZ+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 07/18] riscv_cbqri: Add capacity controller probe
 and allocation device ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-7-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-7-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:48:08 +0000
Message-Id: <20260601204809.187341F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] `cache_size` permanently remains 0 because cacheinfo lookup happen=
s synchronously during early discovery before it is populated.
--

commit 931d91fef2d993a3edb9eef2d3d5e5329e33655b
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: Add capacity controller probe and allocation device ops

Add support for the RISC-V CBQRI capacity controller (CC). The firmware
discovery layer is responsible for passing the cbqri_controller_info
descriptor to riscv_cbqri_register_controller().

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_devices.c

[ ... ]

> +static int cbqri_probe_cc(struct cbqri_controller *ctrl)
> +{

[ ... ]

> +	/*
> +	 * Resolve cache_size via cacheinfo. cpus_read_lock satisfies
> +	 * lockdep_assert_cpus_held() inside get_cpu_cacheinfo_level(). If
> +	 * every cpu_mask member is offline, cache_size stays 0 and the
> +	 * controller cannot back occupancy monitoring.
> +	 */
> +	cpus_read_lock();
> +	if (!ctrl->cache.cache_size) {
> +		int cpu =3D cpumask_first_and(&ctrl->cache.cpu_mask, cpu_online_mask);
> +
> +		if (cpu < nr_cpu_ids) {
> +			struct cacheinfo *ci;
> +
> +			ci =3D get_cpu_cacheinfo_level(cpu, ctrl->cache.cache_level);
> +			if (ci)
> +				ctrl->cache.cache_size =3D ci->size;

[Severity: High]
Since this lookup happens synchronously as part of the initial controller
registration (which happens during early discovery), will
get_cpu_cacheinfo_level() always return NULL here?

If cacheinfo is unpopulated at this stage, it seems cache_size will be left
as 0, permanently disabling occupancy monitoring for this controller.

> +		}
> +	}
> +	cpus_read_unlock();

[ ... ]

> +int riscv_cbqri_register_controller(const struct cbqri_controller_info *=
info)
> +{

[ ... ]

> +	switch (info->type) {
> +	case CBQRI_CONTROLLER_TYPE_CAPACITY: {
> +		int level;
> +
> +		ctrl->cache.cache_id =3D info->cache_id;
> +
> +		level =3D find_acpi_cache_level_from_id(info->cache_id);
> +		if (level < 0) {
> +			pr_warn("Failed to resolve cache level for cache id 0x%x (%d), skippi=
ng\n",
> +				info->cache_id, level);
> +			cbqri_controller_destroy(ctrl);
> +			return level;
> +		}
> +		ctrl->cache.cache_level =3D level;
> +
> +		/*
> +		 * cache_size stays at 0 here. cacheinfo is not populated
> +		 * yet at acpi_arch_init time. Filled lazily during probe
> +		 * via get_cpu_cacheinfo_level().
> +		 */

[Severity: High]
The comment mentions that the size will be filled lazily during probe becau=
se
cacheinfo is not populated yet at acpi_arch_init time.

However, doesn't the registration function immediately call
cbqri_probe_controller() below, making the probe synchronous rather than la=
zy?

> +		err =3D acpi_pptt_get_cpumask_from_cache_id(info->cache_id,
> +							  &ctrl->cache.cpu_mask);
> +		if (err) {
> +			pr_warn("Failed to get cpumask for cache id 0x%x (%d), skipping\n",
> +				info->cache_id, err);
> +			cbqri_controller_destroy(ctrl);
> +			return err;
> +		}
> +		break;
> +	}
> +	default:
> +		pr_warn("controller at %pa: unknown type %u, skipping\n",
> +			&ctrl->addr, info->type);
> +		cbqri_controller_destroy(ctrl);
> +		return -EINVAL;
> +	}
> +
> +	err =3D cbqri_probe_controller(ctrl);
> +	if (err) {
> +		cbqri_controller_destroy(ctrl);
> +		return err;
> +	}
> +
> +	list_add_tail(&ctrl->list, &cbqri_controllers);
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D7
