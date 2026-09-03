Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E840627B
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417317; cv=none; b=K5Qa5K63ZGAQiSiLN+5UXaRokD4krELAe007FeYf+8uJjHUUPYcryZ6XhXCUEH3huFz76k3Jz5DZXywuSzaNAeP5m+yIPXQxTwTJ8BRxKSczzATDym42++JdO89N3Roljh/aCxeclYmBc/hBQeAdimNEDXT2TUwJ8jqh8JhAz2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417317; c=relaxed/simple;
	bh=P0Q+QNTzI/bbuyLWi/l15nca6JKaYp7LpTNYBUCxDLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=btMoL0/8iCKG/XBpA9cVC036IPBWez0+YEq+X+uGSDvK2E4efgMtjPqDwwxwbNLzQN2irlcIglbPWX4gd3DCybbeilWEx9qLRqkBOZtKM7HucfNkhrYAen3Tkj9MgDROfZZU4MSM1uW6f9laBfvSd8+xg4XdwUOrfPo7A/PxbWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oshGw5io; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oshGw5io"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED71B1F00A3A;
	Thu,  3 Sep 2026 06:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417312;
	bh=FoHungPs4u/yiJsnFI9jpj2jYuTxqlLCvKHhmusZdkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oshGw5io3PE8Ptwu36xJyQYFHR6Aw8pDE7EPk50uhtsCDag9G2ABwCRCVgKcXtF55
	 mWlKeAl/HemvS6gn8ZmJa73OvFkZerglR1EIg9+eVmKGsILzvF9nkvT2ixwCdNSUUn
	 81tQhVO5R9LV7tAc6OMN9/fyMqCr7kPKjqxp56DrftrbNru33RDXFVtbdtOxIJ6vUA
	 GZL3zfD20RLoo4a3wf3+C9kuTyk/2eHVoXcEiO/mur1JjM4mhdGSGv0Xw+idDjzq6c
	 nFw71W+8kAiSWQ2HcQdfJkuqVHEf5ONPU1EjmbklnkvSetWAvKHnnXlagJ2S+a7sT7
	 Jcs+E2dqur+gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260903062108.2712296-5-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 06:35:11 +0000
Message-Id: <20260903063511.ED71B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Driver-specific header file is placed in the global include/linux/m=
fd/ directory instead of drivers/mfd/.
--

commit 444703ed004628dc8c71d675917535f1a724bb53
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

This commit adds core MFD support for the NXP P3H2x4x family of multiport
I3C hub devices. It provides support for the I3C hub and regulator subdevic=
es
using a shared register interface over I3C or I2C.

> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 0000000000000..eb4792de5440e
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
[ ... ]
> +struct p3h2x4x {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;
> +	/* Number of downstream target ports (4 or 8). */
> +	u8 num_target_ports;
> +	/* Serializes protected register unlock/lock sequences across MFD child=
ren. */
> +	struct mutex protected_reg_lock;
> +	/* Hub context for the IBI handler to reach hub state via the parent i3=
cdev. */
> +	struct p3h2x4x_i3c_hub_dev *i3c_hub_priv;
> +};

[Severity: Low]
Since struct p3h2x4x is only shared by the MFD parent and its immediate
regulator and i3c-hub children, shouldn't this header file be kept local
to drivers/mfd/ rather than being placed in the global include/linux/mfd/
directory?

The MFD subsystem guidelines recommend avoiding global include directory
pollution for driver-specific headers unless they are consumed outside the
immediate parent-child hierarchy.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903062108.2712=
296-1-lakshay.piplani@nxp.com?part=3D4
