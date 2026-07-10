Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1E33EB115
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678112; cv=pass; b=DwUFhbUbE79ni3CTTORm89ODIIp6fCYuMOIz6/fh7GXja94yU8J4PPUHJcADbLQAMY5oUdZllhKGeYhI0hNoiR6k+sOUYv7SMyGK06zbVDHEwsmz0LFsh0ZbCvEmRe98995pURi70rrRv2OshgBiMcQHwR0HUeUvdz6dERzUV5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678112; c=relaxed/simple;
	bh=pRM2rNgd9MBRVIU9n/6jP1Ntus4fUi+4/1OzQi5Hjs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfQJOW5lYfz4s0w8fzxcrDbq4tp6f1bpczX0khcGQC3q2BV2fPhAForM311DHbsnvKwGa+rQW4NsWjzQIPKVYJ4cP8FCvbUIvBpm1bYLSOMOzEcBGOpbM4qh3bN1WtEI7ejLQWwu1I7hjrXlyzqhgAKZOGdLKpK/yFmF2hQhdKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItQXTRZb; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItQXTRZb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so1012947a12.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783678109; cv=none;
        d=google.com; s=arc-20260327;
        b=JMZNWMu0DHXWVQZCqixwlvtggrH5tCje+gGm3nLAEk9xOQSFgNzczlV4fLVqQ6wMUP
         ndvtdNkpYjHqtvFef1b+x1KNLAH+2rg1MWoL+kea6vq8P9JkgP7lk/CCfIgU0tuvnA5R
         8laKR7CKlajITuXqO3Cozj2sKAmcX/cd2W4JqfQIJD5yr9VWmOI3RqE0Jrz7ynvwL3bR
         7fwp1iBndT27pufLjKZ07dxAYK2Is5dF6cZ1rBQ9DbYPdz9b+Mc3AxRLgPbjhYsza+D1
         AJI4n+Vi+U3i8CI24F2YvTNam0MNbQ/v2sGTEsPO2QxUaa5bP8adZ/q8KpTIfx4xX6pZ
         Gcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        fh=ReDYTdAKbniAzURosj6QyFNbFlqyRTjmXZhF38raAEA=;
        b=GTrOuiMR7XLaZyfDNjTCNNeasyEGQGacTUq/oSLPmdbR4zqMJ1egkoJu61iTJuE+23
         2x3tpSagX1MXMwR/o/5pnsQkDjKoewqnjjngn/0CPqNltVmMudFMJZK98KoAmpP88HUj
         406VD55UqLilmWjUNf/KOiuxzyPmdjfNWrYMm57AhvizJvo3B+WHUC/qTsjUxUV8jxAo
         aJztf0QQwVoUWD54uA+Tjz6vAwJ+nOvTAJJwdIyu5Q99ddF7MgZJ06LR2/9mtS3sBqBE
         o9X+VxtW7tW3wfakLS6k2cwvDlcT5zwZoU7HWoLQNNFJ1gb/xG+LkHD1tidQGqmqiukS
         nZ7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783678109; x=1784282909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        b=ItQXTRZbsEq+Y4Iv2yFAOj62T9Cq1YaKqMlbce2lP6q7WO3e0YiRDdP+KePeMwhqMO
         +fEvbYmMeh09kOTWtVdRc9se4h62qM0u+PzZRRqT/Ei/I+swGGpPVa+0Ji/UQFQ8AYMA
         Gd3sG8rukUgnIWYfb1TmukZ2Mbt2wMzU6LC8xn4U3IcqOFe8wY9dlvuV2vJKjnikz3rS
         wh+f4jaZRo4IbgQtWJsLJG/HccqwDY4SAB+GUuL0SOD8z07LxFocdKDs41qwePIf58eb
         ZUEcfPN4uaM/nSn0eebe1ZJyo5sG0K+m4gd9Amam7qXr+wm1yJlZNrGug7gZsyjPLKH7
         Iuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678109; x=1784282909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        b=PLeDD5GvRS60MCjVIHUYZcAIjLWSEAUIWtqAJ5A/ox1gVKau2C2dRBfFYeIvIn6aII
         3XrEpscRaNTF/OybWIk94FELkz/CRJyuWQhBWfu1HMRH34NsbekicSWMCGl9ZoymjSI4
         Sbo0Rpo/c2cIK+pJo1DJ3yF4xOck3+ADpryIGlnaQ80/AzGBLOkeSibZk0ErlsIDXTRL
         ehfAPfuiNdrQS8clemdRkt4UgCGkhwmwjTHJ5dPBeNsUEvbcMjnj+thqxayWN1hFKjKQ
         u25jX5sUVvBrKbXxwlhlLwXzBW6EhHZrrqqGfQTmGj0xwVTOkq8ShEOjXgQk49fg2kyz
         hMTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJnFvcqFiO76ydPSItTueNWQuVK/MOyobVSb2fxPeNXMZCX/BnzG9KVFxcPs4rb4G7WIEUCvpbD42Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLjeEkct11fI4dcxSgVzbtF3PVFCMXKO37T9UKA7GpioTuz+e
	0hjPsW2D3UxjcGglQBaQhvWoEMhxhIZLK3KLzEz8oM9DctguOPgconQSlCQYF5lb/cCTvK/OqG2
	ROZHgAGSUwtjttDXGiMSvfGhArLHQP6HUilutf/MKfA==
X-Gm-Gg: AfdE7cm9X4OfIn6uyXBh6/wEsyUTHf0VLj2sUvXJ6xUVbOsl+LGgJnCoywSYbvtZ+jP
	qmBQFW2nyj5dpapRxGBjHAZEIaggMJtkYudvkyxTCGeZDBEz5Unwjrv/XibBWouEgNOazfVgt2P
	bON9bukeGUiq5aW1T08NApoIft80eslBCDXQRxJHFgqYUfAACMyW0hkHnXDCzy4N6+ACIjsUyN6
	2+LVs+WOx14Pe3kTyGqpwU9vuTiYMUXnwf5zrnw8ZyNvw1uq/UGc0EAvaFzBOI87ncXw0FFR3fk
	dvLREM/57AqBwdMD8gcZctPUL9vjx48=
X-Received: by 2002:a05:6402:1f0d:b0:698:52b4:c2c9 with SMTP id
 4fb4d7f45d1cf-69ab449f56bmr3763583a12.31.1783678109402; Fri, 10 Jul 2026
 03:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-6-alim.akhtar@samsung.com>
 <CADrjBPqYSTDExrBrYYf2z=23Ci8VqF9zXvbc+njDm1d4Ojrjrg@mail.gmail.com>
 <14cf01dd1052$4de88670$e9b99350$@samsung.com> <9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
In-Reply-To: <9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 10 Jul 2026 11:08:17 +0100
X-Gm-Features: AUfX_mw_MQovWgLm-SNbZiYq6L-o37seq6gSN5GX96bbQr3I8gkT7hwklMnJXyA
Message-ID: <CADrjBPp54oxAfJ9i7VTqCVuCJLq3X5mZPh9wMOMgoa-N1e1Ghw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, robh@kernel.org, conor+dt@kernel.org, 
	linusw@kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof,

On Fri, 10 Jul 2026 at 11:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 10/07/2026 11:55, Alim Akhtar wrote:
> >>> ---
> >>>  arch/arm64/boot/dts/exynos/Makefile           |   1 +
> >>>  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 574 ++++++++++++++++++
> >>>  .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  32 +
> >>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 204 +++++++
> >>>  4 files changed, 811 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
> >>> +       };
> > [snip]
> >>> +
> >>> +       oscclk: clock-oscclk {
> >>> +               compatible = "fixed-clock";
> >>> +               clock-output-names = "oscclk";
> >>> +               #clock-cells = <0>;
> >>> +       };
> >>
> >> Small nit, but I believe oscclk node should be ordered alpha-numerically by the
> >> node name. See https://docs.kernel.org/devicetree/bindings/dts-coding-
> >> style.html
> >>
> > Thanks, will update in v4
>
>
> The node feels ordered, no? clock before cpu?

Yes, good point. I was looking at the label not the node name.

Peter
