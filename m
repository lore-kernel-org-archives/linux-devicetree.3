Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012774307B4
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559024; cv=none; b=M8YRFFMSvjdp6jtzEww6oBuHhD3I4H2gTEyU9QtGmYF5DUuZYwfAvvkpgK22H4pMg+CIwK0pJhPjtqajKMg4GrffqAXHuzr2ktA9uhpktA7Z87mhrhXWDcDKYhOCXW0wJpwi7+5qtfT+zxaZFF0rBPC9Xpebgt71Ppd/azVfurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559024; c=relaxed/simple;
	bh=KDhSZuVRA/f21JnWZxjeMZ3EJavfTTUKerl/LXgBAnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBiIvRNMaNp92pMlAzTgIeNrbTrnLnNzKwO1nHNGqt6Wz9IcRDbeeYzM5ChKZS7119SseUMJTGPTkv3+UO8Q54zB9DiA+VnbIyIffhDBomklgMUhYEe/KAqSRw40mo2kwTck8o49fe9eR4Vcre52VX1A3E3YyP7OeuRLv/84/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9lKK2tf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9lKK2tf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42341F00A3F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559022;
	bh=+2oMzD2E16CcM0xKyKjF9R7bzdPY8Ncpubthax45Gl0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=W9lKK2tfeCQwzch7hdQuUu6CEcxtCWDoaqQbU485+ca6Bh5yLhC1euPgabOHn6Q9p
	 MApbx79B/9BrLDG1cFgywsE3Enhf1sn8JBm7k412G0V1LM3kyYdRg4m3/ELXhy30CQ
	 TPiGEWqzEHLq9g+Ak1eWJxXe+CITFE1QUnWzk3hxOSogFDO6zL+jl7DBqQxinvwz1J
	 lMpbBwoJHE+MySegmgiMwwAnKDHYeuHU4jABMT+QSx8uCEIBUzBbIPwcrot0ZVqzmB
	 l5dSuTVaHkA8sfNVM5CWdSfgkKbv7je6lB7AOgWtv6LWddgB1lL8F+JbExaW7Ehvad
	 TjkZVjlKJnTnw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39d4c864bfbso74785711fa.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:50:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8qmxm3z8wLafBcd/QzuUgJcSc6B6dShvGTZqmSLSVLCNZZzkPkY+s/TDuqB4QQTxxbPCX8KSoehpG@vger.kernel.org
X-Gm-Message-State: AOJu0YytSW3KY1y5ldcukd64d+BaUha99It53snbdlYtYpItqWqjuuua
	hvfuAYl5UKQA4rNfqq+NDlzgP641yQX5Xi43ucJPAR+D2hmEie/7ur1uBlVpj393bQlVYSLINTa
	bCAXIB7wR1vx0Krc+25aIjCAEUrv5Tao=
X-Received: by 2002:a05:651c:1504:b0:396:a1ec:7f5c with SMTP id
 38308e7fff4ca-39eb285c8f2mr28903771fa.25.1784559021214; Mon, 20 Jul 2026
 07:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com> <20260720-axp318-regulator-v5-1-a1afa7ee24f9@baylibre.com>
In-Reply-To: <20260720-axp318-regulator-v5-1-a1afa7ee24f9@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 20 Jul 2026 22:50:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ffJeKNycCLwVBCDStewVTKTJhnmpMSkwaF2GFT3nmCA@mail.gmail.com>
X-Gm-Features: AUfX_mwFuaLdIJYzbDfXb-WbL0j2t6SPkbldQ9fRBD4BPK0U2Ha8j_irLpavwzA
Message-ID: <CAGb2v67ffJeKNycCLwVBCDStewVTKTJhnmpMSkwaF2GFT3nmCA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mfd: axp20x: Constify axp313 and axp717 cells
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 7:20=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> mfd_cells array should generally be const and there does not seem to be
> anything against it for the axp313 and axp717.
>
> Constify the mfd_cells array for the axp313 and axp717 to be consitent

                                                               ^ consistent

> with the other supported chips
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
