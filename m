Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75381483BED
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843671; cv=none; b=H3mY+AJOFxaxyRVBWR5RWDNFOWJx2rFJrDeUPpYTizfBjhS8mX/T9A6yUQOMwFc0238xpSHF4AHkn32dCrpvSr5+X/Vvp8yZ07RXNX4crVgGfCneoWN6xyEFnrk/z6HC3VC3EecDqyiN+3Wtw8fvpKoD00T20GBs2zejBHmbFOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843671; c=relaxed/simple;
	bh=1vJcqpbbLVTpJKQvzW92tJBQgqUHNxDfmIqZhvw03GU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gr5sLB4WsPP3g/E8z+mNM2jwbf3ZGgeZVfc1jUCQGes7C67a3alvxjEVipZ92ZEbsCTCAu0qPizWKdePsIaTqrhdi/dVaf1XkwJf0uFw4GctRdLq5VFTuW0yeonFsQAkB2mtG0Dd5LKSta6vQBjQzBZfVQ6es3XIk210FM/BMmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyIYvfGo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyIYvfGo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972651F000E9;
	Thu, 27 Aug 2026 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787843668;
	bh=Oc7KOPX4gfGtdHSqjKm+7ehWeUsCrwErDSNQvVX6mYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SyIYvfGoXOAehkny2xcH1KHF1qVeB67OVZXnHQmhKuk4p5vuVDruP6/NNwt2YvEi0
	 pAssCkNdxYCDtyyCGFon2dCPL+2uRNVCj/tiYIj/poPkS9Nv+igKsUP9KhHgcigB2O
	 7Ty6OfQO82CogjyOG2qgLindRZgQSXA8y2uZZOitgm0KQakV/7EIxouCYbelX3j7H8
	 jaR9R8zUfaw46FmugD2jneI2C5sQ5pRfjtPZd29CdeUxwFFqOAlAfLbg7noISx/Q55
	 2KJ10PeFVksTQ4Jmqy8PUmxbmlA65AOX3bAIfZV8mD788auI67mRqDaTZg39yZ6u8Y
	 IZkch1zxtzUQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: thermal: Add Tegra264 header
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-tegra264-fan-v1-2-3c55f0c748b1@nvidia.com>
References: <20260827-tegra264-fan-v1-0-3c55f0c748b1@nvidia.com>
 <20260827-tegra264-fan-v1-2-3c55f0c748b1@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 15:14:28 +0000
Message-Id: <20260827151428.972651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the `#endif` include guard trailing comment.
--

commit 925e38b8ce54efbdda094d93d18bb0768571876d
Author: Thierry Reding <treding@nvidia.com>

dt-bindings: thermal: Add Tegra264 header

This header file defines the set of thermal zones exposed by the BPMP on
Tegra264.

> diff --git a/include/dt-bindings/thermal/nvidia,tegra264-bpmp.h b/include=
/dt-bindings/thermal/nvidia,tegra264-bpmp.h
> new file mode 100644
> index 0000000000000..b327396913856
> --- /dev/null
> +++ b/include/dt-bindings/thermal/nvidia,tegra264-bpmp.h
[ ... ]
> +#define TEGRA264_THERMAL_ZONE_SOC_012_MAX	9
> +#define TEGRA264_THERMAL_ZONE_SOC_345_MAX	10
> +#define TEGRA264_THERMAL_ZONE_TJ_AVG		11
> +
> +#endif /* DT_BINDINGS_THERMAL_NVIDIA_TEGAR264_BPMP_H */

[Severity: Low]
This isn't a bug, but there is a typo in the trailing comment for the
include guard. It reads TEGAR264 instead of TEGRA264.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-tegra264-f=
an-v1-0-3c55f0c748b1@nvidia.com?part=3D2
