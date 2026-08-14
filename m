Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708D92737F9
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786684929; cv=none; b=PHFdm5141ym+irJgOpxmkt10a25yf9wcFplt1W2UcysCSRBFoAuLrTUp/DFoG3HTQHeVGK72CGcuvEogBzmtPj+r1qdo6GEEmh0N8468R7xCy+HiQu07s7vIqQ4dm8KE++01CuIEr1Z82eiO5kkDdvhsk3wWB8taz4/mUo0BPAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786684929; c=relaxed/simple;
	bh=c7koO6nT+Ho+y/dMCCC3NGw5MPZ+oygRxYJSdswr+SE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6HupZFE3x3oHI1ZtVBKQ4qHysLb0TmSN24MVoi/FI8st9LjtvFyjwj6X8Cn0gXx55vokkidst/24gByje3Iws/kNYf9bFpUp9WCy3HIddfj6uO5FNr/rdB5UK+gixwEZvCn4qbTvWax/GTTJ7qpjz3YmjxU5MHg0fLX7t9jWq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3f+n18f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3f+n18f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB591F000E9;
	Fri, 14 Aug 2026 05:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786684928;
	bh=6a6P7CsSBem5EZ6nRrdno+qrJxbQ7T6Q1QTl9N8EXYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3f+n18f5SrihziYzRDCddGQlhY0Wa19tQZWrHWIvaGaw6rNnIZSkDfZ+8Q/ywDd2
	 r+89LFMpA46z5rcU4vT75sDNRGgO+oOzOjF8XzAQQHL3GInIbAbwWz/PLWlCbKrXO9
	 PvX1cH5HypK0H+dKuLn/xbehLvsWgyVt321E/8xfn73PXU4QNmnktMwORcbQuNLN63
	 kOWPDYrDm38BFGxxSSvdXj07YMriJTR6b5Ay8o0ErBS+kt/bLVMZXY88DxU+2xmiiw
	 4NHlxdWNeXKXTm+QZHS7aBicmtOPI3xCP3DodelhPOqDE25tjMvj+lDkjKi+q0oS0S
	 eCcEIuP29784A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 29/38] usb: dwc3: rockchip: introduce glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 05:22:06 +0000
Message-Id: <20260814052207.8CB591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unconditional assignment of conditionally compiled `.complete` and =
`.prepare` PM callbacks in `dwc3_rockchip_dev_pm_ops` causes a build failur=
e when `CONFIG_PM_SLEEP` is disabled.
--

--- Patch [29]: [PATCH v14 29/38] usb: dwc3: rockchip: introduce glue drive=
r ---
commit 09abcbc065934ad4bfba3499b24e1bd888881c9d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: rockchip: introduce glue driver

Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
For now this handles things identical to the default glue.

> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-roc=
kchip.c
> new file mode 100644
> index 0000000000000..1df33625b69f8
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
[ ... ]
> +static void dwc3_rockchip_complete(struct device *dev)
> +{
> +	dwc3_pm_complete(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_rockchip_prepare(struct device *dev)
> +{
> +	return dwc3_pm_prepare(dev_get_drvdata(dev));
> +}
> +#endif
> +
> +static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
> +	.complete =3D dwc3_rockchip_complete,
> +	.prepare =3D dwc3_rockchip_prepare,

[Severity: Low]
Will this cause a build failure when CONFIG_PM_SLEEP is disabled?

The functions dwc3_rockchip_complete() and dwc3_rockchip_prepare() are
defined inside an #ifdef CONFIG_PM_SLEEP block, but they are referenced
unconditionally here in dwc3_rockchip_dev_pm_ops.

This would leave them undeclared if sleep support is not configured.

> +	/*
> +	 * Runtime suspend halts the controller on disconnection. It relies on
> +	 * platforms with custom connection notification to start the controller
> +	 * again.
> +	 */
> +	SET_RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runtime=
_resume,
> +			   dwc3_rockchip_runtime_idle)
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D29
