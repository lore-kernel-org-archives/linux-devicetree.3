Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315663AE704
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019511; cv=none; b=piNJpgcYMM7+ZuOzetiKShntdhG2gjJF4ViT4eQs8HnptYQpkqlGPWLf2xHuBC08oIuhLEp/5EpCDV7vxRmRBmZkhlVmFowBmbIGf3gUercQSZQnmFRLwUeZ9I0jpsVk8bF8eqamZQLoJQq1n9uX/DPrCvdNwzhzpGgUgUqYvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019511; c=relaxed/simple;
	bh=y9h1im/jnXeqPTiK2M3AC1QUCYkicur3yCIiMGWp5FU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ei72nIMQ/wUcrqEZ3/9nm/ScX8HMpvHk4uVszKTqk8cj6Pg2ZdP429k1VgqJpUtIMc6ApZRhmY99jJyGq6fxKhonQO1tH6B8FWVByn7ztw8DyPtWpOZ6SXrNRRgz3cxkeHIbZY1oVSoZ1JZgbWrF427+uG9PmR6ibI9xVdbagjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7mdQryq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7mdQryq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5A11F000FF;
	Mon, 21 Sep 2026 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790019509;
	bh=jU+O1pD92+y8U5ljoHi2GXcig9vcZbsMAnHGgYRM1bQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q7mdQryqWx1qU/b/hDAgPBfUHt1oMICQNTtaIvhDBW16J4c/Dywdu6WUCriO+Qy6t
	 Xt9rxH/YAZ6Th4CLcPyzNnfIVgiElkWRqkR2GWSyyw8HpH/eLw/gJ3mZVpwelu8jkd
	 X4lEvOmuC92OneAcQiLSguGQdhcaexnKU45SflDXZ6bi7fhpNC0Bvwkcl5QiQNXsbd
	 14DXuH7XbHyU3YBCXcDmRyzxQOefHAx+8sXjfvS856mXeVtJxzu5zC2lDBco7edSyv
	 PdphkNJqSar4zwnNcfHs6C57BWCnqpl9B7yjaCbNxMBeYjCXL+LrvVOgydwvCyj4wA
	 VHMp73/oJxAUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] media: i2c: Add Sony IMX681 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260921192450.21811-3-lsa.uz@pm.me>
References: <20260921192450.21811-1-lsa.uz@pm.me>
 <20260921192450.21811-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 19:38:29 +0000
Message-Id: <20260921193829.8C5A11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: i2c: imx681: non-atomic control updates due to missing cl=
uster
--

commit acaa5eee3740a4ac3a0c239fabfd5d066ae26848
Author: Andre Gilerson <andre.gilerson@gmail.com>

media: i2c: Add Sony IMX681 sensor driver

This commit adds support for the Sony IMX681 sensor found on Intel Lunar La=
ke=20
devices like the Surface Pro 11. It configures the sensor using=20
reverse-engineered I2C sequences and exposes controls via the V4L2 API.

> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> index 0000000000000..825d8c80a29b8
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c
[ ... ]
> +static int imx681_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_FRAME_LENGTH,
> +			  IMX681_HEIGHT + ctrl->val, &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);
> +		dev_dbg(imx681->dev, "set frame_length: %d, ret=3D%d\n",
> +			IMX681_HEIGHT + ctrl->val, ret);
> +		break;
> +
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x01, &ret);
> +		cci_write(imx681->cci, IMX681_REG_EXPOSURE, ctrl->val, &ret);
> +		cci_write(imx681->cci, IMX681_REG_GROUP_HOLD, 0x00, &ret);

[Severity: Medium]
Does this break hardware atomicity during control updates?

The group hold is toggled independently for every control modification. If a
frame readout boundary occurs between these separate I2C transactions, could
the sensor latch a partial state, causing image tearing or brightness glitc=
hes?

[ ... ]
> +static int imx681_init_controls(struct imx681 *imx681)
> +{
[ ... ]
> +	/* Exposure */
> +	imx681->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     IMX681_EXPOSURE_MIN,
> +					     IMX681_EXPOSURE_MAX, 1,
> +					     IMX681_EXPOSURE_DEFAULT);
> +
> +	/* Analog gain */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  IMX681_ANA_GAIN_MIN, IMX681_ANA_GAIN_MAX, 1,
> +			  IMX681_ANA_GAIN_DEFAULT);
> +
> +	/* Digital gain */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx681_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  IMX681_DIG_GAIN_MIN, IMX681_DIG_GAIN_MAX, 1,
> +			  IMX681_DIG_GAIN_DEFAULT);

[Severity: Medium]
Are these related controls missing a call to v4l2_ctrl_cluster()?

Because vblank, exposure, and the gains are instantiated but never clustere=
d,
the V4L2 core will invoke imx681_set_ctrl() sequentially for each individual
control rather than passing them as a single atomic update.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921192450.2181=
1-1-lsa.uz@pm.me?part=3D2
