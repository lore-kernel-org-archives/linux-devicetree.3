Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB7493D31
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991328; cv=none; b=tQLKY5QXVMebm2mWJvkCR7Dkssmn/iumo1rfCBT6Lx/Y8BMV3Hu5wT1eVgjwsQEvo9GHvvt23fMT1CqBwm6om/47/oRTz/Iatqd/iYXg3tztmb2IZvPwINld+OsiCGNWuu2mGAa3/4wOHi/2fptKpTCZUFgc+ANicEbUxXesqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991328; c=relaxed/simple;
	bh=UZ1NAekUGnTIBKemagUPAehSbJspGTzo4REtGnfEkss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LcQs8OhHEUbpXWGn+Q/FjoxIaq3gsrCF6iW4kFlML1T749arI3vpQTbLJrozQBjaxOW+U2sklEtF9NhAlHjAD310VTBOGhATlSGiGp7ILifzKa44nRoS7r0fDua0yCRPScnIiEx2XB8NJvzMxjPbgCUAIjCkcDtX71YutP8zDCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGKJ8d73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGKJ8d73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71891F000FF;
	Mon, 21 Sep 2026 11:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789991319;
	bh=FzM++gdRJDGEwJb59uK/ZdJJIcQdEhCJx1dyjXCiO3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DGKJ8d73M80X468lzYZJh0stAVniqqzByHFOjjyPfUZB18ASl0KUZncJjt98tw2nf
	 WchdNPTgwBJfBpLrxQWDUFrWVYPYdpWtYXWQwId2NIQY8pgFe5O+5vhT6lWzx0mnbf
	 LpHxnts54QZ2TLEJnK9+nSlaObEknQh2bttk1egYTZHBJsnwlnLzyCod7hbDQX2Nl5
	 /HuTbphHkR8L6gTO7zan60HEzwilaMPOBQPLvZE4ziUeiVvyQsKJxl+YAXYGPlh/H/
	 A9OUFJlfJ7pn2bAo37Yk42U12SMfTAoatc9RZgTVNBa+ThRvec4COtj/WWb+0+44pW
	 yVgPVINYoAvkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] firmware: arm_ffa: Introduce ffa-lend-pool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921110050.3977591-6-vdonnefort@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <20260921110050.3977591-6-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 11:48:38 +0000
Message-Id: <20260921114838.B71891F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] arm64: flush_dcache_page() misuse causes potential SError
- [High] pm: ffa_lend_pool_active state corruption on aborted hibernation
- [High] cma: TOCTOU data race on dev->cma_area leading to NULL pointer der=
eference
- [High] pm: missing PM notifier registration bypasses hibernation preventi=
on
- [High] cma: unconditional clearing of dev->cma_area clobbers unrelated CM=
A areas
- [Medium] pm: double registration of PM notifier for multiple DT nodes
--

commit 89717031e5424e454476d23e222a943cd21c32da
Author: Vincent Donnefort <vdonnefort@google.com>

firmware: arm_ffa: Introduce ffa-lend-pool

This commit introduces the arm,ffa-lend-pool reserved-memory CMA driver to
unmap pages from the kernel direct map before lending them to the Secure
world via FF-A. Devices can bind to this pool via the "memory-region" DT
property or the ffa_lend_pool_attach() function.

> diff --git a/drivers/firmware/arm_ffa/lend_pool.c b/drivers/firmware/arm_=
ffa/lend_pool.c
> new file mode 100644
> index 0000000000000..e4348f5c618b8
> --- /dev/null
> +++ b/drivers/firmware/arm_ffa/lend_pool.c
[ ... ]
> +static bool ffa_lend_pool_can_set_direct_map(struct device *dev, struct =
page *page, u64 nr_pages)
> +{
[ ... ]
> +	addr =3D page_to_phys(page);
> +	size =3D nr_pages << PAGE_SHIFT;
> +	base =3D cma_get_base(dev->cma_area);
> +	end =3D base + cma_get_size(dev->cma_area);

[Severity: High]
Can this result in a NULL pointer dereference? The compiler might reload
dev->cma_area from memory after cma_get_base() returns since it involves
an external function call. If a concurrent device detach sets dev->cma_area
to NULL at this exact moment, cma_get_size() would dereference it.

[ ... ]
> +int ffa_prepare_lend(struct device *dev, struct page *page, u64 nr_pages)
> +{
> +	struct page *p, *end;
> +	unsigned long addr;
> +	int ret;
> +
> +	if (!ffa_lend_pool_can_set_direct_map(dev, page, nr_pages))
> +		return -ENODEV;

[Severity: High]
If a device doesn't have an arm,ffa-lend-pool DT node, can_set_direct_map()
can still return true here, allowing memory to be successfully lent and
unmapped. However, since the PM notifier is only registered during the CMA
pool DT node setup, hibernation wouldn't be prevented. Could this lead to a
translation fault if hibernation is attempted while memory is lent?

> +
> +	/* provides full ordering */
> +	if (!atomic_add_unless(&ffa_lend_pool_active, 1, FFA_LEND_POOL_DISABLED=
))
> +		return -EBUSY;
> +
> +	end =3D page + nr_pages;
> +	for (p =3D page; p < end; p++)
> +		flush_dcache_page(p);

[Severity: Critical]
Does flush_dcache_page() provide sufficient hardware cache maintenance here?
On ARM64, this API only clears the PG_dcache_clean bit and doesn't perform
hardware cache eviction (like DC CIVAC) for the direct map. If dirty
Non-Secure lines are evicted to the now-Secure memory region, could this
trigger an asynchronous SError panic?

[ ... ]
> +static int ffa_lend_pool_pm_notify(struct notifier_block *nb, unsigned l=
ong mode, void *data)
> +{
> +	/* Prevent hibernation which would try to access lent memory */
> +	switch (mode) {
> +	case PM_HIBERNATION_PREPARE:
> +		if (atomic_cmpxchg_acquire(&ffa_lend_pool_active, 0, FFA_LEND_POOL_DIS=
ABLED))
> +			return notifier_from_errno(-EBUSY);
> +		break;
> +	case PM_POST_HIBERNATION:
> +		atomic_set(&ffa_lend_pool_active, 0);

[Severity: High]
If hibernation preparation is rejected because memory is already lent, the
PM core broadcasts PM_POST_HIBERNATION. Will unconditionally zeroing the
active counter here lose the state of currently lent pages? If so, when
the memory is later reclaimed, the counter would underflow to
FFA_LEND_POOL_DISABLED and permanently block future lends.

[ ... ]
> +static int __init ffa_lend_pool_setup(unsigned long node, struct reserve=
d_mem *rmem)
> +{
[ ... ]
> +	register_pm_notifier(&ffa_lend_pool_pm_nb);

[Severity: Medium]
If the device tree contains multiple arm,ffa-lend-pool nodes,
ffa_lend_pool_setup() will execute for each. Could this register the same
global static ffa_lend_pool_pm_nb notifier block multiple times and trigger
a WARN stack trace?

[ ... ]
> +static void ffa_lend_pool_device_release(struct reserved_mem *rmem, stru=
ct device *dev)
> +{
> +	xa_erase(&ffa_lend_pool_devices, (unsigned long)dev);
> +	dev->cma_area =3D NULL;

[Severity: High]
If a driver calls ffa_lend_pool_detach() on a device that failed to attach
(for instance, if ffa_lend_pool_attach() returned -ENODEV), this
unconditionally zeroes dev->cma_area. Could this clobber the device's
legitimate DMA CMA area?

Additionally, this clearing occurs concurrently with the cma_get_size()
call in ffa_lend_pool_can_set_direct_map() without synchronization, which
opens the TOCTOU race mentioned earlier.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921110050.3977=
591-1-vdonnefort@google.com?part=3D5
