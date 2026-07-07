Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D0420876
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444379; cv=none; b=hDyGy9l+L7mF6EyaVBBPOvEWKb9j86DGW/TVZtRhoWu6cimSoI+KE/1k6rpNi+liExjeYJ25YV+lMCBtmDqRUSBC9aWT4hgCEW8GhewsgKl3kfhAAXCTAIDMRQ1NoS56xPVDzt1QRx16A4e8f4DmaogkGQB3jDCLDqobBIT9DRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444379; c=relaxed/simple;
	bh=gCda8F041h8Gf8YS1dDzHEa6zxixxqW5g/NqR7DPrWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u7FWfGhZW4xsWERZqYE6XaiQ8rEB8bSoC8ypmFqRKCjRuXptUm5B8z7h4UWLO4SH0DTVrI2aAn+2yrm4Md2nmpgg6vp98zo0JF62I5ty85gwPjqEgbI2zfIOR9SXbWWdoy/xi4Fkx4WFlD9TEAfWTtUiMQCSBUMfdS2Edy4t4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWSDL5Cc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWSDL5Cc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA641F000E9;
	Tue,  7 Jul 2026 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783444378;
	bh=qvn1EaAiIhXgfqqpbmC8BAALN/wGNLdo/zyRbqId+Xs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QWSDL5Ccl5c3h9eiENAQ1rTMbKTyBlP0179aU3+f713IV6amebn0i0vNeEQnXJBYS
	 /aBBGfghewGFVJeYX12UI4sfcD0giI5vdtFGWJt0z/8Ic1rNUD97gBzyJm021LZli8
	 vkhew50jPaM+ECxAo+Wxr01WM0cNxxz14dH0zRHRKGcfMl8uJfvWnWy+CYq2XMa1Lg
	 jJ+BdwGTHdtJknloG1r2HtMM/5YfEFOLOFSaATN/8n6+9+4tfV73wncGrKpW1s+HtD
	 SBhUSmxQzG6d6JEeorgRaitfo0k9ptN6LubCBE3Vx2gMEhpRfoeU5wVh6hRObm8jKg
	 u4p3ELs0S+9dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/20] media: imx355: Set register LINE_LENGTH_PCK
 programmatically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-media-imx355-v2-6-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-6-1683ec07b897@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 17:12:57 +0000
Message-Id: <20260707171258.3AA641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The arguments `len` and `val` are swapped in the call to `imx355_w=
rite_reg()` for `IMX355_REG_LLP`, causing streaming to fail unconditionally=
 with `-EINVAL`.
--

--- Patch [6]: [PATCH v2 06/20] media: imx355: Set register LINE_LENGTH_PCK=
 programmatically ---
commit 0e41a9d7ebe7908de03f784b605b040468271935
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx355: Set register LINE_LENGTH_PCK programmatically
   =20
This commit removes duplicated Line Length Pixel (LLP) values from the mode
register lists and sets the LLP register programmatically when starting
the stream.

> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 363b5667b6c9a..66e70650e666b 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c

[ ... ]

> @@ -1058,6 +1033,13 @@ static int imx355_start_streaming(struct imx355 *i=
mx355)
>  	if (ret)
>  		return ret;
> =20
> +	/* set line length */
> +	ret =3D imx355_write_reg(imx355, IMX355_REG_LLP,
> +			       imx355->hblank->val + imx355->cur_mode->width,
> +			       2);

[Severity: High]
Are the len and val arguments swapped in this call to imx355_write_reg()?

If the line length value (which can exceed 3000) is passed as the len
argument, won't this unconditionally fail the bounds check in
imx355_write_reg():

drivers/media/i2c/imx355.c:imx355_write_reg() {
    ...
    if (len > 4)
        return -EINVAL;
    ...
}

and return -EINVAL, effectively preventing the camera from starting?

> +	if (ret)
> +		return ret;
> +
>  	/* Apply customized values from user */
>  	ret =3D  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-media-imx3=
55-v2-0-1683ec07b897@raspberrypi.com?part=3D6
