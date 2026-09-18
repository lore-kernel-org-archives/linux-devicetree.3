Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF74FD7A1
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739384; cv=none; b=JG34x4TRoBaLcYdxC7ZwxFDdIJ22qXvqrLAwTr5jyTJ44MV3vHfqH5k87zJ5KhTXs9+/yYFQLFU6CpKimUDYpTQR9r66WC0lNMyq/9UEVsDFgkXUQ8b1Nu3qUG7FNjAbKf+2VaT+9b3zdTNdFpP0zAPzf24k17vmUVcNnlgoe4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739384; c=relaxed/simple;
	bh=S+cNavR9tRjNouSPq/wSZ2n19mDT4SR+RGcF1AqJ4sk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F+dkdIakA23CpOl9PGMnau1XnEVDmMNIYI04rjCOjfRm+x04i/Gmq/umGBzaEANqdl7xtSsb7lwISiIwHTjkYvKeCwI+xbQ7Af5lWFhdr7kwrv/d/MyfKrA7AtcyJfqGN1W97kBDSh80EbwQdWdqh64nAdu1Le6Mr1H23Pc8XFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4MwS6Lb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4MwS6Lb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555421F000FF;
	Fri, 18 Sep 2026 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739382;
	bh=tFP71qRyM9r13dPZfx3ayBqIsuYiF6ILM9MD8bXLdE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P4MwS6LbEdC4fHp/QZ7UZBpdY3+OxNfpQnzz6X0lFRteLs0z5/oTES+Su+pGpoz4R
	 z8tFi72Q2WtiZQKi5UPIrqVXKY44ARdf++EzBJIU1LKe/+C6a2aZnMfbDvEhw5kyEG
	 oiK1+oVzf3zECfocfttyG30ahu7ggl1HHBC0bY9xyF9dFP7SMeI3AdMSx/OlBJZhaM
	 XpPLCVBaTXuFoxo41ikh7nGnR9iJs+ewrwdzr5I3m9nQGDSoGVjNvppZ1u+oAwFqhQ
	 dwD2F7tHRPMPW/vyq14vxfDE+OawS+pVTdVu4ZsbB+eJ3aY6s4I4CowC7fnw96KM9B
	 9E/cY24SdTiOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/8] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918131914.681588-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:49:41 +0000
Message-Id: <20260918134942.555421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] sdca_class: code and commit message mismatch for pm_ops export
--

commit 43543cd6fb0171b62979b93506768ae9a2b2e709
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: export PM helpers keyed on sdca_class_drv

The class PM callbacks pull sdca_class_drv out of drvdata, so the
built-in class_sdw_driver owns the drvdata slot. This blocks codec
drivers that want to embed sdca_class_drv in their own private struct.
Split the four callbacks into exported helpers that take a
struct sdca_class_drv * directly.

>     For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
>     fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
>     the ops so any generic SDCA slave can pick them up as-is.

> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
> index d7444f442c71c..a092ebaa620aa 100644
> --- a/sound/soc/sdca/sdca_class.c
> +++ b/sound/soc/sdca/sdca_class.c
[ ... ]
> @@ -265,10 +283,37 @@ static int class_runtime_resume(struct device *dev)
[ ... ]
> -static const struct dev_pm_ops class_pm_ops =3D {
> -	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
> -	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
> +static const struct dev_pm_ops sdca_class_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
> +	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
>  };

[Severity: Medium]
The commit message states that sdca_class_pm_ops is exported so generic
SDCA slaves can pick it up as-is, but it is defined statically here without
an export macro.

Will developers attempting to write a generic SDCA slave in another file
encounter build or linkage errors when trying to reference sdca_class_pm_op=
s?

Should this struct be exported to match the commit message description?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918131914.6815=
88-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
