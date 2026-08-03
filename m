Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FF733CE88
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755217; cv=none; b=JZ2GVSRICCBdVowKegJAEEDzDG6kCrj+i2mKBlnqIBoGE0ogXq/XpyYzvs2lYXiA/56Qzht7JSEhJIEzkeH/u2o4NumODK+AhPjCmmYSChAzlxID6KQM89GP3O1TsLewXcyIbjAaQN8FE+IOM/kWC0qZg1HcwY89NBr0ECmYo3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755217; c=relaxed/simple;
	bh=9n7OBu01+i/Z9qhO1CdACMwvvPuAYYBdWhR5j731mLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n1sZp1k/9msjvlG81LwNkIfNbdpJ2TI1qUbIxftmCggZ9tcWaAJCTXHljh5AOAlve8EQt6yV0j7MTYIytZOe9pqxinCCt0Xuf06bdctCAyqF1kYYgFVhiYObGHV44uAECT3ZdqTmBNSCppWHYChC4gGmcJOhBM9K/TASXK9RnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhSr7FDh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhSr7FDh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590AD1F000E9;
	Mon,  3 Aug 2026 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755215;
	bh=O4Ef1Fs/5DVOg8PlXvq5qgL6VB7FIcQ3hLkj8Tumltg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NhSr7FDh14cFHgGTPwj2Xghh8yQL3lTFTN/BcxSXO9uo+pYM62nslpor1pJsfJrJf
	 obR5qz1VRinaG+vWXoJ5mSELAC6j+AA+zGeJfUkI2RZOUDtGdEWM1zRcCiuZxR/1Wk
	 e5N+iDeS3m2jWlKpDWoaaSMnarJ9/XRA/w49buuRrxSaEoAsg/RZmWg9N9E7W57aUl
	 hkY97GqkC026ZcEPWR+8w1yWyd/eXSGKe1sWxfh67GWHs02k7e9IPDpW6quelA4CD7
	 6Flnx5Rq0nCDfLBwjAIjtcqpwziqOJBd4Dx1C6fz0fUpp+dnFO1KsttrjuzqYd47Ia
	 KKJzoxDJrpU1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 11:06:54 +0000
Message-Id: <20260803110655.590AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Teardown asymmetry between `devm_rproc_add` and manual `remove` cl=
eanup causes subdevices to skip shutdown routines and causes lockless list =
corruption.
- [High] `wcss_sec_copy_segment` silently returns on `ioremap_wc` failure, =
corrupting the devcoredump with uninitialized memory or zeroes.
- [Medium] Permanent `ioremap_wc` mapping leak during coredump segment read=
ing due to unreachable unmap condition.
- [Medium] Error paths in `wcss_sec_dump_segments` permanently leak previou=
sly added custom coredump segments.
- [Medium] Missing NULL check on `of_device_get_match_data` during driver p=
robe.

Pre-existing issues:
- [High] Unconditionally calling `qcom_remove_ssr_subdev()` on uninitialize=
d subdev causes a kernel panic if `qcom_add_ssr_subdev()` failed silently.
--

--- Patch [3]: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS sec=
ure PIL driver ---
commit f96fb4a46b22ed73d132da71366a2ebbfe51729c
Author: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: remoteproc: qcom: add hexagon based WCSS secure PIL driver

Adds support for a Hexagon-based WCSS secure PIL driver for IPQxxxx SoCs
using TrustZone (TZ) for authentication and loading.

> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc=
/qcom_q6v5_wcss_sec.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
[ ... ]
> +static void wcss_sec_copy_segment(struct rproc *rproc,
> +				  struct rproc_dump_segment *segment,
> +				  void *dest, size_t offset, size_t size)
> +{
> +	struct wcss_sec *wcss =3D rproc->priv;
> +	struct device *dev =3D wcss->dev;
> +
> +	if (!segment->io_ptr)
> +		segment->io_ptr =3D ioremap_wc(segment->da, segment->size);
> +
> +	if (!segment->io_ptr) {
> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
> +			&segment->da, segment->size);
> +		return;

[Severity: High]
If ioremap_wc() fails, this returns early without populating the userspace
buffer. Because it returns void, the devcoredump core assumes the copy
succeeded.=20

Does this cause the framework to leak uninitialized kernel memory
(if not zeroed) or zeroes to userspace, silently corrupting the coredump
instead of gracefully failing?

> +	}
> +
> +	if (offset + size <=3D segment->size) {
> +		memcpy_fromio(dest, segment->io_ptr + offset, size);
> +	} else {
> +		iounmap(segment->io_ptr);
> +		segment->io_ptr =3D NULL;
> +	}

[Severity: Medium]
Because the remoteproc framework bounds the read size such that=20
offset + size <=3D segment->size is always true, is this else branch
mathematically dead code?

During cleanup, rproc_coredump_cleanup() frees the segment structure but
lacks a hook to unmap the custom io_ptr. Could this permanently leak vmalloc
space on every crash dump?

> +}
[ ... ]
> +static int wcss_sec_dump_segments(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	struct device *dev =3D rproc->dev.parent;
> +	struct reserved_mem *rmem =3D NULL;
> +	struct device_node *node;
> +	int num_segs, index;
> +	int ret;
> +
> +	/*
> +	 * Parse through additional reserved memory regions for the rproc
> +	 * and add them to the coredump segments
> +	 */
> +	num_segs =3D of_count_phandle_with_args(dev->of_node,
> +					      "memory-region", NULL);
> +	for (index =3D 0; index < num_segs; index++) {
> +		node =3D of_parse_phandle(dev->of_node,
> +					"memory-region", index);
> +		if (!node)
> +			return -EINVAL;
> +
> +		rmem =3D of_reserved_mem_lookup(node);
> +		of_node_put(node);
> +		if (!rmem) {
> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
> +				index, num_segs);
> +			return -EINVAL;

[Severity: Medium]
If an error occurs midway through the segment parsing loop, does returning
early here leave previously added segments on the rproc->dump_segments list?

The remoteproc core's rproc_fw_boot() handles a parse_fw() failure by jumpi=
ng
directly to unprepare_rproc, bypassing rproc_resource_cleanup(). Will any
segments successfully added in earlier iterations be permanently leaked?

> +		}
[ ... ]
> +static int wcss_sec_probe(struct platform_device *pdev)
> +{
> +	const struct wcss_data *desc =3D of_device_get_match_data(&pdev->dev);
> +	const char *fw_name =3D NULL;
> +	struct wcss_sec *wcss;
> +	struct clk *sleep_clk;
> +	struct clk *int_clk;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	ret =3D of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0)
> +		return ret;
> +
> +	rproc =3D devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
> +				 fw_name, sizeof(*wcss));

[Severity: Medium]
Is a NULL check needed for the return value of of_device_get_match_data()?

If the driver is bound manually via sysfs to a platform device with a
compatible of_node that lacks match data in the driver's table, it could
return NULL and cause a NULL pointer dereference on desc->ss_name.

> +	if (!rproc) {
[ ... ]
> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
> +
> +	rproc->auto_boot =3D desc->auto_boot;
> +	rproc->dump_conf =3D RPROC_COREDUMP_INLINE;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret =3D devm_rproc_add(&pdev->dev, rproc);
> +	if (ret) {
> +		qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);

[Severity: High]
This is a pre-existing issue, but if qcom_add_ssr_subdev() fails (e.g., due
to -ENOMEM), it returns early and leaves ssr->subdev.node zero-initialized.

Later, unconditionally calling qcom_remove_ssr_subdev() here during probe
error handling (or in wcss_sec_remove() below) invokes list_del() on the
zero-initialized list head. Can this dereference a NULL prev pointer and
cause a kernel panic?

> +		qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
> +		qcom_q6v5_deinit(&wcss->q6);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	return 0;
> +}
> +
> +static void wcss_sec_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc =3D platform_get_drvdata(pdev);
> +	struct wcss_sec *wcss =3D rproc->priv;
> +
> +	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
> +	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);

[Severity: High]
Because rproc_del() is deferred to devres cleanup (after remove()),
does manually removing subdevices from rproc->subdevs here while the rproc
is still active skip their .stop callbacks?

Since they are no longer in the list when rproc_del() executes, it seems
this leaves GLINK edges active and dangling for a powered-off remoteproc,
potentially corrupting the GLINK state machine and freeing structures still
in use. Should the subdevices be left for rproc_del() to clean up?

> +	qcom_q6v5_deinit(&wcss->q6);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-rproc-v14-=
0-a1f87b0b0ad2@oss.qualcomm.com?part=3D3
