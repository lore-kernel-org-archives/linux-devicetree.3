Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D79203710
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546094; cv=none; b=iUDi54aDa5Uvb1HzWQ3Bc8po1KV16btTxdbWc2+1hzIlvuROuPR/wnAS3Su62wHVSh1AQge239684dFqQT+1g5eIvJI38cYSAZH77/tRJ1emfdSeeTRvccQmykRbA5mj2lGCFDpOB5R7EjxoJ+uigkZ+ySXbzVqp7ZUJ8D5rw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546094; c=relaxed/simple;
	bh=MvgFVox4X+bFt/a73eLQoYRfu7ryvYphG3su7pryYXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cDSik1zJs5kwR0FD2cGSTVXgBkX8G5rGpfJjnwQiHY8qivQwftQZHbF3wtL2PXQX0r7NCyoL+CULds+Z8+pe5qxNlQnVbZ7fE4xMxD36rZn/P8hVR6KcwUOUoRKyNLmuHS99tvDsHFDv3297LW/zk2f6SXQPpzNy8xwem4OlHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvrJWu8u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvrJWu8u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07714C2BCB0;
	Tue, 12 May 2026 00:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778546094;
	bh=MvgFVox4X+bFt/a73eLQoYRfu7ryvYphG3su7pryYXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VvrJWu8uadEiBhSjcpHAjwmc+X86m5kawe6ePmYMRp9WXDyK9Rne5QnnzhRghgEj9
	 YHN2jGUawlAWn4x8lxfn/keYSG7RhGCmx/CHVCh2AgJkymFa38FDHVW2Gvpeu1hKmu
	 ZJ9mwtOsNOC2laWIDOdi1VbEUMemhBFUmBDRxWuifwZdjBr/8jgwYJsbkzTgoVwHIj
	 i0he6dLIcdwI6S5WAxJAXt4Nca3FHuo2xu48De/hS0kO3Lz8A7CrM6i7yGc7Z7+8+E
	 UuIF4IlUeqGcHPGxrk8HHPaDnTNoy4A4DuJvHHlKTSBrFAwMGBpLP9oPm2Q9wgGX7z
	 n/uDLEE+Vv4zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/8] media: qcom: venus: Add msm8939 resource struct
Reply-To: sashiko@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260510-msm8939-venus-rfc-v6-7-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-7-e69465375900@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:34:53 +0000
Message-Id: <20260512003454.07714C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Non-monotonic frequency table causes scaling inversions and dead c=
ode.
- [High] Clock rate array aliasing leaves `vcodec1_core` unscaled.
- [High] Missing PM domain detachment causes a resource leak on probe failu=
re/unbind.
--

commit 568a6ece0caefd3f300b18b1d182b85169c54db9
Author: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

media: qcom: venus: Add msm8939 resource struct

This commit adds configuration data and the related compatible string to
support the msm8939 platform in the venus media driver.

> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -688,6 +688,46 @@ static const struct venus_resources msm8916_res =3D {
>  	.enc_nodename =3D "video-encoder",
>  };
> =20
> +static const struct freq_tbl msm8939_freq_table[] =3D {
> +	{ 489600, 266670000 },	/* 1080p @ 60 */
> +	{ 244800, 133330000 },	/* 1080p @ 30 */
> +	{ 244800, 200000000 },	/* 1080p @ 30 */
> +	{ 220800, 133330000 },	/* 720p @ 60 */
> +	{ 108000, 133330000 },	/* 720p @ 30 */
> +	{ 108000, 200000000 },	/* 720p @ 30 */

The freq_tbl algorithm in load_scale_v1() iterates sequentially over this
table and stops when mbs_per_sec > table[i].load.

Since there are duplicate load thresholds here (e.g., 244800 and 108000),
does this ordering cause scaling inversions and leave the 133.33MHz entries
as dead code?

For a load of 108001, the loop breaks at the first 108000 entry, falling
back to the previous frequency (133.33MHz). However, for a lower load of
exactly 108000, it continues past the first entry and breaks at 72000,
acquiring the higher 200MHz frequency.

> +	{ 72000, 133330000 },	/* VGA @ 60 */
> +	{ 36000, 133330000 },	/* VGA @ 30 */
> +};

[ ... ]

> +static const struct venus_resources msm8939_res =3D {
> +	.freq_tbl =3D msm8939_freq_table,
> +	.freq_tbl_size =3D ARRAY_SIZE(msm8939_freq_table),
> +	.reg_tbl =3D msm8939_reg_preset,
> +	.reg_tbl_size =3D ARRAY_SIZE(msm8939_reg_preset),
> +	.clks =3D { "core", "iface", "bus", },
> +	.clks_num =3D 3,
> +	.vcodec0_clks =3D { "vcodec0_core", "vcodec1_core" },
> +	.vcodec1_clks =3D { "vcodec0_core", "vcodec1_core" },

Are both clock arrays intended to have "vcodec0_core" at index 0?

The dynamic frequency scaling logic in core_clks_set_rate() applies the
required frequency explicitly to index 0 of both arrays:

    clk_set_rate(core->vcodec0_clks[0], freq);
    clk_set_rate(core->vcodec1_clks[0], freq);

Because "vcodec0_core" is at index 0 for both arrays, this sets
vcodec0_core twice and leaves vcodec1_core unscaled.

> +	.vcodec_clks_num =3D 2,
> +	.vcodec_pmdomains =3D (const char *[]) { "venus", "vcodec0", "vcodec1" =
},

Because previous V1 resources did not define vcodec_pmdomains, the domain
attachment in vcodec_domains_get_v1() would return early.

Now that this patch populates the array, will this cause a PM domain
resource leak on probe failure or driver unbind?

The corresponding teardown function core_put_v1() is currently empty and
lacks a call to dev_pm_domain_detach_list() to clean up the domains
attached by vcodec_domains_get_v1().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-msm8939-ve=
nus-rfc-v6-0-e69465375900@gmail.com?part=3D7
