Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5B3F8247
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423991; cv=none; b=bl0I1huafsNOdvP8VlwTArT8tbh+vSp/qtdWLcLxtJnCeopZmCoqjja4e0kfjC7XYBDWYNUkAowixQeDNcePYiwiHjvPnX7h+9H2GA+4Utvi4uisFbnhvIQmXBHWdfr0w/bAcZsykmvumUMw7Oy6PwgX1F+0J4xGQ5EvIk/cED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423991; c=relaxed/simple;
	bh=XXSAv8CDLC977jDv4wpsIukoXkHLxJ2vpuTbsDwobOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RBWP4rrTFbtJictIHtHZ5Xl4QOyEgWIeeeLS7VUvH1KBOZ2O95z+z7Z7pm4KoQLqETKBQVegR9rNy9qiK84tYY1H6O4VzHtKmxi+uM9LXlglkKGBUXB6jGDUkpsZ+u4377Zv44Yx/Hxwf9XfB7cMqRaBNAz/ADyK/MSWhCRSbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPc6XOny; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPc6XOny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA43D1F000E9;
	Tue,  7 Jul 2026 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783423990;
	bh=9Xo/YT93tezsgzijNZrroHoH7Ut/890ixShMERfO3f4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YPc6XOny5ZhbazG3aq1QCudyMhQTgELq2eFM5Ijw76msm+Prmu5tBSZ7eFZOxqF4M
	 Vl23z9/W7cx8CbZva4YLzJs+kdP9QrZjnFxaPj58AxkLS7U0D/zYwRanMZEXTDGyZz
	 Lpg6s8BOFdgfQkzO1CtJLX8+19RIV68/HXqfsjlMbgzX92nKKqpNt/R5gPdONy4J3s
	 xLyJSw9F4TUbUek6AYQdtca07+auosKWULqouZTIDxz65uNzf6MQJEY7uCz6PKBG3P
	 g0JMwPWg+kWlxIG0/wunmZ5klbRuG5wk4ZoOK8KDFXA3rK6jXlJF9MXZd33mvIeIi8
	 3kNd3y507A4Kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: iio: health: add adi,max86150
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707112714.2261727-2-shofiqtest@gmail.com>
References: <20260707112714.2261727-2-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:33:09 +0000
Message-Id: <20260707113309.EA43D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new MAINTAINERS section 'MAX86150 ECG AND PPG BIOSENSOR DRIVER'=
 is placed out of alphabetical order.
--

--- Patch [1]: [PATCH v9 1/2] dt-bindings: iio: health: add adi,max86150 ---
commit 5abdccc1a1cc20780d9daca161bb926907771020
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

dt-bindings: iio: health: add adi,max86150

This commit adds the Device Tree binding schema for the Analog Devices
MAX86150 integrated ECG and PPG biosensor. It also adds a corresponding
entry to the MAINTAINERS file.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa163..436c86d6e5dfa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
[ ... ]
> @@ -14848,6 +14848,12 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/power/supply/maxim,max77976.yaml
>  F:	drivers/power/supply/max77976_charger.c
> =20
> +MAX86150 ECG AND PPG BIOSENSOR DRIVER
> +M:	Md Shofiqul Islam <shofiqtest@gmail.com>

[Severity: Low]
This isn't a bug, but is this new MAINTAINERS section placed out of
alphabetical order?

MAX86150 is inserted between MAXIM MAX77976 and MAXIM MUIC, but MAX8
should sort before MAXI in the file.

> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
> +
>  MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707112714.2261=
727-1-shofiqtest@gmail.com?part=3D1
