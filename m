Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2E23C9ED8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051347; cv=none; b=JeX7b+N+b83Uwxp9KYILyDV9XZ3hLXfJDeAtbXRkd7VsiH4KyvJL3VhI27uH0zUUyjUPyzAMenkGTvIUPpLzDhczzRaqyEminsWwoN0LVTTPQA5UYF18RNSrG0/Zq/ln391a09Ytlj2lWNPhTFjjYSpSnHN4Q9eQFFMw914LZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051347; c=relaxed/simple;
	bh=Zsgc+BqLYpuiAiCcVvfIXq4u03YSeaJN2sAxgpEJFVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SSyTWT/LSPIXsIyt4XfgY4OPvKpON1y/eco338l/j1AtwwxDxEX6zpQ3xsnaJszGV+MrMsPBDdmBN4NTJrzGbvcregerwOe2zlP8cFN7HwlD3OFsZtje4ACpGrDV5FnbcBESw4806MJrPRZn7vqOWYnhgJDLmrMfVQtxLdfI7FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEc3ITm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEc3ITm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B69C1F00893;
	Fri, 29 May 2026 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780051345;
	bh=Pl9XxylcL6nAoDywoLgipUXIJ0PjtOOP4xqgBYEe3Kw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gEc3ITm2AScrBXxZt96N4TvJAD0geOo6umMbN80ZB/MGnBLHooa9NC0FuQSrpdip4
	 0MT2DiDhxWgFo2WYrFMS6Rd6djH5jkGZL+fhRUG2UgOnOxrnFqJvKmZUEg3Y3X5drF
	 W+VFX7FjNVDA9q50WROjDrlNmjWO7lEiWGKF5ajobQFK54sVH8NE/6P0WyzLZAsxMn
	 oh6YiD815WVORqwdKxF7kyoU9dAy09VBYu+/SUX9tOSKC4EghO+F5AGWNzzLD+9y/U
	 8mG7jP9D1BYtxkrXOK8dT7XCj1r269Inr89rSDbiVZd24n6f7hFXtRVW6yARhim719
	 4sL4Zor6B0uCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/10] ACPI: APEI: GHES: move GHESv2 ack and alloc
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-3-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-3-2e0500d42642@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:42:25 +0000
Message-Id: <20260529104225.8B69C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The EDAC driver (`ghes_edac.c`) iterates over the global `ghes_dev=
s` list without holding `ghes_devs_mutex`, allowing concurrent modification=
s by `ghes_probe` or `ghes_remove` to trigger a use-after-free or list corr=
uption.
--

commit ad8109c2f93ccdccb9336458af1f3ae8d0777528
Author: Ahmed Tiba <ahmed.tiba@arm.com>

ACPI: APEI: GHES: move GHESv2 ack and alloc helpers

Move the GHESv2 acknowledgment and error-source allocation helpers from
ghes.c into ghes_cper.c. This is a mechanical refactor that keeps the
logic unchanged while making the helpers reusable.

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 7bb72fe578384..8080e0f76dac4 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c

[ ... ]

> +void ghes_fini(struct ghes *ghes)
> +{
> +	kfree(ghes->estatus);
> +	apei_unmap_generic_address(&ghes->generic->error_status_address);
> +	if (is_hest_type_generic_v2(ghes))
> +		unmap_gen_v2(ghes);
> +}

[Severity: High]
This is a pre-existing issue, but since we are refactoring the GHES allocat=
ion
and cleanup helpers here, I wanted to ask about the synchronization around =
the
global ghes_devs list when a device is removed and freed.

The EDAC driver (ghes_edac.c) iterates over the global ghes_devs list witho=
ut
holding ghes_devs_mutex. The function ghes_get_devices() returns a pointer =
to
this list without acquiring the mutex or exporting it, and ghes_edac_init()=
 and
ghes_edac_exit() iterate over it using list_for_each_entry_safe() without
locking.

If a user concurrently unbinds a GHES device via sysfs or hot-adds one while
the ghes_edac module is loading or unloading, ghes_remove() will acquire the
mutex, remove the device from ghes_devs, and eventually trigger the free pa=
th.

Since list_for_each_entry_safe() does not protect against concurrent list
modifications by other threads, could this lead to a race condition resulti=
ng
in list corruption or a use-after-free when the GHES object is destroyed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-topics-ahm=
tib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com?part=3D3
