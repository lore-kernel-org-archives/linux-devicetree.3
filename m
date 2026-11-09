Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223241;
	b=M56g/MrJy5Qne60Yeq5mfgrH1jt/1TQ/dTRgUGoRO2Io4WInZ1swZ32qsy3IyQOURpNX
	 xAGIwPtpNPUQDVzD5naR/eZR/PK4ACJ21Cl2XuXfzro4zjtdbJjmTRiS9Qdh+d3op/zTu
	 rOyklYlA/LQGMoDzf0HxwTgdupr8Xg9qmn+ykeSvLXV1c9ROj+Etsat3RcJiJ/0Qv+L1C
	 oVv2GBb+aAwdIQEuzL1+hIWVdViF4LmvhA0vLbOGqoEDgha3B1oBWcBDZ4TRt1zAy63A8
	 SCFGMfItXGosbzR/ZkPGjJ6rA19GTAj/pFd6udgZTLhWw7eBSZyE7IhwDzJXmh7x5SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223241;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7wFagrZpTZZ6HiHH8jLa7qsV0LGs1coVKfVmgc/FRes=;
	b=YEtwA3g60LJXkndThACLfkv5aiWa+zaGYMXGDgLAJX0jeVfGVNEhOS0uNPWZswQhromT
	 LcuX/Expp0AzfFAxDTYMDMUXkf+amr0xaFVNVch9dYP8JbB+HFDeoCD3KiQBV0DaxvQPv
	 wtQMXh4fyk4M45RNqg3yKMm0t8pqPCtvUn+q2/uABtCxM9ziG/vIH7+02P4YebgjaQPh6
	 4gCl/mKbSlGx0cn4XK6ioH6XXcPudMEi9ssCyxAZZqtLUSs6+n2BMp20I+al5xKmyTRxy
	 YGU6c2xhZ/u8iBgdXvaqiqX1FR0Heaj8mhGP307E3NaQKaqGjn8HB4ph8AOiHQNtYcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFxIhGfl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8F2606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFxIhGfl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B641F0089F;
	Mon,  9 Nov 2026 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794223240;
	bh=7wFagrZpTZZ6HiHH8jLa7qsV0LGs1coVKfVmgc/FRes=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QFxIhGflXsJNK8wswVD/mOrmVrBBJvH/paB/+igfeNMHu4hUakEK8GZMq6ohg0EiD
	 Vp57e7w9sTMRpLKPv18tPpEeaecunvrx+uGyzOd29O8+yTyoFO6OYZDRvGLJPypAz8
	 RqNlLl6E3YCCqh1knJTF4mj5MXnMdJG0RBmktSo3YGVsecexRSShBaKtls2oVklq34
	 dSOVqcbsWJ83Zn68115tMtuSlJdwAckauAIyevQe6GJDaSj/M56O8LeBk8lcIh9mah
	 d1IYxHa/urD7T0qTSLHHHxMk+rVm9cAddpkRIss/z0blHCDkjcwV5FnwI70WO8F1yG
	 /Rn66qPwQSJtQ==
Message-ID: <sashiko-outbox-204865@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC
 on DT platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
 <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 11:20:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] arm_mpam: invalid compatible memory parent check in
  update_msc_accessibility()
- [High] arm_mpam: vMSC collision in mpam_vmsc_find() for DT memory MSCs
- [Medium] arm_mpam: mpam_dt_parse_resource() ignores memory phandle
  target node
- [Low] arm_mpam: undocumented arm,mpam-memory parsing in
  mpam_dt_parse_resource()
--

commit 76edb90c680c1ae30161829584d4c65a841ea202
Author: Shanker Donthineni <sdonthineni@nvidia.com>

arm_mpam: Add support for memory controller MSC on DT platforms

This commit adds Device Tree discovery support for memory-controller MSCs,
deriving the component ID from the NUMA node and marking MSCs under a memory
parent node as accessible from all CPUs.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 78caa8ae13490..e0ac6ef83d6e7 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -365,10 +365,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *=
msc, struct device_node *np,
>  				  u8 ris_idx)
>  {
>  	int err =3D 0;
> -	u32 level =3D 0;
> -	u32 cache_id;
> +	u32 class_id =3D 0;
> +	u32 component_id =3D 0;
>  	struct device *dev =3D &msc->pdev->dev;
> +	enum mpam_class_types type =3D MPAM_CLASS_UNKNOWN;
>  	struct device_node *cache __free(device_node) =3D NULL;
> +	struct device_node *memory __free(device_node) =3D NULL;
>  	struct device_node *parent __free(device_node) =3D of_get_parent(np);
> =20
>  	if (of_device_is_compatible(np, "arm,mpam-cache")) {
> @@ -377,27 +379,47 @@ static int mpam_dt_parse_resource(struct mpam_msc *=
msc, struct device_node *np,
>  			dev_err_once(dev, "Failed to read phandle\n");
>  			return -EINVAL;
>  		}
> +		type =3D MPAM_CLASS_CACHE;
> +
>  	} else if (of_device_is_compatible(parent, "cache")) {
>  		cache =3D of_node_get(parent);
> +		type =3D MPAM_CLASS_CACHE;
> +	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
> +		memory =3D of_parse_phandle(np, "arm,mpam-device", 0);
> +		if (!memory) {
> +			dev_err_once(dev, "Failed to read phandle\n");
> +			return -EINVAL;
> +		}
> +		type =3D MPAM_CLASS_MEMORY;

[Severity: Low]
Is this arm,mpam-memory branch dead code?
Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml only documents the
arm,mpam-msc and arm,mpam-memory-controller-msc compatible strings and does
not define arm,mpam-memory or the arm,mpam-device phandle property, and the=
re
are no in-tree Device Tree users of memory-controller MSCs in this series.

> +	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc"=
)) {
> +		type =3D MPAM_CLASS_MEMORY;
>  	} else {
> -		/* For now, only caches are supported */
> -		cache =3D NULL;
> -		return err;
> -	}
> -
> -	err =3D of_property_read_u32(cache, "cache-level", &level);
> -	if (err) {
> -		dev_err_once(dev, "Failed to read cache-level\n");
> +		/*
> +		 * For now, only caches and memory controllers are
> +		 * supported.
> +		 */
>  		return err;
>  	}
> =20
> -	cache_id =3D cache_of_calculate_id(cache);
> -	if (cache_id =3D=3D ~0U) {
> -		dev_err_once(dev, "Failed to calculate cache-id\n");
> -		return -ENOENT;
> +	/* Determine the class and component ids, based on type. */
> +	if (type =3D=3D MPAM_CLASS_CACHE) {
> +		err =3D of_property_read_u32(cache, "cache-level", &class_id);
> +		if (err) {
> +			dev_err_once(dev, "Failed to read cache-level\n");
> +			return err;
> +		}
> +		component_id =3D cache_of_calculate_id(cache);
> +		if (component_id =3D=3D ~0U) {
> +			dev_err_once(dev, "Failed to calculate cache-id\n");
> +			return -ENOENT;
> +		}
> +	} else if (type =3D=3D MPAM_CLASS_MEMORY) {
> +		err =3D of_node_to_nid(np);
> +		component_id =3D (err =3D=3D NUMA_NO_NODE) ? 0 : err;
> +		class_id =3D MPAM_CLASS_ID_DEFAULT;
>  	}

[Severity: Medium]
When np is compatible with "arm,mpam-memory", does calling of_node_to_nid(n=
p)
ignore the target memory node resolved from the "arm,mpam-device" phandle?

The phandle target is stored in memory, but memory is never read afterwards.
Because numa-node-id is on the referenced memory node rather than on np,
of_node_to_nid(np) assigns the wrong component_id (falling back to 0 or to =
the
parent MSC's node ID when multiple RIS child nodes point at different NUMA
memory nodes).  Passing memory ? memory : np to of_node_to_nid() would query
the referenced node when present.

> =20
> -	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
> +	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
>  }

[Severity: High]
When a Device Tree platform has more than one memory-controller MSC on the
same NUMA node (or when NUMA is disabled), will mpam_ris_create() attach ev=
ery
MSC's RIS to the first MSC's vMSC?

For all Device Tree platform devices, pdev->id is PLATFORM_DEVID_NONE (-1),=
 so
do_mpam_msc_drv_probe() sets msc->id =3D -1 on every MSC.  Because all
MPAM_CLASS_MEMORY resources on the same node get class_id =3D
MPAM_CLASS_ID_DEFAULT and the same component_id, they share one
mpam_component, where mpam_vmsc_find() matches by msc->id:

drivers/resctrl/mpam_devices.c:mpam_vmsc_find() {
	list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
		if (vmsc->msc->id =3D=3D msc->id)
			return vmsc;
	}
}

Since vmsc->msc->id =3D=3D msc->id evaluates (-1 =3D=3D -1), every subseque=
nt memory
MSC on that node reuses the first MSC's vMSC.  During mpam_msc_hw_probe(),
mpam_ris_hw_probe() then resolves msc =3D ris->vmsc->msc to the first MSC w=
hile
holding the second MSC's probe_lock and part_sel_lock, triggering lockdep
assertions and performing unserialized MMIO accesses on the first MSC while
leaving the remaining memory MSCs unprobed and unconfigured.  Matching
vmsc->msc =3D=3D msc in mpam_vmsc_find() (or assigning each DT MSC a unique=
 ID)
would keep each MSC in its own vMSC.

> @@ -2574,6 +2596,8 @@ static void update_msc_accessibility(struct mpam_ms=
c *msc)
>  	} else {
>  		if (of_device_is_compatible(parent, "cache"))
>  			get_cpumask_from_cache(parent, &msc->accessibility);
> +		else if (of_device_is_compatible(parent, "memory"))
> +			cpumask_copy(&msc->accessibility, cpu_possible_mask);
>  		else
>  			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
>  	}

[Severity: High]
Can update_msc_accessibility() ever succeed for a non-root memory-controller
MSC with of_device_is_compatible(parent, "memory")?

Standard Device Tree memory nodes use device_type =3D "memory" rather than
compatible =3D "memory", and MMIO memory-controller MSC nodes live under bus
nodes (such as simple-bus) or memory-controller nodes rather than of_root.
For those nodes, parent !=3D of_root and of_device_is_compatible(parent,
"memory") is false, leaving msc->accessibility empty and causing
do_mpam_msc_drv_probe() to fail with -EINVAL.

Conversely, if an MSC node were placed under a parent with compatible =3D
"memory", neither of_platform_default_populate() nor
mpam_dt_create_foundling_msc() (which only iterates over compatible =3D "ca=
che"
nodes) would create a platform_device for it, even though mpam_dt_count_msc=
()
counts it in fw_num_msc, preventing MPAM from ever enabling.  In addition,
mpam_dt_parse_resource() only checks of_device_is_compatible(parent, "cache=
")
and does not handle a memory parent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-mpam-resct=
rl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com?part=3D6
