Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CDA51354D
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183791; cv=none; b=hWmguKadqQHP4c1UOuUyPaBK6ShnEYBXfmXlB8YsPWavQaXsfNQq9djTN6+AO8gQbBxsyQB9sa3PPhrp61HG3mspVOnmX7a712AxarnpjQ4wEk3uZ0E8gXnk55/piKGlwhuV9QdPaArk5gAMxX6mXPLhJB/pT6mVdAxV58OY7Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183791; c=relaxed/simple;
	bh=9Wrn4Br10O43EhEP+F02rOjcaLlY+u6pqiNeiziJ/pU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KWQbxrU8yeY3r0F9do/JO39KQqvrze9QoJQj2IpWzA6wqemfGr9vAlrIYpK1NIvxXCNh9JEjZ36bemZ/nQV7n8MXOZ+hzhI0TiFakI+kdiLxgZuHuVmxGZlhvc3r1fgjIh6itLNzgErnjY+qtRcPJdpiWzVzMmbiHEXTRbfzsLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Et3VAxec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Et3VAxec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72A21F00ADE;
	Mon, 31 Aug 2026 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183789;
	bh=RSVbl0THlgsxwlI+OpJLVINgMNtTdVTaShZ/O+LpYhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Et3VAxecnLXf/1aoOBfHII4hQrhIO/5zhSd/PDsXKjdWYx3AWNVy5sKmOcXYyoPmx
	 nqYccIpTCX301B3cvVzB/LL1YvpwGlEvhIe20WwvubXDugsPOxbl2sUd/Js6CzPcBb
	 Wv8wX9kkgzDXGkKQmlqQRhs10g76ImpK4f1XJVUifK8cZJ//wSHAyOzj5nSqkiPfks
	 76tO+uyXr7oBhVDQh+7+v4MiFnC1CpetVCynWUWvSSgn18FA8YSo5jmrJHmI2axlw7
	 64bDfGxB3xSiZNPh6N7FAz4nBgK4S0lp1Trs7eCNoxYllKRxpJD8FaZlSxJYciXF1P
	 7yMCczmVJPk3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 18/22] arm64: defconfig: disable deprecated MAX96712
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-18-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-18-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:43:08 +0000
Message-Id: <20260831134308.C72A21F00ADE@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Defconfig regression: legacy driver disabled without enabling re=
placement
--

commit 6b329fadf11a6d29016ff5932914ac8c85161fd4
Author: Cosmin Tanislav <demonsingur@gmail.com>

arm64: defconfig: disable deprecated MAX96712 driver

This commit removes the legacy staging MAX96712 driver configuration from
the arm64 defconfig as part of migrating functionality to the MAX96724
driver framework.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 654a102cb5bc5..a5419f2a4d5ba 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1411,7 +1411,6 @@ CONFIG_GREYBUS=3Dm
>  CONFIG_GREYBUS_BEAGLEPLAY=3Dm
>  CONFIG_STAGING=3Dy
>  CONFIG_STAGING_MEDIA=3Dy
> -CONFIG_VIDEO_MAX96712=3Dm

[Severity: Medium]
Does removing this configuration without adding a replacement result in a
regression for arm64 defconfig users?

The legacy driver configuration is removed here, but no corresponding entry
for the new driver (e.g., CONFIG_VIDEO_MAX96724=3Dm) is added. While the ac=
tual
MAX96724 driver code is added later in this patch series (in the patch
"media: i2c: maxim-serdes: add MAX96724 driver"), the defconfig is never
updated to include the new CONFIG_VIDEO_MAX96724=3Dm configuration in any
subsequent patch.

Should CONFIG_VIDEO_MAX96724=3Dm be added to maintain out-of-the-box support
for these devices when building the kernel using the default arm64 defconfi=
g?

>  CONFIG_VIDEO_MESON_VDEC=3Dm
>  CONFIG_SND_BCM2835=3Dm
>  CONFIG_CHROME_PLATFORMS=3Dy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D18
