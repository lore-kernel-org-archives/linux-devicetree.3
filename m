Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4F23815E3
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633295; cv=none; b=QdvudLp3ml5Ke3v/yPnvbJ2HV1PN5MUsg2HeUdt8ILaR0d/FMYYpzBcDZ8tIWUPiYB/OHlfMJM7vElEJBnh/0IbcukOn9lc+XffteB7JYkLMNHmGLgKLw8fQK3JvtFg2TMC4AKER1NRJ3UPJQ+yRnyJScaKwJTqjs5MCF1iRit8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633295; c=relaxed/simple;
	bh=Nw2sk7Q/8E3OPh452L0/yYYa8JTilVd+ogYqqiYq0Jw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDhhi9k356WDWgNC8au9PpeggrABE4srKLpcxSgy8iH3nMa98ccy0tTaKUFu4NCEtDGGjL40TVBsqzSbHNjAxaVvFp5UnIUmUKACbRvA+ZSWHi54rvqFyGgKvJ9IQy/pRNG4uiOLK/l+KxeVbntynPQ0e7HxqmFfkFR8q+wOybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jb/M7KbJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jb/M7KbJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B0FC2BCB1
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775633294;
	bh=Nw2sk7Q/8E3OPh452L0/yYYa8JTilVd+ogYqqiYq0Jw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jb/M7KbJrHNmO/tvpkrm33X6mgjuE8dRuYOuvR2qVgn3gjPyyw8huPqxoMpGld33/
	 fw3tbQ2nB5xmBn5aKwW0jjQdlwYNgOamZw7POVAubtIPxMEJwRpEVmi3jMaTEEdcWt
	 4K4RE0dAsYAltsP4Mxp+ncIAnR29+ePtmfN/bXmC9wA/eD4iAV6PzuJ8/IrxQqQ0fV
	 1XwSy0k3sgq5uxzmSEvRbzjMCT0UpBgZm/+1tHFjO/9x7sVX+XAQwwHQBqYCqWlHn0
	 jZMjSentcvn+Nj8NDLdK7SxQSjXbQE5JJSo7vHk9JzVLZrEJucevlD/I94qK3/uqaX
	 FaC+VConRml/Q==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38cd00b3b12so50794591fa.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 00:28:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtSzAsoEOvwQUj948QSeHTMxPRkIOMiHk0ohPUvkg/wat9WIrCTodB2OhusToy769Hhi4U/P07O1rN@vger.kernel.org
X-Gm-Message-State: AOJu0YzjInbmM9PpLamkf3oTMpPkc4//DPEC5/WBJgYHOvu7qaM2099V
	H/KdcYoLyeD0hv0tu8I4z4bjJ7mC+xohh5vv/YviEKkFfbjROVlNC7bZ3jE9YufmyFDEKv1XHbQ
	6/1B2+6XtzN2iUNX5ZYCfduz1zAXRYUeBe/x8K9YJXA==
X-Received: by 2002:a05:651c:3243:b0:38e:21bb:b2ad with SMTP id
 38308e7fff4ca-38e21bbb6d6mr9408481fa.2.1775633293381; Wed, 08 Apr 2026
 00:28:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 00:28:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 00:28:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260408025243.1155482-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com> <20260408025243.1155482-5-eleanor.lin@realtek.com>
Date: Wed, 8 Apr 2026 00:28:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+7aYyXFXjZBrenWnD8bgtyjHVWxK9GxA_U9tkrjih+Q@mail.gmail.com>
X-Gm-Features: AQROBzC0LREM6_b2VQH2egdCf2epMV8TXGX3wPxZfvA_VFti5llCq9nyDHkaPQM
Message-ID: <CAMRc=Me+7aYyXFXjZBrenWnD8bgtyjHVWxK9GxA_U9tkrjih+Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: realtek: Add GPIO support for RTD1625
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com, linusw@kernel.org, 
	brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, tychang@realtek.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 04:52:43 +0200, Yu-Chun Lin <eleanor.lin@realtek.com> said:
> Add the GPIO node for the Realtek RTD1625 SoC.
>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
