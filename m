Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1D12BE7A7
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786123430; cv=none; b=O+tmnj/dmmO4hGY7WMBUUU8PEJxGCDDhlsLCBkwU0++a2IR/zH9dJ2Ww8HRTJe3OfVoWS1t3/gbOTT0hTuMYpduGUlTi5bnO6y2ZnCC/o10jcfmE0xK/27FK9eD2HcPy4vbpya8IdF++6Xgszi3QTbol9pMxGN73vrQCfLImQq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786123430; c=relaxed/simple;
	bh=b5+6s7cRaD+WPG+s4777S00qOcnE9y5+EtT1GZhZ2W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDEsYMJVcwjrB4qP0hgdA4nDIuj61H9/htA/EHVfFQxVAnQoOLCbPYfehis05m1IJfMLP4XJ4e7kbyr6B4+RyqOycqsP9l2aGQg9vGXnTKFN4YLonsi2/iXDBnzRhOKC3YL22Mo3DipzKjWfe9RGuPVqiRTY57o/tgetESLYENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWo8BwuN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWo8BwuN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A751F000E9
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786123428;
	bh=b5+6s7cRaD+WPG+s4777S00qOcnE9y5+EtT1GZhZ2W0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fWo8BwuNcmOGAUWFQLkWMWs5FyFp/Bw7kBHQPomavEjqezdgKmwOzWu+ZfGhVbLEh
	 GqbJmxzMzrdfDLA6EmLFaiICOTVZ9DQnkwzZILiAO6yZTLqF71dwiPmCjlnATbnyfT
	 tyZc5WxF3GnhG661H9bBufjr9/+N539IQsP5RjCEexLH1pEUy0Mgf3MRLJk4bsdv/p
	 1fblhJV07mhSrLh0zQfuLou/F8Gs+JlQ8Rls8fxhoGlwu8OctUVaRV/3L0drArtkz+
	 4rTJdZJVGyuzUnGOEfuHfIrc9p43UYxa2NBNzSBYFMWbYWoFIwjzGa+RO+WVJxtxZf
	 W7YqGcistO2bw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so29813511fa.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:23:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp23fV6Mangq4hBscJZNJ7KRKaEcGUCKYWhOGji0Kb7H12Z/DCK3NnPVj2WP+u7h9gKmfz23moa82KL@vger.kernel.org
X-Gm-Message-State: AOJu0YyMOBbg/91meRwz2G/SyUr4bThY5SC9S2q9dRl6kxLMcGcCMx/0
	96vTXIfvR7zXobEBUCec99ypIkcQbdZYLamHtFWJQbmOY3W/tgTAg3CxlqeciIdb+yEB4ywwFbi
	j0Mje4sRWlBb1ZSWMqVQEHBm56zC308o=
X-Received: by 2002:a05:651c:2122:b0:39b:119d:aa02 with SMTP id
 38308e7fff4ca-39fbae0b8f8mr29204031fa.5.1786123427162; Fri, 07 Aug 2026
 10:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-rtc_s35390a_int1-v3-0-e836faba3e25@posteo.de> <20260805-rtc_s35390a_int1-v3-1-e836faba3e25@posteo.de>
In-Reply-To: <20260805-rtc_s35390a_int1-v3-1-e836faba3e25@posteo.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 19:23:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbp5v5oy9oas3q=nDEvdvmPZpX71eHwEUgSKkn4bfCkQ@mail.gmail.com>
X-Gm-Features: AUfX_mwxc-wD_DVhl85t0-cdNZC5rlPz-YW3X4nrBUoCVUhyUW7RnE0ImXvu-o0
Message-ID: <CAD++jLmbp5v5oy9oas3q=nDEvdvmPZpX71eHwEUgSKkn4bfCkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: rtc: Add pinctrl for S35390A
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Langer <michael.brainbug.langer@googlemail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 9:32=E2=80=AFPM Markus Probst <markus.probst@posteo.=
de> wrote:

> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
>
> Move devicetree bindings for sii,s35390a into its own file.
> Add necessary properties to configure the individual pins via pinctrl,
> which allows the interrupt signal 1 to be used for wakeup alarm.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

This is a bit unexpected but I really like how this looks
and how it is using pin control!

Yours,
Linus Walleij
