Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2438C2D1
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997932; cv=none; b=ahzUpIAicqJiYs6lnoauxSEmjI8YexhKxMxI9edv83iM2vM8P5dnDGblgLCUcVQxSxlYPmvEQ9kUsVjh+NEEgjZpLCBwh5g9oSij5aWiSOWaZODeioGyvQ28awkE2XCd2DPhNumoBBnc4aihXoaffacBJphyidLwgJZlvTGAh+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997932; c=relaxed/simple;
	bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fbx13jrzHV0LF5dC+1SFM3J6ER1mQ4P9kTqWJqzftXBSaI0n4ykC9laGNPEFyacsBAstrte6WdF5P6Ehv4DhnU4p+ttl9QZQAmr6kNbQIZKtMklruK6ck/aaVlc7WHkh0mgp8ljrOafEHU12AnzaxastEYcGy/E7aIMzMUSjKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbbFgloP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbbFgloP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so79076555e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997929; x=1778602729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
        b=cbbFgloPVj92mDTeO6wAhCwJKNq/DbmGqRhsakbAcyysDO2KNfly5Lk5nnOfuyu42A
         2hKzQCXiSZm0wCKjgeQ1pCsrvhkcq8/YNEXC1+xzymHxbRaQYR+ypbFN0Q3ye5aLOBxE
         SeYC3+n81iEJ9sFqUfqFTTHFEwUP9LfcXgAbU9y0acWc40ic97IAxctERGURU0gVbxju
         Xx/bWTu0FVN61ZlCgIAMmyZb4AGhjMbb7zEbb3ar9I8sKLbC5I6curWTJgL5A8ye4jpD
         HoyoTlEhbYbHLZfsdEmRglQvKfArGpXXVKNUzA7DdzJZfUrWJNS91K9U8AJXPXzU9425
         w08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997929; x=1778602729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
        b=e8M4cGOAbh/kL5KNscrkJfBrMYEYD8KEXsf956gYdpsrF9Wm2tNHd/UbtuX1nWTcP2
         3s2GQ+iwtkVDkaMPPr/X72KQY3hhl0VYHodrDRWskIJSJboGgSv20k6VNXMuw5NyoGXd
         GAvlXPUV6M5pqeA5ej2unuQ8KQ98AR2Awbjj7yPSpFqB0Pd5La6Db7aekiWz6XbgnbSt
         7gbtQ/xfK9VEokghPTbCKjRioc/yJbFuKFoQlsjEiG8mP9nwNxnHd00akZqAodg74oh8
         eEbuIWDz7luAbAzAvfpdAmw5w1+DArA9zJmPN4ckIg6g4CEeXj7jqIvb8znyIrEeXaOQ
         0/3A==
X-Forwarded-Encrypted: i=1; AFNElJ/SM8vjRJSNWIZ69XaeP6bOJE6cHdFo34hDg4TSpIIL5PE8Z3FuEWfB2TLuzdGBUE0fA6GjS0ud/PWk@vger.kernel.org
X-Gm-Message-State: AOJu0YwJV3gza+M76VclxYezwfHgWhg/15g1sqKrvHpTezmG05CeXceL
	jRKqZwtXO0MvrR7HT0QBXUj0Fnkqzkmg1q+Aw41vQeD/Ml55uOJgZp/C
X-Gm-Gg: AeBDievsa+gkdpyjV0R2HSEoS1T/oZWOMojfAsB4+a454L3H0KvsVcKctW+/DgGpmWS
	dqnhkW4IzFP0P2CLlsq7Iqf2V8js/CZqBDgEcphOSFBcatG0aH5s3L3v6kvFzY4tZM5aPbPPS04
	w50Qj+TbEHHOmxb8/N+zdB2+D2p/Ien0bvgyqSyx+JsuXCzEmt3RCWHJj3hPhaz1+VwrKrkCLoS
	Y+6/D4VpApxzmBSffBzgaTB77PoCUke8ujLJCLscuglK7ZACLxagkY11iEEbmer4HrRbsBFNikr
	lTHXK+KdwRHfn6SDFb4GRpw8KBkW6KieGGWQg6IBb3qVoyTF7sml9rk7eGUqbTvX+eRQdiCVgwh
	wvL6Z+9iYeKnVB9UUuzNfFnaAk5fHncjOlHS6GnQd0T3ftzjmwA2MpAObvl3XMhNy0kQ1mQ/zue
	PaTWxFKAzt/0fBfwUesSxyNHm81AnRjJLF1+Yq8rtgadXdwNGpMc/MHh7DhO3SUXmTVAIfUGWS6
	L8Wz3BXU1es24ZgREYSIN2cHxEI
X-Received: by 2002:a05:600d:8408:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48d186dc892mr46627055e9.2.1777997929083;
        Tue, 05 May 2026 09:18:49 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055e2d3d0sm5425787f8f.34.2026.05.05.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video
 engine
Date: Tue, 05 May 2026 18:18:46 +0200
Message-ID: <YPmvp_egR-m-cMSokrsA5w@gmail.com>
In-Reply-To: <20260505134812.408316-7-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:10 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The video engine on the H6 actually has two IOMMU ports. The one already
> listed is simply named "VE" in the user manual. The missing one is named
> "VE_R" and is probably either read-only or used for reference frames.
> Either way, it should be listed.
>=20
> Add a reference to the "VE_R" IOMMU port to the video engine node.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


