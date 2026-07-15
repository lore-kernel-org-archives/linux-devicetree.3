Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E24483A6
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119078; cv=none; b=Az/xqYGWi477RU/snJX0DOtKCP1EOHWXYsYqJq/e2QIVpTnIKj7hFEtktt8VQEFgoS2h3HKbEluQG2+HRXDXVNK3dGxL1goevDiJ8KUvoT8TeZfS9cyJjgaDXpgjE0cdLhrywkx+MjLqZ3jHy+zk7TVbZFHly3oqV4gMhNud/mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119078; c=relaxed/simple;
	bh=O58IE09pzkCIvaUDLolDY+r5FEp/twWDEI4dynEQaM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IgWx45+XyVGJFHvEiCRAS/xRltYv8ZIO4ivunuGVlrU6He+4Mny8FfXTBwFz+x1VQhj+IsqRdiT89/Srd7z5z4czL55vdjTgsSpBUxaqp5gt8A628bjZvCVmt0Pq1p3p0mhUDqbX8D7bjIun5JMbv2TA8k49Pf8dHB2ffQG5skM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+qWXIgK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+qWXIgK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84F31F00A3F;
	Wed, 15 Jul 2026 12:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784119076;
	bh=lqnYpx/66U3Gj8SvG9ZerRWPGB3W41aZW68KaxyLBAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+qWXIgKM6fTbbV4DO6YxBYHDlQmX0SGR4lIKOG1gNWlQa1/8lbfyd7LkYiFOV6y6
	 RG3fZakelME8EgEiWUMWFACYSc6aR5RanHwfx0YjugVibn56ocLb9iuKeJ+s/XMuRq
	 0H3dlmgXEWh6qM2oEVh2HuvV+BVrY2WmNNmU6a6Akuga+bX/JvwyWrpsV9MSUoyO0n
	 OnXvbXrrzcCjX5u6aP6qx4dcYQHzPl9LtsnV01h9cdEJ7q69CBwdxdRIJ2RDpUvCm3
	 4h+jIqpQyrZoA/xcdAG6n/tIYul8q+ihoBz5LMNmA3E3da2gkA41QirS17euHKleuy
	 VHKLQlGgYDoWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: iio: light: ltr501: Add missing
 ltr303 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-liteon-ltr329-v2-1-d18af55edab5@geanix.com>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
 <20260715-liteon-ltr329-v2-1-d18af55edab5@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:37:56 +0000
Message-Id: <20260715123756.A84F31F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Triggered buffer reads will always time out and fail for ltr303 (a=
nd ltr301) when the IIO timestamp channel is enabled.
--

--- Patch [1]: [PATCH v2 1/4] dt-bindings: iio: light: ltr501: Add missing =
ltr303 compatible ---
commit 0ab668b54a0d483bbb8920d0f07259a66c763c55
Author: Esben Haabendal <esben@geanix.com>

dt-bindings: iio: light: ltr501: Add missing ltr303 compatible

This commit updates the device tree bindings for the ltr501 driver to
include the liteon,ltr303 compatible string, which was missed when driver
support was added in 2021.

> diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.ya=
ml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> index c8074f180a793..ab9bb68dd7363 100644
> --- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
> @@ -18,6 +18,7 @@ properties:
>        - liteon,ltr501
>        - liteon,ltr559
>        - liteon,ltr301
> +      - liteon,ltr303

[Severity: High]
This isn't a bug introduced by this patch, but could making this compatible
string valid expose a pre-existing timeout issue in the driver?

Looking at ltr501_trigger_handler() in drivers/iio/light/ltr501.c, the code
hardcodes a check for bit 2 in the scan mask to wait for proximity data:

if (test_bit(2, indio_dev->active_scan_mask))
        mask |=3D LTR501_STATUS_PS_RDY;

Since ltr303 (and ltr301) are ALS-only devices without a proximity sensor,
bit 2 actually maps to the IIO timestamp channel. If a user enables the
timestamp channel, will the driver wait for LTR501_STATUS_PS_RDY?

Because the hardware never sets this ready bit for an ALS-only variant, it
appears ltr501_drdy() would hit its 2.5-second timeout on every trigger
and return -EIO. Is a fix needed in the driver to properly handle the
timestamp channel for these variants?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-liteon-ltr=
329-v2-0-d18af55edab5@geanix.com?part=3D1
