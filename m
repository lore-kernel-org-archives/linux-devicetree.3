Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046938;
	b=xrj2Ixp67PjDOgpZIF+0lV1LSI42xi2dhJl87IX8/GnDofIYskLNQZf375cXpJN4b/Hk
	 Xr5XhmLha5yV8ANnn5/MyEQApmAPAQB7H4AsfpZGKnkxp67cjO0kmltZdwVinXGdja4L6
	 QYh3epCr819cjfsBxSRAG3fo7eE8WrtAAtWYmrRIOHpjIcWitEGULjoUj+rOi8JyXQ+MD
	 9+tPv56Jhr3gyWPQQ0UgydY2j5p6ffr/eyNKg3MSwQFPL17G87NBaYR/53kAWm1SIHf3d
	 uvbY2zIY/POsWs7UYu+BgzVCTXmSBOrb/IR7Ma1uLsxxWMJYAi6LYw7UDgmZd0ZR4Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046938;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oCtb0rmvOejtjE2/BHaNuLkSWcxZ+u9oa3/QMh/gz8Y=;
	b=uedWym/2iC7b+KqeBSvBZL8Km4injsyjCVCDp9Y9wTEEU6bBszVefoLaySBuFiAuimw9
	 JOkYgYCcF0oqWL4ozsHacmVUhMP4vA//BOHwyq0rlkqjWdG/13acJY5dSrnrLfrG/aCM5
	 EQy3VEp077OtH9ErBP+favCYt4QlyjUiMw//rWf/fHB6kG5Jy7trytmnlgO/A6MsXoFgp
	 gDHYOqMaAo1Hl24PUd3h0Yrs+ZUV5YsR3GCKkzeGk63LfPoMCR377HaeCo9EqN3dQjDqd
	 D4ovrNUoBz65zzHG/28Mf0VNIYjmXPNgMO64vZ5gbFjEfMwDPhCJXq7N7RhuUSCnH/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlHl1Mci;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2126606A32F;
	Thu, 19 Nov 2026 00:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlHl1Mci
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F5F1F000C4;
	Thu, 19 Nov 2026 00:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046938;
	bh=oCtb0rmvOejtjE2/BHaNuLkSWcxZ+u9oa3/QMh/gz8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SlHl1McigILCjwGqLBRVEYs44LEZkG27A3EF/tAmD2VvmyZKhzgkZy3BKB1j6XypZ
	 mZUVdeSvC8y6ukb0YUQtoINI0F9Ld5Uc5Scouj/YvTTWTHLLQZICmZjH0Ee/9OJ+yZ
	 Ss+4j4hUthyFUF7j5M4IBaZzqC0wmCQvpJk7tDinjxkEr2aayn6MX1jWTd0qBRa1CF
	 lERVIYcl8+J776Ruy+yubAqvf5YcO2BBO9z9ltaY6WMqx2pgbVKImlh9BKaYt3SZR3
	 +6xWb86OFrIc2DXlPWGm8K2/xkvlcVLc9Li3Cy/ogyhizIf8/rmKSvxD+wz5c/YoPc
	 ELAgsr8wJGC7g==
Date: Thu, 19 Nov 2026 00:08:46 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
 <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, Ben Horgan
 <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei
 <cp0613@linux.alibaba.com>, Conor Dooley <conor.dooley@microchip.com>,
 Conor Dooley <conor+dt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, Fenghua
 Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, Gong
 Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, James Morse
 <james.morse@arm.com>, Kornel =?UTF-8?B?RHVsxJliYQ==?=
 <mindal@semihalf.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 liu.qingtao2@zte.com.cn, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Peter Newman
 <peternewman@google.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, Tony
 Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui
 <cuiyunhui@bytedance.com>, Zhanpeng Zhang
 <zhangzhanpeng.jasper@bytedance.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng
 Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 1/5] riscv_cbqri: Add capacity controller core
Message-ID: <20261119000846.776930b3@jic23-hlaptop>
In-Reply-To: <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
	<20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 14:06:21 -0800
Drew Fustini <fustini@kernel.org> wrote:

> Add the core for RISC-V CBQRI capacity controllers: the register
> layout, the capability probe, and the allocation operations that
> program a capacity block mask for an RCID and read it back.
> 
> A discovery layer maps the register block and describes the controller
> in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() probes
> the controller from that descriptor and adds it to the controller list,
> which stays private to the core. The core owns the controller state
> after registration, so nothing in it depends on how the controller was
> discovered. The caller keeps the register mapping alive.
> 
> Tested-by: Zeng Heng <zengheng@picoheart.com>
> Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>

A couple more drive by comments.

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
> new file mode 100644
> index 000000000000..5522872f5cc1
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_devices.c


> +
> +/* Read the configured CBM for closid on the AT half via READ_LIMIT. */
> +int cbqri_read_cache_config(struct cbqri_controller *ctrl, u32 closid,
> +			    u32 at, u32 *cbm_out)
> +{
> +	int err;
> +
> +	guard(mutex)(&ctrl->lock);
> +
> +	err = cbqri_cc_alloc_op(ctrl, CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT, closid, at, 0);
> +	if (err == 0) {
> +		/*
> +		 * resctrl exposes the CBM as a u32 and cbqri_probe_cc() rejects
> +		 * ncblks > 32, so the mask fits the low 32-bit word of the
> +		 * cc_block_mask register.
> +		 */
> +		*cbm_out = readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);
> +	}
> +
> +	return err;
Unless this gets more complex in later patches I'd do
	if (err)
		return err;

	/*
	 * resctrl exposes the CBM as a u32 and cbqri_probe_cc() rejects
	 * ncblks > 32, so the mask fits the low 32-bit word of the
	 * cc_block_mask register.
	 */
	*cbm_out = readl(ctrl->base + CBQRI_CC_BLOCK_MASK_OFF);

	return 0;

Just to keep error handling out of line and that
comment block less indented.

> +}


> +/**
> + * riscv_cbqri_register_cc() - register a capacity controller
> + * @info: registration descriptor. info->type must be CAPACITY. The resctrl
> + *        glue maps info->cache_level to the L2/L3 resource and uses
> + *        info->cache_id as the domain id.
> + *
> + * The caller resolves the cache level and id from its firmware description.
> + * Domain membership is resolved per CPU at hotplug, so no cpu mask is stored.
> + *
> + * Return: 0 on success, -EEXIST when a controller for the same cache level
> + * and id is already registered, or another negative errno on failure.
> + */
> +int riscv_cbqri_register_cc(const struct cbqri_controller_info *info)
> +{
> +	struct cbqri_controller *other;
> +	int err;
> +
> +	if (!info->addr) {
> +		pr_warn("skipping controller with invalid addr=0x0\n");
> +		return -EINVAL;
> +	}
> +
> +	if (info->type != CBQRI_CONTROLLER_TYPE_CAPACITY) {
> +		pr_warn("register_cc called with non-capacity type %u\n",
> +			info->type);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * SRMCFG encodes RCID in 12 bits. Reject an out-of-range count rather
> +	 * than let FIELD_PREP(SRMCFG_RCID_MASK, closid) truncate it silently.
> +	 */
> +	if (info->rcid_count > FIELD_MAX(SRMCFG_RCID_MASK) + 1) {
> +		pr_warn("CC at %pa has RCID count %u beyond the 12-bit SRMCFG field, skipping\n",
> +			&info->addr, info->rcid_count);
> +		return -EINVAL;
> +	}
> +
> +	struct cbqri_controller *ctrl __free(kfree) =
> +		kzalloc(sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	mutex_init(&ctrl->lock);
> +
> +	ctrl->base = info->base;
> +	ctrl->addr = info->addr;
> +	ctrl->size = info->size;
> +	ctrl->type = info->type;
> +	ctrl->rcid_count = info->rcid_count;
> +	ctrl->cache.cache_id = info->cache_id;
> +	ctrl->cache.cache_level = info->cache_level;
> +
> +	err = cbqri_probe_controller(ctrl);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * alloc_capable comes from the probe above and rcid_count from the
> +	 * discovery layer. Two RCIDs are the minimum for a useful system.
> +	 * resctrl reserves RCID 0 for the default group, so one RCID has
> +	 * nothing to allocate between, and CDP would halve it to zero.
> +	 * Reject fewer than two.
> +	 */
> +	if (ctrl->alloc_capable && ctrl->rcid_count < 2) {
> +		pr_warn("CC at %pa is alloc-capable but has fewer than 2 RCIDs, skipping\n",
> +			&ctrl->addr);
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&cbqri_controllers_lock);
> +
> +	/* The resctrl glue keys its domains on cache_id, one controller each. */
> +	list_for_each_entry(other, &cbqri_controllers, list) {
> +		if (other->cache.cache_level == info->cache_level &&
> +		    other->cache.cache_id == info->cache_id) {
> +			pr_warn("CC at %pa duplicates the L%u cache id %u controller at %pa, skipping\n",
> +				&ctrl->addr, info->cache_level, info->cache_id,
> +				&other->addr);
> +			return -EEXIST;
> +		}
> +	}
> +
> +	list_add_tail(&ctrl->list, &cbqri_controllers);
> +	retain_and_null_ptr(ctrl);

Common trick for this is something like:

	list_add_tail(&no_free_ptr(ctrl)->list, &cbqri_controllers);

because it couples ownership passing with stopping the autofree
magic.  I'd personally only use retain_and_null_ptr() in cases where I need
to check for success of the ownership being handed off.


> +	return 0;
> +}
> diff --git a/drivers/resctrl/cbqri_internal.h b/drivers/resctrl/cbqri_internal.h
> new file mode 100644
> index 000000000000..c3e39e6d30c5
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_internal.h

> diff --git a/include/linux/riscv_cbqri.h b/include/linux/riscv_cbqri.h
> new file mode 100644
> index 000000000000..b0daa1a7e42f
> --- /dev/null
> +++ b/include/linux/riscv_cbqri.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Public registration API for the RISC-V Capacity and Bandwidth QoS
> + * Register Interface (CBQRI) core. Discovery layers call
> + * riscv_cbqri_register_cc() to hand a capacity controller descriptor to
> + * the core, which owns all subsequent state.
> + */
> +#ifndef _LINUX_RISCV_CBQRI_H
> +#define _LINUX_RISCV_CBQRI_H
> +
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +
> +enum cbqri_controller_type {
> +	CBQRI_CONTROLLER_TYPE_CAPACITY,
> +};
> +
> +/**
> + * struct cbqri_controller_info - registration descriptor
> + * @addr:        MMIO base address of the controller's register interface
> + * @size:        size of the MMIO region
> + * @type:        controller type (capacity)
> + * @rcid_count:  number of supported RCIDs
> + * @cache_id:    cache id used as the resctrl domain id
> + * @cache_level: cache level (2 or 3) the controller backs
> + * @base:        mapped register block, which the caller keeps mapped for
> + *               the life of the system
Out of order documentation is unusual.  Why?

> + */
> +struct cbqri_controller_info {
> +	phys_addr_t			addr;
> +	phys_addr_t			size;
> +	void __iomem			*base;
> +	enum cbqri_controller_type	type;
> +	u32				rcid_count;
> +	u32				cache_id;
> +	u32				cache_level;
> +};
> +
> +#if IS_ENABLED(CONFIG_RISCV_CBQRI)
> +int riscv_cbqri_register_cc(const struct cbqri_controller_info *info);
> +#else
> +static inline int
> +riscv_cbqri_register_cc(const struct cbqri_controller_info *info)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
> +#endif /* _LINUX_RISCV_CBQRI_H */
> 

