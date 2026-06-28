Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C687261A
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782677546; cv=none; b=oiBIdsAkYEuzw/wyyx6ycfqmoPH/3c6QB7mQnWQeu7D1XRsTx6MPnqpNtxnhJABF5UV+O3Ylle4nqUNuWVUcOiQ80QSKSGcphX2hcqPYYOjTCgu9yC0zR5IU09JwZGOECtfeln2fRNN6oq1XdhwW12AteyIAaAAR+EfZNrk+yU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782677546; c=relaxed/simple;
	bh=CIAVZ94nlb5rTXOGzyjjceEUtCbwgr2exHoHjG5THj0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VI/YGwzhm4rS6kFA+hYfcyqiIlBi3jkrAapOGIqWKfCZ77OKx/TmdscSYV6PYyyxEG52xF3B/STWjcREGtsiWeNbVBp5MbEyeh0vHi4fe06ZJ4gSfHAlvJAogczisBA/uDmBxiSnx3MEg37eFyptc98ppBHZiWJxqZyqu0Iehus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzsE37is; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzsE37is"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3E71F000E9;
	Sun, 28 Jun 2026 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782677544;
	bh=iH6iRs2SqZSMDX9kUcpTrhySAt9DRhr+by1l+54VVy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KzsE37is/LLXDjxWqQb18f2DLakqJn7i1JwnXovkOE5FKYDRBCF9XnS2oPbRkvBqm
	 nSA9+ALYlWwIPfFUHCagwEuxcxGj5ogjlS/Qy5c9A5LRiLHdWit/C+ZvLpNUCuMd/A
	 DWnTQon0zWhfmOE+Xpx0y2KeJqY1LgUuYwfLsgo4qbLGew8q/IfquOBN6ok2qBxty/
	 Ir00XV5IT2AIQ6uy2JIiggQ+YGwDBZM9IFYtBjkVYvrJ6HqfZjEfonegWyev6HTpCf
	 H60zBHDzU3kZOdbp3muTd+dRoHEijwZmciHpJZl/hp3CYRCk91ywYQeAuhZcm0ISE5
	 NuSsowg4+plqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 09/12] clk: zte: Introduce a driver for
 zx297520v3 matrix clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260628-zx29clk-v5-9-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-9-79ff044e4192@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 20:12:24 +0000
Message-Id: <20260628201224.9C3E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double free of the `adev` structure in the error handling path of =
`auxiliary_device_add()`.
--

commit a1d3be99b150f10999dcacbb8abe5f5789b34aee
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 matrix clocks

This commit introduces a clock driver for the zx297520v3 matrix clocks.
It registers several multiplexers, gates, and inputs by utilizing the
shared zx_clk_common_probe() initialization routine.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index bb3d64eff9096..17e1f741b48c9 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c

[ ... ]

> +static int zx297520v3_matrixclk_probe(struct platform_device *pdev)
> +{
> +	return zx_clk_common_probe(&pdev->dev, pdev->dev.parent->of_node,
> +				   &zx297520v3_matrixclk_data);
> +}

[Severity: High]
This is a pre-existing issue, but does this error path result in a double
free if auxiliary_device_add() fails during probe?

Looking at zx_clk_common_probe() in drivers/clk/zte/clk-zx.c, the error
path handles a failure from auxiliary_device_add() by jumping to
adev_uninit:

drivers/clk/zte/clk-zx.c:zx_clk_common_probe() {
    ...
    res =3D auxiliary_device_add(adev);
    if (res) {
        dev_err_probe(dev, res, "Failed to add aux dev %s\n", adev->name);
        goto adev_uninit;
    }
   =20
    return devm_add_action_or_reset(dev, zx_adev_unregister, adev);
   =20
adev_uninit:
    auxiliary_device_uninit(adev);
adev_free:
    kfree(adev);
    return res;
}

When auxiliary_device_uninit(adev) is called, it drops the reference count,
which triggers the assigned release callback zx_adev_release(). This
callback legitimately frees the structure:

drivers/clk/zte/clk-zx.c:zx_adev_release() {
    struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
   =20
    kfree(adev);
}

However, after returning from auxiliary_device_uninit(), the error path
unconditionally falls through to the adev_free label, calling kfree(adev)
a second time.

Since the structure is automatically freed in the release callback, is it s=
afe
to fall through to kfree(adev) here, or should the manual kfree be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-zx29clk-v5=
-0-79ff044e4192@gmail.com?part=3D9
