Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62855237B9
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961356; cv=none; b=g6ChQYoPDdn8nkTESg+K+OHAJOFyeEpPlVB0t899jdOrd52ZdYPQHKYFNiSNi55kgh/aYUuQ5OOo/bYeU6GFPLUCi45fYpJzaCqBvtfN5a8rNC8NOUTvoz0wai9frZtRcsEj+VGpB/POhzyuI2RgXNPm5cxdXYpoMvU9qWJgvYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961356; c=relaxed/simple;
	bh=xqSQiGUnGoPB4o6qBpJhWJxtAQYbHPMVujKXGbQdBng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OysLuW2MtcxdMMDjQKmFJakmJ9qG7hHJSCjwU94GsZX/dCVXShOPHmLbFaa9uubB6kkHInDYbRx6oedCFqjOVvwc/4NNJuJqR1pP97wsmQbkCvAtteP2LDf+WeAoDmgnxWcAvTI145/4ndTLEcakmNT+wlFS/cvyOyioF3XUgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXZ3R9TS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXZ3R9TS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6BA1F00A3A;
	Wed,  9 Sep 2026 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961354;
	bh=2jOLa8pfbmS7Wr+2x/heW7KafUtPmCidgBCLkzUW5zI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXZ3R9TS5n8cTEwzYa4a0IhGxm8kLx87gP4vCJgfMSNYopqNgniMAfxGr8gxo5neK
	 NI0ZfgMRmBVeqhGxo0QRvTzdNW1tsI5a6GdvXn7jrKEFmH/sTcYdxZK882MaSeYNU6
	 1vU//GiJT/KpXlzC4pytUdebS8OUvPAvgI+EiWfS3Hk22v9FrVNvDd0FD+yqyuqrqA
	 NlsQvNgceAXJ0rtE8nzBCfsLMZIX0BjUljDrG+kBYuZiMFLu13WziAsimlZ2VTN+HT
	 eRj4cAD7IvDfk3+OGFeuf8pa+a06R9QCd/0x8sqqlN8ZXR45mfQPOR98cgJTtHbOJi
	 9Rc2hEGW9moFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 18/22] arm64: defconfig: disable deprecated MAX96712
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-gmsl2-3_serdes-v17-18-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-18-002499e534e8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:42:34 +0000
Message-Id: <20260909134234.7A6BA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware support regression in defconfig due to missing replacem=
ent driver configuration.
--

commit 6d2a73bbf4a355a233e8e7a8d94395d3c7941765
Author: Cosmin Tanislav <demonsingur@gmail.com>

arm64: defconfig: disable deprecated MAX96712 driver

This commit removes the deprecated CONFIG_VIDEO_MAX96712 from the arm64
defconfig. The commit message states that the driver's functionality has
been moved to the MAX96724 driver framework.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98e..e0bdfffd9c525 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1420,7 +1420,6 @@ CONFIG_GREYBUS=3Dm
>  CONFIG_GREYBUS_BEAGLEPLAY=3Dm
>  CONFIG_STAGING=3Dy
>  CONFIG_STAGING_MEDIA=3Dy
> -CONFIG_VIDEO_MAX96712=3Dm

[Severity: Medium]
Will this cause an out-of-the-box hardware support regression when building
an arm64 kernel using defconfig?

When deploying a kernel built with make defconfig to a board equipped with
the MAX96712 deserializer (such as the Renesas Falcon or White Hawk), it
appears this change will result in lost hardware support. While the old
driver config is removed here, the replacement driver config
(CONFIG_VIDEO_MAX96724) is never added to the defconfig in this patch or
in any subsequent patch in the series.

Could we add CONFIG_VIDEO_MAX96724=3Dm to the defconfig at the same time to
ensure these platforms maintain support for this hardware?

>  CONFIG_VIDEO_MESON_VDEC=3Dm
>  CONFIG_SND_BCM2835=3Dm
>  CONFIG_CHROME_PLATFORMS=3Dy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-gmsl2-3_se=
rdes-v17-0-002499e534e8@analog.com?part=3D18
