Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACB382F1D
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346973; cv=none; b=AyTokh/0KmiWDk85Y4YrdEASiqENYUpdk7Gj17ISLf4l2z/MEWG3LCkOJbkykWikAwUM8riPIHhI+iyJrE3cgvmNcsHQGzYDcSC3MT6KPiSphrlL9Vuex8TiRzEHeCVHBwM541Vzi6bm2G6IgGgeWB3ddXrScUoZGokg5m6mNnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346973; c=relaxed/simple;
	bh=l3rUcdzjsa+Ovha8T1PL3XlqiloNM85j+lWMvSSyUtw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FjwSchOP88vt1IYk/za+cjOrrKAqlH3Tpmxd/C0PpEqNJO4bBQpXB7E+02wpMPR9hHODZ1IVdshT70a1Sow+n2MxBHOabI11iXaNJHyIoJXzNYxls2gcCjugh41EndBcIwt5c9XlOmaY/7bLNDhmSDem6YwnRIchAAe6sV/gwIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bD+aE/3I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bD+aE/3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08EA1F00898;
	Mon,  1 Jun 2026 20:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780346972;
	bh=nmwrgE1bgm3kpzH9rmehTon5/PMPAPRXpIMFAAiQxQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bD+aE/3IjYwRxXSwpVxZ6lTv5w80haDfquu+DtjK8hL0EHyA/FVZtJzKvwM0Jvzj0
	 gZw2fGYOWANpK4pj9218Iq2ezTex0l5RiumdNZmRdrmxDQHagGL3cufokPWu5qD6nK
	 1vYyJbnRX1p/br7oeq3o+Ufhf76H0lc/ED/V+HDRGxnkjc6c/VMIHfU7E9SWLfChSM
	 N0YHb9fY5+MQWlmdoizlM/WhTZ86EsXz+Xt9gpsqhFn37Aos5lUhjVR8WQSNEsKwsv
	 Z+ldhQOx7ZQHjQBrljbynlJnUBMbTNB9Utwb1uMMIjZnXINc3FFDFtDKQeAxwd0GqH
	 nTBwqdUGsF9Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 09/18] riscv_cbqri: Add bandwidth controller
 probe and allocation device ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-9-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-9-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:49:31 +0000
Message-Id: <20260601204931.F08EA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Sentinel verification in cbqri_read_rbwb() and cbqri_read_mweight(=
) spuriously fails with -EIO if the hardware's initial boot state matches t=
he inverted software cache default.
- [High] Software enforcement of the sum(Rbwb) <=3D MRBWB hardware invarian=
t is bypassed because the software cache ignores the initial hardware state.
- [High] Modifying a single bandwidth control field on an unconfigured RCID=
 silently overwrites the other field with an artificial software default.
- [Medium] cbqri_read_rbwb() and cbqri_read_mweight() perform a read-modify=
-write on the staging register without waiting for the controller to be idl=
e.
--

commit f4fbfec6ae3d51a8ce03e8b1e0e495abb3ac6e4d
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: Add bandwidth controller probe and allocation device ops

Add support for CBQRI bandwidth controller (BC) discovery and the two BC
allocation control knobs. Rbwb is the number of reserved bandwidth
blocks per RCID. Mweight is the weighted share per RCID of the remaining
unreserved bandwidth.

> diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devi=
ces.c
> index c44bc50c31bab..6093706b1ec45 100644
> --- a/drivers/resctrl/cbqri_devices.c
> +++ b/drivers/resctrl/cbqri_devices.c

[ ... ]

> +static int cbqri_apply_bc_field(struct cbqri_controller *ctrl, u32 closi=
d,
> +				enum cbqri_bc_field field, u64 val)
> +{
> +	u64 rbwb =3D ctrl->rbwb_cache[closid];
> +	u64 mweight =3D ctrl->mweight_cache[closid];

[ ... ]

> +	/*
> +	 * Wait for BUSY=3D0 before staging. A read-modify-write to the
> +	 * bc_bw_alloc staging register while an op is in flight can corrupt
> +	 * the unmodified field.
> +	 */
> +	if (cbqri_wait_busy_flag(ctrl, CBQRI_BC_ALLOC_CTL_OFF, NULL) < 0) {
> +		pr_err_ratelimited("BUSY timeout before staging bc_bw_alloc\n");
> +		return -EIO;
> +	}
> +
> +	cbqri_set_bc_bw_alloc(ctrl, rbwb, mweight);

[Severity: High]
Since rbwb_cache and mweight_cache are seeded with software defaults (0 and
FIELD_MAX) rather than the true initial hardware state, won't staging them
here overwrite the unmodified field's hardware state on the first
configuration?

For example, configuring Mweight on RCID 0 might silently overwrite its
hardware-initialized Rbwb value with 0 from the uninitialized cache.

[ ... ]

> +int cbqri_apply_rbwb(struct cbqri_controller *ctrl, u32 closid,
> +		     u64 rbwb, bool check_sum)
> +{
> +	u32 i;
> +	int ret;
> +
> +	if (rbwb > U16_MAX)
> +		return -EINVAL;
> +
> +	mutex_lock(&ctrl->lock);
> +
> +	if (check_sum && rbwb > 0) {
> +		u64 sum =3D rbwb;
> +
> +		for (i =3D 0; i < ctrl->rcid_count; i++) {
> +			if (i =3D=3D closid)
> +				continue;
> +			sum +=3D ctrl->rbwb_cache[i];
> +		}
> +		if (sum > ctrl->bc.mrbwb) {

[Severity: High]
The rbwb_cache array is zero-initialized at probe, but the commit message
notes that hardware seeds RCID 0 with mrbwb - (rcid_count - 1) at reset.

Does calculating the sum from the unsynchronized software cache falsely pass
this check when configuring a different RCID to a large value? This might
allow the true hardware sum to exceed MRBWB.

[ ... ]

> +int cbqri_read_rbwb(struct cbqri_controller *ctrl, u32 closid, u64 *rbwb=
_out)
> +{
> +	u8 mweight_sentinel =3D ~ctrl->mweight_cache[closid];
> +	int err;
> +
> +	mutex_lock(&ctrl->lock);
> +
> +	/*
> +	 * Stage a sentinel into the unread Mweight field. A silent
> +	 * READ_LIMIT no-op (status SUCCESS but staging not refreshed) leaves
> +	 * the sentinel in place, while a real read overwrites Mweight with
> +	 * the hardware value, which differs from the inverted cache sentinel.
> +	 */
> +	cbqri_set_bc_bw_alloc(ctrl, ctrl->rbwb_cache[closid], mweight_sentinel);

[Severity: Medium]
In cbqri_apply_bc_field(), there is a wait for the BUSY flag to clear before
staging to prevent corrupting the register during an in-flight operation.

Should cbqri_read_rbwb() and cbqri_read_mweight() also wait for the BUSY fl=
ag
before calling cbqri_set_bc_bw_alloc() here?

> +	err =3D cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closi=
d);
> +	if (err =3D=3D 0) {
> +		if (cbqri_get_mweight(ctrl) =3D=3D mweight_sentinel) {

[Severity: High]
The mweight_cache is seeded to 0xFF at probe, making mweight_sentinel equal
0x00.

If the hardware's initial boot state is also Mweight=3D0x00, a successful
READ_LIMIT overwrites the staging register with the true hardware value
(0x00). Can this legitimately match the sentinel and cause a spurious -EIO
failure?

[ ... ]

> +int cbqri_read_mweight(struct cbqri_controller *ctrl, u32 closid, u64 *m=
weight_out)
> +{
> +	u16 rbwb_sentinel =3D ~ctrl->rbwb_cache[closid];
> +	int err;
> +
> +	mutex_lock(&ctrl->lock);
> +
> +	/*
> +	 * Stage a sentinel into the unread Rbwb field so a silent READ_LIMIT
> +	 * no-op is detectable, mirroring cbqri_read_rbwb().
> +	 */
> +	cbqri_set_bc_bw_alloc(ctrl, rbwb_sentinel, ctrl->mweight_cache[closid]);

[Severity: Medium]
As mentioned above, does this read-modify-write operation also need to wait
for the controller to be idle before calling cbqri_set_bc_bw_alloc()?

> +	err =3D cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closi=
d);
> +	if (err =3D=3D 0) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D9
