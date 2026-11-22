Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350921;
	b=Cb7nHqyiCBLTsF7OzennbX/io5zZJ3WekCobXGzfbBQnDuoifR8xSAg5lYA5q0jCKd+B
	 9Wcex9dywDxOiunFh8PqCOSMPYZUtdJ0pLEyORnfoqlJ8tQAWLLRx10yt3LESqoeuf9Ra
	 JU7XRMPKQs5w9Nf/NwxdKNZc7tJjBQjPTRtqE3NE3dOXIdIVW1rtFBG63Qr3LD3qalFhD
	 TQN8fa6dB40dq2m9nnfzrKVTQEVPt8DK+rao6MmyY0S2RnEtcYA/SN00aW5YOxTIlnIuM
	 sVO+2i8gp9CWVCZ+No/eXduLnA5eVA1qDSPB/T0v6M1P+dnmRY3ZXSZbFiUggKI/E6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350921;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Up1fmr9hvScc11keTL2pV3RTEp6AoVDEnPQt1Vo1NM=;
	b=XJlunDDskOOgjw12jLXiXBNnVkSUNzjUVgsWubWiTn4TCf6qVvFD7SAEDvo4S6v9gupd
	 igc5S0ODrXK90FxGrEQUN/cv8ukzsbprgAX9Z+kNDIoC9aOtDAE6C43BE44qtfS1skZOF
	 LbuIwxy4iZCbMRVCujlsVPFSL6Ao0rBYb6LIB9Aob9lsVBh0pvSXzNY/y7W+T9d5nufR+
	 7Mj8+1osANtfVrAlqMrBsKD+aV/BI3bJd4MvEFArz5EBxLd98GEThaSKp82GyYpuvemsy
	 V6ZvbptHg0rAHU8JNt8+wX5shBOsN2VK0jtp53XLK7xdZmwglM7eTwGvEgSTX9RVD0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsuz9GFl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49AB606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsuz9GFl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E736A1F000C6;
	Sun, 22 Nov 2026 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795350921;
	bh=3Up1fmr9hvScc11keTL2pV3RTEp6AoVDEnPQt1Vo1NM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hsuz9GFlGUqhFOtrn/SNsOo0nDqrHaljSeau/YFIz7Bwl7e5S2OE4blpNiqme+DKf
	 ydkKRNvJzVNU1swweczu9EL9q4Tl9NWbnBqrYh+lM0etsQ4uZdODRJer72a+r44kT6
	 xMGld2pVXgWdTYQdtGKrh4+E28dlirtwFwpo2XKVTNtE2xuOihXTdDdDvbY16qasZm
	 iOsaKnNqgjHAvR+lWV7eySJkFprrPNZoW4BV9LswF+z6HrYm5HcY0sJux/3/aF1OEE
	 yl1Ven3Ohy7LstC3JA9UBYuiuR86wFRLtBh2q8K0OnmU9MlCOwWG6uoFS7hNWqEWKN
	 Oo8BPIg7yaTqw==
Message-ID: <sashiko-outbox-227927@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
 <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 12:35:20 +0000
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
- [Medium] phy: apple: atc: missing linux/bitfield.h include for
  FIELD_PREP()
--

commit e397fb823d5ae453512b167eed88b2e91bd53da3
Author: Sasha Finkelstein <k@chaosmail.tech>

phy: apple: atc: Split generation-specific code

This commit splits the T8103 and T8122 hardware generation-specific code
out of drivers/phy/apple/atc.c into atc-t8103.c, atc-t8122.c, and a shared
atc.h header.

> diff --git a/drivers/phy/apple/atc.h b/drivers/phy/apple/atc.h
> new file mode 100644
> index 0000000000000..d6a608c677696
> --- /dev/null
> +++ b/drivers/phy/apple/atc.h
> @@ -0,0 +1,806 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +
> +#ifndef __ATC_H__
> +#define __ATC_H__

[Severity: Medium]
Should atc.h (or atc-t8103.c and atc-t8122.c) include <linux/bitfield.h>?

Both atc-t8103.c and atc-t8122.c call FIELD_PREP(), such as in
atcphy_configure_pipehandler_usb3_host_t8103() and
atcphy_configure_pipehandler_usb3_host_t8122(), which previously relied on
the <linux/bitfield.h> include in atc.c.  On arm64, <asm/sysreg.h> pulls
in <linux/bitfield.h> transitively, but PHY_APPLE_ATC enables
CONFIG_COMPILE_TEST on other 64-bit architectures (such as x86_64) where
the build fails with an implicit declaration of FIELD_PREP().

Also, the #include directives at the top of atc.h sit outside the
__ATC_H__ include guard.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-t8122-phy-=
v2-0-8d5c8fdf31ba@chaosmail.tech?part=3D5
