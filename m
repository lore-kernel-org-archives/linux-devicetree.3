Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1258C3E3D90
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369288; cv=none; b=MT1E480Souiwe2HM2qcieX2KmvB9jQ5DrgLCDK6oXDqCu02mO0tnu5cVVWMwN4DfZtvYgpsGou1KcGEm2A+QSkekIs8d50kmmHK2zLdBp2v5RKQdERf1PkHwNqPwY0Bvjo68pjvCpL+WMNu9bXSQYj0a+PxOoHKJFy6xbePs8qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369288; c=relaxed/simple;
	bh=gP+NIzYIFnWhHoHL1kRCX/A8WhJk2DxdaM39812LJiE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nbl90faJVJAa/s2Pu/fkMpgB51moVUGM/goGkpthhK/aiQESHR6BBsPlWvQNtatPeLe1ijMOxgn2Qwj9NWOzubeGwU7Z3Ua6N+Cf5szP8oebXwTcji0xERWy/w7+oDrmPj7EuT9VxX2/y/21lxhpL0VT1MkP7ADN+Kl6oRLow90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kn6X5SFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kn6X5SFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4711F000E9;
	Thu, 21 May 2026 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369286;
	bh=CasbmS1Dqlt4EuFusDt+CFLJVKQ1n48MtFVVFiV0XFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kn6X5SFI41CpM1Q5gX5m42a0j/MO+SdsZb7kQb7rawJrSJ13amRX0Ep3medVXSWS9
	 xrjjizViVzuFFkX7jZihv1gK2ZZt8AWviIV5M0c+553tbv5+Zb5aZUdOTOYjHwNCv+
	 Rlm/tmAuTdhoN2FWU9c9nEgKfifF48QxgAN6KW/aXz9kJ2m0vnDa+yyfacWrgC9/1w
	 MXePEsbW3z+1irJNrXRSIrFSFlYb8loAhvxiZRtowlOP+tvT/l0zdd+aRrQNetFNvQ
	 wKyRDwXUYBtlu/3jf/wur23wj9rcsl0FCWKXCPVz7uSIc3l9BQ+xdNSuo5jxPBBdPO
	 a8Xg5WWkOm3EQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-19-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-19-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:14:46 +0000
Message-Id: <20260521131446.7E4711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removal of MAX96712 from defconfig without enabling its replacem=
ent (MAX96724) drops hardware support from the default arm64 build.
--

commit ddbcc79406c11acc7140054025e3af8a12bcaf19
Author: Cosmin Tanislav <demonsingur@gmail.com>

arm64: defconfig: disable deprecated MAX96712 driver

This commit removes the staging MAX96712 driver from the arm64 defconfig.
The functionality has been moved to the new MAX96724 driver.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d905a0777f939..5a4b75612c054 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1422,7 +1422,6 @@ CONFIG_GREYBUS=3Dm
>  CONFIG_GREYBUS_BEAGLEPLAY=3Dm
>  CONFIG_STAGING=3Dy
>  CONFIG_STAGING_MEDIA=3Dy
> -CONFIG_VIDEO_MAX96712=3Dm

[Severity: Medium]
Should the new CONFIG_VIDEO_MAX96724 be enabled here in place of the removed
driver?

The commit message notes that the functionality has moved to the MAX96724
driver, but without adding CONFIG_VIDEO_MAX96724=3Dm to the defconfig, this
hardware support will be silently disabled out of the box for the default
arm64 build.

>  CONFIG_VIDEO_MESON_VDEC=3Dm
>  CONFIG_SND_BCM2835=3Dm
>  CONFIG_CHROME_PLATFORMS=3Dy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D19
