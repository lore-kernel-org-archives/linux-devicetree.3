Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4DA2F5313
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044685; cv=none; b=Nh2yWv6vAizAb9SOy+alXV2MnUjC861Jopy2NevifiDCwoZvSOl5D1nRuyVLOhO5aGHPvATLe0M7G056tzAJgdhGyPvM5bE/2kc47vNnVtDfJzwh7/IPQ1PJMCQRJg8i5faNtgMY87QOjmVkX9jwibBspg3XMgqxRROMilToj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044685; c=relaxed/simple;
	bh=xbHunPgxyH0POKnTaTlXT4hTOfPcF59J3AfJf3q+0Kc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O5JcxmLyGdOoPkwOQX0I3iK5hvtgmFcgDBZsBpFyvf6Bb3S3zO8WemV3hIQHOyuXHuhOJTId3czsF+jxCsC7S+BKEADXquFPcnbLhujjlJ3e6sjnjWm4o/ckFBlnTtspZEfoUnoy6/xnN40fDJgQ+cbx5O+UZUB4h0dJtg4wxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1Lkt+TI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1Lkt+TI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10C4C2BCB0;
	Sun, 17 May 2026 19:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044684;
	bh=xbHunPgxyH0POKnTaTlXT4hTOfPcF59J3AfJf3q+0Kc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=O1Lkt+TIMXdZIz4zYIUPD2K+MH76rz9RpP9vhnHYg3bRYg5/Zxtp+K2IdUrGnqevD
	 rGSm7tkbbybj3VAaRDNJqo+bLm3E080IP73p4g1WZTwQVr9Nv/4JQtZe9UxOt77VxH
	 P/JaaYnHa3OW7gS/dZhExWrbvyRR7EDfatiOtibegJ5yxGZId5RWc6gDBKn/PFLxWY
	 CqL01lkjUUlrvs60RVDiWbnQnIjnW2WX4CKX8QxOuYoyvYChMOf8MVohLhodY0VVxg
	 XcCjJq9CEVsGuSATsJrEKnfMbDOxlv2u7jtikSCQHgCVPvfwD7FxA9zXoR3cqEeyZ2
	 VBYOWGuKDUTdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/13] iio: core: validate file offset in
 iio_debugfs_write_reg()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260517-ad9910-iio-driver-v5-1-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-1-31599c88314a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 19:04:43 +0000
Message-Id: <20260517190444.A10C4C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `*ppos !=3D 0` check introduces a functional regression for se=
quential writes, masking the true bug which is the inappropriate use of `si=
mple_write_to_buffer()`.
- [High] Unpatched uninitialized stack memory reads in other IIO drivers ca=
used by the identical anti-pattern.
--

commit 7c5ddbc34738b9e84e226b9906348d61e3569bf4
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: core: validate file offset in iio_debugfs_write_reg()

This patch adds a check to ensure that the file offset is zero in
iio_debugfs_write_reg() before calling simple_write_to_buffer(). This is
intended to prevent leaving the start of the buffer uninitialized if a write
occurs at a non-zero offset.

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index bd6f4f9f45330..e587aca79b8e7 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -419,7 +419,7 @@ static ssize_t iio_debugfs_write_reg(struct file *fil=
e,
>  	char buf[80];
>  	int ret;
> =20
> -	if (count >=3D sizeof(buf))
> +	if (count >=3D sizeof(buf) || *ppos !=3D 0)

Does this cause a functional regression for sequential writes?

If a user writes multiple commands to the same open file descriptor, for
example using (echo "cmd1"; echo "cmd2") > direct_reg_access, the first
write advances the file position. This means *ppos will be non-zero on the
second write, causing it to fail with -EINVAL.

Before simple_write_to_buffer() was introduced, the code used
copy_from_user() and ignored *ppos, correctly treating every write() call
as a distinct command starting at the beginning of the buffer.

Since simple_write_to_buffer() is designed for stateful linear memory buffe=
rs
rather than stateless command endpoints using local stack arrays, would it =
be
better to revert the use of simple_write_to_buffer() entirely and use
copy_from_user() or strndup_user() to parse each write independently?

Additionally, does this leave a similar pattern unpatched in other IIO
drivers?

While this patch addresses the issue in iio_debugfs_write_reg(), the same
pattern of using simple_write_to_buffer() into a local stack array still
exists in other locations:

1. iio_backend_debugfs_write_reg() in drivers/iio/industrialio-backend.c
2. ad3552r_hs_write_data_source() in drivers/iio/dac/ad3552r-hs.c

Both functions use simple_write_to_buffer() into uninitialized local stack
arrays without checking *ppos.

Furthermore, ad9467_chan_test_mode_write() in drivers/iio/adc/ad9467.c
uses the same pattern. While the buffer is zero-initialized there,
sequential writes will still be functionally broken.

>  		return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-ad9910-iio=
-driver-v5-0-31599c88314a@analog.com?part=3D1
