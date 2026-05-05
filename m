Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2812D4219FA
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997917; cv=none; b=pAYpz/T34TtPxQ3m0qBAsSIlumCo7PZ4WuiiwVRYlkdrcxnP8oWHkqVkBJOlwvf1bVDYSB77ba0eqIS1DlxzbIEZh5XhNJeIQ/RXkiK7Dad6HU3WbwIPIV39xUWmqCvBV2zHF0kyK34ZtTTTKNXrdLW6/rHZXoypFJ+Dl7z8V+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997917; c=relaxed/simple;
	bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9dbhDEnwyuNcC/8DB9wAgtE8RHvoKeXoRYZu31XwozfF4dWcGaX/6nJ8tYzOx/2xStksxM0Skz8+mmACyV0KUEQpwHTtE01qcvr/RYCKfaZmbfxnwj4lpWThxy6sY//PTB8E2I1wn93Vb6LvKAZ6AlxyRZFYYP3OQn4v1D4xkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUGuG6NT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUGuG6NT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe608cb92so3247063f8f.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997914; x=1778602714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=LUGuG6NTZRGJgsINbg7YBAehLj3ovvjJNmgueO0bFuM3aRzJ+Q3JZUV0qxk88+KT7r
         fMoW1T+3+8hUnRIpROGXhnXsEAudSVZW8usrNWBi9v9P/KRwcyGMQMWc6LdJPFD8SlnG
         oADB99hxqjNDkFVrSYQDcnysdi5Ip3NKj5Q8YxxpIDDZEDK04Dp19IxI/U3zv+oRoZ+R
         lqrXhr6fIkA9Z5VrqZsfy7ym12fQ3oE6U1WwaxGMSQdBeKbVKRln3BzI5PU8eR3f3sQg
         JLntWgJ5+sgL/+50qv0ix5FgJaKAobjbdyybOlPx81fAJgypadFQg24WkGNf1GR6Ntep
         D4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997914; x=1778602714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=T7ksS0LXggxMRynG3DWoO86s9PczuTB+WdeFnpzs1ljK94QV0RshICRvLrhfTSekiv
         Zx3MHDwhaf002esy6ij0JdxZiDW+MToP8S3sBaLTpBqq4TBEqnmYNWbsw0cSkwHchM4L
         Egp7uPXZZs1KBorVtwTXUcm8ahbb5WX8Z1W2506W3MN5a6D924s3cNINDLT9Rj2c6K4G
         xFweEF0mV9xdz78l0fJfbz9JS3QQE+X4ZXwyil+U1GVQrZtn5Mf0+FRTP79iU/cyw9pO
         AXsdYCOQ5Ov1jHu3MUr0ttj9xjLHp1MhldZwESerLnykIbKmUtxc2MlPSvUj34ZKm7ly
         cG6g==
X-Forwarded-Encrypted: i=1; AFNElJ+8P22vwR/TpQC1MUhnRImiDqt1Ly7kplcGl/6Ai5++dmxMNGsnnnSVgsBneXuyW32cx47IWPedX4zm@vger.kernel.org
X-Gm-Message-State: AOJu0YzJpaGnu8DnpKsixq6ta6Q1PKy152ZvAxkJ/RXQWufsnTs3LxKf
	prPzM2QAWMVDdCq7klvPUhMha9iwfJFhabM/xC+nycrEoPCFQTC+UTf2
X-Gm-Gg: AeBDiesFWcbgHo/dTvLdKscQqgRMd2jeK6eCicA80pRuwH3CNU1Eh+XrooqNRYvsUld
	OlcKqqyj6G8bmPv3/7z2ZlS+6H5QD/BZy+4Fuoj3P3ACgeMIoF9iIOnWQSvpwkD7pkvKVEd0mkr
	bmOEjn80/PCw8SEX+ndacEsQQpFWmZSq+FPOSgmCLfvmdbshoClXoM8Yk9I1ZcZIZl6jugnBKGW
	+PHnJifETmAmOLn/2vc6zIp2AQ+Tbe5O26FhbdRRbZJ1gN5I0FBepwZWPPqy7QyaJsRPkHDHFUd
	X6vOzzvIlUdEcHJ1/mrHMOQwr1ci7iAyUzgS9CQCvaFnP35ft4doajHHK+hkj5yBfuqyolH6y7w
	Wl/yogCvaXJJ/bFv14YR4KiYNEEcZwJoyDKd1bV7cZzeFQLZq6hlO1/VxH1Zr0fE8uBUPuAfUOv
	oS4tIZR47ZvGpxpK/MbmThGl1dICK5gHCOJPZ4toJToazuwOULpAM+L8lVTTReVqzOzRK+p+sFv
	oufGpss02DG4lE1/5McrlHpn36b
X-Received: by 2002:a5d:50c8:0:b0:44b:cd2f:a3c8 with SMTP id ffacd0b85a97d-44bcd2fa400mr16334421f8f.4.1777997914315;
        Tue, 05 May 2026 09:18:34 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960aa2sm5411552f8f.29.2026.05.05.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:33 -0700 (PDT)
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
 Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for
 video engine
Date: Tue, 05 May 2026 18:18:31 +0200
Message-ID: <0QgbHBOXTsqa8Ms4s4GfYg@gmail.com>
In-Reply-To: <20260505134812.408316-6-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:09 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The SRAM C region contains a partial alias to the VE SRAM already
> referenced by the video engine. To avoid access through this alias
> window, the region should also be claimed by the video engine.
>=20
> Add a reference to the SRAM C region to the video engine node.
>=20
> Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


