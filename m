Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A0D38333C
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832876; cv=none; b=CZqZ9/5IplWGn6W+4tHRWnJseP2RAL1sSSK2Rc9077uPbWY9O9xkuNqZT+JDlQh8/0+ngyePghiz+wwEZve2hMQbzP8TXzGzlg7RDG5Z0zZVMd454y24zWwjYtpbV5HqioGAU64RGEsu9be7nud1bCVjICGDNZewR/brgQM8rW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832876; c=relaxed/simple;
	bh=aGGcxn3RKYlEq+8itpcdsHDx2umDhnd0BbWPpLlze4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s+/uwK4Hjg6iWafr0gjYbwRfVH40r3isbcpsC5wQFoCPCWOifPPdtc1wEi/+6fvgYs9m9F6bc1tH97FTbwQKZbzXpxLYMc6h2GXkSX2P3E+KzzRhWXVsQO0bz9axGAEmK1mrP2XygbRO71oerB4LhsuZiG77zlMaxneJ+9Xr0Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEGJwPYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEGJwPYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A681F000FF;
	Thu,  1 Oct 2026 05:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790832874;
	bh=v+B81aWIsFCxZ73y1FY6vFm8s2Kn5BeSWinajFICL1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cEGJwPYNVzSq/CxUfyXgCawRK0u/VmE84aW4+hIcrFEjnXHUNz1nCOfT4XDO9rIKe
	 7gcdwzSi5wxf73PYBxEEklOeccRdrm6MwZblc31hDVw4a17VqHO8fEMHuDSJauHah6
	 4f62K2qsBFwzamBleqfiSndBQC2a+COOs75wihdQZSxlR3YCTaWt/q/MixhPcKo0Xh
	 iRFRi08ttvaYlQEwy6Pirq8MnXGnx9CtbK3sHY9l2ZkXd9Q4n53w0NiNA/EzFmSN9e
	 +1EMNW1VgbntqhfOk24wH5JhZXCmiQz4cA/0P3BZIodc5C5vWzSH7QudOp0LDWRuIR
	 CgUsxnPkNO8Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:34:34 +0000
Message-Id: <20261001053434.A2A681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gtrace: missing INHIBITSRC restore in rvtrace_encoder_start()
--

commit 89ac751d2a47352255588950ac5d611d8f1d501f
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add RISC-V Trace encoder driver

This commit adds the initial implementation of the RISC-V E-Trace encoder
driver. The encoder generates trace data for its bound CPU as defined in the
RISC-V Trace Control Interface specification.

> diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtraci=
ng/gtrace/rvtrace-encoder.c
> new file mode 100644
> index 0000000000000..1f06b1a2b4128
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c

[ ... ]

> +static int rvtrace_encoder_start(struct gtrace_component *comp)
> +{
> +	struct rvtrace_encoder_priv *priv =3D dev_get_drvdata(&comp->dev);
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	int ret;
> +	u32 val;
> +
> +	if (priv->srcbits)
> +		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
> +
> +	ret =3D rvtrace_encoder_set_format(pdata);

[Severity: Medium]
Does this skip restoring the INHIBITSRC bit when priv->srcbits is 0?

If the device loses context (for example, during power state changes when t=
he
component is disabled and re-enabled) and tracing is started on a CPU where
source ID tracing is unsupported, could the hardware emit trace packets with
uninitialized or garbage source IDs?

During rvtrace_encoder_probe(), INHIBITSRC is explicitly set when
priv->srcbits is 0:

	if (!priv->srcbits) {
		...
		val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
		val |=3D BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
	}

Should rvtrace_encoder_start() also restore this state to ensure complete
hardware state initialization?

> +	if (ret) {
> +		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
> +		return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D6
