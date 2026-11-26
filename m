Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685515;
	b=OOZmoC9rFzRDOnbYEtr5DKo33hhMJaCRA5KYPDcp3VRJ46dVkTi7W9GDlqNjjfzq1Mtd
	 8OEcHaIyLKlNm1koGEbtcIXhXZjW2B6DcLqFfRXCpuTuQDLzfW3U9e8Hy3pZN0tBDOYil
	 Qz2+hhLtU+NY0Oh+Axr2cSnn4t/dzkRw6MvJJ77CBSGyFke47Ld/4ROADrfO/XA9eeW6e
	 EWdLwYToQkqjMOAdDoqROBfuCK7C+uC1bVFos8GGoAvNGfuEZ/bsFx7CgBYXkLXE0RIwu
	 JdeDfJuBfwui2aedbQp90/0E6RiqbAbUpXgfMfJ/lBxGkuBRIPrErPZ7m6pLH1JVe4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685515;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=rcwwWM9GvLxFO7wEnKRfsxkMdjfGY6YIxp0vHgYizdU=;
	b=ebb8z1sWvSDbwMtmR1nNSKNBSGAAqOdzpMEMndFY2F81lAOQP34RtGpwCv1DVfDRNKE4
	 4oZVXKTS+7j2Tq0GOZIPHVbhGaLqE91JbQ82MdQd7bUxzYJoJ3m18awfqbjOCme4HBuz6
	 G7W0Wj7Xp4bN8D9hbjfz3Vy/ZOAiQtqQTSDgUDH74jz2UvykMOLhfXIgqI+bCrULVbrxF
	 wLtNJG/9tINJ0jPMdaNzjzkVkYswepV7FKK/uLFwfSVZGUG2BTZXm9xWf/m9rYrzTlJ1J
	 zGdtrGQ5T71MnsLHMoO6iG1Dl5MFJAZ0TAqZVUyLDgT/kei3ceOxiVkCVHtg3idAfEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=S1tkk3tt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107B606A326;
	Thu, 26 Nov 2026 09:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4107B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=S1tkk3tt
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C2E45205A6B;
	Thu, 26 Nov 2026 10:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795685507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcwwWM9GvLxFO7wEnKRfsxkMdjfGY6YIxp0vHgYizdU=;
	b=S1tkk3ttVGzY2gbM8EAG3whCKlIDfnd2EZx5p1A1lhb1SJomK9Jf/X3Wv+3QtEq+OcIpS4
	a+MtCwuxrS7zCJCyTAjzySpR1oZ19gEWKNkYCEeSTMWC9Mjomz69FA6uxJccqQ9Uk8eXXH
	mOrF/17T3E3P3yjvDahvtBVOaCEH/RYwqRnZI5YaBLWhvYyC455Ei4xzwwqNj7RWlqHXK3
	z49zwN1VoIUiGfyx8q313nTW7cCd41wq3a0mnptfNZ4eYMYz6DxD3efUwynO+mx9UNe89G
	nn3GO62tCUeRJEzVZjgF26ev+l2cgIDm5tw8omRRlJk2Y0zHY1CPt6Iy/+ToAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795685507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcwwWM9GvLxFO7wEnKRfsxkMdjfGY6YIxp0vHgYizdU=;
	b=Y/nJrvpfejmVlBONfZZTtCRFzYxCciQa5r9/goLWrU916FWAQgbrtBN0zWUs7NBSAlolF6
	csVFv9Adn/m304IUsEBPxBGJlPrBUlFO9ifuD+DuMIQL89C8/pD7/KQc0buHqa6EdUfdRc
	76JVARfgTmmU34Fw8uBi5dk2Ysh88PmgpCX6d6TN21/P/Kz8OcGk393BBbOfgkcu/n9VQM
	Xx63HBrH/b6aSym/AG5GOHpXJ5DtbNBxTW3tQYI1MccjxRGWH+MUEveAlZeSbQqHRa0NTn
	VlMKMVC5OiA6yse60KNKyPpEUl0L+49Xe9/rUPjHqTm/mAez0qWgx/Tg5xFQ6g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795685507; a=rsa-sha256;
	cv=none;
	b=Kp+dpiQ556oLAFF13DfJWsZvxi2zGTi+S7Fxfo5xTvToWdUTNzHHFjGqut0s33VG+9poNy
	Op5uC8o/V+JjcrRSXFvpmQO8/tb8dKXv+FrmGW+cgcmHwTyNqpEKO22GcupDHny+VBZ3db
	TQ8rroo51odwU5aUiYxrO+Gse4qvHVwR6qaGK0Wdk7r+PrXXsDGHHvi4qhK7Mv+S/wnUXd
	BL+wFGO7eBQZHKwpEWJNgpvJkm4fZdJsm1y+32D1yqLbAEn95/DvlwOf4MhMYsoeEO7Td+
	WsYjj0e3jcvKePj3/tjBImpW4+ulb4y78pPBKKTwK4/ji6On+mZNJ2E2YLek/A==
Message-ID: <3b661596c0c46390825c78d74843acf624c1494f.camel@pengutronix.de>
Subject: Re: [PATCH RESEND v2 3/3] arm64: dts: amlogic: a9: Add reset
 controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet	 <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 10:31:47 +0100
In-Reply-To: <20261126-a9-reset-v2-3-e3d850e68725@amlogic.com>
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
	 <20261126-a9-reset-v2-3-e3d850e68725@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-26 at 09:24 +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add reset controller descriptions for the Amlogic A9 SoC and include the
> corresponding reset IDs header.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

This drops Neil's R-b from [1].

[1] https://lore.kernel.org/all/5a42cd49-e884-4a2f-8ffb-017828c556d7@linaro=
.org/

> ---
>  arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h | 247 +++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi    |  14 ++
>  2 files changed, 261 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h b/arch/arm64/=
boot/dts/amlogic/amlogic-a9-reset.h
> new file mode 100644
> index 000000000000..55fcaa54cd56
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h
> @@ -0,0 +1,247 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2026 Amlogic, Inc. All rights reserved.
> + * Author: Zelong Dong <zelong.dong@amlogic.com>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A9_RESET_H
> +#define _DT_BINDINGS_AMLOGIC_MESON_A9_RESET_H

Maybe rename this to not include DT_BINDINGS anymore?

regards
Philipp
