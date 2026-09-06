Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826383C1097
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788721179; cv=none; b=NWjpj7905W0suFPeA8COK4ZBWjYjprNQfIzNwS7Q8+/iKjFDpLx/1wwxq2/ro5gW5iYLrSziHRcMPeQASHIGSb6lX9P4LA8KDXUPhQQiKFOy1yWyxYoUOWvioQrLLRtBxk3nG+Ig6w/xRIo9SfYeRaV1aWjI8jYLG6llZakWN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788721179; c=relaxed/simple;
	bh=da7B4mNVRN0vslETvM3WlR76CF+WzEws1FxFdU3/G9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i6C7KBnAaanulyyPtpotmNO3oAJ6uw+vvv0XVlTmLM5R88nkAGHId3ShPRjhAkjoS4E2O9505z4/yJiwTOeaLXL9v+pz7gIlBd5GueI5NO3kYshtdfg4t40WHXbTM6BWkz4QjRM0O8CiEyhBzlfCCW+DVr6v0Gooe7C/vLE4r+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hePy0OyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hePy0OyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50B71F00A3D;
	Sun,  6 Sep 2026 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788721178;
	bh=UdlwAIAISgeu4nK7imhyLOPO5lbHEqAD3trczRCIsNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hePy0OyKAV8at8rKI2U6xErLRQwdtDe971Vqr4QgIc8vxSBXjHloXpWD4VN5iUwBU
	 sedC+girQZjQNnrZWlPqPwa3OIsTr3C1t5MKnmB6JYLQzJw1DOWE85t9fKv3BbLRxv
	 bC5pE9eE7fZsm1x+V7Z63LidMvOmXpAdsPj0hFi+NjZWK8c8qdh3Er/NBG+o2naW3d
	 kg5qcj0RbrXECWOLEnhqDY5ZobIdjQPjdbMhNxSKFCVX9DOw24mLXrY0yIzzbC0u8O
	 sPEpXj/hc6g4cKkD3vj7nqRHDgnxkDuBWKx1xVQtgHNv6fks+hfLIII+9l7Ev3QSsg
	 3mx0KTp7VYRgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:59:37 +0000
Message-Id: <20260906185937.E50B71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Legacy adapter detection logic is inverted, incorrectly setting =
the legacy flag for non-legacy TBT3 adapters.
--

commit 870427df367f711b84dc3079eca08f8a726f8dcd
Author: Sven Peter <sven@kernel.org>

thunderbolt: Add Apple Silicon support

This commit adds a platform driver for the ACIO host router complex and
Native Host Interface (NHI) on Apple Silicon SoCs. It registers notificatio=
ns
for Thunderbolt and USB4 partner modes on the Type-C bus to derive cable
details.

> diff --git a/drivers/thunderbolt/apple.c b/drivers/thunderbolt/apple.c
> new file mode 100644
> index 0000000000000..f4b16f60701e3
> --- /dev/null
> +++ b/drivers/thunderbolt/apple.c
[ ... ]
> +static int apple_cio_tbt_cable_info(struct apple_cio *acio,
> +				    struct typec_altmode *altmode, u32 *cable_info)
> +{
[ ... ]
> +	if (cable_mode & TBT_CABLE_ACTIVE_PASSIVE) {
> +		info |=3D TB_VSE_CAP_APPLE_CABLE_INFO_ACTIVE_CABLE;
> +		if (!(cable_mode & TBT_CABLE_LINK_TRAINING))
> +			info |=3D TB_VSE_CAP_APPLE_CABLE_INFO_BIDIR_LSRX;
> +	}
> +	if (TBT_ADAPTER(altmode->vdo))
> +		info |=3D TB_VSE_CAP_APPLE_CABLE_INFO_LEGACY_ADAPTER;

[Severity: Medium]
Does this logic correctly identify legacy adapters?

Looking at the definition in include/linux/usb/typec_tbt.h, TBT_ADAPTER()
extracts a 1 for TBT3 devices and a 0 for legacy adapters:

#define TBT_ADAPTER(_vdo_)              FIELD_GET(BIT(16), _vdo_)
#define   TBT_ADAPTER_LEGACY            0

Because of the implicit truthy check, this evaluates to false for actual
legacy adapters, omitting the TB_VSE_CAP_APPLE_CABLE_INFO_LEGACY_ADAPTER fl=
ag.
Conversely, it evaluates to true for non-legacy devices like TBT3 adapters,
erroneously applying the legacy adapter flag to them.

Should this check instead be compared directly against TBT_ADAPTER_LEGACY to
ensure the connection is configured correctly?

> +	if (TBT_CABLE_SPEED(cable_mode) =3D=3D TBT_CABLE_10_AND_20GBPS)
> +		info |=3D TB_VSE_CAP_APPLE_CABLE_INFO_20_GBPS;
> +	if (orientation =3D=3D TYPEC_ORIENTATION_REVERSE)
> +		info |=3D TB_VSE_CAP_APPLE_CABLE_INFO_ORIENTATION_REVERSE;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D19
