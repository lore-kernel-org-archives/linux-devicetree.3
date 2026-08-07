Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5F37F31C
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786128192; cv=none; b=qHW7DlsiB38a4HoZZNOzWB0UlvWOAFaT0sb8QIM5c5cbp2+Zx68sLyMIcWzfTgpbVgIVf4Y2B2RusreWM10eQkf/SmxEpottWuBApbUBXXhOOcYmT/4OtbEzz3LlCYIgtrh0ktQh5/936oJzGCgY/5JpIs9BMrU87uR0Z7cW9J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786128192; c=relaxed/simple;
	bh=6u4tXMEF8UbOHXRGMcRjchZI7C0cqbH5Z+H6YszNVT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=srB9bh84q1nIQkyV+c3kF1+d4ALxHOTmdWqfWlwDfBVKXc+uD3JlbPiCzTapH83zJKpF3nPSZYUhN7uhd0aZZR76HrhNcC47RHUWnffzjCE5A7JJypcok8Yh4UYEE+IMGv/43FWQBU3CFvU7N8wUZSZM9up/A3qY7+fiGNUQjOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlxYwQ5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlxYwQ5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D491F00A3A;
	Fri,  7 Aug 2026 18:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786128191;
	bh=e6bwOsRbH8Ua32DIJCYbW8YkPf79moxCITi7h+pBepE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RlxYwQ5jGC89Pjyt0afmd1GLIKxtbBuQNMe+SpdybTVsqEkcHdyBHEWKz0031Qqcb
	 BmfN9UR6ZRHuQ/jJhdCUmpjfgCzElFp+8bIgVxoa3Cv3ZaLT7/mXDbsN1gbehfH1BB
	 xC8kCGJLGIpSbAKXLR6acsYxW598aRWxnnbO67VyuZScipAsyHJdAULr+a2KS1kfxu
	 ZhxVDzzQfpGCX21Toitv5R1z2QZRZK46G+meAkYK4j3Z5tRrQFgMhrhWJEtw1n43Hq
	 TChgdjZ0ctI7aNz7rzO2OrBoD/9Zq64sHRFpiDhJ/r6dsJin6JvOas6yssmjyphWEf
	 cEHL+F/dls1UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: armada: WRT3200ACM: add
 marvell,ignore-regulatory-hint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Georgi Valkov" <gvalkov@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807182124.41572-2-gvalkov@gmail.com>
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
 <20260807182124.41572-1-gvalkov@gmail.com>
 <20260807182124.41572-2-gvalkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 18:43:10 +0000
Message-Id: <20260807184310.D1D491F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The device-specific property `marvell,ignore-regulatory-hint` is i=
ncorrectly placed in the global root node (`/`), lacking binding documentat=
ion and causing the quirk to erroneously apply to all `mwifiex` devices.
- [Medium] The `mwifiex` driver directly accesses the global `of_root` vari=
able, which is undefined when `CONFIG_OF` is disabled, violating the driver=
 model and risking linker errors.
--

--- Patch [2]: [PATCH v3 2/2] ARM: dts: armada: WRT3200ACM: add marvell,ign=
ore-regulatory-hint ---
commit 7033e1a77e69407f0088e5cd43fbc6b4fc03d549
Author: Georgi Valkov <gvalkov@gmail.com>

ARM: dts: armada: WRT3200ACM: add marvell,ignore-regulatory-hint

This patch adds the marvell,ignore-regulatory-hint flag to the WRT3200ACM
device tree. It prevents the system from applying extreme restrictions due
to conflicts between the user-selected region and the radios' hard-coded
US region.

> diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arc=
h/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> index 4ab45f294de22..6e283e223ca4c 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> @@ -14,6 +14,7 @@ / {
>  	model =3D "Linksys WRT3200ACM";
>  	compatible =3D "linksys,rango", "linksys,armada385", "marvell,armada385=
",
>  		     "marvell,armada380";
> +	marvell,ignore-regulatory-hint;

[Severity: High]
Does adding this device-specific property to the global root node (/) inste=
ad
of a dedicated device node cause a regression where it applies universally?

Because the driver in drivers/net/wireless/marvell/mwifiex/cfg80211.c queri=
es
this property from the root node:

mwifiex_register_cfg80211():
                if (country_code &&
                    !of_property_read_bool(of_root,
                                           "marvell,ignore-regulatory-hint"=
) &&
                    regulatory_hint(wiphy, country_code))

this board quirk will be broadcast globally across the system.

If a user connects a generic USB mwifiex Wi-Fi adapter to this router, it
appears the driver would incorrectly apply the board quirk to the external
adapter, potentially causing a regression in regulatory compliance by ignor=
ing
its valid regulatory hint.

Would it be safer to use of_machine_is_compatible() for this platform quirk?

[Severity: Medium]
Will querying of_root directly in the mwifiex driver cause a compilation
regression when CONFIG_OF is disabled?

Since of_root is only defined in drivers/of/base.c, and the mwifiex driver
does not depend on CONFIG_OF, this relies entirely on the compiler's dead-c=
ode
elimination to drop the of_root symbol reference when of_property_read_bool=
()
expands to an inline dummy.

Relying on dead code elimination for undefined symbols can be brittle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807182124.4157=
2-1-gvalkov@gmail.com?part=3D2
