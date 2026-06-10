Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F85B3A1684
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079491; cv=none; b=pOLBymLumoVp6mcl94OAQiBvp4h3n9ovYMlpg00hH1kKYc5SA7xXvXd4Ur2C+vPlx/kI8fti73BD+KxYjAP0hWP4kwgm5h8U1YOG5jTxwF73UedlQeTAu7zG3bXRQpn8LcwjaOYhJ1WWvvsVILEOPC54aUC6oc5h/Q53f7wHLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079491; c=relaxed/simple;
	bh=XyGJkE+G9De3u8ln7PKT0CRjxQI4j7+wjT7qtjZb1wU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ourj8in7zH86GkneuOdBT1Y9F9e3indslyYl6qjWbgjmcn374BJtwAAAS76kh452tkkQxqhg9pwRT7RAqIrap6VdS/DOVX1M2jNP0EJmljnVImwGd91VNMMPLFmen4OyqM6Cmfmv1Gk0maCwVSq+rGjwBZAfybtIE0KZKzDZ2l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnkTp499; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnkTp499"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E031F1F00893;
	Wed, 10 Jun 2026 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079489;
	bh=XyGJkE+G9De3u8ln7PKT0CRjxQI4j7+wjT7qtjZb1wU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OnkTp499fgj87B9k7I303Qy5FXvS3cSCv+/cpnDkfbcPXpzNQxbAg4rvr2FArs6NW
	 4LZf9ldyR6+gJ0vT3Za6smPfjSjQ5GTm4AhobjIBYa/3VKVMtoZpAuQ0MgYDzR4uat
	 UOVMeYDmj2gX75HKIID8rl9ThLomfiL+b3a/QEqcXddVtdYXs1xgIpvoYY1UQhOyJB
	 gK/1iE/sq/Ih2HLGOlI1roDIT3yIOmlVmLEt1gwq8uHa9Gvh0IkHmRbPW0KHMkKRhS
	 /VIxmU+GCSq8Eahuuh8yOXshOo4jUJ/f3XcXvByd4CfYGhsiYLmrzjdhu7MziNc8tt
	 m3SZUMH64IQzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/10] reset: Add Realtek basic reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610080824.255063-3-eleanor.lin@realtek.com>
References: <20260610080824.255063-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:18:08 +0000
Message-Id: <20260610081808.E031F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Generic module name `common.ko` pollutes the global kernel module n=
amespace.
--

commit 67818ad9f005d500ae216802db2e67d2214119c7
Author: Cheng-Yu Lee <cylee12@realtek.com>

reset: Add Realtek basic reset support

This commit defines common reset operations backed by a regmap-based regist=
er
interface for Realtek SoCs. It prepares a common reset framework to extract
the regmap and device tree node from the parent device.

> diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makef=
ile
> new file mode 100644
> index 0000000000000..b59a3f7f2453e
> --- /dev/null
> +++ b/drivers/reset/realtek/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RESET_RTK_COMMON) +=3D common.o

[Severity: Low]
Does this create a module with an overly generic name?

Since CONFIG_RESET_RTK_COMMON is a tristate configuration, building it as a
module will directly produce a kernel module named common.ko. Because kernel
module names occupy a global, flat namespace, this name lacks any vendor or
subsystem prefix.

Could this risk future naming collisions with other subsystems or confuse
users managing modules? Building this as a composite object with a more
descriptive name, such as reset-rtk-common.ko, might prevent this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610080824.2550=
63-1-eleanor.lin@realtek.com?part=3D2
