Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4176B344DB9
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722613; cv=none; b=VZ+51BlXI6Tyii47gEl/IslcRZID5wS6yI2JWcVNyygwwdFs1fr4Zr1n0GUA5unq1sXy7Gd8iOOpK7AKX+KJ2fQNHzC4K3zJSYV6UMTX6JLhpUfc2dMF0rMxZ9tCfZmlX8Agr5+TCX8uTYJ/4ppvoIDxublda3uWNYHGTJQc1XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722613; c=relaxed/simple;
	bh=YKRmnKoUZdujh1ZFPcRmdh1NlhxnOtxBwvlrCg3/aus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=He48+38rjIh/4VngOX0uNpPUM/8rV8WEqEDCUmHXKt2WZeydpIxMhzxLX5J6G72Cf5gvagOXDEZiPqOudzwQIIEum9P28AB+Ns3VRFbpeWRmAQ9GfBWRMDrrB1IJ8wvUBEfed8hGbRXVe5dLoMZuGql2ZjMT+8qF8ZW/Qqke5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGowhJCv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGowhJCv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772B11F000FF;
	Tue, 29 Sep 2026 22:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722611;
	bh=/zATtPKrTiMibB6zdsaFLwEdMTlw87tv96EFgHKY/NQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NGowhJCvRMsChWEOUAPX7ebxhyH+hfed0bz3uwrFW6lHh3eiasaVNXjXX+qndnRJB
	 adDWe7Y9+E6wsO/jf+7DNRhyUTi3EZsNMWSLy09iFA6sNueiUwA1WXV9a2euO9OjCb
	 y+qXKu0EQaDe2tnql7Ou4YFUCVGFRaKRfWM8PDGtMi1q2t85Zu1XrPp1Ynl1PcBOsv
	 k0GWSinEzr0v7IdO8Bf/5sbsGE0dKM1PvM3B3HBlzOO5nlcqSKTQCWuhtVVNKiOHBu
	 oS+sdwMSxOGWTgYxkSbKXtfYkLsT/0qlcKUZNAv4FeikrHInAuNHk9ZX+n1guW7Ta4
	 sT6MXv/DYqEpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 22/23] media: i2c: remove MAX96714 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930-gmsl2-3_serdes-v18-22-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
 <20260930-gmsl2-3_serdes-v18-22-43117818f499@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:56:51 +0000
Message-Id: <20260929225651.772B11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] MAINTAINERS: outdated section title and unmerged entry for MAX96714
--

commit 472305e6d4c4846f568486ed29fb99b1f040fa31
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: remove MAX96714 driver

Removes the MAX96714 driver as its functionality has been moved to the
MAX9296A driver which makes use of the Maxim GMSL2/3 serializer framework.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0db318ded5fb6..1b07a808570ad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16291,7 +16291,6 @@ M:	Julien Massot <julien.massot@collabora.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
> -F:	drivers/media/i2c/max96714.c

[Severity: Low]
This isn't a bug, but with the removal of the driver file, this maintainer
section title is no longer fully accurate.

Since it only covers the device tree bindings now, would it make sense to
rename the section title, or perhaps merge this entry into the new GMSL2/3
framework section?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-gmsl2-3_se=
rdes-v18-0-43117818f499@analog.com?part=3D22
