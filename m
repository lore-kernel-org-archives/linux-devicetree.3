Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458959;
	b=4NGIewHu5Rvx3qsiFcty7WET1kga0z/ndwM8A/GF8rmnzi7EsRhrEyaQyeckai+bR3NH
	 PW4YgxaBndwJ9X+ndCk6UgBdFg6EebJFW3bRPDtINDdZ42SMmrZHCbmvBw0XhzQBLYzdC
	 kVbV2RhhFIq2xXIYGha8DaApGOoLlG4GEAHU+rETp6tN3B2dOrM9yyBYJRrsWf74fQ+jQ
	 2fVpWPFS/LPopvcjL3GpxUbgFxdYxEKxP7afd4sgY7B7Y0N61MLY2YDxoxWQ5z1FItcSE
	 pOEWj4Uvl/0D7T8MydwjwzCrOaZJ+ztcLybKY6qrs0zdcyFIVhr7jpbFoPRDw/j80mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458959;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=woUfB/hWjWb6JrQIe0GWqop1nkzieCQIlK4QU+qgHmo=;
	b=ZfXEPUp/otgGw/EYjvfIMS9JjFuO5QC6Qq+R+lkYY2cqnneGXSVxEANw4GzJFbuEh6d3
	 ndDvZyd+N90Xe0/1PFcw4zB5zS8/iNLnar9/3hPvZ6wfh/hTC5ZOX9Z5K52+BPM57hfuS
	 zNuR314l/KDdXL8lZ7oRbGpyyDe4pwXIcYYibzV6jDtWP4k0E0tNjoUL3nGuA5Sh4o6mH
	 x/pqKucfLkrXk06WaDnoQ77lt2heKohBrgoubckeNIjzkW9Hm/lF6dIwf/DnxCUeNhVVl
	 gl4fJp6/WAU41omkp9OVJV3yY9sc1c6RNV0Ug81jwH1FXKKe5jP20I8kOA3UHJPwOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MrF6Lk4/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E922B606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrF6Lk4/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B971F00A05;
	Thu, 12 Nov 2026 04:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458958;
	bh=woUfB/hWjWb6JrQIe0GWqop1nkzieCQIlK4QU+qgHmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MrF6Lk4/tHQg6ZAEqh/8h6tYCA99RB4igASKw7UiRv3GbTFJ/Gfd3G+LSNjzzMOcf
	 yArpvtK6PiKyIU6RFFw+mbN1mRUy2ogGfu0sFJQ9pxNtNIHdNGjM5fLqWhuEpVGCCM
	 wwPnTCV9pYn8q5lHJNkX36xTo0kfQbs6E1dK2qjbuYdN3415ud4xnTqVMkuIrM01h8
	 OZsKoZ4iHzCYJGqe+sFnU7PkWwuD8tjkaHbWFJYU7Ngoel8IY2dVEG09Hbl1/gAIOL
	 bZgqRBJlQsc1QYpuuptofqSZjtXNSaoOulEeL0c0YyIL93pcmvVplB14ctfp4o13eJ
	 xVoym7AW6ZJ0g==
Message-ID: <sashiko-outbox-210395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 NAND variant DT file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-08-dts-v9-3-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
 <20261112-08-dts-v9-3-c34de4f78fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:49:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: ipq5210: identical root compatible on
  RDP504 NAND and eMMC
--

commit 073c305d3df5613ad5b8c3e588379e6b62b9fe9c
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file

This commit adds a devicetree file for the IPQ5210 RDP504 NAND board
variant, enables QPIC NAND in quad mode, and adds the new DTB to the
Makefile.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm6=
4/boot/dts/qcom/ipq5210-rdp504-nand.dts
> new file mode 100644
> index 0000000000000..1145fcf0a3025
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq5210-rdp504-common.dtsi"
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
> +	compatible =3D "qcom,ipq5210-rdp504", "qcom,ipq5210";
> +};

[Severity: Medium]
Should ipq5210-rdp504-nand.dts use a distinct board compatible string inste=
ad
of sharing "qcom,ipq5210-rdp504" with the eMMC variant in ipq5210-rdp504.dt=
s?

In ipq5210-rdp504-common.dtsi, qpic_snand_default_state and
sdhc_default_state mux gpio0 through gpio5 to mutually exclusive functions =
for
NAND and eMMC.  When both DTBs are packaged in a multi-DTB image such as a =
FIT
image, a bootloader matching on the root compatible property cannot
distinguish between the two variants and may load the wrong DTB, causing
storage initialization to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-08-dts-v9-=
0-c34de4f78fbb@oss.qualcomm.com?part=3D3
