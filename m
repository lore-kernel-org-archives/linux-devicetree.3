Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9B42BE035
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385253; cv=none; b=roZthGIk4vx76+S6Agt6Ou9J2Htfp8QMwMCEsPDD27dr0XsFyYTSxvPQfIEuSrj00C3M5qyXJ7rm86geuzAWqlpYeRrp7MflQMeg6j+BYUOOe8vbt9ZvozKLBwYRgwQ10PTz85ohlsPHyPzgKIKDkpkDWa5q35EB/GPIxE919xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385253; c=relaxed/simple;
	bh=qV+vRs+jC6CsUL4gr5HztVL7qh3ikcowt1bSPFB/GCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JEGCUl3eg7WPwDThE03ezeNG70ktEsVM85/M+dBcOrFTxx9Sb3IrBvoBbRI49qWRSWNMMjrtXuh5HMbzjZcFwRvYhpsf0ObjyvTAfonnweqIS4Puw1aExScpo6j/edJ+4hdfZksNa3HLCXob9onlZTMEX8jy/wIs9DBEApjg74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzVWJXzn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzVWJXzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADACB1F000E9;
	Thu, 25 Jun 2026 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782385252;
	bh=6pkvCbJQG9wgnPpzMYe1gW0IJKCCY8T6gbhyWk2msZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzVWJXznrrzNfxPW+asKDeZnyxE0wphUF8WwwiQfsVKeabDhkkLjJGMJZVrB6ukkv
	 4pNcYxcKyPQGuOhtvS+hiP4oX0x4nkJJITa2gABn3uQ8WvkD1C1b9skycQ7og+LFdo
	 imhcC2POcpJ74ErpR41C8jC0SNX3/IsnfVmAA6EG8811kqedhYiUmCuW5s4MGoWI8L
	 NuEJrAr1A1+s/QU2WaLkBPqKFDwpco0g6je22LsnUkKw4g4d+sgf34kcyRcz2361Yo
	 KOwgEBAtUBiVzhhne5+P5wzeJ7JBSYc2SEy4DnKuY5DY1hxcD5ByuDFnI0daIg04nt
	 Acfj2URz9yswQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-3-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
 <20260625-enable-byte-cntr-for-ctcu-v19-3-8fbbf22e8381@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:00:50 +0000
Message-Id: <20260625110051.ADACB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error handling path in `__tmc_probe()` at the `out:` label unc=
onditionally accesses `drvdata->csdev` and attempts to register the crash m=
etadata interface, leading to NULL pointer dereference, error pointer deref=
erence, or Use-After-Free.
--

commit 0e2c5d1f36c04454695412377951547f5c57c845
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/h=
wtracing/coresight/coresight-tmc-core.c
> index bc7dd676da473..4b40b692be4d8 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c

[ ... ]

> @@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct res=
ource *res)
>  		idr_init(&drvdata->idr);
>  		mutex_init(&drvdata->idr_mutex);
>  		dev_list =3D "tmc_etr";
> +		drvdata->sysfs_ops =3D &etr_sysfs_ops;
>  		INIT_LIST_HEAD(&drvdata->etr_buf_list);
>  		break;
>  	case TMC_CONFIG_TYPE_ETF:
> @@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct res=
ource *res)
>  		desc.subtype.link_subtype =3D CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>  		desc.ops =3D &tmc_etf_cs_ops;
>  		dev_list =3D "tmc_etf";
> +		drvdata->sysfs_ops =3D &etb_sysfs_ops;
>  		break;
>  	default:
>  		pr_err("%s: Unsupported TMC config\n", desc.name);

[Severity: High]
This isn't a bug introduced by this patch, but looking at __tmc_probe(),
is it safe to unconditionally call the crashdata functions at the out: label
if probe fails?

If an error occurs during probe (for example, coresight_alloc_device_name()
returns NULL, or coresight_register() returns an ERR_PTR), the code jumps
to out:

out:
	if (is_tmc_crashdata_valid(drvdata) &&
	    !tmc_prepare_crashdata(drvdata))
		register_crash_dev_interface(drvdata, desc.name);

is_tmc_crashdata_valid() then attempts to access drvdata->csdev->dev:

drivers/hwtracing/coresight/coresight-tmc-core.c:is_tmc_crashdata_valid() {
    ...
	/* Check for valid metadata */
	if (!mdata->valid) {
		dev_dbg(&drvdata->csdev->dev,
			"Data invalid in tmc crash metadata\n");
    ...
}

Will this cause a NULL pointer or ERR_PTR dereference if drvdata->csdev
hasn't been successfully registered?

Furthermore, if misc_register() fails, coresight_unregister() frees csdev,
potentially leading to a use-after-free. If register_crash_dev_interface()
succeeds on an error path, could the driver core subsequently free drvdata
via devres cleanup, leaving a dangling pointer in the global miscdevice lis=
t?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-enable-byt=
e-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com?part=3D3
