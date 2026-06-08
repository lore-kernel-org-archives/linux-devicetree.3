Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DBE3839A3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905471; cv=none; b=L+6LRWyxfRKlDUuWqY1lHMaQDVuKmXjtwdXYMR7k/WZBQByxrOh16bjv0rOB9zxC8sqrV0BdDJuIjgF0KEfAMPrc9d5DWfJ2SYIomR90Ca4CgMXeO0Lq19jCM3rBI54hSHaT/l4iAYc0VRWp80B8mGIiiaJzBAmBnNQyGU2Fsgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905471; c=relaxed/simple;
	bh=R4ltqLHAb8tywOoEI2aiPilFiI8zOx7/cl5/ha1oRl8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pUMxu2VGcz8HWeVmXTlXCNgRJTlLGBJbw+mElT9oV1IpdvVFdfOEwn7tFah1ZetFOISEyxNglA8DTsEnKEVGOlSdsn2ClYlv9paC1PHS9KUVFJCGhCIaKzyyfPIubG1ffCu3NuwKXS/XM99YpLC9ke/kf8kiuVakzy4xF0EIcss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxP5RLeL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxP5RLeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68ED71F00898;
	Mon,  8 Jun 2026 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780905469;
	bh=J5E0G9fgi8gocwkMyRd4wVWhrNjJwck1KYqjZd0VZEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LxP5RLeL1sqeffgs4SKyj3eZXLmMYKpr4Vn0HW4okxOeOrX5P+WowG8/Cl6dkULvj
	 OG76pNCmg/wswKHDlX4OMKGfb0GXlwOaTZduxIKekt9ulaHX7nwIrdqJyOInsh+tg1
	 oz6iMpFQwJdMq6S7fzU1dOMTOpE1SBz1MxhndzQ2X3SlgUJ4zMFKSQrZm3zkm7aAM9
	 b7nzRQpmCbXYymn708Gnm3xHHdNkgpFnNMgNiQ9V2lGni7sWvAeqNDdAsHcVfoZRmp
	 1fnrZqCkxlrgWQdhd5I2LQMjNjVk7r570pldfv2727dVUimO2AJLtGXci8EkQkfBVL
	 Rivtkh6dHAIpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000
 pinctrl controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608-ultrarisc-pinctrl-v3-1-30a09ed74275@ultrarisc.com>
References: <20260608-ultrarisc-pinctrl-v3-1-30a09ed74275@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 07:57:48 +0000
Message-Id: <20260608075749.68ED71F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added dt-bindings header file is not tracked in the MAINT=
AINERS entry.
--

commit f7f86b1233735eea88a3047d747f41d13c3dc00b
Author: Jia Wang <wangjia@ultrarisc.com>

dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl controller

This commit adds device tree binding documentation for the pin controllers=
=20
on the UltraRISC DP1000 RISC-V SoC. It also introduces a new header file=20
containing the corresponding pin definitions.

> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

[ ... ]

> @@ -27357,6 +27357,12 @@ S:	Maintained
>  F:	drivers/usb/common/ulpi.c
>  F:	include/linux/ulpi/
> =20
> +ULTRARISC DP1000 PINCTRL DRIVER
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-gpio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.ya=
ml
> +

[Severity: Low]
This isn't a bug, but should the new header file
include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h be added to this
MAINTAINERS block as well? Without it, get_maintainer.pl might miss CCing
the maintainer on future patches that modify the pin definitions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-ultrarisc-=
pinctrl-v3-0-30a09ed74275@ultrarisc.com?part=3D1
