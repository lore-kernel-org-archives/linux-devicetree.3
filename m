Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08363C8C52
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138314; cv=none; b=EVdMaN3yOp6u0QX9Hy3GTfLJqlet/YdKxSAx80dJwE8Pb6x/R95/qr10LVfkqCPnqSp54oYzhCwkiC1eNhgkBTQLbpTAoPISsHPi6zlIDdYwVs9RvsN2yzmupU+3PJo01YXmhUfJS8tpUQ2mZ0n5NAeT0qy2cyQueVi166z9sCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138314; c=relaxed/simple;
	bh=pIeO8B10qOXXKIiD7nXXOeNfDwemIUPQLGc6h5tUz+0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GRRcmN87LhKQaj/dS6HJNyjLn9V2LtCQd90RD8+Qol7eQ3hpEbEVN2sKgZ5gCnCa373iXxiGEjrjaqCR0JJ/vuBhXlVobMESLgHFW6fEDaMDb4IJc6iryQbB7wsjckNdY+kNcKXLL07ycCw2lhLt+jA76aZIF5BVt1FK1K8/rFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/MyrKze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/MyrKze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49BC1F000C4;
	Fri, 16 Oct 2026 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138313;
	bh=+BLgzgzeamyjz7M882y0mqfYWMJKGPARgbpFaTIgkzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B/MyrKzeIbZq+0tDi8me+3meU/01uagIfn5iewxQX+HItlSDohn8WBWmfSU7W3tWR
	 yQJjS+WHDpcScL1F89mTgsLtRgjE2hEoiglWkqZkwVKK7DtX+yAI0rLNF+bsaciPUa
	 fW11FJunk12v1bT6rAVEsKK8AKCRyUa4b7DdtGlZCjqLAjps86cJJ8C0G42kDbsiTX
	 XoZrOB2HBiY3kRkcaGWPXttiaUPo4MMF9oZa04F7LHX23sgoCoucvyQJvZ09IXmkHT
	 1qqPgajcR6AxcD1+lHZrqHvnj+8qeSYt3Eg+Conrr8lLaLRx5VRU3Sevsua4fG8L9G
	 J8DlFFVxh2XPQ==
Message-ID: <sashiko-outbox-174000@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: Add Sony IMX908 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261016075918.19345-3-lachlan.michael@sony.com>
References: <20261016075918.19345-1-lachlan.michael@sony.com>
 <20261016075918.19345-3-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 08:11:52 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pm: runtime PM usage counter underflow due to unhandled -EINVAL
--

commit 8e82ea0902df5655064466676b372c25f29a3de5
Author: Lachlan Michael <lachlan.michael@sony.com>

media: i2c: Add Sony IMX908 image sensor driver

The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
output interface. The driver supports RAW10 and RAW12 output formats,
exposure and analogue gain controls, image flipping, blanking controls
and test pattern generation.

> diff --git a/drivers/media/i2c/imx908.c b/drivers/media/i2c/imx908.c
> new file mode 100644
> index 0000000000000..4c7e78cfdcc4f
> --- /dev/null
> +++ b/drivers/media/i2c/imx908.c
[ ... ]
> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	/* Hardware writes only when powered; cached ctrls applied on resume */
> +	if (IS_ENABLED(CONFIG_PM) && !pm_runtime_get_if_active(imx->dev))
> +		return 0;

[Severity: High]
Does this logic correctly handle errors from pm_runtime_get_if_active()?

The pm_runtime_get_if_active() function returns 1 when the device is
active, 0 when suspended, and a negative error code (like -EINVAL) when
Runtime PM is disabled.

If it returns -EINVAL, the logical NOT operator evaluates to false. This
causes the safety check to be bypassed, allowing the driver to proceed to
execute hardware writes on a potentially unpowered device.

[ ... ]
> +	if (IS_ENABLED(CONFIG_PM))
> +		pm_runtime_put(imx->dev);

[Severity: High]
If the initial pm_runtime_get_if_active() call failed and returned -EINVAL,
does this unmatched pm_runtime_put() cause a usage counter underflow?

Since the initial get call did not increment the usage counter on failure,
executing this put drops the usage counter below its baseline, corrupting
the device's Runtime PM state.

> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016075918.1934=
5-1-lachlan.michael@sony.com?part=3D2
