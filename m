Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D623E6DE8
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861330; cv=none; b=BPlrGbZJLf/7/Wl0qlYfICcKeaP02+exXr7dqNzF7NfAEGNyVLGWOkXfBUkdZlot897BwJEG2OWKdouzU/r+FgeT4ERy42vh2mxX+TC5G8Jpt10OmMBXosVpnp93M9fKcgU1AGx4DtU6EgPfPpUtG4zRfcsScpcv3sArJpJOT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861330; c=relaxed/simple;
	bh=mZM3GmZxNy1cEJVNordhmvIi9iMJqxQH2aPhhvYFv5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VKk5tj4uHbWxz4N6Xg4f0BJbUgj7g0xRiuv0L3LqFu1S2MQmMRJ1fxx9l766MVUhcUepaD7RO40EIhLQfUUZ+CIGih9mS5CbR9So/h1gZ1bjpvluO0+HIYnyPjcFCMPCZqD9/SYexiRzJ/wQWDTtDqHRtNsX2nSt0o4quP3/zqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeA8kQob; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeA8kQob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C861F00A3A;
	Tue,  8 Sep 2026 09:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861328;
	bh=TGh0rqNlUbLUNP2OEXuXLblDrqZBJCbfO9qelD2EYXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XeA8kQoboiziMAHOs5mOtY3RNKqWXicPKcsjdaauUcFyjeQy6291S75n667NykVj3
	 0Kf9sjoJgBAnI8g+X56LMTSj4l6bVmK/AMfnjU5GrrRE336+VZGKTX7ewI9avgdquC
	 KVdOCDyV9k+oHJ66Iy2CM4VL72MwvkrsAZItTPnnNHqUpL/RvyDvq5zwfD+b97/p/t
	 urtrfO79YorzzQULVFEK1Knfufge/wqpAXgEL5H1krn1OCVjaPJykIgnaOuiYHPoCY
	 N5MMFT/TrAF6Zra3Bbk0PhOtIqioFbH3GsqhyD1W87439G3oFmE9kuH9limyZ5vDx/
	 z3dadT+mW9SYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-3-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-3-f07342ffa051@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:55:28 +0000
Message-Id: <20260908095528.85C861F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double disable and unprepare of the clock during device removal.
--

commit d2e0018bd6f14cd49dfa6012d83048e3abde69f6
Author: Junzhong Pan <panjunzhong@linux.spacemit.com>

usb: chipidea: usb2: use devm_clk_get_optional_enabled()

Convert devm_clk_get_optional() and clk_prepare_enable() into a single
call devm_clk_get_optional_enabled().

> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/c=
i_hdrc_usb2.c
> index 8ffa1e95d8e86..6fae2d4a053a1 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
[ ... ]
> @@ -99,10 +94,6 @@ static int ci_hdrc_usb2_probe(struct platform_device *=
pdev)
>  	pm_runtime_enable(dev);
> =20
>  	return 0;
> -
> -clk_err:
> -	clk_disable_unprepare(priv->clk);
> -	return ret;
>  }
> =20
>  static void ci_hdrc_usb2_remove(struct platform_device *pdev)

[Severity: High]
Does this conversion also require removing the manual cleanup in
ci_hdrc_usb2_remove()?

Since the clock is now managed by devm_clk_get_optional_enabled(), it will
automatically handle disabling and unpreparing the clock when the device
is removed.=20

Leaving the manual clk_disable_unprepare(priv->clk) in ci_hdrc_usb2_remove(=
):

static void ci_hdrc_usb2_remove(struct platform_device *pdev)
{
	struct ci_hdrc_usb2_priv *priv =3D platform_get_drvdata(pdev);

	pm_runtime_disable(&pdev->dev);
	ci_hdrc_remove_device(priv->ci_pdev);
	clk_disable_unprepare(priv->clk);
}

appears to result in a double disable and unprepare of the clock during
device removal, which could lead to unbalanced reference counts and trigger
kernel warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-b4-spacemi=
t-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com?part=3D3
