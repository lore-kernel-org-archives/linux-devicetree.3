Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717D367B71
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338380; cv=none; b=rXY40D4Kabp3eKQy3YZiSOuCBWh+G72lyj8nKdZE/2Lay8oDqlc/AYWNSIJFrPcb+rNQOTiRVJerUmYGtaJOhiQxs+r7NiHKWuoTf1r3AqrasrJA2KhO9BlC9slkweW9zHL9HCA+u0OeKXNoriLRvgR1/I1NCEuXCokGYtbjgBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338380; c=relaxed/simple;
	bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WcsSKb7u52JIJr7Sc+t/bvJVj+rtDSA3+OyKtsjJ9xVhVk7mTxnNuej7Yvh6PoeyIdPq+2thMPv6vPpCgSl2ysw103hvizpzZV0YgMLEKjdVcFstV9vg3ourPxBBpZFFdJR9az6DTLHJPf5uMlbbqxtfPFRpbefae2RhJK1TI1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAoFvKVr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAoFvKVr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so10234985e9.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338376; x=1781943176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=;
        b=SAoFvKVrAPS5pH5h0ZFLSCLmSwG3YVuEo7AaEAlGjFjYkwutikYepsKrjR5SaDoWOc
         lbaQhNP+vsn1ZF779xqg0fWzWE//jtDt/h+JqEdJRQ1IqI/uQ6KLeeM7znpwDVOv3PqF
         kT+NyqubT/OF+8B8DmmCAwpZXgWpyIU8uSliUj8ccqbkw0VqlYkasucF+L/Mib/ttIPr
         e8QJ/dRWYv3jv51tp3DdHyUoh4n1E2MI+03KuSmXIXELgxMidRPbcG1T7VqhamlJYMKA
         ONygYnXihGL8EHIWhKuz304AnGotSvNQoszCmkPsyQ7HlaosbtKsd3sjfFuyBBCiasYt
         IjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338376; x=1781943176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=;
        b=GTd4cvpqvmluNo+QRJ9vRR3ulpmvs0zpU4Kr6MDwavJPP9R3QqucB6IGvX3zqa+Afo
         1XNxm9bKj/j0a6adUWwW4KRG7IBRmL247BTmuSvsBYe1vOY95vYAEhQ1qsEHYTh8E0Me
         qRefIoqPgcMBh3hKyyD166x4s3K5/rNISyJIkKUQKo2xn1u7RtzT9z4T71wUoIPAE4iG
         EFImRVahh5s/2VhgRXa7P/pv6ZtFilvQxHiNu1BWK81DCjte0azrMEFbXD1p2Kx6NQZW
         BJRfkcMtlnj9hPyDKCplIPAh3DZoU90ca7a62ygdEbMEORB7Ygy5ir69nZuOtzHXdxFd
         cI0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/AQr0v1kaMoDfCl2bLNckqoZ4E23DGtAMp+7vYkM+HUsEopVHWszWv8yFD2X3mDDc3TdQMCLQwKoGZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3tFc5U8AzFlUfKkrKBzc1RJSuOWUpZvBaQSm2CCA4AcKn9PEA
	m4r5OfswBOMqJxgWaGjHylPJtzryw0ZTPZpHqcGfJmNmBnC8xuW5Io8O
X-Gm-Gg: Acq92OFC2cw2N5flkZaf6gMaYOQy86pcXyqaAWWk7J9ouBdIsz91Ol5pkOSkoVolaoq
	r4CnDzCL/TZE51FmeF6/hzbY1bhjc8K+GuqT69VdKK+GOU92FNThWjqoEvf6omcE0+nKXetZsAB
	BErLF3BcXNAOWwKRCtvOeNm2C3ztRCwRbAQY/DKJ8lF+QCdt8egVLTxPbmlFwR/uvDZcOG+3S6a
	x/ZPYPirY+q9LfuAm2uZTDEiyGwtBtktN23+wtd21mfmuQwghlI3lvAntl2rMuGndCqoruDqupP
	dyS8oqgWW+ncXOFxssWihJ2Bf97EaJDqW/boRGIl/Q75rcLF4HKllRsaXtSNmJoIF1z70Z9FdaJ
	gC+vkm0xaZQ0gbTjVEDjRHLYWWUF49j286WE18hg8qV9WspHJBfS7Hks2X9CKGox7j4V6pXaus2
	Du9oYDtPJfTPkHL1uYS/g7eAvOmTITMHAjE4UJbChJmfuH
X-Received: by 2002:a05:600c:8b31:b0:490:e5c1:b8c6 with SMTP id 5b1f17b1804b1-490ec4b58ffmr75929755e9.8.1781338376446;
        Sat, 13 Jun 2026 01:12:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b39e9sm88333215e9.0.2026.06.13.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:12:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject:
 Re: [PATCH v4 1/7] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Sat, 13 Jun 2026 10:12:54 +0200
Message-ID: <sIT7xrHETBux3nDrv9ggVw@gmail.com>
In-Reply-To: <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
References:
 <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 5. junij 2026 ob 09:09:15 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> Enable Allwinner LRADC input driver as module to support buttons on Baijie
> HelperBoard A133.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec


