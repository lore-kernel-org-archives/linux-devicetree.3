Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A633659FD
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379545; cv=none; b=MfZ8rkgvJ/jTr1wu/rIZUplmiYDvKTQpKNqzQg9eV7+bw9TVtL6kYYHPALqXaVwXUpu9MDh1aM1s1ZI0eN/dr4phvoWR5gfbO3ncycDwOnl7dGL9Q+CoccMHBWqcKAOG3O4GDphf7x0q1qInIupttoFCp/889QylChwSaAi8G5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379545; c=relaxed/simple;
	bh=4DAybK3Bd8iOAfjXyJ5uPKTmTakg4El3TRFtvev7uG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TOVIK5/JZgCmdG+t7IXIKt/Go56etNjBY+0Gt4C0KeE+B6QsUQcQ8IZXyFMe++nezx/ceP6i/Xw2dtjwhk5RyQ7sv5we7uyTZWrT0JY/Y+TeShEeksc0EEbSSICw5KxwFIDN3jnnBavWGEWM8/Ke9d7SSJ9NCqZejs2cd4DJ324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGjODlja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGjODlja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0DC1F000FF;
	Mon, 14 Sep 2026 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379543;
	bh=kffnon1t3kZOZgN9DHPWhLWuvLd4jNzV0K921lHJ7AQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YGjODljasB9XC+SM4+XtgKwSL1dFEZ4k4/fqLmHa2dLvwa8Du/tdJfR3Do+YWkcWk
	 wSuUfFWqt4QqS2LEvgxIc7pTcR6ZBB5FaWj7nW8ZZWrIyjX8Z9aDkIHkqkLTS+VmJb
	 vWQARaJo0+jyCWUNRrY6NaaChGmfYhO2zS1rFdIN2h5k4lydNLXl9DcZxQZDG3TLMT
	 Xbk+M+CLpo6ZlaDkouuBVgOwzgv7UlPnxlSe6IMOO/sJ77XpjIUo5QX+dOdQFvzEC5
	 WRatgQIyIdGuPxpLwXnSfeVhcO1yqo+FM13pGtYtqwLGSe7iOB5WKZp9wIlzaaAOUU
	 f7ljE4aftQ21w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 05/10] arm_mpam: Add device tree support for MSC
 probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-5-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-5-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:52:23 +0000
Message-Id: <20260914095223.7E0DC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The function `mpam_dt_parse_resources` leaks the error code from `=
of_property_read_reg` if a child node lacks a `reg` property, incorrectly f=
ailing the entire MSC probe.
- [Medium] Unbounded recursion in `__mpam_get_cpumask_from_cache_id` allows=
 a maliciously crafted Device Tree to cause a kernel stack overflow.
--

commit d6b10a65ae0592bb7895e72b5e2dca5d7b5f1fe9
Author: James Morse <james.morse@arm.com>

arm_mpam: Add device tree support for MSC probing

This commit adds device tree discovery for Memory System Resource
Partitioning and Monitoring (MPAM) Memory System Components (MSCs). It pars=
es
MSC nodes, computes cache-id and affinity, and creates RIS entries.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index c68135ee0ffcb..7a5b27e877594 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
[ ... ]
> @@ -161,6 +164,171 @@ static void mpam_free_garbage(void)
[ ... ]
> +/* Called recursively to walk the list of caches from a particular CPU */
> +static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node=
 *cache_node,
> +					     u32 cache_id,
> +					     u32 cache_level,
> +					     cpumask_t *affinity)
> +{
> +	int err;
> +	u32 iter_level;
> +	u32 iter_cache_id;
> +	struct device_node *iter_node __free(device_node) =3D of_find_next_cach=
e_node(cache_node);
> +
> +	if (!iter_node)
> +		return;
> +
> +	err =3D of_property_read_u32(iter_node, "cache-level", &iter_level);
> +	if (err)
> +		return;
> +
> +	/*
> +	 * get_cpu_cacheinfo_id() isn't ready until sometime
> +	 * during device_initcall(). Use cache_of_calculate_id().
> +	 */
> +	iter_cache_id =3D cache_of_calculate_id(iter_node);
> +	if (iter_cache_id =3D=3D ~0U)
> +		return;
> +
> +	if (iter_level =3D=3D cache_level && iter_cache_id =3D=3D cache_id)
> +		cpumask_set_cpu(cpu, affinity);
> +
> +	if (iter_level < cache_level)
> +		__mpam_get_cpumask_from_cache_id(cpu, iter_node, cache_id,
> +						 cache_level, affinity);

[Severity: Medium]
Could a maliciously crafted or cyclic device tree cause unbounded recursion
here? If the device tree contains a circular reference in the cache hierarc=
hy
where the levels remain strictly below cache_level, it looks like this could
result in an infinite loop and a kernel stack overflow.

> +}
[ ... ]
> +static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
> +{
> +	u64 ris_idx =3D 0;
> +	int err, num_ris =3D 0;
> +	struct device_node *np;
> +
> +	np =3D msc->pdev->dev.of_node;
> +	for_each_available_child_of_node_scoped(np, iter) {
> +		err =3D of_property_read_reg(iter, 0, &ris_idx, NULL);
> +		if (!err) {
> +			/*
> +			 * ris_idx is read as u64 but indexes a 4-bit RIS selector
> +			 * (0..MPAM_MSC_MAX_NUM_RIS). Reject out-of-range values here,
> +			 * before it is narrowed to u8, so a large value cannot be
> +			 * truncated into a valid-looking index.
> +			 */
> +			if (ris_idx >=3D MPAM_MSC_MAX_NUM_RIS)
> +				return -EINVAL;
> +			num_ris++;
> +			err =3D mpam_dt_parse_resource(msc, iter, ris_idx);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	if (!num_ris)
> +		err =3D mpam_dt_parse_resource(msc, np, 0);
> +
> +	return err;

[Severity: High]
Does this leak the error code from of_property_read_reg() if the last child
node processed lacks a reg property?

If the device tree contains a valid RIS node (with reg) followed by an
auxiliary node (like opp-table), err becomes non-zero (e.g., -EINVAL) and
leaks out of the loop block. The if (!num_ris) fallback is skipped because
num_ris > 0, and the function returns the leaked non-zero err. Could this
incorrectly fail the entire MSC probe?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-mpam-resct=
rl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com?part=3D5
